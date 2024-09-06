<?php

namespace App\Responses\Customer;


use Illuminate\Http\Resources\Json\JsonResource;

class CustomerResponse extends JsonResource
{
    public static function customerAddressesDetails($customer)
    {
        $addresses = $customer->getCustomerAddresses;

        return [
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
                'addresses' => AddressResource::collection($customer->getCustomerAddresses),
                'disable_auto_group_change' => $customer->disable_auto_group_change,
                'custom_attributes' => json_decode($customer->custom_attributes, true),
            ]
        ];
    }
}
