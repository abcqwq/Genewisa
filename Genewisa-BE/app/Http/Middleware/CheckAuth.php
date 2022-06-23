<?php

namespace App\Http\Middleware;

use App\Http\Controllers\ResponseController;
use App\Models\AdminToken;
use App\Models\UserToken;
use Closure;
use Illuminate\Http\Request;

class CheckAuth
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        $tokenAdminFromDB = AdminToken::find($request->token);
        $tokenUserFromDB = UserToken::find($request->token);

        if (!isset($tokenAdminFromDB) && !isset($tokenUserFromDB)) {
            return (new ResponseController)->toResponse(null, 400, ['Unauthenticated']);
        }

        return $next($request);
    }
}
