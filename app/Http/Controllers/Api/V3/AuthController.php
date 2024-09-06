<?php

namespace App\Http\Controllers\Api\V3;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\LoginUserRequest;
use App\Models\Customer\Entity;
use App\Services\Customer\Model\MagentoEncryptor;
use App\Traits\ApiResponses;
use Illuminate\Support\Str;
use App\Responses\Customer\AuthResponses;

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

                return response()->json(AuthResponses::loginCustomerResponse($customer, $plainTextToken), 200);
            }

            throw new \Exception('Invalid credentials');
        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 400);
        }
    }
}
