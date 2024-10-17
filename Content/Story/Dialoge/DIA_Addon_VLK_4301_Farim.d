///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_EXIT(C_INFO)
{
	npc				= VLK_4301_Addon_Farim;
	nr				= 999;
	condition		= DIA_Addon_Farim_EXIT_Condition;
	information		= DIA_Addon_Farim_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Farim_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Farim_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Farim_PICKPOCKET(C_INFO)
{
	npc				= VLK_4301_Addon_Farim;
	nr				= 900;
	condition		= DIA_Addon_Farim_PICKPOCKET_Condition;
	information		= DIA_Addon_Farim_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Addon_Farim_PICKPOCKET_Condition()
{
	C_Beklauen(20, 11);
};

func void DIA_Addon_Farim_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Farim_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Farim_PICKPOCKET, DIALOG_BACK, DIA_Addon_Farim_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Farim_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Farim_PICKPOCKET_DoIt);
};

func void DIA_Addon_Farim_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Farim_PICKPOCKET);
};

func void DIA_Addon_Farim_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Farim_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Hallo(C_INFO)
{
	npc				= VLK_4301_Addon_Farim;
	nr				= 5;
	condition		= DIA_Addon_Farim_Hallo_Condition;
	information		= DIA_Addon_Farim_Hallo_Info;
	description		= "你 是 一 个 渔 夫 ？";
};

