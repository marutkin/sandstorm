if (isnil "DZ_fnc_MortarFire") then {
    DZ_fnc_MortarFire = {
        private ["_ammo", "_marker", "_xcoord", "_ycoord", "_timer", "_fire"];
        _ammo = _this select 0;
        _marker = _this select 1;
        _xcoord = _this select 2;
        _ycoord = _this select 3;
        _timer = _this select 4;
        _fire = true;
        while {_fire} do {
            _firerun = _ammo createvehicle [(getmarkerpos _marker select 0) + random _xcoord, (getmarkerpos _marker select 1) + random _ycoord, getmarkerpos _marker select 2];
            sleep (random _timer);
        };
    };
};

hint 'Arta!';

mf1 = ["R_60mm_HE", "mort_1", 100, 150, 17] spawn DZ_fnc_MortarFire;