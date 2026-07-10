<?php

namespace Database\Factories;

use App\Models\Scholarship;
use Illuminate\Database\Eloquent\Factories\Factory;

class ScholarshipFactory extends Factory
{
    protected $model = Scholarship::class;

    public function definition(): array
    {
        return [
            'name' => $this->faker->unique()->word().' Scholarship',
            'description' => $this->faker->sentence(),
            'is_active' => true,
        ];
    }
}
