//-----------------------------------------------<< MySQL >>-------------------------------------------------//
//                                                  graffiti                                                 //
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
// Autor: Sanda�
// Data utworzenia: 01.02.2020
//Opis:
/*
	System graffiti
*/

//

//------------------<[ MySQL: ]>--------------------
stock graffiti_LoadMySQL(id = -1)
{
	new query[1024];
	new lStr[263]; 
	new lStr2[64];
	new string[128];
	new valueGraffiti;
	new loadedGraffiti;
	format(lStr, sizeof(lStr), "SELECT COUNT(*) FROM `mru_graffiti`");
	mysql_query(lStr);
	mysql_store_result();
	mysql_fetch_row_format(lStr2,"|");
	valueGraffiti = strval(lStr2);
	mysql_free_result();
	if(id == -1)
	{
		for(new i; i <= GRAFFITI_MAX; i++) 
		{
			lStr = "`ownerName`, `text`, `kolor`, `x`, `y`, `z`, `xy`, `yy`, `zy`";
			format(query, sizeof(query), "SELECT %s FROM `mru_graffiti` WHERE `id`='%d'", lStr, i);
			mysql_query(query); 
			mysql_store_result();
			if (mysql_num_rows())
			{
				mysql_fetch_row_format(query, "|");
				sscanf(query, "p<|>s[64]s[128]dffffff",
				GraffitiInfo[i][pOwner],
				GraffitiInfo[i][grafText],
				GraffitiInfo[i][gColor],
				GraffitiInfo[i][grafXpos],
				GraffitiInfo[i][grafYpos],
				GraffitiInfo[i][grafZpos],
				GraffitiInfo[i][grafXYpos],
				GraffitiInfo[i][grafYYpos],
				GraffitiInfo[i][grafZYpos]);
				loadedGraffiti++;
			}
			mysql_free_result();

			switch(GraffitiInfo[i][gColor])
			{
				case 0: GraffitiInfo[i][gColor] = GRAFFITI_CZARNY;
 
                case 1: GraffitiInfo[i][gColor] = GRAFFITI_BIALY;
 
                case 2: GraffitiInfo[i][gColor] = GRAFFITI_CZERWONY;
 
                case 3: GraffitiInfo[i][gColor] = GRAFFITI_ZIELONY;
 
                case 4: GraffitiInfo[i][gColor] = GRAFFITI_NIEBIESKI;
 
                case 5: GraffitiInfo[i][gColor] = GRAFFITI_SZARY;

				case 6: GraffitiInfo[i][gColor] = GRAFFITI_POMARANCZOWY;

				case 7: GraffitiInfo[i][gColor] = GRAFFITI_ZOLTY;

				case 8: GraffitiInfo[i][gColor] = GRAFFITI_FIOLETOWY;

				case 9: GraffitiInfo[i][gColor] = GRAFFITI_ROZOWY;
			}
			strreplace(GraffitiInfo[i][grafText], "~n~", "\n", .ignorecase = true);
			GraffitiInfo[i][gID] = CreateDynamicObject(19482, GraffitiInfo[i][grafXpos], GraffitiInfo[i][grafYpos], GraffitiInfo[i][grafZpos], GraffitiInfo[i][grafXYpos], GraffitiInfo[i][grafYYpos], GraffitiInfo[i][grafZYpos], 0, 0, -1, 200);
    		SetDynamicObjectMaterialText(GraffitiInfo[i][gID], 0, GraffitiInfo[i][grafText], OBJECT_MATERIAL_SIZE_256x256, "Arial", 24, 0, GraffitiInfo[i][gColor], 0, 1);
		}
		format(string, sizeof(string), "Zaladowano %d graffiti z %d w bazie", loadedGraffiti, valueGraffiti);
		print(string);
	}
	else
	{
		lStr = "`ownerName`, `text`, `kolor`, `x`, `y`, `z`, `xy`, `yy`, `zy`";
		format(query, sizeof(query), "SELECT %s FROM `mru_graffiti` WHERE `id`='%d'", lStr, id);
		mysql_query(query); 
		mysql_store_result();
		if (mysql_num_rows())
		{
			mysql_fetch_row_format(query, "|");
			sscanf(query, "p<|>s[32]s[128]dffffff",
			GraffitiInfo[id][pOwner],
			GraffitiInfo[id][grafText],
			GraffitiInfo[id][gColor],
			GraffitiInfo[id][grafXpos],
			GraffitiInfo[id][grafYpos],
			GraffitiInfo[id][grafZpos],
			GraffitiInfo[id][grafXYpos],
			GraffitiInfo[id][grafYYpos],
			GraffitiInfo[id][grafZYpos]);
		}
		mysql_free_result();
		switch(GraffitiInfo[id][gColor])
		{
			case 0: GraffitiInfo[id][gColor] = GRAFFITI_CZARNY;
 
            case 1: GraffitiInfo[id][gColor] = GRAFFITI_BIALY;
 
            case 2: GraffitiInfo[id][gColor] = GRAFFITI_CZERWONY;
 
            case 3: GraffitiInfo[id][gColor] = GRAFFITI_ZIELONY;
 
            case 4: GraffitiInfo[id][gColor] = GRAFFITI_NIEBIESKI;
 
            case 5: GraffitiInfo[id][gColor] = GRAFFITI_SZARY;
			
			case 6: GraffitiInfo[id][gColor] = GRAFFITI_POMARANCZOWY;

			case 7: GraffitiInfo[id][gColor] = GRAFFITI_ZOLTY;

			case 8: GraffitiInfo[id][gColor] = GRAFFITI_FIOLETOWY;

			case 9: GraffitiInfo[id][gColor] = GRAFFITI_ROZOWY;
		}
		strreplace(GraffitiInfo[id][grafText], "~n~", "\n", .ignorecase = true);
		GraffitiInfo[id][gID] = CreateDynamicObject(19482, GraffitiInfo[id][grafXpos], GraffitiInfo[id][grafYpos], GraffitiInfo[id][grafZpos], GraffitiInfo[id][grafXYpos], GraffitiInfo[id][grafYYpos], GraffitiInfo[id][grafZYpos], 0, 0, -1, 200);
    	SetDynamicObjectMaterialText(GraffitiInfo[id][gID], 0, GraffitiInfo[id][grafText], OBJECT_MATERIAL_SIZE_256x256, "Arial", 24, 0, GraffitiInfo[id][gColor], 0, 1);
	}
	return 0;
}

