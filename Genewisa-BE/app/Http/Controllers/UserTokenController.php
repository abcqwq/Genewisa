<?php

namespace App\Http\Controllers;

use App\Models\UserToken;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class UserTokenController extends Controller
{
    public function findToken(Request $request) {
        $tokenFromDB = UserToken::find($request->token);

        if (isset($tokenFromDB)) {
            return (new ResponseController)->toResponse($tokenFromDB, 200);
        }

        return (new ResponseController)->toResponse($tokenFromDB, 404, ["Unauthorized"]);
    }
    public function delete(Request $request)
    {
        $tokenFromDB = UserToken::find($request->token);

        if (isset($tokenFromDB)) {
            return (new ResponseController)->toResponse($tokenFromDB->delete(), 200);
        }
        
        return (new ResponseController)->toResponse(null, 404);

    }
    public function store()
    { 
        $token = Str::random(64);
        return (new ResponseController)->toResponse(UserToken::create(['token' => $token]), 200);
    }
}
