///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Attila_EXIT(C_INFO)
{
	npc				= VLK_494_Attila;
	nr				= 999;
	condition		= DIA_Attila_EXIT_Condition;
	information		= DIA_Attila_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Attila_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Attila_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Attila_PICKPOCKET(C_INFO)
{
	npc				= VLK_494_Attila;
	nr				= 900;
	condition		= DIA_Attila_PICKPOCKET_Condition;
	information		= DIA_Attila_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Attila_PICKPOCKET_Condition()
{
	C_Beklauen(55, 100);
};

func void DIA_Attila_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Attila_PICKPOCKET);
	Info_AddChoice(DIA_Attila_PICKPOCKET, DIALOG_BACK, DIA_Attila_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Attila_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Attila_PICKPOCKET_DoIt);
};

func void DIA_Attila_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Attila_PICKPOCKET);
};

func void DIA_Attila_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Attila_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo -> wenn Spieler Mist gebaut hat
///////////////////////////////////////////////////////////////////////
instance DIA_Attila_Hallo(C_INFO)
{
	npc				= VLK_494_Attila;
	nr				= 1;
	condition		= DIA_Attila_Hallo_Condition;
	information		= DIA_Attila_Hallo_Info;
	important		= TRUE;
};

func int DIA_Attila_Hallo_Condition()
{
	if (MIS_ThiefGuild_sucked == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Attila_Hallo_Info()
{
	AI_Output(self, other, "DIA_Attila_Hallo_09_00"); //（ 平 静 地 ） 啊 - 终 于 来 了 。 我 一 直 在 等 你 ， 陌 生 人 。

	Info_ClearChoices(DIA_Attila_Hallo);
	Info_AddChoice(DIA_Attila_Hallo, "你 想 从 我 这 里 得 到 些 什 么 ？ ", DIA_Attila_Hallo_Was);
	Info_AddChoice(DIA_Attila_Hallo, "你 是 谁 ？", DIA_Attila_Hallo_Wer);

	B_GivePlayerXP(XP_Attila_MetHim);
};

func void DIA_Attila_Hallo_Wer()
{
	AI_Output(other, self, "DIA_Attila_Hallo_Wer_15_00"); //你 是 谁 ？
	AI_Output(self, other, "DIA_Attila_Hallo_Wer_09_01"); //我 叫 阿 提 拉 … … 但 是 我 的 名 字 很 重 要 吗 ？ 我 们 的 名 字 毫 无 疑 义 。
	AI_Output(self, other, "DIA_Attila_Hallo_Wer_09_02"); //你 应 该 更 清 楚 ， 陌 生 人 。 （ 秘 密 地 笑 ）

	Knows_Attila_Wer = TRUE;

	Info_ClearChoices(DIA_Attila_Hallo);
	if (Knows_Attila_Was == FALSE)
	{
		Info_AddChoice(DIA_Attila_Hallo, "你 想 从 我 这 里 得 到 些 什 么 ？ ", DIA_Attila_Hallo_Was);
	};

	Info_AddChoice(DIA_Attila_Hallo, "这 出 闹 剧 是 怎 么 回 事 ？", DIA_Attila_Hallo_Theater);
};

func void DIA_Attila_Hallo_Was()
{
	AI_Output(other, self, "DIA_Attila_Hallo_Was_15_00"); //你 想 从 我 这 里 得 到 些 什 么 ？
	AI_Output(self, other, "DIA_Attila_Hallo_Was_09_01"); //我 在 这 里 向 你 解 释 一 些 事 情 。 然 后 ， 我 将 要 杀 了 你 。
	Knows_Attila_Was = TRUE;

	Info_ClearChoices(DIA_Attila_Hallo);
	if (Knows_Attila_Wer == FALSE)
	{
		Info_AddChoice(DIA_Attila_Hallo, "你 是 谁 ？", DIA_Attila_Hallo_Wer);
	};

	Info_AddChoice(DIA_Attila_Hallo, "谁 付 钱 让 你 这 么 做 ？ ", DIA_Attila_Hallo_Auftrag);
	Info_AddChoice(DIA_Attila_Hallo, "这 出 闹 剧 是 怎 么 回 事 ？", DIA_Attila_Hallo_Theater);
};

func void DIA_Attila_Hallo_Theater()
{
	AI_Output(other, self, "DIA_Attila_Hallo_Theater_15_00"); //这 出 闹 剧 是 怎 么 回 事 ？
	AI_Output(self, other, "DIA_Attila_Hallo_Theater_09_01"); //你 不 应 该 在 旅 程 的 终 点 无 知 地 死 去 。 就 把 它 看 成 是 对 被 判 刑 的 人 最 后 的 问 候 吧 。

	Info_ClearChoices(DIA_Attila_Hallo);
	Info_AddChoice(DIA_Attila_Hallo, "我 现 在 要 离 开 了 。 （ 结 束 ）", DIA_Attila_Hallo_Ende);
	Info_AddChoice(DIA_Attila_Hallo, "谁 付 钱 让 你 这 么 做 ？ ", DIA_Attila_Hallo_Auftrag);
	Info_AddChoice(DIA_Attila_Hallo, "你 为 什 么 要 杀 我 ？ ", DIA_Attila_Hallo_Warum);
};

func void DIA_Attila_Hallo_Ende()
{
	AI_Output(other, self, "DIA_Attila_Hallo_Ende_15_00"); //我 现 在 要 离 开 了 … …
	AI_Output(self, other, "DIA_Attila_Hallo_Ende_09_01"); //恐 怕 … … 我 不 允 许 那 样 。 放 弃 吧 ， 该 去 死 了 。
	AI_DrawWeapon(self);

	Info_ClearChoices(DIA_Attila_Hallo);
	Info_AddChoice(DIA_Attila_Hallo, "谁 付 钱 让 你 这 么 做 ？ ", DIA_Attila_Hallo_Auftrag);
	Info_AddChoice(DIA_Attila_Hallo, "你 为 什 么 要 杀 我 ？ ", DIA_Attila_Hallo_Warum);
};

func void DIA_Attila_Hallo_Auftrag()
{
	AI_Output(other, self, "DIA_Attila_Hallo_Auftrag_15_00"); //谁 付 钱 让 你 这 么 做 ？
	AI_Output(self, other, "DIA_Attila_Hallo_Auftrag_09_01"); //我 的 雇 主 们 不 适 宜 在 公 众 场 所 露 面 ， 我 也 一 样 。
	AI_Output(self, other, "DIA_Attila_Hallo_Auftrag_09_02"); //我 的 合 约 条 款 里 面 包 括 ， 我 既 不 能 说 出 他 们 的 名 字 ， 也 不 能 说 出 他 们 的 住 所 。

	Info_ClearChoices(DIA_Attila_Hallo);
	Info_AddChoice(DIA_Attila_Hallo, "你 为 什 么 要 杀 我 ？ ", DIA_Attila_Hallo_Warum);
};

func void DIA_Attila_Hallo_Warum()
{
	AI_Output(other, self, "DIA_Attila_Hallo_Warum_15_00"); //你 为 什 么 要 杀 我 ？

	if (Betrayal_Halvor == TRUE)
	{
		AI_Output(self, other, "DIA_Attila_Hallo_Warum_09_01"); //你 向 哈 尔 沃 去 告 密 吧 。 现 在 他 正 坐 在 牢 房 里 。 那 不 是 计 划 的 一 部 分 。
	};

	if (Rengaru_InKnast == TRUE)
	{
		AI_Output(self, other, "DIA_Attila_Hallo_Warum_09_02"); //你 把 伦 加 鲁 出 卖 给 了 城 市 。 他 是 个 微 不 足 道 的 小 偷 ， 但 是 ， 你 不 应 该 那 么 做 。
	};

	if (Nagur_Ausgeliefert == TRUE)
	{
		AI_Output(self, other, "DIA_Attila_Hallo_Warum_09_03"); //因 为 你 的 干 预 ， 纳 格 现 在 正 关 在 铁 窗 后 面 。 这 是 一 个 不 可 原 谅 的 错 误 ， 有 些 人 看 到 了 这 一 点 。
	};

	AI_Output(self, other, "DIA_Attila_Hallo_Warum_09_04"); //我 的 雇 主 对 此 非 常 不 满 。 为 了 防 止 你 继 续 犯 其 它 错 误 ， 他 们 派 我 来 了 。

	Info_ClearChoices(DIA_Attila_Hallo);
	Info_AddChoice(DIA_Attila_Hallo, "我 可 以 给 你 钱 … … ", DIA_Attila_Hallo_Gold);
	Info_AddChoice(DIA_Attila_Hallo, "至 少 让 我 把 武 器 拔 出 来 。 ", DIA_Attila_Hallo_Attacke);
};

func void DIA_Attila_Hallo_Gold()
{
	AI_Output(other, self, "DIA_Attila_Hallo_Gold_15_00"); //我 可 以 给 你 金 币 - 很 多 的 金 币 。
	AI_Output(self, other, "DIA_Attila_Hallo_Gold_09_01"); //没 有 用 。 那 不 是 我 来 的 目 的 。 你 要 付 出 的 唯 一 代 价 就 是 你 的 生 命 。 就 是 现 在 。
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_Attila_Hallo_Attacke()
{
	AI_Output(other, self, "DIA_Attila_Hallo_Attacke_15_00"); //至 少 让 我 把 武 器 拔 出 来 。
	if (Npc_HasEquippedWeapon(other) == TRUE)
	{
		AI_Output(self, other, "DIA_Attila_Hallo_Attacke_09_01"); //很 好 ， 那 准 备 你 的 最 后 一 战 吧 。
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_NONE, 1);
	}
	else
	{
		AI_Output(self, other, "DIA_Attila_Hallo_Attacke_09_02"); //你 甚 至 还 没 系 上 你 的 腰 带 。 你 没 剩 多 少 时 间 了 ， 陌 生 人 。 死 亡 在 等 着 你 。
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_NONE, 2);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Willkommen Schlüssel für die Diebesgilde
///////////////////////////////////////////////////////////////////////
instance DIA_Attila_Willkommen(C_INFO)
{
	npc				= VLK_494_Attila;
	nr				= 1;
	condition		= DIA_Attila_Willkommen_Condition;
	information		= DIA_Attila_Willkommen_Info;
	important		= TRUE;
};

func int DIA_Attila_Willkommen_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (MIS_ThiefGuild_sucked == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Attila_Willkommen_Info()
{
	AI_Output(self, other, "DIA_Attila_Willkommen_09_00"); //啊 - 终 于 来 了 。 我 一 直 在 等 你 ， 陌 生 人 。
	B_GivePlayerXP(XP_Attila_Friend);
	AI_Output(other, self, "DIA_Attila_Willkommen_15_01"); //你 是 谁 ， 你 想 从 我 这 里 得 到 些 什 么 ？
	AI_Output(self, other, "DIA_Attila_Willkommen_09_02"); //那 不 重 要 。 重 要 的 是 你 做 过 什 么 。 你 还 保 留 了 一 点 忠 诚 - 即 使 你 没 有 意 识 到 它 。
	AI_Output(self, other, "DIA_Attila_Willkommen_09_03"); //一 些 捐 助 者 已 经 看 到 了 你 的 忠 诚 。 他 们 向 你 提 供 了 一 个 机 会 。 所 以 好 好 使 用 它 。
	AI_Output(other, self, "DIA_Attila_Willkommen_15_04"); //嘿 ， 马 上 告 诉 我 你 为 什 么 在 这 里 。
	AI_Output(self, other, "DIA_Attila_Willkommen_09_05"); //我 有 一 个 礼 物 给 你 。 其 它 所 有 事 情 就 要 靠 你 了 ， 陌 生 人 。 （ 秘 密 地 笑 ）

	B_GiveInvItems(self, other, ItKe_ThiefGuildKey_MIS, 1);
	Attila_Key = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "AFTER");
};

///////////////////////////////////////////////////////////////////////
//	Info Nach Schluessel Übergabe
///////////////////////////////////////////////////////////////////////
instance DIA_Attila_NachSchluessel(C_INFO)
{
	npc				= VLK_494_Attila;
	nr				= 1;
	condition		= DIA_Attila_NachSchluessel_Condition;
	information		= DIA_Attila_NachSchluessel_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Attila_NachSchluessel_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Attila_Wer))
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Attila_NachSchluessel_Info()
{
	AI_Output(self, other, "DIA_Attila_NachSchluessel_09_00"); //我 的 任 务 完 成 了 - 现 在 。
	AI_Output(self, other, "DIA_Attila_NachSchluessel_09_01"); //但 谁 知 道 呢 ， 也 许 我 们 还 会 再 见 … …
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Nach Schluessel Übergabe Wer bist du?
///////////////////////////////////////////////////////////////////////
instance DIA_Attila_Wer(C_INFO)
{
	npc				= VLK_494_Attila;
	nr				= 1;
	condition		= DIA_Attila_Wer_Condition;
	information		= DIA_Attila_Wer_Info;
	description		= "你 是 谁 ？";
};

func int DIA_Attila_Wer_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Attila_Willkommen))
	{
		return TRUE;
	};
};

func void DIA_Attila_Wer_Info()
{
	AI_Output(other, self, "DIA_Attila_Hallo_Wer_15_00"); //你 是 谁 ？
	AI_Output(self, other, "DIA_Attila_Hallo_Wer_09_01"); //我 叫 阿 提 拉 … … 但 是 我 的 名 字 很 重 要 吗 ？ 我 们 的 名 字 毫 无 疑 义 。
	AI_Output(self, other, "DIA_Attila_Hallo_Wer_09_02"); //你 应 该 更 清 楚 ， 陌 生 人 。 （ 秘 密 地 笑 ）

	AI_StopProcessInfos(self);
};
