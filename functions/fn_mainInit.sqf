rad_fnc_speedHandle = {
	params ["_speed"];
	/*_radLayer = uiNamespace getVariable "Rad_Walkspeed";
	if (_speed <= 0.35) then {(_radLayer displayCtrl 1) ctrlSetText ("walkspeedmod\ui\loudness_0.paa");};
	if (_speed > 0.35 && _speed <= 0.45) then {(_radLayer displayCtrl 1) ctrlSetText ("walkspeedmod\ui\loudness_0.paa");};
	if (_speed > 0.45 && _speed <= 0.55) then {(_radLayer displayCtrl 1) ctrlSetText ("walkspeedmod\ui\loudness_1.paa");};
	if (_speed > 0.55 && _speed <= 0.65) then {(_radLayer displayCtrl 1) ctrlSetText ("walkspeedmod\ui\loudness_1.paa");};
	if (_speed > 0.65 && _speed <= 0.75) then {(_radLayer displayCtrl 1) ctrlSetText ("walkspeedmod\ui\loudness_1.paa");};
	if (_speed > 0.75 && _speed <= 0.85) then {(_radLayer displayCtrl 1) ctrlSetText ("walkspeedmod\ui\loudness_2.paa");};
	if (_speed > 0.85 && _speed <= 0.95) then {(_radLayer displayCtrl 1) ctrlSetText ("walkspeedmod\ui\loudness_2.paa");};
	if (_speed > 0.95 && _speed <= 1.05) then {(_radLayer displayCtrl 1) ctrlSetText ("walkspeedmod\ui\loudness_2.paa");player forceWalk false};
	if (_speed > 1.05 && _speed <= 1.15) then {(_radLayer displayCtrl 1) ctrlSetText ("walkspeedmod\ui\loudness_2.paa");};
	if (_speed > 1.15 && _speed <= 1.25) then {(_radLayer displayCtrl 1) ctrlSetText ("walkspeedmod\ui\loudness_3.paa");};
	if (_speed > 1.25 && _speed <= 1.35) then {(_radLayer displayCtrl 1) ctrlSetText ("walkspeedmod\ui\loudness_3.paa");};
	if (_speed > 1.35 && _speed <= 1.45) then {(_radLayer displayCtrl 1) ctrlSetText ("walkspeedmod\ui\loudness_3.paa");};
	if (_speed > 1.45 && _speed <= 1.55) then {(_radLayer displayCtrl 1) ctrlSetText ("walkspeedmod\ui\loudness_4.paa");};
	if (_speed > 1.55 && _speed <= 1.65) then {(_radLayer displayCtrl 1) ctrlSetText ("walkspeedmod\ui\loudness_4.paa");};
	if (_speed > 1.65 ) then {(_radLayer displayCtrl 1) ctrlSetText ("walkspeedmod\ui\loudness_4.paa");};*/
};

rad_fnc_walkSpeedIncrease = {

	_currentAudio = player getUnitTrait "audibleCoef";
	_speedOld = getAnimSpeedCoef player;
	//_radLayer = uiNamespace getVariable "Rad_Walkspeed";
	if (_speedOld < 1.7 && !weaponLowered player && stance player != "PRONE") then
	{
		[player,_speedOld + 0.1] remoteExecCall ["setAnimSpeedCoef",0,player];
		player forceWalk true;
		player setUnitTrait ["audibleCoef",_currentAudio + 0.05];
		//(_radLayer displayCtrl 0) ctrlSetText ("Speed: " + (str (100 * (_speedOld + 0.1))) + "%");
		[_speedOld + 0.1] spawn rad_fnc_speedHandle;
	};
	
	true;
};

rad_fnc_walkSpeedDecrease = {

	_currentAudio = player getUnitTrait "audibleCoef";
	_speedOld = getAnimSpeedCoef player;
	//_radLayer = uiNamespace getVariable "Rad_Walkspeed";
	if (_speedOld > 0.3 && !weaponLowered player && stance player != "PRONE") then
	{
		[player,_speedOld - 0.1] remoteExecCall ["setAnimSpeedCoef",0,player];
		player forceWalk true;
		player setUnitTrait ["audibleCoef",_currentAudio - 0.05];
		//(_radLayer displayCtrl 0) ctrlSetText ("Speed: " + (str (100 * (_speedOld - 0.1))) + "%");
		[_speedOld - 0.1] spawn rad_fnc_speedHandle;
	};
	true;
};

