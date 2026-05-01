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
            ? "Gelombang: {$activePeriod->name} ({$activePeriod->start_date->format('d M Y')} - {$activePeriod->end_date->format('d M Y')})"
            : 'Gelombang: belum ada yang aktif';

        // Registration Paths
        $paths = \App\Models\RegistrationPath::where('is_active', true)->pluck('name')->implode(', ');
        $pathsInfo = $paths ? "Jalur: {$paths}" : 'Jalur: belum dibuka';

        // Program Studi
        $prodi = \App\Models\ProgramStudi::where('is_active', true)->get()->map(function ($p) {
            $quota = $p->quota ? " kuota {$p->quota}" : '';

            return "{$p->jenjang} {$p->name}{$quota}";
        })->implode('; ');
        $prodiInfo = "Prodi: {$prodi}";

        // Landing Page Settings
        $allSettings = \App\Models\LandingPageSetting::all()->groupBy('group');

        // Contact Info
        $contactSettings = $allSettings->get('contact', collect());
        $contactPhone = $contactSettings->where('key', 'contact_phone_1')->first()?->value ?? '-';
        $contactEmail = $contactSettings->where('key', 'contact_email')->first()?->value ?? '-';
        $contactAddress = $contactSettings->where('key', 'contact_address')->first()?->value ?? '-';

        $contactInfo = "Kontak resmi: WA {$contactPhone}; email {$contactEmail}; alamat {$contactAddress}";

        // About Section
        $aboutSettings = $allSettings->get('about', collect());
        $aboutDesc = $aboutSettings->where('key', 'about_description')->first()?->value ?? '';
        $aboutInfo = $aboutDesc ? 'Tentang: '.$this->compactText($aboutDesc) : '';

        // Social Media
        $socialSettings = $allSettings->get('social_media', collect());
        $socialFb = $socialSettings->where('key', 'social_media_facebook')->first()?->value ?? '';
        $socialIg = $socialSettings->where('key', 'social_media_instagram')->first()?->value ?? '';
        $socialWeb = $socialSettings->where('key', 'social_media_website')->first()?->value ?? '';
        $socialInfo = "Sosmed: web {$socialWeb}; IG {$socialIg}; FB {$socialFb}";

        // Chat Training Q&A (Knowledge Base)
        $knowledgeBase = \App\Models\ChatTraining::all()->map(function ($item) {
            return 'Q: '.$this->compactText($item->question).' | A: '.$this->compactText($item->answer);
        })->implode("\n");
        $knowledgeInfo = $knowledgeBase ? "FAQ:\n{$knowledgeBase}" : '';

        // Beasiswa Info
        $beasiswaInfo = 'Beasiswa: KIP-K, GratisPol Kaltim. Pengajuan/konsultasi via kontak resmi.';

        // Registration Steps (Alur Pendaftaran)
        $stepsInfo = 'Alur: daftar akun + verifikasi email; lengkapi biodata; upload foto 4x6 merah, KTP, KK, ijazah/SKL; pilih jenis/jalur dan 2 prodi; tunggu verifikasi PMB; jika lolos lanjut daftar ulang.';

        // Required Documents
        $documentsInfo = 'Dokumen: foto 4x6 latar merah; KTP; KK; ijazah/SKL. Format PDF/JPG/PNG maks 2MB/file.';

        // Tips for Success
        $tipsInfo = 'Tips: gunakan email/WA aktif, siapkan dokumen, upload jelas, isi data sesuai dokumen resmi, simpan nomor WA PMB.';

        // Important Notices
        $importantInfo = 'Penting: pendaftaran dan daftar ulang gratis; Rp300.000 hanya paket opsional almamater+KTM; panitia tidak meminta transfer ke rekening pribadi; waspada penipuan; kendala teknis hubungi kontak resmi.';

        // Informasi Biaya (Pendaftaran, RPL, UKT)
        $biayaInfo = 'Biaya: pendaftaran/daftar ulang gratis; paket opsional almamater+KTM Rp300.000; RPL/alih jenjang/pindahan Rp120.000/SKS; UKT/semester reguler non-farmasi Rp5.000.000, farmasi Rp7.000.000, kelas karyawan hubungi PMB.';

        // Website Features Info
        $websiteInfo = 'Website: pmb.unukaltim.ac.id menyediakan chatbot PMB di pojok kanan bawah.';

        $content = collect([
            '[KONTEKS PMB UNU KALTIM]',
            $periodInfo,
            $pathsInfo,
            $prodiInfo,
            $stepsInfo,
            $documentsInfo,
            $tipsInfo,
            $importantInfo,
            $biayaInfo,
            $contactInfo,
            $socialInfo,
            $aboutInfo,
            $beasiswaInfo,
            $websiteInfo,
            $knowledgeInfo,
            '[AKHIR KONTEKS]',
        ])->filter()->implode("\n");

        \Illuminate\Support\Facades\Storage::put('chat_context.txt', $content);

        // Clear cached context so next request gets fresh data
        \Illuminate\Support\Facades\Cache::forget('chat_context');
        \Illuminate\Support\Facades\Cache::forget('chat_context_'.app()->environment());

        $this->info('Chat context generated successfully at '.storage_path('app/private/chat_context.txt'));
    }

    private function compactText(string $text): string
    {
        return trim((string) preg_replace('/\s+/', ' ', strip_tags($text)));
    }
}
