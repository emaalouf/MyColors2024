<?php

namespace App\Http\Controllers\Api\V2;

use App\Http\Controllers\Controller;
use App\Models\Customer\Entity;
use Illuminate\Http\Request;
use App\Models\Sales;

class SalesController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $authorizationHeader = $request->header('Authorization');

        if ($authorizationHeader && preg_match('/Bearer\s(\S+)/', $authorizationHeader, $matches)) {
            $token = $matches[1];
        } else {
            return response()->json(['message' => 'Token is required'], 400);
        }

        if (!$token) {
            return response()->json(['error' => 'Token is required'], 400);
        }

        $customer = Entity::where('rp_token', $token)->first();

        if (!$customer) {
            return response()->json(['error' => 'Invalid token or customer not found'], 404);
        }

        $customerId = $customer->entity_id;

        $query = Sales\Order::where('customer_id', $customerId);

        if ($request->has('filters')) {
            foreach ($request->filters as $filter) {
                $query->where($filter['field'], $filter['condition'], $filter['value']);
            }
        }

        if ($request->has('searchCriteria')) {
            $searchCriteria = $request->input('searchCriteria');
            $pageSize = $searchCriteria['pageSize'] ?? 20;
            $currentPage = $searchCriteria['currentPage'] ?? 1;

            $orders = $query->paginate($pageSize, ['*'], 'page', $currentPage);
        } else {
            $orders = $query->paginate(20);
        }


        $response = [
            'count' => count($orders->items()),
            'total_count' => $orders->total(),
            'items' => $orders->map(function ($order) {
                return [
                    'base_currency_code' => $order->base_currency_code,
                    'base_discount_amount' => $order->base_discount_amount,
                    'base_discount_canceled' => $order->base_discount_canceled,
                    'base_grand_total' => $order->base_grand_total,
                    'base_discount_tax_compensation_amount' => $order->base_discount_tax_compensation_amount,
                    'base_shipping_amount' => $order->base_shipping_amount,
                    'base_shipping_canceled' => $order->base_shipping_canceled,
                    'base_shipping_discount_amount' => $order->base_shipping_discount_amount,
                    'base_shipping_discount_tax_compensation_amnt' => $order->base_shipping_discount_tax_compensation_amnt,
                    'base_shipping_incl_tax' => $order->base_shipping_incl_tax,
                    'base_shipping_tax_amount' => $order->base_shipping_tax_amount,
                    'base_subtotal' => $order->base_subtotal,
                    'base_subtotal_canceled' => $order->base_subtotal_canceled,
                    'base_subtotal_incl_tax' => $order->base_subtotal_incl_tax,
                    'base_tax_amount' => $order->base_tax_amount,
                    'base_tax_canceled' => $order->base_tax_canceled,
                    'base_total_canceled' => $order->base_total_canceled,
                    'base_total_due' => $order->base_total_due,
                    'base_to_global_rate' => $order->base_to_global_rate,
                    'base_to_order_rate' => $order->base_to_order_rate,
                    'billing_address_id' => $order->billing_address_id,
                    'created_at' => $order->created_at,
                    'customer_dob' => $order->customer_dob,
                    'customer_email' => $order->customer_email,
                    'customer_firstname' => $order->customer_firstname,
                    'customer_gender' => $order->customer_gender,
                    'customer_group_id' => $order->customer_group_id,
                    'customer_id' => $order->customer_id,
                    'customer_is_guest' => $order->customer_is_guest,
                    'customer_lastname' => $order->customer_lastname,
                    'customer_note_notify' => $order->customer_note_notify,
                    'discount_amount' => $order->discount_amount,
                    'discount_canceled' => $order->discount_canceled,
                    'email_sent' => $order->email_sent,
                    'entity_id' => $order->entity_id,
                    'global_currency_code' => $order->global_currency_code,
                    'grand_total' => $order->grand_total,
                    'discount_tax_compensation_amount' => $order->discount_tax_compensation_amount,
                    'increment_id' => $order->increment_id,
                    'is_virtual' => $order->is_virtual,
                    'order_currency_code' => $order->order_currency_code,
                    'protect_code' => $order->protect_code,
                    'quote_id' => $order->quote_id,
                    'remote_ip' => $order->remote_ip,
                    'shipping_amount' => $order->shipping_amount,
                    'shipping_canceled' => $order->shipping_canceled,
                    'shipping_description' => $order->shipping_description,
                    'shipping_discount_amount' => $order->shipping_discount_amount,
                    'shipping_discount_tax_compensation_amount' => $order->shipping_discount_tax_compensation_amount,
                    'shipping_incl_tax' => $order->shipping_incl_tax,
                    'shipping_tax_amount' => $order->shipping_tax_amount,
                    'state' => $order->state,
                    'status' => $order->status,
                    'store_currency_code' => $order->store_currency_code,
                    'store_id' => $order->store_id,
                    'store_name' => $order->store_name,
                    'store_to_base_rate' => $order->store_to_base_rate,
                    'store_to_order_rate' => $order->store_to_order_rate,
                    'subtotal' => $order->subtotal,
                    'subtotal_canceled' => $order->subtotal_canceled,
                    'subtotal_incl_tax' => $order->subtotal_incl_tax,
                    'tax_amount' => $order->tax_amount,
                    'tax_canceled' => $order->tax_canceled,
                    'total_canceled' => $order->total_canceled,
                    'total_due' => $order->total_due,
                    'total_item_count' => $order->total_item_count,
                    'total_qty_ordered' => $order->total_qty_ordered,
                    'updated_at' => $order->updated_at,
                    'weight' => $order->weight,
                ];
            }),
            'page_size' => $orders->perPage(),
            'current_page' => $orders->currentPage()
        ];

        // Return the formatted response as JSON
        return response()->json($response);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
