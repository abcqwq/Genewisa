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
     * @param  Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if (!isset($request->key)) {
            return (new ResponseController)->toResponse(Review::paginate(10), 200);
        }
        return $this::searchByKeyword($request->key);
    }

    /**
     * Display a listing of the resource by id.
     *
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
        ];

        $errormsg = [];
        // Validate field
        $validation = Validator::make($values, $rules);
        if ($validation->fails()) {
            if (isset($request->rating) && ($request->rating > 5 || $request->rating < 1)) {
                array_push($errormsg, "nilai rating tidak valid!"); 
            }
            if (!isset($request->username) || !isset($request->id_tempatwisata) || !isset($request->rating)) {
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
        $review = Review::where('username', $request->username)->where('id_tempatwisata', $request->id_tempatwisata)->first();
        if (isset($review)) {
            array_push($errormsg, "data duplikat!");
        }

        if (count($errormsg) > 0) {
            return (new ResponseController)->toResponse(null, 400, $errormsg);
        }

        return (new ResponseController)->toResponse(Review::create($values), 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
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
        ];
        $errormsg = [];
        // Validate field
        $validation = Validator::make($values, $rules);
        if ($validation->fails()) {
            if (isset($request->rating) && ($request->rating > 5 || $request->rating < 1)) {
                array_push($errormsg, "nilai rating tidak valid!"); 
            }
            if (!isset($request->rating)) {
                array_push($errormsg, "ada field kosong!");
            }
        }
        if (count($errormsg) > 0) {
            return (new ResponseController)->toResponse(null, 400, $errormsg);
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

    private static function searchByKeyword($key) {
        $reviews = Review::where('username', 'LIKE', '%'.$key.'%')->orWhere('comment', 'LIKE', '%'.$key.'%')->paginate(10);
        return (new ResponseController)->toResponse($reviews, 200);
    }
}
