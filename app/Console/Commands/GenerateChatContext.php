<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class GenerateChatContext extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'chat:generate-context';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Generate chatbot system prompt context from database to a static file';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $this->info('Generating chat context...');

        // Active Period
        $activePeriod = \App\Models\RegistrationPeriod::where('is_active', true)->first();
        $periodInfo = $activePeriod
            ? "Gelombang saat ini: {$activePeriod->name} ({$activePeriod->start_date->format('d M Y')} - {$activePeriod->end_date->format('d M Y')})."
            : 'Saat ini belum ada gelombang pendaftaran yang aktif.';

        // Registration Paths
        $paths = \App\Models\RegistrationPath::where('is_active', true)->pluck('name')->implode(', ');
        $pathsInfo = $paths ? "Jalur pendaftaran yang tersedia: {$paths}." : 'Belum ada jalur pendaftaran yang dibuka.';

        // Program Studi
        $prodi = \App\Models\ProgramStudi::where('is_active', true)->get()->map(function ($p) {
            return "- {$p->jenjang} {$p->name}";
        })->implode("\n");
        $prodiInfo = "Program Studi yang tersedia:\n{$prodi}";

        // Landing Page Settings
        $allSettings = \App\Models\LandingPageSetting::all()->groupBy('group');

        // Contact Info
        $contactSettings = $allSettings->get('contact', collect());
        $contactPhone = $contactSettings->where('key', 'contact_phone_1')->first()?->value ?? '-';
        $contactEmail = $contactSettings->where('key', 'contact_email')->first()?->value ?? '-';
        $contactAddress = $contactSettings->where('key', 'contact_address')->first()?->value ?? '-';

        $contactInfo = "KONTAK RESMI:\n";
        $contactInfo .= "- Telepon/WA: {$contactPhone}\n";
        $contactInfo .= "- Email: {$contactEmail}\n";
        $contactInfo .= "- Alamat Kampus: {$contactAddress}";

        // About Section
        $aboutSettings = $allSettings->get('about', collect());
        $aboutDesc = $aboutSettings->where('key', 'about_description')->first()?->value ?? '';
        $aboutInfo = $aboutDesc ? "TENTANG UNU KALTIM:\n{$aboutDesc}" : '';

        // Social Media
        $socialSettings = $allSettings->get('social_media', collect());
        $socialFb = $socialSettings->where('key', 'social_media_facebook')->first()?->value ?? '';
        $socialIg = $socialSettings->where('key', 'social_media_instagram')->first()?->value ?? '';
        $socialWeb = $socialSettings->where('key', 'social_media_website')->first()?->value ?? '';
        $socialInfo = "SOCIAL MEDIA:\n- Website: {$socialWeb}\n- Instagram: {$socialIg}\n- Facebook: {$socialFb}";

        // Chat Training Q&A (Knowledge Base)
        $knowledgeBase = \App\Models\ChatTraining::all()->map(function ($item) {
            return "Q: {$item->question}\nA: {$item->answer}";
        })->implode("\n\n");
        $knowledgeInfo = $knowledgeBase ? "REFERENSI PERTANYAAN UMUM:\n{$knowledgeBase}" : '';

        // Beasiswa Info
        $beasiswaInfo = 'BEASISWA TERSEDIA: KIP-K, GratisPol (PENDIDIKAN GRATISPOL KALIMANTAN TIMUR). Jika ingin mengajukan beasiswa, silahkan menghubungi kontak resmi UNU Kaltim.';

        // Registration Steps (Alur Pendaftaran)
        $stepsInfo = "ALUR PENDAFTARAN PMB (5 Langkah):\n";
        $stepsInfo .= "1. REGISTRASI AKUN: Buka website PMB, klik tombol Daftar. Isi email aktif, nama lengkap, nomor WhatsApp aktif, dan password. Cek email untuk verifikasi dan aktifkan akun.\n";
        $stepsInfo .= "2. LENGKAPI BIODATA: Login ke akun, lalu lengkapi data pribadi: NIK, NISN, tempat tanggal lahir, alamat lengkap, dan upload foto 4x6 latar merah.\n";
        $stepsInfo .= "3. UPLOAD DOKUMEN: Upload dokumen yang diperlukan: KTP, Kartu Keluarga, dan Ijazah/SKL. Format: PDF, JPG, atau PNG (maks 2MB).\n";
        $stepsInfo .= "4. PILIH PROGRAM STUDI: Pilih jenis pendaftaran, jalur masuk, dan 2 pilihan program studi sesuai dengan minat dan bakat.\n";
        $stepsInfo .= '5. VERIFIKASI DAN DAFTAR ULANG: Tunggu proses verifikasi dari Tim PMB. Setelah dinyatakan lolos, akan dihubungi untuk proses daftar ulang dan informasi selanjutnya.';

        // Required Documents
        $documentsInfo = "DOKUMEN YANG DIPERLUKAN:\n";
        $documentsInfo .= "- Foto 4x6 latar merah\n";
        $documentsInfo .= "- Scan/Foto KTP\n";
        $documentsInfo .= "- Scan/Foto Kartu Keluarga (KK)\n";
        $documentsInfo .= "- Scan/Foto Ijazah atau Surat Keterangan Lulus (SKL)\n";
        $documentsInfo .= 'Format file: PDF, JPG, atau PNG dengan ukuran maksimal 2MB per file.';

        // Tips for Success
        $tipsInfo = "TIPS SUKSES PENDAFTARAN:\n";
        $tipsInfo .= "- Gunakan email aktif yang sering dicek\n";
        $tipsInfo .= "- Gunakan nomor WhatsApp aktif (PENTING: informasi status pendaftaran dan jadwal daftar ulang dikirim via WhatsApp)\n";
        $tipsInfo .= "- Siapkan semua dokumen sebelum mendaftar\n";
        $tipsInfo .= "- Pastikan foto/scan dokumen jelas dan terbaca\n";
        $tipsInfo .= "- Isi data sesuai dokumen resmi (KTP/Ijazah)\n";
        $tipsInfo .= '- Simpan nomor WA panitia PMB';

        // Important Notices
        $importantInfo = "INFORMASI PENTING:\n";
        $importantInfo .= "- Pendaftaran PMB UNU Kaltim GRATIS, tidak dipungut biaya apapun.\n";
        $importantInfo .= "- Panitia TIDAK PERNAH meminta transfer uang melalui WhatsApp atau telepon.\n";
        $importantInfo .= "- Hati-hati terhadap penipuan yang mengatasnamakan PMB UNU Kaltim.\n";
        $importantInfo .= '- Jika mengalami kendala teknis, hubungi panitia resmi melalui kontak yang tertera di website.';

        // Biaya UKT
        $biayaUKT = "BIAYA UKT / Biaya Kuliah Per Semester:\n";
        $biayaUKT .= "- Reguler non farmasi: Rp. 5.000.000\n";
        $biayaUKT .= "- Reguler farmasi: Rp. 7.000.000 an\n";
        $biayaUKT .= "- Kelas Karyawan: Kunjungi edunitas.com untuk informasi lebih lanjut\n";

        // Website Features Info
        $websiteInfo = "FITUR WEBSITE PMB:\n";
        $websiteInfo .= "- Di website PMB (pmb.unukaltim.ac.id) terdapat Asisten Virtual AI (chatbot) yang dapat membantu menjawab pertanyaan seputar pendaftaran.\n";
        $websiteInfo .= "- Tombol chat AI terletak di pojok kanan bawah halaman landing page, berbentuk ikon bulat berwarna hijau.\n";
        $websiteInfo .= '- Calon mahasiswa dapat bertanya langsung kepada chatbot ini kapan saja untuk mendapatkan informasi PMB.';

        $content = "[DATA REAL-TIME UNU KALTIM]\n\n";
        $content .= "{$periodInfo}\n{$pathsInfo}\n\n";
        $content .= "{$prodiInfo}\n\n";
        $content .= "{$stepsInfo}\n\n";
        $content .= "{$documentsInfo}\n\n";
        $content .= "{$tipsInfo}\n\n";
        $content .= "{$importantInfo}\n\n";
        $content .= "{$biayaUKT}\n\n";
        $content .= "{$contactInfo}\n\n";
        $content .= "{$socialInfo}\n\n";
        $content .= "{$aboutInfo}\n\n";
        $content .= "{$beasiswaInfo}\n\n";
        $content .= "{$websiteInfo}\n\n";
        $content .= "{$knowledgeInfo}\n\n";
        $content .= '[AKHIR DATA REAL-TIME]';

        \Illuminate\Support\Facades\Storage::put('chat_context.txt', $content);

        $this->info('Chat context generated successfully at ' . storage_path('app/chat_context.txt'));
    }
}
