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
        return [
            'user_id' => ['required', 'exists:users,id'],
            'source_type' => ['required', 'in:generate_web,upload_file'],
            'letter_number' => ['required', 'string', 'max:100', 'unique:admission_letters,letter_number'],
            'letter_date' => ['required', 'date'],
            'subject' => ['required', 'string', 'max:100'],
            'signatory_name' => ['required', 'string', 'max:150'],
            'uploaded_pdf' => ['nullable', 'required_if:source_type,upload_file', 'file', 'mimes:pdf', 'max:5120', new SafeFileName],
        ];
    }
}
