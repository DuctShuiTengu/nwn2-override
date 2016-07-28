// 10a_cw_extra
/*
	nResolve: -1 = Peaceful. +1 = Violent.
	
	Global. Can go from -7 to +7.
*/
// JYL 4/26/05

void main(int nResolution)
{
	int nTemp = GetGlobalInt("10_cw_sweep_extras");
	// Since Peaceful is sent as -1 nad violent as 1, should always
	// add the sent value to the global
	nTemp = nTemp + nResolution;
	SetGlobalInt("10_cw_sweep_extras", nTemp);
	
/*	if (nResolution < 0)
		{
			nTemp = nTemp - nResolution;
			
			SetGlobalInt("10_cw_sweep_extras", nTemp);
		}
	else
		{
			nTemp = nTemp + nResolution;
			
			SetGlobalInt("10_cw_sweep_extras", nTemp);
		}
*/

}