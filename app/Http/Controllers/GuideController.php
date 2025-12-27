<?php

namespace App\Http\Controllers;

use App\Models\LandingPageSetting;
use App\Models\RegistrationPeriod;
use Inertia\Inertia;
use Inertia\Response;

class GuideController extends Controller
{
    public function index(): Response
    {
        $activePeriod = RegistrationPeriod::where('is_active', true)->first();
        $settings = LandingPageSetting::where('group', 'contact')->get();

        return Inertia::render('Panduan', [
            'activePeriod' => $activePeriod,
            'contactPhone' => $settings->where('key', 'contact_phone_1')->first()?->value,
            'contactEmail' => $settings->where('key', 'contact_email')->first()?->value,
        ]);
    }

    public function view(): Response
    {
        $activePeriod = RegistrationPeriod::where('is_active', true)->first();
        $settings = LandingPageSetting::where('group', 'contact')->get();

        return Inertia::render('PanduanLengkap', [
            'activePeriod' => $activePeriod,
            'contactPhone' => $settings->where('key', 'contact_phone_1')->first()?->value,
            'contactEmail' => $settings->where('key', 'contact_email')->first()?->value,
        ]);
    }
}
