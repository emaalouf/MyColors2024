<?php

namespace App\Services\Balance\Api;

use App\Models\Customer\Balance;

interface CustomerBalanceInterface
{
    /**
     * Retrieve customer balance based on customer ID.
     *
     * @param int $customerId
     * @return Balance
     */
    public function getCustomerBalance(int $customerId);
}
