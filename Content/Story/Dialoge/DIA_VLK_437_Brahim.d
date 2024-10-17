///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
var int Brahim_ShowedMaps;
func void B_BrahimNewMaps()
{
	if (Brahim_ShowedMaps == TRUE)
	{
		AI_Output(self, other, "B_BrahimNewMaps_07_00"); //以 后 再 来 。 我 肯 定 那 时 我 会 有 一 些 新 消 息 告 诉 你 。
	};
};
instance DIA_Brahim_EXIT(C_INFO)
{
	npc				= VLK_437_Brahim;
	nr				= 999;
	condition		= DIA_Brahim_EXIT_Condition;
	information		= DIA_Brahim_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Brahim_EXIT_Condition()
{
	if (Kapitel <= 2)
	{
		return TRUE;
	};
};

func void DIA_Brahim_EXIT_Info()
{
	B_BrahimNewMaps();
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Brahim_PICKPOCKET(C_INFO)
{
	npc				= VLK_437_Brahim;
	nr				= 900;
	condition		= DIA_Brahim_PICKPOCKET_Condition;
	information		= DIA_Brahim_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Brahim_PICKPOCKET_Condition()
{
	C_Beklauen(15, 15);
};

func void DIA_Brahim_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Brahim_PICKPOCKET);
	Info_AddChoice(DIA_Brahim_PICKPOCKET, DIALOG_BACK, DIA_Brahim_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Brahim_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Brahim_PICKPOCKET_DoIt);
};

func void DIA_Brahim_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Brahim_PICKPOCKET);
};

func void DIA_Brahim_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Brahim_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Brahim_GREET(C_INFO)
{
	npc				= VLK_437_Brahim;
	nr				= 2;
	condition		= DIA_Brahim_GREET_Condition;
	information		= DIA_Brahim_GREET_Info;
	description		= "你 在 这 里 做 什 么 ？ ";
};

func int DIA_Brahim_GREET_Condition()
{
	return TRUE;
};

func void DIA_Brahim_GREET_Info()
{
	AI_Output(other, self, "DIA_Brahim_GREET_15_00"); //你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Brahim_GREET_07_01"); //我 叫 布 拉 希 姆 。 我 绘 制 地 图 ， 然 后 出 售 它 们 。
	AI_Output(self, other, "DIA_Brahim_GREET_07_02"); //既 然 你 刚 到 这 里 ， 也 许 你 需 要 一 张 这 个 城 市 的 地 图 。
	AI_Output(self, other, "DIA_Brahim_GREET_07_03"); //它 非 常 便 宜 - 而 且 在 你 熟 悉 周 围 的 路 之 前 非 常 有 用 。

	Log_CreateTopic(Topic_CityTrader, LOG_NOTE);
	B_LogEntry(Topic_CityTrader, Topic_CityTrader_6);
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Brahim_MissingPeople(C_INFO)
{
	npc				= VLK_437_Brahim;
	nr				= 5;
	condition		= DIA_Addon_Brahim_MissingPeople_Condition;
	information		= DIA_Addon_Brahim_MissingPeople_Info;
	description		= "镇 上 有 些 人 神 秘 失 踪 ， 是 真 的 吗 ？";
};

func int DIA_Addon_Brahim_MissingPeople_Condition()
{
	if ((SC_HearedAboutMissingPeople == TRUE)
	&& (ENTERED_ADDONWORLD == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brahim_MissingPeople_Info()
{
	AI_Output(other, self, "DIA_Addon_Brahim_MissingPeople_15_00"); //镇 上 有 些 人 神 秘 失 踪 ， 是 真 的 吗 ？
	AI_Output(self, other, "DIA_Addon_Brahim_MissingPeople_07_01"); //我 听 说 是 这 样 。 但 我 不 敢 确 定 这 是 不 是 真 的 。
	AI_Output(self, other, "DIA_Addon_Brahim_MissingPeople_07_02"); //看 看 你 周 围 。 这 个 老 鼠 洞 像 是 那 个 你 想 度 过 你 的 黄 金 岁 月 的 地 方 吗 ？
	AI_Output(self, other, "DIA_Addon_Brahim_MissingPeople_07_03"); //人 们 都 在 想 办 法 离 开 这 里 ， 这 不 足 为 奇 。
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
/*
instance DIA_Brahim_Perm(C_INFO)
{
	npc				= VLK_437_Brahim;
	nr				= 99;
	condition		= DIA_Brahim_Perm_Condition;
	information		= DIA_Brahim_Perm_Info;
	permanent		= TRUE;
	description		= "";
};

func int DIA_Brahim_Perm_Condition()
{
	{
		return TRUE;
	};
};

func void DIA_Brahim_Perm_Info()
{
	AI_Output(other, self, "DIA_Brahim_Perm_15_00"); //
	AI_Output(self, other, "DIA_Brahim_Perm_07_01"); //
};

*/
///////////////////////////////////////////////////////////////////////
//	Info BUY
///////////////////////////////////////////////////////////////////////
instance DIA_Brahim_BUY(C_INFO)
{
	npc				= VLK_437_Brahim;
	nr				= 9;
	condition		= DIA_Brahim_BUY_Condition;
	information		= DIA_Brahim_BUY_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "给 我 看 看 你 的 地 图";
};

func int DIA_Brahim_BUY_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Brahim_GREET))
	{
		return TRUE;
	};
};

func void DIA_Brahim_BUY_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other, self, "DIA_Brahim_BUY_15_00"); //给 我 看 看 你 的 地 图 。

	if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Brahim_BUY_07_01"); //就 算 在 你 的 修 道 院 里 也 找 不 到 更 好 的 。
	};

	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_Brahim_BUY_07_02"); //好 的 地 图 很 重 要 ， 尤 其 是 对 于 来 自 大 陆 的 人 ， 圣 骑 士 先 生 。
	};

	Brahim_ShowedMaps = TRUE;
};

