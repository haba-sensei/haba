<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Region extends Model
{
    protected $fillable = [
        'id_reg',
        'description',
        'status'
    ];

    public function Commune()
    {
        return $this->hasMany(Commune::class, 'id_com', 'id_com');
    }

    public function Customer()
    {
        return $this->hasMany(Customer::class, 'id_reg', 'id_reg');
    }
}