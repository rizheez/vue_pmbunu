<script setup lang="ts">
import { Button } from '@/components/ui/button';
import { formatDate } from '@/composables/useFormat';
import { Head } from '@inertiajs/vue3';
import {
    AlertTriangle,
    CheckCircle,
    FileText,
    Lightbulb,
    Mail,
    Phone,
    Printer,
    XCircle,
} from 'lucide-vue-next';

interface Period {
    name: string;
    start_date: string;
    end_date: string;
}

interface Props {
    activePeriod: Period | null;
    contactPhone: string | null;
    contactEmail: string | null;
}

defineProps<Props>();

const printPage = () => {
    window.print();
};

const steps = [
    {
        number: 1,
        title: 'Registrasi Akun',
        desc: 'Buka website PMB, klik "Daftar". Isi email aktif, nama, nomor WhatsApp aktif, dan password. Verifikasi email melalui link yang dikirim.',
    },
    {
        number: 2,
        title: 'Lengkapi Biodata',
        desc: 'Login, lengkapi data pribadi: NIK, NISN, TTL, alamat, dan upload foto 4x6 latar merah.',
    },
    {
        number: 3,
        title: 'Upload Dokumen',
        desc: 'Upload KTP, Kartu Keluarga, dan Ijazah/SKL. Format: PDF/JPG/PNG, maks 2MB.',
    },
    {
        number: 4,
        title: 'Pilih Program Studi',
        desc: 'Pilih jenis pendaftaran, jalur masuk, dan 2 pilihan prodi sesuai minat Anda.',
    },
    {
        number: 5,
        title: 'Verifikasi & Daftar Ulang',
        desc: 'Tunggu verifikasi Tim PMB. Setelah lolos, Anda akan dihubungi untuk proses daftar ulang dan pembayaran UKT.',
        highlight: true,
    },
];

const documents = [
    'Foto 4x6 latar merah',
    'Scan/Foto KTP',
    'Scan/Foto Kartu Keluarga',
    'Scan/Foto Ijazah/SKL',
];

const tips = [
    'Gunakan email aktif',
    'Gunakan nomor WA aktif',
    'Siapkan dokumen sebelum daftar',
    'Pastikan foto jelas & terbaca',
    'Isi data sesuai dokumen resmi',
    'Simpan nomor WA panitia',
];

const avoid = [
    'Menggunakan email tidak aktif',
    'Nomor WA tidak aktif',
    'Upload foto blur/tidak jelas',
    'Isi data tidak sesuai KTP',
    'Lupa password akun',
    'Tunggu deadline terlalu lama',
];
</script>

