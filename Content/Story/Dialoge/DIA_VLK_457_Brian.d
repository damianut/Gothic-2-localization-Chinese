// *****************************************************
// 							EXIT
// *****************************************************
instance DIA_Brian_EXIT(C_INFO)
{
	npc				= VLK_457_Brian;
	nr				= 999;
	condition		= DIA_Brian_EXIT_Condition;
	information		= DIA_Brian_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Brian_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Brian_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Brian_PICKPOCKET(C_INFO)
{
	npc				= VLK_457_Brian;
	nr				= 900;
	condition		= DIA_Brian_PICKPOCKET_Condition;
	information		= DIA_Brian_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Brian_PICKPOCKET_Condition()
{
	C_Beklauen(55, 100);
};

func void DIA_Brian_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Brian_PICKPOCKET);
	Info_AddChoice(DIA_Brian_PICKPOCKET, DIALOG_BACK, DIA_Brian_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Brian_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Brian_PICKPOCKET_DoIt);
};

func void DIA_Brian_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Brian_PICKPOCKET);
};

func void DIA_Brian_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Brian_PICKPOCKET);
};

// *****************************************************
// 							Hallo
// *****************************************************
instance DIA_Brian_HALLO(C_INFO)
{
	npc				= VLK_457_Brian;
	nr				= 1;
	condition		= DIA_Brian_HALLO_Condition;
	information		= DIA_Brian_HALLO_Info;
	important		= TRUE;
};

func int DIA_Brian_HALLO_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brian_HALLO_Info()
{
	AI_Output(self, other, "DIA_Brian_HALLO_04_00"); //刚 来 这 座 城 的 ， 是 吗 ？ 我 是 布 赖 恩 ！ 我 是 哈 莱 德 大 师 的 学 徒 。
};

// *****************************************************
// 					Wie ist Lehrling?
// *****************************************************
instance DIA_Brian_AboutLehrling(C_INFO)
{
	npc				= VLK_457_Brian;
	nr				= 1;
	condition		= DIA_Brian_AboutLehrling_Condition;
	information		= DIA_Brian_AboutLehrling_Info;
	description		= "成 为 铁 匠 的 学 徒 会 怎 么 样 ？";
};

func int DIA_Brian_AboutLehrling_Condition()
{
	if ((hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Brian_AboutLehrling_Info()
{
	AI_Output(other, self, "DIA_Brian_AboutLehrling_15_00"); //成 为 铁 匠 的 学 徒 会 怎 么 样 ？
	AI_Output(self, other, "DIA_Brian_AboutLehrling_04_01"); //你 为 什 么 要 问 ？ 你 想 要 成 为 我 的 接 班 人 吗 ？
	AI_Output(other, self, "DIA_Brian_AboutLehrling_15_02"); //也 许 。
	AI_Output(self, other, "DIA_Brian_AboutLehrling_04_03"); //为 什 么 不 呢 … … 我 已 经 快 完 成 我 的 学 徒 生 涯 了 ， 然 后 我 打 算 离 开 这 座 城 市 。
	AI_Output(self, other, "DIA_Brian_AboutLehrling_04_04"); //但 不 是 因 为 哈 莱 德 。 他 是 一 个 好 师 傅 - 我 从 他 那 学 到 了 很 多 东 西 。
};

// *****************************************************
// 					Warum Stadt verlassen?
// *****************************************************
instance DIA_Brian_WhyLeave(C_INFO)
{
	npc				= VLK_457_Brian;
	nr				= 1;
	condition		= DIA_Brian_WhyLeave_Condition;
	information		= DIA_Brian_WhyLeave_Info;
	description		= "为 什 么 你 想 要 离 开 这 座 城 ？";
};

func int DIA_Brian_WhyLeave_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Brian_AboutLehrling))
	{
		return TRUE;
	};
};

func void DIA_Brian_WhyLeave_Info()
{
	AI_Output(other, self, "DIA_Brian_WhyLeave_15_00"); //为 什 么 你 想 要 离 开 这 座 城 ？
	AI_Output(self, other, "DIA_Brian_WhyLeave_04_00"); //因 为 这 里 的 人 都 让 我 不 安 ！ 尤 其 是 其 它 那 些 大 师 。
	AI_Output(self, other, "DIA_Brian_WhyLeave_04_01"); //我 还 记 得 在 设 法 成 为 哈 莱 德 的 学 徒 时 ， 是 多 么 忙 乱 。
	AI_Output(self, other, "DIA_Brian_WhyLeave_04_02"); //的 确 ， 关 于 那 件 事 ， 那 些 家 伙 每 个 人 都 有 一 些 东 西 要 说 。
	AI_Output(self, other, "DIA_Brian_WhyLeave_04_03"); //我 想 要 自 己 决 定 我 能 跟 谁 或 者 不 跟 谁 做 学 徒 。
};

