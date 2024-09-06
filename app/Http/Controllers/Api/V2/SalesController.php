<?php
namespace App\Http\Controllers\Api\V2;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\Sales\Model\SalesService;
use App\Responses\Sales\SalesResponses;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class SalesController extends Controller
{
    protected $salesService;

    public function __construct(SalesService $salesService)
    {
        $this->salesService = $salesService;
    }

    /**
     * Display a listing of the customer's orders.
     */
    public function getCustomerOrderList(Request $request)
    {
        $authorizationHeader = $request->header('Authorization');
        $token = null;
        if ($authorizationHeader && preg_match('/Bearer\s(\S+)/', $authorizationHeader, $matches)) {
            $token = $matches[1];
        }

        if (!$token) {
            return response()->json(['message' => 'Token is required'], 400);
        }

        try {
            $searchCriteria = [
                'filters' => $request->input('filters', []),
                'pageSize' => $request->input('searchCriteria.pageSize', 20),
                'currentPage' => $request->input('searchCriteria.currentPage', 1)
            ];

            $orders = $this->salesService->getCustomerOrderList($token, $searchCriteria);

            // Use the response class to format and return the response
            $response = SalesResponses::OrdersResponse($orders);

            return response()->json($response);
        } catch (ModelNotFoundException $e) {
            return response()->json(['error' => $e->getMessage()], 404);
        }
    }
}
