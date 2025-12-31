<script setup lang="ts">
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
import { Head, router, useForm } from '@inertiajs/vue3';
import { Check, Eye, Search, X } from 'lucide-vue-next';
import { ref, watch } from 'vue';

interface Payment {
    id: number;
    user_id: number;
    amount: number;
    payment_proof_path: string | null;
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
    filters: {
        status: string;
        search: string;
    };
}

const props = defineProps<Props>();

const breadcrumbs = [
    { title: 'Dashboard', href: '/admin/dashboard' },
    { title: 'Verifikasi Pembayaran', href: '/admin/reregistration-payments' },
];

const searchQuery = ref(props.filters.search);
const statusFilter = ref(props.filters.status);

// Dialog states
const showPreviewDialog = ref(false);
const showRejectDialog = ref(false);
const selectedPayment = ref<Payment | null>(null);
const previewUrl = ref('');

const rejectForm = useForm({
    notes: '',
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

const formatCurrency = (amount: number) => {
    return new Intl.NumberFormat('id-ID', {
        style: 'currency',
        currency: 'IDR',
        minimumFractionDigits: 0,
    }).format(amount);
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
    if (payment.payment_proof_path) {
        previewUrl.value = `/storage/${payment.payment_proof_path}`;
        selectedPayment.value = payment;
        showPreviewDialog.value = true;
    }
};

const verifyPayment = (payment: Payment) => {
    if (confirm('Apakah Anda yakin ingin memverifikasi pembayaran ini?')) {
        router.post(`/admin/reregistration-payments/${payment.id}/verify`, {});
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
    <Head title="Verifikasi Pembayaran Daftar Ulang" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex flex-col gap-6 p-4">
            <Card>
                <CardHeader>
                    <CardTitle>Verifikasi Pembayaran Daftar Ulang</CardTitle>
                    <CardDescription>
                        Kelola dan verifikasi pembayaran daftar ulang mahasiswa
                    </CardDescription>
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
                                        Tanggal Upload
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
                                                @click="openPreview(payment)"
                                                :disabled="
                                                    !payment.payment_proof_path
                                                "
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
                                                        verifyPayment(payment)
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
                                        Tidak ada data pembayaran
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

        <!-- Reject Dialog -->
        <Dialog v-model:open="showRejectDialog">
            <DialogContent>
                <DialogHeader>
                    <DialogTitle>Tolak Pembayaran</DialogTitle>
                    <DialogDescription>
                        Berikan alasan penolakan untuk mahasiswa
                    </DialogDescription>
                </DialogHeader>
                <form @submit.prevent="submitReject" class="space-y-4">
                    <div class="space-y-2">
                        <Label for="reject_notes">Alasan Penolakan *</Label>
                        <textarea
                            id="reject_notes"
                            v-model="rejectForm.notes"
                            rows="3"
                            class="flex min-h-[60px] w-full rounded-md border border-input bg-transparent px-3 py-2 text-sm shadow-xs placeholder:text-muted-foreground focus-visible:ring-1 focus-visible:ring-ring focus-visible:outline-none"
                            placeholder="Contoh: Bukti pembayaran tidak jelas, nominal tidak sesuai, dll."
                        ></textarea>
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
                            Tolak Pembayaran
                        </Button>
                    </DialogFooter>
                </form>
            </DialogContent>
        </Dialog>
    </AppLayout>
</template>
