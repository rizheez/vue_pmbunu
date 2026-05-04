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
    Command,
    CommandEmpty,
    CommandGroup,
    CommandInput,
    CommandItem,
    CommandList,
} from '@/components/ui/command';
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
    Popover,
    PopoverContent,
    PopoverTrigger,
} from '@/components/ui/popover';
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from '@/components/ui/select';
import { Textarea } from '@/components/ui/textarea';
import AppLayout from '@/layouts/AppLayout.vue';
import { cn } from '@/lib/utils';
import { Head, router, useForm } from '@inertiajs/vue3';
import {
    Check,
    ChevronsUpDown,
    CreditCard,
    Eye,
    Plus,
    Search,
    SquarePen,
    X,
} from 'lucide-vue-next';
import { computed, ref, watch } from 'vue';

interface Payment {
    id: number;
    user_id: number;
    amount: number | string;
    payment_proof_path: string | null;
    payment_proof_url?: string | null;
    status: 'pending' | 'verified' | 'rejected';
    notes: string | null;
    verified_at: string | null;
    created_at: string;
    user: {
        id: number;
        name: string;
        email: string;
        student_biodata?: {
            name: string;
            phone: string;
        };
    };
}

interface EligibleStudent {
    id: number;
    name: string;
    email: string;
}

interface PaginatedPayments {
    data: Payment[];
    current_page: number;
    last_page: number;
    per_page: number;
    total: number;
    links: Array<{ url: string | null; label: string; active: boolean }>;
}

interface Props {
    payments: PaginatedPayments;
    eligibleStudents: EligibleStudent[];
    defaultAmount: number;
    filters: {
        status: string;
        search: string;
    };
}

const props = defineProps<Props>();

const breadcrumbs = [
    { title: 'Dashboard', href: '/admin/dashboard' },
    {
        title: 'Pembayaran Almamater & KTM',
        href: '/admin/reregistration-payments',
    },
];

const searchQuery = ref(props.filters.search);
const statusFilter = ref(props.filters.status);

// Dialog states
const showPreviewDialog = ref(false);
const showRejectDialog = ref(false);
const showVerifyDialog = ref(false);
const showFormDialog = ref(false);
const showStudentCombobox = ref(false);
const selectedPayment = ref<Payment | null>(null);
const previewUrl = ref('');

const paymentForm = useForm({
    user_id: '',
    amount: props.defaultAmount,
    status: 'verified',
    notes: '',
    payment_proof: null as File | null,
});

const rejectForm = useForm({
    notes: '',
});

const isEditMode = computed(() => selectedPayment.value !== null);

const selectedStudent = computed(() =>
    props.eligibleStudents.find(
        (student) => String(student.id) === paymentForm.user_id,
    ),
);

const selectedStudentLabel = computed(() => {
    if (isEditMode.value && selectedPayment.value) {
        const user = selectedPayment.value.user;

        return `${user.student_biodata?.name || user.name} - ${user.email}`;
    }

    if (!selectedStudent.value) {
        return '';
    }

    return `${selectedStudent.value.name} - ${selectedStudent.value.email}`;
});

// Watch for filter changes
watch([searchQuery, statusFilter], () => {
    router.get(
        '/admin/reregistration-payments',
        {
            search: searchQuery.value || undefined,
            status:
                statusFilter.value !== 'all' ? statusFilter.value : undefined,
        },
        {
            preserveState: true,
            replace: true,
        },
    );
});

const formatCurrency = (amount: number | string) => {
    return new Intl.NumberFormat('id-ID', {
        style: 'currency',
        currency: 'IDR',
        minimumFractionDigits: 0,
    }).format(Number(amount));
};

const formatDate = (dateString: string) => {
    return new Date(dateString).toLocaleDateString('id-ID', {
        day: '2-digit',
        month: 'short',
        year: 'numeric',
        hour: '2-digit',
        minute: '2-digit',
    });
};

const openPreview = (payment: Payment) => {
    if (payment.payment_proof_url || payment.payment_proof_path) {
        previewUrl.value =
            payment.payment_proof_url ||
            `/storage/${payment.payment_proof_path}`;
        selectedPayment.value = payment;
        showPreviewDialog.value = true;
    }
};

const openCreateDialog = () => {
    selectedPayment.value = null;
    paymentForm.reset();
    paymentForm.user_id = '';
    paymentForm.amount = props.defaultAmount;
    paymentForm.status = 'verified';
    showStudentCombobox.value = false;
    showFormDialog.value = true;
};

