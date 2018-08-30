/*
  1.Parameter: Support index
  2.Parameter: Einheit vom Spieler, welcher den Support gerufen hat
  3.Parameter: (optional) Position wo der Support abgeworfen wird. Wenn undefiniert Spieler Position
*/

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


//offizier auf allen clients sprechen lassen
[0,"support\answer.sqf"] remoteExec ["BIS_fnc_execVM",0];



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

//eventhandler erstellen und id speichern
private _id = _supportHeli addEventHandler ["Dammaged","call compile preprocessFile 'support\heliKilled.sqf';"];
_supportHeli setvariable ["ubgl_eh_id",_id];
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
_wp1 setWaypointCompletionRadius 10;

private _code = format ["[%1,vehicle this] spawn compile preprocessFile 'support\createSupport.sqf';",_index];
_wp1 setWaypointStatements ["true",_code];
//--


//wp2: return to spawnPos and despawn;
private _wp2 = _heliCrew addWaypoint [_spawnPos, 0];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointStatements ["true", "private _heli = vehicle this; {deleteVehicle _x;}forEach units group this; deleteVehicle _heli;"];
//--
