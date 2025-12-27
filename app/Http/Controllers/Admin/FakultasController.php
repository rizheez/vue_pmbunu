<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Fakultas;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;

class FakultasController extends Controller
{
    public function index(): Response
    {
        $fakultas = Fakultas::withCount('programStudi')
            ->orderBy('name')
            ->get();

        return Inertia::render('admin/fakultas/Index', [
            'fakultas' => $fakultas,
        ]);
    }

    public function store(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255|unique:fakultas,name',
            'code' => 'required|string|max:10|unique:fakultas,code',
            'is_active' => 'boolean',
        ]);

        Fakultas::create($validated);

        return redirect()->back()->with('success', 'Fakultas berhasil ditambahkan.');
    }

    public function update(Request $request, int $id): RedirectResponse
    {
        $fakultas = Fakultas::findOrFail($id);

        $validated = $request->validate([
            'name' => 'required|string|max:255|unique:fakultas,name,'.$id,
            'code' => 'required|string|max:10|unique:fakultas,code,'.$id,
            'is_active' => 'boolean',
        ]);

        $fakultas->update($validated);

        return redirect()->back()->with('success', 'Fakultas berhasil diperbarui.');
    }

    public function destroy(int $id): RedirectResponse
    {
        $fakultas = Fakultas::findOrFail($id);
        $fakultas->delete();

        return redirect()->back()->with('success', 'Fakultas berhasil dihapus.');
    }
}
