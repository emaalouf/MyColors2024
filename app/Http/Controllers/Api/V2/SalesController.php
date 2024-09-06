<?php

namespace App\Http\Controllers\Api\V2;

use App\Http\Controllers\Controller;
use App\Models\Customer\Entity;
use Illuminate\Http\Request;
use App\Models\Sales;
use App\Responses\Sales\SalesResponses;

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

        // Use the response class to format and return the response
        $response = SalesResponses::formatOrdersResponse($orders);

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
