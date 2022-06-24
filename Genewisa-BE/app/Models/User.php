<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    use HasFactory;
    
    public $timestamps = false;
    
    protected $table = "user";

    protected $primaryKey = 'username';
    public $incrementing = false;
    
    protected $fillable = ['username', 'password', 'first_name', 'last_name', 'img'];
}