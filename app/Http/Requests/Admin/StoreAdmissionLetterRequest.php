<?php

declare(strict_types=1);

namespace App\Http\Requests\Admin;

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
            'letter_number' => ['required', 'string', 'max:100', 'unique:admission_letters,letter_number'],
            'letter_date' => ['required', 'date'],
            'subject' => ['required', 'string', 'max:100'],
            'signatory_name' => ['required', 'string', 'max:150'],
        ];
    }
}
