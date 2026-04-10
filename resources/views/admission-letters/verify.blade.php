<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verifikasi Surat Penerimaan</title>
    <style>
        body {
            margin: 0;
            background: #f6f7f9;
            color: #111827;
            font-family: Arial, sans-serif;
        }

        .page {
            max-width: 720px;
            margin: 40px auto;
            padding: 24px;
        }

        .panel {
            border: 1px solid #d1d5db;
            border-radius: 8px;
            background: #fff;
            padding: 24px;
        }

        .status {
            display: inline-block;
            border-radius: 8px;
            background: #dcfce7;
            color: #166534;
            padding: 6px 10px;
            font-size: 14px;
            font-weight: 700;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        td {
            border-bottom: 1px solid #e5e7eb;
            padding: 10px 0;
            vertical-align: top;
        }

        td:first-child {
            width: 170px;
            color: #6b7280;
        }
    </style>
</head>

<body>
    <main class="page">
        <section class="panel">
            <span class="status">Surat Valid</span>
            <h1>Surat Internal UNU Kaltim</h1>
            <table>
                <tr>
                    <td>Nomor</td>
                    <td>{{ $letter->letter_number }}</td>
                </tr>
                <tr>
                    <td>Tanggal</td>
                    <td>Samarinda, {{ $letter->letter_date->locale('id')->translatedFormat('d F Y') }}</td>
                </tr>
                <tr>
                    <td>Perihal</td>
                    <td>{{ $letter->subject }}</td>
                </tr>
                <tr>
                    <td>Nama</td>
                    <td>{{ $biodata->name ?? $user->name }}</td>
                </tr>
                <tr>
                    <td>NIM</td>
                    <td>{{ $user->nim }}</td>
                </tr>
                <tr>
                    <td>Program Studi</td>
                    <td>{{ $registration->acceptedProgramStudi?->jenjang }} {{ $registration->acceptedProgramStudi?->name ?? '-' }}</td>
                </tr>
                <tr>
                    <td>Penandatangan</td>
                    <td>{{ $letter->signatory_name }}</td>
                </tr>
            </table>
        </section>
    </main>
</body>

</html>
