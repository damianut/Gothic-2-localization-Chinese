instance BAU_921_Bauer(Npc_Default)
{
	// -------- NPC --------
	name							= NAME_BAUER;
	npctype							= NPCTYPE_AMBIENT;
	guild							= GIL_BAU;
	flags							= 0; // NPC_FLAG_IMMORTAL oder 0

	voice							= 13;
	id								= 921;

	// -------- attributes --------
	B_SetAttributesToChapter(self, 1); // setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)

	// -------- visuals --------
	B_SetNpcVisual(self, MALE, "Hum_Head_Bald", Face_N_NormalBart_Dusty, BodyTex_N, ITAR_BAU_L);
	Mdl_SetModelFatness(self, 1);
	Mdl_ApplyOverlayMDS(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// -------- fight tactic --------
	fight_tactic = FAI_HUMAN_COWARD; // MASTER / STRONG / COWARD

	// -------- talents --------
	B_GiveNpcTalents(self);

	// -------- fighting skills --------
	B_SetFightSkills(self, 15); // Grenzen für Talent-Level liegen bei 30 und 60

	// -------- inventory --------
	B_CreateAmbientInv(self);

	// -------- equipped weapons --------
	EquipItem(self, ItMw_1h_Bau_Axe);

	// -------- daily routine --------
	daily_routine = Rtn_Start_921;
};

func void Rtn_Start_921()
{
	TA_Smalltalk(07, 55, 19, 55, "NW_BIGFARM_STABLE_OUT_01");
	TA_Smalltalk(19, 55, 21, 55, "NW_BIGFARM_PATH_04_1"); // Joly: Partnerwechsel
	TA_Smalltalk(21, 55, 07, 55, "NW_BIGFARM_STABLE_01");
};
