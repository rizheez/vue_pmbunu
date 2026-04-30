<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Registration;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\DB;

class EnrolledStudentController extends Controller
{
    public function index()
    {
        $query = \App\Models\Registration::with(['user', 'acceptedProgramStudi', 'registrationPeriod'])
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
            'programStudi' => \App\Models\ProgramStudi::where('is_active', true)->get(),
            'filters' => request()->only(['search', 'prodi']),
        ]);
    }

    public function cancel(Registration $registration): RedirectResponse
    {
        if ($registration->status !== 'enrolled') {
            return redirect()->back()
                ->with('error', 'Hanya mahasiswa aktif yang dapat dibatalkan.');
        }

        DB::transaction(function () use ($registration) {
            $registration->update(['status' => 'cancelled']);
        });

        return redirect()->back()
            ->with('success', 'Mahasiswa aktif berhasil dibatalkan. NIM tetap tersimpan sebagai riwayat nomor yang pernah diterbitkan.');
    }
}
