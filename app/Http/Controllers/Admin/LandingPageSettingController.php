<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\LandingPageSetting;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Inertia\Inertia;
use Inertia\Response;

class LandingPageSettingController extends Controller
{
    public function index(): Response
    {
        $settings = LandingPageSetting::all()->groupBy('group');

        return Inertia::render('admin/landing-page/Index', [
            'settings' => $settings,
        ]);
    }

    public function update(Request $request): RedirectResponse
    {
        foreach ($request->all() as $key => $value) {
            if ($key === '_token' || $key === '_method') {
                continue;
            }

            $setting = LandingPageSetting::where('key', $key)->first();

            if ($setting) {
                // Handle file uploads
                if ($request->hasFile($key)) {
                    // Delete old file if exists
                    if ($setting->value && str_starts_with($setting->value, '/storage/')) {
                        $oldPath = str_replace('/storage/', '', $setting->value);
                        if (Storage::disk('public')->exists($oldPath)) {
                            Storage::disk('public')->delete($oldPath);
                        }
                    }

                    $path = $request->file($key)->store('landing-page', 'public');
                    $setting->update(['value' => '/storage/' . $path]);
                } else {
                    $setting->update(['value' => $value]);
                }
            }
        }

        return redirect()->back()->with('success', 'Pengaturan landing page berhasil diperbarui.');
    }
}
