<form class="d-flex flex-column justify-content-center gap-5 align-items-center h-100" wire:submit="addName"
    method="post">
    <x-webapp.logo class="mb-3 w-75" />
    <x-webapp.input wire:model="name" class="focus-none" placeholder="{{ __('Enter name') }}" required />
    <button class="btn" type="submit">
        <i class="arrow-right"></i><i class="arrow-right"></i><i class="arrow-right"></i>
    </button>
</form>
