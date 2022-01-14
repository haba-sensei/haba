<?php

namespace App\Http\Requests;


use App\Rules\CustomExistsReg;
use App\Rules\StatusCom;
use App\Rules\StatusExistCom;
use App\Rules\StatusExistReg;
use App\Rules\StatusReg;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator as FacadesValidator;
use Illuminate\Validation\Rule;
use Illuminate\Validation\ValidationException;

class CustomerRequest extends FormRequest
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
            'dni' => 'required|string|min:8|unique:customers,dni',
            'id_reg' => [
                'required', 'string',
                Rule::exists('communes')->where(
                    function ($query) {
                        $query->where(
                            'id_com',
                            '=',
                            $this->get('id_com')
                        );
                    }
                ), new StatusExistReg()
            ],
            'id_com' => [
                'required', 'string',
                Rule::exists('communes')->where(
                    function ($query) {
                        $query->where(
                            'id_com',
                            '=',
                            $this->get('id_com')
                        );
                    }
                ), new StatusExistCom()
            ],
            'email' => 'required|string|email|max:100|unique:customers,email',
            'name' => 'required|string|max:100',
            'last_name' => 'required|string|max:100',
            'address' => 'string|max:195|nullable',
            'date_reg' => 'required|date',
            'status' => 'required|in:A',
        ];
    }

    protected function failedValidation(Validator $validator)
    {
        $errors = '';
        foreach ((new ValidationException($validator))->errors() as $key => $value) {
            $errors .= $value[0] . " , ";
        }

        Log::debug("Acciones de registro", ['salida' => $errors, 'value' => $this->dni . " - " . $this->email, 'status' => '422']);

        throw new HttpResponseException(
            response()->json([
                'success' => false,
                'error' => (new ValidationException($validator))->errors(),
                'message' => "Error de validacion",
            ], 422)
        );
    }
}