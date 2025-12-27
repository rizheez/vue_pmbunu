<script setup lang="ts">
import { Button } from '@/components/ui/button';
import { Head, Link, usePage } from '@inertiajs/vue3';
import { ArrowLeft, Printer, UserPlus, FileText, Upload, GraduationCap, ShieldCheck, FileCheck, Lightbulb, AlertTriangle, CheckCircle, XCircle, Phone, Mail, ChevronDown, Rocket } from 'lucide-vue-next';
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
const page = usePage();




const steps = [
    {
        number: 1,
        icon: UserPlus,
        title: 'Registrasi Akun',
        desc: 'Buka website PMB, klik tombol "Daftar". Isi email aktif, nama lengkap, nomor WhatsApp aktif, dan password. Cek email untuk verifikasi dan aktifkan akun Anda.',
        warning: 'Penting: Gunakan Nomor WhatsApp Aktif! Informasi penting seperti status pendaftaran dan jadwal daftar ulang akan dikirim melalui WhatsApp.',
    },
    {
        number: 2,
        icon: FileText,
        title: 'Lengkapi Biodata',
        desc: 'Login ke akun Anda, lalu lengkapi data pribadi: NIK, NISN, tempat tanggal lahir, alamat lengkap, dan upload foto 4x6 latar merah.',
    },
    {
        number: 3,
        icon: Upload,
        title: 'Upload Dokumen',
        desc: 'Upload dokumen yang diperlukan: KTP, Kartu Keluarga, dan Ijazah/SKL. Format: PDF, JPG, atau PNG (maks 2MB).',
    },
    {
        number: 4,
        icon: GraduationCap,
        title: 'Pilih Program Studi',
        desc: 'Pilih jenis pendaftaran, jalur masuk, dan 2 pilihan program studi sesuai dengan minat dan bakat Anda.',
    },
    {
        number: 5,
        icon: ShieldCheck,
        title: 'Verifikasi & Daftar Ulang',
        desc: 'Tunggu proses verifikasi dari Tim PMB. Setelah dinyatakan lolos, Anda akan dihubungi untuk proses daftar ulang dan informasi selanjutnya.',
    },
];

const documents = ['Foto 4x6 latar merah', 'Scan/Foto KTP', 'Scan/Foto Kartu Keluarga', 'Scan/Foto Ijazah/SKL'];
const tips = ['Gunakan email aktif', 'Gunakan nomor WhatsApp aktif', 'Siapkan dokumen sebelum daftar', 'Pastikan foto jelas & terbaca', 'Isi data sesuai dokumen resmi', 'Simpan nomor WA panitia'];
const avoid = ['Email tidak aktif', 'Nomor WhatsApp tidak aktif', 'Upload foto blur/tidak jelas', 'Data tidak sesuai KTP', 'Lupa password akun', 'Tunggu deadline terlalu lama'];
</script>

