<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\RegistrationPeriod;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;

class PeriodController extends Controller
{
    public function index(): Response
    {
        $periods = RegistrationPeriod::orderByDesc('academic_year')
            ->orderByDesc('wave_number')
            ->get();

        return Inertia::render('admin/periods/Index', [
            'periods' => $periods,
        ]);
    }

    public function store(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'academic_year' => 'required|string|max:20',
            'wave_number' => 'required|integer|min:1',
            'start_date' => 'required|date',
            'end_date' => 'required|date|after:start_date',
        ]);

        RegistrationPeriod::create($validated);

        return redirect()->back()->with('success', 'Periode berhasil ditambahkan.');
    }

    public function update(Request $request, int $id): RedirectResponse
    {
        $period = RegistrationPeriod::findOrFail($id);

        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'academic_year' => 'required|string|max:20',
            'wave_number' => 'required|integer|min:1',
            'start_date' => 'required|date',
            'end_date' => 'required|date|after:start_date',
        ]);

        $period->update($validated);

        return redirect()->back()->with('success', 'Periode berhasil diperbarui.');
    }

    public function destroy(int $id): RedirectResponse
    {
        $period = RegistrationPeriod::findOrFail($id);
        $period->delete();

        return redirect()->back()->with('success', 'Periode berhasil dihapus.');
    }

    public function activate(int $id): RedirectResponse
    {
        // Deactivate all periods
        RegistrationPeriod::query()->update(['is_active' => false]);

        // Activate selected
        $period = RegistrationPeriod::findOrFail($id);
        $period->update(['is_active' => true]);

        return redirect()->back()->with('success', "Periode {$period->name} diaktifkan.");
    }
}
