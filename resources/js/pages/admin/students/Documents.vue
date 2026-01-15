<script setup lang="ts">
import { Alert, AlertDescription, AlertTitle } from '@/components/ui/alert';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogFooter,
    DialogHeader,
    DialogTitle,
} from '@/components/ui/dialog';
import { Label } from '@/components/ui/label';
import { Textarea } from '@/components/ui/textarea';
import { formatDate } from '@/composables/useFormat';
import AppLayout from '@/layouts/AppLayout.vue';
import type {
    DocumentVerification,
    Registration,
    StudentBiodata,
} from '@/types/pmb';
import { Head, Link, router, usePage } from '@inertiajs/vue3';
import {
    AlertCircle,
    ArrowLeft,
    Check,
    CheckCircle,
    Eye,
    FileImage,
    FileText,
    XCircle,
} from 'lucide-vue-next';
import { computed, ref } from 'vue';

interface StudentUser {
    id: number;
    hashed_id: string;
    name: string;
    email: string;
    student_biodata:
        | (StudentBiodata & {
              verifications: DocumentVerification[];
          })
        | null;
    registration: Registration | null;
}

interface Props {
    student: StudentUser;
}

const props = defineProps<Props>();
const page = usePage();

const flash = computed(
    () => page.props.flash as { success?: string; error?: string },
);

const processing = ref(false);
const showRejectDialog = ref(false);
const showPreviewDialog = ref(false);
const previewImage = ref('');
const previewTitle = ref('');
const activeDocId = ref<number | null>(null);
const rejectNotes = ref('');

// Track verification statuses for bulk verify
const verificationStatuses = ref<
    Record<
        number,
        { status: 'approved' | 'rejected' | 'pending'; notes: string }
    >
>({});

// Initialize status from existing verifications
const initializeStatuses = () => {
    if (props.student.student_biodata?.verifications) {
        props.student.student_biodata.verifications.forEach((v) => {
            verificationStatuses.value[v.id] = {
                status: v.status as 'approved' | 'rejected' | 'pending',
                notes: v.notes || '',
            };
        });
    }
};
initializeStatuses();

const breadcrumbs = [
    { title: 'Admin Dashboard', href: '/admin/dashboard' },
    { title: 'Calon Mahasiswa', href: '/admin/students' },
    {
        title: props.student.student_biodata?.name || props.student.name,
        href: `/admin/students/${props.student.hashed_id}`,
    },
    { title: 'Verifikasi Dokumen', href: '#' },
];

const documentLabels: Record<string, string> = {
    photo: 'Pas Foto',
    ktp: 'KTP',
    kk: 'Kartu Keluarga',
    certificate: 'Ijazah/SKL',
    biodata: 'Biodata Diri',
};

const getDocumentUrl = (type: string): string | null => {
    const biodata = props.student.student_biodata;
    if (!biodata) return null;

    const urls: Record<string, string | null | undefined> = {
        photo: biodata.photo_url,
        ktp: biodata.ktp_url,
        kk: biodata.kk_url,
        certificate: biodata.certificate_url,
    };
    return urls[type] || null;
};

const getStatusBadge = (status: string) => {
    const map: Record<
        string,
        {
            variant: 'default' | 'secondary' | 'destructive' | 'outline';
            label: string;
            class: string;
        }
    > = {
        pending: {
            variant: 'outline',
            label: 'Pending',
            class: 'text-yellow-600 border-yellow-300',
        },
        approved: {
            variant: 'default',
            label: 'Disetujui',
            class: 'bg-green-600',
        },
        rejected: { variant: 'destructive', label: 'Ditolak', class: '' },
    };
    return map[status] || { variant: 'secondary', label: 'Unknown', class: '' };
};

const openPreview = (url: string, title: string) => {
    previewImage.value = url;
    previewTitle.value = title;
    showPreviewDialog.value = true;
};

const openRejectDialog = (docId: number) => {
    activeDocId.value = docId;
    rejectNotes.value = verificationStatuses.value[docId]?.notes || '';
    showRejectDialog.value = true;
};

const confirmReject = () => {
    if (activeDocId.value) {
        verificationStatuses.value[activeDocId.value] = {
            status: 'rejected',
            notes: rejectNotes.value,
        };
    }
    showRejectDialog.value = false;
    activeDocId.value = null;
    rejectNotes.value = '';
};

const setApproved = (docId: number) => {
    verificationStatuses.value[docId] = {
        status: 'approved',
        notes: '',
    };
};

const submitBulkVerify = () => {
    const verifications = Object.entries(verificationStatuses.value)
        .filter((entry) => {
            const [, v] = entry;
            return v.status !== 'pending';
        })
        .map(([id, v]) => ({
            id: parseInt(id),
            status: v.status,
            notes: v.notes,
        }));

    if (verifications.length === 0) {
        alert('Pilih status verifikasi untuk minimal 1 dokumen');
        return;
    }

    processing.value = true;
    router.post(
        `/admin/students/${props.student.hashed_id}/documents/bulk-verify`,
        { verifications },
        {
            onFinish: () => {
                processing.value = false;
            },
        },
    );
};

