<?php

namespace App\Http\Controllers;

use App\Services\Customer\Api\CustomerServiceInterface;
use Illuminate\Http\Request;

class CustomerController extends Controller
{
    private $customerServiceInterface;

    /**
     * @var CustomerServiceInteface $customerServiceInterface
     */
    public function __construct(CustomerServiceInterface $customerServiceInterface)
    {
        $this->customerServiceInterface = $customerServiceInterface;
    }
    public function get10Customers()
    {
        return $this->customerServiceInterface->get10Customers();
    }
}