func int DIA_Addon_Farim_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Farim_Hallo_Info()
{
	AI_Output(other, self, "DIA_Addon_Farim_Hallo_15_00"); //你 是 一 个 渔 夫 ？
	AI_Output(self, other, "DIA_Addon_Farim_Hallo_11_01"); //（ 玩 世 不 恭 的 ） 现 在 你 是 怎 么 想 到 那 个 的 ？
	AI_Output(self, other, "DIA_Addon_Farim_Hallo_11_02"); //你 不 能 走 开 吗 ?
	if (hero.guild == GIL_MIL)
	{
		AI_Output(self, other, "DIA_Addon_Farim_Landstreicher_Add_11_02"); //别 在 意 ,不 过 我 近 来 一 直 不 喜 欢 民 兵 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Farim_Landstreicher_Add_11_03"); //别 在 意 , 不 过 我 近 来 一 直 不 开 心 .都 是 那 些 民 兵.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MilizProbs
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_MilizProbs(C_INFO)
{
	npc				= VLK_4301_Addon_Farim;
	nr				= 5;
	condition		= DIA_Addon_Farim_MilizProbs_Condition;
	information		= DIA_Addon_Farim_MilizProbs_Info;
	description		= "和 民 兵 之 间 的 矛 盾 ?";
};

func int DIA_Addon_Farim_MilizProbs_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Farim_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_MilizProbs_Info()
{
	AI_Output(other, self, "DIA_Addon_Farim_MilizProbs_15_00"); //和 民 兵 之 间 的 矛 盾 ?
	if (((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)) == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Farim_MilizProbs_11_01"); //那 些 混 蛋 们 不 断 来 到 这 里 来 .并 把 他 们 想 要 的 东 西 都 拿 走 .
	};

	AI_Output(self, other, "DIA_Addon_Farim_MilizProbs_11_02"); //上 周 他 们 拿 走 了 我 所 有 的 东 西 .‘ 这 是 为 了 做 好 事 .’ 他 们 说 。
	AI_Output(self, other, "DIA_Addon_Farim_MilizProbs_11_03"); //我 知 道 自 从 农 民 们 停 止 交 易 之 后 ,每 个 人 都 要 设 法 养 活 他 自 己 .
	AI_Output(self, other, "DIA_Addon_Farim_MilizProbs_11_04"); //而 且 ， 当 然 ， 有 些 人 的 确 很 饿 。 所 以 他 们 在 我 鼻 子 底 下 偷 鱼 也 不 足 为 奇 。
	AI_Output(self, other, "DIA_Addon_Farim_MilizProbs_11_05"); //但 是 如 果 他 们 继 续 这 样 做 的 话 ， 我 就 没 有 东 西 养 活 自 己 了 。

	Info_ClearChoices(DIA_Addon_Farim_MilizProbs);
	Info_AddChoice(DIA_Addon_Farim_MilizProbs, "把 你 所 有 的 鱼 都 给 我 。", DIA_Addon_Farim_MilizProbs_klauen);
	Info_AddChoice(DIA_Addon_Farim_MilizProbs, "也 许 我 能 帮 助 你 。", DIA_Addon_Farim_MilizProbs_helfen);
	Info_AddChoice(DIA_Addon_Farim_MilizProbs, "你 和 圣 骑 士 谈 过 这 些 吗 ？", DIA_Addon_Farim_MilizProbs_paladine);
};

func void DIA_Addon_Farim_MilizProbs_paladine()
{
	AI_Output(other, self, "DIA_Addon_Farim_MilizProbs_paladine_15_00"); //你 同 圣 骑 士 谈 过 这 些 吗 ？
	AI_Output(self, other, "DIA_Addon_Farim_MilizProbs_paladine_11_01"); //（ 大 笑 ） 你 在 开 玩 笑 吗 ？ 你 真 的 认 为 他 们 会 对 我 这 样 可 怜 的 家 伙 是 否 与 民 兵 之 间 有 什 么 矛 盾 而 感 兴 趣 吗 ？
};

var int Farim_PissedOff;
func void DIA_Addon_Farim_MilizProbs_klauen()
{
	AI_Output(other, self, "DIA_Addon_Farim_MilizProbs_klauen_15_00"); //把 你 所 有 的 鱼 都 给 我 。
	AI_Output(self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_01"); //（ 愤 怒 的 ） 我 就 知 道 。 那 些 垃 圾 中 的 一 个 。

	if ((other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL))
	{
		AI_Output(self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_02"); //恐 怕 你 太 晚 了 。 你 的 朋 友 们 昨 天 来 过 这 里 了 ， 他 们 把 所 有 东 西 都 拿 走 了 。
	};

	AI_Output(self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_04"); //嗯 。 我 想 你 最 好 马 上 离 开 。
	Farim_PissedOff = TRUE;
	Info_ClearChoices(DIA_Addon_Farim_MilizProbs);
};

func void DIA_Addon_Farim_MilizProbs_helfen()
{
	AI_Output(other, self, "DIA_Addon_Farim_MilizProbs_helfen_15_00"); //也 许 我 能 帮 助 你 。
	AI_Output(self, other, "DIA_Addon_Farim_MilizProbs_helfen_11_02"); //我 不 知 道 。 我 想 你 一 定 知 道 民 兵 中 有 某 个 人 和 圣 骑 士 有 关 系 。
	AI_Output(self, other, "DIA_Addon_Farim_MilizProbs_helfen_11_03"); //圣 骑 士 肯 定 不 会 向 我 买 鱼 。
	AI_Output(other, self, "DIA_Addon_Farim_MilizProbs_helfen_15_04"); //我 应 该 看 看 我 能 做 什 么 。
	Info_ClearChoices(DIA_Addon_Farim_MilizProbs);

	Log_CreateTopic(TOPIC_Addon_FarimsFish, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_FarimsFish, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_FarimsFish, TOPIC_Addon_FarimsFish_1);

	MIS_Addon_Farim_PaladinFisch = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info MartinHelps
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_MartinHelps(C_INFO)
{
	npc				= VLK_4301_Addon_Farim;
	nr				= 5;
	condition		= DIA_Addon_Farim_MartinHelps_Condition;
	information		= DIA_Addon_Farim_MartinHelps_Info;
	description		= "我 知 道 怎 么 解 决 你 和 民 兵 之 间 的 问 题 。";
};

func int DIA_Addon_Farim_MartinHelps_Condition()
{
	if ((MIS_Addon_Farim_PaladinFisch == LOG_RUNNING)
	&& (Martin_KnowsFarim == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_MartinHelps_Info()
{
	AI_Output(other, self, "DIA_Addon_Farim_MartinHelps_15_00"); //我 知 道 怎 么 解 决 你 和 民 兵 之 间 的 问 题 。
	AI_Output(self, other, "DIA_Addon_Farim_MartinHelps_11_01"); //那 要 怎 么 做 ？

	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other, self, "DIA_Addon_Farim_MartinHelps_15_02"); //我 不 是 经 常 来 这 里 ， 没 有 足 够 的 时 间 帮 你 看 鱼 。
		AI_Output(other, self, "DIA_Addon_Farim_MartinHelps_15_03"); //但 是 我 怎么 知 道 有 谁 可 以 那 样 做 。
	};

	AI_Output(other, self, "DIA_Addon_Farim_MartinHelps_15_04"); //马 丁 ， 圣 骑 士 的 补 给 官 员 ， 想 要 听 听 你 和 民 兵 之 间 关 于 鱼 的 问 题 。
	AI_Output(self, other, "DIA_Addon_Farim_MartinHelps_11_05"); //你 认 为 他 能 让 那 些 民 兵 不 要 来 打 扰 我 ？
	AI_Output(other, self, "DIA_Addon_Farim_MartinHelps_15_06"); //至 少 他 是 那 么 说 的 。
	AI_Output(self, other, "DIA_Addon_Farim_MartinHelps_11_07"); //好 极 了 。 谢 谢 你 。 我 给 不 了 你 很 多 ， 但 是 等 等 … …
	AI_Output(self, other, "DIA_Addon_Farim_MartinHelps_11_08"); //我 在 克 霍 里 尼 斯 外 一 个 岛 上 的 海 滩 找 到 了 这 个 奇 怪 的 蓝 石 头 。
	AI_Output(self, other, "DIA_Addon_Farim_MartinHelps_11_09"); //我 不 知 道 它 是 不 是 值 钱 ， 但 是 像 你 这 样 的 人 一 定 能 找 出 它 的 用 途 。

	B_GiveInvItems(self, other, ItMi_Aquamarine, 1);

	MIS_Addon_Farim_PaladinFisch = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Farim_PaladinFisch);
};

///////////////////////////////////////////////////////////////////////
//	Info Landstreicher
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Landstreicher(C_INFO)
{
	npc				= VLK_4301_Addon_Farim;
	nr				= 5;
	condition		= DIA_Addon_Farim_Landstreicher_Condition;
	information		= DIA_Addon_Farim_Landstreicher_Info;
	description		= "你 能 告 诉 我 一 些 关 于 失 踪 的 人 的 情 况 吗 ？";
};

func int DIA_Addon_Farim_Landstreicher_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Farim_Hallo))
	&& (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Landstreicher_Info()
{
	AI_Output(other, self, "DIA_Addon_Farim_Landstreicher_15_01"); //你 能 告 诉 我 一 些 关 于 失 踪 的 人 的 情 况 吗 ？
	AI_Output(self, other, "DIA_Addon_Farim_Landstreicher_11_02"); //我 的 朋 友 威 廉 最 近 在 和 一 些 可 疑 的 人 鬼 混 。 他 们 是 怎 么 找 上 他 的 ？
	AI_Output(self, other, "DIA_Addon_Farim_Landstreicher_11_03"); //有 一 天 ， 他 没 有 来 工 作 ， 那 就 是 我 们 最 后 一 次 看 到 他 。
	SCKnowsFarimAsWilliamsFriend = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info William
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_William(C_INFO)
{
	npc				= VLK_4301_Addon_Farim;
	nr				= 5;
	condition		= DIA_Addon_Farim_William_Condition;
	information		= DIA_Addon_Farim_William_Info;
	description		= "你 的 伙 伴 威 廉 已 经 失 踪 了 ？";
};

func int DIA_Addon_Farim_William_Condition()
{
	if ((SCKnowsFarimAsWilliamsFriend == TRUE)
	&& (Npc_KnowsInfo(other, DIA_Addon_Farim_Hallo)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_William_Info()
{
	AI_Output(other, self, "DIA_Addon_Farim_William_15_00"); //你 的 伙 伴 威 廉 已 经 失 踪 了 ？
	AI_Output(self, other, "DIA_Addon_Farim_William_11_01"); //他 就 是 这 样 。 他 是 一 个 渔 夫 ， 但 是 有 点 自 以 为 是 ， 我 需 要 补 充 一 下 。
	AI_Output(self, other, "DIA_Addon_Farim_William_11_02"); //他 真 应 该 离 那 些 家 伙 远 一 点 。

	Log_CreateTopic(TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_MissingPeople, LogText_Addon_WilliamMissing);

	Info_ClearChoices(DIA_Addon_Farim_William);
	Info_AddChoice(DIA_Addon_Farim_William, "那 些 混 蛋 究 竟 是 谁 ？", DIA_Addon_Farim_William_typen);
	Info_AddChoice(DIA_Addon_Farim_William, "他 会 再 露 面 的 。", DIA_Addon_Farim_William_auftauchen);
	Info_AddChoice(DIA_Addon_Farim_William, "他 以 前 从 事 什 么 工 作 ？", DIA_Addon_Farim_William_WasGemacht);
	Info_AddChoice(DIA_Addon_Farim_William, "你 上 次 见 到 他 是 什 么 时 候 ？", DIA_Addon_Farim_William_WannWeg);
};

func void DIA_Addon_Farim_William_WasGemacht()
{
	AI_Output(other, self, "DIA_Addon_Farim_William_WasGemacht_15_00"); //他 以 前 从 事 什 么 工 作 ？
	AI_Output(self, other, "DIA_Addon_Farim_William_WasGemacht_11_01"); //威 廉 和 那 些 无 赖 之 间 有 些 见 不 得 人 的 交 易 。
	AI_Output(self, other, "DIA_Addon_Farim_William_WasGemacht_11_02"); //我 想 是 他 把 所 有 那 些 禁 运 品 卖 给 那 些 混 蛋 的 。
	// AI_Output(self, other, "DIA_Addon_Farim_William_WasGemacht_11_03"); // Aber seit die Handelschiffe nicht mehr hier in Khorinis anlegen, weiß ich nicht, was er stattdessen für sie gemacht hat.
};

func void DIA_Addon_Farim_William_typen()
{
	AI_Output(other, self, "DIA_Addon_Farim_William_typen_15_00"); //那 些 混 蛋 究 竟 是 谁 ？
	AI_Output(self, other, "DIA_Addon_Farim_William_typen_11_01"); //我 不 知 道 他 们 是 谁 ， 也 不 知 道 他 们 在 克 霍 里 尼 斯 这 里 做 什 么 买 卖 。
	AI_Output(self, other, "DIA_Addon_Farim_William_typen_11_02"); //我 只 知 道 他 们 与 威 廉 见 面 的 地 方 。
	AI_Output(self, other, "DIA_Addon_Farim_William_typen_11_03"); //我 只 是 在 海 湾 钓 鱼 的 时 候 碰 巧 看 到 了 威 廉 在 那 里 。

	Info_AddChoice(DIA_Addon_Farim_William, "那 次 会 面 的 确 切 地 点 在 哪 里 ？", DIA_Addon_Farim_William_Wo);
};

func void DIA_Addon_Farim_William_Wo()
{
	AI_Output(other, self, "DIA_Addon_Farim_William_Wo_15_00"); //那 次 会 面 的 确 切 地 点 在 哪 里 ？
	AI_Output(self, other, "DIA_Addon_Farim_William_Wo_11_01"); //在 港 口 对 面 有 个 海 湾 ， 从 这 里 向 北 。
	AI_Output(self, other, "DIA_Addon_Farim_William_Wo_11_02"); //你 只 能 乘 船 或 者 游 泳 到 那 里 。
	AI_Output(self, other, "DIA_Addon_Farim_William_Wo_11_03"); //那 里 有 个 海 滩 ， 还 有 一 些 小 捕 鱼 营 地 。 我 就 是 在 那 里 见 到 他 们 的 。
	self.flags = 0; // Joly: hat seine Pflicht getan

	Log_CreateTopic(TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_WhoStolePeople, TOPIC_Addon_WhoStolePeople_6);

	Info_AddChoice(DIA_Addon_Farim_William, "我 想 我 已 经 听 够 了 。", DIA_Addon_Farim_William_Tschau);
};

func void DIA_Addon_Farim_William_WannWeg()
{
	AI_Output(other, self, "DIA_Addon_Farim_William_WannWeg_15_00"); //你 上 次 见 到 他 是 什 么 时 候 ？
	AI_Output(self, other, "DIA_Addon_Farim_William_WannWeg_11_01"); //就 在 几 天 前 。

	Info_AddChoice(DIA_Addon_Farim_William, "也 许 他 只 是 出 海 捕 鱼 了 ？。", DIA_Addon_Farim_William_Fischen);
};

func void DIA_Addon_Farim_William_Fischen()
{
	AI_Output(other, self, "DIA_Addon_Farim_William_Fischen_15_00"); //也 许 他 只 是 出 海 捕 鱼 了 ？
	AI_Output(self, other, "DIA_Addon_Farim_William_Fischen_11_01"); //那 非 常 不 可 能 。 他 的 船 现 在 还 停 在 港 口 里 。
};

func void DIA_Addon_Farim_William_auftauchen()
{
	AI_Output(other, self, "DIA_Addon_Farim_William_auftauchen_15_00"); //他 会 再 次 露 面 的 。
	AI_Output(self, other, "DIA_Addon_Farim_William_auftauchen_11_01"); //我 不 那 么 想 。 他 已 经 消 失 了 很 久 了 。
	AI_Output(self, other, "DIA_Addon_Farim_William_auftauchen_11_02"); //我 担 心 我 可 能 要 在 海 上 的 某 个 地 方 去 拖 他 的 尸 体 。
};

func void DIA_Addon_Farim_William_Tschau()
{
	AI_Output(other, self, "DIA_Addon_Farim_William_Tschau_15_00"); //我 已 经 听 够 了 。
	AI_Output(self, other, "DIA_Addon_Farim_William_Tschau_11_01"); //别 费 劲 了 。 我 不 相 信 你 能 找 到 他 。
	Info_ClearChoices(DIA_Addon_Farim_William);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Perm(C_INFO)
{
	npc				= VLK_4301_Addon_Farim;
	nr				= 99;
	condition		= DIA_Addon_Farim_Perm_Condition;
	information		= DIA_Addon_Farim_Perm_Info;
	permanent		= TRUE;
	description		= "那 么 鱼 咬 的 厉 害 吗 ？";
};

func int DIA_Addon_Farim_Perm_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Farim_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Perm_Info()
{
	AI_Output(other, self, "DIA_Addon_Farim_Perm_15_00"); //那 么 鱼 咬 的 厉 害 吗 ？

	if (Farim_PissedOff == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_Farim_Perm_11_01"); //不 要 假 装 你 很 感 兴 趣 的 样 子 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Farim_Perm_11_02"); //我 已 经 看 过 很 多 次 了 。 活 下 来 的 少 ， 死 掉 的 多 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info William
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_WilliamReport(C_INFO)
{
	npc				= VLK_4301_Addon_Farim;
	nr				= 1;
	condition		= DIA_Addon_Farim_WilliamReport_Condition;
	information		= DIA_Addon_Farim_WilliamReport_Info;
	important		= TRUE;
};

func int DIA_Addon_Farim_WilliamReport_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Farim_William))
	{
		if ((Npc_HasItems(other, ITWr_Addon_William_01) > 0)
		|| (Saturas_AboutWilliam == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Farim_WilliamReport_Info()
{
	AI_Output(self, other, "DIA_Addon_Farim_Add_11_01"); //又 是 你 ！
	AI_Output(self, other, "DIA_Addon_Farim_Add_11_02"); //那 么 你 听 到 关 于 我 的 朋 友 威 廉 的 消 息 了 吗 ？
	AI_Output(other, self, "DIA_Addon_Farim_Add_15_02"); //他 死 了 。
	AI_Output(self, other, "DIA_Addon_Farim_Add_11_03"); //（ 叹 息 ） 是 的 ， 我 早 就 知 道 会 是 那 样 。
	AI_Output(self, other, "DIA_Addon_Farim_Add_11_04"); //谢 谢 你 回 来 告 诉 我 。
	AI_Output(self, other, "DIA_Addon_Farim_Add_11_05"); //我 要 去 酒 吧 ， 然 后 把 我 们 上 次 剩 下 的 、 属 于 他 的 那 一 份 喝 掉 - 那 一 定 也 是 他 希 望 的 … …
};
