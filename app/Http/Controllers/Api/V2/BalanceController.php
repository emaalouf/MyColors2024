<?php

namespace App\Http\Controllers\Api\V2;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\V2\CheckBalanceRequest;
use App\Services\Balance\Api\CustomerBalanceInterface;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class BalanceController extends Controller
{
    protected $customerBalanceService;

    public function __construct(CustomerBalanceInterface $customerBalanceService)
    {
        $this->customerBalanceService = $customerBalanceService;
    }

    public function getCustomerBalance(CheckBalanceRequest $request)
    {
        // Since the token validation is handled by CheckBalanceRequest, you can proceed directly
        $user = $request->user();  // Sanctum automatically attaches the user based on the token

        try {
            $balance = $this->customerBalanceService->getCustomerBalance($user->id);
            return response()->json($balance);
        } catch (ModelNotFoundException $e) {
            return response()->json(['message' => 'Balance not found'], 404);
        }
    }
}
