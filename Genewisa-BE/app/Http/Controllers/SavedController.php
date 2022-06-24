<?php

namespace App\Http\Controllers;

use App\Models\Saved;
use App\Models\TempatWisata;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class SavedController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @param  Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if (isset($request->username) && isset($request->id_tempatwisata)){
            return $this::searchByUsernameandIdtempat($request->username, $request->id_tempatwisata);
        }
        if (isset($request->username)) {
            return $this::searchByUsername($request->username);
        }
        if (!isset($request->key)) {
            return (new ResponseController)->toResponse(Saved::all(), 200);
        }
    }

    /**
     * Display a listing of the resource by id.
     *
     * @return \Illuminate\Http\Response
     */    
    public function view($id) {
        $saved = Saved::find($id);

        if (isset($saved)) {
            return (new ResponseController)->toResponse($saved, 200);
        }

        return (new ResponseController)->toResponse($saved, 404, ["Review dengan id " . $id . " tidak dapat ditemukan..."]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $values = array (
            'username' => $request->username,
            'id_tempatwisata' => $request->id_tempatwisata,
        );
        $rules = [
            'username' => 'required',
            'id_tempatwisata' => 'required',
        ];

        $errormsg = [];
        // Validate field
        $validation = Validator::make($values, $rules);
        if ($validation->fails()) {
            if (!isset($request->username) || !isset($request->id_tempatwisata)) {
                array_push($errormsg, "ada field kosong!");
            }
        }
        // Validate value
        $user = User::find($request->username);
        if(!isset($user) && isset($request->username)) {
            array_push($errormsg, "username tidak valid!");
        }
        $tempatWisata = TempatWisata::find($request->id_tempatwisata);
        if(!isset($tempatWisata) && isset($request->id_tempatwisata)) {
            array_push($errormsg, "id tempat wisata tidak valid!"); 
        }

        // Validate duplicate
        $saved = Saved::where('username', $request->username)->where('id_tempatwisata', $request->id_tempatwisata)->first();
        if (isset($saved)) {
            array_push($errormsg, "data duplikat!");
        }

        if (count($errormsg) > 0) {
            return (new ResponseController)->toResponse(null, 400, $errormsg);
        }

        return (new ResponseController)->toResponse(Saved::create($values), 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function delete(Request $request)
    {   
        $saved = Saved::where('username', '=', ''.$request->username.'')->where('id_tempatwisata','=', ''.$request->id_tempatwisata.'');
        if (isset($saved)) {
            return (new ResponseController)->toResponse($saved->delete(), 200);
        }
        return (new ResponseController)->toResponse(null, 404);

    }

    private static function searchByUsername($username) {
        $saved = Saved::where('username', '=', ''.$username.'')->get();
        return (new ResponseController)->toResponse($saved, 200);
    }
    private static function searchByUsernameandIdtempat($username, $id_tempatwisata) {
        $saved = Saved::where('username', '=', ''.$username.'')->where('id_tempatwisata','=', ''.$id_tempatwisata.'')->get();
        return (new ResponseController)->toResponse($saved, 200);
    }
}
