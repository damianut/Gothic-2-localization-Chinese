// --------------------------------------------------------------------
//	Info EXIT
// --------------------------------------------------------------------
instance DIA_Addon_Fisk_EXIT(C_INFO)
{
	npc				= BDT_1097_Addon_Fisk;
	nr				= 999;
	condition		= DIA_Addon_Fisk_EXIT_Condition;
	information		= DIA_Addon_Fisk_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Fisk_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Fisk_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Fisk_PICKPOCKET(C_INFO)
{
	npc				= BDT_1097_Addon_Fisk;
	nr				= 900;
	condition		= DIA_Addon_Fisk_PICKPOCKET_Condition;
	information		= DIA_Addon_Fisk_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_120;
};

func int DIA_Addon_Fisk_PICKPOCKET_Condition()
{
	C_Beklauen(118, 300);
};

func void DIA_Addon_Fisk_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Fisk_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Fisk_PICKPOCKET, DIALOG_BACK, DIA_Addon_Fisk_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Fisk_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Fisk_PICKPOCKET_DoIt);
};

func void DIA_Addon_Fisk_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Fisk_PICKPOCKET);
};

func void DIA_Addon_Fisk_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Fisk_PICKPOCKET);
};

// --------------------------------------------------------------------
//	Info Hi
// --------------------------------------------------------------------
instance DIA_Addon_Fisk_Hi(C_INFO)
{
	npc				= BDT_1097_Addon_Fisk;
	nr				= 1;
	condition		= DIA_Addon_Fisk_Hi_Condition;
	information		= DIA_Addon_Fisk_Hi_Info;
	important		= TRUE;
};

