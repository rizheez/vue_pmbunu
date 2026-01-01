<script setup lang="ts">
import { Alert, AlertDescription } from '@/components/ui/alert';
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
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from '@/components/ui/select';
import { Textarea } from '@/components/ui/textarea';
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, useForm, usePage } from '@inertiajs/vue3';
import { CheckCircle, CreditCard, Save } from 'lucide-vue-next';
import { computed } from 'vue';

interface Props {
    settings: Record<string, string>;
}

const props = defineProps<Props>();
const page = usePage();

const flash = computed(() => page.props.flash as { success?: string });

const form = useForm({
    payment_type: props.settings.payment_type || 'bank_transfer',
    payment_bank_name: props.settings.payment_bank_name || '',
    payment_account_number: props.settings.payment_account_number || '',
    payment_account_name: props.settings.payment_account_name || '',
    payment_amount: props.settings.payment_amount || '300000',
    payment_instructions: props.settings.payment_instructions || '',
});

const submit = () => {
    form.post('/admin/payment-settings', {
        preserveScroll: true,
    });
};

const breadcrumbs = [
    { title: 'Admin Dashboard', href: '/admin/dashboard' },
    { title: 'Pengaturan Pembayaran', href: '/admin/payment-settings' },
];
</script>

<template>
    <Head title="Pengaturan Pembayaran" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="flex flex-col gap-6 p-4">
            <div>
                <h1 class="text-2xl font-bold">Pengaturan Pembayaran</h1>
                <p class="text-sm text-muted-foreground">
                    Kelola informasi rekening bank untuk pembayaran daftar ulang
                </p>
            </div>

            <Alert
                v-if="flash?.success"
                class="border-green-500 bg-green-50 dark:border-green-800 dark:bg-green-950/30"
            >
                <CheckCircle class="size-4 text-green-600" />
                <AlertDescription class="text-green-700 dark:text-green-400">
                    {{ flash.success }}
                </AlertDescription>
            </Alert>

            <Card>
                <CardHeader>
                    <CardTitle class="flex items-center gap-2">
                        <CreditCard class="size-5" />
                        Informasi Rekening Bank
                    </CardTitle>
                    <CardDescription>
                        Informasi ini akan ditampilkan kepada mahasiswa pada halaman pembayaran daftar ulang
                    </CardDescription>
                </CardHeader>
                <CardContent>
                    <form @submit.prevent="submit" class="space-y-6">
                        <!-- Payment Type -->
                        <div class="space-y-2">
                            <Label for="payment_type">
                                Tipe Pembayaran <span class="text-red-500">*</span>
                            </Label>
                            <Select v-model="form.payment_type">
                                <SelectTrigger id="payment_type">
                                    <SelectValue placeholder="Pilih tipe pembayaran" />
                                </SelectTrigger>
                                <SelectContent>
                                    <SelectItem value="bank_transfer">Transfer Bank</SelectItem>
                                    <SelectItem value="va">Virtual Account (VA)</SelectItem>
                                </SelectContent>
                            </Select>
                            <p class="text-xs text-muted-foreground">
                                Pilih tipe pembayaran untuk menampilkan format yang sesuai
                            </p>
                            <p
                                v-if="form.errors.payment_type"
                                class="text-sm text-red-500"
                            >
                                {{ form.errors.payment_type }}
                            </p>
                        </div>

                        <div class="grid gap-4 md:grid-cols-2">
                            <div class="space-y-2">
                                <Label for="payment_bank_name">
                                    {{ form.payment_type === 'va' ? 'Nama Bank VA' : 'Nama Bank' }}
                                    <span class="text-red-500">*</span>
                                </Label>
                                <Input
                                    id="payment_bank_name"
                                    v-model="form.payment_bank_name"
                                    :placeholder="form.payment_type === 'va' ? 'Contoh: BRI, BNI, BSI, BCA' : 'Contoh: BRI, BNI'"
                                />
                                <p
                                    v-if="form.errors.payment_bank_name"
                                    class="text-sm text-red-500"
                                >
                                    {{ form.errors.payment_bank_name }}
                                </p>
                            </div>

                            <div class="space-y-2">
                                <Label for="payment_account_number">
                                    {{ form.payment_type === 'va' ? 'Nomor Virtual Account' : 'Nomor Rekening' }}
                                    <span class="text-red-500">*</span>
                                </Label>
                                <Input
                                    id="payment_account_number"
                                    v-model="form.payment_account_number"
                                    :placeholder="form.payment_type === 'va' ? 'Contoh: 88810012345678' : 'Contoh: 0123-4567-8901-2345'"
                                />
                                <p
                                    v-if="form.errors.payment_account_number"
                                    class="text-sm text-red-500"
                                >
                                    {{ form.errors.payment_account_number }}
                                </p>
                            </div>

                            <div class="space-y-2">
                                <Label for="payment_account_name">
                                    Nama Pemilik Rekening <span class="text-red-500">*</span>
                                </Label>
                                <Input
                                    id="payment_account_name"
                                    v-model="form.payment_account_name"
                                    placeholder="Contoh: Universitas Nahdlatul Ulama"
                                />
                                <p
                                    v-if="form.errors.payment_account_name"
                                    class="text-sm text-red-500"
                                >
                                    {{ form.errors.payment_account_name }}
                                </p>
                            </div>

                            <div class="space-y-2">
                                <Label for="payment_amount">
                                    Jumlah Pembayaran (Rp) <span class="text-red-500">*</span>
                                </Label>
                                <Input
                                    id="payment_amount"
                                    v-model="form.payment_amount"
                                    type="number"
                                    min="0"
                                    placeholder="300000"
                                />
                                <p
                                    v-if="form.errors.payment_amount"
                                    class="text-sm text-red-500"
                                >
                                    {{ form.errors.payment_amount }}
                                </p>
                            </div>
                        </div>

                        <div class="space-y-2">
                            <Label for="payment_instructions">
                                Instruksi Tambahan
                            </Label>
                            <Textarea
                                id="payment_instructions"
                                v-model="form.payment_instructions"
                                rows="3"
                                placeholder="Instruksi tambahan untuk mahasiswa (opsional)"
                            />
                            <p class="text-xs text-muted-foreground">
                                Contoh: Pastikan transfer sesuai nominal. Simpan bukti transfer.
                            </p>
                        </div>

                        <div class="flex justify-end">
                            <Button type="submit" :disabled="form.processing">
                                <Save class="mr-2 size-4" />
                                {{ form.processing ? 'Menyimpan...' : 'Simpan Pengaturan' }}
                            </Button>
                        </div>
                    </form>
                </CardContent>
            </Card>
        </div>
    </AppLayout>
</template>
