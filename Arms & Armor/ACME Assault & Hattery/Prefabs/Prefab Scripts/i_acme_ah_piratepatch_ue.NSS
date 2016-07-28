// i_temp_ue
/*
   Template for an UnEquip item script.
   This script will run each time the item is un-equipped.
   
   How to use this script:
   Replace the word "temp" (in line 1) with the tag of the item.  
   Rename the script with this name.  
*/
// Name_Date
#include "inc_acme"
void main()
{
    // * This code runs when the item is unequipped
    object oPC      = GetPCItemLastUnequippedBy();
    object oItem    = GetPCItemLastUnequipped();

 	//Your code goes here

	RemoveSEFFromObject(oPC,VFXbyRace("acme_fx_patchl",oPC));
}