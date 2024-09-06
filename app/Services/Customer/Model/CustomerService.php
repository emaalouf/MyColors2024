<?php

namespace App\Services\Customer\Model;

use App\Models\Customer\Entity;
use App\Services\Customer\Api\CustomerServiceInterface;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class CustomerService implements CustomerServiceInterface
{
    /**
     * Retrieve customer addresses based on the provided token.
     *
     * @param string $token
     * @return Entity
     * @throws ModelNotFoundException
     */
    public function getCustomerAddresses(string $token): Entity
    {
        // Retrieve the customer by token with their addresses
        $customer = Entity::with('getCustomerAddresses')
            ->where('rp_token', $token)
            ->firstOrFail();

        // Return the customer with addresses
        return $customer;
    }
}