<template>
    <Head title="Panduan Lengkap Pendaftaran" />

    <div class="min-h-screen bg-gray-50">
        <!-- Navbar -->
        <nav class="fixed top-0 left-0 right-0 bg-white/80 backdrop-blur-lg shadow-sm z-50">
            <div class="max-w-6xl mx-auto px-4 py-3 flex items-center justify-between">
                <Link href="/" class="flex items-center gap-2 text-gray-600 hover:text-teal-600">
                    <ArrowLeft class="size-5" />
                    <span>Kembali</span>
                </Link>
                <div class="flex items-center gap-2">
                    <img src="/assets/images/logo_unu.png" alt="Logo" class="h-8" />
                    <span class="font-bold text-teal-700 hidden md:block">PMB UNUKALTIM</span>
                </div>
                <Link href="/panduan" target="_blank" class="flex items-center gap-2 text-gray-600 hover:text-teal-600">
                    <Printer class="size-5" />
                    <span>Cetak</span>
                </Link>
            </div>
        </nav>

        <!-- Hero Section -->
        <!-- Hero Section -->
        <section class="auth-bg pt-24 pb-16 relative overflow-hidden text-white">
            <!-- Animated Background Squares -->
            <div class="area pointer-events-none absolute inset-0">
                <ul class="circles">
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>
            </div>

            <div class="relative z-10">
                <div class="absolute top-10 right-10 bg-amber-500 text-gray-900 px-6 py-2 rounded-full font-bold text-lg shadow-lg rotate-6">
                    ✨ GRATIS!
                </div>
                <div class="max-w-4xl mx-auto text-center px-4 mb-10">
                    <div class="inline-flex items-center gap-2 bg-white/20 rounded-full px-4 py-2 mb-6 backdrop-blur-sm">
                        <FileText class="size-5" />
                        <span>Panduan Lengkap</span>
                    </div>
                    <h1 class="text-4xl md:text-5xl font-bold mb-4 drop-shadow-md">Panduan Pendaftaran<br>Mahasiswa Baru</h1>
                    <p class="text-xl opacity-90 mb-6 drop-shadow-sm">Universitas Nahdlatul Ulama Kalimantan Timur</p>

                    <div v-if="activePeriod" class="inline-flex items-center gap-3 bg-white/20 backdrop-blur rounded-xl px-5 py-3 border border-white/20">
                        <div class="text-left">
                            <div class="font-semibold">{{ activePeriod.name }}</div>
                            <div class="text-sm opacity-90">{{ formatDate(activePeriod.start_date) }} - {{ formatDate(activePeriod.end_date) }}</div>
                        </div>
                    </div>
                </div>

                <div class="absolute left-1/2 -translate-x-1/2 animate-bounce">
                    <a href="#content" class="text-white hover:text-teal-200 transition">
                        <ChevronDown class="size-8" />
                    </a>
                </div>
            </div>
        </section>

        <!-- Main Content -->
        <main id="content" class="max-w-4xl mx-auto px-4 py-12">
            <div class="text-center mb-12">
                <h2 class="text-3xl font-bold text-gray-800 mb-2">Langkah-Langkah Pendaftaran</h2>
                <p class="text-gray-600">Ikuti 5 langkah mudah berikut untuk mendaftar</p>
            </div>

            <!-- Steps Timeline -->
            <div class="space-y-8 mb-16">
                <div v-for="step in steps" :key="step.number" class="flex gap-6">
                    <div class="shrink-0">
                        <div class="w-12 h-12 bg-gradient-to-br from-teal-500 to-teal-700 text-white rounded-full flex items-center justify-center font-bold text-xl shadow-lg">
                            {{ step.number }}
                        </div>
                    </div>
                    <div class="flex-1 bg-white rounded-xl shadow-sm border p-6">
                        <h3 class="text-xl font-bold text-gray-800 flex items-center gap-3 mb-3">
                            <component :is="step.icon" class="size-6 text-teal-600" />
                            {{ step.title }}
                        </h3>
                        <p class="text-gray-600">{{ step.desc }}</p>
                        <div v-if="step.warning" class="mt-4 p-4 bg-amber-50 border border-amber-300 rounded-lg">
                            <p class="font-semibold text-amber-800 flex items-center gap-2 text-sm">
                                <AlertTriangle class="size-4" />
                                {{ step.warning }}
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Info Cards -->
            <div class="grid md:grid-cols-3 gap-6 mb-16">
                <div class="bg-gradient-to-br from-teal-50 to-white border border-teal-200 rounded-xl p-6">
                    <div class="flex items-center gap-3 mb-4 pb-3 border-b border-teal-200">
                        <div class="w-10 h-10 bg-teal-500 text-white rounded-lg flex items-center justify-center">
                            <FileCheck class="size-5" />
                        </div>
                        <span class="font-bold text-gray-800">Dokumen Diperlukan</span>
                    </div>
                    <ul class="space-y-2">
                        <li v-for="doc in documents" :key="doc" class="flex items-center gap-2 text-gray-600 text-sm">
                            <CheckCircle class="size-4 text-teal-500" />
                            {{ doc }}
                        </li>
                    </ul>
                </div>

                <div class="bg-gradient-to-br from-green-50 to-white border border-green-200 rounded-xl p-6">
                    <div class="flex items-center gap-3 mb-4 pb-3 border-b border-green-200">
                        <div class="w-10 h-10 bg-green-500 text-white rounded-lg flex items-center justify-center">
                            <Lightbulb class="size-5" />
                        </div>
                        <span class="font-bold text-gray-800">Tips Sukses</span>
                    </div>
                    <ul class="space-y-2">
                        <li v-for="tip in tips" :key="tip" class="flex items-center gap-2 text-gray-600 text-sm">
                            <CheckCircle class="size-4 text-green-500" />
                            {{ tip }}
                        </li>
                    </ul>
                </div>

                <div class="bg-gradient-to-br from-red-50 to-white border border-red-200 rounded-xl p-6">
                    <div class="flex items-center gap-3 mb-4 pb-3 border-b border-red-200">
                        <div class="w-10 h-10 bg-red-500 text-white rounded-lg flex items-center justify-center">
                            <AlertTriangle class="size-5" />
                        </div>
                        <span class="font-bold text-gray-800">Yang Harus Dihindari</span>
                    </div>
                    <ul class="space-y-2">
                        <li v-for="item in avoid" :key="item" class="flex items-center gap-2 text-gray-600 text-sm">
                            <XCircle class="size-4 text-red-500" />
                            {{ item }}
                        </li>
                    </ul>
                </div>
            </div>

            <!-- QR Section -->
            <div class="bg-gradient-to-r from-teal-600 to-cyan-600 rounded-2xl p-8 mb-12 flex flex-col md:flex-row items-center gap-6 text-white">
                <div class="w-32 h-32 bg-white rounded-xl p-2 shadow-lg shrink-0">
                    <img src="/assets/images/qr-code-with-logo.png" alt="QR Code" class="w-full h-full object-contain" />
                </div>
                <div class="text-center md:text-left">
                    <h3 class="text-2xl font-bold mb-2">🌐 Daftar Sekarang!</h3>
                    <p class="opacity-90 mb-4">Scan QR Code dengan kamera HP atau kunjungi:</p>
                    <span class="inline-block bg-white/20 backdrop-blur px-6 py-2 rounded-lg font-bold text-lg">pmb.unukaltim.ac.id</span>
                </div>
            </div>

            <!-- Contact -->
            <div v-if="contactPhone || contactEmail" class="text-center mb-12">
                <h3 class="text-xl font-bold text-gray-800 mb-4">Butuh Bantuan?</h3>
                <div class="flex flex-wrap justify-center gap-4">
                    <a v-if="contactPhone" :href="`https://wa.me/${contactPhone.replace(/[^0-9]/g, '')}`" target="_blank" class="flex items-center gap-2 bg-green-500 text-white px-5 py-3 rounded-lg hover:bg-green-600 transition">
                        <Phone class="size-5" />
                        {{ contactPhone }}
                    </a>
                    <a v-if="contactEmail" :href="`mailto:${contactEmail}`" class="flex items-center gap-2 bg-blue-500 text-white px-5 py-3 rounded-lg hover:bg-blue-600 transition">
                        <Mail class="size-5" />
                        {{ contactEmail }}
                    </a>
                </div>
            </div>

            <!-- Warning -->
            <div class="bg-amber-50 border-2 border-amber-400 rounded-xl p-6 mb-12">
                <div class="flex items-center gap-3 mb-3">
                    <div class="w-10 h-10 bg-amber-500 text-white rounded-lg flex items-center justify-center">
                        <AlertTriangle class="size-5" />
                    </div>
                    <h4 class="font-bold text-amber-800">Catatan Penting</h4>
                </div>
                <ul class="space-y-2 text-amber-900">
                    <li class="md:flex md:items-center md:gap-2"><span>•</span> Pendaftaran <strong>GRATIS</strong>, tidak dipungut biaya apapun.</li>
                    <li class="md:flex md:items-center md:gap-2"><span>•</span> Panitia <strong>TIDAK PERNAH</strong> meminta transfer uang melalui WhatsApp/telepon.</li>
                    <li class="md:flex md:items-center md:gap-2"><span>•</span> Hubungi panitia resmi jika mengalami kendala teknis.</li>
                </ul>
            </div>

            <!-- CTA -->
            <div class="text-center bg-gradient-to-r from-teal-600 to-cyan-600 rounded-2xl p-10 text-white">
                <h3 class="text-2xl font-bold mb-2">Siap Untuk Mendaftar?</h3>
                <p class="opacity-90 mb-6">Mulai perjalanan akademikmu bersama UNU Kaltim!</p>
                <Button as-child size="lg" class="bg-white text-teal-700 hover:bg-gray-100">
                    <Link v-if="page.props.auth?.user" href="/student/dashboard" class="flex items-center gap-2">
                        <Rocket class="size-5" />
                        Lanjutkan Pendaftaran
                    </Link>
                    <Link v-else href="/register" class="flex items-center gap-2">
                        <UserPlus class="size-5" />
                        Daftar Sekarang
                    </Link>
                </Button>
            </div>
        </main>

        <!-- Footer -->
        <footer class="bg-gray-800 text-white text-center py-6">
            <p>© {{ new Date().getFullYear() }} Universitas Nahdlatul Ulama Kalimantan Timur</p>
        </footer>
    </div>
