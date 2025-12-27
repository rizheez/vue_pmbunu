<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\RegistrationPath;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;

class RegistrationPathController extends Controller
{
    public function index(): Response
    {
        $paths = RegistrationPath::withCount('registrations')
            ->orderBy('name')
            ->get();

        return Inertia::render('admin/registration-paths/Index', [
            'paths' => $paths,
        ]);
    }

    public function store(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255|unique:registration_paths,name',
            'description' => 'nullable|string|max:500',
            'is_active' => 'boolean',
        ]);

        RegistrationPath::create($validated);

        return redirect()->back()->with('success', 'Jalur pendaftaran berhasil ditambahkan.');
    }

    public function update(Request $request, int $id): RedirectResponse
    {
        $path = RegistrationPath::findOrFail($id);

        $validated = $request->validate([
            'name' => 'required|string|max:255|unique:registration_paths,name,'.$id,
            'description' => 'nullable|string|max:500',
            'is_active' => 'boolean',
        ]);

        $path->update($validated);

        return redirect()->back()->with('success', 'Jalur pendaftaran berhasil diperbarui.');
    }

    public function destroy(int $id): RedirectResponse
    {
        $path = RegistrationPath::findOrFail($id);
        $path->delete();

        return redirect()->back()->with('success', 'Jalur pendaftaran berhasil dihapus.');
    }
}
