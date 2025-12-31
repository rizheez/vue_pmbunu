<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ReregistrationPayment;
use App\Models\StudentBiodata;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;
use Inertia\Response;

class ReregistrationPaymentController extends Controller
{
    /**
     * Display list of payments pending verification.
     */
    public function index(Request $request): Response
    {
        $query = ReregistrationPayment::with(['user.studentBiodata'])
            ->latest();

        // Filter by status
        if ($request->has('status') && $request->status !== 'all') {
            $query->where('status', $request->status);
        }

        // Search
        if ($request->has('search') && $request->search) {
            $search = $request->search;
            $query->whereHas('user', function ($q) use ($search) {
                $q->where('name', 'like', "%{$search}%")
                    ->orWhere('email', 'like', "%{$search}%");
            });
        }

        $payments = $query->paginate(15)->withQueryString();

        return Inertia::render('admin/reregistration-payments/Index', [
            'payments' => $payments,
            'filters' => [
                'status' => $request->status ?? 'all',
                'search' => $request->search ?? '',
            ],
        ]);
    }

    /**
     * Verify a payment.
     */
    public function verify(Request $request, ReregistrationPayment $payment): RedirectResponse
    {
        $payment->update([
            'status' => 'verified',
            'verified_by' => Auth::id(),
            'verified_at' => now(),
            'notes' => $request->notes,
        ]);

        // Update student biodata status
        $biodata = StudentBiodata::where('user_id', $payment->user_id)->first();
        if ($biodata) {
            $biodata->update(['reregistration_status' => 'completed']);
        }

        return redirect()->back()
            ->with('success', 'Pembayaran berhasil diverifikasi.');
    }

    /**
     * Reject a payment.
     */
    public function reject(Request $request, ReregistrationPayment $payment): RedirectResponse
    {
        $request->validate([
            'notes' => 'required|string|max:500',
        ], [
            'notes.required' => 'Alasan penolakan wajib diisi.',
        ]);

        $payment->update([
            'status' => 'rejected',
            'verified_by' => Auth::id(),
            'verified_at' => now(),
            'notes' => $request->notes,
        ]);

        // Update student biodata status back to form_completed so they can re-upload
        $biodata = StudentBiodata::where('user_id', $payment->user_id)->first();
        if ($biodata) {
            $biodata->update(['reregistration_status' => 'form_completed']);
        }

        return redirect()->back()
            ->with('success', 'Pembayaran ditolak. Mahasiswa akan diminta mengunggah ulang.');
    }
}
