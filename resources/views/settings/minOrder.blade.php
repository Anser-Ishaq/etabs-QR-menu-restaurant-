@extends('layouts.app', ['title' => __('Settings')])

@section('content')
    <div class="header bg-gradient-primary pb-7 pt-5 pt-md-8">
        <div class="container-fluid">
            <div class="header-body">
                <div class="row align-items-center py-4">
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid mt--7">
        <div class="row">
            <div class="col-xl-12 order-xl-1">
                <div class="card bg-secondary shadow">
                    <div class="card-header bg-white border-0">
                        <div class="row align-items-center">
                            <div class="col-4">
                                <h3 class="mb-0">{{ __('Minimum amount') }}</h3>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">

                        @include('partials.flash')
                        <form method="post" action="{{ route('minOrder.store') }}" autocomplete="off">
                            @csrf
                            @method('put')
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="tabs-icons-text-1" role="tabpanel"
                                    aria-labelledby="tabs-icons-text-1-tab">
                                    <div id="form-group-min_order" class="form-group focused">
                                        <label class="form-control-label" for="min_order_amount">
                                            {{ __('Minimum amount') }}
                                        </label>
                                        <input step=".01" type="number" name="min_order_amount" id="min_order_amount"
                                            class="form-control" placeholder="Enter minimum amount"
                                            value="{{ $settings->min_order_amount }}" required>
                                    </div>
                                </div>
                                <div class="tab-pane fade show active" id="tabs-icons-text-1" role="tabpanel"
                                    aria-labelledby="tabs-icons-text-1-tab">
                                    <div id="form-group-min_order_message" class="form-group focused">
                                        <label class="form-control-label" for="min_order_message">
                                            {{ __('Error message') }}
                                        </label>
                                        <input type="string" max="100" name="min_order_message" id="min_order_message"
                                            class="form-control" placeholder="Enter error message"
                                            value="{{ $settings->min_order_message }}" required>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-success mt-4">{{ __('Save') }}</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
