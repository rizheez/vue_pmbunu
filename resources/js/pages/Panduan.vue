<script setup lang="ts">
import { Button } from '@/components/ui/button';
import { Head } from '@inertiajs/vue3';
import { Printer, FileText, Phone, Mail, AlertTriangle, CheckCircle, XCircle, Lightbulb } from 'lucide-vue-next';
import { formatDate } from '@/composables/useFormat';

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
    <Button
        @click="printPage"
        class="fixed top-5 right-5 z-50 print:hidden"
    >
        <Printer class="size-4 mr-2" />
        Cetak Poster
    </Button>

    <div class="min-h-screen bg-white print:bg-white">
        <!-- A4 Container -->
        <div class="w-[210mm] mx-auto bg-white relative overflow-hidden print:w-full">
            <!-- Header -->
            <div class="bg-gradient-to-r from-teal-600 via-teal-700 to-cyan-700 text-white px-8 py-6 relative">
                <div class="flex items-center gap-6 relative z-10">
                    <div class="w-20 h-20 bg-white rounded-lg p-2 shadow-lg">
                        <img src="/assets/images/logo_unu.png" alt="Logo UNU" class="w-full h-full object-contain" />
                    </div>
                    <div>
                        <h1 class="text-2xl font-bold uppercase tracking-wide">Panduan Pendaftaran Mahasiswa Baru</h1>
                        <p class="text-lg opacity-95">Universitas Nahdlatul Ulama Kalimantan Timur</p>
                    </div>
                </div>
                <div class="absolute right-8 top-1/2 -translate-y-1/2 -rotate-6 bg-amber-500 text-gray-900 px-5 py-2 rounded-lg font-bold text-lg shadow-lg">
                    GRATIS!
                </div>
            </div>

            <!-- Period Banner -->
            <div v-if="activePeriod" class="bg-gradient-to-r from-amber-500 to-amber-400 text-gray-900 text-center py-3 font-semibold">
                📅 <strong>Periode Pendaftaran:</strong> {{ activePeriod.name }}
                ({{ formatDate(activePeriod.start_date) }} - {{ formatDate(activePeriod.end_date) }})
            </div>

            <!-- Main Content -->
            <div class="p-6">
                <!-- Steps Section -->
                <div class="text-center mb-5">
                    <h2 class="text-xl font-bold text-teal-600 inline-flex items-center gap-3">
                        <span class="w-12 h-1 bg-gradient-to-r from-transparent to-teal-500 rounded"></span>
                        Langkah Pendaftaran
                        <span class="w-12 h-1 bg-gradient-to-l from-transparent to-teal-500 rounded"></span>
                    </h2>
                </div>

                <div class="grid grid-cols-2 gap-3 mb-5">
                    <div
                        v-for="step in steps"
                        :key="step.number"
                        :class="[
                            'rounded-lg p-4 border',
                            step.highlight
                                ? 'col-span-2 bg-gradient-to-br from-teal-50 to-cyan-50 border-teal-300'
                                : 'bg-gradient-to-br from-gray-50 to-white border-gray-200'
                        ]"
                    >
                        <div class="flex items-center gap-3 mb-2">
                            <div class="w-8 h-8 bg-gradient-to-br from-teal-500 to-teal-700 text-white rounded-full flex items-center justify-center font-bold text-sm shadow">
                                {{ step.number }}
                            </div>
                            <h3 class="font-bold text-gray-800">{{ step.title }}</h3>
                        </div>
                        <p class="text-sm text-gray-600 pl-11">{{ step.desc }}</p>
                    </div>
                </div>

                <!-- Info Cards -->
                <div class="grid grid-cols-3 gap-3 mb-5">
                    <!-- Documents -->
                    <div class="bg-gradient-to-br from-teal-50 to-white border border-teal-200 rounded-lg p-3">
                        <div class="flex items-center gap-2 mb-2 pb-2 border-b border-gray-200">
                            <div class="w-6 h-6 bg-teal-500 text-white rounded flex items-center justify-center">
                                <FileText class="size-4" />
                            </div>
                            <span class="font-bold text-sm text-gray-800">Dokumen Diperlukan</span>
                        </div>
                        <ul class="text-xs space-y-1">
                            <li v-for="doc in documents" :key="doc" class="flex items-center gap-2 text-gray-600">
                                <CheckCircle class="size-3 text-teal-500" />
                                {{ doc }}
                            </li>
                        </ul>
                    </div>

                    <!-- Tips -->
                    <div class="bg-gradient-to-br from-green-50 to-white border border-green-200 rounded-lg p-3">
                        <div class="flex items-center gap-2 mb-2 pb-2 border-b border-gray-200">
                            <div class="w-6 h-6 bg-green-500 text-white rounded flex items-center justify-center">
                                <Lightbulb class="size-4" />
                            </div>
                            <span class="font-bold text-sm text-gray-800">Tips Sukses</span>
                        </div>
                        <ul class="text-xs space-y-1">
                            <li v-for="tip in tips" :key="tip" class="flex items-center gap-2 text-gray-600">
                                <CheckCircle class="size-3 text-green-500" />
                                {{ tip }}
                            </li>
                        </ul>
                    </div>

                    <!-- Avoid -->
                    <div class="bg-gradient-to-br from-red-50 to-white border border-red-200 rounded-lg p-3">
                        <div class="flex items-center gap-2 mb-2 pb-2 border-b border-gray-200">
                            <div class="w-6 h-6 bg-red-500 text-white rounded flex items-center justify-center">
                                <AlertTriangle class="size-4" />
                            </div>
                            <span class="font-bold text-sm text-gray-800">Yang Harus Dihindari</span>
                        </div>
                        <ul class="text-xs space-y-1">
                            <li v-for="item in avoid" :key="item" class="flex items-center gap-2 text-gray-600">
                                <XCircle class="size-3 text-red-500" />
                                {{ item }}
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- QR Section -->
                <div class="bg-gradient-to-r from-teal-600 to-cyan-600 rounded-lg p-5 mb-4 flex gap-4">
                    <div class="w-24 h-24 bg-white rounded-lg p-1.5 shadow-lg shrink-0">
                        <img src="/assets/images/qr-code-with-logo.png" alt="QR Code" class="w-full h-full object-contain" />
                    </div>
                    <div class="text-white">
                        <h3 class="text-lg font-bold mb-1">🌐 Daftar Sekarang!</h3>
                        <p class="text-sm opacity-90 mb-2">Scan QR Code dengan kamera HP atau kunjungi:</p>
                        <span class="inline-block bg-white/20 px-4 py-2 rounded-lg font-bold backdrop-blur">pmb.unukaltim.ac.id</span>
                    </div>
                </div>

                <!-- Contact -->
                <div class="flex justify-center gap-5 mb-4">
                    <div v-if="contactPhone" class="flex items-center gap-2 bg-gray-100 px-4 py-2 rounded-lg text-sm">
                        <Phone class="size-4 text-teal-600" />
                        <span><strong class="text-teal-600">WhatsApp:</strong> {{ contactPhone }}</span>
                    </div>
                    <div v-if="contactEmail" class="flex items-center gap-2 bg-gray-100 px-4 py-2 rounded-lg text-sm">
                        <Mail class="size-4 text-teal-600" />
                        <span><strong class="text-teal-600">Email:</strong> {{ contactEmail }}</span>
                    </div>
                </div>

                <!-- Warning Box -->
                <div class="bg-gradient-to-br from-amber-100 to-amber-50 border-2 border-amber-400 rounded-lg p-4 relative">
                    <span class="absolute -top-3 left-4 bg-white px-2 text-lg">⚠️</span>
                    <h4 class="font-bold text-amber-800 text-sm mb-2">Catatan Penting:</h4>
                    <div class="flex flex-wrap gap-x-6 gap-y-1 text-xs text-amber-900">
                        <span class="flex items-center gap-1">• Pendaftaran <strong>GRATIS</strong>, tidak dipungut biaya</span>
                        <span class="flex items-center gap-1">• Panitia <strong>TIDAK PERNAH</strong> meminta transfer uang</span>
                        <span class="flex items-center gap-1">• Hubungi panitia resmi jika mengalami kendala</span>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <div class="bg-gray-800 text-white text-center py-3 text-sm">
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
