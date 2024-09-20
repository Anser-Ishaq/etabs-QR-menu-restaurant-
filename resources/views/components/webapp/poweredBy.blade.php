@props([
    'width' => '3.5rem',
    'mode' => 'dark',
])
<div {{ $attributes->class('d-flex justify-content-center align-items-baseline gap-2') }}>
    <p class="mb-0">{{ __('Powered by') }}</p>
    <x-webapp.logo :mode="$mode" style="width: {{ $width }}" />
</div>
