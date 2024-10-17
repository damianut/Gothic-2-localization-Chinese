/******************************************************************************************/
//	Trank der Geistesveränderung (unwissend zusammengebraut) //
/******************************************************************************************/
instance ItPo_Addon_Geist_01(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_ITEMGLIMMER";

	visual						= "ItPo_Perm_STR.3ds";
	material					= MAT_GLAS;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseItPo_Geist_01;

	value						= 300;

	description					= "精 神 改 造 药 剂";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "在 使 用 前 要 做 好 预 防 ！";count[2] = 0;
	text[3]						= "能 够 强 烈 地 影 响 智 力 ";		count[3] = 0;
	text[4]						= "或 者 杀 死 使 用 者";					count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_ManaEssenz;
};

func void UseItPo_Geist_01()
{
	self.attribute[ATR_HITPOINTS] = (self.attribute[ATR_HITPOINTS] - 1000);
};

/******************************************************************************************/
//	Trank der Geistesveränderung (wissend zusammengebraut) //
/******************************************************************************************/
instance ItPo_Addon_Geist_02(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_ITEMGLIMMER";

	visual						= "ItPo_Perm_STR.3ds";
	material					= MAT_GLAS;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseItPo_Geist_02;

	value						= 300;

	description					= "精 神 改 造 药 剂";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "在 使 用 前 要 做 好 预 防 ！";count[2] = 0;
	text[3]						= "能 够 强 烈 地 影 响 智 力 ";		count[3] = 0;
	text[4]						= "或 者 杀 死 使 用 者";					count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_ManaEssenz;
};

func void UseItPo_Geist_02()
{
	if (Npc_IsPlayer(self))
	{
		B_GivePlayerXP(XP_Ambient * 5);
	};
};

/******************************************************************************************/
instance ItPo_Health_Addon_04(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_HEALTHPOTION";

	visual						= "ItPo_Health_03.3ds";
	material					= MAT_GLAS;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseItPo_Health_04;

	value						= Value_HpTrunk;

	description					= "纯 净 的 生 命 能 量";
	// text[1]					= NAME_Bonus_HP;

	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "完 全 再 生";					count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_HpTrunk;
};

func void UseItPo_Health_04()
{
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
};

/******************************************************************************************/
instance ItPo_Mana_Addon_04(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_MANAPOTION";

	visual						= "ItPo_Mana_03.3ds";
	material					= MAT_GLAS;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseItPo_Mana_04;

	value						= Value_ManaTrunk;

	description					= "纯 魔 法 值";
	// text[1]					= NAME_Bonus_Mana;

	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "魔 力 完 全 再 生";			count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_ManaTrunk;
};

func void UseItPo_Mana_04()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
};
