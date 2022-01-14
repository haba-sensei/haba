<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\ConsultRequest;
use App\Http\Requests\CustomerRequest;
use App\Http\Requests\DeleteRequest;
use App\Model\Customer;
use Illuminate\Support\Facades\Log;

class CustomerController extends Controller
{


    public function newCustomer(CustomerRequest $request)
    {
        Log::debug("Acciones de registro", ['entrada' => $request->post(), 'status' => '200']);

        Customer::create($request->post());

        return response()->json([
            'success' => true,
            'message' => 'Cliente creado correctamente',
        ], 200);
    }

    public function consCustomer(ConsultRequest $request)
    {
        Log::debug("Acciones de consulta", ['entrada' => $request->consulta, 'status' => '200']);

        $customers = Customer::where('dni', $request->consulta)
            ->orWhere('email', $request->consulta)
            ->with(
                ['Commune' => function ($query) {
                    $query->select('id_com', 'description');
                }, 'Region' => function ($query) {
                    $query->select('id_reg', 'description');
                }]
            )->get();


        return response()->json([
            'success' => true,
            'message' => 'Cliente encontrado',
            'data' => $customers
        ], 200);
    }

    public function delCustomer(DeleteRequest $request)
    {
        Log::debug("Acciones de borrado", ['entrada' => $request->consulta, 'status' => '200']);

        Customer::where('dni', $request->consulta)
            ->orWhere('email', $request->consulta)
            ->update(['status' => 'trash']);

        return response()->json([
            'status' => 200,
            'message' => 'Cliente eliminado correctamente',
        ], 200);
    }
}