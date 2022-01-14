<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use App\Model\Commune;
use App\Model\Region;

class Customer extends Model
{
    public $timestamps = false;

    protected $fillable = [
        'dni',
        'id_reg',
        'id_com',
        'email',
        'name',
        'last_name',
        'address',
        'date_reg',
        'status'
    ];

    public function Commune()
    {
        return $this->belongsTo(Commune::class, 'id_com', 'id_com');
    }

    public function Region()
    {
        return $this->belongsTo(Region::class, 'id_reg', 'id_reg');
    }
}