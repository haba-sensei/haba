<?php

namespace App\Http\Requests;

use App\Rules\CustomExists;
use App\Rules\StatusExistCust;
use App\Rules\StatusTrashCust;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\ValidationException;

class DeleteRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'consulta' => ['required', 'string', 'min:8', 'max:100', new StatusTrashCust(), new CustomExists()],
        ];
    }

    protected function failedValidation(Validator $validator)
    {
        $errors = '';
        foreach ((new ValidationException($validator))->errors() as $key => $value) {
            $errors .= $value[0] . " , ";
        }

        Log::debug("Acciones de borrado", ['salida' => $errors, 'value' => $this->consulta, 'status' => '422']);

        throw new HttpResponseException(
            response()->json([
                'success' => false,
                'error' => (new ValidationException($validator))->errors(),
                'message' => "Error de validacion",
            ], 422)
        );
    }
}