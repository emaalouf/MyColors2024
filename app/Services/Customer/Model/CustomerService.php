<?php

namespace App\Services\Customer\Model;

use App\Models\Customer\Entity;
use App\Services\Customer\Api\CustomerServiceInterface;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\JsonResponse;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Symfony\Component\HttpKernel\Exception\HttpException;

class CustomerService implements CustomerServiceInterface
{
    /**
     * Retrieve 10 customers.
     *
     * @return JsonResponse
     */
    public function get10Customers(): JsonResponse
    {
        $customers = Entity::limit(10)->get(); // Use limit instead of all()->take()
        return response()->json(
            [
                "customers" => $customers,
                "success" => true
            ], 200
        );
    }

    /**
     * Authenticate customer by email and password.
     *
     * @param string $email
     * @param string $password
     * @param PasswordValidationService $passwordValidationService
     * @return Entity
     * @throws ModelNotFoundException|HttpException
     */
    public function authenticate(string $email, string $password, PasswordValidationService $passwordValidationService): Entity
    {
        // Retrieve the customer by email
        $customer = Entity::where('email', $email)->first();

        // If customer not found, throw an invalid login exception
        if (!$customer) {
            throw new ModelNotFoundException('Invalid login or password.');
        }


        // Check if the account is locked
//        if ($this->isLocked($customer->id)) {
//            throw new HttpException(403, 'The account is locked.');
//        }

        // Verify the password
        if (!$passwordValidationService->isValidHash($password, $customer->password_hash)) {
            throw new HttpException(401, 'Invalid login or password.');
        }

        // Check if the account needs email confirmation
        if ($customer->confirmation && $this->isConfirmationRequired($customer)) {
            throw new HttpException(403, "This account isn't confirmed. Verify and try again.");
        }

        // Fire events after successful authentication (optional)
        // event(new CustomerAuthenticated($customer, $password));

        return $customer;
    }

    /**
     * Check if the account is locked.
     *
     * @param int $customerId
     * @return bool
     */
    protected function isLocked(int $customerId): bool
    {
        // Implement the logic to check if the customer is locked.
        // Assuming the `customers` table has an `is_locked` field.
        $customer = Entity::find($customerId);
        return $customer->is_locked ?? false;
    }

    /**
     * Check if confirmation is required for the customer.
     *
     * @param Entity $customer
     * @return bool
     */
    protected function isConfirmationRequired(Entity $customer): bool
    {
        // Implement the logic to check if email confirmation is required.
        // Assuming the `customers` table has a `confirmed_at` field.
        return is_null($customer->confirmed_at);
    }
}
