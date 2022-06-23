<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UserAuthController extends Controller
{
    public function login(Request $request)
    {
        $user = User::where('username', $request->username)->first();

        if (!$user || ! Hash::check($request->password, $user->password)){
            return (new ResponseController)->toResponse(null, 400, ['Username atau password salah...']);
        }
        return (new UserTokenController)->store($request);
        
    }

    public function logout(Request $request)
    {
        return (new UserTokenController)->delete($request);
    }

    public function register(Request $request)
    {
        $values = array(
            'username' => $request->username,
            'password' => Hash::make($request->password),
            'first_name' => $request->first_name,
            'last_name' => $request->last_name
        );

        $rules = [
            'username' => 'required',
            'password' => 'required',
            'first_name' => 'required'
        ];

        $errormsg = [
            'required' => 'username/password/firstname harus diisi'
        ];
        $validation = Validator::make($values, $rules, $errormsg);
        $user = User::find($request->username);
        if (isset($user)) {
            return (new ResponseController)->toResponse(null, 400, ["username sudah dipakai!"]);
        }
        if ($validation->fails()) {
            return (new ResponseController)->toResponse(null, 400, ["ada field kosong!"]);
        }
        return (new ResponseController)->toResponse(User::create($values), 200);
    }
}
