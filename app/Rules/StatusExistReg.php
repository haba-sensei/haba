<?php

namespace App\Rules;

use App\Model\Region;
use Illuminate\Contracts\Validation\Rule;

class StatusExistReg implements Rule
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
        $region = Region::where('id_reg', $value)->where('status', 'trash')->first();
        if ($region) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'La region no existe o esta en estado eliminado';
    }
}