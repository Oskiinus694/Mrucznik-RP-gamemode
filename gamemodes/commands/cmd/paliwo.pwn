//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ paliwo ]------------------------------------------------//
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



CMD:paliwo(playerid)
{
    if(IsPlayerConnected(playerid))
    {
		if (gGas[playerid] == 0)
		{
			gGas[playerid] = 1;
            MSGBOX_Show(playerid, "Licznik paliwa ~g~ON", MSGBOX_ICON_TYPE_OK);
			PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
		}
		else if (gGas[playerid] == 1)
		{
			gGas[playerid] = 0;
            MSGBOX_Show(playerid, "Licznik paliwa ~r~OFF", MSGBOX_ICON_TYPE_OK);
			PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
		}
	}
	return 1;
}

