<?php

declare(strict_types=1);

namespace App\Http\Controllers;

use App\Models\AdmissionLetter;
use Illuminate\Contracts\View\View;

class AdmissionLetterVerificationController extends Controller
{
    public function show(string $token): View
    {
        $letter = AdmissionLetter::with([
            'user:id,name,email,nim',
            'user.studentBiodata:id,user_id,name',
            'programStudi:id,jenjang,name',
            'user.registration:id,user_id,accepted_program_studi_id',
            'user.registration.acceptedProgramStudi:id,jenjang,name',
        ])->where('verification_token', $token)->firstOrFail();

        $programStudi = $letter->programStudi ?? $letter->user?->registration?->acceptedProgramStudi;

        return view('admission-letters.verify', [
            'letter' => $letter,
            'user' => $letter->user,
            'biodata' => $letter->user->studentBiodata,
            'registration' => $letter->user->registration,
            'programStudi' => $programStudi,
        ]);
    }
}
