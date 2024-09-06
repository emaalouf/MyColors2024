<?php

namespace App\Services\Sales\Api;

use Illuminate\Pagination\LengthAwarePaginator;

interface SalesServiceInterface
{
    /**
     * Retrieve a list of orders for a customer based on the authentication token.
     *
     * @param string $token Authentication token associated with a customer.
     * @param array $searchCriteria Criteria to filter the order query.
     * @return LengthAwarePaginator Paginated list of orders.
     */
    public function getCustomerOrderList(string $token, array $searchCriteria = []): LengthAwarePaginator;
}
