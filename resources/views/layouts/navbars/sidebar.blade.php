@if (in_array(config('app.locale'),['ar','he','fa','ur']))
    <nav class="navbar navbar-vertical fixed-right navbar-expand-md navbar-light bg-white" id="sidenav-main">
@else
    <nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
@endif

    <div class="container-fluid">
        <!-- Toggler -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!-- Brand -->
        <a class="navbar-brand pt-0" href="/">
            <img style="height: 35px" src="{{ config('global.site_logo') }}" class="navbar-brand-img" alt="...">
        </a>
        <!-- User -->
        <ul class="nav align-items-center d-md-none">
            <li class="nav-item dropdown">
                <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <div class="media align-items-center">
                        <span class="avatar avatar-sm rounded-circle">
                            
                            
                            <img alt="..." src="{{'https://www.gravatar.com/avatar/'.md5(auth()->user()->email) }}">
                        </span>
                    </div>
                </a>
                <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
                    <div class=" dropdown-header noti-title">
                        <h6 class="text-overflow m-0">{{ __('Welcome!') }}</h6>
                    </div>
                    <a href="{{ route('profile.edit') }}" class="dropdown-item">
                        <i class="ni ni-single-02"></i>
                        <span>{{ __('My profile') }}</span>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="{{ route('logout') }}" class="dropdown-item" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                        <svg fill="#000000" height="1rem" width="1rem" viewBox="0 0 489.9 489.9" xml:space="preserve"><g><path d="M468.3,255.8c0.1-0.1,0.1-0.1,0.2-0.2c0.3-0.4,0.6-0.7,0.8-1.1c0.1-0.1,0.1-0.2,0.2-0.3c0.2-0.4,0.5-0.8,0.7-1.2     c0-0.1,0.1-0.2,0.1-0.2c0.2-0.4,0.4-0.8,0.6-1.3c0-0.1,0-0.1,0.1-0.2c0.2-0.4,0.3-0.9,0.5-1.4c0-0.1,0-0.2,0.1-0.2     c0.1-0.5,0.3-0.9,0.3-1.4c0-0.2,0-0.3,0.1-0.5c0.1-0.4,0.1-0.8,0.2-1.2c0.1-0.6,0.1-1.1,0.1-1.7c0-0.6,0-1.1-0.1-1.7     c0-0.4-0.1-0.8-0.2-1.2c0-0.2,0-0.3-0.1-0.5c-0.1-0.5-0.2-0.9-0.3-1.4c0-0.1,0-0.2-0.1-0.2c-0.1-0.5-0.3-0.9-0.5-1.4     c0-0.1,0-0.1-0.1-0.2c-0.2-0.4-0.4-0.9-0.6-1.3c0-0.1-0.1-0.2-0.1-0.2c-0.2-0.4-0.4-0.8-0.7-1.2c-0.1-0.1-0.1-0.2-0.2-0.3     c-0.3-0.4-0.5-0.8-0.8-1.1c-0.1-0.1-0.1-0.1-0.2-0.2c-0.4-0.4-0.7-0.9-1.2-1.3l-98.9-98.8c-6.7-6.7-17.6-6.7-24.3,0     c-6.7,6.7-6.7,17.6,0,24.3l69.6,69.6H136.8c-9.5,0-17.2,7.7-17.2,17.1c0,9.5,7.7,17.2,17.2,17.2h276.8l-69.1,69.1     c-6.7,6.7-6.7,17.6,0,24.3c3.3,3.3,7.7,5,12.1,5s8.8-1.7,12.1-5l98.3-98.3C467.5,256.6,467.9,256.2,468.3,255.8z"/><path d="M110.7,34.3h128c9.5,0,17.2-7.7,17.2-17.1c0-9.5-7.7-17.2-17.2-17.2h-128C59.4,0,17.6,41.8,17.6,93.1v303.7     c0,51.3,41.8,93.1,93.1,93.1h125.9c9.5,0,17.2-7.7,17.2-17.1c0-9.5-7.7-17.2-17.2-17.2H110.7c-32.4,0-58.8-26.4-58.8-58.8V93.1     C52,60.6,78.3,34.3,110.7,34.3z"/></g></svg>
                        <span>{{ __('Logout') }}</span>
                    </a>
                </div>
            </li>
        </ul>
        <!-- Collapse -->
        <div class="collapse navbar-collapse" id="sidenav-collapse-main">
            <!-- Collapse header -->
            <div class="navbar-collapse-header d-md-none">
                <div class="row">
                    <div class="col-6 collapse-brand">
                        <a href="{{ route('home') }}">
                            <img style="height: 50px" src="{{ asset("images/logo.jpg") }}">
                        </a>
                    </div>
                    <div class="col-6 collapse-close">
                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle sidenav">
                            <span></span>
                            <span></span>
                        </button>
                    </div>
                </div>
            </div>
            <!-- Navigation -->
            @if(Auth::user()->isImpersonating())
                <hr class="my-3">
                <ul class="navbar-nav ">
                    <li class="nav-item">
                      <a class="nav-link active active-pro" href="{{ route('admin.restaurants.stopImpersonate') }}">
                        <i class="ni ni-button-power text-red"></i>
                        <span class="nav-link-text">{{ __('Back to your account')}}</span>
                      </a>
                    </li>
                  </ul>
                <hr class="my-3">
            @endif
            @if(auth()->user()->hasRole('admin'))
                @include('layouts.navbars.menus.admin')
            @else
                <span></span>
            @endif

            @if(auth()->user()->hasRole('manager'))
                @include('layouts.navbars.menus.manager')
            @else
                <span></span>
            @endif

            @if(auth()->user()->hasRole('driver'))
                @include('layouts.navbars.menus.driver')
            @else
                <span></span>
            @endif

            @if(auth()->user()->hasRole('owner'))
                @include('layouts.navbars.menus.owner')
            @else
                <span></span>
            @endif

            @if(auth()->user()->hasRole('staff'))
                @include('layouts.navbars.menus.staff')
            @else
                <span></span>
            @endif

            @if(auth()->user()->hasRole('client'))
                @include('layouts.navbars.menus.client')
            @else
                <span></span>
            @endif

            @if(config('settings.restoloyalty_token'))
            @if(auth()->user()->hasRole('admin'))
                <hr class="my-3">
                <h6 class="navbar-heading text-muted">{{ __('External plugins')}}</h6>
                <ul class="navbar-nav">
                    <li class="nav-item">
                    <a class="nav-link" href="https://app.restoloyalty.com/sso/{{ config('settings.restoloyalty_token') }}">
                            <i class="ni ni-credit-card text-info"></i> {{ __('Loyalty Platform') }}
                        </a>
                    </li>
                </ul>
            @endif
            @endif

            <!-- Divider -->
            <hr class="my-3">
            <!-- Heading -->
            {{-- @if(auth()->user()->hasRole('admin'))
            <h6 class="navbar-heading text-muted">{{ __('Version')}} {{ config('version.version')}}   <span id="uptodate" class="badge badge-success" style="display:none;">{{ __('latest') }}</span></h6>
                <h6>{{ \Carbon\Carbon::now() }} </h6>
                
                <hr class="my-3">
                <div id="update_notification" style="display:none;" class="alert alert-info">
                    <button type="button" style="margin-left: 20px" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div> 
                <div id="uptodate_notification" style="display:none;" class="alert alert-success">
                    <button type="button" style="margin-left: 20px" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div> 
                
            @endif --}}
            
        </div>
    </div>
</nav>
