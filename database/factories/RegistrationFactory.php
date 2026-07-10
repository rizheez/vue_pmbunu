<?php

namespace Database\Factories;

use App\Models\Registration;
use App\Models\RegistrationPeriod;
use App\Models\RegistrationType;
use App\Models\Scholarship;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<Registration>
 */
class RegistrationFactory extends Factory
{
    protected $model = Registration::class;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $period = RegistrationPeriod::first() ?? RegistrationPeriod::factory()->create();
        $type = RegistrationType::first() ?? RegistrationType::create(['name' => 'Umum', 'is_active' => true]);

        return [
            'user_id' => User::factory(),
            'registration_number' => Registration::generateRegistrationNumber($period),
            'registration_period_id' => $period->id,
            'registration_type_id' => $type->id,
            'scholarship_id' => Scholarship::where('name', 'Reguler')->first()?->id ?? Scholarship::factory(),
            'status' => 'submitted',
        ];
    }
}
