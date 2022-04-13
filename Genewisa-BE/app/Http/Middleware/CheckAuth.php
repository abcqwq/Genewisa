<?php

namespace App\Http\Middleware;

use App\Http\Controllers\ResponseController;
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
        error_log($request->header('token'));
        if ($request->session()->has('token') && $request->header('token') == $request->session()->get('token')) {
            return $next($request);
        }

        return (new ResponseController)->toResponse(null, 400, ['Unauthenticated']);
    }
}