func int DIA_Addon_Fisk_Hi_Condition()
{
	if (Npc_GetDistToWP(self, "BL_INN_UP_06") > 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Hi_Info()
{
	AI_Output(self, other, "DIA_Addon_Fisk_Hi_12_00"); //嘿 ， 如 果 你 想 在 营 地 这 里 找 个 象 样 的 商 人 的 话 ， 那 你 已 经 找 到 他 了 。
	AI_Output(self, other, "DIA_Addon_Fisk_Hi_12_01"); //我 的 小 屋 就 在 伊 斯 特 班 的 后 面 。 所 以 ， 如 果 你 需 要 任 何 东 西 的 话 ， 就 来 找 我 。

	Log_CreateTopic(Topic_Addon_BDT_Trader, LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader, Topic_Addon_BDT_Trader_2);

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "START");
};

// --------------------------------------------------------------------
//	Info Trade
// --------------------------------------------------------------------
instance DIA_Addon_Fisk_Trade(C_INFO)
{
	npc				= BDT_1097_Addon_Fisk;
	nr				= 888;
	condition		= DIA_Addon_Fisk_Trade_Condition;
	information		= DIA_Addon_Fisk_Trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= DIALOG_TRADE;
};

func int DIA_Addon_Fisk_Trade_Condition()
{
	if (Npc_GetDistToWP(self, "BL_INN_UP_06") > 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Trade_Info()
{
	B_Say(other, self, "$TRADE_2");
	B_GiveTradeInv(self);

	// Bolzen nachfüllen
	if (Npc_HasItems(self, ItRw_Bolt) < 50)
	{
		CreateInvItems(self, ItRw_Bolt,(50 - Npc_HasItems(self, ItRw_Bolt)));
	};

	// Pfeile nachfüllen
	if (Npc_HasItems(self, ItRw_Arrow) < 50)
	{
		CreateInvItems(self, ItRw_Arrow,(50 - Npc_HasItems(self, ItRw_Arrow)));
	};
};

// ---------------------------------------------------------------------
//	Info Attentat
// ---------------------------------------------------------------------
instance DIA_Addon_Fisk_Attentat(C_INFO)
{
	npc				= BDT_1097_Addon_Fisk;
	nr				= 2;
	condition		= DIA_Addon_Fisk_Attentat_Condition;
	information		= DIA_Addon_Fisk_Attentat_Info;
	description		= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};

func int DIA_Addon_Fisk_Attentat_Condition()
{
	if (MIS_Judas == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Attentat_Info()
{
	B_Say(other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self, other, "DIA_Addon_Fisk_Attentat_12_00"); //听 着 ， 那 种 生 意 我 绝 对 不 会 做 ， 明 白 吗 ？
	AI_Output(self, other, "DIA_Addon_Fisk_Attentat_12_01"); //（ 无 辜 的 ） 我 也 有 我 的 顾 虑 ， 我 本 身 就 是 个 受 害 人 。
	AI_Output(other, self, "DIA_Addon_Fisk_Attentat_15_02"); //你 出 什 么 事 了 ？
	AI_Output(self, other, "DIA_Addon_Fisk_Attentat_12_03"); //我 为 上 一 趟 货 物 付 了 一 大 笔 钱 。
	AI_Output(self, other, "DIA_Addon_Fisk_Attentat_12_04"); //但 是 它 一 直 没 到 ！ 有 些 卑 鄙 的 家 伙 把 它 抢 走 了 。
	AI_Output(self, other, "DIA_Addon_Fisk_Attentat_12_05"); //（ 愤 慨 的 ） 我 被 抢 劫 了 - 可 能 是 被 我 们 自 己 人 ！
};

// ---------------------------------------------------------------------
//	Lieferung
// ---------------------------------------------------------------------
instance DIA_Addon_Fisk_Lieferung(C_INFO)
{
	npc				= BDT_1097_Addon_Fisk;
	nr				= 3;
	condition		= DIA_Addon_Fisk_Lieferung_Condition;
	information		= DIA_Addon_Fisk_Lieferung_Info;
	description		= "什 么 种 类 的 货 物 ？";
};

func int DIA_Addon_Fisk_Lieferung_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Fisk_Attentat))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Lieferung_Info()
{
	AI_Output(other, self, "DIA_Addon_Fisk_Lieferung_15_00"); //什 么 种 类 的 货 物 ？
	AI_Output(self, other, "DIA_Addon_Fisk_Lieferung_12_01"); //一 包 开 锁 工 具 。 应 该 有 人 从 海 盗 那 里 把 它 给 我 弄 来 。
	AI_Output(self, other, "DIA_Addon_Fisk_Lieferung_12_02"); //但 是 有 个 叫 胡 安 的 家 伙 把 它 从 我 这 里 抢 走 了 。 （ 生 气 ） 包 括 我 为 它 支 付 的 金 币 ！
	AI_Output(self, other, "DIA_Addon_Fisk_Lieferung_12_03"); //那 个 混 蛋 藏 在 沼 泽 里 的 某 个 地 方 。

	MIS_Lennar_Lockpick = LOG_RUNNING;

	Log_CreateTopic(Topic_Addon_Fisk, LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Fisk, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_KillJuan, TOPIC_Addon_KillJuan_1);
	Log_AddEntry(Topic_Addon_Fisk, Topic_Addon_Fisk_1);
};

// ---------------------------------------------------------------------
//	Paket abgeben
// ---------------------------------------------------------------------
func void B_Addon_Fisk_AboutJuan()
{
	if (Npc_IsDead(Juan))
	{
		AI_Output(other, self, "DIA_Addon_Fisk_AboutJuan_15_00"); //他 死 了 。
		AI_Output(self, other, "DIA_Addon_Fisk_AboutJuan_12_01"); //好 ， 那 么 他 不 会 再 给 我 惹 麻 烦 了 ！
	}
	else
	{
		AI_Output(other, self, "DIA_Addon_Fisk_AboutJuan_15_02"); //他 还 活 着 … …
		AI_Output(self, other, "DIA_Addon_Fisk_AboutJuan_12_03"); //你 让 那 头 猪 活 着 ？
		AI_Output(other, self, "DIA_Addon_Fisk_AboutJuan_15_04"); //他 不 是 一 个 人 … …
		AI_Output(self, other, "DIA_Addon_Fisk_AboutJuan_12_05"); //别 在 意 - 我 无 论 如 何 都 能 解 决 那 些 卑 鄙 的 家 伙 … …
	};
};

// ---------------------------------------------------------------------
func void B_Addon_Fisk_Belohnung()
{
	AI_Output(self, other, "DIA_Addon_Fisk_Belohnung_12_00"); //只 要 和 你 有 关 … …
	AI_Output(self, other, "DIA_Addon_Fisk_Belohnung_12_01"); //我 和 胡 诺 的 关 系 相 当 好 。
	AI_Output(self, other, "DIA_Addon_Fisk_Belohnung_12_02"); //我 会 保 证 从 现 在 起 ， 你 能 买 到 便 宜 的 盔 甲 。
	Huno_ArmorCheap = TRUE;

	if (other.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Addon_Fisk_Belohnung_12_03"); //给 ， 我 以 前 从 科 瑞 斯 托 那 里 得 到 这 块 石 头 。
		AI_Output(self, other, "DIA_Addon_Fisk_Belohnung_12_04"); //它 是 我 逃 离 屏 障 时 身 上 唯 一 的 东 西 。 我 想 你 拿 着 它 比 我 更 有 用 。
		B_GiveInvItems(self, other, ItMi_RuneBlank, 1);
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Fisk_Belohnung_12_05"); //同 时 ， 我 还 会 给 你 一 件 我 的 武 器 。

		if (other.HitChance[NPC_TALENT_2H] > other.HitChance[NPC_TALENT_1H])
		{
			B_GiveInvItems(self, other, ItMw_Streitaxt1, 1);
		}
		else // 1h größer oder beide gleich
		{
			B_GiveInvItems(self, other, ItMw_Bartaxt, 1);
		};
	};

	AI_Output(self, other, "DIA_Addon_Fisk_Belohnung_12_06"); //（ 顽 皮 的 ） 互 相 帮 助 - 从 那 时 起 ， 这 一 直 没 变 。
};

// ---------------------------------------------------------------------
instance DIA_Addon_Fisk_GivePaket(C_INFO)
{
	npc				= BDT_1097_Addon_Fisk;
	nr				= 4;
	condition		= DIA_Addon_Fisk_GivePaket_Condition;
	information		= DIA_Addon_Fisk_GivePaket_Info;
	description		= "我 有 你 的 包 裹 。";
};

func int DIA_Addon_Fisk_GivePaket_Condition()
{
	if ((MIS_Lennar_Lockpick == LOG_RUNNING)
	&& (Npc_HasItems(other, ItMi_Addon_Lennar_Paket) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_GivePaket_Info()
{
	AI_Output(other, self, "DIA_Addon_Fisk_GivePaket_15_00"); //我 有 你 的 包 裹 。
	B_GiveInvItems(other, self, ItMi_Addon_Lennar_Paket, 1);

	MIS_Lennar_Lockpick = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_LennarPaket);

	AI_Output(self, other, "DIA_Addon_Fisk_GivePaket_12_01"); //（ 高 兴 的 ） 的 确 ！ （ 怀 疑 的 ） 那 么 胡 安 怎 么 办 ？

	B_Addon_Fisk_AboutJuan();

	B_Addon_Fisk_Belohnung();
};

// ---------------------------------------------------------------------
//	Paket OPEN -
// ---------------------------------------------------------------------
instance DIA_Addon_Fisk_PaketOpen(C_INFO)
{
	npc				= BDT_1097_Addon_Fisk;
	nr				= 5;
	condition		= DIA_Addon_Fisk_PaketOpen_Condition;
	information		= DIA_Addon_Fisk_PaketOpen_Info;
	description		= "我 打 开 了 你 的 包 裹 ！";
};

func int DIA_Addon_Fisk_PaketOpen_Condition()
{
	if ((MIS_Lennar_Lockpick == LOG_RUNNING)
	&& (LennarPaket_Open == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_PaketOpen_Info()
{
	AI_Output(other, self, "DIA_Addon_Fisk_PaketOpen_15_00"); //我 打 开 了 你 的 包 裹 ！
	AI_Output(self, other, "DIA_Addon_Fisk_PaketOpen_12_01"); //（ 大 笑 ） 当 然 ！ 你 已 经 等 不 及 了 ， 是 吗 ？
	AI_Output(self, other, "DIA_Addon_Fisk_PaketOpen_12_02"); //你 还 有 开 锁 工 具 ？
	AI_Output(self, other, "DIA_Addon_Fisk_PaketOpen_12_03"); //还 有 更 重 要 的 ， 胡 安 怎 么 办 ？

	B_Addon_Fisk_AboutJuan();
};

// ---------------------------------------------------------------------
//	- Dietriche abgeben!
// ---------------------------------------------------------------------
instance DIA_Addon_Fisk_GivePicks(C_INFO)
{
	npc				= BDT_1097_Addon_Fisk;
	nr				= 6;
	condition		= DIA_Addon_Fisk_GivePicks_Condition;
	information		= DIA_Addon_Fisk_GivePicks_Info;
	permanent		= TRUE;
	description		= "这 有 一 打 开 锁 工 具 … …";
};

func int DIA_Addon_Fisk_GivePicks_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Fisk_PaketOpen))
	&& (MIS_Lennar_Lockpick == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_GivePicks_Info()
{
	AI_Output(other, self, "DIA_Addon_Fisk_GivePicks_15_00"); //这 有 一 打 开 锁 工 具 … …

	if (B_GiveInvItems(other, self, itke_lockpick, 12))
	{
		AI_Output(self, other, "DIA_Addon_Fisk_GivePicks_12_01"); //非 常 好 。 已 经 有 人 在 等 新 商 品 了 。
		B_Addon_Fisk_Belohnung();

		MIS_Lennar_Lockpick = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_LennarPaket);
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Fisk_GivePicks_12_02"); //那 不 够 一 打 ！ （ 狡 诈 的 ） 你 不 是 想 欺 骗 我 的 ， 是 吗 ？
	};
};

// ---------------------------------------------------------------------
//	Inspektor
// ---------------------------------------------------------------------
instance DIA_Addon_Fisk_Inspektor(C_INFO)
{
	npc				= BDT_1097_Addon_Fisk;
	nr				= 7;
	condition		= DIA_Addon_Fisk_Inspektor_Condition;
	information		= DIA_Addon_Fisk_Inspektor_Info;
	description		= "胡 安 为 伊 斯 特 班 工 作 ！";
};

func int DIA_Addon_Fisk_Inspektor_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Fisk_Lieferung))
	&& (Npc_KnowsInfo(other, DIA_Addon_Tom_Esteban)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Inspektor_Info()
{
	AI_Output(other, self, "DIA_Addon_Fisk_Inspektor_15_00"); //胡 安 为 伊 斯 特 班 工 作 ！
	AI_Output(self, other, "DIA_Addon_Fisk_Inspektor_12_01"); //（ 吃 惊 的 ） 什 么 ？
	AI_Output(other, self, "DIA_Addon_Fisk_Inspektor_15_02"); //别 跟 我 耍 花 样 ！ 你 知 道 的 ！
	AI_Output(self, other, "DIA_Addon_Fisk_Inspektor_12_03"); //（ 平 静 的 ） 好 。 你 是 对 的 。 但 是 我 希 望 你 也 知 道 了 我 为 什 么 没 有 告 诉 你 。
	AI_Output(self, other, "DIA_Addon_Fisk_Inspektor_12_04"); //营 地 的 每 个 人 都 知 道 你 为 伊 斯 特 班 工 作 。
	AI_Output(self, other, "DIA_Addon_Fisk_Inspektor_12_05"); //我 一 点 也 不 想 被 牵 扯 到 这 件 事 中 ， 就 是 因 为 你 太 热 衷 于 得 到 一 块 红 石 头 。

	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
	Info_AddChoice(DIA_Addon_Fisk_Inspektor, "我 不 是 真 的 为 伊 斯 特 班 工 作 … … ", DIA_Addon_Fisk_Inspektor_AntiEsteban);
	Info_AddChoice(DIA_Addon_Fisk_Inspektor, "我 不 相 信 你 ！", DIA_Addon_Fisk_Inspektor_DontBelieve);
	Info_AddChoice(DIA_Addon_Fisk_Inspektor, "我 明 白 了 ！", DIA_Addon_Fisk_Inspektor_ISee);
};

func void DIA_Addon_Fisk_Inspektor_ISee()
{
	AI_Output(other, self, "DIA_Addon_Fisk_Inspektor_ISee_15_00"); //我 明 白 了 ！
	AI_Output(self, other, "DIA_Addon_Fisk_Inspektor_ISee_12_01"); //好 ！ 那 就 这 样 吧 。 我 们 不 想 被 偷 听 到 ！

	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_DontBelieve()
{
	AI_Output(other, self, "DIA_Addon_Fisk_Inspektor_DontBelieve_15_00"); //我 不 相 信 你 ！
	AI_Output(self, other, "DIA_Addon_Fisk_Inspektor_DontBelieve_12_01"); //相 信 你 想 要 的 ！ 但 是 我 警 告 你 ， 如 果 你 打 算 告 诉 伊 斯 特 班 一 些 关 于 我 的 虚 构 的 故 事 的 话 ， 你 就 是 下 一 个 ！

	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_AntiEsteban()
{
	AI_Output(other, self, "DIA_Addon_Fisk_Inspektor_AntiEsteban_15_00"); //我 不 是 真 的 为 伊 斯 特 班 工 作 … …
	AI_Output(self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_01"); //真 的 ？ 你 想 蒙 蔽 那 个 老 猪 头 ？
	AI_Output(self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_02"); //那 我 会 给 你 一 些 好 的 建 议 ， 你 要 记 住 。
	AI_Output(self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_03"); //在 靠 近 伊 斯 特 班 的 时 候 ， 不 要 相 信 任 何 人 - 甚 至 包 括 我 ， 明 白 吗 ？
	AI_Output(self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_04"); //现 在 足 够 了 - 我 们 不 想 被 别 人 听 到 ！

	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
};

// --------------------------------------------------------------------
//	Info Meeting
// --------------------------------------------------------------------
instance DIA_Addon_Fisk_Meeting(C_INFO)
{
	npc				= BDT_1097_Addon_Fisk;
	nr				= 2;
	condition		= DIA_Addon_Fisk_Meeting_Condition;
	information		= DIA_Addon_Fisk_Meeting_Info;
	description		= "那 么 是 你 指 使 的 攻 击 。";
};

func int DIA_Addon_Fisk_Meeting_Condition()
{
	if ((Npc_GetDistToWP(self, "BL_INN_UP_06") <= 500)
	&& (Npc_IsInState(self, ZS_Talk))
	&& (MIS_Judas == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Meeting_Info()
{
	AI_Output(other, self, "DIA_Addon_Fisk_Meeting_15_00"); //那 么 是 你 指 使 的 攻 击 。
	AI_Output(self, other, "DIA_Addon_Fisk_Meeting_12_01"); //是 的 。 伊 斯 特 班 妨 碍 了 我 的 生 意 。
	AI_Output(self, other, "DIA_Addon_Fisk_Meeting_12_02"); //他 不 会 让 任 何 为 我 工 作 的 强 盗 进 入 矿 井 。 他 要 保 证 所 有 人 都 为 他 工 作 - 只 为 他 。
	AI_Output(self, other, "DIA_Addon_Fisk_Meeting_12_03"); //那 样 的 话 ， 他 可 以 私 吞 每 一 笔 交 易 ， 并 控 制 整 个 营 地 。

	Info_ClearChoices(DIA_Addon_Fisk_Meeting);

	Info_AddChoice(DIA_Addon_Fisk_Meeting, "你 打 算 做 什 么 ？", DIA_Addon_Fisk_Meeting_now);
	Info_AddChoice(DIA_Addon_Fisk_Meeting, "你 要 取 代 他 的 位 置 ？", DIA_Addon_Fisk_Meeting_You);
	if (!Npc_IsDead(Esteban))
	{
		Info_AddChoice(DIA_Addon_Fisk_Meeting, "我 可 以 把 你 出 卖 给 伊 斯 特 班 … …", DIA_Addon_Fisk_Meeting_sell);
	};
};

func void DIA_Addon_Fisk_Meeting_You()
{
	AI_Output(other, self, "DIA_Addon_Fisk_Meeting_You_15_00"); //你 要 取 代 他 的 位 置 ？
	AI_Output(self, other, "DIA_Addon_Fisk_Meeting_You_12_01"); //不 ， 我 是 一 个 商 人 - 我 只 想 平 静 地 做 我 的 生 意 。
};

func void DIA_Addon_Fisk_Meeting_sell()
{
	AI_Output(other, self, "DIA_Addon_Fisk_Meeting_sell_15_00"); //我 可 以 把 你 出 卖 给 伊 斯 特 班 … …
	AI_Output(self, other, "DIA_Addon_Fisk_Meeting_sell_12_01"); //然 后 呢 ？ 你 觉 得 然 后 会 发 生 什 么 ？ 你 以 为 他 会 给 你 你 想 要 的 一 切 吗 ？
	AI_Output(self, other, "DIA_Addon_Fisk_Meeting_sell_12_02"); //算 了 吧 - 我 有 一 个 更 好 的 计 划 。
};

func void DIA_Addon_Fisk_Meeting_now()
{
	AI_Output(other, self, "DIA_Addon_Fisk_Meeting_now_15_00"); //你 打 算 做 什 么 ？

	if (!Npc_IsDead(Esteban))
	{
		AI_Output(self, other, "DIA_Addon_Fisk_Meeting_now_12_01"); //我 们 要 把 伊 斯 特 班 从 我 们 的 路 上 踢 开 。 那 就 是 说 ， 你 要 杀 掉 他 ， 并 取 代 他 的 位 置 。
		AI_Output(other, self, "DIA_Addon_Fisk_Meeting_now_15_02"); //只 要 他 的 保 镖 跟 着 他 ， 我 就 没 有 一 点 机 会 。
		AI_Output(self, other, "DIA_Addon_Fisk_Meeting_now_12_03"); //那 么 我 们 必 须 让 他 们 离 开 - 说 出 真 相 。
		AI_Output(other, self, "DIA_Addon_Fisk_Meeting_now_15_04"); //什 么 真 相 ？
		AI_Output(self, other, "DIA_Addon_Fisk_Meeting_now_12_05"); //你 完 成 你 的 工 作 。 你 知 道 我 是 那 次 袭 击 的 策 划 者 。
		AI_Output(self, other, "DIA_Addon_Fisk_Meeting_now_12_06"); //告 诉 伊 斯 特 班 ， 然 后 他 会 派 他 的 人 来 杀 我 。 我 就 在 这 里 等 他 们 。
		AI_Output(self, other, "DIA_Addon_Fisk_Meeting_now_12_07"); //等 他 们 离 开 的 时 候 ， 你 就 可 以 解 决 那 个 混 蛋 ， 而 我 来 处 理 那 些 卫 兵 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Fisk_Meeting_now_12_08"); //伊 斯 特 班 死 了 。 我 又 可 以 全 心 地 做 生 意 了 … …
		AI_Output(self, other, "DIA_Addon_Fisk_Meeting_now_12_09"); //给 ， 这 是 给 你 的 … …
		B_GiveInvItems(self, other, itmi_gold, 500);
	};

	Info_ClearChoices(DIA_Addon_Fisk_Meeting);
	MIS_Judas = LOG_SUCCESS;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "AMBUSH");
	B_LogEntry(Topic_Addon_Esteban, Topic_Addon_Esteban_7);
};

// --------------------------------------------------------------------
//	Info Sieg
// --------------------------------------------------------------------
instance DIA_Addon_Fisk_Sieg(C_INFO)
{
	npc				= BDT_1097_Addon_Fisk;
	nr				= 2;
	condition		= DIA_Addon_Fisk_Sieg_Condition;
	information		= DIA_Addon_Fisk_Sieg_Info;
	description		= "伊 斯 特 班 已 经 被 解 决 了 。";
};

func int DIA_Addon_Fisk_Sieg_Condition()
{
	if ((MIS_Judas == LOG_SUCCESS)
	&& Npc_IsDead(Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Sieg_Info()
{
	AI_Output(other, self, "DIA_Addon_Fisk_Sieg_15_00"); //伊 斯 特 班 已 经 被 解 决 了 。
	AI_Output(self, other, "DIA_Addon_Fisk_Sieg_12_01"); //我 已 经 等 这 个 很 久 了 。
	AI_Output(self, other, "DIA_Addon_Fisk_Sieg_12_02"); //我 想 你 现 在 已 经 有 事 要 做 ， 而 我 需 要 回 去 做 生 意 。
	AI_Output(self, other, "DIA_Addon_Fisk_Sieg_12_03"); //所 以 ， 如 果 你 需 要 其 它 任 何 东 西 的 话 ， 你 知 道 去 哪 里 找 我 。

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "START");
	B_GivePlayerXP(XP_Ambient);
};