<template>
    <Head title="Panduan Pendaftaran" />

    <!-- Print Button -->
    <Button @click="printPage" class="fixed top-5 right-5 z-50 print:hidden">
        <Printer class="mr-2 size-4" />
        Cetak Poster
    </Button>

    <div class="min-h-screen bg-white print:bg-white">
        <!-- A4 Container -->
        <div
            class="relative mx-auto w-[210mm] overflow-hidden bg-white print:w-full"
        >
            <!-- Header -->
            <div
                class="relative bg-gradient-to-r from-teal-600 via-teal-700 to-cyan-700 px-8 py-6 text-white"
            >
                <div class="relative z-10 flex items-center gap-6">
                    <div class="h-20 w-20 rounded-lg bg-white p-2 shadow-lg">
                        <img
                            src="/assets/images/logo_unu.png"
                            alt="Logo UNU"
                            class="h-full w-full object-contain"
                        />
                    </div>
                    <div>
                        <h1 class="text-2xl font-bold tracking-wide uppercase">
                            Panduan Pendaftaran Mahasiswa Baru
                        </h1>
                        <p class="text-lg opacity-95">
                            Universitas Nahdlatul Ulama Kalimantan Timur
                        </p>
                    </div>
                </div>
                <!-- <div class="absolute right-8 top-1/2 -translate-y-1/2 -rotate-6 bg-amber-500 text-gray-900 px-5 py-2 rounded-lg font-bold text-lg shadow-lg">
                    GRATIS!
                </div> -->
            </div>

            <!-- Period Banner -->
            <div
                v-if="activePeriod"
                class="bg-gradient-to-r from-amber-500 to-amber-400 py-3 text-center font-semibold text-gray-900"
            >
                📅 <strong>Periode Pendaftaran:</strong>
                {{ activePeriod.name }} ({{
                    formatDate(activePeriod.start_date)
                }}
                - {{ formatDate(activePeriod.end_date) }})
            </div>

            <!-- Main Content -->
            <div class="p-6">
                <!-- Steps Section -->
                <div class="mb-5 text-center">
                    <h2
                        class="inline-flex items-center gap-3 text-xl font-bold text-teal-600"
                    >
                        <span
                            class="h-1 w-12 rounded bg-gradient-to-r from-transparent to-teal-500"
                        ></span>
                        Langkah Pendaftaran
                        <span
                            class="h-1 w-12 rounded bg-gradient-to-l from-transparent to-teal-500"
                        ></span>
                    </h2>
                </div>

                <div class="mb-5 grid grid-cols-2 gap-3">
                    <div
                        v-for="step in steps"
                        :key="step.number"
                        :class="[
                            'rounded-lg border p-4',
                            step.highlight
                                ? 'col-span-2 border-teal-300 bg-gradient-to-br from-teal-50 to-cyan-50'
                                : 'border-gray-200 bg-gradient-to-br from-gray-50 to-white',
                        ]"
                    >
                        <div class="mb-2 flex items-center gap-3">
                            <div
                                class="flex h-8 w-8 items-center justify-center rounded-full bg-gradient-to-br from-teal-500 to-teal-700 text-sm font-bold text-white shadow"
                            >
                                {{ step.number }}
                            </div>
                            <h3 class="font-bold text-gray-800">
                                {{ step.title }}
                            </h3>
                        </div>
                        <p class="pl-11 text-sm text-gray-600">
                            {{ step.desc }}
                        </p>
                    </div>
                </div>

                <!-- Info Cards -->
                <div class="mb-5 grid grid-cols-3 gap-3">
                    <!-- Documents -->
                    <div
                        class="rounded-lg border border-teal-200 bg-gradient-to-br from-teal-50 to-white p-3"
                    >
                        <div
                            class="mb-2 flex items-center gap-2 border-b border-gray-200 pb-2"
                        >
                            <div
                                class="flex h-6 w-6 items-center justify-center rounded bg-teal-500 text-white"
                            >
                                <FileText class="size-4" />
                            </div>
                            <span class="text-sm font-bold text-gray-800"
                                >Dokumen Diperlukan</span
                            >
                        </div>
                        <ul class="space-y-1 text-xs">
                            <li
                                v-for="doc in documents"
                                :key="doc"
                                class="flex items-center gap-2 text-gray-600"
                            >
                                <CheckCircle class="size-3 text-teal-500" />
                                {{ doc }}
                            </li>
                        </ul>
                    </div>

                    <!-- Tips -->
                    <div
                        class="rounded-lg border border-green-200 bg-gradient-to-br from-green-50 to-white p-3"
                    >
                        <div
                            class="mb-2 flex items-center gap-2 border-b border-gray-200 pb-2"
                        >
                            <div
                                class="flex h-6 w-6 items-center justify-center rounded bg-green-500 text-white"
                            >
                                <Lightbulb class="size-4" />
                            </div>
                            <span class="text-sm font-bold text-gray-800"
                                >Tips Sukses</span
                            >
                        </div>
                        <ul class="space-y-1 text-xs">
                            <li
                                v-for="tip in tips"
                                :key="tip"
                                class="flex items-center gap-2 text-gray-600"
                            >
                                <CheckCircle class="size-3 text-green-500" />
                                {{ tip }}
                            </li>
                        </ul>
                    </div>

                    <!-- Avoid -->
                    <div
                        class="rounded-lg border border-red-200 bg-gradient-to-br from-red-50 to-white p-3"
                    >
                        <div
                            class="mb-2 flex items-center gap-2 border-b border-gray-200 pb-2"
                        >
                            <div
                                class="flex h-6 w-6 items-center justify-center rounded bg-red-500 text-white"
                            >
                                <AlertTriangle class="size-4" />
                            </div>
                            <span class="text-sm font-bold text-gray-800"
                                >Yang Harus Dihindari</span
                            >
                        </div>
                        <ul class="space-y-1 text-xs">
                            <li
                                v-for="item in avoid"
                                :key="item"
                                class="flex items-center gap-2 text-gray-600"
                            >
                                <XCircle class="size-3 text-red-500" />
                                {{ item }}
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- QR Section -->
                <div
                    class="mb-4 flex gap-4 rounded-lg bg-gradient-to-r from-teal-600 to-cyan-600 p-5"
                >
                    <div
                        class="h-24 w-24 shrink-0 rounded-lg bg-white p-1.5 shadow-lg"
                    >
                        <img
                            src="/assets/images/qr-code-with-logo.png"
                            alt="QR Code"
                            class="h-full w-full object-contain"
                        />
                    </div>
                    <div class="text-white">
                        <h3 class="mb-1 text-lg font-bold">
                            🌐 Daftar Sekarang!
                        </h3>
                        <p class="mb-2 text-sm opacity-90">
                            Scan QR Code dengan kamera HP atau kunjungi:
                        </p>
                        <span
                            class="inline-block rounded-lg bg-white/20 px-4 py-2 font-bold backdrop-blur"
                            >pmb.unukaltim.ac.id</span
                        >
                    </div>
                </div>

                <!-- Contact -->
                <div class="mb-4 flex justify-center gap-5">
                    <div
                        v-if="contactPhone"
                        class="flex items-center gap-2 rounded-lg bg-gray-100 px-4 py-2 text-sm"
                    >
                        <Phone class="size-4 text-teal-600" />
                        <span
                            ><strong class="text-teal-600">WhatsApp:</strong>
                            {{ contactPhone }}</span
                        >
                    </div>
                    <div
                        v-if="contactEmail"
                        class="flex items-center gap-2 rounded-lg bg-gray-100 px-4 py-2 text-sm"
                    >
                        <Mail class="size-4 text-teal-600" />
                        <span
                            ><strong class="text-teal-600">Email:</strong>
                            {{ contactEmail }}</span
                        >
                    </div>
                </div>

                <!-- Warning Box -->
                <div
                    class="relative rounded-lg border-2 border-amber-400 bg-gradient-to-br from-amber-100 to-amber-50 p-4"
                >
                    <span class="absolute -top-3 left-4 bg-white px-2 text-lg"
                        >⚠️</span
                    >
                    <h4 class="mb-2 text-sm font-bold text-amber-800">
                        Catatan Penting:
                    </h4>
                    <div
                        class="flex flex-wrap gap-x-6 gap-y-1 text-xs text-amber-900"
                    >
                        <span class="flex items-center gap-1"
                            >• Pendaftaran <strong>GRATIS</strong>, tidak
                            dipungut biaya</span
                        >
                        <span class="flex items-center gap-1"
                            >• Panitia <strong>TIDAK PERNAH</strong> meminta
                            transfer uang</span
                        >
                        <span class="flex items-center gap-1"
                            >• Hubungi panitia resmi jika mengalami
                            kendala</span
                        >
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <div class="bg-gray-800 py-3 text-center text-sm text-white">
                Universitas Nahdlatul Ulama Kalimantan Timur
            </div>
        </div>
    </div>
</template>

<style>
@media print {
    @page {
        size: A4;
        margin: 0;
    }
    body {
        print-color-adjust: exact;
        -webkit-print-color-adjust: exact;
    }
}
</style>
