instance Pal_288_Ritter(Npc_Default)
{
	// -------- NPC --------
	name							= NAME_Ritter;
	npctype							= NPCTYPE_AMBIENT;
	guild							= GIL_PAL;
	flags							= 0;

	voice							= 4;
	id								= 288;

	// -------- attributes --------
	B_SetAttributesToChapter(self, 5);

	// -------- visuals --------
	B_SetNpcVisual(self, MALE, "Hum_Head_Fighter", Face_N_NormalBart02, BodyTex_N, ITAR_PAL_M);
	Mdl_SetModelFatness(self, 1);
	Mdl_ApplyOverlayMDS(self, "Humans_Militia.mds");

	// -------- fight tactic --------
	fight_tactic = FAI_HUMAN_MASTER;

	// -------- talents --------
	B_GiveNpcTalents(self);

	// -------- fighting skills --------
	B_SetFightSkills(self, 80);

	// -------- inventory --------
	B_CreateAmbientInv(self);

	// -------- equipped weapons --------
	EquipItem(self, ItMw_1H_Pal_Sword);

	// -------- daily routine --------
	daily_routine = Rtn_Start_288;
};

func void Rtn_Start_288()
{
	TA_Stand_Guarding(08, 00, 23, 00, "NW_CITY_WAY_TO_SHIP_02");
	TA_Stand_Guarding(23, 00, 08, 00, "NW_CITY_WAY_TO_SHIP_02");
};
