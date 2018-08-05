/*
  erstellt Den bestellten Support unter _thisVehicle.

  1. parameter: Support index.
  2. parameter: Fahrzeug (vorzugsweise Hubschrauber) unter dem der Support erscheinen soll.

  [1,_thisVehicle] call compile 'support\createSupport.sqf';
*/

private _index = _this select 0;
private _thisVehicle = _this select 1;




private _fnc_spawn = {

  private _type = _this select 0;
  private _thisVehicle = _this select 1;
  
  private _spawnPos = getposATL _thisVehicle;
  _spawnPos set [2,(_spawnPos select 2) - 8];
  
  private _thisSupport = createVehicle [_type, _spawnPos, [], 0, "CAN_COLLIDE"];
  _thisSupport setDir (direction _thisVehicle)
  _thisSupport setVelocity (Velocity _thisVehicle);
  sleep 5;
  _thisSupport call BL_fnc_paraDrop;
};


switch (_index) do
{
  case 1:{private _type = if (vest player in BL_fnc_Westen ) then {"Redd_Tank_Fuchs_1A4_San_Tropentarn"}else{"Redd_Tank_Fuchs_1A4_San_Flecktarn"}; [_type,_thisVehicle] spawn _fnc_spawn;};
  
  case 2:{private _type = if (vest player in BL_fnc_Westen ) then {"Redd_Tank_Fuchs_1A4_Jg_Tropentarn"}else{"Redd_Tank_Fuchs_1A4_Jg_Flecktarn"}; [_type,_thisVehicle] spawn _fnc_spawn;};
  
  case 3:{private _type = if (vest player in BL_fnc_Westen ) then {"Redd_Tank_Fuchs_1A4_Pi_Tropentarn"}else{"Redd_Tank_Fuchs_1A4_Pi_Flecktarn"}; [_type,_thisVehicle] spawn _fnc_spawn;};
  
  case 4:{private _type = if (vest player in BL_fnc_Westen ) then {"Redd_Tank_Fuchs_1A4_Jg_Milan_Tropentarn"}else{"Redd_Tank_Fuchs_1A4_Jg_Milan_Flecktarn"}; [_type,_thisVehicle] spawn _fnc_spawn;};
  
  case 5:{private _type = if (vest player in BL_fnc_Westen ) then {"Redd_Tank_Wiesel_1A4_MK20_Tropentarn"}else{"Redd_Tank_Wiesel_1A4_MK20_Flecktarn"}; [_type,_thisVehicle] spawn _fnc_spawn;};
  
  case 6:{private _type = if (vest player in BL_fnc_Westen ) then {"Redd_Tank_Wiesel_1A2_TOW_Tropentarn"}else{"Redd_Tank_Wiesel_1A2_TOW_Flecktarn"}; [_type,_thisVehicle] spawn _fnc_spawn;};
  
  case 7:{private _type = if (vest player in BL_fnc_Westen ) then {"BWA3_Eagle_Tropen"}else{"BWA3_Eagle_Fleck"}; [_type,_thisVehicle] spawn _fnc_spawn;};
  
  case 8:{private _type = if (vest player in BL_fnc_Westen ) then {"BWA3_Eagle_FLW100_Tropen"}else{"BWA3_Eagle_FLW100_Fleck"}; [_type,_thisVehicle] spawn _fnc_spawn;};
  
  case 9:{private _type = "B_supplyCrate_F"; [_type,_thisVehicle] spawn _fnc_spawn;};
};
