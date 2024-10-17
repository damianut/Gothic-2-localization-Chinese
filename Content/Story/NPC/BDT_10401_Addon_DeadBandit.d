instance BDT_10401_Addon_DeadBandit(Npc_Default)
{
	// -------- NPC --------
	name							= "强盗";
	npctype							= NPCTYPE_AMBIENT;
	guild							= GIL_BDT;
	level							= 20;
	flags							= 0;

	voice							= 4;
	id								= 10401;

	// -------- attributes --------
	attribute[ATR_STRENGTH]			= 70;
	attribute[ATR_DEXTERITY]		= 80;
	attribute[ATR_MANA_MAX]			= 100;
	attribute[ATR_MANA]				= 100;
	attribute[ATR_HITPOINTS_MAX]	= 300;
	attribute[ATR_HITPOINTS]		= 300;

	// -------- visuals --------
	B_SetNpcVisual(self, MALE, "Hum_Head_Bald", Face_P_NormalBart01, BodyTex_P, ITAR_Thorus_Addon);
	Mdl_SetModelFatness(self, 0);
	Mdl_ApplyOverlayMDS(self, "Humans_Militia.mds");

	// -------- fight tactic --------
	fight_tactic = FAI_HUMAN_STRONG;

	// -------- talents --------
	B_GiveNpcTalents(self);

	// -------- fighting skills --------
	B_SetFightSkills(self, 50);

	// -------- inventory --------
	CreateInvItems(self, ItMi_GoldChalice, 1);
	CreateInvItems(self, ItMi_SilverRing, 1);
	CreateInvItems(self, ItPo_Health_02, 2);
	CreateInvItems(self, ItPo_Mana_01, 5);

	// -------- equipped weapons --------
	EquipItem(self, ItMw_2h_Sld_Sword);

	// -------- daily routine --------
	daily_routine = Rtn_Start_10401;
};

func void Rtn_Start_10401()
{
	TA_Stand_WP(08, 00, 16, 00, "ADW_ADANOSTEMPEL_RHADEMES_DEADBDT_01");
	TA_Stand_WP(16, 00, 08, 00, "ADW_ADANOSTEMPEL_RHADEMES_DEADBDT_01");
};
