if ( !canmove (_this select 0) ) then
{
  (_this select 0) removeAllEventHandlers "Dammaged";
  {_X setdamage 1}forEach crew (_this select 0);
  [2,"support\answer.sqf"] remoteExec ["BIS_fnc_execVM",0];
};
