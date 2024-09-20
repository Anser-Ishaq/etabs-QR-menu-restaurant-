<?php

namespace App\Http\Controllers;

use Akaunting\Module\Facade as Module;
use App\Items;
use App\Order;
use App\Restorant;
use App\User;
use Carbon\Carbon;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Cookie;
use Modules\Expenses\Models\Expenses;

class HomeController extends Controller
{
    public array $filters = [
        '0' => ['name' => 'Today', 'selected' => true],
        '7' => ['name' => 'Last 7 days', 'selected' => false],
        '14' => ['name' => 'Last 14 days', 'selected' => false],
        '30' => ['name' => 'Last 30 days', 'selected' => false],
        '60' => ['name' => 'Last 60 days', 'selected' => false],
        '90' => ['name' => 'Last 90 days', 'selected' => false],
    ];

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    private function driverInfo()
    {
        $driver = auth()->user();

        //Today paid orders
        $today = Order::where(['driver_id' => $driver->id])->where('payment_status', 'paid')->where('created_at', '>=', Carbon::today());

        //Week paid orders
        $week = Order::where(['driver_id' => $driver->id])->where('payment_status', 'paid')->where('created_at', '>=', Carbon::now()->startOfWeek());

        //This month paid orders
        $month = Order::where(['driver_id' => $driver->id])->where('payment_status', 'paid')->where('created_at', '>=', Carbon::now()->startOfMonth());

        //Previous month paid orders
        $previousmonth = Order::where(['driver_id' => $driver->id])->where('payment_status', 'paid')->where('created_at', '>=', Carbon::now()->subMonth(1)->startOfMonth())->where('created_at', '<', Carbon::now()->subMonth(1)->endOfMonth());

        //This user driver_percent_from_deliver
        $driver_percent_from_deliver = intval(auth()->user()->getConfig('driver_percent_from_deliver', config('settings.driver_percent_from_deliver'))) / 100;

        $earnings = [
            'today' => [
                'orders' => $today->count(),
                'earning' => $today->sum('delivery_price') * $driver_percent_from_deliver,
                'icon' => 'bg-gradient-red',
            ],
            'week' => [
                'orders' => $week->count(),
                'earning' => $week->sum('delivery_price') * $driver_percent_from_deliver,
                'icon' => 'bg-gradient-orange',
            ],
            'month' => [
                'orders' => $month->count(),
                'earning' => $month->sum('delivery_price') * $driver_percent_from_deliver,
                'icon' => 'bg-gradient-green',
            ],
            'previous' => [
                'orders' => $previousmonth->count(),
                'earning' => $previousmonth->sum('delivery_price') * $driver_percent_from_deliver,
                'icon' => 'bg-gradient-info',
            ],
        ];

        return view('dashboard', [
            'earnings' => $earnings,
        ]);
    }

    public function pureSaaSIndex($lang = null)
    {
        $locale = Cookie::get('lang') ? Cookie::get('lang') : config('settings.app_locale');
        if ($lang != null) {
            //this is language route
            $locale = $lang;
        }
        if ($locale != 'android-chrome-256x256.png') {
            App::setLocale(strtolower($locale));
            session(['applocale_change' => strtolower($locale)]);
        }

        $dataToDisplay = [];
        foreach (config('global.modulesWithDashboardInfo') as $moduleWithDashboardInfo) {
            $generatedClass = Module::get($moduleWithDashboardInfo)->get('nameSpace')."\Http\Controllers\DashboardController";
            $dataToDisplay[$moduleWithDashboardInfo] = (new $generatedClass())->index();
        }
        //dd($dataToDisplay);

        $response = new \Illuminate\Http\Response(view('dashboard_pure', $dataToDisplay));
        $response->withCookie(cookie('lang', $locale, 120));
        App::setLocale(strtolower($locale));

        return $response;
    }

