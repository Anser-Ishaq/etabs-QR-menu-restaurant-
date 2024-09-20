<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class GoogleReviewController extends Controller
{
    public function index()
    {
        return view('googleReview.index');
    }

    public function store(Request $request)
    {
        $request->validate([
            'google_review' => ['required', 'url'],
        ]);

        Auth::user()->restaurant()->update([
            'google_review' => $request->google_review,
        ]);

        return redirect()->route('admin.googleReview.index')->withStatus(__('Restaurant successfully updated.'));
    }
}
