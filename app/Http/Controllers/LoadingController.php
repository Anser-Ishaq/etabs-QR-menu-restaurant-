<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class LoadingController extends Controller
{
    public function index(){
        return view('orders.loadingscreen.loading');
    }
}
