<?php

namespace App\Http\Controllers\Api\V3;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\LoginUserRequest;
use App\Models\Customer\Entity;
use App\Services\Customer\Model\MagentoEncryptor;
use App\Traits\ApiResponses;
use Illuminate\Support\Str;

class AuthController extends Controller
{
    use ApiResponses;

    protected $encryptor;

    public function __construct(MagentoEncryptor $encryptor)
    {
        $this->encryptor = $encryptor;
    }

    public function loginCustomer(LoginUserRequest $request)
    {
        $request->validated($request->all());

        $email = $request->input('email');
        $password = $request->input('password');
        $deviceToken = $request->input('deviceToken');
        $deviceLanguage = $request->input('deviceLanguage');

        try {
            $customer = Entity::where('email', $email)->first();

            if (!$customer) {
                return $this->InvalidEmailOrPasswordException();
            }

            if ($customer->is_locked) {
                return $this->UserLockedException();
            }

            // Assuming is_confirmed logic is uncommented and valid
//            if (!$customer->is_confirmed) {
//                return $this->EmailNotConfirmedException();
//            }

            $storedHash = $customer->password_hash;

            if ($this->encryptor->validateHash($password, $storedHash)) {
                $plainTextToken = Str::random(40);

                // Update device token and language if provided
                if ($deviceToken || $deviceLanguage) {
                    if ($customer->device_token !== $deviceToken || $customer->device_language !== $deviceLanguage) {
                        if ($deviceToken) {
                            $customer->device_token = $deviceToken;
                        }
                        if ($deviceLanguage) {
                            $customer->device_language = $deviceLanguage;
                        }
                        $customer->save();
                    }
                }

                // Retrieve customer addresses and custom attributes
                $addresses = $customer->getCustomerAddresses()->get();
                $customAttributes = $this->getCustomAttributes($customer); // Assuming a method to get custom attributes
                $extensionAttributes = $this->getExtensionAttributes($customer); // Assuming a method to get extension attributes

                return response()->json([
                    'token' => $plainTextToken,
                    'customer' => [
                        'id' => $customer->entity_id,
                        'group_id' => $customer->group_id ?? null,
                        'default_billing' => $customer->default_billing ?? null,
                        'default_shipping' => $customer->default_shipping ?? null,
                        'created_at' => $customer->created_at,
                        'updated_at' => $customer->updated_at,
                        'created_in' => $customer->created_in ?? null,
                        'dob' => $customer->dob ?? null,
                        'email' => $customer->email,
                        'firstname' => $customer->firstname ?? null,
                        'lastname' => $customer->lastname ?? null,
                        'gender' => $customer->gender ?? null,
                        'store_id' => $customer->store_id ?? null,
                        'website_id' => $customer->website_id ?? null,
                        'addresses' => $addresses->map(function ($address) {
                            return [
                                'id' => $address->entity_id,
                                'customer_id' => $address->parent_id,
                                'region' => [
                                    'region_code' => $address->region_code ?? null,
                                    'region' => $address->region ?? null,
                                    'region_id' => $address->region_id ?? null,
                                ],
                                'region_id' => $address->region_id ?? null,
                                'country_id' => $address->country_id,
                                'street' => $address->street,
                                'telephone' => $address->telephone,
                                'city' => $address->city,
                                'firstname' => $address->firstname,
                                'lastname' => $address->lastname,
                                'custom_attributes' => $this->getAddressCustomAttributes($address), // Assuming a method to get custom attributes
                            ];
                        }),
                        'disable_auto_group_change' => $customer->disable_auto_group_change ?? null,
                        'extension_attributes' => $extensionAttributes,
                        'custom_attributes' => $customAttributes,
                    ],
                ]);
            }

            throw new \Exception('Invalid credentials');
        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 400);
        }
    }

    private function getCustomAttributes($customer)
    {
        return [];
    }

    private function getExtensionAttributes($customer)
    {
        return [];
    }

    private function getAddressCustomAttributes($address)
    {
        return [];
    }
}
