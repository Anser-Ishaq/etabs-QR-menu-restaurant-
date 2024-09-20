@props([
    'prefix' => '',
    'suffix' => '',
    'wireKey' => 'People',
    'wireValue' => null,
    'total' => null,
    'live' => false,
    'size' => '1.5rem',
    'length' => '40px',
])
<div {{ $attributes->class(['d-flex align-items-center w-100 overflow-hidden max-w-screen gap-3']) }}>
    @if ($prefix)
        <div class="text-break flex-1">{{ $prefix }}</div>
    @endif
    <div class="text-break flex-2 d-flex counter justify-content-between bg-dark align-items-center rounded-pill">
        <button class="square rounded-circle border-0 fw-bold bg-white text-black"
            style="margin: 5px;font-size: {{ $size }};--l:{{ $length }}"
            @if ($live) wire:click="decrease{{ $wireKey }}('{{ $wireValue }}')" @endif>-</button>
        <div class="fw-bold text-white mx-3" style="font-size: {{ $size }};--l:{{ $length }}">
            {{ $total ?? $this->people }}</div>
        <button class="square rounded-circle border-0 fw-bold bg-white text-black"
            style="margin: 5px;font-size: {{ $size }};--l:{{ $length }}"
            @if ($live) wire:click="increase{{ $wireKey }}('{{ $wireValue }}')" @endif>+</button>
    </div>
    @if ($suffix)
        <div class="text-break flex-1">{{ $suffix }}</div>
    @endif
</div>
