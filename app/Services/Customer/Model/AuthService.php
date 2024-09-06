<?php

namespace App\Services\Customer\Model;

use App\Models\Customer\Entity;
use App\Responses\Customer\AuthResponses;
use App\Services\Customer\Api\AuthServicesInterface;
use Illuminate\Support\Str;
use Exception;

class AuthService implements AuthServicesInterface
{
    protected $encryptor;

    public function __construct(MagentoEncryptor $encryptor)
    {
        $this->encryptor = $encryptor;
    }

    public function loginCustomer(string $email, string $password, ?string $deviceToken, ?string $deviceLanguage)
    {
        $customer = Entity::where('email', $email)->first();

        if (!$customer) {
            throw new Exception('Invalid email or password');
        }

        if ($customer->is_locked) {
            throw new Exception('User is locked');
        }

        $storedHash = $customer->password_hash;

        if ($this->encryptor->validateHash($password, $storedHash)) {
            $plainTextToken = Str::random(40);
            $customer->rp_token = $plainTextToken;

            if ($deviceToken || $deviceLanguage) {
                if ($customer->device_token !== $deviceToken || $customer->device_language !== $deviceLanguage) {
                    if ($deviceToken) {
                        $customer->device_token = $deviceToken;
                    }
                    if ($deviceLanguage) {
                        $customer->device_language = $deviceLanguage;
                    }
                }
            }

            $customer->save();

            if ($customer) {
                return AuthResponses::loginCustomerResponse($customer, $plainTextToken);
            }
        }

        throw new Exception('Invalid credentials');
    }
}
