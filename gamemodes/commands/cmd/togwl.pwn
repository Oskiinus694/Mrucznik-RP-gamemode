//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ togwl ]-------------------------------------------------//
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



CMD:togwl(playerid)
{
    if(IsPlayerConnected(playerid))
    {
        if(IsACop(playerid))
        {
			if (!gCrime[playerid])
			{
				gCrime[playerid] = 1;
                MSGBOX_Show(playerid, "Raporty o przestepstwach ~r~OFF", MSGBOX_ICON_TYPE_OK);
			}
			else if (gCrime[playerid])
			{
				gCrime[playerid] = 0;
                MSGBOX_Show(playerid, "Raporty o przestepstwach ~g~ON", MSGBOX_ICON_TYPE_OK);
			}
		}
	}
	return 1;
}

