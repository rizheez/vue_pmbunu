<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Surat Penerimaan - {{ $letter->letter_number }}</title>
    <style>
        @font-face {
            font-family: 'Candara';
            font-style: normal;
            font-weight: 400;
            src: url('{{ public_path('assets/Candara.ttf') }}') format('truetype');
        }

        @font-face {
            font-family: 'Candara';
            font-style: normal;
            font-weight: 700;
            src: url('{{ public_path('assets/Candarab.ttf') }}') format('truetype');
        }

        @font-face {
            font-family: 'Candaraz';
            font-style: normal;
            font-weight: 400;
            src: url('{{ public_path('assets/Candaraz.ttf') }}') format('truetype');
        }

        * {
            box-sizing: border-box;
        }

        @page {
            margin: 38mm 18mm 25mm 18mm;
        }

        body {
            margin: 0 25px;
            color: #111;
            font-family: 'Candara', DejaVu Sans, sans-serif;
            font-size: 11pt;
            font-weight: 400;
            line-height: 1.28;
        }

        .letter-header {
            position: fixed;
            top: -33mm;
            left: -4mm;
            right: -4mm;
        }

        .letter-header img,
        .letter-footer img {
            width: 100%;
        }

        .letter-footer {
            position: fixed;
            right: -4mm;
            bottom: -25mm;
            left: -4mm;
        }

        .letter-meta-row,
        .meta-table,
        .student-table {
            width: 100%;
            border-collapse: collapse;
        }

        .letter-meta-left {
            width: 58%;
            vertical-align: top;
        }

        .letter-meta-right {
            width: 42%;
            text-align: right;
            vertical-align: top;
            font-weight: 400;
        }

        .meta-table td,
        .student-table td {
            padding: 0;
            vertical-align: top;
            line-height: 1.1;
        }

        .meta-label {
            width: 26mm;
        }

        .colon {
            width: 4mm;
        }

        .recipient {
            margin-top: 6px;
            margin-bottom: 6px;
            font-weight: 400;
        }

        .recipient-name {
            font-family: 'Candaraz', 'Candara', DejaVu Sans, sans-serif;
        }

        .recipient-location {
            margin-top: 1px;
        }

        .paragraph {
            margin: 0 0 7px 0;
            text-align: justify;
            text-indent: 10mm;
            font-weight: 400;
        }

        .salutation {
            margin: 0;
            font-family: 'Candaraz', DejaVu Sans, sans-serif;
            font-size: 11pt;
            font-weight: 400;
        }

        .closing {
            margin: 0 0 6px 0;
            font-family: 'Candaraz', DejaVu Sans, sans-serif;
            font-size: 11pt;
            font-weight: 400;
        }

        .student-table {
            margin: 3px 0 6px 0;
            font-weight: 400;
            line-height: 1.1;
        }

        .student-label {
            width: 42mm;
        }

        .signature-table {
            width: 100%;
            margin-top: 2px;
            border-collapse: collapse;
        }

        .signature-table td {
            vertical-align: bottom;
        }

        .signature-spacer {
            width: auto;
        }

        .signature-block {
            width: 78mm;
            /* text-align: center; */
        }

        .signature-space {
            width: auto;
        }

        .signature-name {
            font-weight: 700;
            font-size: 9.5pt;
            line-height: 1.25;
            max-width: 95mm;
        }

        .copy-list {
            margin-top: 8px;
            font-size: 8.5pt;
            font-weight: 700;
            line-height: 1.18;
        }

        .copy-list ol {
            margin-top: 2px;
            padding-left: 18px;
        }

        .qr-box {
            width: 28mm;
        }

        .qr-wrapper {
            position: relative;
            width: 22mm;
            height: 22mm;
            margin: 0;
        }

        .qr-image {
            position: absolute;
            top: 0;
            left: 0;
            width: 22mm;
            height: 22mm;
        }

        .qr-logo {
            position: absolute;
            top: 8.25mm;
            left: 8.25mm;
            width: 5.5mm;
            height: 5.5mm;
            padding: 0.6mm;
            box-sizing: border-box;
            background: #fff;
            border-radius: 50%;
        }
    </style>
</head>

