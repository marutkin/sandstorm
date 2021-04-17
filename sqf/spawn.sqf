// TIME
_spawnDelaySeconds = 15;
_spawnSoldiersCount = 90;

// GROUPS
_eastGrp = createGroup east;

// MARKERS
_basicMarkerPosition = getMarkerPos "marker_1";
_basicMarkerPositionEast = getMarkerPos "marker_2";
_basicMarkerPositionWest = getMarkerPos "marker_3";
_opforMarkerPosition = getMarkerPos "wp_1";

// WAYPOINTS
_wp =_eastGrp addWaypoint [_opforMarkerPosition, 0];

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

_generateUnit = {
	unitId = _this select 0;
	markerPosition = _this select 1;
	unit = _eastGrp createUnit [unitId, markerPosition, [], 0, "FORM"];
	unit setUnitLoadout _opforLoadout;
	unit;
};

_defaultOpforUnitId = "O_soldier_F";

// GENERATE OPFOR SOLDIERS
for "_i" from 1 to _spawnSoldiersCount do { 
	if (_i % 2 == 0) then { 
		[_defaultOpforUnitId, _basicMarkerPosition] call _generateUnit;
	} else { 
		[_defaultOpforUnitId, _basicMarkerPositionEast] call _generateUnit;
		[_defaultOpforUnitId, _basicMarkerPositionWest] call _generateUnit;
	};
	sleep _spawnDelaySeconds;
};