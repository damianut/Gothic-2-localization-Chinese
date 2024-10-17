instance VLK_415_Meldor(Npc_Default)
{
	// -------- NPC --------
	name							= "麦尔多";
	npctype							= NpcType_Main;
	guild							= GIL_VLK;
	flags							= 0; // NPC_FLAG_IMMORTAL oder 0

	voice							= 7;
	id								= 415;

	// -------- attributes --------
	B_SetAttributesToChapter(self, 2); // setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)

	// -------- visuals --------
	B_SetNpcVisual(self, MALE, "Hum_Head_FatBald", Face_P_NormalBald, BodyTex_P, ITAR_Vlk_L);
	Mdl_SetModelFatness(self, 0.8);
	Mdl_ApplyOverlayMDS(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// -------- aivars --------
	aivar[AIV_ToughGuy]				= TRUE;

	// -------- fight tactic --------
	fight_tactic = FAI_HUMAN_NORMAL; // MASTER / STRONG / COWARD

	// -------- talents --------
	B_GiveNpcTalents(self);

	// -------- fighting skills --------
	B_SetFightSkills(self, 35); // Grenzen für Talent-Level liegen bei 30 und 60

	// -------- inventory --------
	B_CreateAmbientInv(self);

	// -------- equipped weapons --------
	EquipItem(self, ItMw_1h_Vlk_Dagger);
	// EquipItem(self, fehlt);

	// -------- daily routine --------
	daily_routine = Rtn_PreStart_415;
};

func void Rtn_PreStart_415()
{
	TA_Smoke_Joint(05, 05, 23, 55, "NW_CITY_HABOUR_POOR_AREA_PATH_20");
	TA_Sleep(23, 55, 05, 05, "NW_CITY_HABOUR_HUT_04_BED_02");
};

func void Rtn_Start_415()
{
	TA_Smoke_Joint(05, 05, 12, 35, "NW_CITY_HABOUR_POOR_AREA_PATH_20");
	TA_Smalltalk(12, 35, 16, 05, "NW_CITY_HABOUR_HUT_08");
	TA_Smoke_Joint(16, 05, 18, 05, "NW_CITY_HABOUR_POOR_AREA_PATH_20");
	TA_Stand_Eating(18, 05, 19, 55, "NW_CITY_PATH_HABOUR_03");
	TA_Smoke_Joint(19, 55, 23, 55, "NW_CITY_HABOUR_POOR_AREA_PATH_20");
	TA_Sleep(23, 55, 05, 05, "NW_CITY_HABOUR_HUT_04_BED_02");
};