// *****************************************************
// 						Other Masters
// *****************************************************
instance DIA_Brian_OtherMasters(C_INFO)
{
	npc				= VLK_457_Brian;
	nr				= 1;
	condition		= DIA_Brian_OtherMasters_Condition;
	information		= DIA_Brian_OtherMasters_Info;
	description		= "其 它 的 大 师 是 谁 ？";
};

func int DIA_Brian_OtherMasters_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Brian_WhyLeave))
	&& (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Brian_OtherMasters_Info()
{
	AI_Output(other, self, "DIA_Brian_Add_15_00"); //其 它 的 大 师 是 谁 ？
	AI_Output(self, other, "DIA_Brian_Add_04_01"); //嗯 ， 他 们 是 木 匠 托 尔 本 、 制 弓 匠 伯 斯 波 、 炼 金 术 士 康 斯 坦 提 诺 、 还 有 麦 迪 欧 。
	AI_Output(self, other, "DIA_Brian_Add_04_02"); //他 出 售 盔 甲 ， 不 过 首 先 他 是 个 商 人 。
	AI_Output(self, other, "DIA_Brian_Add_04_03"); //所 有 大 师 们 在 街 道 上 都 有 自 己 的 房 子 。
	AI_Output(self, other, "DIA_Brian_Add_04_04"); //而 康 斯 坦 提 诺 的 商 店 在 地 下 通 道 里 面 。
};

// *****************************************************
// 					Über Meister Harad
// *****************************************************
instance DIA_Brian_AboutHarad(C_INFO)
{
	npc				= VLK_457_Brian;
	nr				= 2;
	condition		= DIA_Brian_AboutHarad_Condition;
	information		= DIA_Brian_AboutHarad_Info;
	description		= "告 诉 我 更 多 关 于 哈 莱 德 大 师 的 事 情 。";
};

func int DIA_Brian_AboutHarad_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Brian_AboutLehrling))
	{
		return TRUE;
	};
};

func void DIA_Brian_AboutHarad_Info()
{
	AI_Output(other, self, "DIA_Brian_AboutHarad_15_00"); //告 诉 我 更 多 关 于 哈 莱 德 大 师 的 事 情 。
	AI_Output(self, other, "DIA_Brian_AboutHarad_04_01"); //他 现 在 心 情 很 不 好 。
	AI_Output(self, other, "DIA_Brian_AboutHarad_04_02"); //几 天 前 ， 那 些 圣 骑 士 来 命 令 他 为 他 们 铸 造 一 些 剑 。
	AI_Output(self, other, "DIA_Brian_AboutHarad_04_03"); //他 们 甚 至 禁 止 他 向 任 何 其 它 人 出 售 他 的 剑 。
	AI_Output(self, other, "DIA_Brian_AboutHarad_04_04"); //现 在 他 没 日 没 夜 地 努 力 工 作 着 要 尽 快 完 成 那 个 任 务 。
};

// *****************************************************
// 					Waffen kaufen?
// *****************************************************
instance DIA_Brian_NEEDWEAPONS(C_INFO)
{
	npc				= VLK_457_Brian;
	nr				= 4;
	condition		= DIA_Brian_NEEDWEAPONS_Condition;
	information		= DIA_Brian_NEEDWEAPONS_Info;
	description		= "我 能 从 你 这 里 买 武 器 吗 ？";
};

func int DIA_Brian_NEEDWEAPONS_Condition()
{
	return TRUE;
};

func void DIA_Brian_NEEDWEAPONS_Info()
{
	AI_Output(other, self, "DIA_Brian_NEEDWEAPONS_15_00"); //我 能 从 你 这 里 买 武 器 吗 ？
	AI_Output(self, other, "DIA_Brian_NEEDWEAPONS_04_01"); //不 太 确 定 。 我 只 是 个 助 手 。
	AI_Output(self, other, "DIA_Brian_NEEDWEAPONS_04_02"); //这 个 铁 匠 铺 里 的 武 器 都 被 民 兵 收 走 了 ， 它 们 被 送 到 了 塔 里 ， 都 储 藏 在 那 里 。
	AI_Output(self, other, "DIA_Brian_NEEDWEAPONS_04_03"); //不 过 ， 如 果 有 什 么 铸 造 方 面 的 事 情 要 做 ， 也 许 我 可 以 帮 你 。
};

