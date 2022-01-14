<?php

namespace App\Rules;

use App\Model\Customer;
use Illuminate\Contracts\Validation\Rule;

class StatusTrashCust implements Rule
{
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        $dni = Customer::where('dni', $value)->where('status', '!=', 'trash')->get()->count() > 0;
        $email = Customer::where('email', $value)->where('status', '!=', 'trash')->get()->count() > 0;

        if ($dni > 0 || $email > 0) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'Registro no existe';
    }
}