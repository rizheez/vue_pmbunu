<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Kartu Peserta PMB - {{ $registration->registration_number }}</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'DejaVu Sans', sans-serif;
            font-size: 11px;
            line-height: 1.3;
            color: #333;
            background: #fff;
        }

        .card-container {
            max-width: 550px;
            margin: 10px auto;
            border: 2px solid #0d9488;
            overflow: hidden;
        }

        .header {
            background: #e6f7f5;
            color: #0d7d74;
            padding: 10px 12px;
        }

        .header h1 {
            font-size: 13px;
            font-weight: bold;
            margin-bottom: 1px;
            color: #0d7d74;
        }

        .header h2 {
            font-size: 10px;
            font-weight: normal;
            color: #5f9e99;
        }

        .header .subtitle {
            font-size: 10px;
            font-weight: bold;
            display: inline-block;
            margin-top: 8px;
            padding: 4px 16px;
            background: #0d9488;
            color: white;
            letter-spacing: 1px;
        }

        .content {
            padding: 12px;
        }

        .registration-number {
            background: #0d9488;
            color: white;
            padding: 8px;
            text-align: center;
            margin: -12px -12px 12px -12px;
        }

        .registration-number .label {
            font-size: 9px;
        }

        .registration-number .number {
            font-size: 18px;
            font-weight: bold;
            font-family: monospace;
            letter-spacing: 2px;
        }

        .info-table {
            width: 100%;
            border-collapse: collapse;
        }

        .photo-cell {
            width: 100px;
            vertical-align: top;
            padding-right: 12px;
        }

        .photo {
            width: 95px;
            height: 125px;
            border: 2px solid #0d9488;
        }

        .photo-placeholder {
            width: 95px;
            height: 125px;
            border: 2px dashed #9ca3af;
            background: #f3f4f6;
            text-align: center;
            padding-top: 45px;
            color: #6b7280;
            font-size: 9px;
        }

        .info-cell {
            vertical-align: top;
        }

        .info-row {
            margin-bottom: 5px;
            padding-bottom: 5px;
            border-bottom: 1px dotted #e5e7eb;
        }

        .info-label {
            font-size: 8px;
            color: #6b7280;
            text-transform: uppercase;
            letter-spacing: 0.3px;
            margin-bottom: 1px;
        }

        .info-value {
            font-size: 10px;
            font-weight: bold;
            color: #111827;
        }

        .prodi-section {
            background: #f0fdfa;
            border: 1px solid #99f6e4;
            padding: 8px;
            margin-top: 10px;
        }

        .prodi-title {
            font-size: 9px;
            font-weight: bold;
            color: #0d9488;
            margin-bottom: 5px;
        }

        .prodi-item {
            padding: 4px 0;
            border-bottom: 1px dotted #99f6e4;
        }

        .prodi-item:last-child {
            border-bottom: none;
        }

        .prodi-choice {
            font-size: 8px;
            color: #6b7280;
        }

        .prodi-name {
            font-size: 10px;
            font-weight: bold;
            color: #111827;
        }

        .prodi-fakultas {
            font-size: 8px;
            color: #6b7280;
        }

        .footer {
            background: #f9fafb;
            border-top: 1px solid #e5e7eb;
            padding: 10px 12px;
            font-size: 8px;
            color: #6b7280;
        }

        .footer-title {
            font-weight: bold;
            color: #374151;
            margin-bottom: 3px;
        }

        .footer ul {
            margin-left: 12px;
        }

        .footer li {
            margin-bottom: 2px;
        }

        .stamp {
            text-align: center;
            margin-top: 8px;
            padding-top: 8px;
            border-top: 1px dashed #d1d5db;
        }

        .stamp-text {
            font-size: 8px;
            color: #6b7280;
        }

        .stamp-date {
            font-size: 9px;
            font-weight: bold;
            color: #374151;
        }
    </style>
</head>

