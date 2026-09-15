<script setup lang="ts">
import {
    AlertDialog,
    AlertDialogAction,
    AlertDialogCancel,
    AlertDialogContent,
    AlertDialogDescription,
    AlertDialogFooter,
    AlertDialogHeader,
    AlertDialogTitle,
} from '@/components/ui/alert-dialog';
import { Button } from '@/components/ui/button';
import {
    Card,
    CardContent,
    CardDescription,
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
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from '@/components/ui/select';
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, router } from '@inertiajs/vue3';
import { GraduationCap, Pencil, Search, XCircle } from 'lucide-vue-next';
import { computed, ref, watch } from 'vue';

interface ProgramStudi {
    id: number;
    name: string;
    nim_code: string;
}

interface Registration {
    id: number;
    registration_number: string;
    status: string;
    created_at: string;
    user: {
        id: number;
        name: string;
        email: string;
        nim: string | null;
    };
    accepted_program_studi: ProgramStudi | null;
    registration_period: {
        id: number;
        academic_year: string;
    } | null;
}

interface PaginatedRegistrations {
    data: Registration[];
    current_page: number;
    last_page: number;
    per_page: number;
    total: number;
    links: Array<{ url: string | null; label: string; active: boolean }>;
}

interface Props {
    registrations: PaginatedRegistrations;
    programStudi: ProgramStudi[];
    filters: {
        prodi: string;
        search: string;
    };
}

const props = defineProps<Props>();

const breadcrumbs = [
    { title: 'Dashboard', href: '/admin/dashboard' },
    { title: 'Mahasiswa Aktif', href: '/admin/enrolled-students' },
];

const searchQuery = ref(props.filters.search);
const prodiFilter = ref(props.filters.prodi || 'all');
const showCancelDialog = ref(false);
const selectedRegistration = ref<Registration | null>(null);

// Watch for filter changes
let debounceTimer: ReturnType<typeof setTimeout>;
watch([searchQuery, prodiFilter], () => {
    clearTimeout(debounceTimer);
    debounceTimer = setTimeout(() => {
        router.get(
            '/admin/enrolled-students',
            {
                search: searchQuery.value || undefined,
                prodi: prodiFilter.value === 'all' ? undefined : prodiFilter.value,
            },
            {
                preserveState: true,
                replace: true,
            },
        );
    }, 300);
});

const formatDate = (dateString: string) => {
    return new Date(dateString).toLocaleDateString('id-ID', {
        day: '2-digit',
        month: 'short',
        year: 'numeric',
    });
};

const openCancelDialog = (registration: Registration) => {
    selectedRegistration.value = registration;
    showCancelDialog.value = true;
};

// Edit NIM state & actions
const showEditNimDialog = ref(false);
const editNimRegistration = ref<Registration | null>(null);
const nimPrefix = ref('');
const nimSequence = ref('');
const editNimError = ref('');
const isSubmittingNim = ref(false);

const openEditNimDialog = (registration: Registration) => {
    editNimRegistration.value = registration;
    editNimError.value = '';

    // Calculate prefix: 2 digits year + prodi nim_code (e.g. 250105)
    const year = registration.registration_period?.academic_year
        ? registration.registration_period.academic_year.split('/')[0].slice(-2)
        : '';
    const prodiCode = registration.accepted_program_studi?.nim_code || '';
    const prefix = `${year}${prodiCode}`;
    nimPrefix.value = prefix;

    const currentNim = registration.user.nim || '';
    if (prefix && currentNim.startsWith(prefix)) {
        nimSequence.value = currentNim.slice(prefix.length);
    } else {
        nimSequence.value = '';
    }

    showEditNimDialog.value = true;
};

const previewFullNim = computed(() => {
    if (!nimPrefix.value) return '-';
    if (!nimSequence.value) return `${nimPrefix.value}___`;
    const seq =
        nimSequence.value.length < 3
            ? nimSequence.value.padStart(3, '0')
            : nimSequence.value;
    return `${nimPrefix.value}${seq}`;
});

