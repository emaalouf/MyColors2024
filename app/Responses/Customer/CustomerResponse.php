<?php

namespace App\Responses\Customer;

use App\Models\Customer\Entity;

class CustomerResponse
{
    public static function customerDetails(Entity $customer)
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
    }
}
