//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//---------------------------------------------------[ po ]--------------------------------------------------//
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




CMD:po(playerid, params[])
{
	new string[128];
	new giveplayer[MAX_PLAYER_NAME];
	new sendername[MAX_PLAYER_NAME];

    if(IsPlayerConnected(playerid))
    {
        if( (IsABOR(playerid) || IsACop(playerid)) && OnDuty[playerid] == 1 || GetPlayerOrg(playerid) == 12 && OnDuty[playerid] == 1)
        {
    		if (PlayerInfo[playerid][pMember] == 2 && PlayerInfo[playerid][pRank] == 3 && PlayerInfo[playerid][pRank] == 4)
    		{
    			sendTipMessage(playerid, "Tajniacy nie mog� dawa� WL, popro� o danie WL koleg�w na /r !");
                return 1;
    		}
    		new giveplayerid, result[64];
    		if( sscanf(params, "k<fix>s[64]", giveplayerid, result))
    		{
    			sendTipMessage(playerid, "U�yj /(su)spect [playerid/Cz��Nicku] [popelnione przestepstwo]");
    			return 1;
    		}
    		if(IsPlayerConnected(giveplayerid))
    		{
    			if(giveplayerid != INVALID_PLAYER_ID)
    			{
    				if (!(IsACop(giveplayerid) && OnDuty[giveplayerid] == 1))
    				{
    					if(spamwl[giveplayerid] == 0)
    					{
    						GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
    						GetPlayerName(playerid, sendername, sizeof(sendername));
							if(PoziomPoszukiwania[giveplayerid] == 0)
							{
								PoziomPoszukiwania[giveplayerid]+=2;
							}
    						else if(PoziomPoszukiwania[giveplayerid] >= 10)
    						{
    							sendTipMessage(playerid, "Nie mo�esz da� ju� wi�cej WL");
    							return 1;
    						}
    						else
    						{
                                if(IsABOR(playerid) && PoziomPoszukiwania[giveplayerid] > 1) return sendTipMessage(playerid, "Cz�onek GSA mo�e nada� tylko 1 WL."); //14.06.2014
    							PoziomPoszukiwania[giveplayerid]+= 1;
    						}
							spamwl[giveplayerid] = 1;
    						SetTimerEx("spamujewl",60000,0,"d",giveplayerid);
							PlayCrimeReportForPlayer(playerid,giveplayerid,5);
    						SetPlayerCriminal(giveplayerid,playerid, result);
    						format(string, sizeof(string), "%s ma teraz %d WL. Jest poszukiwany za: %s", giveplayer, PoziomPoszukiwania[giveplayerid], result);
    						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
    						return 1;
    					}
    					else
    					{
    						sendErrorMessage(playerid, "Da�e� ju� poziom poszukiwania, poczekaj 1 minute (zapobiega spamowaniu WL)");
    					}
    				}
    				else
    				{
    					sendTipMessage(playerid, "   Nie mo�esz dawa� Wanted Level policjantom na s�u�bie!");
    				}
    			}
    		}
    		else
    		{
    			format(string, sizeof(string), "   Gracz o ID %d nie istnieje.", giveplayerid);
    			sendErrorMessage(playerid, string);
    			return 1;
    		}
        } else sendErrorMessage(playerid, " Nie jeste� funkcjonariuszem PD/FBI/NG/BOR na s�u�bie!");
	}
	return 1;
}

