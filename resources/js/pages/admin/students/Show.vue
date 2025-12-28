<script setup lang="ts">
import { Alert, AlertDescription, AlertTitle } from '@/components/ui/alert';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import {
    Card,
    CardContent,
    CardHeader,
    CardTitle,
} from '@/components/ui/card';
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogFooter,
    DialogHeader,
    DialogTitle,
} from '@/components/ui/dialog';
import { Label } from '@/components/ui/label';
import AppLayout from '@/layouts/AppLayout.vue';
import type { Registration, StudentBiodata } from '@/types/pmb';
import { Head, Link, router, usePage } from '@inertiajs/vue3';
import {
    AlertCircle,
    CheckCircle,
    Eye,
    FileText,
    GraduationCap,
    Pencil,
    Printer,
    User,
    XCircle,
} from 'lucide-vue-next';
import { computed, ref } from 'vue';

interface StudentUser {
    id: number;
    name: string;
    email: string;
    phone: string | null;
    student_biodata: StudentBiodata | null;
    registration: Registration | null;
}

interface Props {
    student: StudentUser;
}

const props = defineProps<Props>();
const page = usePage();

const flash = computed(
    () => page.props.flash as { success?: string; error?: string }
);

const showAcceptDialog = ref(false);
const showRejectDialog = ref(false);
const showPreviewDialog = ref(false);
const previewImage = ref('');
const previewTitle = ref('');
const selectedProdi = ref<number | null>(null);
const acceptNotes = ref('');
const rejectReason = ref('');
const processing = ref(false);

const openPreview = (url: string, title: string) => {
    previewImage.value = url;
    previewTitle.value = title;
    showPreviewDialog.value = true;
};

const breadcrumbs = [
    { title: 'Admin Dashboard', href: '/admin/dashboard' },
    { title: 'Calon Mahasiswa', href: '/admin/students' },
    { title: props.student.student_biodata?.name || props.student.name, href: '#' },
];

const canAcceptReject = computed(() => props.student.registration?.status === 'verified');

const accept = () => {
    if (!selectedProdi.value) return;
    processing.value = true;
    router.post(
        `/admin/students/${props.student.id}/accept`,
        {
            program_studi_id: selectedProdi.value,
            notes: acceptNotes.value,
        },
        {
            onFinish: () => {
                processing.value = false;
                showAcceptDialog.value = false;
            },
        }
    );
};

const reject = () => {
    if (!rejectReason.value) return;
    processing.value = true;
    router.post(
        `/admin/students/${props.student.id}/reject`,
        { reason: rejectReason.value },
        {
            onFinish: () => {
                processing.value = false;
                showRejectDialog.value = false;
            },
        }
    );
};

const getStatusBadge = (status: string | undefined) => {
    const map: Record<string, { variant: 'default' | 'secondary' | 'destructive'; label: string }> = {
        draft: { variant: 'secondary', label: 'Draft' },
        submitted: { variant: 'secondary', label: 'Terdaftar' },
        verified: { variant: 'default', label: 'Terverifikasi' },
        accepted: { variant: 'default', label: 'Diterima' },
        rejected: { variant: 'destructive', label: 'Ditolak' },
    };
    return map[status || ''] || { variant: 'secondary', label: 'Unknown' };
};

const isPdf = (url: string | null) => {
    if (!url) return false;
    return url.toLowerCase().endsWith('.pdf') || url.startsWith('data:application/pdf');
};
</script>