rad_fnc_walkSpeedReset = {

	_speedOld = getAnimSpeedCoef player;
	//_radLayer = uiNamespace getVariable "Rad_Walkspeed";
	[player,1] remoteExecCall ["setAnimSpeedCoef",0,player];
	player forceWalk false;
	player setUnitTrait ["audibleCoef",1];
	/*if (_speedOld != 1) then {
		(_radLayer displayCtrl 0) ctrlSetText ("Speed: 100%");
		(_radLayer displayCtrl 1) ctrlSetText ("walkspeedmod\ui\loudness_2");
	};*/
	false;
};
rad_fnc_walkSpeedSetMax = {
	
	_speedOld = getAnimSpeedCoef player;
	//_radLayer = uiNamespace getVariable "Rad_Walkspeed";
	if (_speedOld != 1.7) then 
	{
		[player,1.7] remoteExecCall ["setAnimSpeedCoef",0,player];
		player forceWalk true;
		player setUnitTrait ["audibleCoef",1.35];
		//(_radLayer displayCtrl 0) ctrlSetText ("Speed: 170%");
		//(_radLayer displayCtrl 1) ctrlSetText ("walkspeedmod\ui\loudness_4");
	} else {
		[] spawn rad_fnc_walkSpeedReset;
	};
	true;
};
rad_fnc_walkSpeedSetMin = {

	_speedOld = getAnimSpeedCoef player;
	//_radLayer = uiNamespace getVariable "Rad_Walkspeed";
	if (_speedOld != 0.3) then 
	{
		[player,0.3] remoteExecCall ["setAnimSpeedCoef",0,player];
		player forceWalk true;
		player setUnitTrait ["audibleCoef",0.65];
		//(_radLayer displayCtrl 0) ctrlSetText ("Speed: 30%");
		//(_radLayer displayCtrl 1) ctrlSetText ("walkspeedmod\ui\loudness_0");
	} else {
		[] spawn rad_fnc_walkSpeedReset;
	};
	true;
};

if (isClass (configfile >> "CfgPatches" >> "ace_advanced_fatigue")) then {
	{ace_advanced_fatigue_setAnimExclusions append [_x]} forEach ["amovpercmstpsraswrfldnon","amovpercmwlksraswrfldf","amovpercmwlksraswrfldb","amovpercmwlksraswrfldl","amovpercmwlksraswrfldr","amovpknlmstpsraswrfldnon","amovpknlmwlksraswrfldf","amovpknlmwlksraswrfldb","amovpknlmwlksraswrfldlf","amovpknlmwlksraswrfldr"];
};

["Rad's Adjustable Walking Speed","walk_speed_increase", "Increase speed", {_this spawn rad_fnc_walkSpeedIncrease}, "", [0xF8, [false, true, false]]] call CBA_fnc_addKeybind;
["Rad's Adjustable Walking Speed","walk_speed_decrease", "Decrease speed", {_this spawn rad_fnc_walkSpeedDecrease}, "", [0xF9, [false, true, false]]] call CBA_fnc_addKeybind;
["Rad's Adjustable Walking Speed","walk_speed_reset", "Reset speed", {_this spawn rad_fnc_walkSpeedReset}, "", [0x2A, [false, false, false]]] call CBA_fnc_addKeybind;
["Rad's Adjustable Walking Speed","walk_speed_setMax", "Set Speed Max.", {_this spawn rad_fnc_walkSpeedSetMax}, ""] call CBA_fnc_addKeybind;
["Rad's Adjustable Walking Speed","walk_speed_setMin", "Set Speed Min.", {_this spawn rad_fnc_walkSpeedSetMin}, ""] call CBA_fnc_addKeybind;