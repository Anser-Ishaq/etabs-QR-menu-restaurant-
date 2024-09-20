<?php
namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\User;
use Auth;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Laravel\Socialite\Facades\Socialite;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    //protected $redirectTo = '/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

//     public function login(Request $request)
// {
//     $validatedData = $request->validate([
//         'email' => 'required|email',
//         'password' => 'required',
//     ]);

//     // Retrieve user by email
//     $user = User::where('email', $request->email)->first();

//     // Check if user exists and password matches
//     if (!$user || !Hash::check($request->password, $user->password)) {
//         return redirect()->back()->withErrors([
//             'email' => 'The provided credentials do not match our records.',
//         ]);
//     }

//     // Generate OTP (6-digit random number)
//     $otp = mt_rand(100000, 999999);

//     // Update user record with OTP
//     $user->otp = $otp;
//     $user->save();

//     // Store email and password in session (if needed)
//     session([
//         'email' => $request->email,
//         'password' => $request->password,
//     ]);

//     // Redirect to OTP verification page
//     return redirect()->route('home');
// }

    


    public function redirectTo()
    {
        $lastVendor = session('last_visited_restaurant_alias', null);
        if ($lastVendor && auth()->user()->hasRole('client')) {
            return route('vendrobyalias', ['alias' => $lastVendor]);
        } else {
            return  route('home');
        }

    }

    public function redirectToOtp(){
        return view('auth.otp');
    }
    public function verifyOtp(Request $request)
    {
        // Retrieve email and password from session
        $email = session('email');
        $password = session('password');
    
        // Retrieve user by email
        $user = User::where('email', $email)->first();
    
        // Check if user input OTP matches the stored OTP
        if ($user && $request->otp == $user->otp) {
            // Clear the OTP from user record after successful verification
            $user->otp = null;
            $user->save();
    
            // Clear the email and password from session
            session()->forget(['email', 'password']);
    
            // Redirect to home route
            return redirect()->route('dashboard')->with([
                'email' => $user->email,
                'password' => $password, // Note: Sending password in response is not recommended in real-world applications
            ]);
        } else {
            // Return error response if OTP does not match
            return redirect()->back()->with('error', 'Invalid OTP');
        }
    }
    


    public function logout(Request $request)
    {

        $isClient = auth()->user()->hasRole('client');
        $lastVendor = session('last_visited_restaurant_alias', null);
        $this->guard()->logout();
        $request->session()->invalidate();
        if ($lastVendor && $isClient) {
            return redirect(route('vendrobyalias', ['alias' => $lastVendor]));
        } else {
            return $this->loggedOut($request) ?: redirect('/');
        }
    }

    public function googleRedirectToProvider()
    {
        return Socialite::driver('google')->redirect();
    }

    /**
     * Obtain the user information from Google.
     */
    public function googleHandleProviderCallback(): RedirectResponse
    {
        $user_google = Socialite::driver('google')->stateless()->user();
        $user = User::where('email', $user_google->email)->first();
        if (! $user) {
            $user = new User;
            $user->google_id = $user_google->id;
            $user->name = $user_google->name;
            $user->email = $user_google->email;
            $user->api_token = Str::random(80);
            $user->save();

            $user->assignRole('client');
        } else {
            if (empty($user->google_id)) {
                $user->google_id = $user_google->id;
            }

            $user->update();
        }

        // login
        Auth::loginUsingId($user->id);

        return redirect($this->redirectTo());
    }

    public function facebookRedirectToProvider()
    {
        return Socialite::driver('facebook')->redirect();
    }

    /**
     * Obtain the user information from Google.
     */
    public function facebookHandleProviderCallback(): RedirectResponse
    {
        $user_facebook = Socialite::driver('facebook')->stateless()->user();
        $user = User::where('email', $user_facebook->email)->first();
        if (! $user) {
            $user = new User;
            $user->fb_id = $user_facebook->id;
            $user->name = $user_facebook->name;
            $user->email = $user_facebook->email;
            $user->api_token = Str::random(80);
            $user->save();

            $user->assignRole('client');
        } else {
            if (empty($user->fb_id)) {
                $user->fb_id = $user_facebook->id;
            }

            $user->update();
        }
        // login
        Auth::loginUsingId($user->id);

        return redirect($this->redirectTo());
    }
}
