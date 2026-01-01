<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Fakultas;
use App\Models\ProgramStudi;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;

class ProgramStudiController extends Controller
{
    public function index(): Response
    {
        $programStudi = ProgramStudi::with('fakultas')
            ->orderBy('fakultas_id')
            ->orderBy('jenjang')
            ->orderBy('name')
            ->get();

        $fakultas = Fakultas::where('is_active', true)->orderBy('name')->get();

        return Inertia::render('admin/program-studi/Index', [
            'programStudi' => $programStudi,
            'fakultas' => $fakultas,
        ]);
    }

    public function store(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'code' => 'required|string|max:20|unique:program_studi,code',
            'nim_code' => 'nullable|string|size:4',
            'jenjang' => 'required|in:S1,S2,S3,D3,D4',
            'fakultas_id' => 'required|exists:fakultas,id',
            'is_active' => 'boolean',
        ]);

        ProgramStudi::create($validated);

        return redirect()->back()->with('success', 'Program Studi berhasil ditambahkan.');
    }

    public function update(Request $request, int $id): RedirectResponse
    {
        $prodi = ProgramStudi::findOrFail($id);

        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'code' => 'required|string|max:20|unique:program_studi,code,'.$id,
            'nim_code' => 'nullable|string|size:4',
            'jenjang' => 'required|in:S1,S2,S3,D3,D4',
            'fakultas_id' => 'required|exists:fakultas,id',
            'is_active' => 'boolean',
        ]);

        $prodi->update($validated);

        return redirect()->back()->with('success', 'Program Studi berhasil diperbarui.');
    }

    public function destroy(int $id): RedirectResponse
    {
        $prodi = ProgramStudi::findOrFail($id);
        $prodi->delete();

        return redirect()->back()->with('success', 'Program Studi berhasil dihapus.');
    }
}
