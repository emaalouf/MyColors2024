<?php

namespace App\Models\Customer;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Database\Eloquent\Model;

class Entity extends Model
{
    use HasApiTokens, HasFactory;

    protected $table = 'customer_entity';
    protected $primaryKey = 'entity_id';

    protected $fillable = ['email', 'password'];

    protected $hidden = ['password_hash'];

    public function getCustomerAddresses()
    {
        return $this->hasMany(Address\Entity::class, 'parent_id', 'entity_id');
    }
}
