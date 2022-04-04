<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TempatWisataController;

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