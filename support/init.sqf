
// Die Sound Datei
BL_fnc_FX = {
        if (!isDedicated) then {
          private "_veh";
          _veh = _this select 0;
          _vel = _this select 1;
          for "_i" from 1 to 100 do {
              drop [
                  ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 7, 48],
                  "",
                  "Billboard",
                  0,
                  1 + random 0.5,
                  [0, -2, 1.5],
                  [-20 + random 40, -20 + random 40, -15 + _vel],
                  1,
                  0.05,
                  0.04,
                  0,
                  [0.5, 10 + random 20],
                  [
                      [0,0,0,1],
                      [0,0,0,0.3],
                      [1,1,1,0.1],
                      [1,1,1,0.03],
                      [1,1,1,0.01],
                      [1,1,1,0.003],
                      [1,1,1,0.001],
                      [1,1,1,0]
                  ],
                  [1],
                  0.1,
                  0.1,
                  "",
                  "",
                  _veh,
                  random 360,
                  true,
                  0.1
              ];
          };
      };
      "#FX" addPublicVariableEventHandler {_this select 1 spawn BL_fnc_FX};
};


// Der Fallschirm
BL_fnc_paraDrop = {
            if (isServer) then {
              private ["_class","_para","_paras","_p","_veh","_vel","_time"];
              _class = format [
                  "O_parachute_02_F",
                  toString [(toArray faction _this) select 0]
              ];
              _para = createVehicle [_class, [0,0,0], [], 0, "FLY"];
              _para setDir getDir _this;
              _para setPos getPos _this;
              _paras =  [_para];
              _this attachTo [_para, [0,0,0]];
              {
                  _p = createVehicle [_class, [0,0,0], [], 0, "FLY"];
                  _paras set [count _paras, _p];
                  _p attachTo [_para, [0,0,0]];
                  _p setVectorUp _x;
              } count [
                  [0.5,0.4,0.6],[-0.5,0.4,0.6],[0.5,-0.4,0.6],[-0.5,-0.4,0.6]
              ];
              0 = [_this, _paras] spawn {
                  _veh = _this select 0;
                  waitUntil {getPos _veh select 2 < 4};
                  _vel = velocity _veh;
                  detach _veh;
                  _veh setVelocity _vel;
                  missionNamespace setVariable ["#FX", [_veh, _vel select 2]];
                  publicVariable "#FX";
                  playSound3D [
                      "a3\sounds_f\weapons\Flare_Gun\flaregun_1_shoot.wss",
                      _veh
                  ];
                  {
                      detach _x;
                      _x disableCollisionWith _veh;
                  } count (_this select 1);
                  _time = time + 5;
                  waitUntil {time > _time};
                  {
                      if (!isNull _x) then {deleteVehicle _x};
                  } count (_this select 1);
              };
          };
};

//Die Westen auswahl
BL_Westen = [
  "BWA3_Vest_Tropen",
  "BWA3_Vest_Rifleman1_Tropen",
  "BWA3_Vest_Autorifleman_Tropen",
  "BWA3_Vest_Grenadier_Tropen",
  "BWA3_Vest_Medic_Tropen",
  "BWA3_Vest_Marksman_Tropen",
  "BWA3_Vest_Leader_Tropen",
  "BWA3_Item_Vest_JPC_Rifleman_Tropen",
  "BWA3_Item_Vest_JPC_Leader_Tropen",
  "BWA3_Item_Vest_JPC_Radioman_Tropen"
];




//ab jetzt kommen nur noch Sachen die auf Spieler Pc´s ausgeführt werden sollen. Dedicated und HeadlessClients brechen hier ab
if (!hasinterface) exitwith {};


BL_menu_Support =
[
	["Support",true],
	["SanFuchs", [2], "", -5, [["expression", "[1] spawn compile preprocessFile 'support\callSupport.sqf';"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["Fuchs", [3], "", -5, [["expression", "[2] spawn compile preprocessFile 'support\callSupport.sqf' ;"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["Pio Fuchs", [4], "", -5, [["expression", "[3] spawn compile preprocessFile 'support\callSupport.sqf';"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["Milan Fuchs", [5], "", -5, [["expression", "[4] spawn compile preprocessFile 'support\callSupport.sqf' ;"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["Wiesel MK 20", [6], "", -5, [["expression", "[5] spawn compile preprocessFile 'support\callSupport.sqf';"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["Wiesel TOW", [7], "", -5, [["expression", "[6] spawn compile preprocessFile 'support\callSupport.sqf' ;"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["Eagle", [8], "", -5, [["expression", "[7] spawn compile preprocessFile 'support\callSupport.sqf' ;"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["Eagle FOW", [9], "", -5, [["expression", "[8] spawn compile preprocessFile 'support\callSupport.sqf' ;"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["Nachschub Kiste", [10], "", -5, [["expression", "[9] spawn compile preprocessFile 'support\callSupport.sqf' ;"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["Untermenü", [11], "#USER:MENU_COMMS_2", -5, [], "1", "1"]
];

MENU_COMMS_2 =
[
	["Untermenü",true],
	["Abholung", [2], "", -5, [["expression", "Hint 'Möp';"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["Option 2", [3], "", -5, [["expression", "Hint 'ätsch';"]], "1", "1"]
];



//warte bis die Spielereinheit richtig initialisiert ist
0 spawn
{
  waitUntil {player == player};
  
  //Unterstützungsmenu an Player anfügen
  [player,"Menu"] call BIS_fnc_addCommMenuItem;
  
};//--
