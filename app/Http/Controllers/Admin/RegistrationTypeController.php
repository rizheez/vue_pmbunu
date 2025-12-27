<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\RegistrationType;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;

class RegistrationTypeController extends Controller
{
    public function index(): Response
    {
        $types = RegistrationType::withCount('registrations')
            ->orderBy('name')
            ->get();

        return Inertia::render('admin/registration-types/Index', [
            'types' => $types,
        ]);
    }

    public function store(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255|unique:registration_types,name',
            'description' => 'nullable|string|max:500',
            'is_active' => 'boolean',
        ]);

        RegistrationType::create($validated);

        return redirect()->back()->with('success', 'Jenis pendaftaran berhasil ditambahkan.');
    }

    public function update(Request $request, int $id): RedirectResponse
    {
        $type = RegistrationType::findOrFail($id);

        $validated = $request->validate([
            'name' => 'required|string|max:255|unique:registration_types,name,'.$id,
            'description' => 'nullable|string|max:500',
            'is_active' => 'boolean',
        ]);

        $type->update($validated);

        return redirect()->back()->with('success', 'Jenis pendaftaran berhasil diperbarui.');
    }

    public function destroy(int $id): RedirectResponse
    {
        $type = RegistrationType::findOrFail($id);
        $type->delete();

        return redirect()->back()->with('success', 'Jenis pendaftaran berhasil dihapus.');
    }
}
