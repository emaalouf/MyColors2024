<?php

namespace App\Http\Controllers;

use App\Models\Catalog\Product\Entity;
use App\Models\Sales\Order;
use Illuminate\Http\Request;

class TestController extends Controller
{
    public function getTest()
    {
        return Entity::all()->take(10);
    }
}
