<?php

use App\Http\Controllers\CatalogController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\TestController;
use App\Http\Controllers\TestCustomerController;
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

// cata;pg route
Route::get('testing', [TestController::class, 'getTest'])->name('getTest');

Route::group(['prefix' => 'catalog'], function () {
    Route::get('categories', [CatalogController::class, 'getCategoryTree'])->name('getCategoryTree');
});
// customer route
Route::group(['prefix' => 'customer'], function () {
    Route::get('ten',[CustomerController::class,'get10Customers'])->name('get10Customers');
});