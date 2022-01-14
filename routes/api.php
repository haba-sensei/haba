<?php

use Illuminate\Support\Facades\Route;


Route::group(["middleware" => "apikey.validate"], function () {
    Route::post("newCustomer", "Api\CustomerController@newCustomer");
    Route::post("consCustomer", "Api\CustomerController@consCustomer");
    Route::post("delCustomer", "Api\CustomerController@delCustomer");
});