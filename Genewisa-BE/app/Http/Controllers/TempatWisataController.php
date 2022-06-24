<?php

namespace App\Http\Controllers;

use App\Models\TempatWisata;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;

class TempatWisataController extends Controller
{
    /**
     * Display a listing of the resource.
     * 
     * @param  Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

    public function index(Request $request) {
        if (!isset($request->key)) {
            if(!isset($request->page)){
                return (new ResponseController)->toResponse(TempatWisata::all(), 200);
            }
            return (new ResponseController)->toResponse(TempatWisata::paginate(10), 200);
        }
        if(!isset($request->page)){
            return $this::searchByKeywordAll($request->key);
        } else{
            return $this::searchByKeyword($request->key);
        }
    }


    /**
     * Display a listing of the resource by id.
     *
     * @param  \App\Models\TempatWisata  $tempatWisata
     * @return \Illuminate\Http\Response
     */    
    public function view($id) {
        $tempatWisata = TempatWisata::find($id);
        if (isset($tempatWisata)) {
            return (new ResponseController)->toResponse($tempatWisata, 200);
        }

        return (new ResponseController)->toResponse($tempatWisata, 404, ["Tempat wisata dengan id " . $id . " tidak dapat ditemukan..."]);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $values = array (
            'name' => $request->name,
            'city' => $request->city,
            'price' => $request->price,
            'pictureUrl' => $request->pictureUrl,
            'description' => $request->description
        );
        $rules = [
            'name' => 'required',
            'city' => 'required',
            'description' => 'required'
        ];
        $validation = Validator::make($values, $rules);
        if ($validation->fails()) {
            return (new ResponseController)->toResponse(null, 400, ["ada field kosong!"]); 
        }
        return (new ResponseController)->toResponse(TempatWisata::create($values), 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function update($id, Request $request)
    {
        $values = array (
            'name' => $request->name,
            'city' => $request->city,
            'description' => $request->description
        );
        $rules = [
            'name' => 'required',
            'city' => 'required',
            'description' => 'required'
        ];
        $validation = Validator::make($values, $rules);
        if ($validation->fails()) {
            return (new ResponseController)->toResponse(null, 400, ["ada field kosong!"]); 
        }
        $tempatWisata = TempatWisata::find($id);

        if (!isset($tempatWisata)) {
            return (new ResponseController)->toResponse($tempatWisata, 404, ["Tempat wisata dengan id " . $id . " tidak dapat ditemukan..."]);
        }

        $tempatWisata->name = $request->name;
        $tempatWisata->city = $request->city;
        $tempatWisata->description = $request->description;
        $tempatWisata->save();
        return (new ResponseController)->toResponse($tempatWisata, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $tempatWisata = TempatWisata::find($id);

        if (isset($tempatWisata)) {
            return (new ResponseController)->toResponse($tempatWisata->delete(), 200);
        }
        
        return (new ResponseController)->toResponse(null, 404, ["Tempat wisata dengan id " . $id . " tidak dapat ditemukan..."]);

    }

    private static function searchByKeyword($key) {
        $tempatWisata = TempatWisata::where('name', 'LIKE', '%'.$key.'%')->orWhere('city', 'LIKE', '%'.$key.'%')->paginate(10);
        return (new ResponseController)->toResponse($tempatWisata, 200);
    }

    private static function searchByKeywordAll($key) {
        $tempatWisata = TempatWisata::where('name', 'LIKE', '%'.$key.'%')->orWhere('city', 'LIKE', '%'.$key.'%')->get();
        return (new ResponseController)->toResponse($tempatWisata, 200);
    }
}
