<?php

namespace App\Http\Controllers\Api\V3;

use App\Http\Controllers\Controller;
use App\Models\Catalog\Product\Entity;
use Illuminate\Http\Request;

class AddressService extends Controller
{
    public function getCustomerAddresses()
    {
        return Entity::all()->take(10);
    }
}
