//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                    anim                                                    //
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
// Autor: Mrucznik
// Data utworzenia: 11.06.2019


//

//------------------<[ Implementacja: ]>-------------------
command_zweryfikuj_Impl(playerid, giveplayerid)
{
    if(PlayerInfo[playerid][pAdmin] >= 1 || PlayerInfo[playerid][pZG] == 10)
    {
        if(ALockdown_SearchTable(giveplayerid))
            return sendTipMessage(playerid, "Ten gracz otrzyma� ju� weryfikacje!");
            
        if(Lockdown_assignedVW[giveplayerid] == 0)
            return sendTipMessage(playerid, "Ten gracz nie jest zablokowany w weryfikacji. (z�e id?)");
        
        ALockdown_Verified(giveplayerid, playerid);
    }
    return 1;
}

//end