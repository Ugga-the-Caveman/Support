
//Beschränkt den Aufruf auf unsere Gruppenführer. Der Funker von Spezialzug Foxtrott ist als Klasse der Normale Soldat. Damit bringt es nichts den hier mit einzufügen da sonst alle das Script aufrufewn können

if (typeOf (Player) isEqualTo "BWA3_SL_Fleck") then {[player,"Menu"] call BIS_fnc_addCommMenuItem;}; // GrpFhr Fleck
if (typeOf (Player) isEqualTo "BWA3_SL_Tropen") then {[player,"Menu"] call BIS_fnc_addCommMenuItem;};
if (typeOf (Player) isEqualTo "BWA3_TL_Fleck") then {[player,"Menu"] call BIS_fnc_addCommMenuItem;}; // GrpFhr STLLV Fleck
if (typeOf (Player) isEqualTo "BWA3_TL_Tropen") then {[player,"Menu"] call BIS_fnc_addCommMenuItem;};
