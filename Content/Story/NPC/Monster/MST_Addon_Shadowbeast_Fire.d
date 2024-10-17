////////////////////////////////////////////////////////////////////////////////
//
//	Shadowbeast_Addon_Fire
//

prototype Mst_Default_Shadowbeast_Addon_Fire(C_Npc)
{
	// -------- NPC --------
	name							= "火 魔 鬼";
	guild							= GIL_Gargoyle;
	level							= 30;

	// -------- attributes --------
	attribute[ATR_STRENGTH]			= 150;
	attribute[ATR_DEXTERITY]		= 150;
	attribute[ATR_HITPOINTS_MAX]	= 300;
	attribute[ATR_HITPOINTS]		= 300;
	attribute[ATR_MANA_MAX]			= 0;
	attribute[ATR_MANA]				= 0;

	// -------- protection --------
	protection[PROT_BLUNT]			= 150;
	protection[PROT_EDGE]			= 150;
	protection[PROT_POINT]			= 200;
	protection[PROT_FIRE]			= 150;
	protection[PROT_FLY]			= 150;
	protection[PROT_MAGIC]			= 75;

	// -------- damage --------
	damageType						= DAM_EDGE;
	//	damage[DAM_INDEX_BLUNT]		= 0;
	//	damage[DAM_INDEX_EDGE]		= 0;
	//	damage[DAM_INDEX_POINT]		= 0;
	//	damage[DAM_INDEX_FIRE]		= 0;
	//	damage[DAM_INDEX_FLY]		= 0;
	//	damage[DAM_INDEX_MAGIC]		= 0;

	// -------- visuals --------

	// -------- aivars --------
	aivar[AIV_MM_REAL_ID]			= ID_Gargoyle;
	aivar[AIV_MM_ThreatenBeforeAttack]= TRUE;
	aivar[AIV_MM_FollowTime]		= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater]		= FALSE;
	aivar[AIV_MM_SleepStart]		= 6;
	aivar[AIV_MM_SleepEnd]			= 20;
	aivar[AIV_MM_RoamStart]			= 20;
	aivar[AIV_MM_RoamEnd]			= 6;

	// -------- fight tactic --------
	fight_tactic = FAI_GARGOYLE;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;

	// -------- talents --------

	// -------- fighting skills --------

	// -------- inventory --------

	// -------- daily routine --------
	start_aistate = ZS_MM_AllScheduler;
};

//***************
//	Visuals
//***************

func void B_SetVisuals_Shadowbeast_Fire()
{
	Mdl_SetVisual(self, "FireShadow.mds");
	//								Body-Mesh Body-Tex Skin-Color Head-MMS Head-Tex Teeth-Tex ARMOR
	Mdl_SetVisualBody(self,	"Shadowbeast_Skeleton_Body",DEFAULT,DEFAULT,"",					DEFAULT,	DEFAULT,	-1);
};

instance Shadowbeast_Addon_Fire(Mst_Default_Shadowbeast_Addon_Fire)
{
	// -------- NPC --------
	flags							= NPC_FLAG_GHOST;

	// -------- attributes --------

	// -------- visuals --------
	B_SetVisuals_Shadowbeast_Fire();

	Npc_SetToFistMode(self);

	// -------- talents --------

	// -------- fighting skills --------

	// -------- inventory --------

	// -------- effect --------
	effect = "SPELLFX_FIREARMOR";

	// -------- daily routine --------
};

instance Shadowbeast_Addon_Fire_CanyonLib(Mst_Default_Shadowbeast_Addon_Fire)
{
	// -------- NPC --------
	flags							= NPC_FLAG_GHOST;

	// -------- attributes --------

	// -------- visuals --------
	B_SetVisuals_Shadowbeast_Fire();

	// -------- aivars --------
	aivar[AIV_EnemyOverride]		= TRUE;
	aivar[AIV_MaxDistToWp]			= 900;
	aivar[AIV_OriginalFightTactic]	= FAI_GARGOYLE;

	Npc_SetToFistMode(self);

	// -------- talents --------

	// -------- fighting skills --------

	// -------- inventory --------

	// -------- effect --------
	effect = "SPELLFX_FIREARMOR";

	// -------- daily routine --------
};
