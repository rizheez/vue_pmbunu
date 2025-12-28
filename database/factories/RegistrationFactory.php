<?php

namespace Database\Factories;

use App\Models\Registration;
use App\Models\RegistrationPeriod;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Registration>
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

        return [
            'user_id' => User::factory(),
            'registration_number' => Registration::generateRegistrationNumber($period),
            'registration_period_id' => $period->id,
            'status' => 'submitted',
        ];
    }
}
