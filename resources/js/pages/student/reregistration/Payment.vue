<script setup lang="ts">
import { Alert, AlertDescription, AlertTitle } from '@/components/ui/alert';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from '@/components/ui/card';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import AppLayout from '@/layouts/AppLayout.vue';
import type { StudentBiodata } from '@/types/pmb';
import { Head, useForm } from '@inertiajs/vue3';
import {
    AlertCircle,
    CheckCircle,
    CreditCard,
    Upload,
} from 'lucide-vue-next';
import { computed } from 'vue';

interface Payment {
    id: number;
    user_id: number;
    amount: number;
    payment_proof_path: string | null;
    payment_proof_url: string | null;
    status: 'pending' | 'verified' | 'rejected';
    notes: string | null;
    verified_at: string | null;
}

interface PaymentInfo {
    payment_type: 'bank_transfer' | 'va';
    bank_name: string;
    account_number: string;
    account_name: string;
    amount: number;
    instructions: string;
}

interface Props {
    biodata: StudentBiodata & { reregistration_status?: string };
    payment: Payment | null;
    paymentInfo: PaymentInfo;
}

const props = defineProps<Props>();

const breadcrumbs = [
    { title: 'Dashboard', href: '/student/dashboard' },
    { title: 'Daftar Ulang', href: '/student/reregistration' },
    { title: 'Pembayaran', href: '/student/reregistration/payment' },
];

const paymentForm = useForm({
    payment_proof: null as File | null,
});

const handlePaymentUpload = (event: Event) => {
    const target = event.target as HTMLInputElement;
    if (target.files && target.files[0]) {
        paymentForm.payment_proof = target.files[0];
    }
};

const submitPayment = () => {
    paymentForm.post('/student/reregistration/payment', {
        preserveScroll: true,
        forceFormData: true,
    });
};

const formatCurrency = (amount: number) => {
    return new Intl.NumberFormat('id-ID', {
        style: 'currency',
        currency: 'IDR',
        minimumFractionDigits: 0,
    }).format(amount);
};

const paymentStatus = computed(() => {
    if (!props.payment) return 'not_uploaded';
    return props.payment.status;
});

const statusLabel = computed(() => {
    switch (paymentStatus.value) {
        case 'pending':
            return 'Menunggu Verifikasi';
        case 'verified':
            return 'Terverifikasi';
        case 'rejected':
            return 'Ditolak';
        default:
            return 'Belum Upload';
    }
});

const statusVariant = computed(() => {
    switch (paymentStatus.value) {
        case 'pending':
            return 'bg-yellow-100 text-yellow-800 dark:bg-yellow-900/30 dark:text-yellow-400';
        case 'verified':
            return 'bg-green-100 text-green-800 dark:bg-green-900/30 dark:text-green-400';
        case 'rejected':
            return 'bg-red-100 text-red-800 dark:bg-red-900/30 dark:text-red-400';
        default:
            return 'bg-gray-100 text-gray-800 dark:bg-gray-900/30 dark:text-gray-400';
    }
});

const canUpload = computed(() => {
    return (
        props.biodata.reregistration_status === 'form_completed' ||
        props.biodata.reregistration_status === 'payment_pending'
    );
});

const isVA = computed(() => props.paymentInfo.payment_type === 'va');
</script>

