//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ wyjedz ]------------------------------------------------//
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


CMD:wyjedz(playerid, params[])
{
	if(GetPVarInt(playerid, "JestPodczasWjezdzania") == 1)
	{
		sendTipMessage(playerid, "Jeste� podczas wje�d�ania!"); 
		return 1;
	}
	if(GetPVarInt(playerid, "IsAGetInTheCar") == 1)
	{
		sendErrorMessage(playerid, "Jeste� podczas wsiadania - odczekaj chwile"); 
		return 1;
	}	
	if(SprawdzWjazdy(playerid))
	{
	
	}
	else
	{
		sendErrorMessage(playerid, "Nie jeste� w obszarze, w kt�rym mo�na wjecha�"); 
	}
	return 1;
}




