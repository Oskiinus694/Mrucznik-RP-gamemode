//-----------------------------------------------<< Komenda >>-----------------------------------------------//
//-------------------------------------------------[ naucz ]-------------------------------------------------//
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

YCMD:rozbierz(playerid, params[], help)
{
    new colorID; 
    if(isNaked[playerid])
    {
        UndressPlayer(playerid, true);
        return 1;
    }
    
    if( sscanf(params, "k<fix>", colorID))
    {
        sendTipMessage(playerid, "U�yj /rozbierz [1 - bia�y || 2 - czarny]");
        return 1;
    }

    if(GetPlayerVirtualWorld(playerid) == 40 || PlayerInfo[playerid][pDomWKJ] != 0) //ostatni warunek to INT SEKTA
    {
        UndressPlayer(playerid,false, colorID); 
    }
    else
    {
        sendTipMessage(playerid, "Rozebra� si� mo�esz tylko w klubie ze striptizem i domu!"); 
    }
    return 1;
}
