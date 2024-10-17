// #####################################################################
// ##
// ##
// ## KAPITEL 4
// ##
// ##
// #####################################################################

//***************************************************************************
//	Info EXIT
//***************************************************************************
instance DIA_SylvioDJG_EXIT(C_INFO)
{
	npc				= DJG_700_Sylvio;
	nr				= 999;
	condition		= DIA_SylvioDJG_EXIT_Condition;
	information		= DIA_SylvioDJG_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_SylvioDJG_EXIT_Condition()
{
	return 1;
};

func void DIA_SylvioDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HelloAgain
///////////////////////////////////////////////////////////////////////
instance DIA_SylvioDJG_HelloAgain(C_INFO)
{
	npc				= DJG_700_Sylvio;
	condition		= DIA_SylvioDJG_HelloAgain_Condition;
	information		= DIA_SylvioDJG_HelloAgain_Info;
	important		= TRUE;
};

func int DIA_SylvioDJG_HelloAgain_Condition()
{
	if (((Npc_IsDead(IceDragon)) == FALSE)
	&& (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_HelloAgain_Info()
{
	if ((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_SylvioDJG_HelloAgain_09_00"); //嗯 ， 我 会 遭 到 谴 责 的 。 想 发 财 ， 嗯 ？ 我 就 知 道 ！ 你 有 雇 佣 兵 的 精 神 。
		AI_Output(self, other, "DIA_SylvioDJG_HelloAgain_09_01"); //听 着 ， 如 果 你 以 为 能 在 这 里 发 财 ， 那 就 彻 底 错 了 。 我 先 到 这 里 的 。
	}
	else if (other.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_SylvioDJG_HelloAgain_09_02"); //嘿 ， 你 ！ 魔 法 师 让 我 感 到 不 安 ！ 去 别 的 地 方 ！ 这 里 什 么 都 没 有 。
	}
	else
	{
		AI_Output(self, other, "DIA_SylvioDJG_HelloAgain_09_03"); //嘿 ， 你 ， 圣 骑 士 ！ 回 你 的 矿 井 去 。 这 里 没 东 西 。
	};

	AI_Output(other, self, "DIA_SylvioDJG_HelloAgain_15_04"); //明 白 。 没 人 愿 意 放 弃 他 的 利 益 。
	AI_Output(self, other, "DIA_SylvioDJG_HelloAgain_09_05"); //你 说 对 了 。 走 开 。
};

///////////////////////////////////////////////////////////////////////
//	Info Versager
///////////////////////////////////////////////////////////////////////
instance DIA_Sylvio_VERSAGER(C_INFO)
{
	npc				= DJG_700_Sylvio;
	nr				= 6;
	condition		= DIA_Sylvio_VERSAGER_Condition;
	information		= DIA_Sylvio_VERSAGER_Info;
	description		= "如 果 我 没 走 呢 ？";
};

func int DIA_Sylvio_VERSAGER_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_SylvioDJG_HelloAgain))
	&& (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_VERSAGER_Info()
{
	AI_Output(other, self, "DIA_Sylvio_VERSAGER_15_00"); //如 果 我 没 走 呢 ？
	AI_Output(self, other, "DIA_Sylvio_VERSAGER_09_01"); //别 在 这 里 装 大 人 物 ， 年 青 人 ， 否 则 你 就 会 象 躺 在 那 边 雪 地 里 的 可 怜 混 蛋 一 样 完 蛋 。
};

///////////////////////////////////////////////////////////////////////
//	Info DeineLeute
///////////////////////////////////////////////////////////////////////
instance DIA_Sylvio_DEINELEUTE(C_INFO)
{
	npc				= DJG_700_Sylvio;
	nr				= 7;
	condition		= DIA_Sylvio_DEINELEUTE_Condition;
	information		= DIA_Sylvio_DEINELEUTE_Info;
	description		= "那 些 是 你 的 人 ？";
};

func int DIA_Sylvio_DEINELEUTE_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Sylvio_VERSAGER))
	&& (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (MIS_DJG_Sylvio_KillIceGolem == 0))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_DEINELEUTE_Info()
{
	AI_Output(other, self, "DIA_Sylvio_DEINELEUTE_15_00"); //那 些 是 你 的 人 ？
	AI_Output(self, other, "DIA_Sylvio_DEINELEUTE_09_01"); //不 要 再 来 一 次 了 。 没 什 么 大 损 失 。 那 些 白 痴 们 根 本 不 值 那 个 价 。
};

///////////////////////////////////////////////////////////////////////
//	Info WasIstPassiert
///////////////////////////////////////////////////////////////////////
instance DIA_Sylvio_WASISTPASSIERT(C_INFO)
{
	npc				= DJG_700_Sylvio;
	nr				= 8;
	condition		= DIA_Sylvio_WASISTPASSIERT_Condition;
	information		= DIA_Sylvio_WASISTPASSIERT_Info;
	description		= "他 们 怎 么 了 ？";
};

func int DIA_Sylvio_WASISTPASSIERT_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Sylvio_VERSAGER))
	&& (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_WASISTPASSIERT_Info()
{
	AI_Output(other, self, "DIA_Sylvio_WASISTPASSIERT_15_00"); //他 们 怎 么 了 ？
	AI_Output(self, other, "DIA_Sylvio_WASISTPASSIERT_09_01"); //他 们 连 那 边 的 冰 巨 人 都 过 不 去 ， 还 被 它 们 消 灭 了 。
	AI_Output(self, other, "DIA_Sylvio_WASISTPASSIERT_09_02"); //如 果 你 真 是 这 样 的 硬 汉 的 话 ， 为 什 么 你 不 去 试 试 ？

	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT, "那 好 吧 。 为 什 么 不 呢 ？", DIA_Sylvio_WASISTPASSIERT_ok);
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT, "如 果 我 这 么 做 会 帮 你 什 么 忙 ？", DIA_Sylvio_WASISTPASSIERT_washastdudavon);
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT, "我 有 什 么 好 处 ？", DIA_Sylvio_WASISTPASSIERT_warum);
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT, "为 什 么 你 不 亲 自 消 灭 他 们 ？", DIA_Sylvio_WASISTPASSIERT_selbst);

	Log_CreateTopic(TOPIC_SylvioKillIceGolem, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SylvioKillIceGolem, LOG_RUNNING);
	B_LogEntry(TOPIC_SylvioKillIceGolem, TOPIC_SylvioKillIceGolem_1);

	MIS_DJG_Sylvio_KillIceGolem = LOG_RUNNING;
};

