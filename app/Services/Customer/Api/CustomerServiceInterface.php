<?php

namespace App\Services\Customer\Api;

use App\Models\Customer\Entity;

interface CustomerServiceInterface
{
    /**
     * Retrieve customer addresses based on the provided token.
     *
     * @param string $token
     * @return Entity
     * @throws \Illuminate\Database\Eloquent\ModelNotFoundException
     */
    public function getCustomerAddresses(string $token): Entity;
}
