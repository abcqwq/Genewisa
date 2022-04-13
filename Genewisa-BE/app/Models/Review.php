<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    public $timestamps = false;

    protected $table = "review";

    protected $fillable= ['username', 'id_tempatwisata', 'rating', 'comment'];
}
