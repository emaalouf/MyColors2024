<?php

namespace App\Services\Customer\Model;

use App\Models\Customer\Entity;
use App\Services\Customer\Api\CustomerServiceInterface;

class CustomerService implements CustomerServiceInterface
{
    public function get10Customers()
    {
        $customers = Entity::all()->take(10);
        return response()->json(
            [
                "customers" => $customers,
                "success" => true
            ],200
        );
    }
}
