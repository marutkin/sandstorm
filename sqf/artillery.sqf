if (isnil "DZ_fnc_MortarFire") then {
    DZ_fnc_MortarFire = {
        private ["_ammo", "_marker", "_xcoord", "_ycoord", "_timer", "_fire"];
        _ammo = _this select 0;
        _marker = _this select 1;
        _xcoord = _this select 2;
        _ycoord = _this select 3;
        _timer = _this select 4;
        private _fire = true;
        private _rounds = 100;
        while {_fire && _rounds > 0} do {
            _rounds = _rounds - 1;
            _ammo createvehicle [(getmarkerpos _marker select 0) + random _xcoord, (getmarkerpos _marker select 1) + random _ycoord, getmarkerpos _marker select 2];
            sleep (random _timer);
        };
    };
};

mf1 = ["R_60mm_HE", "mort_1", 180, 180, 35] spawn DZ_fnc_MortarFire;