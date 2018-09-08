/*
  erstellt den bestellten Support unter _thisVehicle.

  1. parameter: Support index.
  2. parameter: Fahrzeug (vorzugsweise Hubschrauber) unter dem der Support erscheinen soll.
  3. parameter: support tarn index. 0:fleck, 1:tropen

  [1,_thisVehicle,0] spawn compile 'support\createSupport.sqf';
*/

if (!isServer) exitwith {};

private _index = _this select 0;
private _thisVehicle = _this select 1;
private _farbe = _this select 2;

if (canmove _thisVehicle) then
{
  [1,"support\answer.sqf"] remoteExec ["BIS_fnc_execVM",0];
  
  private _spawnPos = getposATL _thisVehicle;
  _spawnPos set [2,(_spawnPos select 2) - 8];



  private _fnc_spawnVehicle = {
    private _spawnPos = _this select 0;
    private _type = _this select 1;

    (createVehicle [_type, _spawnPos, [], 0, "CAN_COLLIDE"])
  };

  //Das Beladungsscript für die Box
  private _beladeScript = {
    private _thisBox = _this select 0;
	private _farbe = _this select 1;

    clearWeaponCargoGlobal _thisBox;
    clearMagazineCargoGlobal _thisBox;
    clearItemCargoGlobal _thisBox;
    clearBackpackCargoGlobal _thisBox;

    If (_farbe == 1) then
    {
      _thisBox addBackpackCargo ["BWA3_Kitbag_Tropen_Medic", 2];
    }
    else
    {
      _thisBox addBackpackCargo ["BWA3_Kitbag_Fleck_Medic", 2];
    };
  
    {
      _x addItemCargo ["ACE_packingBandage", 20];
      _x addItemCargo ["ACE_fieldDressing", 10];
      _x addItemCargo ["ACE_quikclot", 35];
      _x addItemCargo ["ACE_elasticBandage", 8];
      _x addItemCargo ["ACE_morphine", 30];
      _x addItemCargo ["ACE_epinephrine", 18];
      _x addItemCargo ["ACE_bloodIV_250", 6];
      _x addItemCargo ["ACE_bloodIV_500", 5];
      _x addItemCargo ["ACE_bloodIV", 5];
    } forEach everyBackpack _thisBox;

    _thisBox addItemCargoGlobal ["BWA3_30Rnd_556x45_G36_AP",30];
    _thisBox addItemCargoGlobal ["ACE_CableTie",10];
    _thisBox addItemCargoGlobal ["BWA3_15Rnd_9x19_P8",10];
    _thisBox addItemCargoGlobal ["BWA3_10Rnd_762x51_G28_AP",20];
    _thisBox addItemCargoGlobal ["hlc_100Rnd_762x51_M_MG3",10];
    _thisBox addItemCargoGlobal ["BWA3_200Rnd_556x45",10];
    _thisBox addWeaponCargoGlobal ["BWA3_Pzf3_Loaded",4];
  };


  private _thisSupport = objNull;

  switch (_index) do
  {
    case 1:{_thisSupport = [_spawnPos,(["Redd_Tank_Fuchs_1A4_San_Flecktarn","Redd_Tank_Fuchs_1A4_San_Tropentarn"] select _farbe)] call _fnc_spawnVehicle;};
    case 2:{_thisSupport = [_spawnPos,(["Redd_Tank_Fuchs_1A4_Jg_Flecktarn","Redd_Tank_Fuchs_1A4_Jg_Tropentarn"] select _farbe)] call _fnc_spawnVehicle;};
    case 3:{_thisSupport = [_spawnPos,(["Redd_Tank_Fuchs_1A4_Pi_Flecktarn","Redd_Tank_Fuchs_1A4_Pi_Tropentarn"] select _farbe)] call _fnc_spawnVehicle;};
    case 4:{_thisSupport = [_spawnPos,(["Redd_Tank_Fuchs_1A4_Jg_Milan_Flecktarn","Redd_Tank_Fuchs_1A4_Jg_Milan_Tropentarn"] select _farbe)] call _fnc_spawnVehicle;};
    case 5:{_thisSupport = [_spawnPos,(["Redd_Tank_Wiesel_1A4_MK20_Flecktarn","Redd_Tank_Wiesel_1A4_MK20_Tropentarn"] select _farbe)] call _fnc_spawnVehicle;};
    case 6:{_thisSupport = [_spawnPos,(["Redd_Tank_Wiesel_1A2_TOW_Flecktarn","Redd_Tank_Wiesel_1A2_TOW_Tropentarn"] select _farbe)] call _fnc_spawnVehicle;};
    case 7:{_thisSupport = [_spawnPos,(["BWA3_Eagle_Fleck","BWA3_Eagle_Tropen"] select _farbe)] call _fnc_spawnVehicle;};
    case 8:{_thisSupport = [_spawnPos,(["BWA3_Eagle_FLW100_Fleck","BWA3_Eagle_FLW100_Tropen"] select _farbe)] call _fnc_spawnVehicle;};
    case 9:{_thisSupport = [_spawnPos,(["B_supplyCrate_F","B_supplyCrate_F"] select _farbe)] call _fnc_spawnVehicle; [_thisSupport,_farbe] call _beladeScript;};
  };

  //Drop fliegt mit angepasster Geschwindigkeit ab und bekommt Falschirm
  _thisSupport setDir (direction _thisVehicle);
  _thisSupport setVelocity (Velocity _thisVehicle);
  sleep 3;
  _thisSupport call UGBL_fnc_paraDrop;

}
else
{
  [2,"support\answer.sqf"] remoteExec ["BIS_fnc_execVM",0];
};


//eventhandler entfernen
private _id = _thisVehicle getvariable ["ubgl_eh_id",-1];
if (_id != -1) then
{
  _thisVehicle removeEventHandler ["Dammaged", _id];
};
//--


