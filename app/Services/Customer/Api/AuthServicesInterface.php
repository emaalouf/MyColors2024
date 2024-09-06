<?php

namespace App\Services\Customer\Api;

interface AuthServicesInterface
{
    public function loginCustomer(string $email, string $password, ?string $deviceToken, ?string $deviceLanguage);
}
