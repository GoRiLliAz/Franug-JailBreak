#pragma semicolon 1
#include <sourcemod>
#include <sdktools>
#include <franug_jb>

// configuration part
#define AWARDNAME "p90" // Name of award
#define PRICE 200 // Award price
#define AWARDTEAM JB_PRISIONERS // Set team that can buy this award (use JB_BOTH ZP_GUARDS JB_PRISONS)
#define TRANSLATIONS "jailbreak_p90.phrases" // Set translations file for this subplugin
// end configuration


// dont touch
public OnPluginStart()
{
	CreateTimer(0.1, Lateload);
}

public Action:Lateload(Handle:timer)
{
	LoadTranslations(TRANSLATIONS); // translations to the local plugin
	JB_LoadTranslations(TRANSLATIONS); // sent translations to the main plugin
	
	JB_AddAward(AWARDNAME, PRICE, AWARDTEAM); // add award to the main plugin
}
public OnPluginEnd()
{
	JB_RemoveAward(AWARDNAME); // remove award when the plugin is unloaded
}
// END dont touch part


public JB_OnAwardBought( client, const String:awardbought[])
{
	if(StrEqual(awardbought, AWARDNAME))
	{
		// use your custom code here
		PrintToChat(client, " \x04[Franug-JailBreak] \x05%t", "Has comprado una p90"); // translation msg
		GivePlayerItem(client, "weapon_p90");
	}
}