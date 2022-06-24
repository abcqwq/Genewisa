<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TempatWisata extends Model
{
    use HasFactory;

    public $timestamps = false;
    
    protected $table = "tempatwisata";

    protected $fillable = ['name', 'city', 'pictureUrl', 'price' , 'rating', 'description'];
}