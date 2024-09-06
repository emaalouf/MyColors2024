<?php

namespace App\Responses\Sales;

class SalesResponses
{
    public static function OrdersResponse($orders)
    {
        return [
            'count' => count($orders->items()),
            'total_count' => $orders->total(),
            'items' => OrderResponse::collection($orders),
            'page_size' => $orders->perPage(),
            'current_page' => $orders->currentPage()
        ];
    }
}
