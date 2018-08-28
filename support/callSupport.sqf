/*
  1. Parameter: support index

  [1] spawn compile preprocessFile "support\callSupport.sqf";
*/

if !(hasInterface) exitwith {};

private _index = _this select 0;



if not( ((backpack player) in UGBL_RadiosFleck) or ((backpack player) in UGBL_RadiosTropen) ) exitwith {
  hint "geht nicht ohne radio rucksack brauchst radio um hq zu erreichen";
};


player sideChat format["CROSSROAD, hier %1 - fordere Nachschub Typ %2 - kommen.",group player,_index];

[blufor,"HQ"] sideChat format["%1, hier CROSSROAD - übermitteln sie die AbwurfPosition - kommen.",group player];



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


hint "Klicke mit der linken Maustaste auf die Karte, um die AbwurfPosition zu bestimmen.";


//warten bis dropPos geändert oder abbruch durch spieler
waituntil {!(visiblemap and alive player) or UGBL_mapClicked};

hint "";

//eventhandler entfernen und karte zumachen
removeMissionEventHandler  ["MapSingleClick",_handlerID];

openMap false;

UGBL_mapClicked = nil;

private _dropPos =+ UGBL_dropPos;//array neu anlegen anstatt nur zu referenzieren
UGBL_dropPos = nil;
//--


//abbruch, wenn dropPos immernoch leer ist
if (count _dropPos == 0) exitwith {
player sideChat format["CROSSROAD, hier %1 - ?hat sich erledigt? - Ende.",group player,_index];

};


//parameter an server übergeben und heli auf server erstellen lassen
[[_index,player,_dropPos],"support\createHeli.sqf"] remoteExec ["BIS_fnc_execVM",2];



player sideChat format["CROSSROAD, hier %1 - Abwurfzone für Nachschub ist %3 - kommen.",group player,_index,mapGridPosition _dropPos];

[blufor,"HQ"] sideChat format["%1, hier CROSSROAD - Verstanden, Nachschub ist unterwegs - Ende",group player];
