//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ togooc ]------------------------------------------------//
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


CMD:togooc(playerid)
{
    if(IsPlayerConnected(playerid))
    {
		if (!gOoc[playerid])
		{
			gOoc[playerid] = 1;
            MSGBOX_Show(playerid, "Czat OOC ~r~OFF", MSGBOX_ICON_TYPE_OK);
		}
		else if (gOoc[playerid])
		{
			gOoc[playerid] = 0;
            MSGBOX_Show(playerid, "Czat OOC ~g~ON", MSGBOX_ICON_TYPE_OK);
		}
	}
	return 1;
}

