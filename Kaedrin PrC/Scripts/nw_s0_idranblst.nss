//Added new code to handle hellfire damage
//-Raygereio
//::///////////////////////////////////////////////
//:: Invocation: Draining Blast (Warlock Invocation)
//:: NW_S0_IDranBlst.nss
//:://////////////////////////////////////////////
/*
    Does 1d6 Dmg per "ranking" of Eldritch Blast.
    Additionally, Target must make Will Save or
    suffer from effects of the Slow (Wiz 3)
    Spell.
*/
//:://////////////////////////////////////////////
//:: Created By: Jesse Reynolds (JLR - OEI)
//:: Created On: June 20, 2005
//:://////////////////////////////////////////////
//:: VFX Pass By: Preston W, On: June 20, 2001


#include "nw_i0_invocatns"
#include "x2_inc_spellhook" 


void main()
{

/* 
  Spellcast Hook Code 
  Added 2003-06-23 by GeorgZ
  If you want to make changes to all spells,
  check x2_inc_spellhook.nss to find out more
  
*/

    if (!X2PreSpellCastCode())
    {
	// If code within the PreSpellCastHook (i.e. UMD) reports FALSE, do not run this spell
        return;
    }

// End of Spell Cast Hook


    //Declare major variables
    object oTarget = GetSpellTargetObject();

    // Additional Effects: (Slow Effect)
    DoEssenceDrainingBlast(OBJECT_SELF, oTarget);
	if (IsHellfireBlastActive())
	{
//		Check to see if the option int exists
		int nRayg_Hellfire = GetLocalInt(GetModule(), "RAYG_HELLFIRE_OPTIONS");
		if(!nRayg_Hellfire)
//		If the option int does not exist, create it by reading it from the .2da		
		{
			string sRayg_Hellfire = Get2DAString("RAYG_HELLFIRE_OPTIONS", "VALUE", 0);
			nRayg_Hellfire = StringToInt(sRayg_Hellfire);
			SetLocalInt(GetModule(), "RAYG_HELLFIRE_OPTIONS", nRayg_Hellfire);	
		}
	    object oTarget = GetSpellTargetObject();
		object oCaster = OBJECT_SELF;
		if (GetObjectType(oTarget)==OBJECT_TYPE_CREATURE && oTarget != OBJECT_SELF && GetIsReactionTypeHostile(oTarget))
		{
			string sHellfireFeedbackText;
			if (nRayg_Hellfire == 2)
			{
				effect eConst = EffectDamage(1, DAMAGE_TYPE_ALL, DAMAGE_POWER_NORMAL, TRUE);
				eConst = SetEffectSpellId(eConst, -1);
				ApplyEffectToObject(DURATION_TYPE_PERMANENT, eConst, oCaster);
				string sHellfireFeedbackText = "hellfire blast has decreased your health by 1";
				string sHellfireFeedbackName = GetName( oCaster );
				string sHellfireFeedbackMsg = "<c=tomato>" + sHellfireFeedbackName + ": " + sHellfireFeedbackText +". </c>";
				FloatingTextStringOnCreature(sHellfireFeedbackMsg, oCaster);
			}
			if (nRayg_Hellfire == 3)
			{
				effect eConst = EffectDamage(5, DAMAGE_TYPE_ALL, DAMAGE_POWER_NORMAL, TRUE);
				eConst = SetEffectSpellId(eConst, -1);
				ApplyEffectToObject(DURATION_TYPE_PERMANENT, eConst, oCaster);
				string sHellfireFeedbackText = "hellfire blast has decreased your health by 5";
				string sHellfireFeedbackName = GetName( oCaster );
				string sHellfireFeedbackMsg = "<c=tomato>" + sHellfireFeedbackName + ": " + sHellfireFeedbackText +". </c>";
				FloatingTextStringOnCreature(sHellfireFeedbackMsg, oCaster);
			}
			if (nRayg_Hellfire == 4)
			{
				effect eConst = EffectAbilityDecrease(ABILITY_CONSTITUTION, 1);
				eConst = SetEffectSpellId(eConst, -1);
				ApplyEffectToObject(DURATION_TYPE_PERMANENT, eConst, oCaster);
				string sHellfireFeedbackText = "hellfire blast has decreased your constitution by 1";
				string sHellfireFeedbackName = GetName( oCaster );
				string sHellfireFeedbackMsg = "<c=tomato>" + sHellfireFeedbackName + ": " + sHellfireFeedbackText +". </c>";
				FloatingTextStringOnCreature(sHellfireFeedbackMsg, oCaster);
			}
		}
	}	
}