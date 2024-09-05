<?php

namespace App\Http\Controllers\Api\V3;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\V3\StoreCustomerRequest;
use App\Http\Requests\Api\V3\UpdateCustomerRequest;
use App\Models\Customer;
use Illuminate\Http\Request;

class CustomerController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        // Retrieve the Bearer token from the Authorization header
        $authorizationHeader = $request->header('Authorization');

        if ($authorizationHeader && preg_match('/Bearer\s(\S+)/', $authorizationHeader, $matches)) {
            $token = $matches[1]; // Extract the token from the header
        } else {
            return response()->json(['message' => 'Token is required'], 400);
        }

        // Find the customer by the token (in this case, assuming token = entity_id)
        $customer = Customer\Entity::with('getCustomerAddresses') // eager load addresses
        ->where('entity_id', intval($token))
            ->first();

        if ($customer) {
            $addresses = $customer->getCustomerAddresses;
            $response = [
                'is_address_true' => $addresses->isNotEmpty(),
                'customer_address' => [
                    'id' => $customer->entity_id,
                    'group_id' => $customer->group_id,
                    'default_billing' => $customer->default_billing,
                    'default_shipping' => $customer->default_shipping,
                    'created_at' => $customer->created_at,
                    'updated_at' => $customer->updated_at,
                    'created_in' => $customer->created_in,
                    'dob' => $customer->dob,
                    'email' => $customer->email,
                    'firstname' => $customer->firstname,
                    'lastname' => $customer->lastname,
                    'gender' => $customer->gender,
                    'store_id' => $customer->store_id,
                    'website_id' => $customer->website_id,
                    'addresses' => $addresses->map(function ($address) {
                        return [
                            'id' => $address->id,
                            'customer_id' => $address->parent_id,
                            'region' => [
                                'region_code' => $address->region_code,
                                'region' => $address->region,
                                'region_id' => $address->region_id,
                            ],
                            'country_id' => $address->country_id,
                            'street' => json_decode($address->street),
                            'telephone' => $address->telephone,
                            'city' => $address->city,
                            'firstname' => $address->firstname,
                            'lastname' => $address->lastname,
                            'custom_attributes' => json_decode($address->custom_attributes, true),
                        ];
                    }),
                    'disable_auto_group_change' => $customer->disable_auto_group_change,
                    'custom_attributes' => json_decode($customer->custom_attributes, true),
                ]
            ];

            return response()->json($response, 200);
        } else {
            return response()->json(['message' => 'Customer not found'], 404);
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
