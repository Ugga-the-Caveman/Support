if not (hasinterface) exitwith {};
if not (backpack player in UGBL_RadiosFleck or backpack player in UGBL_RadiosTropen) exitwith {};

private  _sentence = _this;

switch (_sentence) do
{
  case 0: {
    UGBL_talker kbTell [player,"UGBL_topic","Drop_Acknowledged",true];
  };
  case 1: {
    UGBL_talker kbTell [player,"UGBL_topic","Drop_Accomplished",true];
  };
  case 2: {
    UGBL_talker kbTell [player,"UGBL_topic","Drop_Destroyed",true];
  };
};
