<?php

/** @var \Laravel\Lumen\Routing\Router $router */

use App\Http\Controllers\Api\V2\BalanceController;
use App\Http\Controllers\Api\V2\SalesController;
use App\Http\Controllers\Api\V2\WishlistController;
use App\Http\Controllers\Api\V3\AuthController;
use App\Http\Controllers\Api\V3\CustomerController;

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});
// magento apis
$router->group(['prefix' => 'rest'], function () use ($router) {
    // V2 Routes
    $router->group(['prefix' => 'V2'], function () use ($router) {
        $router->get('/orders/mine', [SalesController::class, 'getCustomerOrderList']);
        $router->get('wishlist', [WishlistController::class, 'getWishlist']);
        // protected authenticated routes under V2
        // $router->group(['middleware' => 'auth:sanctum'], function () use ($router) {
        //     $router->get('customer/balance', [BalanceController::class, 'getCustomerBalance']);
        // });
    });
    // V3 routes
    $router->group(['prefix' => 'V3'], function () use ($router) {
        $router->get('customers/me', [CustomerController::class, 'getCustomerAddresses']);
        $router->post('customer/login', [AuthController::class, 'loginCustomer']);
    });
});
