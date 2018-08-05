/*
  Führt ein Script auf dem server aus. Das den Heli für den Support erstellt.

  1. parameter: support index

  [1] call compile preprocessFile "support\callSupport.sqf";

*/


private _index = _this select 0;
private _dropPos = getposATL player;

[[_index,player,_dropPos],"support\createHeli.sqf"] remoteExec ["BIS_fnc_execVM",2];

player sideChat format["CROSSROAD, hier %1. - fordere Nachschub Typ %2, planquadrat %3. - kommen.",group player,_index,mapGridPosition _dropPos];
[blufor,"HQ"] sideChat format["%1, hier CROSSROAD. - Nachschub ist unterwegs, Ende",group player];
