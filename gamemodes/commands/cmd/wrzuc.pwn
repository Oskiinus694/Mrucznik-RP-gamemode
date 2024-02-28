//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ wrzuc ]-------------------------------------------------//
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

// Opis:
/*
	
*/


// Notatki skryptera:
/*
	
*/

YCMD:wrzuc(playerid, params[], help)
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME];
	new sendername[MAX_PLAYER_NAME];
    new frac = GetPlayerFraction(playerid), fam = GetPlayerOrgType(playerid);

    if(!(frac == FRAC_LCN || frac == FRAC_YKZ || frac == FRAC_HA || (frac >= 12 && frac <= 16) || fam == ORG_TYPE_GANG || fam == ORG_TYPE_MAFIA))
    {
        return sendErrorMessage(playerid, "Nie mo�esz tego zrobi�!");
	}
	
	new person, seat4;
	if(sscanf(params, "k<fix>d", person, seat4))
	{
		return sendTipMessage(playerid, "U�yj /wepchnij [ID Gracza] [miejsce 2-4]");
	}

	if(!IsPlayerConnected(person))
	{
		return sendErrorMessage(playerid, "Nie ma takiego gracza.");
	}
	if (GetPlayerState(playerid)!=PLAYER_STATE_DRIVER)
	{
		return sendTipMessage(playerid, "Musisz by� w poje�dzie.");
	}
	if (IsPlayerInAnyVehicle(person))
	{
		return sendTipMessage(playerid, "Gracz nie mo�e znajdowa� si� w poje�dzie.");
	}
	if (!ProxDetectorS(5.0, playerid, person))
	{
		return sendErrorMessage(playerid, "Gracz nie jest w pobli�u.");
	}
	if(pobity[person] == 0 && PlayerInfo[person][pBW] == 0 && PlayerInfo[person][pInjury] == 0)
	{
		return sendTipMessage(playerid, "Gracz nie jest pobity!");
	}

	GetPlayerName(person, giveplayer, sizeof(giveplayer));
	GetPlayerName(playerid, sendername, sizeof(sendername));

	format(string, sizeof(string), "* Zosta�e� wrzucony do pojazdu przez %s.", sendername);
	SendClientMessage(person, COLOR_LIGHTBLUE, string);
	format(string, sizeof(string), "* Wrzuci�e� do pojazdu %s.", giveplayer);
	SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	format(string, sizeof(string), "* %s zwi�za� i wrzuci� do pojazdu %s.", sendername ,giveplayer);
	ProxDetector(20.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	sendTipMessage(playerid, "Po trzech minutach osoba zostanie rozwi�zana!");
	sendTipMessage(person, "Po trzech minutach zostaniesz rozwi�zany!");
	SetPlayerChatBubble(person, " ", 0xFF0000FF, 70.0, 1000);
	GameTextForPlayer(person, "~r~Wrzucony do wozu", 2500, 3);

	ZdejmijBW(person);
	TogglePlayerControllable(person, 1);
	PutPlayerInVehicleEx(person, GetPlayerVehicleID(playerid), seat4);
	TogglePlayerControllable(person, 0);
	PlayerTied[person] = true;
	PlayerTiedTime[person] = 180;
	pobity[person] = 0;
	
	return 1;
}
