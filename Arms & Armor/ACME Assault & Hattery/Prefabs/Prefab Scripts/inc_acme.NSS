//VFXbyRace
/*
	Description: Check oPC's racial type and return a vfx filename tailored to fit that race
	
*/
// Barrel of Monkeys 29-6-2008
//revision 15-7-2008 to add halflings as a separate vfx, and moved wild elves to the HH vfx


string VFXbyRace(string basename, object oPC)
{
	string sFilename = "";
	int iRace = GetRacialType(oPC);
	int iSubR = GetSubRace(oPC);
	if (iRace == RACIAL_TYPE_DWARF) sFilename = basename + "_DD";
	else if (iRace == RACIAL_TYPE_ELF && iSubR != RACIAL_SUBTYPE_WILD_ELF ) sFilename = basename + "_EE";
	else if (iRace == RACIAL_TYPE_GNOME) sFilename = basename + "_GG";
	else if (iRace == RACIAL_TYPE_HALFORC) sFilename = basename + "_OO";
	else if (iRace == RACIAL_TYPE_HUMAN || iRace == RACIAL_TYPE_HALFELF || iRace == RACIAL_TYPE_OUTSIDER 
	   || iSubR == RACIAL_SUBTYPE_WILD_ELF ) sFilename = basename + "_HH";
	else if (iRace == RACIAL_TYPE_HALFLING) sFilename = basename + "_AA";
//	SendMessageToPC(oPC,"FILENAME is: " + sFilename);
	return sFilename;
}