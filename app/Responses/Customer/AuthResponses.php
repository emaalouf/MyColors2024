<?php

namespace App\Responses\Customer;

use App\Models\Customer\Entity;

class AuthResponses
{
    public static function loginCustomerResponse(Entity $customer, $plainTextToken)
    {
        $addresses = $customer->getCustomerAddresses()->get();
        $customAttributes = self::getCustomAttributes($customer);
        $extensionAttributes = self::getExtensionAttributes($customer);

        return [
            'token' => $plainTextToken,
            'customer' => [
                'id' => $customer->entity_id,
                'group_id' => $customer->group_id ?? null,
                'default_billing' => $customer->default_billing ?? null,
                'default_shipping' => $customer->default_shipping ?? null,
                'created_at' => $customer->created_at,
                'updated_at' => $customer->updated_at,
                'created_in' => $customer->created_in ?? null,
                'dob' => $customer->dob ?? null,
                'email' => $customer->email,
                'firstname' => $customer->firstname ?? null,
                'lastname' => $customer->lastname ?? null,
                'gender' => $customer->gender ?? null,
                'store_id' => $customer->store_id ?? null,
                'website_id' => $customer->website_id ?? null,
                'addresses' => $addresses->map(function ($address) {
                    return [
                        'id' => $address->entity_id,
                        'customer_id' => $address->parent_id,
                        'region' => [
                            'region_code' => $address->region_code ?? null,
                            'region' => $address->region ?? null,
                            'region_id' => $address->region_id ?? null,
                        ],
                        'region_id' => $address->region_id ?? null,
                        'country_id' => $address->country_id,
                        'street' => $address->street,
                        'telephone' => $address->telephone,
                        'city' => $address->city,
                        'firstname' => $address->firstname,
                        'lastname' => $address->lastname,
                        'custom_attributes' => self::getAddressCustomAttributes($address),
                    ];
                }),
                'disable_auto_group_change' => $customer->disable_auto_group_change ?? null,
                'extension_attributes' => $extensionAttributes,
                'custom_attributes' => $customAttributes,
            ],
        ];
    }

    private static function getCustomAttributes($customer)
    {
        return []; // You can modify this method as needed
    }

    private static function getExtensionAttributes($customer)
    {
        return []; // You can modify this method as needed
    }

    private static function getAddressCustomAttributes($address)
    {
        return []; // You can modify this method as needed
    }
}
