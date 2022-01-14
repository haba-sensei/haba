<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use App\Model\Customer;
use App\Model\Region;

class Commune extends Model
{
    protected $fillable = [
        'id_com',
        'id_reg',
        'description',
        'status'
    ];

    public function Customer()
    {
        return $this->hasMany(Customer::class, 'id_com', 'id_com');
    }

    public function Region()
    {
        return $this->hasMany(Region::class, 'id_reg', 'id_reg');
    }
}