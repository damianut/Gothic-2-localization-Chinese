// ##################################################
// ##
// ## Kapitel 1
// ##
// ##################################################

// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Hodges_Kap1_EXIT(C_INFO)
{
	npc				= BAU_908_Hodges;
	nr				= 999;
	condition		= DIA_Hodges_Kap1_EXIT_Condition;
	information		= DIA_Hodges_Kap1_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Hodges_Kap1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				   Hallo
// ************************************************************
instance DIA_Hodges_HALLO(C_INFO)
{
	npc				= BAU_908_Hodges;
	nr				= 1;
	condition		= DIA_Hodges_HALLO_Condition;
	information		= DIA_Hodges_HALLO_Info;
	important		= TRUE;
};

func int DIA_Hodges_HALLO_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& ((Kapitel != 3)
	|| (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Hodges_HALLO_Info()
{
	AI_Output(other, self, "DIA_Hodges_HALLO_15_00"); //你 好 ， 我 是 新 来 的 。
	AI_Output(self, other, "DIA_Hodges_HALLO_03_01"); //别 误 会 了 我 ， 但 是 我 真 的 没 心 情 交 谈 - 我 全 完 了 。
	AI_Output(other, self, "DIA_Hodges_HALLO_15_02"); //你 非 常 的 忙 ， 嗯 ？
	AI_Output(self, other, "DIA_Hodges_HALLO_03_03"); //我 同 意 。 贝 尼 特 造 了 很 多 武 器 ， 我 几 乎 来 不 及 把 它 们 都 磨 亮 。
};

// ************************************************************
// 			  				 About Farm
// ************************************************************
instance DIA_Hodges_TellAboutFarm(C_INFO)
{
	npc				= BAU_908_Hodges;
	nr				= 2;
	condition		= DIA_Hodges_TellAboutFarm_Condition;
	information		= DIA_Hodges_TellAboutFarm_Info;
	description		= "关 于 农 场 你 能 告 诉 些 什 么 ？";
};

func int DIA_Hodges_TellAboutFarm_Condition()
{
	if ((Kapitel != 3)
	|| (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hodges_TellAboutFarm_Info()
{
	AI_Output(other, self, "DIA_Hodges_TellAboutFarm_15_00"); //关 于 农 场 你 能 告 诉 些 什 么 ？
	AI_Output(self, other, "DIA_Hodges_TellAboutFarm_03_01"); //这 是 欧 纳 尔 的 农 场。
	AI_Output(self, other, "DIA_Hodges_TellAboutFarm_03_02"); //那 座 大 建 筑 是 他 的 房 子 。 他 腾 出 了 一 侧 给 雇 佣 兵 住 。
	AI_Output(self, other, "DIA_Hodges_TellAboutFarm_03_03"); //从 那 时 起 ， 我 们 这 些 农 民 就 只 能 住 在 谷 仓 里 。
	AI_Output(self, other, "DIA_Hodges_TellAboutFarm_03_04"); //（ 匆 忙 的 ） 但 是 我 没 事 ， 能 够 有 人 保 护 我 们 的 农 场 ， 这 样 很 好 。

	if (Npc_GetDistToWP(self, "NW_BIGFARM_SMITH_SHARP") < 500)
	{
		AI_Output(self, other, "DIA_Hodges_TellAboutFarm_03_05"); //这 座 屋 子 是 厨 房 。
	}
	else
	{
		AI_Output(self, other, "DIA_Hodges_TellAboutFarm_03_06"); //厨 房 的 前 面 有 个 铁 匠 铺 。
	};

	AI_Output(self, other, "DIA_Hodges_TellAboutFarm_03_07"); //你 运 气 好 的 话 ， 特 赫 克 拉 能 给 你 一 些 东 西 吃 。
};

// ************************************************************
// 			  				   AboutSld
// ************************************************************
instance DIA_Hodges_AboutSld(C_INFO)
{
	npc				= BAU_908_Hodges;
	nr				= 2;
	condition		= DIA_Hodges_AboutSld_Condition;
	information		= DIA_Hodges_AboutSld_Info;
	description		= "那 么 关 于 雇 佣 兵 呢 ？";
};

func int DIA_Hodges_AboutSld_Condition()
{
	if ((hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG)
	&& ((Kapitel != 3)
	|| (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Hodges_AboutSld_Info()
{
	AI_Output(other, self, "DIA_Hodges_AboutSld_15_00"); //那 么 关 于 雇 佣 兵 呢 ？
	AI_Output(self, other, "DIA_Hodges_AboutSld_03_01"); //欧 纳 尔 雇 他 们 来 确 保 我 们 不 受 城 里 民 兵 的 骚 扰 。
	AI_Output(self, other, "DIA_Hodges_AboutSld_03_02"); //不 过 他 们 也 保 护 农 场 、 绵 羊 和 我 们 这 些 农 民。
	AI_Output(self, other, "DIA_Hodges_AboutSld_03_03"); //所 以 ， 最 好 不 要 偷 任 何 东 西 ， 或 者 在 别 人 的 箱 子 里 乱 翻 。
	AI_Output(self, other, "DIA_Hodges_AboutSld_03_04"); //他 们 随 时 都 在 等 待 揍 你 的 机 会 。
};

// ************************************************************
// 			  				   TRADE
// ************************************************************
instance DIA_Hodges_TRADE(C_INFO)
{
	npc				= BAU_908_Hodges;
	nr				= 2;
	condition		= DIA_Hodges_TRADE_Condition;
	information		= DIA_Hodges_TRADE_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "我 能 从 你 这 里 买 武 器 吗 ？";
};

func int DIA_Hodges_TRADE_Condition()
{
	return TRUE;
};

func void DIA_Hodges_TRADE_Info()
{
	AI_Output(other, self, "DIA_Hodges_TRADE_15_00"); //我 能 从 你 这 里 买 武 器 吗 ？
	AI_Output(self, other, "DIA_Hodges_TRADE_03_01"); //我 没 有 多 少 。 我 们 把 几 乎 所 有 的 剑 和 斧 都 搬 进 了 欧 纳 尔 的 房 子 。

	Npc_RemoveInvItems(self, ItMiSwordblade, Npc_HasItems(self, ItMiSwordblade));
};

// ##################################################
// ##
// ## Kapitel 2
// ##
// ##################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_Kap2_EXIT(C_INFO)
{
	npc				= BAU_908_Hodges;
	nr				= 999;
	condition		= DIA_Hodges_Kap2_EXIT_Condition;
	information		= DIA_Hodges_Kap2_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Hodges_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ##################################################
// ##
// ## Kapitel 3
// ##
// ##################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_Kap3_EXIT(C_INFO)
{
	npc				= BAU_908_Hodges;
	nr				= 999;
	condition		= DIA_Hodges_Kap3_EXIT_Condition;
	information		= DIA_Hodges_Kap3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Hodges_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Warum arbeitest du nicht?
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_DontWork(C_INFO)
{
	npc				= BAU_908_Hodges;
	nr				= 31;
	condition		= DIA_Hodges_DontWork_Condition;
	information		= DIA_Hodges_DontWork_Info;
	description		= "你 为 什 么 不 工 作 ？";
};

func int DIA_Hodges_DontWork_Condition()
{
	if ((Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hodges_DontWork_Info()
{
	AI_Output(other, self, "DIA_Hodges_DontWork_15_00"); //你 为 什 么 不 工 作 ？
	AI_Output(self, other, "DIA_Hodges_DontWork_03_01"); //你 已 经 听 说 了 吗 ？ 圣 骑 士 已 经 逮 捕 了 贝 尼 特 。

	MIS_RescueBennet = LOG_RUNNING;

	Log_CreateTopic(TOPIC_RESCUEBENNET, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET, LOG_RUNNING);
	B_LogEntry(TOPIC_RESCUEBENNET, TOPIC_RESCUEBENNET_2);
};

///////////////////////////////////////////////////////////////////////
//	Was ist passiert?
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_WhatHappened(C_INFO)
{
	npc				= BAU_908_Hodges;
	nr				= 31;
	condition		= DIA_Hodges_WhatHappened_Condition;
	information		= DIA_Hodges_WhatHappened_Info;
	description		= "你 知 道 发 生 了 什 么 事 吗 ？";
};

func int DIA_Hodges_WhatHappened_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Hodges_DontWork))
	&& (MIS_RescueBennet != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hodges_WhatHappened_Info()
{
	AI_Output(other, self, "DIA_Hodges_WhatHappened_15_00"); //你 知 道 发 生 了 什 么 事 吗 ？
	AI_Output(self, other, "DIA_Hodges_WhatHappened_03_01"); //嗯 ， 我 们 正 在 城 里 采 购 ， 突 然 我 们 听 到 一 声 尖 叫 。 有 人 大 喊 ： 他 们 在 那 里 ， 抓 住 他 们 ！
	AI_Output(self, other, "DIA_Hodges_WhatHappened_03_02"); //小 子 ， 我 被 吓 坏 了 ！ 我 拔 腿 就 跑 ， 就 像 有 个 魔 鬼 在 屁 股 后 面 追 我 一 样 。
	AI_Output(self, other, "DIA_Hodges_WhatHappened_03_03"); //贝 尼 特 紧 跟 着 我 。 我 不 知 道 发 生 了 什 么 事 ， 但 是 当 我 跑 出 城 市 的 时 候 ， 他 失 踪 了 。
	AI_Output(self, other, "DIA_Hodges_WhatHappened_03_04"); //我 一 定 是 在 城 里 把 他 落 下 了 。
};

///////////////////////////////////////////////////////////////////////
//	Weswegen wurde Bennet denn verhaftet?
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_BennetsCrime(C_INFO)
{
	npc				= BAU_908_Hodges;
	nr				= 32;
	condition		= DIA_Hodges_BennetsCrime_Condition;
	information		= DIA_Hodges_BennetsCrime_Info;
	description		= "那 么 为 什 么 贝 尼 特 会 被 逮 捕 ？";
};

func int DIA_Hodges_BennetsCrime_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Hodges_DontWork))
	&& (MIS_RescueBennet != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hodges_BennetsCrime_Info()
{
	AI_Output(other, self, "DIA_Hodges_BennetsCrime_15_00"); //那 么 为 什 么 贝 尼 特 会 被 逮 捕 ？
	AI_Output(self, other, "DIA_Hodges_BennetsCrime_03_01"); //谋 杀 罪 ！ 贝 尼 特 被 指 控 谋 杀 了 一 名 圣 骑 士 。 全 是 胡 扯 ， 我 一 直 和 他 在 一 起 。
	AI_Output(other, self, "DIA_Hodges_BennetsCrime_15_02"); //那 你 为 什 么 不 去 城 里 ， 把 整 个 事 情 解 释 清 楚 呢 ？
	AI_Output(self, other, "DIA_Hodges_BennetsCrime_03_03"); //他 们 会 把 我 当 作 他 的 同 谋 一 起 关 进 监 狱 。 不 ， 在 现 在 这 种 情 形 下 ， 绝 对 不 行 。
	AI_Output(other, self, "DIA_Hodges_BennetsCrime_15_04"); //情 况 怎 么 样 ？
	AI_Output(self, other, "DIA_Hodges_BennetsCrime_03_05"); //你 知 道 ， 欧 纳 尔 和 城 市 之 间 ， 那 注 定 会 是 一 个 糟 糕 的 结 局 。

	B_LogEntry(TOPIC_RESCUEBENNET, TOPIC_RESCUEBENNET_3);
};

///////////////////////////////////////////////////////////////////////
//	Wie reagieren die Söldner?
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_BennetAndSLD(C_INFO)
{
	npc				= BAU_908_Hodges;
	nr				= 33;
	condition		= DIA_Hodges_BennetAndSLD_Condition;
	information		= DIA_Hodges_BennetAndSLD_Info;
	description		= "在 农 场 里 的 雇 佣 兵 怎 么 反 攻 ？";
};

func int DIA_Hodges_BennetAndSLD_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Hodges_DontWork))
	&& (MIS_RescueBennet != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hodges_BennetAndSLD_Info()
{
	AI_Output(other, self, "DIA_Hodges_BennetAndSLD_15_00"); //在 农 场 里 的 雇 佣 兵 怎 么 反 攻 ？
	AI_Output(self, other, "DIA_Hodges_BennetAndSLD_03_01"); //很 自 然 ， 我 不 知 道 他 们 究 竟 是 怎 么 计 划 的 ， 但 是 他 们 之 中 有 些 人 相 当 恼 火 。
	AI_Output(other, self, "DIA_Hodges_BennetAndSLD_15_02"); //那 我 能 理 解 。
	AI_Output(self, other, "DIA_Hodges_BennetAndSLD_03_03"); //如 果 让 他 们 决 定 的 话 ， 他 们 宁 愿 尽 早 袭 击 城 市 把 贝 尼 特 救 出 来 。
	AI_Output(self, other, "DIA_Hodges_BennetAndSLD_03_04"); //和 李 谈 谈 ， 也 许 有 些 事 你 能 帮 忙。
};

// ##################################################
// ##
// ## Kapitel 4
// ##
// ##################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_Kap4_EXIT(C_INFO)
{
	npc				= BAU_908_Hodges;
	nr				= 999;
	condition		= DIA_Hodges_Kap4_EXIT_Condition;
	information		= DIA_Hodges_Kap4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Hodges_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ##################################################
// ##
// ## Kapitel 5
// ##
// ##################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_Kap5_EXIT(C_INFO)
{
	npc				= BAU_908_Hodges;
	nr				= 999;
	condition		= DIA_Hodges_Kap5_EXIT_Condition;
	information		= DIA_Hodges_Kap5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Hodges_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Hodges_PICKPOCKET(C_INFO)
{
	npc				= BAU_908_Hodges;
	nr				= 900;
	condition		= DIA_Hodges_PICKPOCKET_Condition;
	information		= DIA_Hodges_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Hodges_PICKPOCKET_Condition()
{
	C_Beklauen(15, 10);
};

func void DIA_Hodges_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hodges_PICKPOCKET);
	Info_AddChoice(DIA_Hodges_PICKPOCKET, DIALOG_BACK, DIA_Hodges_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hodges_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Hodges_PICKPOCKET_DoIt);
};

func void DIA_Hodges_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hodges_PICKPOCKET);
};

func void DIA_Hodges_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hodges_PICKPOCKET);
};
