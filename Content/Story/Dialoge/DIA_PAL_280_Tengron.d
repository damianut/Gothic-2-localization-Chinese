///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Tengron_EXIT(C_INFO)
{
	npc				= Pal_280_Tengron;
	nr				= 999;
	condition		= DIA_Tengron_EXIT_Condition;
	information		= DIA_Tengron_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Tengron_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Tengron_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info First
///////////////////////////////////////////////////////////////////////
instance DIA_Tengron_First(C_INFO)
{
	npc				= Pal_280_Tengron;
	nr				= 2;
	condition		= DIA_Tengron_First_Condition;
	information		= DIA_Tengron_First_Info;
	important		= TRUE;
};

func int DIA_Tengron_First_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (MIS_ScoutMine != LOG_RUNNING)
	&& (MIS_ScoutMine != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Tengron_First_Info()
{
	AI_Output(self, other, "DIA_Tengron_First_07_00"); //你 在 这 里 做 什 么 ？
	AI_Output(other, self, "DIA_Tengron_First_15_01"); //我 正 在 为 执 行 哈 根 勋 爵 的 命 令 而 奔 走 。
	AI_Output(self, other, "DIA_Tengron_First_07_02"); //你 必 须 设 法 到 达 城 堡 去 跟 指 挥 官 加 隆 德 谈 谈 。
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Tengron_HALLO(C_INFO)
{
	npc				= Pal_280_Tengron;
	nr				= 2;
	condition		= DIA_Tengron_HALLO_Condition;
	information		= DIA_Tengron_HALLO_Info;
	important		= TRUE;
};

func int DIA_Tengron_HALLO_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (MIS_ScoutMine == LOG_RUNNING)
	|| (MIS_ScoutMine == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Tengron_HALLO_Info()
{
	AI_Output(self, other, "DIA_Tengron_HALLO_07_00"); //愿 英 诺 斯 与 你 同 在 ！ 你 从 城 堡 那 里 带 回 消 息 了 吗 ？ 增 援 马 上 就 要 抵 达 了 吗 ？

	if (Npc_IsDead(Fajeth) == FALSE)
	{
		AI_Output(other, self, "DIA_Tengron_HALLO_15_01"); //我 不 是 带 来 消 息 的 ， 而 是 要 带 走 消 息 。
		AI_Output(self, other, "DIA_Tengron_HALLO_07_02"); //那 你 去 跟 法 捷 斯 说 吧 。 他 在 这 里 的 司 令 部 里 。 但 如 果 你 有 来 自 城 堡 的 消 息 ， 就 要 告 诉 我 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info News
///////////////////////////////////////////////////////////////////////
instance DIA_Tengron_News(C_INFO)
{
	npc				= Pal_280_Tengron;
	nr				= 7;
	condition		= DIA_Tengron_News_Condition;
	information		= DIA_Tengron_News_Info;
	description		= "关 于 新 消 息 … …";
};

func int DIA_Tengron_News_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Tengron_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Tengron_News_Info()
{
	AI_Output(other, self, "DIA_Tengron_News_15_00"); //关 于 新 消 息 … …
	AI_Output(self, other, "DIA_Tengron_News_07_01"); //好 的 - 城 堡 里 的 情 况 怎 么 样 了 ？
	AI_Output(other, self, "DIA_Tengron_News_15_02"); //还 是 被 兽 人 包 围 着 ， 而 且 仍 然 面 临 着 龙 的 袭 击 。
	AI_Output(self, other, "DIA_Tengron_News_07_03"); //该 死 ， 我 希 望 小 伙 子 们 还 能 坚 守 。
	AI_Output(self, other, "DIA_Tengron_News_07_04"); //听 着 ， 我 的 一 位 朋 友 在 这 座 城 堡 里 ， 他 叫 尤 达 。 我 们 认 识 很 长 时 间 了 ， 而 且 肩 并 肩 地 打 过 很 多 仗 。
	AI_Output(self, other, "DIA_Tengron_News_07_05"); //我 想 要 你 帮 我 把 这 个 戒 指 交 给 他 。 他 会 为 我 保 管 好 它 的 。 告 诉 他 ， 我 回 来 的 时 候 会 拿 回 它 。

	Info_ClearChoices(DIA_Tengron_News);

	Info_AddChoice(DIA_Tengron_News, "我 没 时 间 做 那 些", DIA_Tengron_News_No);
	Info_AddChoice(DIA_Tengron_News, "没 问 题 … …", DIA_Tengron_News_Yes);
};

func void DIA_Tengron_News_No()
{
	AI_Output(other, self, "DIA_Tengron_News_No_15_00"); //我 没 时 间 做 那 些 。
	AI_Output(self, other, "DIA_Tengron_News_No_07_01"); //我 明 白 了 。

	Info_ClearChoices(DIA_Tengron_News);
};

func void DIA_Tengron_News_Yes()
{
	AI_Output(other, self, "DIA_Tengron_News_Yes_15_00"); //没 问 题 。 我 一 到 达 城 堡 就 会 把 这 枚 戒 指 交 给 尤 达 。
	AI_Output(self, other, "DIA_Tengron_News_Yes_07_01"); //很 好 。 这 枚 戒 指 的 魔 力 将 给 予 尤 达 新 的 力 量 。 别 忘 了 告 诉 他 我 会 问 他 要 回 它 ！

	B_GiveInvItems(self, other, ItRi_Tengron, 1);
	Info_ClearChoices(DIA_Tengron_News);

	Log_CreateTopic(Topic_TengronRing, LOG_MISSION);
	Log_SetTopicStatus(Topic_TengronRing, LOG_RUNNING);
	B_LogEntry(Topic_TengronRing, Topic_TengronRing_1);
};

///////////////////////////////////////////////////////////////////////
//	Info Situation
///////////////////////////////////////////////////////////////////////
instance DIA_Tengron_Situation(C_INFO)
{
	npc				= Pal_280_Tengron;
	nr				= 70;
	condition		= DIA_Tengron_Situation_Condition;
	information		= DIA_Tengron_Situation_Info;
	permanent		= TRUE;
	description		= "你 这 里 的 情 况 怎 么 样 ？";
};

func int DIA_Tengron_Situation_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Tengron_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Tengron_Situation_Info()
{
	AI_Output(other, self, "DIA_Tengron_Situation_15_00"); //你 这 里 的 情 况 怎 么 样 ？
	AI_Output(self, other, "DIA_Tengron_Situation_07_01"); //我 们 被 怪 物 们 包 围 了 ， 而 且 到 目 前 为 止 几 乎 没 有 采 到 一 点 矿 石 。 再 说 我 们 已 经 损 失 了 一 大 批 人 员 。
	AI_Output(self, other, "DIA_Tengron_Situation_07_02"); //我 不 知 道 我 们 还 能 坚 守 多 久 ， 但 我 们 不 会 放 弃 ！
};

///////////////////////////////////////////////////////////////////////
//	Info NeedYourHelp
///////////////////////////////////////////////////////////////////////
instance DIA_Tengron_HELP(C_INFO)
{
	npc				= Pal_280_Tengron;
	nr				= 9;
	condition		= DIA_Tengron_HELP_Condition;
	information		= DIA_Tengron_HELP_Info;
	description		= "我 可 能 需 要 你 的 帮 助 … …";
};

func int DIA_Tengron_HELP_Condition()
{
	if ((MIS_Fajeth_Kill_Snapper == LOG_RUNNING)
	&& Npc_KnowsInfo(other, DIA_Tengron_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Tengron_HELP_Info()
{
	AI_Output(other, self, "DIA_Tengron_HELP_15_00"); //我 需 要 你 的 帮 助 。 法 捷 斯 想 要 我 去 捕 猎 蜥 蜴 ， 还 有 … …
	AI_Output(self, other, "DIA_Tengron_HELP_07_01"); //我 只 听 法 捷 斯 的 命 令 。 我 的 命 令 是 守 卫 矿 场 。 而 且 我 确 实 正 在 这 么 做 。
	AI_Output(self, other, "DIA_Tengron_HELP_07_02"); //也 许 其 它 人 能 帮 助 你 。
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Tengron_PICKPOCKET(C_INFO)
{
	npc				= Pal_280_Tengron;
	nr				= 900;
	condition		= DIA_Tengron_PICKPOCKET_Condition;
	information		= DIA_Tengron_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Tengron_PICKPOCKET_Condition()
{
	C_Beklauen(32, 50);
};

func void DIA_Tengron_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Tengron_PICKPOCKET);
	Info_AddChoice(DIA_Tengron_PICKPOCKET, DIALOG_BACK, DIA_Tengron_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Tengron_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Tengron_PICKPOCKET_DoIt);
};

func void DIA_Tengron_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Tengron_PICKPOCKET);
};

func void DIA_Tengron_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Tengron_PICKPOCKET);
};
