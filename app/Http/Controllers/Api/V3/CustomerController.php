<?php
namespace App\Http\Controllers\Api\V3;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\Customer\Model\CustomerService;
use App\Responses\Customer\CustomerResponse;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class CustomerController extends Controller
{
    protected $customerServices;

    public function __construct(CustomerService $customerServices)
    {
        $this->customerServices = $customerServices;
    }

    /**
     * Display a listing of the resource.
     */
    public function getCustomerAddresses(Request $request)
    {
        // Retrieve token from the Authorization header
        $authorizationHeader = $request->header('Authorization');
        if ($authorizationHeader && preg_match('/Bearer\s(\S+)/', $authorizationHeader, $matches)) {
            $token = $matches[1];
        } else {
            return response()->json(['message' => 'Token is required'], 400);
        }

        try {
            // Use CustomerServices to get the customer and their addresses
            $customer = $this->customerServices->getCustomerAddresses($token);

            // Return the customer details as JSON
            return response()->json(CustomerResponse::customerAddressesDetails($customer), 200);
        } catch (ModelNotFoundException $e) {
            return response()->json(['message' => $e->getMessage()], 404);
        }
    }
}