<template>
    <Head :title="props.student.student_biodata?.name || props.student.name" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex flex-col gap-6 p-4">
            <!-- Flash Messages -->
            <Alert v-if="flash?.success" class="border-green-500 bg-green-50">
                <CheckCircle class="size-4 text-green-600" />
                <AlertTitle class="text-green-800">Berhasil</AlertTitle>
                <AlertDescription class="text-green-700">
                    {{ flash.success }}
                </AlertDescription>
            </Alert>

            <Alert v-if="flash?.error" variant="destructive">
                <AlertCircle class="size-4" />
                <AlertTitle>Error</AlertTitle>
                <AlertDescription>{{ flash.error }}</AlertDescription>
            </Alert>

            <!-- Action Buttons -->
            <div class="flex items-center justify-between">
                <h1 class="text-2xl font-bold">
                    {{ props.student.student_biodata?.name || props.student.name }}
                </h1>
                <div class="flex gap-2">
                    <Button variant="outline" as-child>
                        <Link :href="`/admin/students/${props.student.id}/edit`">
                            <Pencil class="mr-2 size-4" />
                            Edit
                        </Link>
                    </Button>
                    <Button
                        v-if="props.student.registration"
                        variant="outline"
                        as-child
                    >
                        <a
                            :href="`/admin/students/${props.student.id}/registration-card`"
                            target="_blank"
                        >
                            <Printer class="mr-2 size-4" />
                            Cetak Kartu
                        </a>
                    </Button>
                    <Button
                        v-if="canAcceptReject"
                        @click="showAcceptDialog = true"
                        class="bg-green-600 hover:bg-green-700"
                    >
                        <CheckCircle class="mr-2 size-4" />
                        Terima
                    </Button>
                    <Button
                        v-if="canAcceptReject"
                        variant="destructive"
                        @click="showRejectDialog = true"
                    >
                        <XCircle class="mr-2 size-4" />
                        Tolak
                    </Button>
                </div>
            </div>

            <div class="grid gap-6 lg:grid-cols-2">
                <!-- Registration Info -->
                <Card>
                    <CardHeader>
                        <CardTitle class="flex items-center gap-2">
                            <GraduationCap class="size-5" />
                            Informasi Pendaftaran
                        </CardTitle>
                    </CardHeader>
                    <CardContent v-if="props.student.registration" class="space-y-4">
                        <div class="grid gap-3 text-sm">
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500">No. Pendaftaran</span>
                                <span class="font-mono font-medium">
                                    {{ props.student.registration.registration_number }}
                                </span>
                            </div>
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500">Status</span>
                                <Badge
                                    :variant="
                                        getStatusBadge(props.student.registration.status).variant
                                    "
                                >
                                    {{ getStatusBadge(props.student.registration.status).label }}
                                </Badge>
                            </div>
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500">Jenis Pendaftaran</span>
                                <span class="font-medium">
                                    {{ props.student.registration.registration_type?.name || '-' }}
                                </span>
                            </div>
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500">Jalur</span>
                                <span class="font-medium">
                                    {{ props.student.registration.registration_path?.name || '-' }}
                                </span>
                            </div>
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500">Periode</span>
                                <span class="font-medium">
                                    {{ props.student.registration.registration_period?.name || '-' }}
                                </span>
                            </div>
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500">Sumber Informasi</span>
                                <div class="text-right">
                                    <span class="block font-medium">
                                        {{ props.student.registration.referral_source || '-' }}
                                    </span>
                                    <span v-if="props.student.registration.referral_detail" class="text-xs text-gray-500">
                                        {{ props.student.registration.referral_detail }}
                                    </span>
                                </div>
                            </div>
                        </div>

                        <!-- Program Studi Choices -->
                        <div class="mt-4 space-y-2">
                            <h4 class="font-medium">Pilihan Program Studi</h4>
                            <div class="rounded-lg border p-3">
                                <p class="text-sm">
                                    <strong>1.</strong>
                                    {{ props.student.registration.program_studi_choice1?.name || '-' }}
                                    <span v-if="props.student.registration.program_studi_choice1?.fakultas" class="text-gray-500">
                                        ({{ props.student.registration.program_studi_choice1.fakultas.name }})
                                    </span>
                                </p>
                                <p v-if="props.student.registration.program_studi_choice2" class="mt-1 text-sm">
                                    <strong>2.</strong>
                                    {{ props.student.registration.program_studi_choice2?.name || '-' }}
                                    <span v-if="props.student.registration.program_studi_choice2?.fakultas" class="text-gray-500">
                                        ({{ props.student.registration.program_studi_choice2.fakultas.name }})
                                    </span>
                                </p>
                                <p v-if="props.student.registration.program_studi_choice3" class="mt-1 text-sm">
                                    <strong>3.</strong>
                                    {{ props.student.registration.program_studi_choice3?.name || '-' }}
                                </p>
                            </div>
                        </div>

                        <!-- Accepted Info -->
                        <div
                            v-if="props.student.registration.status === 'accepted'"
                            class="mt-4 rounded-lg border border-green-200 bg-green-50 p-4"
                        >
                            <p class="font-medium text-green-800">Diterima di:</p>
                            <p class="text-lg font-bold text-green-900">
                                {{ props.student.registration.accepted_program_studi?.name }}
                            </p>
                        </div>

                        <!-- Rejected Info -->
                        <div
                            v-if="props.student.registration.status === 'rejected'"
                            class="mt-4 rounded-lg border border-red-200 bg-red-50 p-4"
                        >
                            <p class="font-medium text-red-800">Alasan Penolakan:</p>
                            <p class="text-red-900">
                                {{ props.student.registration.rejection_reason }}
                            </p>
                        </div>
                    </CardContent>
                    <CardContent v-else>
                        <p class="text-gray-500">Belum mendaftar</p>
                    </CardContent>
                </Card>

                <!-- Biodata -->
                <Card>
                    <CardHeader>
                        <CardTitle class="flex items-center gap-2">
                            <User class="size-5" />
                            Data Pribadi
                        </CardTitle>
                    </CardHeader>
                    <CardContent v-if="props.student.student_biodata" class="space-y-4">
                        <div class="grid gap-3 text-sm">
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500">NIK</span>
                                <span class="font-mono font-medium">
                                    {{ props.student.student_biodata.nik }}
                                </span>
                            </div>
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500">NISN</span>
                                <span class="font-medium">
                                    {{ props.student.student_biodata.nisn || '-' }}
                                </span>
                            </div>
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500">TTL</span>
                                <span class="font-medium">
                                    {{ props.student.student_biodata.birth_place }},
                                    {{ props.student.student_biodata.birth_date }}
                                </span>
                            </div>
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500">Jenis Kelamin</span>
                                <span class="font-medium">
                                    {{ props.student.student_biodata.gender }}
                                </span>
                            </div>
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500">Agama</span>
                                <span class="font-medium">
                                    {{ props.student.student_biodata.religion }}
                                </span>
                            </div>
                            <div class="flex justify-between border-b pb-2">
                                <span class="text-gray-500">Telepon</span>
                                <span class="font-medium">
                                    {{ props.student.student_biodata.phone }}
                                </span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-gray-500">Asal Sekolah</span>
                                <span class="font-medium">
                                    {{ props.student.student_biodata.school_origin }}
                                </span>
                            </div>
                        </div>
                    </CardContent>
                    <CardContent v-else>
                        <p class="text-gray-500">Biodata belum diisi</p>
                    </CardContent>
                </Card>

                <!-- Documents -->
                <Card class="lg:col-span-2">
                    <CardHeader>
                        <div class="flex items-center justify-between">
                            <CardTitle class="flex items-center gap-2">
                                <FileText class="size-5" />
                                Dokumen
                            </CardTitle>
                            <Button variant="outline" size="sm" as-child>
                                <a :href="`/admin/students/${props.student.id}/documents`">
                                    Verifikasi Dokumen
                                </a>
                            </Button>
                        </div>
                    </CardHeader>
                    <CardContent v-if="props.student.student_biodata">
                        <div class="grid gap-4 md:grid-cols-4">
                            <div class="rounded-lg border p-3">
                                <p class="mb-2 text-sm font-medium">Pas Foto</p>
                                <div
                                    v-if="props.student.student_biodata.photo_url"
                                    class="relative cursor-pointer"
                                    @click="openPreview(props.student.student_biodata.photo_url, 'Pas Foto')"
                                >
                                    <img
                                        :src="props.student.student_biodata.photo_url"
                                        class="aspect-square rounded-lg object-cover"
                                    />
                                    <div class="absolute inset-0 flex items-center justify-center rounded-lg bg-black/50 opacity-0 transition hover:opacity-100">
                                        <Eye class="size-6 text-white" />
                                    </div>
                                </div>
                                <p v-else class="text-sm text-gray-400">Belum upload</p>
                            </div>
                            <div class="rounded-lg border p-3">
                                <p class="mb-2 text-sm font-medium">KTP</p>
                                <div
                                    v-if="props.student.student_biodata.ktp_url"
                                    class="relative cursor-pointer"
                                    @click="openPreview(props.student.student_biodata.ktp_url, 'KTP')"
                                >
                                    <div v-if="isPdf(props.student.student_biodata.ktp_url)" class="flex aspect-video flex-col items-center justify-center gap-2 rounded-lg bg-gray-50 text-gray-500 hover:bg-gray-100">
                                        <FileText class="size-8 text-red-500" />
                                        <span class="text-xs">PDF Document</span>
                                    </div>
                                    <img
                                        v-else
                                        :src="props.student.student_biodata.ktp_url"
                                        class="aspect-video rounded-lg object-cover"
                                    />
                                    <div class="absolute inset-0 flex items-center justify-center rounded-lg bg-black/50 opacity-0 transition hover:opacity-100">
                                        <Eye class="size-6 text-white" />
                                    </div>
                                </div>
                                <p v-else class="text-sm text-gray-400">Belum upload</p>
                            </div>
                            <div class="rounded-lg border p-3">
                                <p class="mb-2 text-sm font-medium">KK</p>
                                <div
                                    v-if="props.student.student_biodata.kk_url"
                                    class="relative cursor-pointer"
                                    @click="openPreview(props.student.student_biodata.kk_url, 'Kartu Keluarga')"
                                >
                                    <div v-if="isPdf(props.student.student_biodata.kk_url)" class="flex aspect-video flex-col items-center justify-center gap-2 rounded-lg bg-gray-50 text-gray-500 hover:bg-gray-100">
                                        <FileText class="size-8 text-red-500" />
                                        <span class="text-xs">PDF Document</span>
                                    </div>
                                    <img
                                        v-else
                                        :src="props.student.student_biodata.kk_url"
                                        class="aspect-video rounded-lg object-cover"
                                    />
                                    <div class="absolute inset-0 flex items-center justify-center rounded-lg bg-black/50 opacity-0 transition hover:opacity-100">
                                        <Eye class="size-6 text-white" />
                                    </div>
                                </div>
                                <p v-else class="text-sm text-gray-400">Belum upload</p>
                            </div>
                            <div class="rounded-lg border p-3">
                                <p class="mb-2 text-sm font-medium">Ijazah</p>
                                <div
                                    v-if="props.student.student_biodata.certificate_url"
                                    class="relative cursor-pointer"
                                    @click="openPreview(props.student.student_biodata.certificate_url, 'Ijazah')"
                                >
                                    <div v-if="isPdf(props.student.student_biodata.certificate_url)" class="flex aspect-video flex-col items-center justify-center gap-2 rounded-lg bg-gray-50 text-gray-500 hover:bg-gray-100">
                                        <FileText class="size-8 text-red-500" />
                                        <span class="text-xs">PDF Document</span>
                                    </div>
                                    <img
                                        v-else
                                        :src="props.student.student_biodata.certificate_url"
                                        class="aspect-video rounded-lg object-cover"
                                    />
                                    <div class="absolute inset-0 flex items-center justify-center rounded-lg bg-black/50 opacity-0 transition hover:opacity-100">
                                        <Eye class="size-6 text-white" />
                                    </div>
                                </div>
                                <p v-else class="text-sm text-gray-400">Belum upload</p>
                            </div>
                        </div>
                    </CardContent>
                </Card>
            </div>
        </div>

        <!-- Accept Dialog -->
        <Dialog v-model:open="showAcceptDialog">
            <DialogContent>
                <DialogHeader>
                    <DialogTitle>Terima Mahasiswa</DialogTitle>
                    <DialogDescription>
                        Pilih program studi yang akan diterima
                    </DialogDescription>
                </DialogHeader>
                <div class="space-y-4 py-4">
                    <div class="space-y-2">
                        <Label>Program Studi</Label>
                        <div class="space-y-2">
                            <label
                                v-if="props.student.registration?.choice_1"
                                class="flex items-center gap-2"
                            >
                                <input
                                    type="radio"
                                    :value="props.student.registration.choice_1"
                                    v-model="selectedProdi"
                                />
                                {{ props.student.registration.program_studi_choice1?.name }}
                            </label>
                            <label
                                v-if="props.student.registration?.choice_2"
                                class="flex items-center gap-2"
                            >
                                <input
                                    type="radio"
                                    :value="props.student.registration.choice_2"
                                    v-model="selectedProdi"
                                />
                                {{ props.student.registration.program_studi_choice2?.name }}
                            </label>
                        </div>
                    </div>
                    <div class="space-y-2">
                        <Label>Catatan (opsional)</Label>
                        <textarea
                            v-model="acceptNotes"
                            class="w-full rounded-md border p-2 text-sm"
                            rows="2"
                        ></textarea>
                    </div>
                </div>
                <DialogFooter>
                    <Button variant="outline" @click="showAcceptDialog = false">
                        Batal
                    </Button>
                    <Button
                        @click="accept"
                        :disabled="!selectedProdi || processing"
                        class="bg-green-600 hover:bg-green-700"
                    >
                        Terima
                    </Button>
                </DialogFooter>
            </DialogContent>
        </Dialog>

        <!-- Reject Dialog -->
        <Dialog v-model:open="showRejectDialog">
            <DialogContent>
                <DialogHeader>
                    <DialogTitle>Tolak Pendaftaran</DialogTitle>
                    <DialogDescription>
                        Berikan alasan penolakan
                    </DialogDescription>
                </DialogHeader>
                <div class="space-y-4 py-4">
                    <div class="space-y-2">
                        <Label>Alasan Penolakan *</Label>
                        <textarea
                            v-model="rejectReason"
                            class="w-full rounded-md border p-2 text-sm"
                            rows="3"
                            placeholder="Jelaskan alasan penolakan..."
                        ></textarea>
                    </div>
                </div>
                <DialogFooter>
                    <Button variant="outline" @click="showRejectDialog = false">
                        Batal
                    </Button>
                    <Button
                        variant="destructive"
                        @click="reject"
                        :disabled="!rejectReason || processing"
                    >
                        Tolak
                    </Button>
                </DialogFooter>
            </DialogContent>
        </Dialog>

        <!-- Preview Dialog -->
        <Dialog v-model:open="showPreviewDialog">
            <DialogContent class="w-[95vw] max-w-4xl h-[80vh] sm:h-[85vh] flex flex-col p-4">
                <DialogHeader>
                    <DialogTitle>{{ previewTitle }}</DialogTitle>
                </DialogHeader>
                <div class="flex-1 min-h-0 overflow-auto rounded-lg bg-gray-100 mt-2">
                    <iframe
                        v-if="isPdf(previewImage)"
                        :src="previewImage"
                        class="w-full h-full min-h-[60vh]"
                        frameborder="0"
                    ></iframe>
                    <img
                        v-else
                        :src="previewImage"
                        :alt="previewTitle"
                        class="w-full h-auto max-h-full object-contain"
                    />
                </div>
            </DialogContent>
        </Dialog>
    </AppLayout>
</template>
