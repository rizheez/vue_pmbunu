<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PaymentSetting;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;

class PaymentSettingController extends Controller
{
    /**
     * Show payment settings page.
     */
    public function index(): Response
    {
        $settings = PaymentSetting::getAllAsArray();

        return Inertia::render('admin/payment-settings/Index', [
            'settings' => $settings,
        ]);
    }

    /**
     * Update payment settings.
     */
    public function update(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'payment_type' => 'required|string|in:bank_transfer,va',
            'payment_bank_name' => 'required|string|max:100',
            'payment_account_number' => 'required|string|max:50',
            'payment_account_name' => 'required|string|max:255',
            'payment_amount' => 'required|numeric|min:0',
            'payment_instructions' => 'nullable|string|max:1000',
        ], [
            'payment_type.required' => 'Tipe pembayaran wajib dipilih.',
            'payment_bank_name.required' => 'Nama bank wajib diisi.',
            'payment_account_number.required' => 'Nomor rekening wajib diisi.',
            'payment_account_name.required' => 'Nama pemilik rekening wajib diisi.',
            'payment_amount.required' => 'Jumlah pembayaran wajib diisi.',
        ]);

        PaymentSetting::setValue('payment_type', $validated['payment_type'], 'select');
        PaymentSetting::setValue('payment_bank_name', $validated['payment_bank_name']);
        PaymentSetting::setValue('payment_account_number', $validated['payment_account_number']);
        PaymentSetting::setValue('payment_account_name', $validated['payment_account_name']);
        PaymentSetting::setValue('payment_amount', $validated['payment_amount'], 'number');
        PaymentSetting::setValue('payment_instructions', $validated['payment_instructions'] ?? '', 'textarea');

        return redirect()->route('admin.payment-settings.index')
            ->with('success', 'Pengaturan pembayaran berhasil disimpan.');
    }
}
