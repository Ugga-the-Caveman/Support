/*
  1.Parameter: Support index
  2.Parameter: SpielerEinheit die den Support gerufen hat
  3.Parameter: (optional) Position wo der Support abgeworfen wird. Wenn undefiniert Spieler Position
  4.Parameter: (optional) Position wo der Hubschrauber gespawnt werden soll
*/

if (!isServer) exitwith {};




//sammle parameter
params [["_index",1,["SCALAR"]], ["_index",_caller,["OBJECT"]]];

if(isNull _caller) exitwith {};

private ["_dropPos","_spawnPos"];

if (count _this > 2) then
{
  _dropPos = _this select 2;
}
else
{
  _dropPos = getPosatl Player;
};


if (count _this > 3) then
{
  _spawnPos = _this select 3;
}
else
{
  _spawnPos = [_caller, 300, (floor (random 360))] call BIS_fnc_relPos;
};

_spawnPos set [2,200];
//--


//erstelle Helicopter und crew. crew speichern für später.
private _supportHeli = createVehicle ["14JgKp_A3_NH99", _spawnpos, [], 0, "Fly"];
createVehicleCrew _supportHeli;
private _heliCrew = group driver _supportHeli;
_supportHeli flyinHeightASL [150,150,150];
//--

//wp1: move to dropPos and drop support
private _wp1 = _heliCrew addWaypoint [_dropPos, 0];
_wp1 setWaypointType "MOVE";

private _code = format ["[%1,vehicle leader this] call compile preprocessFile 'support\createSupport.sqf';",_index];
_wp1 setWaypointStatements ["true",_code];
//--


//wp2: return to spawnPos and despawn;
private _wp2 = _heliCrew addWaypoint [_spawnPos, 0];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointStatements ["true", "private _heli = vehicle leader this; {deleteVehicle _x;}forEach units this; deleteVehicle _heli;"];
//--
