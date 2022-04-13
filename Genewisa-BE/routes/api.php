
<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\TempatWisataController;
use App\Http\Controllers\LoginController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


// User
Route::post('/user', [UserController::class, 'store'])->middleware('auth');
Route::get('/user', [UserController::class, 'index'])->middleware('auth');
Route::get('/user/{username}', [UserController::class, 'view'])->middleware('auth');
Route::put('/user/{username}', [UserController::class, 'update'])->middleware('auth');
Route::delete('/user/{username}', [UserController::class, 'delete'])->middleware('auth');

// Tempat Wisata
Route::post('/tempat-wisata', [TempatWisataController::class, 'store'])->middleware('auth');
Route::get('/tempat-wisata', [TempatWisataController::class, 'index'])->middleware('auth');
Route::get('/tempat-wisata/{id}', [TempatWisataController::class, 'view'])->middleware('auth');
Route::put('/tempat-wisata/{id}', [TempatWisataController::class, 'update'])->middleware('auth');
Route::delete('/tempat-wisata/{id}', [TempatWisataController::class, 'delete'])->middleware('auth');

// Review
Route::post('/review', [ReviewController::class, 'store'])->middleware('auth');
Route::get('/review', [ReviewController::class, 'index'])->middleware('auth');
Route::get('/review/{id}', [ReviewController::class, 'view'])->middleware('auth');
Route::put('/review/{id}', [ReviewController::class, 'update'])->middleware('auth');
Route::delete('/review/{id}', [ReviewController::class, 'delete'])->middleware('auth');

// Login
Route::post('/login', [LoginController::class, 'login']);
Route::post('/logout', [LoginController::class, 'logout']);
