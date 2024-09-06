<?php

namespace App\Services\Sales\Model;

use App\Models\Customer\Entity;
use App\Models\Sales\Order;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Pagination\LengthAwarePaginator;
use App\Services\Sales\Api\SalesServiceInterface;

class SalesService implements SalesServiceInterface
{
    public function getCustomerOrderList(string $token, array $searchCriteria = []): LengthAwarePaginator
    {
        $customer = Entity::where('rp_token', $token)->first();

        if (!$customer) {
            throw new ModelNotFoundException('Invalid token or customer not found');
        }

        $query = Order::where('customer_id', $customer->entity_id);

        if (!empty($searchCriteria['filters'])) {
            foreach ($searchCriteria['filters'] as $filter) {
                $query->where($filter['field'], $filter['condition'], $filter['value']);
            }
        }

        $pageSize = $searchCriteria['pageSize'] ?? 20;
        $currentPage = $searchCriteria['currentPage'] ?? 1;

        return $query->paginate($pageSize, ['*'], 'page', $currentPage);
    }
}
