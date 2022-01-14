<?php

namespace App\Rules;

use App\Model\Commune;
use Illuminate\Contracts\Validation\Rule;

class StatusExistCom implements Rule
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
        $commune = Commune::where('id_com', $value)->where('status', 'trash')->first();
        if ($commune) {
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
        return 'La Comuna no existe o esta en estado eliminado';
    }
}