const openEditDialog = (payment: Payment) => {
    selectedPayment.value = payment;
    paymentForm.reset();
    paymentForm.user_id = String(payment.user_id);
    paymentForm.amount = Number(payment.amount);
    paymentForm.status = payment.status;
    paymentForm.notes = payment.notes ?? '';
    paymentForm.payment_proof = null;
    showStudentCombobox.value = false;
    showFormDialog.value = true;
};

const selectStudent = (selectedValue: string) => {
    paymentForm.user_id =
        selectedValue === paymentForm.user_id ? '' : selectedValue;
    showStudentCombobox.value = false;
};

const handleProofChange = (event: Event) => {
    const input = event.target as HTMLInputElement;
    paymentForm.payment_proof = input.files?.[0] ?? null;
};

const submitPayment = () => {
    const options = {
        preserveScroll: true,
        forceFormData: true,
        onSuccess: () => {
            showFormDialog.value = false;
            paymentForm.reset();
            selectedPayment.value = null;
        },
    };

    if (isEditMode.value && selectedPayment.value) {
        paymentForm
            .transform((data) => ({
                ...data,
                _method: 'PUT',
            }))
            .post(
                `/admin/reregistration-payments/${selectedPayment.value.id}`,
                options,
            );

        return;
    }

    paymentForm.post('/admin/reregistration-payments', options);
};

const openVerifyDialog = (payment: Payment) => {
    selectedPayment.value = payment;
    showVerifyDialog.value = true;
};

const confirmVerify = () => {
    if (selectedPayment.value) {
        router.post(
            `/admin/reregistration-payments/${selectedPayment.value.id}/verify`,
            {},
            {
                onSuccess: () => {
                    showVerifyDialog.value = false;
                },
            },
        );
    }
};

const openRejectDialog = (payment: Payment) => {
    selectedPayment.value = payment;
    rejectForm.reset();
    showRejectDialog.value = true;
};

const submitReject = () => {
    if (selectedPayment.value) {
        rejectForm.post(
            `/admin/reregistration-payments/${selectedPayment.value.id}/reject`,
            {
                onSuccess: () => {
                    showRejectDialog.value = false;
                    rejectForm.reset();
                },
            },
        );
    }
};

const getStatusBadgeClass = (status: string) => {
    switch (status) {
        case 'verified':
            return 'bg-green-100 text-green-800 dark:bg-green-900/30 dark:text-green-300';
        case 'rejected':
            return 'bg-red-100 text-red-800 dark:bg-red-900/30 dark:text-red-300';
        default:
            return 'bg-yellow-100 text-yellow-800 dark:bg-yellow-900/30 dark:text-yellow-300';
    }
};

const getStatusLabel = (status: string) => {
    switch (status) {
        case 'verified':
            return 'Terverifikasi';
        case 'rejected':
            return 'Ditolak';
        default:
            return 'Pending';
    }
};
</script>