const submitEditNim = () => {
    if (!editNimRegistration.value) return;

    if (!nimSequence.value || !/^[0-9]{1,4}$/.test(nimSequence.value)) {
        editNimError.value = 'Nomor urut NIM harus berupa 1-4 digit angka.';
        return;
    }

    isSubmittingNim.value = true;
    editNimError.value = '';

    router.patch(
        `/admin/enrolled-students/${editNimRegistration.value.id}/nim`,
        {
            sequence: nimSequence.value,
        },
        {
            preserveScroll: true,
            onSuccess: () => {
                showEditNimDialog.value = false;
                editNimRegistration.value = null;
            },
            onError: (errors) => {
                if (errors.sequence) {
                    editNimError.value = errors.sequence;
                }
            },
            onFinish: () => {
                isSubmittingNim.value = false;
            },
        },
    );
};

const cancelEnrollment = () => {
    if (!selectedRegistration.value) return;

    router.post(
        `/admin/enrolled-students/${selectedRegistration.value.id}/cancel`,
        {},
        {
            preserveScroll: true,
            onSuccess: () => {
                showCancelDialog.value = false;
                selectedRegistration.value = null;
            },
        },
    );
};

const rowNumber = (index: number) =>
    (props.registrations.current_page - 1) * props.registrations.per_page +
    index +
    1;
</script>

