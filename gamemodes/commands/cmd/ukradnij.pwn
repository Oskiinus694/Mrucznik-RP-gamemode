//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//------------------------------------------------[ ukradnij ]-----------------------------------------------//
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



CMD:ukradnij(playerid, params[])
{
    if(IsPlayerConnected(playerid))
   	{
        if(PlayerInfo[playerid][pJob] == 5)
		{
		    if(PlayerOnMission[playerid] > 0)
		    {
		        sendTipMessageEx(playerid, COLOR_GREY, "Jeste� na misji, nie mo�esz tego u�y�!");
		        return 1;
		    }
	        if(PlayerInfo[playerid][pCarTime] == 0)
	        {
	            GameTextForPlayer(playerid, "~w~Ukradles woz ~n~~r~Dostarcz go do zurawia", 5000, 1);
	            CP[playerid] = 1;
	            SetPlayerCheckpoint(playerid, -1548.3618,123.6438,3.2966,8.0);
	        }
	        else
	        {
	            sendTipMessageEx(playerid, COLOR_GREY, "Ukrad�e� ju� wcze�niej w�z, poczekaj a� policja si� uspokoi!");
	        }
		}
		else
		{
			sendTipMessageEx(playerid, COLOR_GREY, "Nie jeste� z�odziejem aut!");
		}
	}//not connected
	return 1;
}

