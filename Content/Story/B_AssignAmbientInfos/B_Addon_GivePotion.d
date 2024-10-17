// ******************
// B_Addon_GivePotion
// ******************

// ------------------------------------------------------
instance DIA_Addon_GivePotion(C_INFO)
{
	nr				= 777;
	condition		= DIA_Addon_GivePotion_Condition;
	information		= DIA_Addon_GivePotion_Info;
	permanent		= TRUE;
	description		= "（ 给 予 治 疗 药 剂 ）";
};

func int DIA_Addon_GivePotion_Condition()
{
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (self.flags != NPC_FLAG_IMMORTAL))
	{
		if ((Npc_HasItems(other, ItPo_Health_01) >= 1)
		|| (Npc_HasItems(other, ItPo_Health_02) >= 1)
		|| (Npc_HasItems(other, ItPo_Health_03) >= 1))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_GivePotion_Info()
{
	Info_ClearChoices(DIA_Addon_GivePotion);
	Info_AddChoice(DIA_Addon_GivePotion, DIALOG_BACK, DIA_Addon_GivePotion_BACK);
	if (Npc_HasItems(other, ItPo_Health_03) >= 1)
	{
		Info_AddChoice(DIA_Addon_GivePotion, "（ 给 予 治 疗 炼 金 药 ）", DIA_Addon_GivePotion_ItPo_Health_03);
	};

	if (Npc_HasItems(other, ItPo_Health_02) >= 1)
	{
		Info_AddChoice(DIA_Addon_GivePotion, "（ 给 予 治 疗 萃 取 物 ）", DIA_Addon_GivePotion_ItPo_Health_02);
	};

	if (Npc_HasItems(other, ItPo_Health_01) >= 1)
	{
		Info_AddChoice(DIA_Addon_GivePotion, "（ 给 予 治 疗 精 华 ）", DIA_Addon_GivePotion_ItPo_Health_01);
	};
};

// ------------------------------------------------------------
func void B_Addon_DrinkPotion()
{
	AI_Output(other, self, "DIA_Addon_Brandon_GivePotion_15_00"); //给 ， 拿 上 这 个 治 疗 药 剂 。

	if ((self.attribute[ATR_HITPOINTS]) < (self.attribute[ATR_HITPOINTS_MAX])) // geändert m.F.
	{
		if (Npc_HasItems(self, ItPo_Health_03) > 0)
		{
			B_UseItem(self, ItPo_Health_03);
		}
		else if (Npc_HasItems(self, ItPo_Health_02) > 0)
		{
			B_UseItem(self, ItPo_Health_02);
		}
		else if (Npc_HasItems(self, ItPo_Health_01) > 0)
		{
			B_UseItem(self, ItPo_Health_01);
		};
	};

	Info_ClearChoices(DIA_Addon_GivePotion);
};

// ------------------------------------------------------------
func void DIA_Addon_GivePotion_BACK()
{
	Info_ClearChoices(DIA_Addon_GivePotion);
};

// ------------------------------------------------------------
func void DIA_Addon_GivePotion_ItPo_Health_03()
{
	B_GiveInvItems(other, self, ItPo_Health_03, 1);
	B_Addon_DrinkPotion();
};

// ------------------------------------------------------------
func void DIA_Addon_GivePotion_ItPo_Health_02()
{
	B_GiveInvItems(other, self, ItPo_Health_02, 1);
	B_Addon_DrinkPotion();
};

// ------------------------------------------------------------
func void DIA_Addon_GivePotion_ItPo_Health_01()
{
	B_GiveInvItems(other, self, ItPo_Health_01, 1);
	B_Addon_DrinkPotion();
};

// ****************************************************************
// ----------------------------------------------------------------

func void B_Addon_GivePotion(var C_Npc slf)
{
	DIA_Addon_GivePotion.npc = Hlp_GetInstanceID(slf);
};
