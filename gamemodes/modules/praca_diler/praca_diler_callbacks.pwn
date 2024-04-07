//----------------------------------------------<< Callbacks >>----------------------------------------------//
//                                                praca_diler                                                //
//----------------------------------------------------*------------------------------------------------------//
//----[                                                                                                 ]----//
//----[         |||||             |||||                       ||||||||||       ||||||||||               ]----//
//----[        ||| |||           ||| |||                      |||     ||||     |||     ||||             ]----//
//----[       |||   |||         |||   |||                     |||       |||    |||       |||            ]----//
//----[       ||     ||         ||     ||                     |||       |||    |||       |||            ]----//
//----[      |||     |||       |||     |||                    |||     ||||     |||     ||||             ]----//
//----[      ||       ||       ||       ||     __________     ||||||||||       ||||||||||               ]----//
//----[     |||       |||     |||       |||                   |||    |||       |||                      ]----//
//----[     ||         ||     ||         ||                   |||     ||       |||                      ]----//
//----[    |||         |||   |||         |||                  |||     |||      |||                      ]----//
//----[    ||           ||   ||           ||                  |||      ||      |||                      ]----//
//----[   |||           ||| |||           |||                 |||      |||     |||                      ]----//
//----[  |||             |||||             |||                |||       |||    |||                      ]----//
//----[                                                                                                 ]----//
//----------------------------------------------------*------------------------------------------------------//
// Autor: mrucznik
// Data utworzenia: 31.03.2024
//Opis:
/*
	Praca Dilera Narkotyków.
*/

//

#include <YSI\y_hooks>

//-----------------<[ Callbacki: ]>-----------------
DrugDealer_OnPlayerExitVehicle(playerid, vehicleid)
{
	if(vehicleid == INVALID_VEHICLE_ID)
	{
		vehicleid = GetPlayerVehicleID(playerid);
		if(vehicleid == INVALID_VEHICLE_ID)
		{
			vehicleid = gLastCar[playerid];
		}
	}

	if(GetPVarInt(playerid, PVAR_DEALER_PRICE) != 0)
	{
		DisableDrugDealing(playerid, vehicleid);
		MruMessageBadInfo(playerid, "Przestałeś sprzedawać narkotyki.");
	}
	return 1;
}

DrugDealer_OnPlayerDiconnect(playerid)
{
	if(GetPVarInt(playerid, PVAR_DEALER_PRICE) != 0)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(vehicleid == INVALID_VEHICLE_ID)
		{
			vehicleid = gLastCar[playerid];
		}
		DisableDrugDealing(playerid, vehicleid);
	}
	return 1;
}

//end