// ***************
// C_WantToRansack
// ***************

func int C_WantToRansack(var C_Npc slf)
{
	// ------ NpcType_Friend plündert den Spieler nicht ------
	if ((slf.npctype == NpcType_Friend) && (Npc_IsPlayer(other)))
	{
		return FALSE;
	};

	// Raven
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Raven))
	{
		return FALSE;
	};

	// ------ ausgenommene Gilden ------
	if ((slf.guild == GIL_DMT)
	|| (slf.guild == GIL_ORC)
	|| (slf.guild == GIL_PAL)
	|| (slf.guild == GIL_KDF)
	|| (slf.guild == GIL_NOV)
	|| (slf.guild == GIL_KDW))
	{
		return FALSE;
	};

	return TRUE;
};