func void DIA_Sylvio_WASISTPASSIERT_selbst()
{
	AI_Output(other, self, "DIA_Sylvio_WASISTPASSIERT_selbst_15_00"); //为 什 么 你 不 亲 自 消 灭 他 们 ？
	AI_Output(self, other, "DIA_Sylvio_WASISTPASSIERT_selbst_09_01"); //喂 ， 喂 。 不 要 那 么 吹 嘘 你 自 己 。
	AI_Output(self, other, "DIA_Sylvio_WASISTPASSIERT_selbst_09_02"); //我 认 为 ， 你 已 经 吓 的 要 命 了 。

	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT, "我 不 会 玩 你 的 小 游 戏 。", DIA_Sylvio_WASISTPASSIERT_keinInteresse);
};

var int DJG_Sylvio_PromisedMoney;
func void DIA_Sylvio_WASISTPASSIERT_warum()
{
	AI_Output(other, self, "DIA_Sylvio_WASISTPASSIERT_warum_15_00"); //我 有 什 么 好 处 ？
	AI_Output(self, other, "DIA_Sylvio_WASISTPASSIERT_warum_09_01"); //我 不 知 道 。 比 如 说 … …1000枚 金 币 。 听 起 来 怎 么 样 ？

	DJG_Sylvio_PromisedMoney = TRUE;
};

func void DIA_Sylvio_WASISTPASSIERT_washastdudavon()
{
	AI_Output(other, self, "DIA_Sylvio_WASISTPASSIERT_washastdudavon_15_00"); //如 果 我 这 么 做 会 帮 你 什 么 忙 ？
	AI_Output(self, other, "DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_01"); //你 们 都 是 一 个 样 。 但 是 我 回 答 你 的 问 题 ， 我 想 要 进 入 冰 封 地 区 。
	AI_Output(self, other, "DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_02"); //不 幸 的 是 ， 那 些 该 死 的 东 西 挡 住 了 我 的 路 。

	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT, "你 想 在 冰 封 地 区 做 什 么 ？", DIA_Sylvio_WASISTPASSIERT_Eisregion);
};

