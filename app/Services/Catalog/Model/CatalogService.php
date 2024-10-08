<?php

namespace App\Services\Catalog\Model;

use App\Models\Catalog\Category\Entity;
use App\Services\Catalog\Api\CatalogServiceInterface;

class CatalogService implements CatalogServiceInterface
{
    public function getCategoryTree()
    {
        $categories = Entity::where('parent_id',1)->with('children')->get();

        return response()->json([
            "tree" => $categories
        ]);
    }
}