    public function index(Request $request, $lang = null)
    {
        if (config('settings.makePureSaaS', false) || (auth()->user()->hasRole('admin') && Module::has('pureadmindash'))) {
            return $this->pureSaaSIndex($lang);
        }

        $locale = Cookie::get('lang') ? Cookie::get('lang') : config('settings.app_locale');
        if ($lang != null) {
            //this is language route
            $locale = $lang;

        }
        if ($locale != 'android-chrome-256x256.png') {
            App::setLocale(strtolower($locale));
            session(['applocale_change' => strtolower($locale)]);
        }

        if (auth()->user()->hasRole('owner') || auth()->user()->hasRole('staff')) {
            \App\Services\ConfChanger::switchCurrency(auth()->user()->restorant);
        }

        // dd(Carbon::today()->subDays($request->get('filter', 0)));

        $last30days = Carbon::now()->subDays(30);
        $last7days = Carbon::now()->subDays(7);
        $last14days = Carbon::now()->subDays(14);
        $last60days = Carbon::now()->subDays(60);
        $last90days = Carbon::now()->subDays(90);

        // Driver
        if (auth()->user()->hasRole('driver')) {
            return $this->driverInfo();
        } elseif (auth()->user()->hasRole('client')) {
            // Redirect to pure client dashboard
            return $this->pureSaaSIndex($lang);
        } elseif (auth()->user()->hasRole('admin') && config('app.isft')) {
            // Admin in FT
            $last30daysDeliveryFee = Order::where('created_at', '>', $last30days)->where('payment_status', 'paid')->sum('delivery_price');
            $last30daysStaticFee = Order::where('created_at', '>', $last30days)->where('payment_status', 'paid')->sum('static_fee');
            $last30daysDynamicFee = Order::where('created_at', '>', $last30days)->where('payment_status', 'paid')->sum('fee_value');
            $last30daysTotalFee = DB::table('orders')
                ->select(DB::raw('SUM(delivery_price + static_fee + fee_value) AS sumValue'))
                ->where('created_at', '>', $last30days)
                ->where('payment_status', 'paid')
                ->value('sumValue');

            $last7daysDeliveryFee = Order::where('created_at', '>', $last7days)->where('payment_status', 'paid')->sum('delivery_price');
            $last7daysStaticFee = Order::where('created_at', '>', $last7days)->where('payment_status', 'paid')->sum('static_fee');
            $last7daysDynamicFee = Order::where('created_at', '>', $last7days)->where('payment_status', 'paid')->sum('fee_value');
            $last7daysTotalFee = DB::table('orders')
                ->select(DB::raw('SUM(delivery_price + static_fee + fee_value) AS sumValue'))
                ->where('created_at', '>', $last7days)
                ->where('payment_status', 'paid')
                ->value('sumValue');

            $last14daysDeliveryFee = Order::where('created_at', '>', $last14days)->where('payment_status', 'paid')->sum('delivery_price');
            $last14daysStaticFee = Order::where('created_at', '>', $last14days)->where('payment_status', 'paid')->sum('static_fee');
            $last14daysDynamicFee = Order::where('created_at', '>', $last14days)->where('payment_status', 'paid')->sum('fee_value');
            $last14daysTotalFee = DB::table('orders')
                ->select(DB::raw('SUM(delivery_price + static_fee + fee_value) AS sumValue'))
                ->where('created_at', '>', $last14days)
                ->where('payment_status', 'paid')
                ->value('sumValue');

            $last60daysDeliveryFee = Order::where('created_at', '>', $last60days)->where('payment_status', 'paid')->sum('delivery_price');
            $last60daysStaticFee = Order::where('created_at', '>', $last60days)->where('payment_status', 'paid')->sum('static_fee');
            $last60daysDynamicFee = Order::where('created_at', '>', $last60days)->where('payment_status', 'paid')->sum('fee_value');
            $last60daysTotalFee = DB::table('orders')
                ->select(DB::raw('SUM(delivery_price + static_fee + fee_value) AS sumValue'))
                ->where('created_at', '>', $last60days)
                ->where('payment_status', 'paid')
                ->value('sumValue');

            $last90daysDeliveryFee = Order::where('created_at', '>', $last90days)->where('payment_status', 'paid')->sum('delivery_price');
            $last90daysStaticFee = Order::where('created_at', '>', $last90days)->where('payment_status', 'paid')->sum('static_fee');
            $last90daysDynamicFee = Order::where('created_at', '>', $last90days)->where('payment_status', 'paid')->sum('fee_value');
            $last90daysTotalFee = DB::table('orders')
                ->select(DB::raw('SUM(delivery_price + static_fee + fee_value) AS sumValue'))
                ->where('created_at', '>', $last90days)
                ->where('payment_status', 'paid')
                ->value('sumValue');
        } else {
            $last30daysDeliveryFee = 0;
            $last30daysStaticFee = 0;
            $last30daysDynamicFee = 0;
            $last30daysTotalFee = 0;

            $last7daysDeliveryFee = 0;
            $last7daysStaticFee = 0;
            $last7daysDynamicFee = 0;
            $last7daysTotalFee = 0;

            $last14daysDeliveryFee = 0;
            $last14daysStaticFee = 0;
            $last14daysDynamicFee = 0;
            $last14daysTotalFee = 0;

            $last60daysDeliveryFee = 0;
            $last60daysStaticFee = 0;
            $last60daysDynamicFee = 0;
            $last60daysTotalFee = 0;

            $last90daysDeliveryFee = 0;
            $last90daysStaticFee = 0;
            $last90daysDynamicFee = 0;
            $last90daysTotalFee = 0;
        }

        $doWeHaveExpensesApp = false; // Be default for other don't enable expenses

        if (auth()->user()->hasRole('staff')) {
            if (in_array('poscloud', config('global.modules', []))) {
                //Redirect to POS
                return redirect()->route('poscloud.index');
            } else {
                //Redirect to Orders
                return redirect()->route('orders.index');
            }

        }
        if (auth()->user()->hasRole('manager')) {
            return redirect()->route('admin.restaurants.index');
        }
        if (isset($_GET['page'])) {

        } elseif (! config('app.ordering')) {
            if (auth()->user()->hasRole('owner')) {
                return redirect()->route('admin.restaurants.edit', auth()->user()->restorant->id);
            } elseif (auth()->user()->hasRole('admin')) {
                return redirect()->route('admin.restaurants.index');
            }
        }

        $expenses = [
            'costValue' => [],
        ];

        $months = [
            1 => __('Jan'),
            2 => __('Feb'),
            3 => __('Mar'),
            4 => __('Apr'),
            5 => __('May'),
            6 => __('Jun'),
            7 => __('Jul'),
            8 => __('Aug'),
            9 => __('Sep'),
            10 => __('Oct'),
            11 => __('Nov'),
            12 => __('Dec'),
        ];

        $sevenMonthsDate = Carbon::now()->subMonths(6)->startOfMonth();
        $salesValueRaw = Order::where('created_at', '>', $sevenMonthsDate)
            ->where('payment_status', 'paid')
            ->groupBy(DB::raw('YEAR(created_at), MONTH(created_at)'))
            ->orderBy(DB::raw('YEAR(created_at), MONTH(created_at)'), 'asc')
            ->select(DB::raw('count(id) as totalPerMonth'), DB::raw('ROUND(SUM(order_price + delivery_price),2) AS sumValue'), DB::raw('MONTH(created_at) month'))
            ->get()->toArray();
        $monthsIds = array_map(function ($o) {
            return $o['month'];
        }, $salesValueRaw);
        $salesValue = array_combine($monthsIds, $salesValueRaw);
        foreach ($salesValue as $key => &$sale) {
            $sale['monthName'] = $months[$key];
        }

        //Expenses  - Owner only
        if (auth()->user()->hasRole('owner') && Module::has('expenses')) {
            $doWeHaveExpensesApp = true;
            $last30daysCostValue = Expenses::where([['created_at', '>', $last30days]])->sum('amount');

            $expensesValueRaw = Expenses::where('created_at', '>', $sevenMonthsDate)
                ->groupBy(DB::raw('YEAR(date), MONTH(date)'))
                ->orderBy(DB::raw('YEAR(date), MONTH(date)'), 'asc')
                ->select(DB::raw('SUM(amount) AS costValue'), DB::raw('MONTH(date) month'))
                ->get()->toArray();

            $monthsIds = array_map(function ($o) {
                return $o['month'];
            }, $expensesValueRaw);
            $costValue = array_combine($monthsIds, $expensesValueRaw);
            foreach ($costValue as $monthKey => $cost) {
                if (isset($salesValue[$monthKey])) {
                    $salesValue[$monthKey]['costValue'] = $cost['costValue'];
                }
            }

            //Cost per group
            $last30daysCostPerGroup = Expenses::where([['created_at', '>', $last30days]])
                ->groupBy('expenses_category_id')
                ->select('id', 'expenses_category_id', DB::raw('SUM(amount) AS amount'))->get();
            $last30daysCostPerGroupLabels = [];
            $last30daysCostPerGroupValues = [];
            foreach ($last30daysCostPerGroup as $key => $category) {
                array_push($last30daysCostPerGroupLabels, $category->category->name);
                array_push($last30daysCostPerGroupValues, $category->amount);
            }

            //Cost per vedor
            $last30daysCostPerVendor = Expenses::where([['created_at', '>', $last30days]])
                ->groupBy('expenses_vendor_id')
                ->select('id', 'expenses_vendor_id', DB::raw('SUM(amount) AS amount'))->get();

            $last30daysCostPerVendorLabels = [];
            $last30daysCostPerVendorValues = [];
            foreach ($last30daysCostPerVendor as $key => $vendor) {
                array_push($last30daysCostPerVendorLabels, $vendor->vendor->name);
                array_push($last30daysCostPerVendorValues, $vendor->amount);
            }

            $expenses = [
                'last30daysCostValue' => $last30daysCostValue,
                'costValue' => $costValue,
                'last30daysCostPerGroupLabels' => $last30daysCostPerGroupLabels,
                'last30daysCostPerGroupValues' => $last30daysCostPerGroupValues,
                'last30daysCostPerVendorLabels' => $last30daysCostPerVendorLabels,
                'last30daysCostPerVendorValues' => $last30daysCostPerVendorValues,
            ];
        }

        $monthList = [];
        foreach ($salesValue as $key => $salerecord) {
            array_push($monthList, $salerecord['monthName']);
        }

        $availableLanguagesENV = config('settings.front_languages');
        $exploded = explode(',', $availableLanguagesENV);
        $availableLanguages = [];
        for ($i = 0; $i < count($exploded); $i += 2) {
            $availableLanguages[$exploded[$i]] = $exploded[$i + 1];
        }

        $countItems = 0;
        if (auth()->user()->hasRole('admin')) {
            $countItems = Restorant::count();
        }
        if (auth()->user()->hasRole('owner')) {
            if (auth()->user()->restorant && auth()->user()->restorant->categories) {
                $countItems = Items::whereIn('category_id', auth()->user()->restorant->categories->pluck('id')->toArray())->whereNull('deleted_at')->count();
            }
        }
        $dataToDisplay = [
            'availableLanguages' => $availableLanguages,
            'locale' => $locale,
            'expenses' => $expenses,
            'doWeHaveExpensesApp' => $doWeHaveExpensesApp,
            'allViews' => auth()->user()->hasRole('owner') ? auth()->user()->restorant->views : Restorant::sum('views'),
            'salesValue' => $salesValue,
            'monthLabels' => $monthList,
            'countItems' => $countItems,
            // 'countItems7' => $countItems7,
            'last30daysDeliveryFee' => $last30daysDeliveryFee,
            'last30daysStaticFee' => $last30daysStaticFee,
            'last30daysDynamicFee' => $last30daysDynamicFee,
            'last30daysTotalFee' => $last30daysTotalFee,
            'filters' => $this->filters,
            'stats' => $this->getStats(),
            'cards' => [],
        ];

        $response = new \Illuminate\Http\Response(view('dashboard', $dataToDisplay));
        $response->withCookie(cookie('lang', $locale, 120));
        App::setLocale(strtolower($locale));

        return $response;
    }