func void DIA_Sylvio_WASISTPASSIERT_keinInteresse()
{
	AI_Output(other, self, "DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_15_00"); //我 不 会 玩 你 的 小 游 戏 。
	AI_Output(self, other, "DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_09_01"); //啊 。 那 么 滚 出 去 ， 你 这 懦 夫 。

	AI_StopProcessInfos(self);
};

func void DIA_Sylvio_WASISTPASSIERT_Eisregion()
{
	AI_Output(other, self, "DIA_Sylvio_WASISTPASSIERT_keinInteresse_15_00"); //你 想 在 冰 封 地 区 做 什 么 ？
	AI_Output(self, other, "DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_01"); //你 不 会 停 止 问 问 题 的 ， 是 吗 ？ 好 吧 ， 那 我 会 告 诉 你 。
	AI_Output(self, other, "DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_02"); //这 里 ， 在 这 些 悬 崖 的 后 面 ， 是 一 片 你 以 前 从 未 见 过 的 冰 封 荒 地 。
	AI_Output(self, other, "DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_03"); //一 头 稀 有 的 冰 龙 和 它 巨 大 的 宝 藏 就 藏 在 那 里 。
	AI_Output(self, other, "DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_04"); //我 想 要 它 。 那 么 怎 么 决 定 ？ 是 还 是 否 ？
};

