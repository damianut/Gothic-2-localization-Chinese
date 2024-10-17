// #####################################################################
// ##
// ##
// ## TALBIN_NW
// ##
// ##
// #####################################################################
///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_NW_EXIT(C_INFO)
{
	npc				= VLK_4132_Talbin_NW;
	nr				= 999;
	condition		= DIA_Talbin_EXIT_Condition;
	information		= DIA_Talbin_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Talbin_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Talbin_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info verschwinde
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_NW(C_INFO)
{
	npc				= VLK_4132_Talbin_NW;
	nr				= 15;
	condition		= DIA_Talbin_NW_Condition;
	information		= DIA_Talbin_NW_Info;
	description		= "关 卡 并 非 那 么 糟 糕 ， 是 吗 ？";
};

func int DIA_Talbin_NW_Condition()
{
	return TRUE;
};

func void DIA_Talbin_NW_Info()
{
	AI_Output(other, self, "DIA_Talbin_NW_15_00"); //关 卡 并 非 那 么 糟 糕 ， 是 吗 ？
	AI_Output(self, other, "DIA_Talbin_NW_07_01"); //谢 谢 你 救 了 我 。
	AI_Output(self, other, "DIA_Talbin_NW_07_02"); //给 。 我 在 关 卡 里 找 到 了 这 块 天 然 石 头 。 我 想 它 可 能 对 你 有 用 。

	if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Talbin_NW_07_03"); //我 认 为 它 是 一 块 咒 语 石 。
		CreateInvItems(self, ItMi_RuneBlank, 1);
		B_GiveInvItems(self, other, ItMi_RuneBlank, 1);
	}
	else
	{
		AI_Output(self, other, "DIA_Talbin_NW_07_04"); //我 认 为 它 是 一 块 矿 石 。
		CreateInvItems(self, ItMi_Nugget, 1);
		B_GiveInvItems(self, other, ItMi_Nugget, 1);
	};

	AI_Output(self, other, "DIA_Talbin_NW_07_05"); //愿 英 诺 斯 庇 佑 你 。

	AI_StopProcessInfos(self);

	Npc_ExchangeRoutine(self, "Farm");
	TOPIC_END_Talbin_Runs = TRUE;
	B_GivePlayerXP(XP_SavedTalbin);
};

///////////////////////////////////////////////////////////////////////
//	Info verschwinde
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_NW_PERM(C_INFO)
{
	npc				= VLK_4132_Talbin_NW;
	nr				= 15;
	condition		= DIA_Talbin_NW_PERM_Condition;
	information		= DIA_Talbin_NW_PERM_Info;
	permanent		= TRUE;
	description		= "一 切 都 好 吗 ？";
};

func int DIA_Talbin_NW_PERM_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Talbin_NW))
	{
		return TRUE;
	};
};

func void DIA_Talbin_NW_PERM_Info()
{
	AI_Output(other, self, "DIA_Talbin_NW_PERM_15_00"); //一 切 都 好 吗 ？
	AI_Output(self, other, "DIA_Talbin_NW_PERM_07_01"); //是 的 ， 谢 谢 你 。 马 上 走 吧 。 我 会 很 好 的 。
	AI_StopProcessInfos(self);
};