    private function getStats(): array
    {
        $stats = [];
        foreach (array_keys($this->filters) as $key) {
            $stats[$key] = $this->getStat(Carbon::today()->subDays($key));
        }

        return $stats;
    }

    private function getStat(Carbon $date)
    {
        $query = Order::query()
            ->where('orders.created_at', '>=', $date)
            ->where('payment_status', 'paid');

        if (auth()->user()->hasRole('owner') || auth()->user()->hasRole('staff')) {
            $query->where(['restorant_id' => auth()->user()->restorant->id]);
        }

        $order = $query->clone()
            ->select(
                DB::raw('ROUND(SUM(order_price+fee_value),2) as total_price'), // fullPrice: instead of order_price
                DB::raw('SUM(order_price) as net_price'), // fullPrice: instead of order_price
                DB::raw('SUM(static_fee + fee_value) AS total_fee'),
                // DB::raw('SUM(CASE WHEN delivery_method = "1" THEN 1 ELSE 0 END) as total_deliveries'),
                DB::raw('SUM(static_fee) AS total_static_fee'),
                DB::raw('SUM(fee_value) AS total_service_fee'),
                DB::raw('SUM(tip) AS total_tip'),
            )
            ->first();

        $orderCount = $query->count();

        if (auth()->user()->hasRole('admin')) {
            $result = [
                'orders' => [
                    'icon' => 'fa-shopping-basket',
                    'iconBg' => 'bg-yellow',
                    'title' => __('Orders'),
                    'value' => $orderCount,
                ],
                'total' => [
                    'icon' => 'fa-chart-line',
                    'iconBg' => 'bg-success',
                    'title' => __('Sales Volume'),
                    'value' => $this->money($order?->total_price),
                ],
                'restaurants' => [
                    'icon' => 'fa-folder',
                    'iconBg' => 'bg-warning',
                    'title' => __('Number of restaurants'),
                    'value' => Restorant::count(),
                ],
                'views' => [
                    'icon' => 'fa-users',
                    'iconBg' => 'bg-info',
                    'title' => __('Views'),
                    'value' => Restorant::sum('views'),
                ],
                'service_fee' => [
                    'icon' => 'fa-users',
                    'iconBg' => 'bg-info',
                    'title' => __('Service Fee Revenue'),
                    'value' => $this->money($order?->total_service_fee),
                ],
                'net' => [
                    'icon' => 'fa-users',
                    'iconBg' => 'bg-info',
                    'title' => __('Net income'),
                    'value' => $this->money($order?->net_price),
                ],
                'platform_fee' => [
                    'icon' => 'fa-dollar-sign',
                    'iconBg' => 'bg-success',
                    'title' => __('Platform Fee Revenue'),
                    'value' => $this->money($order?->total_fee),
                ],

            ];

        }

        if (auth()->user()->hasRole('owner') || auth()->user()->hasRole('staff')) {
            $splits = $query->clone()
                ->join('transactions', 'orders.id', '=', 'transactions.order_id')
                ->where('transactions.is_paid', 1)
                ->count('transactions.id');

            $averageTime = $query->clone()
                ->select(DB::raw('AVG(TIMESTAMPDIFF(SECOND, created_at, updated_at)) as average_time'))
                ->value('average_time') ?? 0;
            if ($averageTime > 0) {
                $averageTime = floor($averageTime / 60);
            }

            $result = [
                'orders' => [
                    'icon' => 'fa-shopping-basket',
                    'iconBg' => 'bg-yellow',
                    'title' => __('Orders'),
                    'value' => $orderCount,
                ],
                'total' => [
                    'icon' => 'fa-chart-line',
                    'iconBg' => 'bg-success',
                    'title' => __('Sales Revenue'),
                    'value' => $this->money($order?->total_price),
                ],
                'table_time' => [
                    'icon' => 'fa-clock',
                    'iconBg' => 'bg-warning',
                    'title' => __('Average Table Time'),
                    'value' => $averageTime,
                ],
                'total_tip' => [
                    'icon' => 'fa-dollar',
                    'iconBg' => 'bg-success',
                    'title' => __('Total Tips'),
                    'value' => $this->money($order?->total_tip),
                ],
                'total_splits' => [
                    'icon' => 'fa-users',
                    'iconBg' => 'bg-info',
                    'title' => __('Number of Splits'),
                    'value' => $splits - $orderCount > 0 ? $splits - $orderCount : $splits,
                ],
                'google_reviews' => [
                    'icon' => 'fa-users',
                    'iconBg' => 'bg-info',
                    'title' => __('Google Reviews'),
                    'value' => 0,
                ],
            ];
        }

        return $result;
    }

