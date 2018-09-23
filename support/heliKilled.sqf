if ( !canmove (_this select 0) ) then
{
  private _id = (_this select 0) getvariable ["ubgl_eh_id",-1];
  if (_id != -1) then
  {
    (_this select 0) removeEventHandler ["Dammaged", _id];
  };
  
  {_X setdamage 1}forEach crew (_this select 0);
};