stock graffiti_LoadPlayerMySQL(playerid)
{
	new query[1024];
	new lStr[263]; 
	format(query, sizeof(query), "SELECT COUNT(*) FROM `mru_graffiti` WHERE `ownerName` = '%s'", GetNick(playerid));
	mysql_query(query);
	mysql_store_result();
	mysql_fetch_row_format(lStr,"|");
	Graffiti_Amount[playerid] = strval(lStr);
	mysql_free_result();
}

stock graffiti_SaveMySQL(id, playerid)
{
	new query[1024];
	format(query, sizeof(query), "INSERT INTO `mru_graffiti`(`id`, `ownerName`, `text`, `kolor`, `x`, `y`, `z`, `xy`, `yy`, `zy`) VALUES ('%d', '%s', '%s', '%d', '%f', '%f', '%f', '%f', '%f', '%f')",
	id,
	GetNick(playerid),
	GraffitiInfo[id][grafText],
	GraffitiInfo[id][gColor],
	GraffitiInfo[id][grafXpos],
	GraffitiInfo[id][grafYpos],
	GraffitiInfo[id][grafZpos],
	GraffitiInfo[id][grafXYpos],
	GraffitiInfo[id][grafYYpos],
	GraffitiInfo[id][grafZYpos]);
	mysql_query(query);
}

stock graffiti_UpdateMySQL(id, type = 1)
{
	new query[1024];
	if(type == 1)
	{
		format(query, sizeof(query), "UPDATE `mru_graffiti` SET `x`='%f',`y`='%f',`z`='%f',`xy`='%f',`yy`='%f',`zy`='%f' WHERE `id`='%d'",
		GraffitiInfo[id][grafXpos],
		GraffitiInfo[id][grafYpos],
		GraffitiInfo[id][grafZpos],
		GraffitiInfo[id][grafXYpos],
		GraffitiInfo[id][grafYYpos],
		GraffitiInfo[id][grafZYpos],
		id);
		mysql_query(query);
	}
	else if(type == 2)
	{
		format(query, sizeof(query), "UPDATE `mru_graffiti` SET `text`='%s',`kolor`='%d' WHERE `id`='%d'",
		GraffitiInfo[id][grafText],
		GraffitiInfo[id][gColor],
		id);
		mysql_query(query);
	}
}

stock graffiti_DeleteMySQL(id)
{
	DestroyDynamicObject(GraffitiInfo[id][gID]);
	new query[1024];
	format(query, sizeof(query), "DELETE FROM `mru_graffiti` WHERE `id`='%d'", id);
	mysql_query(query);
}

//stock graffiti_UpdateMySQL(id)
//end