
//Adds an Event Handler to disable custom walking speed when the player is Prone or has their weapon lowered. Enables the HUD for speed and sound.
if (!hasInterface) exitWith {};
waitUntil {alive player};
//46 cutRsc ["Rad_Walkspeed","PLAIN",-1,true];
player addEventHandler ["AnimStateChanged", { 
params ["_unit", "_anim"]; 
if (weaponLowered _unit || stance _unit == "PRONE") then 
{
	[_unit,1] remoteExecCall ["setAnimSpeedCoef",0];
	_unit forceWalk false;
	_unit setUnitTrait ["audibleCoef",1];
}; 
}];