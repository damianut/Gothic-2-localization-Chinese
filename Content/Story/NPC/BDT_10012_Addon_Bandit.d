instance BDT_10012_Addon_Bandit(Npc_Default)
{
	// -------- NPC --------
	name							= NAME_BANDIT;
	npctype							= NPCTYPE_TAL_AMBIENT;
	guild							= GIL_BDT;
	flags							= 0;

	voice							= 13;
	id								= 10012;

	// -------- attributes --------
	B_SetAttributesToChapter(self, 3);

	// -------- visuals --------
	B_SetNpcVisual(self, MALE, "Hum_Head_Bald", Face_L_Tough_Santino, BodyTex_L, ITAR_BDT_M);
	Mdl_SetModelFatness(self, 1);
	Mdl_ApplyOverlayMDS(self, "Humans_Relaxed.mds");

	// -------- fight tactic --------
	fight_tactic = FAI_HUMAN_STRONG;

	// -------- talents --------
	B_GiveNpcTalents(self);

	// -------- fighting skills --------
	B_SetFightSkills(self, 60);

	// -------- inventory --------
	B_CreateAmbientInv(self);

	// -------- equipped weapons --------
	EquipItem(self, ItMw_1h_Sld_Axe);

	// -------- daily routine --------
	daily_routine = Rtn_Start_10012;
};

func void Rtn_Start_10012()
{
	TA_Sit_Bench(22, 02, 06, 00, "ADW_SWAMP_SIT_BENCH_01");
	TA_Smalltalk(06, 00, 22, 02, "BL_FIGHT_03");
};