func void DIA_Sylvio_WASISTPASSIERT_ok()
{
	AI_Output(other, self, "DIA_Sylvio_WASISTPASSIERT_ok_15_00"); //那 好 吧 。 为 什 么 不 呢 ？
	AI_Output(self, other, "DIA_Sylvio_WASISTPASSIERT_ok_09_01"); //那 就 赶 快 。 我 时 间 不 多 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info IceGolemsKilled
///////////////////////////////////////////////////////////////////////
instance DIA_Sylvio_ICEGOLEMSKILLED(C_INFO)
{
	npc				= DJG_700_Sylvio;
	nr				= 9;
	condition		= DIA_Sylvio_ICEGOLEMSKILLED_Condition;
	information		= DIA_Sylvio_ICEGOLEMSKILLED_Info;
	description		= "你 的 道 路 已 经 肃 清 了 ！ 你 的 冰 巨 人 没 有 了 。";
};

func int DIA_Sylvio_ICEGOLEMSKILLED_Condition()
{
	if ((Npc_IsDead(IceGolem_Sylvio1))
	&& (Npc_IsDead(IceGolem_Sylvio2))
	&& (MIS_DJG_Sylvio_KillIceGolem == LOG_RUNNING)
	&& (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_ICEGOLEMSKILLED_Info()
{
	AI_Output(other, self, "DIA_Sylvio_ICEGOLEMSKILLED_15_00"); //你 的 道 路 已 经 肃 清 了 ！ 你 的 冰 巨 人 没 有 了 。
	AI_Output(self, other, "DIA_Sylvio_ICEGOLEMSKILLED_09_01"); //干 的 不 错 。 我 们 看 看 弄 到 了 什 么 。

	if (DJG_Sylvio_PromisedMoney == TRUE)
	{
		AI_Output(other, self, "DIA_Sylvio_ICEGOLEMSKILLED_15_02"); //等 一 下 。 钱 怎 么 办 ？
		AI_Output(self, other, "DIA_Sylvio_ICEGOLEMSKILLED_09_03"); //一 切 顺 利 。
	};

	AI_StopProcessInfos(self);

	MIS_DJG_Sylvio_KillIceGolem = LOG_SUCCESS;
	B_GivePlayerXP(XP_SylvioDJGIceGolemDead);
	Npc_ExchangeRoutine(self, "IceWait1");
	B_StartotherRoutine(DJG_Bullco, "IceWait1");
};

///////////////////////////////////////////////////////////////////////
//	Info Wasjetzt
///////////////////////////////////////////////////////////////////////
instance DIA_Sylvio_WASJETZT(C_INFO)
{
	npc				= DJG_700_Sylvio;
	nr				= 10;
	condition		= DIA_Sylvio_WASJETZT_Condition;
	information		= DIA_Sylvio_WASJETZT_Info;
	description		= "下 面 是 什 么 ？";
};

func int DIA_Sylvio_WASJETZT_Condition()
{
	if ((MIS_DJG_Sylvio_KillIceGolem == LOG_SUCCESS)
	&& (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_WASJETZT_Info()
{
	AI_Output(other, self, "DIA_Sylvio_WASJETZT_15_00"); //下 面 是 什 么 ？
	AI_Output(self, other, "DIA_Sylvio_WASJETZT_09_01"); //嗯 。 我 得 说 他 看 起 来 非 常 糟 糕 。
	AI_Output(self, other, "DIA_Sylvio_WASJETZT_09_02"); //最 好 是 你 走 在 前 面 ， 我 紧 跟 着 你 。

	Info_AddChoice(DIA_Sylvio_WASJETZT, "那 好 。", DIA_Sylvio_WASJETZT_ok);
	Info_AddChoice(DIA_Sylvio_WASJETZT, "你 害 怕 了 ？", DIA_Sylvio_WASJETZT_trennen);
	Info_AddChoice(DIA_Sylvio_WASJETZT, "我 不 会 为 你 做 那 些 卑 鄙 的 事 情 。", DIA_Sylvio_WASJETZT_nein);
	if (DJG_Sylvio_PromisedMoney == TRUE)
	{
		Info_AddChoice(DIA_Sylvio_WASJETZT, "首 先 ， 我 要 看 到 我 的 钱 。", DIA_Sylvio_WASJETZT_Geld);
	};
};

func void DIA_Sylvio_WASJETZT_trennen()
{
	AI_Output(other, self, "DIA_Sylvio_WASJETZT_trennen_15_00"); //你 害 怕 了 ？
	AI_Output(self, other, "DIA_Sylvio_WASJETZT_trennen_09_01"); //胡 扯 ， 不 要 再 说 傻 话 了 。 现 在 行 动 。
};

func void DIA_Sylvio_WASJETZT_ok()
{
	AI_Output(other, self, "DIA_Sylvio_WASJETZT_ok_15_00"); //那 好 。
	AI_Output(self, other, "DIA_Sylvio_WASJETZT_ok_09_01"); //嗯 ， 继 续 。 开 始 做 事 。

	AI_StopProcessInfos(self);
};

func void DIA_Sylvio_WASJETZT_nein()
{
	AI_Output(other, self, "DIA_Sylvio_WASJETZT_nein_15_00"); //我 不 会 为 你 做 那 些 卑 鄙 的 事 情 。
	AI_Output(self, other, "DIA_Sylvio_WASJETZT_nein_09_01"); //懦 夫 ！

	AI_StopProcessInfos(self);
};

func void DIA_Sylvio_WASJETZT_Geld()
{
	AI_Output(other, self, "DIA_Sylvio_WASJETZT_Geld_15_00"); //首 先 ， 我 要 看 到 我 的 钱 。
	AI_Output(self, other, "DIA_Sylvio_WASJETZT_Geld_09_01"); //一 旦 我 们 干 掉 了 那 条 龙 ， 你 能 带 多 少 金 子 就 拿 多 少 。

	Info_AddChoice(DIA_Sylvio_WASJETZT, "我 现 在 就 要 我 的 钱 。", DIA_Sylvio_WASJETZT_jetztGeld);
};

func void DIA_Sylvio_WASJETZT_jetztGeld()
{
	AI_Output(other, self, "DIA_Sylvio_WASJETZT_jetztGeld_15_00"); //我 现 在 就 要 我 的 钱 。
	AI_Output(self, other, "DIA_Sylvio_WASJETZT_jetztGeld_09_01"); //要 么 你 走 在 前 面 ， 要 么 你 听 我 的 安 排 。
};

///////////////////////////////////////////////////////////////////////
//	Info Kommstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Sylvio_KOMMSTDU(C_INFO)
{
	npc				= DJG_700_Sylvio;
	nr				= 11;
	condition		= DIA_Sylvio_KOMMSTDU_Condition;
	information		= DIA_Sylvio_KOMMSTDU_Info;
	permanent		= TRUE;
	description		= "我 想 你 正 要 去 冰 封 地 区 。";
};

func int DIA_Sylvio_KOMMSTDU_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Sylvio_WASJETZT))
	&& (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_KOMMSTDU_Info()
{
	AI_Output(other, self, "DIA_Sylvio_KOMMSTDU_15_00"); //我 想 你 正 要 去 冰 封 地 区 。
	AI_Output(self, other, "DIA_Sylvio_KOMMSTDU_09_01"); //走 在 前 面 。 我 跟 着 你 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info DuHier
///////////////////////////////////////////////////////////////////////
instance DIA_Sylvio_DUHIER(C_INFO)
{
	npc				= DJG_700_Sylvio;
	nr				= 11;
	condition		= DIA_Sylvio_DUHIER_Condition;
	information		= DIA_Sylvio_DUHIER_Info;
	permanent		= TRUE;
	description		= "我 需 要 一 些 帮 助 。";
};

func int DIA_Sylvio_DUHIER_Condition()
{
	if (((Npc_IsDead(IceDragon)) == FALSE)
	&& (IceDragon.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_DUHIER_Info()
{
	AI_Output(other, self, "DIA_Sylvio_DUHIER_15_00"); //我 需 要 一 些 帮 助 。
	AI_Output(self, other, "DIA_Sylvio_DUHIER_09_01"); //胡 扯 。 你 正 在 做 伟 大 的 事 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WhatNext
///////////////////////////////////////////////////////////////////////
instance DIA_SylvioDJG_WHATNEXT(C_INFO)
{
	npc				= DJG_700_Sylvio;
	nr				= 12;
	condition		= DIA_SylvioDJG_WHATNEXT_Condition;
	information		= DIA_SylvioDJG_WHATNEXT_Info;
	important		= TRUE;
};

func int DIA_SylvioDJG_WHATNEXT_Condition()
{
	if (Npc_IsDead(IceDragon))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_WHATNEXT_Info()
{
	AI_Output(self, other, "DIA_SylvioDJG_WHATNEXT_09_00"); //冰 龙 死 了 ！ 现 在 把 你 身 上 的 东 西 都 给 我 ！
	AI_Output(other, self, "DIA_SylvioDJG_WHATNEXT_15_01"); //决 不 ！
	AI_Output(self, other, "DIA_SylvioDJG_WHATNEXT_09_02"); //我 将 因 为 杀 死 冰 龙 而 出 名 。
	AI_Output(self, other, "DIA_SylvioDJG_WHATNEXT_09_03"); //你 在 这 件 事 中 的 小 角 色 演 完 了 ！

	TOPIC_END_SylvioKillIceGolem = TRUE;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_SylvioDJG_WHATNEXT);
	Info_AddChoice(DIA_SylvioDJG_WHATNEXT, DIALOG_ENDE, DIA_SylvioDJG_WHATNEXT_ATTACK);
};

func void DIA_SylvioDJG_WHATNEXT_ATTACK()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self, 60);

	Npc_ExchangeRoutine(self, "Start");
	B_StartOtherRoutine(DJG_Bullco, "Start");

	B_LogEntry(TOPIC_Dragonhunter, TOPIC_Dragonhunter_12);

	B_Attack(self, other, AR_NONE, 1);
	B_Attack(DJG_Bullco, other, AR_NONE, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info ButNow
///////////////////////////////////////////////////////////////////////
instance DIA_SylvioDJG_BUTNOW(C_INFO)
{
	npc				= DJG_700_Sylvio;
	nr				= 13;
	condition		= DIA_SylvioDJG_BUTNOW_Condition;
	information		= DIA_SylvioDJG_BUTNOW_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_SylvioDJG_BUTNOW_Condition()
{
	if ((Npc_IsDead(IceDragon))
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Npc_KnowsInfo(other, DIA_SylvioDJG_WHATNEXT)))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_BUTNOW_Info()
{
	AI_Output(self, other, "DIA_SylvioDJG_BUTNOW_09_00"); //到 算 账 的 时 候 了 。

	AI_StopProcessInfos(self);

	Npc_SetRefuseTalk(self, 60);

	B_Attack(self, other, AR_NONE, 1);
	B_Attack(DJG_Bullco, other, AR_NONE, 1);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Sylvio_PICKPOCKET(C_INFO)
{
	npc				= DJG_700_Sylvio;
	nr				= 900;
	condition		= DIA_Sylvio_PICKPOCKET_Condition;
	information		= DIA_Sylvio_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_100;
};

func int DIA_Sylvio_PICKPOCKET_Condition()
{
	C_Beklauen(78, 560);
};

func void DIA_Sylvio_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sylvio_PICKPOCKET);
	Info_AddChoice(DIA_Sylvio_PICKPOCKET, DIALOG_BACK, DIA_Sylvio_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sylvio_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Sylvio_PICKPOCKET_DoIt);
};

func void DIA_Sylvio_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sylvio_PICKPOCKET);
};

func void DIA_Sylvio_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sylvio_PICKPOCKET);
};

/*

///////////////////////////////////////////////////////////////////////
//	Info AngebotMachen
///////////////////////////////////////////////////////////////////////
instance DIA_SylvioDJG_ANGEBOTMACHEN(C_INFO)
{
	npc				= DJG_700_Sylvio;
	nr				= 0;
	condition		= DIA_SylvioDJG_ANGEBOTMACHEN_Condition;
	information		= DIA_SylvioDJG_ANGEBOTMACHEN_Info;
	description		= "Ich brauche eure Hilfe in der Eisregion!";
};

func int DIA_SylvioDJG_ANGEBOTMACHEN_Condition()
{
	if (
	(Npc_KnowsInfo(other, DIA_SylvioDJG_HelloAgain))
	&& ((Npc_IsDead(IceDragon)) == FALSE)
	)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_ANGEBOTMACHEN_Info()
{
	AI_Output(other, self, "DIA_SylvioDJG_ANGEBOTMACHEN_15_00"); //Paß auf, ich mach euch ein Angebot.
	AI_Output(self, other, "DIA_SylvioDJG_ANGEBOTMACHEN_09_01"); //Na, dann laß mal hören.
	AI_Output(other, self, "DIA_SylvioDJG_ANGEBOTMACHEN_15_02"); //Ihr hockt garantiert nicht zufällig hier vor der Eisregion da drüben. Ihr spielt mit dem Gedanken da rein zu gehen und euch die Beute dahinter zu schnappen.
	AI_Output(self, other, "DIA_SylvioDJG_ANGEBOTMACHEN_09_03"); //Und wenn es so wäre?
	AI_Output(other, self, "DIA_SylvioDJG_ANGEBOTMACHEN_15_04"); //Wir könnten gemeinsam hinein gehen!
	AI_Output(self, other, "DIA_SylvioDJG_ANGEBOTMACHEN_09_05"); //Warum denkst du sollten WIR das tun?
	AI_Output(other, self, "DIA_SylvioDJG_ANGEBOTMACHEN_15_06"); //Mich interssieren die Schätze nicht, die sich dahinter verbergen. Was es da zu holen gibt, könnt ihr meinet wegen behalten.
	AI_Output(self, other, "DIA_SylvioDJG_ANGEBOTMACHEN_09_07"); //Mmh!
	AI_Output(other, self, "DIA_SylvioDJG_ANGEBOTMACHEN_15_08"); //Ihr seid zwar gut, aber mit drei Mann sind wir schneller wieder raus.
	AI_Output(self, other, "DIA_SylvioDJG_ANGEBOTMACHEN_09_09"); //Bilde dir aber nicht ein, daß du uns übers Ohr hauen kannst! Ausserdem ist der Eisdrache nicht von schlechten Eltern. Wir kriegen alles, sagst du?
	AI_Output(other, self, "DIA_SylvioDJG_ANGEBOTMACHEN_15_10"); //Genau! Jetzt, wo ich weiß, daß es um einen Drachen geht...
	AI_Output(self, other, "DIA_SylvioDJG_ANGEBOTMACHEN_09_11"); //Verdammt! Na schön, von mir aus! Sag bescheid, wenn du bereit bist!

	B_LogEntry(TOPIC_Dragonhunter, "Sylvio vermutet einen Drachen in der Eisregion.");
};

// ---------------------------------------------------------------------
//	Info WAIT
// ---------------------------------------------------------------------
instance DIA_SylvioDJG_WAIT(C_INFO)
{
	npc				= DJG_700_Sylvio;
	nr				= 0;
	condition		= DIA_SylvioDJG_WAIT_Condition;
	information		= DIA_SylvioDJG_WAIT_Info;
	permanent		= TRUE;
	description		= "Warte mal einen Moment!";
};

func int DIA_SylvioDJG_WAIT_Condition()
{
	if (
	(self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& ((Npc_IsDead(IceDragon)) == FALSE)
	)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_WAIT_Info()
{
	AI_Output(other, self, "DIA_SylvioDJG_WAIT_15_00"); //Warte mal einen Moment!
	AI_Output(self, other, "DIA_SylvioDJG_WAIT_09_01"); //Was ist denn? Geh´ gefälligst weiter!
	AI_StopProcessInfos(self);
};

// ---------------------------------------------------------------------
//	Info IceWait1
// ---------------------------------------------------------------------
instance DIA_SylvioDJG_IceWait1(C_INFO)
{
	npc				= DJG_700_Sylvio;
	nr				= 0;
	condition		= DIA_SylvioDJG_IceWait1_Condition;
	information		= DIA_SylvioDJG_IceWait1_Info;
	description		= "Ich bin soweit!";
};

func int DIA_SylvioDJG_IceWait1_Condition()
{
	if ((self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (Npc_KnowsInfo(other, DIA_SylvioDJG_ANGEBOTMACHEN))
	&& ((Npc_IsDead(IceDragon)) == FALSE)
	)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_IceWait1_Info()
{
	AI_Output(other, self, "DIA_SylvioDJG_IceWait1_15_00"); //Ich bin soweit! Laß uns losgehen!
	AI_Output(self, other, "DIA_SylvioDJG_IceWait1_09_01"); //Dann werden wir ja sehen, wie gut du bist.
	Info_AddChoice(DIA_SylvioDJG_IceWait1, "losgehen", DIA_SylvioDJG_IceWait1_losgehen);
};

func void DIA_SylvioDJG_IceWait1_losgehen()
{
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	DJG_Bullco.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);

	Npc_ExchangeRoutine(self, "IceWait1");

	if ((Hlp_IsValidNpc(DJG_Bullco))
	&& (!Npc_IsDead(DJG_Bullco)))
	{
		Npc_ExchangeRoutine(DJG_Bullco, "IceWait1");
		AI_ContinueRoutine(DJG_Bullco);
	};
};

//***************************************************************************
//	Info IceWait2
//***************************************************************************
instance DIA_SylvioDJG_IceWait2(C_INFO)
{
	npc				= DJG_700_Sylvio;
	condition		= DIA_SylvioDJG_IceWait2_Condition;
	information		= DIA_SylvioDJG_IceWait2_Info;
	important		= TRUE;
};

func int DIA_SylvioDJG_IceWait2_Condition()
{
	if (
	(Npc_GetDistToWP(self, "OW_DJG_ICEREGION_WAIT1_01") < 1000)
	&& ((Npc_IsDead(IceDragon)) == FALSE)
	)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_IceWait2_Info()
{
	AI_GotoNpc(self, other);

	AI_Output(self, other, "DIA_SylvioDJG_IceWait2_09_00"); //So! Die erste Ebene scheint nun sicher!
	AI_Output(other, self, "DIA_SylvioDJG_IceWait2_15_01"); //Geh weiter!
	AI_Output(self, other, "DIA_SylvioDJG_IceWait2_09_02"); //Hör dir das an! Der Kleine, kriegt wohl nicht genug, was?
	Info_AddChoice(DIA_SylvioDJG_IceWait2, DIALOG_ENDE, DIA_SylvioDJG_IceWait2_weiter);
};

func void DIA_SylvioDJG_IceWait2_weiter()
{
	AI_Output(self, other, "DIA_SylvioDJG_IceWait2Weiter_09_00"); //Na dann komm!

	AI_StopProcessInfos(self);

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	DJG_Bullco.aivar[AIV_PARTYMEMBER] = TRUE;

	Npc_ExchangeRoutine(self, "IceWait2");

	if ((Hlp_IsValidNpc(DJG_Bullco))
	&& (!Npc_IsDead(DJG_Bullco)))
	{
		Npc_ExchangeRoutine(DJG_Bullco, "IceWait2");
		AI_ContinueRoutine(DJG_Bullco);
	};
};

//***************************************************************************
//	Info GoForIceDragon
//***************************************************************************
instance DIA_SylvioDJG_GoForIceDragon(C_INFO)
{
	npc				= DJG_700_Sylvio;
	condition		= DIA_SylvioDJG_GoForIceDragon_Condition;
	information		= DIA_SylvioDJG_GoForIceDragon_Info;
	important		= TRUE;
};

func int DIA_SylvioDJG_GoForIceDragon_Condition()
{
	if (
	(Npc_GetDistToWP(self, "OW_DJG_ICEREGION_WAIT2_01") < 1000)
	&& ((Npc_IsDead(IceDragon)) == FALSE)
	)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_GoForIceDragon_Info()
{
	AI_GotoNpc(self, other);

	AI_Output(self, other, "DIA_SylvioDJG_GoForIceDragon_09_00"); //So. Jetzt heißt, es dem Drachen das Handwerk zu legen. Was du machst? Ist mit ehrlich gesagt egal!
	AI_Output(other, self, "DIA_SylvioDJG_GoForIceDragon_15_01"); //Ich warne dich, Sylvio, verarsch mich jetzt nicht!
	AI_Output(self, other, "DIA_SylvioDJG_GoForIceDragon_09_02"); //Bis hierhin warst du eine...na ja...sagen wir...Hilfe. Aber jetzt, da wir an den ganzen Golemfeldern vorbei sind, überlass die Hauptarbeit mal lieber einem Profi. Sonst passiert dir noch was.
	AI_Output(other, self, "DIA_SylvioDJG_GoForIceDragon_15_03"); //Keine Chance!
	AI_Output(self, other, "DIA_SylvioDJG_GoForIceDragon_09_04"); //Na gut! Wenn du nicht anders willst. Aber beschwer dich nachher nicht ich hätte...
	AI_Output(other, self, "DIA_SylvioDJG_GoForIceDragon_15_05"); //Halt endlich die Klappe!

	B_LogEntry(TOPIC_Dragonhunter, "Sylvio wollte mich erst los werden, nachdem wir die Icegolemebene hinter uns gelassen hatten. Schließlich griffen wir dann doch gemeinsam den Eisdrachen an.");

	B_GivePlayerXP(XP_SylvioDJGIceClear);

	Info_AddChoice(DIA_SylvioDJG_GoForIceDragon, "weiter gehen", DIA_SylvioDJG_GoForIceDragon_weitergehen);
};

func void DIA_SylvioDJG_GoForIceDragon_weitergehen()
{
	AI_Output(self, other, "DIA_SylvioDJG_GoForIceDragon_weitergehen_09_00"); //Los, weiter!

	AI_StopProcessInfos(self);

	Npc_ExchangeRoutine(self, "IceDragon");

	if ((Hlp_IsValidNpc(DJG_Bullco))
	&& (!Npc_IsDead(DJG_Bullco)))
	{
		Npc_ExchangeRoutine(DJG_Bullco, "IceDragon");
		AI_ContinueRoutine(DJG_Bullco);
	};

	self.flags = 0;
	DJG_Bullco.flags = 0;

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_Bullco.aivar[AIV_PARTYMEMBER] = FALSE;
};

///////////////////////////////////////////////////////////////////////
//	Info WhatNext
///////////////////////////////////////////////////////////////////////
instance DIA_SylvioDJG_WHATNEXT(C_INFO)
{
	npc				= DJG_700_Sylvio;
	condition		= DIA_SylvioDJG_WHATNEXT_Condition;
	information		= DIA_SylvioDJG_WHATNEXT_Info;
	important		= TRUE;
};

func int DIA_SylvioDJG_WHATNEXT_Condition()
{
	if (
	((Npc_IsDead(IceDragon)) == TRUE)
	)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_WHATNEXT_Info()
{
	AI_Output(self, other, "DIA_SylvioDJG_WHATNEXT_09_00"); //Der Eisdrache ist tot! Und du gibst mir jetzt alles, was du bei dir hast!
	AI_Output(other, self, "DIA_SylvioDJG_WHATNEXT_15_01"); //Was ist los? Ich denke ja gar nicht daran!
	AI_Output(self, other, "DIA_SylvioDJG_WHATNEXT_09_02"); //Ich werde derjenige sein, der als Eisdrachentöter gefeiert wird. Deine kleine Rolle bei der Sache, wird jetzt aus der Welt geschafft!

	AI_StopProcessInfos(self);

	self.flags = 0;
	DJG_Bullco.flags = 0;

	B_LogEntry(TOPIC_Dragonhunter, "Das dreckige Schwein Sylvio wollte mir den Sieg über den Eisdrachen steitig machen. Es gab eine kleine Auseinandersetzung.");

	B_Attack(self, other, AR_NONE, 1);
	B_Attack(DJG_Bullco, other, AR_NONE, 1);

	Npc_ExchangeRoutine(self, "Start");

	if ((Hlp_IsValidNpc(DJG_Bullco))
	&& (!Npc_IsDead(DJG_Bullco)))
	{
		Npc_ExchangeRoutine(DJG_Bullco, "Start");
		AI_ContinueRoutine(DJG_Bullco);
	};
};

	*/
