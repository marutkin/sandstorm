// TIME
private _spawnDelaySeconds = 15;
private _spawnSoldiersCount = 90;

// MARKERS
private _basicMarkerPosition = getMarkerPos "marker_1";
private _eastMarkerPosition = getMarkerPos "marker_2";
private _westMarkerPositionWest = getMarkerPos "marker_3";
private _opforMarkerPosition = getMarkerPos "wp_1";

private _generateUnit = {
	unitId = _this select 0;
	markerPosition = _this select 1;
	grp = _this select 2;
	loadout = _this select 3;
	unit = grp createUnit [unitId, markerPosition, [], 0, "FORM"];
	unit setUnitLoadout loadout;
	unit;
};

private _defaultOpforUnitId = "O_soldier_F";
private _eastGrp = createGroup east;
_eastGrp addWaypoint [_opforMarkerPosition, 0];

// LOADOUT
private _opforLoadout = [
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
		[_defaultOpforUnitId, _basicMarkerPosition, _eastGrp, _opforLoadout] call _generateUnit;
	} else { 
		[_defaultOpforUnitId, _eastMarkerPosition, _eastGrp, _opforLoadout] call _generateUnit;
		[_defaultOpforUnitId, _westMarkerPositionWest, _eastGrp, _opforLoadout] call _generateUnit;
	};
	sleep _spawnDelaySeconds;
};