<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ProgramStudi;
use App\Models\Registration;
use App\Models\User;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class EnrolledStudentController extends Controller
{
    public function index()
    {
        $query = Registration::with(['user', 'acceptedProgramStudi', 'registrationPeriod'])
            ->where('status', 'enrolled')
            ->whereNotNull('registration_number'); // Assuming NIM usually correlates with registration_number existence or check user.nim

        // Simple search filter
        if (request('search')) {
            $query->whereHas('user', function ($q) {
                $q->where('name', 'like', '%'.request('search').'%')
                    ->orWhere('email', 'like', '%'.request('search').'%')
                    ->orWhere('nim', 'like', '%'.request('search').'%');
            });
        }

        if (request('prodi') && request('prodi') !== 'all') {
            $query->where('accepted_program_studi_id', request('prodi'));
        }

        $registrations = $query->latest()
            ->paginate(10)
            ->withQueryString();

        return inertia('admin/enrolled-students/Index', [
            'registrations' => $registrations,
            'programStudi' => ProgramStudi::where('is_active', true)->get(),
            'filters' => request()->only(['search', 'prodi']),
        ]);
    }

    public function updateNim(Request $request, Registration $registration): RedirectResponse
    {
        if ($registration->status !== 'enrolled') {
            return redirect()->back()
                ->with('error', 'Hanya mahasiswa aktif yang dapat diubah NIM-nya.');
        }

        $registration->loadMissing(['user', 'acceptedProgramStudi', 'registrationPeriod']);

        $prodi = $registration->acceptedProgramStudi;
        $period = $registration->registrationPeriod;

        if (! $prodi || ! $prodi->nim_code || ! $period) {
            return redirect()->back()
                ->with('error', 'Data program studi atau periode pendaftaran tidak valid.');
        }

        $years = explode('/', $period->academic_year);
        $year = substr($years[0], -2);
        $prefix = $year.$prodi->nim_code;

        $request->validate([
            'sequence' => ['required', 'regex:/^[0-9]{1,4}$/'],
        ], [
            'sequence.required' => 'Nomor urut NIM wajib diisi.',
            'sequence.regex' => 'Nomor urut NIM harus berupa angka.',
        ]);

        $sequence = $request->input('sequence');
        if (strlen($sequence) < 3) {
            $sequence = str_pad($sequence, 3, '0', STR_PAD_LEFT);
        }

        $newNim = $prefix.$sequence;

        if (strlen($newNim) > 9) {
            return redirect()->back()
                ->withErrors(['sequence' => 'Panjang total NIM maksimal 9 digit.'])
                ->with('error', 'Panjang total NIM maksimal 9 digit.');
        }

        if ($registration->user?->nim === $newNim) {
            return redirect()->back()
                ->with('info', 'NIM tidak mengalami perubahan.');
        }

        $isDuplicate = User::where('nim', $newNim)
            ->where('id', '!=', $registration->user_id)
            ->exists();

        if ($isDuplicate) {
            return redirect()->back()
                ->withErrors(['sequence' => "NIM {$newNim} sudah digunakan oleh mahasiswa lain."])
                ->with('error', "NIM {$newNim} sudah digunakan oleh mahasiswa lain.");
        }

        $oldNim = $registration->user?->nim ?? '-';
        $registration->user?->update(['nim' => $newNim]);

        return redirect()->back()
            ->with('success', "NIM mahasiswa berhasil diubah dari {$oldNim} menjadi {$newNim}.");
    }

    public function cancel(Registration $registration): RedirectResponse
    {
        if ($registration->status !== 'enrolled') {
            return redirect()->back()
                ->with('error', 'Hanya mahasiswa aktif yang dapat dibatalkan.');
        }

        DB::transaction(function () use ($registration) {
            $registration->loadMissing('user');
            $registration->user?->update(['nim' => null]);
            $registration->update(['status' => 'cancelled']);
        });

        return redirect()->back()
            ->with('success', 'Mahasiswa aktif berhasil dibatalkan. NIM sudah dikosongkan dan dapat digunakan kembali.');
    }
}
