<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\User>
 */
class UserFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'username' => $this->faker->unique()->userName(),
            'password' => Hash::make($this->faker->password()), 
            'first_name' => $this->faker->firstName(),
            'last_name' => $this->faker->numberBetween(1, 5) == 5 ? null : $this->faker->lastName(),
        ];
    }
}
