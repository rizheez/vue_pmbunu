<?php

namespace Database\Factories;

use App\Models\StudentBiodata;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\StudentBiodata>
 */
class StudentBiodataFactory extends Factory
{
    protected $model = StudentBiodata::class;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'user_id' => User::factory(),
            'name' => fake()->name(),
            'nik' => fake()->numerify('################'),
            'nisn' => fake()->numerify('##########'),
            'last_education' => 'SMA/SMK Sederajat',
            'school_origin' => fake()->company().' High School',
            'major' => 'IPA',
            'phone' => fake()->phoneNumber(),
            'gender' => fake()->randomElement(['Laki-laki', 'Perempuan']),
            'birth_place' => fake()->city(),
            'birth_date' => fake()->date('Y-m-d', '-18 years'),
            'religion' => 'Islam',
            'address' => fake()->address(),
        ];
    }
}
