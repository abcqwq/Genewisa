<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;

class LoginController extends Controller
{
    public function login(Request $request)
    {

        if ($request->username == 'admin' && $request->username == $request->password) {
            return (new AdminTokenController)->store();
        }

        return (new ResponseController)->toResponse(null, 400, ['Username atau password salah...']);
    }

    public function logout(Request $request)
    {
        return (new AdminTokenController)->delete($request);
    }
}
