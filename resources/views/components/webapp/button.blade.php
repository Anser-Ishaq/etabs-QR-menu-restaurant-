@props([
    'asLink' => true,
    'disabled' => false,
])
@if ($asLink)
    <a {{ $attributes->class(['btn w-100 rounded-pill', 'disabled' => $disabled]) }}>
        {{ $label ?? $slot }}
    </a>
@else
    <button {{ $attributes->class(['btn w-100 rounded-pill', 'disabled' => $disabled])->merge(['type' => 'button']) }}>
        {{ $label ?? $slot }}
    </button>
@endif
