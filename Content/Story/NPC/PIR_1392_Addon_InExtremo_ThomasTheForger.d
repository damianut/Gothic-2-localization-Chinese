/////////////////////////////////////////
// Thomas, the Forger ///////////////////
/////////////////////////////////////////
instance PIR_1392_Addon_InExtremo_ThomasTheForger(Npc_Default)
{
	// -------- NPC --------
	name							= "铁匠托马斯";
	npctype							= NpcType_Main;
	guild							= GIL_NONE;
	level							= 4;
	flags							= 0;
	flags							= NPC_FLAG_IMMORTAL;

	voice							= 8;
	id								= 1392;

	// -------- attributes --------
	attribute[ATR_STRENGTH]			= 20;
	attribute[ATR_DEXTERITY]		= 10;
	attribute[ATR_MANA_MAX]			= 0;
	attribute[ATR_MANA]				= 0;
	attribute[ATR_HITPOINTS_MAX]	= 88;
	attribute[ATR_HITPOINTS]		= 88;

	// -------- visuals --------
	Mdl_SetVisual(self, "HUMANS.MDS");
	Mdl_SetVisualBody(self,	"HUM_IE_THOMAS_INSTRUMENT",DEFAULT,DEFAULT,	"HUM_HEAD_THOMAS",	DEFAULT,	DEFAULT,	-1);

	// -------- fight tactic --------
	fight_tactic = FAI_HUMAN_STRONG;

	// -------- talents --------

	// -------- fighting skills --------
	Npc_SetTalentSkill(self, NPC_TALENT_1H, 1);

	// -------- inventory --------
	CreateInvItem(self, ItMi_IECello);
//	CreateInvItem(self, ItMiCellobow);

	// -------- daily routine --------
	daily_routine = Rtn_Start_1392;
};

func void Rtn_Start_1392()
{
	TA_Stand_Eating(05, 00, 20, 00, "WP_COOK_PAN");
	TA_Stand_Eating(20, 00, 05, 00, "WP_COOK_PAN");
};

func void Rtn_Concert_1392()
{
	TA_Concert(05, 00, 20, 00, "WP_COOK_PAN");
	TA_Concert(20, 00, 05, 00, "WP_COOK_PAN");
};
