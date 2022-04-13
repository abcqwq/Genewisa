<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;

class LoginController extends Controller
{
    public function login(Request $request)
    {

        if ($request->username == 'admin' && $request->username == $request->password) {
            $token = Str::random(64);
            $request->session()->put('token', $token);
            return (new ResponseController)->toResponse(['token' => $token], 200);
        }

        return (new ResponseController)->toResponse(null, 400, ['Username atau password salah...']);
    }

    public function logout(Request $request)
    {
        if ($request->session()->has('token')) {
            $request->session()->forget('token');
            return (new ResponseController)->toResponse('Log-out successful', 200);
        }
        return (new ResponseController)->toResponse(null, 400, ['Silahkan log-in terlebih dahulu...']);
    }
}
