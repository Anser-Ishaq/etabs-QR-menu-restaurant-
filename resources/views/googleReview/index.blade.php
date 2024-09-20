@extends('layouts.app', ['title' => __('Google reivews')])

@section('content')
    <div class="header bg-gradient-info pb-6 pt-5 pt-md-8">
    </div>
    <div class="container-fluid mt--7">
        <div class="row">
            <div class="col-12">
                @include('partials.flash')
            </div>
            <div class="col-12">
                <div class="card bg-secondary shadow">
                    <div class="card-header bg-white border-0">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <h3 class="mb-0">{{ __('Google Review') }}</h3>
                            </div>
                        </div>
                    </div>
                    <form class="card-body" method="POST" action="{{ route('admin.googleReview.store') }}">
                        @csrf
                        <div class="pl-lg-4">
                            <div class="form-group focused">
                                <label class="form-control-label" for="google_review">
                                    {{ __('Google review link') }}
                                </label>
                                <input type="url" name="google_review" id="google_review"
                                    class="form-control form-control-alternative"
                                    placeholder="{{ __('Enter google review link') }}" required
                                    value="{{ old('google_review', auth()->user()->restaurant->google_review) }}">
                            </div>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-success mt-4">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        @include('layouts.footers.auth')
    </div>
@endsection
