//support initialisieren
call compile preprocessFile "support\paradrop.sqf";

//Unterstützungsmenu an Player anfügen
_supportRadio = [player,"test"] call BIS_fnc_addCommMenuItem;
