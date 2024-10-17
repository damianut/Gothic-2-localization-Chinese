// ---------------------------------------------------------------------
//	Info EXIT
// ---------------------------------------------------------------------
instance DIA_Addon_Pardos_EXIT(C_INFO)
{
	npc				= STRF_1122_Addon_Pardos;
	nr				= 999;
	condition		= DIA_Addon_Pardos_EXIT_Condition;
	information		= DIA_Addon_Pardos_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Pardos_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Pardos_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ---------------------------------------------------------------------
//	Info Hi
// ---------------------------------------------------------------------
instance DIA_Addon_Pardos_Hi(C_INFO)
{
	npc				= STRF_1122_Addon_Pardos;
	nr				= 2;
	condition		= DIA_Addon_Pardos_Hi_Condition;
	information		= DIA_Addon_Pardos_Hi_Info;
	description		= "你 们 还 在 等 什 么 ？";
};

func int DIA_Addon_Pardos_Hi_Condition()
{
	if (Sklaven_Flucht == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Pardos_Hi_Info()
{
	AI_Output(self, other, "DIA_Addon_Pardos_Hi_03_00"); //你 们 还 在 等 什 么 ？
	AI_Output(self, other, "DIA_Addon_Pardos_Hi_03_01"); //（ 疲 倦 的 ） 我 很 累 … … 完 全 精 疲 力 竭 。 现 在 的 天 空 是 阳 光 普 照 吗 ， 还 是 无 数 星 星 不 断 旋 转 的 明 朗 夜 空 ？
	AI_Output(self, other, "DIA_Addon_Pardos_Hi_03_02"); //（ 更 加 疲 倦 的 ） 我 不 知 道 - 温 柔 的 太 阳 雨 … … 凉 爽 的 夜 风 … … 我 都 无 法 再 感 受 它 们 了 … …
	AI_Output(self, other, "DIA_Addon_Pardos_Hi_03_03"); //（ 顺 从 的 ） 这 里 要 先 用 眼 睛 … …
};

// ---------------------------------------------------------------------
//	Info save
// ---------------------------------------------------------------------
instance DIA_Addon_Pardos_save(C_INFO)
{
	npc				= STRF_1122_Addon_Pardos;
	nr				= 2;
	condition		= DIA_Addon_Pardos_save_Condition;
	information		= DIA_Addon_Pardos_save_Info;
	description		= "坚 持 住 。 你 们 的 救 兵 就 要 到 了 。";
};

func int DIA_Addon_Pardos_save_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Pardos_Hi)
	&& (Sklaven_Flucht == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Pardos_save_Info()
{
	AI_Output(other, self, "DIA_Addon_Pardos_save_15_00"); //坚 持 住 。 你 们 的 救 兵 就 要 到 了 。
	AI_Output(self, other, "DIA_Addon_Pardos_save_03_01"); //（ 疲 倦 的 ） 谢 谢 。 多 谢 你 的 话 。
	// Falsche Stimm Nummer M.F.// AI_Output(self, other, "DIA_Addon_Pardos_save_03_02");// Hey, du wirst doch jetzt nicht schlappmachen, oder? Gib jetzt nicht auf - klar?!
};

// ---------------------------------------------------------------------
var int Pardos_Geheilt;
// ---------------------------------------------------------------------
//	Info trank
// ---------------------------------------------------------------------
instance DIA_Addon_Pardos_trank(C_INFO)
{
	npc				= STRF_1122_Addon_Pardos;
	nr				= 2;
	condition		= DIA_Addon_Pardos_trank_Condition;
	information		= DIA_Addon_Pardos_trank_Info;
	description		= "给 ， 喝 了 这 个 。 （ 给 出 药 剂 ）";
};

func int DIA_Addon_Pardos_trank_Condition()
{
	if ((Pardos_Geheilt == FALSE)
	&& Npc_KnowsInfo(other, DIA_Addon_Pardos_save))
	{
		return TRUE;
	};
};

func void DIA_Addon_Pardos_trank_Info()
{
	AI_Output(other, self, "DIA_Addon_Pardos_trank_15_00"); //给 ， 喝 了 它 。
	AI_StandUpQuick(self);

	Info_ClearChoices(DIA_Addon_Pardos_trank);

	Info_AddChoice(DIA_Addon_Pardos_trank, DIALOG_BACK, DIA_Addon_Pardos_trank_BACK);

	if (Npc_HasItems(other, ItPo_Health_01))
	{
		Info_AddChoice(DIA_Addon_Pardos_trank, "（给 予 治 疗 精 华 ）", DIA_Addon_Pardos_trank_01);
	};

	if (Npc_HasItems(other, ItPo_Health_02))
	{
		Info_AddChoice(DIA_Addon_Pardos_trank, "（给 予 治 疗 萃 取 物 ）", DIA_Addon_Pardos_trank_02);
	};

	if (Npc_HasItems(other, ItPo_Health_03))
	{
		Info_AddChoice(DIA_Addon_Pardos_trank, "（ 给 予 治 疗 炼 金 药 ）", DIA_Addon_Pardos_trank_03);
	};

	if (Npc_HasItems(other, ItFo_Addon_Meatsoup))
	{
		Info_AddChoice(DIA_Addon_Pardos_trank, "送 给 １ 炖 肉", DIA_Addon_Pardos_trank_Soup);
	};
};

func void B_SayPardosThanks()
{
	AI_Output(self, other, "DIA_Addon_Pardos_trank_03_00"); //谢 谢 ， 那 让 我 感 觉 很 舒 服 。
};

func void DIA_Addon_Pardos_trank_BACK()
{
	Info_ClearChoices(DIA_Addon_Pardos_trank);
};

// ---------------------------------------------------------------------
func void DIA_Addon_Pardos_trank_01()
{
	if (B_GiveInvItems(other, self, ItPo_Health_01, 1))
	{
		B_UseItem(self, ItPo_Health_01);
	};

	Info_ClearChoices(DIA_Addon_Pardos_trank);
	Pardos_Geheilt = TRUE;
	B_SayPardosThanks();
	B_GivePlayerXP(XP_Ambient);
};

// ---------------------------------------------------------------------
func void DIA_Addon_Pardos_trank_02()
{
	if (B_GiveInvItems(other, self, ItPo_Health_02, 1))
	{
		B_UseItem(self, ItPo_Health_02);
	};

	Info_ClearChoices(DIA_Addon_Pardos_trank);
	Pardos_Geheilt = TRUE;
	B_SayPardosThanks();
	B_GivePlayerXP(XP_Ambient * 2);
};

// ---------------------------------------------------------------------
func void DIA_Addon_Pardos_trank_03()
{
	if (B_GiveInvItems(other, self, ItPo_Health_01, 3))
	{
		B_UseItem(self, ItPo_Health_03);
	};

	Info_ClearChoices(DIA_Addon_Pardos_trank);
	Pardos_Geheilt = TRUE;
	B_SayPardosThanks();
	B_GivePlayerXP(XP_Ambient * 3);
};

// ---------------------------------------------------------------------
func void DIA_Addon_Pardos_trank_Soup()
{
	AI_Output(other, self, "DIA_Addon_Pardos_trank_soup_15_00"); //给 ， 吃 一 些 炖 肉 。

	if (B_GiveInvItems(other, self, ItFo_Addon_Meatsoup, 1))
	{
		B_UseItem(self, ItFo_Addon_Meatsoup);
	};

	AI_Output(self, other, "DIA_Addon_Pardos_trank_03_01"); //谢 谢 你 ， 我 现 在 觉 得 有 点 力 气 了 。
	B_GivePlayerXP(XP_Ambient * 3);
};

// ---------------------------------------------------------------------
//	Info perm
// ---------------------------------------------------------------------
instance DIA_Addon_Pardos_perm(C_INFO)
{
	npc				= STRF_1122_Addon_Pardos;
	nr				= 99;
	condition		= DIA_Addon_Pardos_perm_Condition;
	information		= DIA_Addon_Pardos_perm_Info;
	permanent		= TRUE;
	description		= "你 现 在 怎 么 样 ？";
};

func int DIA_Addon_Pardos_perm_Condition()
{
	if (Pardos_Geheilt == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Pardos_perm_Info()
{
	AI_Output(other, self, "DIA_Addon_Pardos_perm_15_00"); //你 现 在 怎 么 样 ？
	AI_Output(self, other, "DIA_Addon_Pardos_perm_03_01"); //更 好 了 ， 谢 谢 你 。 我 能 感 到 我 的 力 气 正 在 恢 复 。
};
