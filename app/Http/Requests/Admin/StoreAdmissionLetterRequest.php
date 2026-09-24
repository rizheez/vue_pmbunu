<?php

declare(strict_types=1);

namespace App\Http\Requests\Admin;

use App\Rules\SafeFileName;
use Illuminate\Foundation\Http\FormRequest;

class StoreAdmissionLetterRequest extends FormRequest
{
    public function authorize(): bool
    {
        return $this->user()?->isAdmin() === true;
    }

    /**
     * @return array<string, mixed>
     */
    public function rules(): array
    {
        $isManual = $this->input('entry_mode') === 'manual';

        return [
            'entry_mode' => ['nullable', 'in:registered,manual'],
            'user_id' => [$isManual ? 'nullable' : 'required', 'exists:users,id'],
            'student_name' => [$isManual ? 'required' : 'nullable', 'string', 'max:255'],
            'nim' => [$isManual ? 'required' : 'nullable', 'string', 'max:30'],
            'program_studi_id' => [$isManual ? 'required' : 'nullable', 'exists:program_studi,id'],
            'registration_number' => ['nullable', 'string', 'max:50'],
            'email' => ['nullable', 'email', 'max:255'],
            'source_type' => ['required', 'in:generate_web,upload_file'],
            'letter_date' => ['required', 'date'],
            'subject' => ['required', 'string', 'max:100'],
            'signatory_name' => ['required', 'string', 'max:150'],
            'uploaded_pdf' => ['nullable', 'required_if:source_type,upload_file', 'file', 'mimes:pdf', 'max:5120', new SafeFileName],
        ];
    }

    /**
     * @return array<string, string>
     */
    public function messages(): array
    {
        return [
            'user_id.required' => 'Silakan pilih calon mahasiswa.',
            'student_name.required' => 'Nama lengkap mahasiswa wajib diisi.',
            'nim.required' => 'NIM mahasiswa wajib diisi.',
            'program_studi_id.required' => 'Program studi wajib dipilih.',
            'program_studi_id.exists' => 'Program studi yang dipilih tidak valid.',
            'letter_date.required' => 'Tanggal surat wajib diisi.',
            'subject.required' => 'Perihal surat wajib diisi.',
            'signatory_name.required' => 'Nama penandatangan wajib diisi.',
            'email.email' => 'Format email tidak valid.',
        ];
    }
}
