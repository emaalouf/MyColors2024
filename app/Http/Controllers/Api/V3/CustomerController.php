<?php

namespace App\Http\Controllers\Api\V3;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\V3\StoreCustomerRequest;
use App\Http\Requests\Api\V3\UpdateCustomerRequest;
use App\Models\Customer;
use Illuminate\Http\Request;
use App\Responses\Customer\CustomerResponse;

class CustomerController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $authorizationHeader = $request->header('Authorization');

        if ($authorizationHeader && preg_match('/Bearer\s(\S+)/', $authorizationHeader, $matches)) {
            $token = $matches[1];
        } else {
            return response()->json(['message' => 'Token is required'], 400);
        }

        $customer = Customer\Entity::with('getCustomerAddresses')
            ->where('rp_token', $token)
            ->first();

        if ($customer) {
            return response()->json(CustomerResponse::customerDetails($customer), 200);
        } else {
            return response()->json(['message' => 'Invalid token or customer not found'], 404);
        }
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreCustomerRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Customer\Entity $customer)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Customer\Entity $customer)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateCustomerRequest $request, Customer\Entity $customer)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Customer\Entity $customer)
    {
        //
    }
}
