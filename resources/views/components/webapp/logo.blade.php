@props([
    'mode' => 'light',
])
<div {{ $attributes->class(['text-center']) }}>
    <img src='{{ asset("assets/images/logo-$mode.png") }}' alt="logo" class="img-fluid">
</div>
