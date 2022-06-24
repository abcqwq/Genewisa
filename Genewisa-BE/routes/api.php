
<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ReviewController;
use App\Http\Controllers\TempatWisataController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\AdminTokenController;
use App\Http\Controllers\SavedController;
use App\Http\Controllers\UserAuthController;
use App\Http\Controllers\UserTokenController;

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

// Admin
Route::post('/admin', [AdminTokenController::class, 'store']);
Route::get('/admin', [AdminTokenController::class, 'findToken']);
Route::delete('/admin', [AdminTokenController::class, 'delete']);

// User Auth
Route::post('/user-login', [UserAuthController::class, 'login']);
Route::post('/user-logout', [UserAuthController::class, 'logout']);
Route::post('/user-register', [UserAuthController::class, 'register']);

// User Auth
Route::get('/saved', [SavedController::class, 'index']);
Route::get('/saved/{id}', [SavedController::class, 'index']);
Route::post('/saved', [SavedController::class, 'store']);
Route::delete('/saved', [SavedController::class, 'delete']);

// // User Token
// Route::post('/user-access', [UserTokenController::class, 'store']);
// Route::get('/user-access', [UserTokenController::class, 'findToken']);
// Route::delete('/user-access', [UserTokenController::class, 'delete']);