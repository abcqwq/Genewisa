<?php

namespace App\Http\Controllers;

use App\Models\Review;
use App\Models\TempatWisata;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ReviewController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $review = Review::all();
        return (new ResponseController)->toResponse($review, 200);
    }

    /**
     * Display a listing of the resource by id.
     *
     * @param  \App\Models\Review  $review
     * @return \Illuminate\Http\Response
     */    
    public function view($id) {
        $review = Review::find($id);

        if (isset($review)) {
            return (new ResponseController)->toResponse($review, 200);
        }

        return (new ResponseController)->toResponse($review, 404, ["Review dengan id " . $id . " tidak dapat ditemukan..."]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
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
            'rating' => (int)$request->rating,
            'comment' => $request->comment
        );
        $rules = [
            'username' => 'required',
            'id_tempatwisata' => 'required',
            'rating' => 'required|numeric|min:1|max:5',
            'comment' => 'required'
        ];
        // Validate field
        $validation = Validator::make($values, $rules);
        if ($validation->fails()) {
            if ($request->rating > 5 || $request->rating < 1) {
                return (new ResponseController)->toResponse(null, 400, ["nilai rating tidak valid!"]); 
            }
            return (new ResponseController)->toResponse(null, 400, ["ada field kosong!"]); 
        }
        // Validate value
        $user = User::find($request->username);
        if(!isset($user)) {
            return (new ResponseController)->toResponse(null, 400, ["username tidak valid!"]); 
        }
        $tempatWisata = TempatWisata::find($request->id_tempatwisata);
        if(!isset($tempatWisata)) {
            return (new ResponseController)->toResponse(null, 400, ["id tempat wisata tidak valid!"]); 
        }
        // Validate duplicate
        $review = Review::where('username', $request->username)->where('id_tempatwisata', $request->id_tempatwisata)->first();
        if (isset($review)) {
            return (new ResponseController)->toResponse(null, 400, ['data duplikat!']);
        }

        return (new ResponseController)->toResponse(Review::create($values), 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Review  $review
     * @return \Illuminate\Http\Response
     */
    public function show(Review $review)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Review  $review
     * @return \Illuminate\Http\Response
     */
    public function edit(Review $review)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Review  $review
     * @return \Illuminate\Http\Response
     */
    public function update($id, Request $request)
    {
        $values = array (
            'rating' => (int)$request->rating,
            'comment' => $request->comment
        );
        $rules = [
            'rating' => 'required|numeric|min:1|max:5',
            'comment' => 'required'
        ];
        // Validate field
        $validation = Validator::make($values, $rules);
        if ($validation->fails()) {
            if ($request->rating > 5 || $request->rating < 1) {
                return (new ResponseController)->toResponse(null, 400, ["nilai rating tidak valid!"]); 
            }
            return (new ResponseController)->toResponse(null, 400, ["ada field kosong!"]); 
        }

        $review = Review::find($id);
        if (!isset($review)) {
            return (new ResponseController)->toResponse($review, 404);
        }

        $review->rating = $request->rating;
        $review->comment = $request->comment;
        $review->save();
        return (new ResponseController)->toResponse($review, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Review  $review
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $review = Review::find($id);

        if (isset($review)) {
            return (new ResponseController)->toResponse($review->delete(), 200);
        }
        
        return (new ResponseController)->toResponse(null, 404);

    }
}
