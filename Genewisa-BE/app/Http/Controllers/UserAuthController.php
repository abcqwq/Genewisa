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
        $image="";

        $images=array(
            "https://i.imgur.com/eVAwKPb.png",
            "https://i.imgur.com/6loORhj.png",
            "https://i.imgur.com/5BzoAbV.png", 
            "https://i.imgur.com/grs05yK.png", 
            "https://i.imgur.com/b6gPRRu.png", 
            "https://i.imgur.com/T0lr23r.png"
        );
        $b = rand(1,10);
        if ($b <= 2){
            $image = "https://i.imgur.com/BpWouf3.png";
        }else{
            $image = $images[array_rand($images,1)];
        }

        $values = array(
            'username' => $request->username,
            'password' => Hash::make($request->password),
            'first_name' => $request->first_name,
            'last_name' => $request->last_name,
            'img' => $image
        );

        $values = array(
            'username' => $request->username,
            'password' => Hash::make($request->password),
            'first_name' => $request->first_name,
            'last_name' => $request->last_name,
            'img' => $image
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
