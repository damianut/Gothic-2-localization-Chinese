instance BAU_951_Hilda(Npc_Default)
{
	// -------- NPC --------
	name							= "希尔达";
	npctype							= NpcType_Main;
	guild							= GIL_OUT;
	flags							= 0; // NPC_FLAG_IMMORTAL oder 0

	voice							= 17;
	id								= 951;

	// -------- attributes --------
	B_SetAttributesToChapter(self, 1); // setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)

	// -------- visuals --------
	B_SetNpcVisual(self, FEMALE, "Hum_Head_Babe8", FaceBabe_N_WhiteCloth, BodyTexBabe_N, ITAR_BauBabe_L);
	Mdl_SetModelFatness(self, 0);
	Mdl_ApplyOverlayMDS(self, "Humans_Babe.mds");

	// -------- fight tactic --------
	fight_tactic = FAI_HUMAN_COWARD; // MASTER / STRONG / COWARD

	// -------- talents --------
	B_GiveNpcTalents(self);

	// -------- fighting skills --------
	B_SetFightSkills(self, 10); // Grenzen für Talent-Level liegen bei 30 und 60

	// -------- inventory --------
	B_CreateAmbientInv(self);

	// -------- equipped weapons --------
	EquipItem(self, ItMw_1h_Bau_Mace);

	// -------- daily routine --------
	daily_routine = Rtn_Start_951;
};

func void Rtn_Start_951()
{
	TA_Cook_Stove(08, 00, 22, 00, "NW_FARM1_INHOUSE_02");
	TA_Sleep(22, 00, 08, 00, "NW_FARM1_INHOUSE_BED_02");
};

func void Rtn_Krank_951()
{
	TA_Sleep(08, 00, 22, 00, "NW_FARM1_INHOUSE_BED_02");
	TA_Sleep(22, 00, 08, 00, "NW_FARM1_INHOUSE_BED_02");
};
