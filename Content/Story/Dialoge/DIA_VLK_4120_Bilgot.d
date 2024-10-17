///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_EXIT(C_INFO)
{
	npc				= VLK_4120_Bilgot;
	nr				= 999;
	condition		= DIA_Bilgot_EXIT_Condition;
	information		= DIA_Bilgot_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Bilgot_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bilgot_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_HALLO(C_INFO)
{
	npc				= VLK_4120_Bilgot;
	nr				= 2;
	condition		= DIA_Bilgot_HALLO_Condition;
	information		= DIA_Bilgot_HALLO_Info;
	important		= TRUE;
};

func int DIA_Bilgot_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Bilgot_HALLO_Info()
{
	AI_Output(self, other, "DIA_Bilgot_HALLO_05_00"); //嘿 ， 你 是 从 哪 里 来 的 ？ 你 是 从 城 堡 那 里 吗 ？

	Info_AddChoice(DIA_Bilgot_HALLO, "是 的 ， 我 从 城 堡 来 - 为 什 么 ？", DIA_Bilgot_HALLO_Burg);
	Info_AddChoice(DIA_Bilgot_HALLO, "我 只 是 偶 然 来 到 这 里 … …", DIA_Bilgot_HALLO_Zufall);
};

func void DIA_Bilgot_HALLO_Zufall()
{
	AI_Output(other, self, "DIA_Bilgot_HALLO_Zufall_15_00"); //我 只 是 偶 然 来 到 这 里 … …
	AI_Output(self, other, "DIA_Bilgot_HALLO_Zufall_05_01"); //小 子 ， 没 有 人 会 碰 巧 来 到 这 里 。 我 们 被 困 在 这 里 了 - 被 暴 龙 包 围 了 ！
	AI_Output(self, other, "DIA_Bilgot_HALLO_Zufall_05_02"); //到 现 在 为 止 ， 我 们 这 里 没 有 一 天 不 死 人 。
	AI_Output(self, other, "DIA_Bilgot_HALLO_Zufall_05_03"); //你 不 想 告 诉 我 你 从 哪 里 来 的 ？ 好 吧 - 那 就 让 暴 龙 招 待 你 ！

	AI_StopProcessInfos(self);
};

func void DIA_Bilgot_HALLO_Burg()
{
	AI_Output(other, self, "DIA_Bilgot_HALLO_Burg_15_00"); //是 的 ， 我 从 城 堡 来 - 为 什 么 ？
	AI_Output(self, other, "DIA_Bilgot_HALLO_Burg_05_01"); //那 里 的 情 况 如 何 ？
	AI_Output(other, self, "DIA_Bilgot_HALLO_Burg_15_02"); //比 这 里 好 不 了 多 少 。 兽 人 还 在 那 里 ， 如 果 你 要 问 的 是 这 件 事 的 话 。
	AI_Output(self, other, "DIA_Bilgot_HALLO_Burg_05_03"); //该 死 。 你 去 哪 里 都 不 安 全 。
	AI_Output(self, other, "DIA_Bilgot_HALLO_Burg_05_04"); //我 可 以 这 么 说 。 如 果 我 不 是 害 怕 得 要 死 ， 我 就 会 逃 出 这 个 地 方 去 。

	Info_ClearChoices(DIA_Bilgot_HALLO);
};

///////////////////////////////////////////////////////////////////////
//	Info Job
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_Job(C_INFO)
{
	npc				= VLK_4120_Bilgot;
	nr				= 3;
	condition		= DIA_Bilgot_Job_Condition;
	information		= DIA_Bilgot_Job_Info;
	description		= "你 在 这 里 做 什 么 ？ ";
};

func int DIA_Bilgot_Job_Condition()
{
	return TRUE;
};

func void DIA_Bilgot_Job_Info()
{
	AI_Output(other, self, "DIA_Bilgot_Job_15_00"); //你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Bilgot_Job_05_01"); //我 是 这 里 的 普 通 杂 役 。 搬 运 东 西 ， 留 意 一 下 暴 龙 ， 比 尔 戈 特 来 这 里 ， 比 尔 戈 特 去 那 里 。
	AI_Output(self, other, "DIA_Bilgot_Job_05_02"); //我 应 该 在 家 陪 我 老 婆 的 。那 里 没 有 什 么 不 同 ，但 至 少 有 像 样 的 东 西 吃 。
	AI_Output(self, other, "DIA_Bilgot_Job_05_03"); //现 在 我 是 法 捷 斯 属 下 部 队 里 仅 存 的 士 兵 了 。
	AI_Output(self, other, "DIA_Bilgot_Job_05_04"); //我 怎 么 会 知 道 这 次 远 征 不 会 有 回 头 路 ？。
	AI_Output(self, other, "DIA_Bilgot_Job_05_05"); //我 的 朋 友 奥 莱 夫 已 经 逃 走 了 ， 也 许 他 成 功 了 … …
};

///////////////////////////////////////////////////////////////////////
//	Info Hilfe
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_Hilfe(C_INFO)
{
	npc				= VLK_4120_Bilgot;
	nr				= 3;
	condition		= DIA_Bilgot_Hilfe_Condition;
	information		= DIA_Bilgot_Hilfe_Info;
	description		= "关 于 那 些 暴 龙 你 了 解 什 么 ？";
};

func int DIA_Bilgot_Hilfe_Condition()
{
	if (MIS_Fajeth_Kill_Snapper == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Bilgot_Hilfe_Info()
{
	AI_Output(other, self, "DIA_Bilgot_Hilfe_15_00"); //关 于 那 些 暴 龙 你 了 解 什 么 ？
	AI_Output(self, other, "DIA_Bilgot_Hilfe_05_01"); //为 什 么 你 想 了 解 这 些 ？ 你 可 别 说 你 只 是 好 奇 ！
	AI_Output(other, self, "DIA_Bilgot_Hilfe_15_02"); //我 准 备 去 狩 猎 那 些 暴 龙。
	AI_Output(self, other, "DIA_Bilgot_Hilfe_05_03"); //简 直 是 疯 了 。 我 看 见 过 它 们 - 它 们 都 是 嗜 血 的 野 兽 。
	AI_Output(other, self, "DIA_Bilgot_Hilfe_15_04"); //那 就 告 诉 我 你 所 知 道 的 关 于 它 们 的 事 情 。
	AI_Output(self, other, "DIA_Bilgot_Hilfe_05_05"); //嗯 … … 我 可 以 帮 助 你 - 但 是 ， 有 一 个 条 件 ！
	AI_Output(other, self, "DIA_Bilgot_Hilfe_15_06"); //你 想 要 什 么 ？
	AI_Output(self, other, "DIA_Bilgot_Hilfe_05_07"); //如 果 你 想 办 法 杀 掉 了 暴 龙 - 那 你 就 必 须 带 我 离 开 这 里 ！

	if ((Npc_IsDead(Fed)) == FALSE)
	{
		AI_Output(self, other, "DIA_Bilgot_Hilfe_05_08"); //我 在 这 里 忍 受 不 了 多 久 了 - 你 跟 费 德 谈 过 了 吗 ？ 那 个 家 伙 已 经 完 蛋 了 - 我 可 不 想 有 他 那 样 的 下 场 ！
	};
};

///////////////////////////////////////////////////////////////////////
//	Info KnowsLeadSnapper
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_KNOWSLEADSNAPPER(C_INFO)
{
	npc				= VLK_4120_Bilgot;
	nr				= 4;
	condition		= DIA_Bilgot_KNOWSLEADSNAPPER_Condition;
	information		= DIA_Bilgot_KNOWSLEADSNAPPER_Info;
	description		= "告 诉 我 你 知 道 些 什 么 。 然 后 我 就 把 你 从 这 里 弄 出 去 ！";
};

func int DIA_Bilgot_KNOWSLEADSNAPPER_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Bilgot_Hilfe))
	&& (MIS_Fajeth_Kill_Snapper == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_KNOWSLEADSNAPPER_Info()
{
	AI_Output(other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_00"); //告 诉 我 你 知 道 些 什 么 。 然 后 我 就 把 你 从 这 里 弄 出 去 ！
	AI_Output(self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_01"); //我 知 道 你 靠 得 住 。 那 么 ， 注 意 点 。 我 已 经 观 察 过 那 些 暴 龙 一 阵 子 了 。
	AI_Output(self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_02"); //它 们 非 常 狡 猾， 而 且 有 某 种 特 殊 的 交 流 方 法 。 它 们 从 来 不 单 独 行 动 ， 都 是 群 体 出 击 。
	AI_Output(self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_03"); //不 过 ， 还 有 一 些 其 它 的 东 西 。 它 们 中 间 有 一 只 完 全 不 同 的 蜥 蜴 。 它 的 确 很 少 出 现 - 但 是 ， 我 真 的 见 过 它 。
	AI_Output(self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_04"); //其 它 的 野 兽 在 它 们 经 过 时 会 伏 下 身 子 - 而 且 它 们 那 么 做 的 时 候 总 是 在 看 着 它 。
	AI_Output(self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_05"); //只 要 那 只 蜥 蜴 不 动 ，附 近 的 蜥 蜴 就 不 会 动 。
	AI_Output(other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_06"); //我 在 哪 里 能 找 到 那 头 该 死 的 野 兽 ？
	AI_Output(self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_07"); //我 在 旧 瞭 望 塔 的 阶 梯 附 近 见 过 它 。

	AI_Output(other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_08"); //好 的 。 我 想 我 明 白 了 。 谢 谢 你 ！
	AI_Output(self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_09"); //记 住 ， 你 答 应 过 我 的 事 ！

	Wld_InsertNpc(NewMine_LeadSnapper, "OW_ORC_LOOKOUT_2_01"); // Der Rudelführer

	B_LogEntry(TOPIC_FajethKillSnapper, TOPIC_FajethKillSnapper_2);

	Log_CreateTopic(TOPIC_BilgotEscort, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BilgotEscort, LOG_RUNNING);
	B_LogEntry(TOPIC_BilgotEscort, TOPIC_BilgotEscort_1);
};

///////////////////////////////////////////////////////////////////////
//	Info TakeYouWithMe
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_TAKEYOUWITHME(C_INFO)
{
	npc				= VLK_4120_Bilgot;
	nr				= 2;
	condition		= DIA_Bilgot_TAKEYOUWITHME_Condition;
	information		= DIA_Bilgot_TAKEYOUWITHME_Info;
	description		= "（ 遵 守 诺 言 ）";
};

func int DIA_Bilgot_TAKEYOUWITHME_Condition()
{
	if ((MIS_Fajeth_Kill_Snapper == LOG_SUCCESS)
	&& Npc_KnowsInfo(other, DIA_Bilgot_KNOWSLEADSNAPPER))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_TAKEYOUWITHME_Info()
{
	AI_Output(other, self, "DIA_Bilgot_TAKEYOUWITHME_15_00"); //时 机 正 好 ， 比 尔 戈 特 ！ 带 好 你 的 东 西 ， 我 们 出 发 了 。
	// Joly: SC bringt den Typ bis zum Pass AI_Output(self, other, "DIA_Bilgot_TAKEYOUWITHME_05_01"); // Großartig! Es reicht mir schon, wenn du mich über die große Brücke am Fluss vor der belagerten Burg bringst. Den Rest schaff ich dann schon.
	// Joly: SC bringt den Typ bis zum Pass AI_Output(other, self, "DIA_Bilgot_TAKEYOUWITHME_15_02"); // Dann beeil dich!
	AI_Output(self, other, "DIA_Bilgot_TAKEYOUWITHME_05_03"); //我 准 备 好 了 ！。

	Npc_ExchangeRoutine(self, "FOLLOWTOOCBRIDGE");
	Bilgot.flags = 0;
	MIS_RescueBilgot = LOG_RUNNING;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info LaufSchneller
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_LAUFSCHNELLER(C_INFO)
{
	npc				= VLK_4120_Bilgot;
	nr				= 5;
	condition		= DIA_Bilgot_LAUFSCHNELLER_Condition;
	information		= DIA_Bilgot_LAUFSCHNELLER_Info;
	description		= "你 不 能 走 得 快 一 点 吗 ？！";
};

func int DIA_Bilgot_LAUFSCHNELLER_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Bilgot_TAKEYOUWITHME))
	&& ((Npc_KnowsInfo(other, DIA_Bilgot_BEIBRUECKEANGEKOMMEN)) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_LAUFSCHNELLER_Info()
{
	AI_Output(other, self, "DIA_Bilgot_LAUFSCHNELLER_15_00"); //你 不 能 走 得 快 一 点 吗 ？！
	AI_Output(self, other, "DIA_Bilgot_LAUFSCHNELLER_05_01"); //我 已 经 尽 可 能 的 快 了。
};

///////////////////////////////////////////////////////////////////////
//	Info BeiBrueckeAngekommen
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_BEIBRUECKEANGEKOMMEN(C_INFO)
{
	npc				= VLK_4120_Bilgot;
	nr				= 2;
	condition		= DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Condition;
	information		= DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Info;
	important		= TRUE;
};

func int DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Condition()
{
	if (Npc_GetDistToWP(self, "START") < 8000)
	{
		return TRUE;
	};
};

func void DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Info()
{
	AI_Output(other, self, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_00"); //好 的 ， 我 们 出 发 。 立 刻 上 路 。 这 个 地 方 太 热 了 ！
	AI_Output(self, other, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_01"); //谢 谢 你 ！
	AI_Output(other, self, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_02"); //别 被 怪 物 吃 掉 了 。 那 就 太 可 怜 了 。
	AI_Output(self, other, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_03"); //再 见 ！

	AI_StopProcessInfos(self);
	TschuessBilgot = TRUE;
	MIS_RescueBilgot = LOG_SUCCESS;
	B_GivePlayerXP(XP_BilgotEscort);

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self, "FLEEOUTOFOW");
};

///////////////////////////////////////////////////////////////////////
//	Info LetztePause
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_LetztePause(C_INFO)
{
	npc				= VLK_4120_Bilgot;
	nr				= 3;
	condition		= DIA_Bilgot_LetztePause_Condition;
	information		= DIA_Bilgot_LetztePause_Info;
	permanent		= TRUE;
	description		= "你 在 这 里 做 什 么 ？ 我 以 为 你 是 要 穿 过 关 卡 ？ ";
};

func int DIA_Bilgot_LetztePause_Condition()
{
	if (Npc_GetDistToWP(self, "START") < 1000)
	{
		return TRUE;
	};
};

func void DIA_Bilgot_LetztePause_Info()
{
	AI_Output(other, self, "DIA_Bilgot_LetztePause_15_00"); //你 在 这 里 做 什 么 ？ 我 以 为 你 是 要 穿 过 关 卡 ？
	AI_Output(self, other, "DIA_Bilgot_LetztePause_05_01"); //我 再 也 不 能 走 下 去 了 。 让 我 休 息 一 会 儿 。 我 能 应 付 的 。 别 担 心 ！
	AI_Output(other, self, "DIA_Bilgot_LetztePause_15_02"); //随 便 你 怎 么 说 。
	AI_Output(self, other, "DIA_Bilgot_LetztePause_05_03"); //只 是 休 息 一 下 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Olav
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_Olav(C_INFO)
{
	npc				= VLK_4120_Bilgot;
	nr				= 3;
	condition		= DIA_Bilgot_Olav_Condition;
	information		= DIA_Bilgot_Olav_Info;
	description		= "我 找 到 了 奥 莱 夫 。";
};

func int DIA_Bilgot_Olav_Condition()
{
	if ((Npc_HasItems(Olav, ITSE_Olav) == 0)
	&& (Npc_KnowsInfo(other, DIA_Bilgot_Job)))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_Olav_Info()
{
	AI_Output(other, self, "DIA_Bilgot_Olav_15_00"); //我 找 到 了 奥 莱 夫 。
	AI_Output(self, other, "DIA_Bilgot_Olav_05_01"); //他 在 干 什 么 ？
	AI_Output(other, self, "DIA_Bilgot_Olav_15_02"); //他 已 经 死 了 。 狼 群 把 他 吃 掉 了 。
	AI_Output(self, other, "DIA_Bilgot_Olav_05_03"); //哦 ， 该 死 。 我 希 望 至 少 我 能 想 办 法 离 开 这 里 。！

	B_GivePlayerXP(XP_Ambient);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Bilgot_PICKPOCKET(C_INFO)
{
	npc				= VLK_4120_Bilgot;
	nr				= 900;
	condition		= DIA_Bilgot_PICKPOCKET_Condition;
	information		= DIA_Bilgot_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Bilgot_PICKPOCKET_Condition()
{
	C_Beklauen(20, 30);
};

func void DIA_Bilgot_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bilgot_PICKPOCKET);
	Info_AddChoice(DIA_Bilgot_PICKPOCKET, DIALOG_BACK, DIA_Bilgot_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bilgot_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Bilgot_PICKPOCKET_DoIt);
};

func void DIA_Bilgot_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bilgot_PICKPOCKET);
};

func void DIA_Bilgot_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bilgot_PICKPOCKET);
};
