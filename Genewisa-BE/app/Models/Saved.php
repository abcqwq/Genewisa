<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Saved extends Model
{

    use HasFactory;

    public $timestamps = false;

    protected $table = "saved";

    protected $fillable= ['username', 'id_tempatwisata'];
}
