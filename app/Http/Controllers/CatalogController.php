<?php

namespace App\Http\Controllers;

use App\Services\Catalog\Api\CatalogServiceInterface;
use Illuminate\Http\Request;

class CatalogController extends Controller
{
    /**
     * @var CatalogServiceInterface
     */
    protected $catalogServiceInterface;

    public function __construct(CatalogServiceInterface $catalogServiceInterface)
    {
        $this->catalogServiceInterface = $catalogServiceInterface;
    }
    public function getCategoryTree()
    {
        return $this->catalogServiceInterface->getCategoryTree();
    }
}
