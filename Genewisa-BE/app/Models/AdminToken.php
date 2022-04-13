<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AdminToken extends Model
{
    use HasFactory;
    
    public $timestamps = false;
    
    protected $table = "admin_token";

    protected $primaryKey = 'token';
    public $incrementing = false;
    
    protected $fillable = ['token'];
}