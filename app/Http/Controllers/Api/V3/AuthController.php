<?php

namespace App\Http\Controllers\Api\V3;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\LoginUserRequest;
use App\Services\Customer\Api\AuthServicesInterface;
use App\Traits\ApiResponses;

class AuthController extends Controller
{
    use ApiResponses;

    protected $authServicesInterface;

    public function __construct(AuthServicesInterface $authServicesInterface)
    {
        $this->authServicesInterface = $authServicesInterface;
    }

    public function loginCustomer(LoginUserRequest $request)
    {
        $request->validated($request->all());

        $email = $request->input('email');
        $password = $request->input('password');
        $deviceToken = $request->input('deviceToken');
        $deviceLanguage = $request->input('deviceLanguage');

        try {
            $result = $this->authServicesInterface->loginCustomer($email, $password, $deviceToken, $deviceLanguage);

            return response()->json($result, 200);
        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 400);
        }
    }
}
