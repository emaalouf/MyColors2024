<?php

namespace App\Responses\Customer;

use Illuminate\Http\Resources\Json\JsonResource;

class AddressResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'customer_id' => $this->parent_id,
            'region' => [
                'region_code' => $this->region_code,
                'region' => $this->region,
                'region_id' => $this->region_id,
            ],
            'country_id' => $this->country_id,
            'street' => json_decode($this->street),
            'telephone' => $this->telephone,
            'city' => $this->city,
            'firstname' => $this->firstname,
            'lastname' => $this->lastname,
            'custom_attributes' => json_decode($this->custom_attributes, true),
        ];
    }
}
