<?php
namespace App\Responses\Sales;

use Illuminate\Http\Resources\Json\JsonResource;

class OrderResponse extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $order
     * @return array
     */
    public function toArray($order)
    {
        return [
            'base_currency_code' => $this->base_currency_code,
            'base_discount_amount' => $this->base_discount_amount,
            'base_discount_canceled' => $this->base_discount_canceled,
            'base_grand_total' => $this->base_grand_total,
            'base_discount_tax_compensation_amount' => $this->base_discount_tax_compensation_amount,
            'base_shipping_amount' => $this->base_shipping_amount,
            'base_shipping_canceled' => $this->base_shipping_canceled,
            'base_shipping_discount_amount' => $this->base_shipping_discount_amount,
            'base_shipping_discount_tax_compensation_amnt' => $this->base_shipping_discount_tax_compensation_amnt,
            'base_shipping_incl_tax' => $this->base_shipping_incl_tax,
            'base_shipping_tax_amount' => $this->base_shipping_tax_amount,
            'base_subtotal' => $this->base_subtotal,
            'base_subtotal_canceled' => $this->base_subtotal_canceled,
            'base_subtotal_incl_tax' => $this->base_subtotal_incl_tax,
            'base_tax_amount' => $this->base_tax_amount,
            'base_tax_canceled' => $this->base_tax_canceled,
            'base_total_canceled' => $this->base_total_canceled,
            'base_total_due' => $this->base_total_due,
            'base_to_global_rate' => $this->base_to_global_rate,
            'base_to_order_rate' => $this->base_to_order_rate,
            'billing_address_id' => $this->billing_address_id,
            'created_at' => $this->created_at,
            'customer_dob' => $this->customer_dob,
            'customer_email' => $this->customer_email,
            'customer_firstname' => $this->customer_firstname,
            'customer_gender' => $this->customer_gender,
            'customer_group_id' => $this->customer_group_id,
            'customer_id' => $this->customer_id,
            'customer_is_guest' => $this->customer_is_guest,
            'customer_lastname' => $this->customer_lastname,
            'customer_note_notify' => $this->customer_note_notify,
            'discount_amount' => $this->discount_amount,
            'discount_canceled' => $this->discount_canceled,
            'email_sent' => $this->email_sent,
            'entity_id' => $this->entity_id,
            'global_currency_code' => $this->global_currency_code,
            'grand_total' => $this->grand_total,
            'discount_tax_compensation_amount' => $this->discount_tax_compensation_amount,
            'increment_id' => $this->increment_id,
            'is_virtual' => $this->is_virtual,
            'order_currency_code' => $this->order_currency_code,
            'protect_code' => $this->protect_code,
            'quote_id' => $this->quote_id,
            'remote_ip' => $this->remote_ip,
            'shipping_amount' => $this->shipping_amount,
            'shipping_canceled' => $this->shipping_canceled,
            'shipping_description' => $this->shipping_description,
            'shipping_discount_amount' => $this->shipping_discount_amount,
            'shipping_discount_tax_compensation_amount' => $this->shipping_discount_tax_compensation_amount,
            'shipping_incl_tax' => $this->shipping_incl_tax,
            'shipping_tax_amount' => $this->shipping_tax_amount,
            'state' => $this->state,
            'status' => $this->status,
            'store_currency_code' => $this->store_currency_code,
            'store_id' => $this->store_id,
            'store_name' => $this->store_name,
            'store_to_base_rate' => $this->store_to_base_rate,
            'store_to_order_rate' => $this->store_to_order_rate,
            'subtotal' => $this->subtotal,
            'subtotal_canceled' => $this->subtotal_canceled,
            'subtotal_incl_tax' => $this->subtotal_incl_tax,
            'tax_amount' => $this->tax_amount,
            'tax_canceled' => $this->tax_canceled,
            'total_canceled' => $this->total_canceled,
            'total_due' => $this->total_due,
            'total_item_count' => $this->total_item_count,
            'total_qty_ordered' => $this->total_qty_ordered,
            'updated_at' => $this->updated_at,
            'weight' => $this->weight,
        ];
    }
}