// *****************************************************
// 					Schmiede-Stuff kaufen
// *****************************************************

// ------------------------------------------------------
var int Brian_Trade_einmal;
instance DIA_Brian_WASKAUFEN(C_INFO)
{
	npc				= VLK_457_Brian;
	nr				= 4;
	condition		= DIA_Brian_WASKAUFEN_Condition;
	information		= DIA_Brian_WASKAUFEN_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "我 能 从 你 那 得 到 什 么 ？";
};

func int DIA_Brian_WASKAUFEN_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Brian_NEEDWEAPONS))
	{
		return TRUE;
	};
};

func void DIA_Brian_WASKAUFEN_Info()
{
	AI_Output(other, self, "DIA_Brian_WASKAUFEN_15_00"); //我 能 从 你 那 得 到 什 么 ？
	B_GiveTradeInv(self);

	if (Npc_IsDead(Harad))
	{
		AI_Output(self, other, "DIA_Brian_WASKAUFEN_04_01"); //如 果 我 还 有 2 块 钢 坯 ， 我 会 很 乐 意 给 你 。 恐 怕 只 能 是 那 样 了 。

		if (MIS_Jack_NewLighthouseOfficer == 0)
		{
			AI_Output(self, other, "DIA_Brian_WASKAUFEN_04_02"); //自 从 哈 莱 德 不 在 这 里 之 后 ， 那 些 民 兵 就 一 直 留 意 着 我 的 一 举 一 动 。
			AI_Output(self, other, "DIA_Brian_WASKAUFEN_04_03"); //我 没 有 继 续 经 营 这 家 铁 匠 铺 的 许 可 。 他 们 怕 我 会 卖 掉 所 有 的 东 西 然 后 逃 走 。
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Brian_WASKAUFEN_04_05"); //我 可 以 卖 给 你 一 些 钢 坯 。
	};

	if (Brian_Trade_Einmal == FALSE)
	{
		Log_CreateTopic(Topic_CityTrader, LOG_NOTE);
		B_LogEntry(Topic_CityTrader, Topic_CityTrader_13);
		Brian_Trade_Einmal = TRUE;
	};

	Npc_RemoveInvItems(self, ItMiSwordblade, Npc_HasItems(self, ItMiSwordblade));
};

// #####################################################################
// ##
// ##
// ## KAPITEL 3
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************
instance DIA_Brian_KAP3_EXIT(C_INFO)
{
	npc				= VLK_457_Brian;
	nr				= 999;
	condition		= DIA_Brian_KAP3_EXIT_Condition;
	information		= DIA_Brian_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Brian_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Brian_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//*********************************************************************
//	Kannst du auch Schmuckstücke reparieren?
//*********************************************************************
instance DIA_Brian_RepairNecklace(C_INFO)
{
	npc				= VLK_457_Brian;
	nr				= 8;
	condition		= DIA_Brian_RepairNecklace_Condition;
	information		= DIA_Brian_RepairNecklace_Info;
	description		= "你 能 修 理 珠 宝 吗 ？";
};

func int DIA_Brian_RepairNecklace_Condition()
{
	if (
	(MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS)
	&& (
	(Npc_HasItems(other, ItMi_InnosEye_Broken_MIS))
	|| (MIS_SCKnowsInnosEyeIsBroken == TRUE)
	)
	)
	{
		return TRUE;
	};
};

func void DIA_Brian_RepairNecklace_Info()
{
	AI_Output(other, self, "DIA_Brian_RepairNecklace_15_00"); //你 能 修 理 珠 宝 吗 ？
	AI_Output(self, other, "DIA_Brian_RepairNecklace_04_01"); //我 只 是 一 个 助 手 ， 就 算 只 让 我 造 一 把 匕 首 ， 我 都 会 非 常 高 兴 。

	if ((Npc_IsDead(Harad)) == FALSE)
	{
		AI_Output(self, other, "DIA_Brian_RepairNecklace_04_02"); //珠 宝 ？ 你 必 须 问 问 那 位 大 师 。
	};

	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};

// #####################################################################
// ##
// ##
// ## KAPITEL 4
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************
instance DIA_Brian_KAP4_EXIT(C_INFO)
{
	npc				= VLK_457_Brian;
	nr				= 999;
	condition		= DIA_Brian_KAP4_EXIT_Condition;
	information		= DIA_Brian_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Brian_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Brian_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 5
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************
instance DIA_Brian_KAP5_EXIT(C_INFO)
{
	npc				= VLK_457_Brian;
	nr				= 999;
	condition		= DIA_Brian_KAP5_EXIT_Condition;
	information		= DIA_Brian_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Brian_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Brian_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info NewLighthouseOfficer
///////////////////////////////////////////////////////////////////////
instance DIA_Brian_NEWLIGHTHOUSEOFFICER(C_INFO)
{
	npc				= VLK_457_Brian;
	nr				= 51;
	condition		= DIA_Brian_NEWLIGHTHOUSEOFFICER_Condition;
	information		= DIA_Brian_NEWLIGHTHOUSEOFFICER_Info;
	description		= "我 听 说 你 对 杰 克 的 旧 灯 塔 感 兴 趣 。";
};

func int DIA_Brian_NEWLIGHTHOUSEOFFICER_Condition()
{
	if ((Kapitel == 5)
	&& (MIS_Jack_NewLighthouseOfficer == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Brian_NEEDWEAPONS)))
	{
		return TRUE;
	};
};

func void DIA_Brian_NEWLIGHTHOUSEOFFICER_Info()
{
	AI_Output(other, self, "DIA_Brian_NEWLIGHTHOUSEOFFICER_15_00"); //我 听 说 你 对 杰 克 的 旧 灯 塔 感 兴 趣 。
	AI_Output(other, self, "DIA_Brian_NEWLIGHTHOUSEOFFICER_15_01"); //杰 克 正 在 考 虑 回 到 海 上 。 但 是 他 的 灯 塔 那 时 会 没 人 看 守 。
	AI_Output(self, other, "DIA_Brian_NEWLIGHTHOUSEOFFICER_04_02"); //但 是 ， 杰 克 一 定 要 清 楚 ， 当 他 不 在 的 时 候 ， 我 会 他 的 灯 塔 外 面 弄 个 铁 匠 铺 。
	AI_Output(other, self, "DIA_Brian_NEWLIGHTHOUSEOFFICER_15_03"); //那 会 是 个 问 题 吗 ？
	AI_Output(self, other, "DIA_Brian_NEWLIGHTHOUSEOFFICER_04_04"); //（ 大 笑 ） 对 我 不 是 。 总 之 ， 我 不 会 得 到 哈 莱 德 的 铁 匠 铺 。 我 把 那 个 想 法 从 脑 子 里 抛 开 了 。
	AI_Output(self, other, "DIA_Brian_NEWLIGHTHOUSEOFFICER_04_05"); //同 意 。 我 们 到 杰 克 那 里 见 面 。
	MIS_Jack_NewLighthouseOfficer = LOG_SUCCESS;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Lighthouse");
};

///////////////////////////////////////////////////////////////////////
//	Info LighthouseFree
///////////////////////////////////////////////////////////////////////
instance DIA_Brian_LIGHTHOUSEFREE(C_INFO)
{
	npc				= VLK_457_Brian;
	nr				= 8;
	condition		= DIA_Brian_LIGHTHOUSEFREE_Condition;
	information		= DIA_Brian_LIGHTHOUSEFREE_Info;
	permanent		= TRUE;
	description		= "那 么 你 想 说 什 么 ？";
};

func int DIA_Brian_LIGHTHOUSEFREE_Condition()
{
	if ((MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS)
	&& (Npc_GetDistToWP(self, "NW_LIGHTHOUSE_IN_01") < 1000)
	&& (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Brian_LIGHTHOUSEFREE_Info()
{
	AI_Output(other, self, "DIA_Brian_LIGHTHOUSEFREE_15_00"); //那 么 ， 你 认 为 怎 么 样 ？
	AI_Output(self, other, "DIA_Brian_LIGHTHOUSEFREE_04_01"); //天 啊 ， 乱 成 一 团 。 当 我 弄 好 后 ， 杰 克 肯 定 认 不 出 这 个 地 方 了 。
};