<template>
    <Head title="Data Mahasiswa Aktif" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex flex-col gap-6 p-4">
            <Card>
                <CardHeader>
                    <div class="flex items-center justify-between">
                        <div>
                            <CardTitle class="flex items-center gap-2">
                                <GraduationCap class="size-5" />
                                Data Mahasiswa Aktif
                            </CardTitle>
                            <CardDescription>
                                Daftar mahasiswa yang telah terdaftar dan memiliki NIM
                            </CardDescription>
                        </div>
                    </div>
                </CardHeader>
                <CardContent>
                    <!-- Filters -->
                    <div
                        class="mb-6 flex flex-col gap-4 sm:flex-row sm:items-center"
                    >
                        <div class="relative flex-1">
                            <Search
                                class="absolute top-1/2 left-3 size-4 -translate-y-1/2 text-muted-foreground"
                            />
                            <Input
                                v-model="searchQuery"
                                placeholder="Cari nama, email, atau NIM..."
                                class="pl-10"
                            />
                        </div>
                        <Select v-model="prodiFilter">
                            <SelectTrigger class="w-full sm:w-64">
                                <SelectValue placeholder="Filter Prodi" />
                            </SelectTrigger>
                            <SelectContent>
                                <SelectItem value="all">Semua Prodi</SelectItem>
                                <SelectItem
                                    v-for="prodi in programStudi"
                                    :key="prodi.id"
                                    :value="String(prodi.id)"
                                >
                                    {{ prodi.name }}
                                </SelectItem>
                            </SelectContent>
                        </Select>
                    </div>

                    <!-- Table -->
                    <div class="overflow-x-auto rounded-lg border">
                        <table class="w-full text-sm">
                            <thead class="bg-muted/50">
                                <tr>
                                    <th class="w-16 px-4 py-3 text-left font-medium">No</th>
                                    <th class="px-4 py-3 text-left font-medium">NIM</th>
                                    <th class="px-4 py-3 text-left font-medium">Nama Mahasiswa</th>
                                    <th class="px-4 py-3 text-left font-medium">Program Studi</th>
                                    <th class="px-4 py-3 text-left font-medium">Angkatan</th>
                                    <th class="px-4 py-3 text-left font-medium">Status</th>
                                    <th class="px-4 py-3 text-center font-medium">Aksi</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y">
                                <tr
                                    v-for="(reg, index) in registrations.data"
                                    :key="reg.id"
                                    class="hover:bg-muted/50"
                                >
                                    <td class="px-4 py-3 text-muted-foreground">
                                        {{ rowNumber(index) }}
                                    </td>
                                    <td class="px-4 py-3 font-mono font-medium">
                                        {{ reg.user.nim || '-' }}
                                    </td>
                                    <td class="px-4 py-3">
                                        <div>
                                            <div class="font-medium">
                                                {{ reg.user.name }}
                                            </div>
                                            <div
                                                class="text-xs text-muted-foreground"
                                            >
                                                {{ reg.user.email }}
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-4 py-3">
                                        <div
                                            v-if="reg.accepted_program_studi"
                                            class="flex items-center gap-2"
                                        >
                                            <span>{{
                                                reg.accepted_program_studi.name
                                            }}</span>
                                        </div>
                                        <span
                                            v-else
                                            class="text-muted-foreground"
                                            >-</span
                                        >
                                    </td>
                                    <td class="px-4 py-3">
                                        {{
                                            reg.registration_period
                                                ?.academic_year || '-'
                                        }}
                                    </td>
                                    <td class="px-4 py-3">
                                         <span
                                            class="inline-flex items-center rounded-full bg-green-100 px-2.5 py-0.5 text-xs font-medium text-green-800 dark:bg-green-900/30 dark:text-green-400"
                                        >
                                            Aktif
                                        </span>
                                    </td>
                                    <td class="px-4 py-3">
                                        <div class="flex items-center justify-center gap-2">
                                            <Button
                                                size="sm"
                                                variant="outline"
                                                class="border-blue-200 text-blue-700 hover:bg-blue-50 hover:text-blue-800 dark:border-blue-800 dark:text-blue-400 dark:hover:bg-blue-950"
                                                @click="openEditNimDialog(reg)"
                                                title="Edit Nomor Urut NIM"
                                            >
                                                <Pencil class="mr-1 size-3.5" />
                                                Edit NIM
                                            </Button>
                                            <Button
                                                size="sm"
                                                variant="destructive"
                                                @click="openCancelDialog(reg)"
                                            >
                                                <XCircle class="mr-1 size-3.5" />
                                                Batalkan
                                            </Button>
                                        </div>
                                    </td>
                                </tr>
                                <tr v-if="registrations.data.length === 0">
                                    <td
                                        colspan="7"
                                        class="px-4 py-8 text-center text-muted-foreground"
                                    >
                                        Tidak ada data mahasiswa aktif yang ditemukan
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- Pagination -->
                    <div
                        v-if="registrations.last_page > 1"
                        class="mt-4 flex items-center justify-between"
                    >
                        <p class="text-sm text-muted-foreground">
                            Menampilkan {{ registrations.data.length }} dari
                            {{ registrations.total }} data
                        </p>
                        <div class="flex gap-2">
                            <Button
                                v-for="link in registrations.links"
                                :key="link.label"
                                size="sm"
                                :variant="link.active ? 'default' : 'outline'"
                                :disabled="!link.url"
                                @click="link.url && router.get(link.url)"
                                v-html="link.label"
                            />
                        </div>
                    </div>
                </CardContent>
            </Card>

            <AlertDialog v-model:open="showCancelDialog">
                <AlertDialogContent>
                    <AlertDialogHeader>
                        <AlertDialogTitle>
                            Batalkan Mahasiswa Aktif?
                        </AlertDialogTitle>
                        <AlertDialogDescription>
                            Data
                            <strong>{{
                                selectedRegistration?.user.name
                            }}</strong>
                            dengan NIM
                            <strong>{{
                                selectedRegistration?.user.nim || '-'
                            }}</strong>
                            tidak akan dihapus dan NIM tetap tersimpan sebagai
                            riwayat, tetapi mahasiswa tidak lagi tampil sebagai
                            mahasiswa aktif.
                        </AlertDialogDescription>
                    </AlertDialogHeader>
                    <AlertDialogFooter>
                        <AlertDialogCancel>Batal</AlertDialogCancel>
                        <AlertDialogAction
                            class="bg-destructive text-destructive-foreground hover:bg-destructive/90"
                            @click="cancelEnrollment"
                        >
                            Ya, Batalkan
                        </AlertDialogAction>
                    </AlertDialogFooter>
                </AlertDialogContent>
            </AlertDialog>

            <!-- Edit NIM Dialog -->
            <Dialog v-model:open="showEditNimDialog">
                <DialogContent class="sm:max-w-md">
                    <DialogHeader>
                        <DialogTitle>Edit Nomor Urut NIM</DialogTitle>
                        <DialogDescription>
                            Hanya nomor urut setelah kode angkatan dan prodi yang dapat diubah.
                        </DialogDescription>
                    </DialogHeader>

                    <div class="space-y-4 py-2">
                        <div class="rounded-lg bg-muted/50 p-3 text-sm space-y-1.5">
                            <div class="flex justify-between">
                                <span class="text-muted-foreground">Mahasiswa:</span>
                                <span class="font-medium text-foreground">{{ editNimRegistration?.user.name }}</span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-muted-foreground">Program Studi:</span>
                                <span class="font-medium text-foreground">{{ editNimRegistration?.accepted_program_studi?.name || '-' }}</span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-muted-foreground">NIM Saat Ini:</span>
                                <span class="font-mono font-semibold text-foreground">{{ editNimRegistration?.user.nim || '-' }}</span>
                            </div>
                        </div>

                        <div class="space-y-2">
                            <Label for="nim-sequence-input">Nomor Induk Mahasiswa (NIM)</Label>
                            <div class="flex items-center gap-2">
                                <!-- Locked Prefix -->
                                <div class="flex flex-col">
                                    <span class="text-[11px] text-muted-foreground mb-1">Angkatan + Prodi</span>
                                    <div class="flex h-9 items-center rounded-md border border-input bg-muted px-3 font-mono text-sm font-semibold text-muted-foreground select-none cursor-not-allowed">
                                        {{ nimPrefix || '------' }}
                                    </div>
                                </div>
                                <span class="pt-4 text-base font-bold text-muted-foreground">+</span>
                                <!-- Editable Sequence -->
                                <div class="flex-1 flex flex-col">
                                    <span class="text-[11px] text-muted-foreground mb-1">Nomor Urut (Bisa diedit)</span>
                                    <Input
                                        id="nim-sequence-input"
                                        v-model="nimSequence"
                                        maxlength="4"
                                        placeholder="001"
                                        class="font-mono text-sm"
                                        @keyup.enter="submitEditNim"
                                    />
                                </div>
                            </div>
                            <p v-if="editNimError" class="text-xs text-destructive mt-1 font-medium">
                                {{ editNimError }}
                            </p>
                        </div>

                        <!-- Live Preview -->
                        <div class="rounded-md border border-blue-200 bg-blue-50/50 p-3 dark:border-blue-900/50 dark:bg-blue-950/30">
                            <div class="text-xs font-medium text-blue-900 dark:text-blue-300">Preview NIM Baru:</div>
                            <div class="mt-0.5 font-mono text-lg font-bold text-blue-700 dark:text-blue-400">
                                {{ previewFullNim }}
                            </div>
                            <div class="mt-1 text-[11px] text-muted-foreground">
                                * Angka kurang dari 3 digit otomatis ditambahkan nol di depan (contoh: 15 menjadi 015).
                            </div>
                        </div>
                    </div>

                    <DialogFooter>
                        <Button
                            type="button"
                            variant="outline"
                            @click="showEditNimDialog = false"
                            :disabled="isSubmittingNim"
                        >
                            Batal
                        </Button>
                        <Button
                            type="button"
                            @click="submitEditNim"
                            :disabled="isSubmittingNim || !nimSequence"
                        >
                            {{ isSubmittingNim ? 'Menyimpan...' : 'Simpan NIM' }}
                        </Button>
                    </DialogFooter>
                </DialogContent>
            </Dialog>
        </div>
    </AppLayout>
</template>
