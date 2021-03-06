//	o01_d_overland_front
/*
	Trigger transition to Overland Map. Player has used the front door of
	the Viper Temple.
*/
//	JSH-OEI 8/22/08

#include "ginc_debug"
#include "ginc_overland"
#include "ginc_companion"
#include "ginc_misc"

void main()
{
	object oEnter		= GetClickingObject();
	
	if (!GetIsPC(oEnter) && !GetIsOwnedByPlayer(oEnter))
		return;
		
	string sDestWP		= "g00_wp_from_o01front";
	string sDestModule	= "G_X2";
	
	SetGlobalInt("00_bViperRear", FALSE);
	ExitOverlandMap(oEnter);	
	SaveRosterLoadModule(sDestModule, sDestWP);
}