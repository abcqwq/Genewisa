<?php

namespace Database\Seeders;

use \App\Models\User;
use App\Models\Review;
use App\Models\TempatWisata;
use Illuminate\Database\Seeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        User::factory(50)->create();
        TempatWisata::factory(50)->create();
        Review::factory(50)->create();
    }
}
