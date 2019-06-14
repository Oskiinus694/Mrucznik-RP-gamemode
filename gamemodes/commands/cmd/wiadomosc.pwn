//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-----------------------------------------------[ wiadomosc ]-----------------------------------------------//
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
YCMD:wiadomosc(playerid, params[], help)
{
    if(gPlayerLogged[playerid] == 0)//Sprawdza czy gracz jest po��czony 
    {
        return 1;
    }
    new giveplayerid, text[128]; 
    if(sscanf(params, "k<fix>s[128]", giveplayerid, text))
    {
        sendTipMessage(playerid, "U�yj /(w)iadomosc [playerid/Cz�cNicku] [tekst]"); 
        return 1;
    }
    if(IsPlayerConnected(giveplayerid) && giveplayerid != INVALID_PLAYER_ID)
    {
        if(gPlayerLogged[giveplayerid] == 0)
        {
            sendErrorMessage(playerid, "Gracz aktualnie loguje si� do gry! Odczekaj chwil�"); 
            return 1;
        }
        if(HidePM[giveplayerid] > 0 || HidePM[playerid] > 0)
        {
            sendTipMessage(playerid, "Kto� z was ma zablokowane wiadomo�ci!"); 
            return 1;
        }
        if(PlayerInfo[playerid][pBW] > 0 && GetDistanceBetweenPlayers(playerid, giveplayerid) > 50.0 && (PlayerInfo[playerid][pAdmin] > 0 || PlayerInfo[playerid][pNewAP] > 0 || PlayerInfo[playerid][pZG] > 0)) {
            return sendErrorMessage(playerid, "Gdy masz BW mo�esz wysy�a� wiadomo�ci jedynie na ma�� odleg�o��");
        }
        
        //Dodatkowe zabezpieczenia
        new string[256]; 
        if(giveplayerid == playerid)//Jeszcze easter egg na poczatek
        {
            format(string, sizeof(string), "* %s mruczy (jak Mrucznik) co� pod nosem.", GetNick(playerid));
            ProxDetector(5.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE); 
            return 1;
        }
        if (AntyReklama(text) != 0)
        {
            SendClientMessage(playerid, COLOR_GRAD2, "NIE CHCEMY REKLAM!");
            format(string, sizeof(string), "AdmWarning: [%d] %s REKLAMA: %s.", playerid, GetNick(playerid), text);
            SendMessageToAdmin(string, COLOR_LIGHTRED);
            Log(czitLog, INFO, string);
            return 1;
        }
        if (AntyCzitText(text))
        {
            format(string, sizeof(string), "AdmWarning: [%d] %s m�wi co� o cheat'ach do [%s]: %s", playerid, GetNick(playerid), giveplayerid, text);
            SendMessageToAdmin(string, COLOR_LIGHTRED); 
            Log(czitLog, INFO, string);
        }
        //======================================[WYKONANIE - WYS�ANIE WIADOMO�CI]==================
        if(strlen(params) < 78)
        {
            format(string, sizeof(string), "�� %s (%d%s): %s", GetNick(giveplayerid), giveplayerid, (!IsPlayerPaused(giveplayerid)) ? (""): (", AFK"), text);
            SendClientMessage(playerid, COLOR_YELLOW, string);
            
            format(string, sizeof(string), "�� %s (%d): %s", GetNick(playerid), playerid, text);
            SendClientMessage(giveplayerid, COLOR_NEWS, string);
            if(GetPlayerAdminDutyStatus(giveplayerid) == 1)
            {
                iloscInWiadomosci[giveplayerid] = iloscInWiadomosci[giveplayerid]+1;
            }
            if(GetPlayerAdminDutyStatus(playerid) == 1)
            {
                iloscOutWiadomosci[playerid] = iloscOutWiadomosci[playerid]+1;
            }
        }
        else 
        {
            new pos = strfind(params, " ", true, strlen(params) / 2);
            if(pos != -1)
            {
                new text2[64];
                strmid(text2, text, pos, strlen(text));
                strdel(text, pos, strlen(text));

                format(string, sizeof(string), "�� %s (%d%s): %s [.]", GetNick(giveplayerid), giveplayerid, (!IsPlayerPaused(giveplayerid)) ? (""): (", AFK"), text);
                SendClientMessage(playerid, COLOR_YELLOW, string);
            
                format(string, sizeof(string), "[.] %s", text2);
                SendClientMessage(playerid, COLOR_YELLOW, string);
                
                
                format(string, sizeof(string), "�� %s (%d): %s [.]", GetNick(playerid), playerid, text);
                SendClientMessage(giveplayerid, COLOR_NEWS, string);
                
                format(string, sizeof(string), "[.] %s", text2);
                SendClientMessage(giveplayerid, COLOR_NEWS, string);
                if(GetPlayerAdminDutyStatus(playerid) == 1)
                {
                    iloscOutWiadomosci[playerid] = iloscOutWiadomosci[playerid]+1;
                }
                if(GetPlayerAdminDutyStatus(giveplayerid) == 1)
                {
                    iloscInWiadomosci[giveplayerid] = iloscInWiadomosci[giveplayerid]+1;
                }		
            }
        }
        //d�wi�ki
        PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
        PlayerPlaySound(giveplayerid, 1057, 0.0, 0.0, 0.0);
        //zapisywanie do /re
        lastMsg[giveplayerid] = playerid;
        //podgl�d
        if(PlayerInfo[playerid][pPodPW] == 1 || PlayerInfo[giveplayerid][pPodPW] == 1)
        {
            format(string, sizeof(string), "AdmCmd -> %s(%d) /w -> %s(%d): %s", GetNick(playerid), playerid, GetNick(giveplayerid), giveplayerid, text);
            ABroadCast2(COLOR_LIGHTGREEN,string,1);
        }
    }
    return 1;
}