<?php

namespace App\View\Components\Layouts;

use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class Webapp extends Component
{
    public function render(): View
    {
        return view('layouts.webapp');
    }
}