<body>
    <div class="card-container">
        <div class="header">
            <table style="width: 100%;">
                <tr>
                    <td style="width: 45px; vertical-align: middle;">
                        @if ($logoBase64)
                            <img src="{{ $logoBase64 }}" alt="Logo UNU" style="width: 40px; height: 40px;">
                        @endif
                    </td>
                    <td style="vertical-align: middle; text-align: center;">
                        <h1>UNIVERSITAS NAHDLATUL ULAMA</h1>
                        <h2>KALIMANTAN TIMUR</h2>
                    </td>
                    <td style="width: 45px;"></td>
                </tr>
            </table>
            <div style="text-align: center;">
                <span class="subtitle">KARTU PESERTA PMB</span>
            </div>
        </div>

        <div class="content">
            <div class="registration-number">
                <div class="label">NOMOR PENDAFTARAN</div>
                <div class="number">{{ $registration->registration_number ?? '-' }}</div>
            </div>

            <table class="info-table">
                <tr>
                    <td class="photo-cell">
                        @if ($photoBase64)
                            <img src="{{ $photoBase64 }}" alt="Foto Peserta" class="photo">
                        @else
                            <div class="photo-placeholder">
                                FOTO<br>PESERTA
                            </div>
                        @endif
                    </td>
                    <td class="info-cell">
                        <div class="info-row">
                            <div class="info-label">Nama Lengkap</div>
                            <div class="info-value">{{ $biodata->name ?? $user->name }}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">NIK</div>
                            <div class="info-value">{{ $biodata->nik ?? '-' }}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Tempat, Tanggal Lahir</div>
                            <div class="info-value">
                                {{ $biodata->birth_place ?? '-' }},
                                {{ $biodata->birth_date
                                    ? \Carbon\Carbon::parse($biodata->birth_date)->locale('id')->translatedFormat('d F Y')
                                    : '-' }}
                            </div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Jenis Kelamin</div>
                            <div class="info-value">{{ $biodata->gender ?? '-' }}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Asal Sekolah</div>
                            <div class="info-value">{{ $biodata->school_origin ?? '-' }}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Periode Pendaftaran</div>
                            <div class="info-value">{{ $registration->registrationPeriod->name ?? '-' }}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Jenis Pendaftaran</div>
                            <div class="info-value">{{ $registration->registrationType->name ?? '-' }}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Jalur Pendaftaran</div>
                            <div class="info-value">{{ $registration->registrationPath->name ?? '-' }}</div>
                        </div>
                    </td>
                </tr>
            </table>

            <div class="prodi-section">
                <div class="prodi-title">PILIHAN PROGRAM STUDI</div>
                @if ($registration->programStudiChoice1)
                    <div class="prodi-item">
                        <div class="prodi-choice">Pilihan 1</div>
                        <div class="prodi-name">{{ $registration->programStudiChoice1->jenjang ?? '' }} -
                            {{ $registration->programStudiChoice1->name }}</div>
                        <div class="prodi-fakultas">{{ $registration->programStudiChoice1->fakultas->name ?? '' }}
                        </div>
                    </div>
                @endif
                @if ($registration->programStudiChoice2)
                    <div class="prodi-item">
                        <div class="prodi-choice">Pilihan 2</div>
                        <div class="prodi-name">{{ $registration->programStudiChoice2->jenjang ?? '' }} -
                            {{ $registration->programStudiChoice2->name }}</div>
                        <div class="prodi-fakultas">{{ $registration->programStudiChoice2->fakultas->name ?? '' }}
                        </div>
                    </div>
                @endif
            </div>
        </div>

        <div class="footer">
            <div class="footer-title">Petunjuk:</div>
            <ul>
                <li>Dapat dicetak ulang melalui portal PMB</li>
                <li>Kartu ini dapat dijadikan bukti pendaftaran</li>
            </ul>
            {{-- <div class="stamp">
                <div class="stamp-text">Dicetak pada</div>
                <div class="stamp-date">{{ \Carbon\Carbon::now()->format('d M Y, H:i') }} WIB</div>
            </div> --}}
        </div>
    </div>
</body>

</html>
