<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\TempatWisata;
use App\Models\User;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Review>
 */
class ReviewFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        $user = User::pluck('username')->toArray();
        $tempatWisata = TempatWisata::pluck('id')->toArray(); 
        return [
            'username' => $this->faker->unique()->randomElement($user),
            'id_tempatwisata' => $this->faker->unique()->randomElement($tempatWisata),
            'rating' => $this->faker->numberBetween(1, 5),
            'comment' => $this->faker->numberBetween(1, 3) == 3 ? null : $this->faker->paragraph(rand(3,9))
        ];
    }
}
