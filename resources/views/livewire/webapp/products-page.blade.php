<section x-data="{ cartOpen: false, mobileMenuOpen: false, }">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center py-3">
            <img src="{{ asset($company->logom) }}" alt="Logo" class="square">
            <div class="">
                <button class="btn btn-outline-secondary me-2" @click="cartOpen = !cartOpen">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-cart" viewBox="0 0 16 16">
                        <path
                            d="M0 1a1 1 0 0 1 1-1h1.25a1 1 0 0 1 .97.757l.428 2.11A1 1 0 0 0 4.64 4h9.72a1 1 0 0 1 .992 1.138l-1 8A1 1 0 0 1 13.36 14H3a1 1 0 0 1-.992-.885L.219 2.057A1 1 0 0 1 0 1zm3 5v7a1 1 0 0 0 1 1h10.36a1 1 0 0 0 .992-.885l1-8a1 1 0 0 0-.992-1.138H4.64L3.546 3H1.25a1 1 0 0 0-.97.757L.431 4H3zm1 2a1 1 0 0 0-1 1v5a1 1 0 0 0 1 1h9a1 1 0 0 0 1-1v-5a1 1 0 0 0-1-1H4zm0 2v4H13v-4H4z" />
                    </svg>
                    <span>{{ __('Cart') }}</span>
                    @if (Cart::getTotalQuantity() > 0)
                        <span class="badge rounded-pill bg-warning">{{ Cart::getTotalQuantity() }}</span>
                    @endif
                </button>
            </div>
        </div>
        @if (!$company->categories->isEmpty())
            <nav class="tabbable sticky" style="top: {{ config('app.isqrsaas') ? 64 : 88 }}px;">
                <ul class="nav nav-pills bg-white mb-2">
                    <li class="nav-item nav-item-category ">
                        <a class="nav-link  mb-sm-3 mb-md-0 active" data-toggle="tab" role="tab"
                            href="">{{ __('All categories') }}</a>
                    </li>
                    @foreach ($company->categories as $key => $category)
                        @if (!$category->aitems->isEmpty())
                            <li class="nav-item nav-item-category"
                                id="{{ 'cat_' . str_replace(' ', '', strtolower($category->name)) . strval($key) }}">
                                <a class="nav-link mb-sm-3 mb-md-0" data-toggle="tab" role="tab"
                                    id="{{ 'nav_' . str_replace(' ', '', strtolower($category->name)) . strval($key) }}"
                                    href="#{{ str_replace(' ', '', strtolower($category->name)) . strval($key) }}">{{ $category->name }}</a>

                            </li>
                        @endif
                    @endforeach
                    <li class="nav-item nav-item-category">
                        <a href="/api/download-pdf" target="_blank"class="nav-link  mb-sm-3 mb-md-0 active"
                            id="downloadPdfButton" title="{{ __('Download Pdf') }}">
                            {{ __('Download PDF') }}
                        </a>
                    </li>

                </ul>
            </nav>
        @endif
        <div class="row">
            @forelse ($company->categories as $category)
                @foreach ($category->aitems as $item)
                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 mb-4">
                        <div class="card p-3 cursor-pointer"
                            @if (!($item->qty_management == 1 && $item->qty < 1)) wire:click="addToCart({{ $item->id }})" @endif>
                            <img src="{{ $item->logom }}" alt="Product Image" class="img-fluid mb-3">
                            <h5 class="fw-bold">
                                @if ($item->qty_management == 1 && $item->qty < 1)
                                    [{{ __('Out of stock') }}] -
                                @endif
                                {{ $item->name }}
                            </h5>
                            <p>{{ $item->short_description }}</p>
                            <div class="row">
                                <div class="col-6 text-muted">
                                    @if ($item->discounted_price > 0)
                                        <span class="text-muted"
                                            style="text-decoration: line-through;">@money($item->discounted_price, config('settings.cashier_currency'), config('settings.do_convertion'))</span>
                                    @endif
                                    @money($item->price, config('settings.cashier_currency'), config('settings.do_convertion'))
                                </div>
                                <div class="col-6 text-end">
                                    @if (Cart::has($item->id))
                                        {{ __('In cart') }}
                                    @endif
                                    <div class="allergens d-none">
                                        @foreach ($item->allergens as $allergen)
                                            <div class='allergen' data-toggle="tooltip" data-placement="bottom"
                                                title="{{ $allergen->title }}">
                                                <img src="{{ $allergen->image_link }}" />
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            @empty
            @endforelse
        </div>
    </div>

    <div class="sidebar" :class="{ 'open': cartOpen }">
        <button class="btn btn-danger mb-3" @click="cartOpen = false">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x"
                viewBox="0 0 16 16">
                <path
                    d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
            </svg>
        </button>
        @if ($cartItems->isNotEmpty())
            @foreach ($cartItems as $cartIndex => $cartItem)
                <div class="align-items-center d-flex gap-3 justify-content-between mb-3">
                    <div class="d-flex gap-4">
                        <img class="square" src="{{ asset($cartItem['attributes']['image']) }}" alt="Product Image">
                        <h5 class="fw-bold">{{ $cartItem['name'] }}</h5>
                    </div>
                    <div class="d-flex gap-2 align-items-center">
                        @money($cartItem['price'], config('settings.cashier_currency'), config('settings.do_convertion'))
                        <input type="number" class="form-control"
                            wire:model.live="cartItems.{{ $cartIndex }}.quantity" min="1"
                            style="width: 80px">
                        <button class="btn btn-danger delete-icon" wire:click="removeFromCart('{{ $cartIndex }}')">
                            <x-svg-delete />
                        </button>
                    </div>
                </div>
            @endforeach
            <div class="d-grid gap-2 mt-3">
                <div>
                    {{ __('Subtotal') }}: @money(Cart::getSubTotal(), config('settings.cashier_currency'), config('settings.do_convertion'))
                </div>
                <button class="btn btn-primary" wire:click="createOrder">{{ __('Create Order') }}</button>
            </div>
        @else
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                    <p class="text-muted mb-0">{{ __('Cart is empty') }}</p>
                </div>
            </div>
            <button class="btn btn-secondary" @click="cartOpen = false">{{ __('Continue Shopping') }}</button>
        @endif
    </div>
</section>
