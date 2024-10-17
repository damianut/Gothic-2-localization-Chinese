instance BDT_1024_MalethsBandit(Npc_Default)
{
	// -------- NPC --------
	name							= "流氓首领";
	npctype							= NPCTYPE_AMBIENT;
	guild							= GIL_BDT;
	flags							= 0; // NPC_FLAG_IMMORTAL oder 0

	voice							= 13;
	id								= 1024;

	// -------- attributes --------
	B_SetAttributesToChapter(self, 5); // setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)

	// -------- visuals --------
	B_SetNpcVisual(self, MALE, "Hum_Head_FatBald", Face_P_ToughBald_Nek, BodyTex_P, ITAR_BDT_H);
	Mdl_SetModelFatness(self, 2);
	Mdl_ApplyOverlayMDS(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// -------- fight tactic --------
	fight_tactic = FAI_HUMAN_STRONG; // MASTER / STRONG / COWARD

	// -------- talents --------
	B_GiveNpcTalents(self);

	// -------- fighting skills --------
	B_SetFightSkills(self, 50); // Grenzen für Talent-Level liegen bei 30 und 60

	// -------- inventory --------
	B_CreateAmbientInv(self);

	// -------- equipped weapons --------
	EquipItem(self, ItMw_1h_Sld_Axe);
	EquipItem(self, ItRw_Mil_Crossbow);

	// -------- daily routine --------
	start_aistate = ZS_Bandit;
};
