@extends('layouts.app', ['title' => __('Orders')])
@section('admin_title')
    {{__('Finances')}}
@endsection
@section('content')
    <div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
    </div>
    <div class="container-fluid mt--9">
        
        <div class="row">
            {{-- @isset($showFeeTerms))
                @include('finances.feeterms')
            @endisset --}}
            {{-- @if(config('settings.enable_stripe_connect')&&isset($showStripeConnect)?$showStripeConnect:false)
                @include('finances.stripe')
            @endif --}}
        </div>

        <br />
        <div class="container mt-3">
            <div class="row justify-content-end mb-5 ml-4">
                <div class="col-xl-3 col-lg-6">
                    <select name="filter" id="filterSelect" class="form-control">
                        <option selected value="30">Last 30 days</option>
                        <option value="7">Last 7 days</option>
                        <option value="14">Last 14 days</option>
                        <option value="30">Last 30 days</option>
                        <option value="60">Last 60 days</option>
                        <option value="90">Last 90 days</option>
                    </select>
                </div>
            </div>
        </div>
        <!-- Info cards -->
        @isset($cards)                                                                                
            @include('partials.infoboxes.index') 
        @endisset


        <br />
        <div class="row">
            <div class="col">
                <!-- Order Card -->
                @include('orders.partials.ordercard',['financialReport'=>true])
            </div>
        </div>


    </div>
@endsection