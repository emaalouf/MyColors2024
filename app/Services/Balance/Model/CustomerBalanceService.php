<?php

namespace App\Services\Balance\Model;

use App\Models\Customer\Balance;
use App\Services\Balance\Api\CustomerBalanceInterface;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class CustomerBalanceService implements CustomerBalanceInterface
{
    public function getCustomerBalance(int $customerId)
    {
        $balance = Balance::where('customer_id', $customerId)->first();

        if (!$balance) {
            throw new ModelNotFoundException("No balance found for customer #$customerId");
        }

        return $balance;
    }
}
