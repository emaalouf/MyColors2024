<?php

namespace App\Providers;

use App\Services\Balance\Api\CustomerBalanceInterface;
use App\Services\Balance\Model\CustomerBalanceService;
use App\Services\Catalog\Api\CatalogServiceInterface;
use App\Services\Catalog\Model\CatalogService;
use App\Services\Content\Api\ContentServiceInterface;
use App\Services\Content\Model\ContentService;
use App\Services\Customer\Api\AuthServicesInterface;
use App\Services\Customer\Api\CustomerServiceInterface;
use App\Services\Customer\Model\AuthService;
use App\Services\Customer\Model\CustomerService;
use App\Services\Sales\Api\SalesServiceInterface;
use App\Services\Sales\Model\SalesService;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {

        $this->app->bind(CatalogServiceInterface::class,CatalogService::class);

        $this->app->bind(ContentServiceInterface::class,ContentService::class);

        $this->app->bind(CustomerServiceInterface::class,CustomerService::class);

        $this->app->bind(CustomerBalanceInterface::class,CustomerBalanceService::class);

        $this->app->bind(AuthServicesInterface::class,AuthService::class);

        $this->app->bind(SalesServiceInterface::class,SalesService::class);
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {

    }
}
