//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//----------------------------------------------[ supportduty ]----------------------------------------------//
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

CMD:supportduty(playerid, params[])
{
    if(PlayerInfo[playerid][pZG] == 0 && PlayerInfo[playerid][pNewAP] == 0 && PlayerInfo[playerid][pAdmin] == 0) return 1;
    if(GetPVarInt(playerid, "support_duty") == 0)
    {
        SetPVarInt(playerid, "support_duty", 1);
        sendTipMessageEx(playerid, COLOR_LIGHTBLUE, "Jestes teraz na s�u�bie pomocy nowym graczom.");
    }
    else
    {
        SetPVarInt(playerid, "support_duty", 0);
        sendTipMessageEx(playerid, COLOR_LIGHTBLUE, "Schodzisz ze s�u�bie pomocy nowym graczom.");
    }
    return 1;
}

