<?php

/** @var \Laravel\Lumen\Routing\Router $router */

use Illuminate\Support\Facades\DB;

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

// Magento APIs
$router->group(['prefix' => 'rest'], function () use ($router) {
    
    // V2 Routes
    $router->group(['prefix' => 'V2'], function () use ($router) {
        $router->get('/orders/mine', 'Api\V2\SalesController@getCustomerOrderList');
        $router->get('wishlist', 'Api\V2\WishlistController@getWishlist');
        $router->get('categories', 'CatalogController@getCategoryTree');

        // Protected authenticated routes under V2
        $router->group(['middleware' => 'auth:sanctum'], function () use ($router) {
            $router->get('customer/balance', 'Api\V2\BalanceController@getCustomerBalance');
        });
    });

    // V3 Routes
    $router->group(['prefix' => 'V3'], function () use ($router) {
        $router->get('customers/me', 'Api\V3\CustomerController@getCustomerAddresses');
        $router->post('customer/login', 'Api\V3\AuthController@loginCustomer');
    });
});
