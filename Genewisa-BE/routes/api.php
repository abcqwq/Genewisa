
<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ReviewController;
use App\Http\Controllers\TempatWisataController;
use App\Http\Controllers\AdminTokenController;

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
Route::post('/user', [UserController::class, 'store']);
Route::get('/user', [UserController::class, 'index']);
Route::get('/user/{username}', [UserController::class, 'view']);
Route::put('/user/{username}', [UserController::class, 'update']);
Route::delete('/user/{username}', [UserController::class, 'delete']);

// Tempat Wisata
Route::post('/tempat-wisata', [TempatWisataController::class, 'store']);
Route::get('/tempat-wisata', [TempatWisataController::class, 'index']);
Route::get('/tempat-wisata/{id}', [TempatWisataController::class, 'view']);
Route::put('/tempat-wisata/{id}', [TempatWisataController::class, 'update']);
Route::delete('/tempat-wisata/{id}', [TempatWisataController::class, 'delete']);

// Review
Route::post('/review', [ReviewController::class, 'store']);
Route::get('/review', [ReviewController::class, 'index']);
Route::get('/review/{id}', [ReviewController::class, 'view']);
Route::put('/review/{id}', [ReviewController::class, 'update']);
Route::delete('/review/{id}', [ReviewController::class, 'delete']);

// Admin
Route::post('/admin', [AdminTokenController::class, 'store']);
Route::get('/admin', [AdminTokenController::class, 'index']);
Route::delete('/admin', [AdminTokenController::class, 'delete']);