    private function money(mixed $amount = null): string
    {
        return money(is_numeric($amount) ? $amount : 0, config('settings.cashier_currency'), config('settings.do_convertion'))->__toString();
    }

    /**
     * Show the application dashboard.
     */
    private function getHomeCards(Request $request)
    {
        $orders = Order::query()->orderBy('created_at', 'desc');

        //Get client's orders
        if (auth()->user()->hasRole('client')) {
            $orders = $orders->where(['client_id' => auth()->user()->id]);
        } elseif (auth()->user()->hasRole('driver')) {
            $orders = $orders->where(['driver_id' => auth()->user()->id]);
        } elseif (auth()->user()->hasRole('owner')) {
            $orders = $orders->where(['restorant_id' => auth()->user()->restorant->id]);
        }

        //FILTER BY RESTAURANT
        if ($request->has('restorant_id')) {
            $orders = $orders->where(['restorant_id' => $request->restorant_id]);
        }

        //BY CLIENT
        if ($request->has('client_id')) {
            $orders = $orders->where(['client_id' => $request->client_id]);
        }

        //BY DRIVER
        if ($request->has('driver_id')) {
            $orders = $orders->where(['driver_id' => $request->driver_id]);
        }

        //BY DATE FROM
        if ($request->has('fromDate')) {
            $orders = $orders->whereDate('created_at', '>=', $request->fromDate);
        }

        if ($request->has('toDate')) {
            $orders = $orders->whereDate('created_at', '>=', $request->toDate);
        }

        $orders = $orders->where('payment_status', 'paid')->whereNotNull('payment_method');

        // Generate cards data
        $cards = [
            ['value' => 0, 'isMoney' => false, 'id' => 'orders', 'title' => 'Orders'],
            ['value' => 0, 'isMoney' => true, 'id' => 'total', 'title' => 'Total'],
            ['value' => 0, 'isMoney' => true, 'id' => 'platform_fee', 'title' => 'Platform Fee'],
            ['value' => 0, 'isMoney' => true, 'id' => 'net', 'title' => 'Net'],
            ['value' => 0, 'isMoney' => true, 'id' => 'processor_fee', 'title' => 'Processor fee'],
            ['value' => 0, 'isMoney' => false, 'id' => 'deliveries', 'title' => 'Deliveries'],
            ['value' => 0, 'isMoney' => true, 'id' => 'deliveries_income', 'title' => 'Delivery income'],
            ['value' => 0, 'isMoney' => true, 'id' => 'platform_profit', 'title' => 'Platform profit'],
        ];

        foreach ($orders->get() as $order) {
            $cards[0]['value'] += 1;
            $cards[1]['value'] += $order->delivery_price + $order->full_price;
            $cards[2]['value'] += $order->fee_value + $order->static_fee;
            $cards[3]['value'] += $order->full_price - $order->fee_value - $order->static_fee;
            $cards[4]['value'] += $order->fee_value;
            $cards[5]['value'] += $order->delivery_method == '1' ? 1 : 0;
            $cards[6]['value'] += $order->delivery_price;
            $cards[7]['value'] += $order->fee_value + $order->static_fee + $order->delivery_price - $order->fee_value;
        }

        return $cards;
    }
}
