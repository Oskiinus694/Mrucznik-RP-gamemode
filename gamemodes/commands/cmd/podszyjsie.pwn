//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ podszyjsie ]----------------------------------------------//
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

/*
CMD:podszyj(playerid, params[]) return cmd_podszyjsie(playerid, params);
CMD:podszyjsie(playerid, params[])
{
    if(IsPlayerConnected(playerid))
    {
        if(GetPlayerFraction(playerid) != FRAC_FBI) return 1;
		if(PlayerInfo[playerid][pRank] == 4 || PlayerInfo[playerid][pRank] == 5 || PlayerInfo[playerid][pRank] == 7 || PlayerInfo[playerid][pRank] == 8 || PlayerInfo[playerid][pRank] == 9)
		{
		    ShowPlayerDialogEx(playerid,DIALOGID_PODSZYJ,DIALOG_STYLE_LIST,"Podszyj si�.","FBI\n""Grove\n""Ballas\n""ICC\n""Yakuza\n""Latin Kings","Dalej",""); //zmie� dialogid
		}
		else
		{
            SendClientMessage(playerid, COLOR_GRAD2, "	Nie mo�esz si� podszywa�!");
		}
	}
	return 1;
}*/

