/*
  1. Parameter: support index

  [1] spawn compile preprocessFile "support\callSupport.sqf";
*/

if !(hasInterface) exitwith {};

private _index = _this select 0;


//abbrechen wenn man keine Karte hat. todo: als karte auch gps geräte zulassen
//Gadanke dabei ist: man sieht nix auf der karte, wenn man kein kartending hat.
if !("ItemMap" in (assignedItems player)) exitwith {hint "Du brauchst eine Karte."};




//eventhandler vorbereiten und karte öffnen
UGBL_dropPos = [];
UGBL_mapClicked = false;

private _handlerID = addMissionEventHandler ["MapSingleClick",{

  params ["_units", "_pos", "_alt", "_shift"];

  UGBL_dropPos = _pos;
  UGBL_mapClicked = true;
}];

openMap true;
//--


hint "Du musst karte drücken wo support";


//warten bis dropPos geändert oder abbruch durch spieler
waituntil {!(visiblemap and alive player) or UGBL_mapClicked};

hint "";

//eventhandler entfernen und karte zumachen
removeMissionEventHandler  ["MapSingleClick",_handlerID];

openMap false;

UGBL_mapClicked = nil;

private _dropPos = UGBL_dropPos;
UGBL_dropPos = nil;
//--


//abbruch, wenn dropPos immernoch leer ist
if (count _dropPos isEqualTo 0) exitwith {
  hint "Support Bestellung abgebrochen";
};


//parameter an server übergeben und heli auf server erstellen lassen
[[_index,player,_dropPos],"support\createHeli.sqf"] remoteExec ["BIS_fnc_execVM",2];



player sideChat format["CROSSROAD, hier %1. - fordere Nachschub Typ %2, planquadrat %3. - kommen.",group player,_index,mapGridPosition _dropPos];

[blufor,"HQ"] sideChat format["%1, hier CROSSROAD. - Nachschub ist unterwegs, Ende",group player];
