//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ wyniki ]------------------------------------------------//
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

CMD:wyniki(playerid, params[])
{
	new string[64];

    if(IsPlayerConnected(playerid))
    {
        SendClientMessage(playerid, COLOR_LIGHTGREEN, "Tabela wynik�w:");
        foreach(new i : Player)
		{
		    if(zawodnik[i] == 1)
		    {
		        if(okregi[i] >= 1)
		        {
		            new iplayer[MAX_PLAYER_NAME];
			        GetPlayerName(i, iplayer, sizeof(iplayer));
			        format(string, sizeof(string), "%s - %d okr��e�", iplayer, okregi[i]);
					SendClientMessage(playerid, COLOR_WHITE, string);
				}
		    }
		}
    }
	return 1;
}