<template>
    <Head title="Pembayaran Almamater & KTM" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex flex-col gap-6 p-4">
            <Card>
                <CardHeader>
                    <div
                        class="flex flex-col gap-4 sm:flex-row sm:items-start sm:justify-between"
                    >
                        <div>
                            <CardTitle>Pembayaran Almamater & KTM</CardTitle>
                            <CardDescription>
                                Catat pembayaran almamater dan KTM. Daftar ulang
                                tetap gratis.
                            </CardDescription>
                        </div>
                        <Button type="button" @click="openCreateDialog">
                            <Plus class="mr-2 size-4" />
                            Tambah Pembayaran
                        </Button>
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
                                placeholder="Cari nama atau email..."
                                class="pl-10"
                            />
                        </div>
                        <Select v-model="statusFilter">
                            <SelectTrigger class="w-full sm:w-48">
                                <SelectValue placeholder="Filter Status" />
                            </SelectTrigger>
                            <SelectContent>
                                <SelectItem value="all">Semua</SelectItem>
                                <SelectItem value="pending">Pending</SelectItem>
                                <SelectItem value="verified"
                                    >Terverifikasi</SelectItem
                                >
                                <SelectItem value="rejected"
                                    >Ditolak</SelectItem
                                >
                            </SelectContent>
                        </Select>
                    </div>

                    <!-- Table -->
                    <div class="overflow-x-auto rounded-lg border">
                        <table class="w-full text-sm">
                            <thead class="bg-muted/50">
                                <tr>
                                    <th class="px-4 py-3 text-left font-medium">
                                        Mahasiswa
                                    </th>
                                    <th class="px-4 py-3 text-left font-medium">
                                        Jumlah
                                    </th>
                                    <th class="px-4 py-3 text-left font-medium">
                                        Tanggal Catat
                                    </th>
                                    <th class="px-4 py-3 text-left font-medium">
                                        Status
                                    </th>
                                    <th
                                        class="px-4 py-3 text-center font-medium"
                                    >
                                        Aksi
                                    </th>
                                </tr>
                            </thead>
                            <tbody class="divide-y">
                                <tr
                                    v-for="payment in payments.data"
                                    :key="payment.id"
                                    class="hover:bg-muted/50"
                                >
                                    <td class="px-4 py-3">
                                        <div>
                                            <div class="font-medium">
                                                {{
                                                    payment.user.student_biodata
                                                        ?.name ||
                                                    payment.user.name
                                                }}
                                            </div>
                                            <div
                                                class="text-xs text-muted-foreground"
                                            >
                                                {{ payment.user.email }}
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-4 py-3 font-medium">
                                        {{ formatCurrency(payment.amount) }}
                                    </td>
                                    <td class="px-4 py-3 text-muted-foreground">
                                        {{ formatDate(payment.created_at) }}
                                    </td>
                                    <td class="px-4 py-3">
                                        <span
                                            :class="[
                                                'rounded-full px-2 py-1 text-xs font-medium',
                                                getStatusBadgeClass(
                                                    payment.status,
                                                ),
                                            ]"
                                        >
                                            {{ getStatusLabel(payment.status) }}
                                        </span>
                                    </td>
                                    <td class="px-4 py-3">
                                        <div
                                            class="flex items-center justify-center gap-2"
                                        >
                                            <Button
                                                size="sm"
                                                variant="outline"
                                                @click="openEditDialog(payment)"
                                            >
                                                <SquarePen class="size-4" />
                                            </Button>
                                            <Button
                                                v-if="
                                                    payment.payment_proof_path
                                                "
                                                size="sm"
                                                variant="outline"
                                                @click="openPreview(payment)"
                                            >
                                                <Eye class="size-4" />
                                            </Button>
                                            <template
                                                v-if="
                                                    payment.status === 'pending'
                                                "
                                            >
                                                <Button
                                                    size="sm"
                                                    variant="default"
                                                    class="bg-green-600 hover:bg-green-700"
                                                    @click="
                                                        openVerifyDialog(
                                                            payment,
                                                        )
                                                    "
                                                >
                                                    <Check class="size-4" />
                                                </Button>
                                                <Button
                                                    size="sm"
                                                    variant="destructive"
                                                    @click="
                                                        openRejectDialog(
                                                            payment,
                                                        )
                                                    "
                                                >
                                                    <X class="size-4" />
                                                </Button>
                                            </template>
                                        </div>
                                    </td>
                                </tr>
                                <tr v-if="payments.data.length === 0">
                                    <td
                                        colspan="5"
                                        class="px-4 py-8 text-center text-muted-foreground"
                                    >
                                        Belum ada pembayaran almamater dan KTM
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- Pagination -->
                    <div
                        v-if="payments.last_page > 1"
                        class="mt-4 flex items-center justify-between"
                    >
                        <p class="text-sm text-muted-foreground">
                            Menampilkan {{ payments.data.length }} dari
                            {{ payments.total }} data
                        </p>
                        <div class="flex gap-2">
                            <Button
                                v-for="link in payments.links"
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
        </div>

        <!-- Preview Dialog -->
        <Dialog v-model:open="showPreviewDialog">
            <DialogContent class="max-w-3xl">
                <DialogHeader>
                    <DialogTitle>Bukti Pembayaran</DialogTitle>
                    <DialogDescription>
                        {{
                            selectedPayment?.user.student_biodata?.name ||
                            selectedPayment?.user.name
                        }}
                    </DialogDescription>
                </DialogHeader>
                <div class="flex justify-center p-4">
                    <img
                        v-if="
                            previewUrl.endsWith('.jpg') ||
                            previewUrl.endsWith('.jpeg') ||
                            previewUrl.endsWith('.png')
                        "
                        :src="previewUrl"
                        alt="Bukti Pembayaran"
                        class="max-h-[60vh] rounded-lg object-contain"
                    />
                    <iframe
                        v-else
                        :src="previewUrl"
                        class="h-[60vh] w-full rounded-lg"
                    />
                </div>
                <DialogFooter>
                    <Button
                        variant="outline"
                        @click="showPreviewDialog = false"
                    >
                        Tutup
                    </Button>
                </DialogFooter>
            </DialogContent>
        </Dialog>

        <!-- Create/Edit Dialog -->
        <Dialog v-model:open="showFormDialog">
            <DialogContent class="sm:max-w-xl">
                <DialogHeader>
                    <DialogTitle>
                        {{
                            isEditMode
                                ? 'Edit Pembayaran Almamater & KTM'
                                : 'Tambah Pembayaran Almamater & KTM'
                        }}
                    </DialogTitle>
                    <DialogDescription>
                        {{
                            isEditMode
                                ? 'Perbarui data pembayaran almamater dan KTM.'
                                : 'Pilih mahasiswa dan catat pembayaran almamater dan KTM.'
                        }}
                    </DialogDescription>
                </DialogHeader>
                <form @submit.prevent="submitPayment" class="space-y-4">
                    <div class="space-y-2">
                        <Label>Mahasiswa *</Label>
                        <Popover v-model:open="showStudentCombobox">
                            <PopoverTrigger as-child>
                                <Button
                                    type="button"
                                    variant="outline"
                                    role="combobox"
                                    :aria-expanded="showStudentCombobox"
                                    :disabled="isEditMode"
                                    class="w-full justify-between font-normal"
                                >
                                    <span
                                        :class="[
                                            'truncate text-left',
                                            !selectedStudentLabel &&
                                                'text-muted-foreground',
                                        ]"
                                    >
                                        {{
                                            selectedStudentLabel ||
                                            'Cari nama atau email mahasiswa'
                                        }}
                                    </span>
                                    <ChevronsUpDown
                                        class="ml-2 size-4 shrink-0 opacity-50"
                                    />
                                </Button>
                            </PopoverTrigger>
                            <PopoverContent
                                align="start"
                                class="z-[60] w-(--reka-popover-trigger-width) p-0"
                            >
                                <Command>
                                    <CommandInput
                                        class="h-9"
                                        placeholder="Cari mahasiswa..."
                                    />
                                    <CommandList>
                                        <CommandEmpty>
                                            Mahasiswa tidak ditemukan.
                                        </CommandEmpty>
                                        <CommandGroup>
                                            <CommandItem
                                                v-for="student in eligibleStudents"
                                                :key="student.id"
                                                :value="String(student.id)"
                                                @select="
                                                    (ev) => {
                                                        selectStudent(
                                                            ev.detail
                                                                .value as string,
                                                        );
                                                    }
                                                "
                                            >
                                                <div
                                                    class="flex min-w-0 flex-1 flex-col"
                                                >
                                                    <span
                                                        class="truncate font-medium"
                                                    >
                                                        {{ student.name }}
                                                    </span>
                                                    <span
                                                        class="truncate text-xs text-muted-foreground"
                                                    >
                                                        {{ student.email }}
                                                    </span>
                                                </div>
                                                <Check
                                                    :class="
                                                        cn(
                                                            'ml-auto size-4',
                                                            paymentForm.user_id ===
                                                                String(
                                                                    student.id,
                                                                )
                                                                ? 'opacity-100'
                                                                : 'opacity-0',
                                                        )
                                                    "
                                                />
                                            </CommandItem>
                                        </CommandGroup>
                                    </CommandList>
                                </Command>
                            </PopoverContent>
                        </Popover>
                        <p
                            v-if="paymentForm.errors.user_id"
                            class="text-sm text-red-500"
                        >
                            {{ paymentForm.errors.user_id }}
                        </p>
                    </div>
                    <div class="space-y-2">
                        <Label for="amount">Nominal *</Label>
                        <Input
                            id="amount"
                            v-model="paymentForm.amount"
                            type="number"
                            min="0"
                            step="1000"
                        />
                        <p
                            v-if="paymentForm.errors.amount"
                            class="text-sm text-red-500"
                        >
                            {{ paymentForm.errors.amount }}
                        </p>
                    </div>
                    <div class="space-y-2">
                        <Label>Status *</Label>
                        <Select v-model="paymentForm.status">
                            <SelectTrigger class="w-full">
                                <SelectValue placeholder="Pilih status" />
                            </SelectTrigger>
                            <SelectContent>
                                <SelectItem value="pending"
                                    >Belum diverifikasi</SelectItem
                                >
                                <SelectItem value="verified"
                                    >Sudah dibayar</SelectItem
                                >
                                <SelectItem value="rejected"
                                    >Ditolak</SelectItem
                                >
                            </SelectContent>
                        </Select>
                    </div>
                    <div class="space-y-2">
                        <Label for="payment_proof">Bukti Pembayaran</Label>
                        <Input
                            id="payment_proof"
                            type="file"
                            accept=".pdf,.jpg,.jpeg,.png"
                            @change="handleProofChange"
                        />
                        <p class="text-xs text-muted-foreground">
                            Format PDF, JPG, JPEG, atau PNG. Maksimal 2 MB.
                        </p>
                        <div
                            v-if="selectedPayment?.payment_proof_url"
                            class="flex items-center gap-2"
                        >
                            <Button
                                type="button"
                                variant="outline"
                                size="sm"
                                @click="openPreview(selectedPayment)"
                            >
                                <Eye class="mr-2 size-4" />
                                Lihat bukti saat ini
                            </Button>
                        </div>
                        <p
                            v-if="paymentForm.errors.payment_proof"
                            class="text-sm text-red-500"
                        >
                            {{ paymentForm.errors.payment_proof }}
                        </p>
                    </div>
                    <div class="space-y-2">
                        <Label for="notes">Catatan</Label>
                        <Textarea
                            id="notes"
                            v-model="paymentForm.notes"
                            rows="3"
                            placeholder="Contoh: Almamater + KTM lunas."
                        />
                        <p
                            v-if="paymentForm.errors.notes"
                            class="text-sm text-red-500"
                        >
                            {{ paymentForm.errors.notes }}
                        </p>
                    </div>
                    <DialogFooter>
                        <Button
                            type="button"
                            variant="outline"
                            @click="showFormDialog = false"
                        >
                            Batal
                        </Button>
                        <Button
                            type="submit"
                            :disabled="paymentForm.processing"
                        >
                            <component
                                :is="isEditMode ? SquarePen : CreditCard"
                                class="mr-2 size-4"
                            />
                            {{ isEditMode ? 'Update' : 'Simpan' }}
                        </Button>
                    </DialogFooter>
                </form>
            </DialogContent>
        </Dialog>

        <!-- Reject Dialog -->
        <Dialog v-model:open="showRejectDialog">
            <DialogContent>
                <DialogHeader>
                    <DialogTitle>Tolak Pembayaran Almamater & KTM</DialogTitle>
                    <DialogDescription>
                        Berikan catatan penolakan pembayaran almamater dan KTM
                    </DialogDescription>
                </DialogHeader>
                <form @submit.prevent="submitReject" class="space-y-4">
                    <div class="space-y-2">
                        <Label for="reject_notes">Alasan Penolakan *</Label>
                        <Textarea
                            id="reject_notes"
                            v-model="rejectForm.notes"
                            rows="3"
                            placeholder="Contoh: Nominal belum sesuai atau pembayaran dibatalkan."
                        />
                        <p
                            v-if="rejectForm.errors.notes"
                            class="text-sm text-red-500"
                        >
                            {{ rejectForm.errors.notes }}
                        </p>
                    </div>
                    <DialogFooter>
                        <Button
                            type="button"
                            variant="outline"
                            @click="showRejectDialog = false"
                        >
                            Batal
                        </Button>
                        <Button
                            type="submit"
                            variant="destructive"
                            :disabled="rejectForm.processing"
                        >
                            Tolak
                        </Button>
                    </DialogFooter>
                </form>
            </DialogContent>
        </Dialog>

        <!-- Verify Confirmation Dialog -->
        <AlertDialog v-model:open="showVerifyDialog">
            <AlertDialogContent>
                <AlertDialogHeader>
                    <AlertDialogTitle>Konfirmasi Verifikasi</AlertDialogTitle>
                    <AlertDialogDescription>
                        Apakah Anda yakin ingin memverifikasi pembayaran
                        almamater dan KTM dari
                        <strong>{{
                            selectedPayment?.user.student_biodata?.name ||
                            selectedPayment?.user.name
                        }}</strong
                        >? Tindakan ini hanya mengubah status pembayaran
                        almamater dan KTM.
                    </AlertDialogDescription>
                </AlertDialogHeader>
                <AlertDialogFooter>
                    <AlertDialogCancel>Batal</AlertDialogCancel>
                    <AlertDialogAction
                        class="bg-green-600 hover:bg-green-700"
                        @click="confirmVerify"
                    >
                        Ya, Verifikasi
                    </AlertDialogAction>
                </AlertDialogFooter>
            </AlertDialogContent>
        </AlertDialog>
    </AppLayout>
</template>