// ######################################
// ##
// ## Kapitel 3
// ##
// ######################################

///////////////////////////////////////////////////////////////////////
//	Info Kap3_EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Brahim_Kap3_EXIT(C_INFO)
{
	npc				= VLK_437_Brahim;
	nr				= 999;
	condition		= DIA_Brahim_Kap3_EXIT_Condition;
	information		= DIA_Brahim_Kap3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Brahim_Kap3_EXIT_Condition() // siehe auch First Exit
{
	if ((Kapitel >= 3)
	&& ((Npc_KnowsInfo(other, DIA_Brahim_Kap3_First_EXIT))
	|| (Npc_HasItems(other, ItWr_ShatteredGolem_MIS) == 0)))
	{
		return TRUE;
	};
};

func void DIA_Brahim_Kap3_EXIT_Info()
{
	if (Kapitel <= 4)
	{
		B_BrahimNewMaps();
	};

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Kap3_First_EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Brahim_Kap3_First_EXIT(C_INFO)
{
	npc				= VLK_437_Brahim;
	nr				= 999;
	condition		= DIA_Brahim_Kap3_First_EXIT_Condition;
	information		= DIA_Brahim_Kap3_First_EXIT_Info;
	description		= DIALOG_ENDE;
};

func int DIA_Brahim_Kap3_First_EXIT_Condition()
{
	if ((Kapitel >= 3)
	&& (Npc_HasItems(other, ItWr_ShatteredGolem_MIS) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Brahim_Kap3_First_EXIT_Info()
{
	AI_Output(self, other, "DIA_Brahim_Kap3_First_EXIT_07_00"); //我 就 知 道 这 一 张 会 让 你 感 兴 趣 。
	AI_Output(other, self, "DIA_Brahim_Kap3_First_EXIT_15_01"); //就 是 哪 一 张 ？
	AI_Output(self, other, "DIA_Brahim_Kap3_First_EXIT_07_02"); //嗯 ， 你 刚 买 的 那 张 旧 地 图 。
	AI_Output(self, other, "DIA_Brahim_Kap3_First_EXIT_07_03"); //我 知 道 你 这 种 人 。 你 们 为 寻 找 发 财 的 机 会 而 奔 波 。
	Info_ClearChoices(DIA_Brahim_Kap3_First_EXIT);
	Info_AddChoice(DIA_Brahim_Kap3_First_EXIT, DIALOG_BACK, DIA_Brahim_Kap3_First_EXIT_BACK);
	Info_AddChoice(DIA_Brahim_Kap3_First_EXIT, "你 从 哪 里 得 到 这 张 地 图 的 ？", DIA_Brahim_Kap3_First_EXIT_WhereGetIt);
	Info_AddChoice(DIA_Brahim_Kap3_First_EXIT, "那 是 什 么 地 图 ？", DIA_Brahim_Kap3_First_EXIT_Content);
	Info_AddChoice(DIA_Brahim_Kap3_First_EXIT, "你 为 什 么 不 自 己 留 着 它 ？", DIA_Brahim_Kap3_First_EXIT_KeepIt);
};

func void DIA_Brahim_Kap3_First_EXIT_BACK()
{
	Info_ClearChoices(DIA_Brahim_Kap3_First_EXIT);
};

func void DIA_Brahim_Kap3_First_EXIT_WhereGetIt()
{
	AI_Output(other, self, "DIA_Brahim_Kap3_First_EXIT_WhereGetIt_15_00"); //你 在 哪 里 弄 到 这 张 地 图 的 ？
	AI_Output(self, other, "DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_01"); //哦 ， 我 在 一 堆 旧 地 图 里 面 找 到 的 ， 那 是 我 最 近 买 来 的 。
	AI_Output(self, other, "DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_02"); //那 个 卖 家 一 定 是 没 注 意 到 它 。
};

func void DIA_Brahim_Kap3_First_EXIT_Content()
{
	AI_Output(other, self, "DIA_Brahim_Kap3_First_EXIT_Content_15_00"); //这 是 什 么 类 型 的 地 图 ？
	AI_Output(self, other, "DIA_Brahim_Kap3_First_EXIT_Content_07_01"); //它 看 起 来 像 是 一 张 藏 宝 图 或 者 诸 如 此 类 的 东 西 。
	AI_Output(self, other, "DIA_Brahim_Kap3_First_EXIT_Content_07_02"); //但 是 ， 我 看 你 像 是 那 种 能 自 己 深 入 事 情 的 本 质 的 人 。
};

func void DIA_Brahim_Kap3_First_EXIT_KeepIt()
{
	AI_Output(other, self, "DIA_Brahim_Kap3_First_EXIT_KeepIt_15_00"); //你 为 什 么 不 自 己 留 着 它 ？
	AI_Output(self, other, "DIA_Brahim_Kap3_First_EXIT_KeepIt_07_01"); //我 是 一 个 老 人 ， 而 我 展 示 自 己 的 时 光 早 已 经 过 去 了 。
	AI_Output(self, other, "DIA_Brahim_Kap3_First_EXIT_KeepIt_07_02"); //我 把 机 会 留 给 更 年 青 的 人 。
};
