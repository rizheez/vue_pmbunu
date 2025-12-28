<?php

namespace Database\Factories;

use App\Models\RegistrationPeriod;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\RegistrationPeriod>
 */
class RegistrationPeriodFactory extends Factory
{
    protected $model = RegistrationPeriod::class;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'name' => 'Gelombang 1 2025/2026',
            'wave_number' => 1,
            'academic_year' => '2025/2026',
            'start_date' => now()->subMonth(),
            'end_date' => now()->addMonths(2),
            'is_active' => true,
        ];
    }
}
