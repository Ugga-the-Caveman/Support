/*
  1. Parameter: support index
  2. Parameter: (optional) Spawn Position für den Hubschrauber. wenn undefiniert spawnt der Hubschrauber zufällig um den _caller

  [1] spawn compile preprocessFile "support\callSupport.sqf";
*/


private _index = _this select 0;

private _spawnPos = [];
if (count _this > 1) then {
  _spawnPos = _this select 1;
};

//geht nur wenn man eine karte hat
if !("ItemMap" in (assignedItems player)) exitwith {hint "Du brauchst eine Karte."};


private _dropPos = getposATL player;

//wähle position auf der karte
openMap true;
ugga_mapclickPos = nil;
onMapSingleClick "ugga_mapclickPos = _pos; hint """"";

hint "Wähle Position";
waituntil {!(visiblemap and alive player) or !isNil "ugga_mapclickPos"};

if ( !isNil "ugga_mapclickPos" ) then
{
  _dropPos = ugga_mapclickPos;
}
else
{
  hint "Abgebrochen";
};

openMap false;
onMapSingleClick "";
ugga_mapclickPos = nil;
//--


[[_index,player,_dropPos,_spawnPos],"support\createHeli.sqf"] remoteExec ["BIS_fnc_execVM",2];

player sideChat format["CROSSROAD, hier %1. - fordere Nachschub Typ %2, planquadrat %3. - kommen.",group player,_index,mapGridPosition _dropPos];
[blufor,"HQ"] sideChat format["%1, hier CROSSROAD. - Nachschub ist unterwegs, Ende",group player];