<template>
    <Head title="Pembayaran Daftar Ulang" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex flex-col gap-6 p-4">
            <Card>
                <CardHeader>
                    <div class="flex items-center justify-between">
                        <div>
                            <CardTitle class="flex items-center gap-2">
                                <CreditCard class="size-5" />
                                Pembayaran Daftar Ulang
                            </CardTitle>
                            <CardDescription>
                                Upload bukti pembayaran biaya daftar ulang
                            </CardDescription>
                        </div>
                        <Badge :class="statusVariant">
                            {{ statusLabel }}
                        </Badge>
                    </div>
                </CardHeader>
                <CardContent class="space-y-6">
                    <!-- Payment Info -->
                    <div class="rounded-lg bg-blue-50 p-4 dark:bg-blue-950/30">
                        <h4 class="mb-2 font-medium text-blue-800 dark:text-blue-300">
                            Informasi Pembayaran
                        </h4>
                        <div class="space-y-2 text-sm">
                            <div class="flex justify-between">
                                <span class="text-blue-700 dark:text-blue-400">Biaya Daftar Ulang:</span>
                                <span class="font-bold text-blue-900 dark:text-blue-200">
                                    {{ formatCurrency(paymentInfo.amount) }}
                                </span>
                            </div>
                            <div class="pt-2 text-blue-600 dark:text-blue-400">
                                <!-- VA Format -->
                                <template v-if="isVA">
                                    <p class="font-medium">Nomor Pembayaran / VA:</p>
                                    <p>Virtual Account {{ paymentInfo.bank_name }}: <span class="font-mono font-bold">{{ paymentInfo.account_number }}</span></p>
                                    <p>a.n. {{ paymentInfo.account_name }}</p>
                                </template>
                                <!-- Bank Transfer Format -->
                                <template v-else>
                                    <p class="font-medium">Transfer ke:</p>
                                    <p>Bank {{ paymentInfo.bank_name }}: <span class="font-mono font-bold">{{ paymentInfo.account_number }}</span></p>
                                    <p>a.n. {{ paymentInfo.account_name }}</p>
                                </template>
                            </div>
                            <p v-if="paymentInfo.instructions" class="pt-2 text-blue-600 dark:text-blue-400 italic">
                                {{ paymentInfo.instructions }}
                            </p>
                        </div>
                    </div>

                    <!-- Payment Status Messages -->
                    <Alert
                        v-if="paymentStatus === 'verified'"
                        class="border-green-500 bg-green-50 dark:border-green-800 dark:bg-green-950/30"
                    >
                        <CheckCircle class="size-4 text-green-600" />
                        <AlertTitle class="text-green-800 dark:text-green-300">
                            Pembayaran Terverifikasi
                        </AlertTitle>
                        <AlertDescription class="text-green-700 dark:text-green-400">
                            Pembayaran Anda telah diverifikasi. Proses daftar ulang telah selesai.
                        </AlertDescription>
                    </Alert>

                    <Alert
                        v-else-if="paymentStatus === 'pending'"
                        class="border-yellow-500 bg-yellow-50 dark:border-yellow-800 dark:bg-yellow-950/30"
                    >
                        <AlertCircle class="size-4 text-yellow-600" />
                        <AlertTitle class="text-yellow-800 dark:text-yellow-300">
                            Menunggu Verifikasi
                        </AlertTitle>
                        <AlertDescription class="text-yellow-700 dark:text-yellow-400">
                            Bukti pembayaran Anda sedang diverifikasi oleh admin. Harap tunggu.
                        </AlertDescription>
                    </Alert>

                    <Alert
                        v-else-if="paymentStatus === 'rejected'"
                        variant="destructive"
                    >
                        <AlertCircle class="size-4" />
                        <AlertTitle>Pembayaran Ditolak</AlertTitle>
                        <AlertDescription>
                            {{ payment?.notes || 'Bukti pembayaran tidak valid. Silakan upload ulang.' }}
                        </AlertDescription>
                    </Alert>

                    <!-- Current Payment Proof -->
                    <div v-if="payment?.payment_proof_url" class="space-y-2">
                        <Label>Bukti Pembayaran Terupload</Label>
                        <div class="rounded-lg border p-4">
                            <img
                                v-if="payment.payment_proof_path?.match(/\.(jpg|jpeg|png)$/i)"
                                :src="payment.payment_proof_url"
                                alt="Bukti Pembayaran"
                                class="max-h-64 rounded-lg object-contain"
                            />
                            <a
                                v-else
                                :href="payment.payment_proof_url"
                                target="_blank"
                                class="text-blue-600 hover:underline"
                            >
                                Lihat Bukti Pembayaran (PDF)
                            </a>
                        </div>
                    </div>

                    <!-- Upload Form -->
                    <form
                        v-if="canUpload"
                        @submit.prevent="submitPayment"
                        class="space-y-4"
                    >
                        <div class="space-y-2">
                            <Label>
                                {{ payment ? 'Upload Ulang Bukti Pembayaran' : 'Upload Bukti Pembayaran' }}
                            </Label>
                            <div class="flex items-center gap-4">
                                <label
                                    class="flex cursor-pointer items-center gap-2 rounded-lg border-2 border-dashed px-6 py-4 transition-colors hover:border-primary hover:bg-muted/50"
                                >
                                    <Upload class="size-5 text-muted-foreground" />
                                    <span class="text-sm text-muted-foreground">
                                        {{ paymentForm.payment_proof?.name || 'Pilih file...' }}
                                    </span>
                                    <Input
                                        type="file"
                                        accept="image/*,.pdf"
                                        class="hidden"
                                        @change="handlePaymentUpload"
                                    />
                                </label>
                            </div>
                            <p class="text-xs text-muted-foreground">
                                Format: JPG, PNG, PDF. Maksimal 2MB.
                            </p>
                            <p
                                v-if="paymentForm.errors.payment_proof"
                                class="text-sm text-red-500"
                            >
                                {{ paymentForm.errors.payment_proof }}
                            </p>
                        </div>

                        <Button
                            type="submit"
                            :disabled="!paymentForm.payment_proof || paymentForm.processing"
                        >
                            <Upload class="mr-2 size-4" />
                            {{ paymentForm.processing ? 'Mengupload...' : 'Upload Bukti Pembayaran' }}
                        </Button>
                    </form>
                </CardContent>
            </Card>
        </div>
    </AppLayout>
</template>
