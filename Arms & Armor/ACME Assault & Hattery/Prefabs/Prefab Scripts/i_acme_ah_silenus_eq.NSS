// i_temp_eq
/*
   
   Template for an Equip item script.
   This script will run each time the item is equipped.
   
   How to use this script:
   Replace the word "temp" (in line 1) with the tag of the item.  Rename the script with this name.  
    
   Additional Info:
   In general, all the item "tag-based" scripts will be named as follows:
   - a prefix ("i_" by defualt)
   - the tag of the item
   - a postfix indicating the item event.
   
   This script will be called automatically (by defualt) whether it exists or not.  If if does not exist, nothing happens.
   
   Note: this script runs on the module object, an important consideration for assigning actions.
   -ChazM   
*/
// Name_Date
#include "inc_acme"

void main()
{
    object oPC      = GetPCItemLastEquippedBy();
    object oItem    = GetPCItemLastEquipped();

 	//Your code goes here
	
	        effect eVFX = 
         EffectNWN2SpecialEffectFile(VFXbyRace("acme_fx_metalmask",oPC),
          oPC);
          
        eVFX = SupernaturalEffect(eVFX);
        
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,
         eVFX, oPC);

	
}