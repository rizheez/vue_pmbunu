<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Scholarship;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;

class ScholarshipController extends Controller
{
    public function index(): Response
    {
        $scholarships = Scholarship::withCount('registrations')
            ->orderBy('name')
            ->get();

        return Inertia::render('admin/scholarships/Index', [
            'scholarships' => $scholarships,
        ]);
    }

    public function store(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255|unique:scholarships,name',
            'description' => 'nullable|string|max:500',
            'is_active' => 'boolean',
        ]);

        Scholarship::create($validated);

        return redirect()->back()->with('success', 'Pilihan beasiswa berhasil ditambahkan.');
    }

    public function update(Request $request, int $id): RedirectResponse
    {
        $scholarship = Scholarship::findOrFail($id);

        $validated = $request->validate([
            'name' => 'required|string|max:255|unique:scholarships,name,'.$id,
            'description' => 'nullable|string|max:500',
            'is_active' => 'boolean',
        ]);

        $scholarship->update($validated);

        return redirect()->back()->with('success', 'Pilihan beasiswa berhasil diperbarui.');
    }

    public function destroy(int $id): RedirectResponse
    {
        $scholarship = Scholarship::findOrFail($id);

        // Prevent deletion of system default scholarships to avoid structural breaks
        if (in_array(strtolower($scholarship->name), ['reguler', 'kipk-k', 'gratispol'], true)) {
            return redirect()->back()->with('error', 'Beasiswa bawaan sistem tidak boleh dihapus.');
        }

        $scholarship->delete();

        return redirect()->back()->with('success', 'Pilihan beasiswa berhasil dihapus.');
    }
}
