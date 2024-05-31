class CfgPatches 
{
	class rad_walkingspeed
	{
		units[] = {};
		author[] = {"Rad"};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[]=
		{
			"A3_Data_F",
			"cba_keybinding"
		};
		version = "1";
	};
};

class CfgFunctions
{
	class Walking
	{
		class functions
		{
			tag = "Rad_WalkSpeed";
			file = "WalkSpeedMod\functions";
			class mainInit{postInit = 1;};
			class cancelEH{postInit = 1;};
		};
	};
};
/*
class RscTitles
{
	class Rad_WalkSpeed
	{
		idd = 6969;
		fadein = 0;
		fadeout = 0;
		duration = 1e+011;
		onLoad = "uinamespace setVariable ['rad_walkspeed',_this select 0]";
		onUnLoad = "uinamespace setVariable ['rad_walkspeed', nil]";
		class Controls
	{
		class Speed
		{
			type = 0;
			idc = 0;
			x = safeZoneX + safeZoneW * 0.04975;
			y = safeZoneY + safeZoneH * 0.90888889;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.06111112;
			style = 0;
			text = "Speed:  100%";
			colorBackground[] = {1,1,1,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class Sound
		{
			type = 0;
			idc = 1;
			x = safeZoneX + safeZoneW * 0.00875;
			y = safeZoneY + safeZoneH * 0.90888889;
			w = safeZoneW * 0.0375;
			h = safeZoneH * 0.06111112;
			style = 48;
			text = "walkspeedmod\ui\loudness_2.paa";
			colorBackground[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5);
			
		};
		
	};
};
};*/