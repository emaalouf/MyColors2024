<?php

namespace App\Models\Catalog\Category;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Entity extends Model
{
    use HasFactory;
    protected $table = "catalog_category_entity";

    public function children()
    {
        return $this->hasMany(Entity::class, 'parent_id');
    }
}
