<?php

use App\Http\Controllers\CatalogController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['prefix' => 'catalog'], function () {
    Route::get('categories', [CatalogController::class, 'getCategoryTree'])->name('getCategoryTree');
});
// customer route
Route::get('orders/mine',[\App\Http\Controllers\Api\V2\SalesController::class, 'getCustomerOrderList']);
//Route::group(['prefix' => 'customer'], function () {
//    Route::get('ten',[CustomerController::class,'get10Customers'])->name('get10Customers');
//});
