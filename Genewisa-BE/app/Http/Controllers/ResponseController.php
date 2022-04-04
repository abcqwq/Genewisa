<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ResponseController extends Controller
{

    public function getStatusByCode($code) {
        
        switch($code) {
            case 200:
                return 'OK';
            case 400:
                return 'BAD_REQUEST';
            case 404:
                return 'NOT_FOUND';
            case 500:
                return 'INTERNAL_SERVER_ERROR';   
        }

    }

    public function toResponse($data, $code, $error=[]) {
        return response()->json([
            'code' => $code,
            'status' => $this->getStatusByCode($code),
            'data' => $data,
            'error' => $error
        ], $code);
    }
}