<body>
    @if ($headerBase64)
        <div class="letter-header">
            <img src="{{ $headerBase64 }}" alt="Header Surat">
        </div>
    @endif

    @if ($footerBase64)
        <div class="letter-footer">
            <img src="{{ $footerBase64 }}" alt="Footer Surat">
        </div>
    @endif

    <main>
        <table class="letter-meta-row">
            <tr>
                <td class="letter-meta-left">
                    <table class="meta-table">
                        <tr>
                            <td class="meta-label">Nomor</td>
                            <td class="colon">:</td>
                            <td>{{ $letter->letter_number }}</td>
                        </tr>
                        <tr>
                            <td>Perihal</td>
                            <td>:</td>
                            <td>{{ $letter->subject }}</td>
                        </tr>
                        <tr>
                            <td>Lampiran</td>
                            <td>:</td>
                            <td>-</td>
                        </tr>
                    </table>
                </td>
                <td class="letter-meta-right">
                    Samarinda, {{ $letter->letter_date->locale('id')->translatedFormat('d F Y') }}
                </td>
            </tr>
        </table>

        <div class="recipient">
            Kepada Yth.<br>
            <span class="recipient-name">{{ $biodata->name ?? $user->name }}</span>
            <div class="recipient-location">Di- Tempat</div>
        </div>

        <p class="salutation">Assalamu'alaikum Wr. Wb.</p>

        <p class="paragraph">
            Salam silaturahmi kami sampaikan teriring doa semoga kita selalu berada dalam lindungan Allah SWT dan
            senantiasa diberikan kemudahan dalam menjalankan tugas sehari-hari. Aamiin.
        </p>

        <p class="paragraph">
            Dengan ini kami memberitahukan bahwa <strong>{{ $biodata->name ?? $user->name }} telah mendaftar dan
                diterima
                sebagai Mahasiswa Universitas Nahdlatul Ulama Kalimantan Timur</strong> dengan data sebagai berikut:
        </p>

        <table class="student-table" style="margin-left: 10mm;">
            @if (!empty(trim((string) ($registration->registration_number ?? ''))) && $registration->registration_number !== '-')
                <tr>
                    <td class="student-label">No. Pendaftaran</td>
                    <td class="colon">:</td>
                    <td>{{ $registration->registration_number }}</td>
                </tr>
            @endif
            <tr>
                <td class="student-label">Nama Lengkap</td>
                <td class="colon">:</td>
                <td>{{ $biodata->name ?? $user->name }}</td>
            </tr>
            <tr>
                <td>Program Studi</td>
                <td>:</td>
                <td>
                    {{ $registration->acceptedProgramStudi?->jenjang }}
                    {{ $registration->acceptedProgramStudi?->name ?? '-' }}
                </td>
            </tr>
            <tr>
                <td>NIM</td>
                <td>:</td>
                <td>{{ $user->nim }}</td>
            </tr>
        </table>

        <p class="paragraph">
            Demikian pemberitahuan ini disampaikan. Atas perhatian dan kesediaannya, diucapkan terima kasih.
        </p>

        <p class="closing">
            Wallahul muwafiq ilaa aqwamith thorieq<br>
            Wassalamu'alaikum Wr. Wb.
        </p>

        <table class="signature-table">
            <tr>
                <td class="signature-spacer"></td>

                <td class="signature-block">
                    <div>An. Rektor<br>Wakil Rektor 1,</div>

                    <div class="qr-wrapper">
                        <img src="{{ $qrCodeBase64 }}" class="qr-image">
                        @if ($logoBase64)
                            <img src="{{ $logoBase64 }}" class="qr-logo">
                        @endif
                    </div>

                    <div class="signature-name">
                        {{ $letter->signatory_name }}
                    </div>
                </td>
            </tr>
        </table>

        <div class="copy-list">
            Tembusan Yth.:
            <ol>
                <li>Ketua BPP</li>
                <li>Rektor</li>
                <li>Wakil Rektor 1 dan 2</li>
                <li>Kepala Biro 1 dan 2</li>
                <li>Ketua UPT PMB</li>
                <li>Arsip</li>
            </ol>
        </div>
    </main>
</body>

</html>