const isPdf = (url: string) => {
    return (
        url.toLowerCase().endsWith('.pdf') ||
        url.startsWith('data:application/pdf')
    );
};

const hasChanges = computed(() => {
    return Object.values(verificationStatuses.value).some(
        (v) => v.status !== 'pending',
    );
});
</script>

<template>
    <Head :title="`Verifikasi Dokumen - ${props.student.name}`" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex flex-col gap-6 p-4">
            <!-- Flash Messages -->
            <Alert v-if="flash?.success" class="border-green-500 bg-green-50">
                <CheckCircle class="size-4 text-green-600" />
                <AlertTitle class="text-green-800">Berhasil</AlertTitle>
                <AlertDescription class="text-green-700">{{
                    flash.success
                }}</AlertDescription>
            </Alert>

            <Alert v-if="flash?.error" variant="destructive">
                <AlertCircle class="size-4" />
                <AlertTitle>Error</AlertTitle>
                <AlertDescription>{{ flash.error }}</AlertDescription>
            </Alert>

            <!-- Header -->
            <div class="flex items-center justify-between">
                <div class="flex items-center gap-4">
                    <Button variant="ghost" size="sm" as-child>
                        <Link
                            :href="`/admin/students/${props.student.hashed_id}`"
                        >
                            <ArrowLeft class="mr-2 size-4" />
                            Kembali
                        </Link>
                    </Button>
                    <div>
                        <h1 class="text-2xl font-bold">Verifikasi Dokumen</h1>
                        <p class="text-sm text-gray-500">
                            {{
                                props.student.student_biodata?.name ||
                                props.student.name
                            }}
                        </p>
                    </div>
                </div>
                <Button
                    @click="submitBulkVerify"
                    :disabled="!hasChanges || processing"
                    class="bg-teal-600 hover:bg-teal-700"
                >
                    <Check class="mr-2 size-4" />
                    Simpan Verifikasi
                </Button>
            </div>

            <!-- Documents Grid -->
            <div class="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
                <Card
                    v-for="verification in props.student.student_biodata
                        ?.verifications"
                    :key="verification.id"
                >
                    <CardHeader class="pb-3">
                        <div class="flex items-center justify-between">
                            <CardTitle
                                class="flex items-center gap-2 text-base"
                            >
                                <FileImage class="size-4" />
                                {{
                                    documentLabels[
                                        verification.document_type
                                    ] || verification.document_type
                                }}
                            </CardTitle>
                            <Badge
                                :variant="
                                    getStatusBadge(
                                        verificationStatuses[verification.id]
                                            ?.status || verification.status,
                                    ).variant
                                "
                                :class="
                                    getStatusBadge(
                                        verificationStatuses[verification.id]
                                            ?.status || verification.status,
                                    ).class
                                "
                            >
                                {{
                                    getStatusBadge(
                                        verificationStatuses[verification.id]
                                            ?.status || verification.status,
                                    ).label
                                }}
                            </Badge>
                        </div>
                    </CardHeader>
                    <CardContent class="space-y-4">
                        <!-- Biodata Detail -->
                        <div
                            v-if="verification.document_type === 'biodata'"
                            class="rounded-lg border bg-gray-50 p-4 text-sm"
                        >
                            <div class="grid gap-3">
                                <div>
                                    <span class="text-xs text-gray-500"
                                        >Nama Lengkap</span
                                    >
                                    <p class="font-medium">
                                        {{
                                            props.student.student_biodata?.name
                                        }}
                                    </p>
                                </div>
                                <div class="grid grid-cols-2 gap-2">
                                    <div>
                                        <span class="text-xs text-gray-500"
                                            >NIK</span
                                        >
                                        <p class="font-mono font-medium">
                                            {{
                                                props.student.student_biodata
                                                    ?.nik
                                            }}
                                        </p>
                                    </div>
                                    <div>
                                        <span class="text-xs text-gray-500"
                                            >NISN</span
                                        >
                                        <p class="font-mono font-medium">
                                            {{
                                                props.student.student_biodata
                                                    ?.nisn || '-'
                                            }}
                                        </p>
                                    </div>
                                </div>
                                <div class="grid grid-cols-2 gap-2">
                                    <div>
                                        <span class="text-xs text-gray-500"
                                            >Tempat, Tgl Lahir</span
                                        >
                                        <p class="font-medium">
                                            {{
                                                props.student.student_biodata
                                                    ?.birth_place
                                            }},
                                            {{
                                                formatDate(
                                                    props.student
                                                        .student_biodata
                                                        ?.birth_date,
                                                )
                                            }}
                                        </p>
                                    </div>
                                    <div>
                                        <span class="text-xs text-gray-500"
                                            >Agama</span
                                        >
                                        <p class="font-medium">
                                            {{
                                                props.student.student_biodata
                                                    ?.religion
                                            }}
                                        </p>
                                    </div>
                                </div>
                                <div>
                                    <span class="text-xs text-gray-500"
                                        >Asal Sekolah</span
                                    >
                                    <p class="font-medium">
                                        {{
                                            props.student.student_biodata
                                                ?.school_origin
                                        }}
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!-- Document Preview -->
                        <div
                            v-else-if="
                                getDocumentUrl(verification.document_type)
                            "
                            class="relative aspect-video cursor-pointer overflow-hidden rounded-lg border bg-gray-100"
                            @click="
                                openPreview(
                                    getDocumentUrl(verification.document_type)!,
                                    documentLabels[verification.document_type],
                                )
                            "
                        >
                            <div
                                v-if="
                                    isPdf(
                                        getDocumentUrl(
                                            verification.document_type,
                                        )!,
                                    )
                                "
                                class="flex size-full flex-col items-center justify-center gap-2 bg-gray-50 text-gray-500 transition hover:bg-gray-100"
                            >
                                <FileText class="size-12 text-red-500" />
                                <span class="text-xs font-medium"
                                    >Dokumen PDF</span
                                >
                            </div>
                            <img
                                v-else
                                :src="
                                    getDocumentUrl(verification.document_type)!
                                "
                                :alt="
                                    documentLabels[verification.document_type]
                                "
                                class="size-full object-cover transition hover:scale-105"
                            />
                            <div
                                class="absolute inset-0 flex items-center justify-center bg-black/50 opacity-0 transition hover:opacity-100"
                            >
                                <Eye class="size-8 text-white" />
                            </div>
                        </div>
                        <div
                            v-else
                            class="flex aspect-video items-center justify-center rounded-lg border bg-gray-50"
                        >
                            <p class="text-sm text-gray-400">Tidak ada file</p>
                        </div>

                        <!-- Notes if rejected -->
                        <div
                            v-if="
                                verificationStatuses[verification.id]
                                    ?.status === 'rejected' &&
                                verificationStatuses[verification.id]?.notes
                            "
                            class="rounded-md border border-red-200 bg-red-50 p-2"
                        >
                            <p class="text-xs text-red-600">
                                <strong>Catatan:</strong>
                                {{
                                    verificationStatuses[verification.id].notes
                                }}
                            </p>
                        </div>

                        <!-- Action Buttons -->
                        <div class="flex gap-2">
                            <Button
                                size="sm"
                                variant="outline"
                                class="flex-1 border-green-300 text-green-600 hover:bg-green-50"
                                @click="setApproved(verification.id)"
                                :disabled="
                                    verificationStatuses[verification.id]
                                        ?.status === 'approved'
                                "
                            >
                                <CheckCircle class="mr-1 size-4" />
                                Setuju
                            </Button>
                            <Button
                                size="sm"
                                variant="outline"
                                class="flex-1 border-red-300 text-red-600 hover:bg-red-50"
                                @click="openRejectDialog(verification.id)"
                            >
                                <XCircle class="mr-1 size-4" />
                                Tolak
                            </Button>
                        </div>
                    </CardContent>
                </Card>
            </div>

            <!-- Empty State -->
            <Card v-if="!props.student.student_biodata?.verifications?.length">
                <CardContent class="py-12 text-center">
                    <FileText class="mx-auto size-12 text-gray-300" />
                    <p class="mt-4 text-gray-500">
                        Belum ada dokumen yang perlu diverifikasi
                    </p>
                </CardContent>
            </Card>
        </div>

        <!-- Preview Dialog -->
        <Dialog v-model:open="showPreviewDialog">
            <DialogContent
                class="flex h-[85vh] max-w-4xl min-w-[80vw] flex-col"
            >
                <DialogHeader>
                    <DialogTitle>{{ previewTitle }}</DialogTitle>
                </DialogHeader>
                <div
                    class="mt-2 max-w-full flex-1 overflow-hidden rounded-lg bg-gray-100"
                >
                    <iframe
                        v-if="isPdf(previewImage)"
                        :src="previewImage"
                        class="size-full"
                        frameborder="0"
                    ></iframe>
                    <img
                        v-else
                        :src="previewImage"
                        :alt="previewTitle"
                        class="size-full object-contain"
                    />
                </div>
            </DialogContent>
        </Dialog>

        <!-- Reject Dialog -->
        <Dialog v-model:open="showRejectDialog">
            <DialogContent>
                <DialogHeader>
                    <DialogTitle>Tolak Dokumen</DialogTitle>
                    <DialogDescription>
                        Berikan catatan untuk calon mahasiswa
                    </DialogDescription>
                </DialogHeader>
                <div class="space-y-4 py-4">
                    <div class="space-y-2">
                        <Label>Catatan Penolakan *</Label>
                        <Textarea
                            v-model="rejectNotes"
                            rows="3"
                            placeholder="Contoh: Foto tidak jelas, mohon upload ulang dengan resolusi lebih baik"
                        />
                    </div>
                </div>
                <DialogFooter>
                    <Button variant="outline" @click="showRejectDialog = false"
                        >Batal</Button
                    >
                    <Button
                        variant="destructive"
                        @click="confirmReject"
                        :disabled="!rejectNotes"
                    >
                        Tolak
                    </Button>
                </DialogFooter>
            </DialogContent>
        </Dialog>
    </AppLayout>
</template>
