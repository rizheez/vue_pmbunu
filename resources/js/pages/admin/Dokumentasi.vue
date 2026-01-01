<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import { Head } from '@inertiajs/vue3';
import { UserPlus, Calendar, FileCheck, Lightbulb, Info, AlertTriangle, CheckCircle, XCircle, HelpCircle, CreditCard, GraduationCap, Settings, ClipboardEdit } from 'lucide-vue-next';
import { ref } from 'vue';

interface BreadcrumbItem {
    title: string;
    href: string;
}

const breadcrumbs: BreadcrumbItem[] = [
    { title: 'Dokumentasi', href: '' },
];

const faqs = ref([
    {
        question: 'Bagaimana jika lupa password admin?',
        answer: 'Hubungi IT Support untuk reset password. Hanya IT Support yang bisa mengelola akun admin.',
        open: false,
    },
    {
        question: 'Apakah bisa mengaktifkan 2 periode sekaligus?',
        answer: 'Tidak bisa. Sistem hanya mengizinkan 1 periode aktif dalam satu waktu untuk menghindari konflik data.',
        open: false,
    },
    {
        question: 'Bagaimana cara menghapus data mahasiswa?',
        answer: 'Saat ini sistem tidak menyediakan fitur hapus untuk menjaga integritas data. Jika ada masalah, hubungi IT Support.',
        open: false,
    },
    {
        question: 'Apa yang harus dilakukan jika email tidak terkirim?',
        answer: 'Pastikan email yang diinput benar. Jika masih bermasalah, cek spam folder atau hubungi IT support untuk cek konfigurasi email server.',
        open: false,
    },
    {
        question: 'Kapan NIM bisa digenerate?',
        answer: 'NIM hanya bisa digenerate setelah status mahasiswa "Daftar Ulang Terverifikasi" (pembayaran sudah diverifikasi). Pastikan prodi sudah memiliki kode NIM.',
        open: false,
    },
    {
        question: 'Apa bedanya Transfer Bank dan Virtual Account?',
        answer: 'Transfer Bank menampilkan format "Transfer ke: Bank XXX: XXXX", sedangkan VA menampilkan format "Nomor Pembayaran / VA: Virtual Account XXX: XXXX".',
        open: false,
    },
]);
</script>

