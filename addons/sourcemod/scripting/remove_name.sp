#pragma semicolon 1
#pragma tabsize 0

#include <sourcemod>
#include <sdktools>
#include <sdkhooks>
#include <clientprefs>

#pragma newdecls required

static const char forbiddenNames[][255] = 
{
	"G.E.W.P.",
	"G.E.W.P",
	"cTF2w",
	"sweetstakes.tf",
	"double.tf",
	"redsun.tf",
	"trade.tf",
	"MLG",
	"backpack.tf",
	"scrap.tf",
	"tf2roulette.com",
	"freeitems.tf",
	"kickback.com",
	"cs.money",
	"blw.tf",
	"pvpro.com",
	"csgoatse.com",
	"csgolive.com",
	"tf2swap.com",
	"wildcase.com",
	"scrap2unusual",
	"hellcase.com",
	"flashyflashy.com",
	"farmskins.com",
	"upgrade.gg",
	"dotax2.com",
	"caserandom.com",
	"csgo-shop.pro",
	"civilgamers.com",
	"csgo-skins.com",
	"csgobounty.com",
	"g2a.com",
	"o.w.n",
	"skins.cash",
	"tfmarket.ru",
	"titan.tf",
};

char playername[MAX_NAME_LENGTH];

public Plugin myinfo = 
{
	name = "Name Prefix Remover",
	author = "SomePanns",
	description = "BTW check out SourceCBL",
	version = "1.3 build 37",
	url = "https://sourcecbl.com/"
};

public void OnPluginStart()
{
	
}

public void OnClientPostAdminCheck(int client)
{
	CheckName(client);
}

public void CheckName(int client)
{
	GetClientName(client, playername, sizeof(playername));
	
	for(int i = 0; i <= sizeof(forbiddenNames); i++)
	{
		if(StrContains(playername, forbiddenNames[i], false) != -1)
		{
			ReplaceString(playername, MAX_NAME_LENGTH, forbiddenNames[i], "", false);
			SetClientName(client, playername);
		}
	}
}
