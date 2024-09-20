@extends('layouts.app', ['class' => 'bg'])

@section('content')
    @include('layouts.headers.guest')

    <div class="container mt--6 pb-5">
        <div class="row justify-content-center">
            <div class="col-lg-5 col-md-7">

                <br />

                <div class="card bg-secondary shadow border-0">
                    <div class="card-body px-lg-5 py-lg-5">



                        <form method="POST" action="{{ route('verifyotp') }}">
                            @csrf

                            <div class="form-group mb-3">
                                <div class="input-group input-group-alternative">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="ni ni-email-83"></i></span>
                                    </div>
                                    <input class="form-control " placeholder="123456" type="text" name="otp"
                                        value="123456" required autofocus>
                                    <input type="hidden" name="email" value="{{ session('email') }}">
                                    <input type="hidden" name="password" value="{{ session('password') }}"> 
                                    <input type="hidden" name="token" value="{{ session('token') }}"> 
                                </div>

                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-primary my-4">Verify</button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
@endsection
