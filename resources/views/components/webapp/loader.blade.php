@props([
    'dotColor' => 'white',
])
<div {{ $attributes->class(['webapp-loader-container'])->merge() }}>
    <div class="webapp-loader" style="--bg:{{ $dotColor }};"></div>
    <div class="webapp-loader" style="--bg:{{ $dotColor }};--anime: .2s"></div>
    <div class="webapp-loader" style="--bg:{{ $dotColor }};--anime: .4s"></div>
</div>
