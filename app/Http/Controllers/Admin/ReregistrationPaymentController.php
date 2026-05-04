<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PaymentSetting;
use App\Models\ReregistrationPayment;
use App\Models\User;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
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
            $query->where(function ($q) use ($search) {
                $q->whereHas('user', function ($userQuery) use ($search) {
                    $userQuery->where('name', 'like', "%{$search}%")
                        ->orWhere('email', 'like', "%{$search}%");
                })->orWhereHas('user.studentBiodata', function ($biodataQuery) use ($search) {
                    $biodataQuery->where('name', 'like', "%{$search}%");
                });
            });
        }

        $payments = $query->paginate(15)->withQueryString();
        $eligibleStudents = User::query()
            ->with('studentBiodata')
            ->where('role', 'student')
            ->whereHas('registration', fn ($q) => $q->whereIn('status', [
                'accepted',
                're_registration_pending',
                're_registration_verified',
                'enrolled',
            ]))
            ->orderBy('name')
            ->get(['id', 'name', 'email'])
            ->map(fn (User $student) => [
                'id' => $student->id,
                'name' => $student->studentBiodata?->name ?: $student->name,
                'email' => $student->email,
            ]);

        return Inertia::render('admin/reregistration-payments/Index', [
            'payments' => $payments,
            'eligibleStudents' => $eligibleStudents,
            'defaultAmount' => (int) PaymentSetting::getValue('payment_amount', 300000),
            'filters' => [
                'status' => $request->status ?? 'all',
                'search' => $request->search ?? '',
            ],
        ]);
    }

    /**
     * Add or update an optional package payment record manually.
     */
    public function store(Request $request): RedirectResponse
    {
        $validated = $this->validatePayment($request);

        $student = User::where('role', 'student')
            ->whereHas('registration', fn ($q) => $q->whereIn('status', [
                'accepted',
                're_registration_pending',
                're_registration_verified',
                'enrolled',
            ]))
            ->findOrFail($validated['user_id']);

        $payment = ReregistrationPayment::where('user_id', $student->id)->first();

        if ($payment) {
            $payment->update($this->buildPaymentPayload($request, $validated, $payment));
        } else {
            ReregistrationPayment::create(
                array_merge(
                    ['user_id' => $student->id],
                    $this->buildPaymentPayload($request, $validated),
                ),
            );
        }

        return redirect()->back()
            ->with('success', 'Pembayaran Almamater & KTM berhasil dicatat.');
    }

    /**
     * Update a payment record.
     */
    public function update(Request $request, ReregistrationPayment $payment): RedirectResponse
    {
        $validated = $this->validatePayment($request);

        User::where('role', 'student')
            ->whereHas('registration', fn ($q) => $q->whereIn('status', [
                'accepted',
                're_registration_pending',
                're_registration_verified',
                'enrolled',
            ]))
            ->findOrFail($validated['user_id']);

        $payment->update($this->buildPaymentPayload($request, $validated, $payment));

        return redirect()->back()
            ->with('success', 'Pembayaran Almamater & KTM berhasil diperbarui.');
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

        return redirect()->back()
            ->with('success', 'Pembayaran Almamater & KTM berhasil diverifikasi.');
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

        return redirect()->back()
            ->with('success', 'Pembayaran Almamater & KTM ditandai ditolak.');
    }

    /**
     * Validate payment form input.
     */
    private function validatePayment(Request $request): array
    {
        return $request->validate([
            'user_id' => 'required|exists:users,id',
            'amount' => 'required|numeric|min:0',
            'status' => 'required|in:pending,verified,rejected',
            'notes' => 'nullable|string|max:500',
            'payment_proof' => 'nullable|file|mimes:pdf,jpg,jpeg,png|max:2048',
        ], [
            'user_id.required' => 'Mahasiswa wajib dipilih.',
            'amount.required' => 'Nominal pembayaran wajib diisi.',
            'status.required' => 'Status pembayaran wajib dipilih.',
            'payment_proof.mimes' => 'Bukti pembayaran harus berupa PDF, JPG, JPEG, atau PNG.',
            'payment_proof.max' => 'Ukuran bukti pembayaran maksimal 2 MB.',
        ]);
    }

    /**
     * Build payload for create and update actions.
     */
    private function buildPaymentPayload(
        Request $request,
        array $validated,
        ?ReregistrationPayment $payment = null,
    ): array {
        $proofPath = $payment?->payment_proof_path;

        if ($request->hasFile('payment_proof')) {
            if ($proofPath) {
                Storage::disk('public')->delete($proofPath);
            }

            $proofPath = $request->file('payment_proof')->store('reregistration-payments', 'public');
        }

        $status = $validated['status'];

        return [
            'user_id' => (int) $validated['user_id'],
            'amount' => $validated['amount'],
            'payment_proof_path' => $proofPath,
            'status' => $status,
            'verified_by' => in_array($status, ['verified', 'rejected'], true) ? Auth::id() : null,
            'verified_at' => in_array($status, ['verified', 'rejected'], true) ? now() : null,
            'notes' => $validated['notes'] ?? null,
        ];
    }
}