<template>
    <Head title="Dokumentasi Sistem" />
    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="space-y-6 p-6">
            <!-- Header -->
            <div>
                <h2 class="text-2xl font-bold text-gray-900">📚 Dokumentasi & Panduan Sistem PMB</h2>
                <p class="text-gray-500 mt-1">Panduan lengkap penggunaan sistem untuk staf admin</p>
            </div>

            <!-- Quick Links -->
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
                <a href="#pendaftaran" class="bg-white rounded-lg shadow p-5 hover:shadow-md hover:bg-gray-50 transition flex items-center gap-4">
                    <UserPlus class="size-6 text-teal-600" />
                    <div>
                        <p class="text-sm text-gray-500">Pendaftaran</p>
                        <p class="font-semibold text-gray-900">Manual</p>
                    </div>
                </a>
                <a href="#periode" class="bg-white rounded-lg shadow p-5 hover:shadow-md hover:bg-gray-50 transition flex items-center gap-4">
                    <Calendar class="size-6 text-blue-600" />
                    <div>
                        <p class="text-sm text-gray-500">Periode</p>
                        <p class="font-semibold text-gray-900">Pendaftaran</p>
                    </div>
                </a>
                <a href="#verifikasi" class="bg-white rounded-lg shadow p-5 hover:shadow-md hover:bg-gray-50 transition flex items-center gap-4">
                    <FileCheck class="size-6 text-green-600" />
                    <div>
                        <p class="text-sm text-gray-500">Verifikasi</p>
                        <p class="font-semibold text-gray-900">Dokumen</p>
                    </div>
                </a>
                <a href="#daftar-ulang-manual" class="bg-white rounded-lg shadow p-5 hover:shadow-md hover:bg-gray-50 transition flex items-center gap-4">
                    <ClipboardEdit class="size-6 text-orange-600" />
                    <div>
                        <p class="text-sm text-gray-500">Daftar Ulang</p>
                        <p class="font-semibold text-gray-900">Manual</p>
                    </div>
                </a>
                <a href="#pembayaran" class="bg-white rounded-lg shadow p-5 hover:shadow-md hover:bg-gray-50 transition flex items-center gap-4">
                    <CreditCard class="size-6 text-purple-600" />
                    <div>
                        <p class="text-sm text-gray-500">Verifikasi</p>
                        <p class="font-semibold text-gray-900">Pembayaran</p>
                    </div>
                </a>
                <a href="#nim" class="bg-white rounded-lg shadow p-5 hover:shadow-md hover:bg-gray-50 transition flex items-center gap-4">
                    <GraduationCap class="size-6 text-indigo-600" />
                    <div>
                        <p class="text-sm text-gray-500">Generate</p>
                        <p class="font-semibold text-gray-900">NIM</p>
                    </div>
                </a>
                <a href="#pengaturan" class="bg-white rounded-lg shadow p-5 hover:shadow-md hover:bg-gray-50 transition flex items-center gap-4">
                    <Settings class="size-6 text-gray-600" />
                    <div>
                        <p class="text-sm text-gray-500">Pengaturan</p>
                        <p class="font-semibold text-gray-900">Pembayaran</p>
                    </div>
                </a>
                <a href="#tips" class="bg-white rounded-lg shadow p-5 hover:shadow-md hover:bg-gray-50 transition flex items-center gap-4">
                    <Lightbulb class="size-6 text-yellow-600" />
                    <div>
                        <p class="text-sm text-gray-500">Tips &</p>
                        <p class="font-semibold text-gray-900">Trik</p>
                    </div>
                </a>
            </div>

            <!-- Info Banner -->
            <div class="bg-teal-50 border-l-4 border-teal-400 p-4 flex items-start gap-3">
                <Info class="size-5 text-teal-500 shrink-0 mt-0.5" />
                <p class="text-sm text-teal-700"><strong>Butuh Bantuan?</strong> Jika ada pertanyaan yang belum terjawab, hubungi IT Support atau Admin Sistem.</p>
            </div>

            <!-- Main Documentation -->
            <div class="bg-white shadow rounded-lg p-6 space-y-10">
                <!-- 1. Pendaftaran Manual -->
                <div id="pendaftaran">
                    <h3 class="text-xl font-bold text-gray-900 flex items-center gap-3 mb-4">
                        <span class="bg-teal-100 text-teal-800 rounded-full w-8 h-8 flex items-center justify-center text-sm">1</span>
                        Pendaftaran Manual Calon Mahasiswa
                    </h3>
                    <p class="text-gray-600 mb-4">Fitur ini digunakan untuk membantu calon mahasiswa yang kesulitan mendaftar secara online.</p>

                    <div class="bg-blue-50 border-l-4 border-blue-400 p-4 mb-4 flex items-start gap-3">
                        <Info class="size-5 text-blue-500 shrink-0" />
                        <p class="text-sm text-blue-700"><strong>Penting:</strong> Pastikan periode pendaftaran sedang aktif sebelum mendaftarkan calon mahasiswa.</p>
                    </div>

                    <h4 class="font-semibold text-gray-900 mb-3">Langkah-langkah:</h4>
                    <ol class="list-decimal list-inside space-y-2 text-gray-700">
                        <li>Klik menu <strong>"Daftarkan Manual"</strong> di sidebar</li>
                        <li>Isi semua data yang diperlukan:
                            <ul class="list-disc list-inside ml-6 mt-2 space-y-1 text-gray-600">
                                <li><strong>Data Akun:</strong> Email dan Nomor Telepon</li>
                                <li><strong>Data Pribadi:</strong> Nama, NIK, NISN, Jenis Kelamin, dll</li>
                                <li><strong>Dokumen:</strong> Upload Foto, KTP, KK, dan Ijazah (opsional)</li>
                                <li><strong>Pendaftaran:</strong> Pilih jenis, jalur, dan program studi</li>
                                <li><strong>Referral:</strong> Dari mana calon mahasiswa tahu info PMB</li>
                            </ul>
                        </li>
                        <li>Klik tombol <strong>"Daftarkan Mahasiswa"</strong></li>
                        <li>Sistem akan otomatis:
                            <ul class="list-disc list-inside ml-6 mt-2 space-y-1 text-gray-600">
                                <li>Membuat akun dengan password default: <code class="bg-gray-100 px-2 py-1 rounded text-sm">pmbunukaltim</code></li>
                                <li>Mengirim email berisi kredensial login ke calon mahasiswa</li>
                                <li>Status pendaftaran otomatis "Terdaftar"</li>
                            </ul>
                        </li>
                    </ol>

                    <div class="bg-amber-50 border-l-4 border-amber-400 p-4 mt-4 flex items-start gap-3">
                        <AlertTriangle class="size-5 text-amber-500 shrink-0" />
                        <p class="text-sm text-amber-700"><strong>Catatan:</strong> Pastikan email yang diinput benar karena kredensial login akan dikirim ke email tersebut.</p>
                    </div>
                </div>

                <hr />

                <!-- 2. Periode Pendaftaran -->
                <div id="periode">
                    <h3 class="text-xl font-bold text-gray-900 flex items-center gap-3 mb-4">
                        <span class="bg-blue-100 text-blue-800 rounded-full w-8 h-8 flex items-center justify-center text-sm">2</span>
                        Mengelola Periode Pendaftaran
                    </h3>
                    <p class="text-gray-600 mb-4">Periode pendaftaran mengatur kapan calon mahasiswa bisa mendaftar.</p>

                    <h4 class="font-semibold text-gray-900 mb-3">Status Periode:</h4>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
                        <div class="border rounded-lg p-4">
                            <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-semibold bg-green-100 text-green-800 mb-2">Aktif</span>
                            <p class="text-sm text-gray-600">Periode sedang berjalan dan calon mahasiswa bisa mendaftar</p>
                        </div>
                        <div class="border rounded-lg p-4">
                            <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-semibold bg-blue-100 text-blue-800 mb-2">Akan Datang</span>
                            <p class="text-sm text-gray-600">Periode belum dimulai, tidak bisa diaktifkan</p>
                        </div>
                        <div class="border rounded-lg p-4">
                            <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-semibold bg-gray-100 text-gray-800 mb-2">Berakhir</span>
                            <p class="text-sm text-gray-600">Periode sudah lewat, tidak bisa diaktifkan lagi</p>
                        </div>
                        <div class="border rounded-lg p-4">
                            <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-semibold bg-red-100 text-red-800 mb-2">Nonaktif</span>
                            <p class="text-sm text-gray-600">Periode dalam range tapi dinonaktifkan manual</p>
                        </div>
                    </div>

                    <h4 class="font-semibold text-gray-900 mb-3">Aturan Penting:</h4>
                    <ul class="list-disc list-inside space-y-2 text-gray-700">
                        <li><strong>Hanya 1 periode yang bisa aktif</strong> dalam satu waktu</li>
                        <li><strong>Periode otomatis nonaktif</strong> jika tanggal sudah lewat</li>
                        <li><strong>Tidak bisa mengaktifkan</strong> periode yang sudah berakhir atau belum dimulai</li>
                        <li><strong>End date berlaku sampai jam 23:59:59</strong> di hari tersebut</li>
                    </ul>
                </div>

                <hr />

                <!-- 3. Verifikasi Dokumen -->
                <div id="verifikasi">
                    <h3 class="text-xl font-bold text-gray-900 flex items-center gap-3 mb-4">
                        <span class="bg-green-100 text-green-800 rounded-full w-8 h-8 flex items-center justify-center text-sm">3</span>
                        Verifikasi Dokumen Calon Mahasiswa
                    </h3>
                    <p class="text-gray-600 mb-4">Proses verifikasi dokumen untuk memastikan kelengkapan dan keabsahan data.</p>

                    <h4 class="font-semibold text-gray-900 mb-3">Langkah-langkah:</h4>
                    <ol class="list-decimal list-inside space-y-2 text-gray-700">
                        <li>Buka menu <strong>"Calon Mahasiswa"</strong></li>
                        <li>Klik <strong>"Detail"</strong> pada mahasiswa yang ingin diverifikasi</li>
                        <li>Periksa setiap dokumen: Foto 3x4, KTP, Kartu Keluarga, Ijazah/SKL, Biodata</li>
                        <li>Untuk setiap dokumen, pilih:
                            <ul class="list-disc list-inside ml-6 mt-2 space-y-1">
                                <li><CheckCircle class="inline size-4 text-green-600" /> <span class="text-green-600 font-semibold">Setujui</span> - Jika dokumen valid</li>
                                <li><XCircle class="inline size-4 text-red-600" /> <span class="text-red-600 font-semibold">Tolak</span> - Jika ada masalah (wajib isi alasan)</li>
                            </ul>
                        </li>
                        <li>Jika <strong>semua dokumen disetujui</strong>, status otomatis berubah menjadi <span class="text-green-600 font-semibold">"Terverifikasi"</span></li>
                    </ol>

                    <div class="bg-red-50 border-l-4 border-red-400 p-4 mt-4 flex items-start gap-3">
                        <XCircle class="size-5 text-red-500 shrink-0" />
                        <p class="text-sm text-red-700"><strong>Penting:</strong> Jika menolak dokumen, WAJIB isi alasan penolakan agar mahasiswa tahu apa yang harus diperbaiki.</p>
                    </div>
                </div>

                <hr />

                <!-- 4. Daftar Ulang Manual -->
                <div id="daftar-ulang-manual">
                    <h3 class="text-xl font-bold text-gray-900 flex items-center gap-3 mb-4">
                        <span class="bg-orange-100 text-orange-800 rounded-full w-8 h-8 flex items-center justify-center text-sm">4</span>
                        Daftar Ulang Manual
                    </h3>
                    <p class="text-gray-600 mb-4">Fitur ini digunakan untuk memproses daftar ulang mahasiswa yang sudah diterima tetapi kesulitan melakukan proses secara online.</p>

                    <div class="bg-amber-50 border-l-4 border-amber-400 p-4 mb-4 flex items-start gap-3">
                        <AlertTriangle class="size-5 text-amber-500 shrink-0" />
                        <p class="text-sm text-amber-700"><strong>Syarat:</strong> Mahasiswa harus sudah berstatus "Diterima" untuk bisa diproses daftar ulang manual.</p>
                    </div>

                    <h4 class="font-semibold text-gray-900 mb-3">Langkah-langkah:</h4>
                    <ol class="list-decimal list-inside space-y-2 text-gray-700">
                        <li>Buka menu <strong>"Daftar Ulang Manual"</strong> di sidebar</li>
                        <li>Cari mahasiswa yang sudah diterima menggunakan filter atau search</li>
                        <li>Klik tombol <strong>"Daftar Ulang"</strong> pada mahasiswa yang dipilih</li>
                        <li>Isi data daftar ulang jika diperlukan:
                            <ul class="list-disc list-inside ml-6 mt-2 space-y-1 text-gray-600">
                                <li><strong>Catatan:</strong> Tambahkan catatan jika diperlukan (opsional)</li>
                            </ul>
                        </li>
                        <li>Klik <strong>"Simpan"</strong> untuk menyimpan data daftar ulang</li>
                    </ol>

                    <div class="bg-blue-50 border-l-4 border-blue-400 p-4 mt-4 flex items-start gap-3">
                        <Info class="size-5 text-blue-500 shrink-0" />
                        <p class="text-sm text-blue-700"><strong>Info:</strong> Setelah disimpan, status mahasiswa akan berubah ke "Daftar Ulang Pending". Admin masih perlu memverifikasi pembayaran secara terpisah jika mahasiswa membayar secara offline.</p>
                    </div>
                </div>

                <hr />

                <!-- 5. Verifikasi Pembayaran Daftar Ulang -->
                <div id="pembayaran">
                    <h3 class="text-xl font-bold text-gray-900 flex items-center gap-3 mb-4">
                        <span class="bg-purple-100 text-purple-800 rounded-full w-8 h-8 flex items-center justify-center text-sm">5</span>
                        Verifikasi Pembayaran Daftar Ulang
                    </h3>
                    <p class="text-gray-600 mb-4">Proses verifikasi bukti pembayaran daftar ulang dari mahasiswa yang sudah diterima.</p>

                    <h4 class="font-semibold text-gray-900 mb-3">Langkah-langkah:</h4>
                    <ol class="list-decimal list-inside space-y-2 text-gray-700">
                        <li>Buka menu <strong>"Verifikasi Pembayaran"</strong> di sidebar</li>
                        <li>Filter berdasarkan status: Pending, Terverifikasi, atau Ditolak</li>
                        <li>Klik tombol <strong>mata (👁)</strong> untuk preview bukti pembayaran</li>
                        <li>Periksa bukti pembayaran:
                            <ul class="list-disc list-inside ml-6 mt-2 space-y-1 text-gray-600">
                                <li>Nominal sesuai dengan biaya daftar ulang</li>
                                <li>Rekening tujuan benar</li>
                                <li>Bukti transfer jelas dan valid</li>
                            </ul>
                        </li>
                        <li>Pilih aksi:
                            <ul class="list-disc list-inside ml-6 mt-2 space-y-1">
                                <li><CheckCircle class="inline size-4 text-green-600" /> <span class="text-green-600 font-semibold">Verifikasi</span> - Jika pembayaran valid</li>
                                <li><XCircle class="inline size-4 text-red-600" /> <span class="text-red-600 font-semibold">Tolak</span> - Jika ada masalah (wajib isi alasan)</li>
                            </ul>
                        </li>
                    </ol>

                    <div class="bg-blue-50 border-l-4 border-blue-400 p-4 mt-4 flex items-start gap-3">
                        <Info class="size-5 text-blue-500 shrink-0" />
                        <p class="text-sm text-blue-700"><strong>Info:</strong> Setelah diverifikasi, status mahasiswa berubah ke "Daftar Ulang Terverifikasi" dan siap untuk generate NIM. Email notifikasi otomatis dikirim ke mahasiswa.</p>
                    </div>
                </div>

                <hr />

                <!-- 6. Generate NIM -->
                <div id="nim">
                    <h3 class="text-xl font-bold text-gray-900 flex items-center gap-3 mb-4">
                        <span class="bg-indigo-100 text-indigo-800 rounded-full w-8 h-8 flex items-center justify-center text-sm">6</span>
                        Generate NIM (Nomor Induk Mahasiswa)
                    </h3>
                    <p class="text-gray-600 mb-4">Proses generate NIM untuk mahasiswa yang sudah menyelesaikan daftar ulang.</p>

                    <h4 class="font-semibold text-gray-900 mb-3">Syarat Generate NIM:</h4>
                    <ul class="list-disc list-inside space-y-2 text-gray-700 mb-4">
                        <li>Status mahasiswa: <strong>"Daftar Ulang Terverifikasi"</strong></li>
                        <li>Program Studi sudah memiliki <strong>Kode NIM</strong></li>
                        <li>Mahasiswa <strong>belum memiliki NIM</strong></li>
                    </ul>

                    <h4 class="font-semibold text-gray-900 mb-3">Format NIM:</h4>
                    <div class="bg-gray-50 rounded-lg p-4 mb-4 font-mono text-center text-lg">
                        <span class="text-blue-600">23</span><span class="text-green-600">0201</span><span class="text-purple-600">001</span>
                    </div>
                    <div class="grid grid-cols-3 gap-4 text-center text-sm mb-4">
                        <div><span class="text-blue-600 font-bold">23</span><br>Tahun Masuk</div>
                        <div><span class="text-green-600 font-bold">0201</span><br>Kode Prodi</div>
                        <div><span class="text-purple-600 font-bold">001</span><br>Nomor Urut</div>
                    </div>

                    <h4 class="font-semibold text-gray-900 mb-3">Langkah-langkah:</h4>
                    <ol class="list-decimal list-inside space-y-2 text-gray-700">
                        <li>Buka menu <strong>"Generate NIM"</strong> di sidebar</li>
                        <li>Centang mahasiswa yang ingin digenerate NIM-nya (bisa pilih lebih dari satu)</li>
                        <li>Klik tombol <strong>"Generate NIM untuk X Mahasiswa"</strong></li>
                        <li>Sistem akan otomatis:
                            <ul class="list-disc list-inside ml-6 mt-2 space-y-1 text-gray-600">
                                <li>Generate NIM berdasarkan format</li>
                                <li>Update status ke "Enrolled"</li>
                                <li>Kirim email berisi NIM ke mahasiswa</li>
                            </ul>
                        </li>
                    </ol>

                    <div class="bg-amber-50 border-l-4 border-amber-400 p-4 mt-4 flex items-start gap-3">
                        <AlertTriangle class="size-5 text-amber-500 shrink-0" />
                        <p class="text-sm text-amber-700"><strong>Penting:</strong> Pastikan Kode NIM sudah diset di menu Program Studi sebelum generate NIM. Jika belum ada, akan muncul error.</p>
                    </div>
                </div>

                <hr />

                <!-- 6. Pengaturan Pembayaran -->
                <div id="pengaturan">
                    <h3 class="text-xl font-bold text-gray-900 flex items-center gap-3 mb-4">
                        <span class="bg-gray-200 text-gray-800 rounded-full w-8 h-8 flex items-center justify-center text-sm">7</span>
                        Pengaturan Pembayaran
                    </h3>
                    <p class="text-gray-600 mb-4">Kelola informasi rekening bank untuk pembayaran daftar ulang.</p>

                    <h4 class="font-semibold text-gray-900 mb-3">Pengaturan yang tersedia:</h4>
                    <ul class="list-disc list-inside space-y-2 text-gray-700 mb-4">
                        <li><strong>Tipe Pembayaran:</strong> Transfer Bank atau Virtual Account (VA)</li>
                        <li><strong>Nama Bank:</strong> Nama bank tujuan (contoh: BRI, BNI, Mandiri)</li>
                        <li><strong>Nomor Rekening/VA:</strong> Nomor rekening atau VA tujuan</li>
                        <li><strong>Nama Pemilik:</strong> Nama pemilik rekening</li>
                        <li><strong>Jumlah Pembayaran:</strong> Nominal biaya daftar ulang</li>
                        <li><strong>Instruksi:</strong> Pesan tambahan untuk mahasiswa (opsional)</li>
                    </ul>

                    <h4 class="font-semibold text-gray-900 mb-3">Langkah-langkah:</h4>
                    <ol class="list-decimal list-inside space-y-2 text-gray-700">
                        <li>Buka menu <strong>"Pengaturan Pembayaran"</strong> di sidebar</li>
                        <li>Isi atau ubah informasi pembayaran sesuai kebutuhan</li>
                        <li>Pilih <strong>Tipe Pembayaran</strong> (Transfer Bank atau VA)</li>
                        <li>Klik <strong>"Simpan Pengaturan"</strong></li>
                    </ol>

                    <div class="bg-blue-50 border-l-4 border-blue-400 p-4 mt-4 flex items-start gap-3">
                        <Info class="size-5 text-blue-500 shrink-0" />
                        <p class="text-sm text-blue-700"><strong>Info:</strong> Perubahan akan langsung tampil di halaman pembayaran mahasiswa. Pastikan informasi akurat sebelum disimpan.</p>
                    </div>
                </div>

                <hr />

                <!-- 8. Tips & Trik -->
                <div id="tips">
                    <h3 class="text-xl font-bold text-gray-900 flex items-center gap-3 mb-4">
                        <span class="bg-yellow-100 text-yellow-800 rounded-full w-8 h-8 flex items-center justify-center text-sm">8</span>
                        Tips & Trik
                    </h3>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
                        <div class="bg-gradient-to-r from-teal-50 to-teal-100 rounded-lg p-4 border border-teal-200">
                            <h4 class="font-semibold text-teal-900 mb-2">💡 Filter Data</h4>
                            <p class="text-sm text-teal-700">Gunakan filter periode dan status untuk mempermudah pencarian data mahasiswa.</p>
                        </div>
                        <div class="bg-gradient-to-r from-blue-50 to-blue-100 rounded-lg p-4 border border-blue-200">
                            <h4 class="font-semibold text-blue-900 mb-2">📊 Export Data</h4>
                            <p class="text-sm text-blue-700">Klik tombol "Export Excel" untuk download data mahasiswa dalam format Excel.</p>
                        </div>
                        <div class="bg-gradient-to-r from-purple-50 to-purple-100 rounded-lg p-4 border border-purple-200">
                            <h4 class="font-semibold text-purple-900 mb-2">🔍 Search</h4>
                            <p class="text-sm text-purple-700">Gunakan fitur search untuk mencari mahasiswa berdasarkan nama, email, atau nomor telepon.</p>
                        </div>
                        <div class="bg-gradient-to-r from-green-50 to-green-100 rounded-lg p-4 border border-green-200">
                            <h4 class="font-semibold text-green-900 mb-2">⚡ Shortcut</h4>
                            <p class="text-sm text-green-700">Klik langsung pada badge status periode untuk toggle aktif/nonaktif (jika memungkinkan).</p>
                        </div>
                    </div>

                    <h4 class="font-semibold text-gray-900 mb-3">🎯 Best Practices:</h4>
                    <ul class="list-disc list-inside space-y-2 text-gray-700">
                        <li>Selalu cek periode aktif sebelum mendaftarkan mahasiswa manual</li>
                        <li>Verifikasi dokumen sesegera mungkin agar mahasiswa tidak menunggu lama</li>
                        <li>Berikan alasan yang jelas saat menolak dokumen atau pembayaran</li>
                        <li>Generate NIM secara batch untuk efisiensi</li>
                        <li>Backup data secara berkala dengan export Excel</li>
                        <li>Koordinasi dengan tim untuk memastikan hanya 1 periode yang aktif</li>
                    </ul>
                </div>

                <!-- FAQ -->
                <div class="bg-gray-50 rounded-lg p-6 mt-8">
                    <h3 class="text-lg font-bold text-gray-900 mb-4 flex items-center gap-2">
                        <HelpCircle class="size-5" />
                        FAQ (Frequently Asked Questions)
                    </h3>
                    <div class="space-y-3">
                        <details
                            v-for="(faq, index) in faqs"
                            :key="index"
                            class="bg-white rounded-lg shadow-sm"
                        >
                            <summary class="font-semibold text-gray-900 cursor-pointer p-4 hover:bg-gray-50">{{ faq.question }}</summary>
                            <p class="px-4 pb-4 text-gray-600 text-sm">{{ faq.answer }}</p>
                        </details>
                    </div>
                </div>
            </div>
        </div>
    </AppLayout>
</template>


