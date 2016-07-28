//Added new code to handle hellfire damage
//-Raygereio
//::///////////////////////////////////////////////
//:: Eldritch Glaive
//:: cmi_s0_eldglaive
//:: Purpose: WARNING: Currently critical hits are not accounted for in the damage.
//:: 	ALSO: ONLY the Brimstone, Hellrime, Vitriolic, and Standard blast are functioning.
//::	ALSO: Melee Touch Attack Focus/Specialization is not accounted for.
//::	ALSO: This has not yet been tested.  Placeholder for getting it working.
//:: Created By: Kaedrin (Matt)
//:: Created On: Nov 11, 2007
//:://////////////////////////////////////////////

#include "nw_i0_invocatns"

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
		
	int nAtkCap = GetLocalInt(GetModule(), "EldGlaiveAttackCap");
	int nAllowEssence = GetLocalInt(GetModule(), "EldGlaiveAllowEssence");
	int nAllowHaste = GetLocalInt(GetModule(), "EldGlaiveAllowHasteBoost");				
	int nHasHaste;
	
	if (nAllowHaste)
	{
	    if (GetHasSpellEffect(SPELL_EXPEDITIOUS_RETREAT, OBJECT_SELF) == TRUE)
			nHasHaste = 1;
		else
		if (GetHasSpellEffect( 647, OBJECT_SELF ) == TRUE) // Blinding Speed Feat
			nHasHaste = 1;
		else		
		if (GetHasSpellEffect( SPELL_MASS_HASTE, OBJECT_SELF ) == TRUE) // Mass Haste Spell
			nHasHaste = 1;			
		else		
		if (GetHasSpellEffect( SPELL_HASTE, OBJECT_SELF ) == TRUE) // Haste Spell
			nHasHaste = 1;
		else
		if (GetHasSpellEffect( SPELLABILITY_WARPRIEST_HASTE, OBJECT_SELF ) == TRUE)  //Warpriest Haste
			nHasHaste = 1;	
		else
		if (GetHasSpellEffect( SPELLABILITY_FAVORED_SOUL_HASTE, OBJECT_SELF ) == TRUE)  //FavSoul Haste
			nHasHaste = 1;		
		else
		if (GetHasSpellEffect( BLADESINGER_SONG_CELERITY, OBJECT_SELF ) == TRUE)  //Bladesinger Haste
			nHasHaste = 1;	
		else
		if (GetHasSpellEffect( LION_TALISID_LIONS_SWIFTNESS, OBJECT_SELF ) == TRUE)  //Lion's Swiftness Haste
			nHasHaste = 1;													
	}

    //Declare major variables
    object oTarget = GetSpellTargetObject();
	int nMetaMagic = GetMetaMagicFeat();
	int nDurVFX = VFX_INVOCATION_HIDEOUS_BLOW;
    //Enter Metamagic conditions

	//SendMessageToPC(OBJECT_SELF, "cmi_s0_eldglaive Meta: " + IntToString(nMetaMagic));
	//SendMessageToPC(OBJECT_SELF, "cmi_s0_eldglaive nSpell: " + IntToString(GetSpellId()));
	//SetWeaponVisibility(OBJECT_SELF, FALSE, 0);	
	//object oWeaponNew = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,OBJECT_SELF);
	//SetWeaponVisibility(oWeaponNew, FALSE, 0);
	
	if ( nMetaMagic & METAMAGIC_INVOC_DRAINING_BLAST )         { nDurVFX = VFX_INVOCATION_DRAINING_BLOW; }
    else if ( nMetaMagic & METAMAGIC_INVOC_FRIGHTFUL_BLAST )   { nDurVFX = VFX_INVOCATION_FRIGHTFUL_BLOW; }
    else if ( nMetaMagic & METAMAGIC_INVOC_BESHADOWED_BLAST )  { nDurVFX = VFX_INVOCATION_BESHADOWED_BLOW; }
    else if ( nMetaMagic & METAMAGIC_INVOC_BRIMSTONE_BLAST )   { nDurVFX = VFX_INVOCATION_BRIMSTONE_BLOW; }
    else if ( nMetaMagic & METAMAGIC_INVOC_HELLRIME_BLAST )    { nDurVFX = VFX_INVOCATION_HELLRIME_BLOW; }
    else if ( nMetaMagic & METAMAGIC_INVOC_BEWITCHING_BLAST )  { nDurVFX = VFX_INVOCATION_BEWITCHING_BLOW; }
    else if ( nMetaMagic & METAMAGIC_INVOC_NOXIOUS_BLAST )     { nDurVFX = VFX_INVOCATION_NOXIOUS_BLOW; }
    else if ( nMetaMagic & METAMAGIC_INVOC_VITRIOLIC_BLAST )   { nDurVFX = VFX_INVOCATION_VITRIOLIC_BLOW; }
    else if ( nMetaMagic & METAMAGIC_INVOC_UTTERDARK_BLAST )   { nDurVFX = VFX_INVOCATION_UTTERDARK_BLOW; }
	else if ( nMetaMagic & METAMAGIC_INVOC_BINDING_BLAST )     { nDurVFX = VFX_INVOCATION_BINDING_BLOW; }
	else if ( nMetaMagic & METAMAGIC_INVOC_HINDERING_BLAST )   { nDurVFX = VFX_INVOCATION_HINDERING_BLOW; }

    effect eDur = EffectVisualEffect( nDurVFX );
	
    RemoveEffectsFromSpell(OBJECT_SELF, GetSpellId());

    //Fire cast spell at event for the specified target
    SignalEvent(OBJECT_SELF, EventSpellCastAt(OBJECT_SELF, GetSpellId(), FALSE));

    //Apply the VFX impact and effects
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDur, OBJECT_SELF,6.0f);
	//Apply Damage
	
	int nBaseBAB = GetTRUEBaseAttackBonus(OBJECT_SELF);
	int nCurrentBAB = nBaseBAB;
	
	int nBonus = 0;
    if (GetHasFeat(FEAT_EPIC_ELDRITCH_MASTER, OBJECT_SELF))
    {
        nBonus = 2;
    }
	object oScepter = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,OBJECT_SELF);
	if (GetIsObjectValid(oScepter) && (GetTag(oScepter) == "cmi_wlkscptr01"))
		nBonus += 2;	
	
	int nAttacks = nBaseBAB / 5;
	if (nAttacks == 0)
		nAttacks = 1;
	if (nAtkCap)
	{
		if (nAttacks > nAtkCap)
			nAttacks = nAtkCap;
	}
	int nCurrentAttack = 1;
			
	while (nCurrentBAB >= 0 && nCurrentAttack <= nAttacks)
	{
		int nHit = TouchAttackMelee(oTarget,TRUE,(nCurrentBAB - nBaseBAB + nBonus));
		if (nHit > 0)
		{
			if (nAllowEssence)
				DoEldritchCombinedEffects(oTarget, FALSE, FALSE );
			else
				DoEldritchBlast(OBJECT_SELF, oTarget,FALSE,FALSE);
		}
		if (nAllowHaste && nHasHaste && nCurrentAttack == 1)
			nAllowHaste = 0;
		else
		{
			nCurrentAttack++;
			nCurrentBAB -= 5;
		}
	}
	
	if (GetLocalInt(OBJECT_SELF, "MaxEldBlast"))
		SendMessageToPC(OBJECT_SELF, "Maximizing Eldritch Blast");
	if (GetLocalInt(OBJECT_SELF, "EmpEldBlast"))
		SendMessageToPC(OBJECT_SELF, "Empowering Eldritch Blast");		
	SetLocalInt(OBJECT_SELF, "MaxEldBlast", 0);
	SetLocalInt(OBJECT_SELF, "EmpEldBlast", 0);	
	
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