</template>

<style scoped>
.auth-bg {
    background: linear-gradient(to right, #0d9488, #0f766e, #334155);
}

.circles {
    position: absolute;
    inset: 0;
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
}

.circles li {
    position: absolute;
    list-style: none;
    display: block;
    background: rgba(255, 255, 255, 0.2);
    width: 20px;
    height: 20px;
    bottom: -150px;
    animation: animate 25s linear infinite;
    border-radius: 50%;
}

.circles li:nth-child(1) { left: 25%; width: 80px; height: 80px; animation-duration: 25s; }
.circles li:nth-child(2) { left: 10%; width: 20px; height: 20px; animation-duration: 12s; animation-delay: 2s; }
.circles li:nth-child(3) { left: 70%; width: 20px; height: 20px; animation-duration: 25s; animation-delay: 4s; }
.circles li:nth-child(4) { left: 40%; width: 60px; height: 60px; animation-duration: 18s; animation-delay: 0s; }
.circles li:nth-child(5) { left: 65%; width: 20px; height: 20px; animation-duration: 25s; animation-delay: 0s; }
.circles li:nth-child(6) { left: 75%; width: 110px; height: 110px; animation-duration: 25s; animation-delay: 3s; }
.circles li:nth-child(7) { left: 35%; width: 150px; height: 150px; animation-duration: 25s; animation-delay: 7s; }
.circles li:nth-child(8) { left: 50%; width: 25px; height: 25px; animation-duration: 45s; animation-delay: 15s; }
.circles li:nth-child(9) { left: 20%; width: 15px; height: 15px; animation-duration: 35s; animation-delay: 2s; }
.circles li:nth-child(10) { left: 85%; width: 150px; height: 150px; animation-duration: 11s; animation-delay: 0s; }

@keyframes animate {
    0% { transform: translateY(0) rotate(0deg); opacity: 1; }
    100% { transform: translateY(-1000px) rotate(720deg); opacity: 0; }
}
</style>
