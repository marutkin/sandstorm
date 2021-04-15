// TIME
_spawnSleep = 5;
_spawnCount = 90;

// GROUPS
_east_grp = createGroup east;

// MARKERS
_basicMarkerPosition = getMarkerPos "marker_1";
_basicMarkerPositionEast = getMarkerPos "marker_2";
_basicMarkerPositionWest = getMarkerPos "marker_3";
_opforMarkerPosition = getMarkerPos "wp_1";

// WAYPOINTS
_wp =_east_grp addWaypoint [_opforMarkerPosition, 0];

// LOADOUT
_opforLoadout = [
	["rhs_weap_akms","","","",[],[],""],
	[],
	["hgun_P07_F","","","",["16Rnd_9x21_Mag",16],[],""],
	["U_BG_Guerilla2_1",[ ["rhs_30Rnd_762x39mm",8,1] ]],
	["V_TacVestIR_blk",[ ["rhs_30Rnd_762x39mm",8,1] ]],
	[],
	"","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]
];

my_fnc = {
	// private _count = _this select 0;
	if (_this % 2 == 0) then { 
		unit = _east_grp createUnit ["O_soldier_F", _basicMarkerPosition, [], 0, "FORM"];
		unit setUnitLoadout _opforLoadout;
	} else { 
		unit1 = _east_grp createUnit ["O_soldier_F", _basicMarkerPositionEast, [], 0, "FORM"];
		unit2 = _east_grp createUnit ["O_soldier_F", _basicMarkerPositionWest, [], 0, "FORM"];
		unit1 setUnitLoadout _opforLoadout;
		unit2 setUnitLoadout _opforLoadout;
	};
};

_i = _spawnCount; 
for [{private _i = 0}, {_i < _spawnCount}, {_i = _i + 1}] do {
	_i call my_fnc;
	sleep _spawnSleep;
}; 
