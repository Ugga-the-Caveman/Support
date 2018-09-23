if (!isServer) exitwith {};


//sammle parameter
private _index = _this select 0;
private _caller = _this select 1;

private ["_dropPos"];

if (count _this > 2) then
{
  _dropPos = _this select 2;
}
else
{
  _dropPos = getPosatl _caller;
};
//--


//support tarnfarbe bestimmen
private _farbe = if (backpack _caller in UGBL_RadiosFleck) then {0}else{1};


//spawnPosition des Hubschraubers festlegen. Wenn undefiniert random pos um _caller
private _spawnPos = getmarkerpos "supportSpawnMarker";

if (_spawnPos distance2d [0,0,0] == 0) then {
  _spawnPos = [_caller, viewdistance, (floor (random 360))] call BIS_fnc_relPos;
};
//--


//erstelle Helicopter
private _supportHeli = createVehicle ["14JgKp_A3_NH99", _spawnpos, [], 0, "Fly"];
_supportheli setdir (_spawnPos getdir _dropPos);
_supportHeli flyinHeight 180;
_supportHeli flyinHeightASL [180,180,180];
_supportHeli allowCrewInImmobile true;
//--


//erstelle helicopter crew
createVehicleCrew _supportHeli;
private _heliCrew = group driver _supportHeli;
{_x triggerDynamicSimulation false;}forEach units _heliCrew;
_heliCrew deleteGroupWhenEmpty true;
_heliCrew setBehaviour "CARELESS";
_heliCrew setCombatMode "YELLOW";
_heliCrew setSpeedMode "FULL";
_heliCrew enableAttack false;
//--


//wp1: move to dropPos and drop support
private _wp1 = _heliCrew addWaypoint [_dropPos, 0];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointCompletionRadius 15;
private _code = format ["[%1,vehicle this,%2] spawn compile preprocessFile 'support\createSupport.sqf';",_index,_farbe];
_wp1 setWaypointStatements ["true",_code];
//--


//wp2: return to spawnPos and despawn;
private _wp2 = _heliCrew addWaypoint [_spawnPos, 0];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointStatements ["true", "private _heli = vehicle this; {deleteVehicle _x;}forEach units group this; deleteVehicle _heli;"];
//--
