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

// GENERATE OPFOR SOLDIERS
for "_i" from 1 to _spawnSoldiersCount do { 
	if (_i % 2 == 0) then { 
	unit = _eastGrp createUnit ["O_soldier_F", _basicMarkerPosition, [], 0, "FORM"];
	unit setUnitLoadout _opforLoadout;
	} else { 
		unit1 = _eastGrp createUnit ["O_soldier_F", _basicMarkerPositionEast, [], 0, "FORM"];
		unit2 = _eastGrp createUnit ["O_soldier_F", _basicMarkerPositionWest, [], 0, "FORM"];
		unit1 setUnitLoadout _opforLoadout;
		unit2 setUnitLoadout _opforLoadout;
	};
	sleep _spawnDelaySeconds;
};