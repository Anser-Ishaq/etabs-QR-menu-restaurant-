<div class="position-relative">
    <div class="d-flex flex-column h-screen justify-content-between align-items-center mx-auto pb-5 px-4"
        style="max-width: 600px;" x-on:load.window="$wire.loaded()">
        @if ($step === 1)
            <x-webapp.home />
        @elseif ($step === 2)
            <x-webapp.home.restaurant />
        @else
            <x-webapp.home.loading />
        @endif
        <div class="text-nowrap text-white pb-2 {{ in_array($step, [1, 2]) ? 'visible' : '' }}"
            style="visibility: hidden;">
            <span>{{ __('Find out more about ') }}</span>
            <span>{{ config('app.name') }}</span>
            <span>{{ __('on our') }}</span>
            <a class="text-white" href="https://etabs.io">{{ __('website') }}.</a>
        </div>
    </div>
    <div class="-z-1 position-absolute top-0 left-0 h-100 w-100 bg-image {{ $step === 2 ? 'visible' : '' }}"
        style="visibility: hidden; background-image: url('{{ asset($company->coverm) }}')"></div>
    <div class="-z-1 position-absolute top-0 left-0 h-100 w-100 d-block"
        style="{{ $step === 2 ? 'opacity: 0.5;background: black;' : 'background: var(--km-main);' }}">
    </div>
</div>
