instance BDT_10301_Addon_RangerBandit_M(Npc_Default)
{
	// -------- NPC --------
	name							= NAME_BANDIT;
	npctype							= NPCTYPE_AMBIENT;
	guild							= GIL_BDT;
	flags							= 0; // NPC_FLAG_IMMORTAL oder 0

	voice							= 1;
	id								= 10301;

	// -------- attributes --------
	B_SetAttributesToChapter(self, 1); // setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)

	// -------- visuals --------
	B_SetNpcVisual(self, MALE, "Hum_Head_FatBald", Face_N_Normal03, BodyTex_N, ITAR_BDT_M);
	Mdl_SetModelFatness(self, 1);
	Mdl_ApplyOverlayMDS(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// -------- fight tactic --------
	fight_tactic = FAI_HUMAN_NORMAL; // MASTER / STRONG / COWARD

	// -------- talents --------
	B_GiveNpcTalents(self);

	// -------- fighting skills --------
	B_SetFightSkills(self, 40); // Grenzen für Talent-Level liegen bei 30 und 60

	// -------- inventory --------
	B_CreateAmbientInv(self);
	CreateInvItems(self, ItWr_StonePlateCommon_Addon, 2); // Joly: will Erol wieder haben!

	// -------- equipped weapons --------
	EquipItem(self, ItMw_1h_Bau_Mace);
	EquipItem(self, ItRw_SLD_Bow);

	// -------- daily routine --------
	daily_routine = Rtn_Start_10301;
};

func void Rtn_Start_10301()
{
	TA_Stand_ArmsCrossed(08, 00, 23, 00, "NW_FARM2_TO_TAVERN_06");
	TA_Stand_ArmsCrossed(23, 00, 08, 00, "NW_FARM2_TO_TAVERN_06");
};
