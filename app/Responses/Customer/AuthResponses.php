<?php

namespace App\Responses\Customer;

use App\Models\Customer\Entity;

class AuthResponses
{
    public static function loginCustomerResponse(Entity $customer, $plainTextToken)
    {
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
                'addresses' => AddressResource::collection($customer->getCustomerAddresses),
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
