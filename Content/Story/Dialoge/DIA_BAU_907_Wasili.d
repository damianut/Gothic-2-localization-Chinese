// ************************************************************
// 							EXIT
// ************************************************************
instance DIA_Wasili_EXIT(C_INFO)
{
	npc				= BAU_907_Wasili;
	nr				= 999;
	condition		= DIA_Wasili_EXIT_Condition;
	information		= DIA_Wasili_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Wasili_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wasili_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 							Hallo
// ************************************************************
instance DIA_Wasili_HALLO(C_INFO)
{
	npc				= BAU_907_Wasili;
	nr				= 1;
	condition		= DIA_Wasili_HALLO_Condition;
	information		= DIA_Wasili_HALLO_Info;
	important		= TRUE;
};

func int DIA_Wasili_HALLO_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Wasili_HALLO_Info()
{
	AI_Output(self, other, "DIA_Wasili_HALLO_01_00"); //想 也 别 想 碰 这 里 的 任 何 东 西 一 下 。 否 则 你 脑 袋 就 要 遭 殃 了 ， 明 白 吗 ？
};

// ************************************************************
// 								Job
// ************************************************************
instance DIA_Wasili_Job(C_INFO)
{
	npc				= BAU_907_Wasili;
	nr				= 1;
	condition		= DIA_Wasili_Job_Condition;
	information		= DIA_Wasili_Job_Info;
	description		= "你 的 工 作 是 什 么 ？";
};

func int DIA_Wasili_Job_Condition()
{
	return TRUE;
};

func void DIA_Wasili_Job_Info()
{
	AI_Output(other, self, "DIA_Wasili_Job_15_00"); //你 的 工 作 是 什 么 ？
	AI_Output(self, other, "DIA_Wasili_Job_01_01"); //欧 纳 尔 让 我 整 天 都 看 着 他 的 东 西 。
	AI_Output(self, other, "DIA_Wasili_Job_01_02"); //他 担 心 有 某 些 东 西 会 丢 失 。 处 于 他 的 位 置 的 话 ， 我 也 会 有 同 样 的 担 心 。
	AI_Output(self, other, "DIA_Wasili_Job_01_03"); //他 雇 佣 的 大 部 分 雇 佣 兵 都 是 以 前 的 罪 犯 流 放 地 的 罪 犯 。
	AI_Output(self, other, "DIA_Wasili_Job_01_04"); //如 果 没 人 看 着 的 话 ， 他 们 会 把 任 何 没 有 锁 住 的 东 西 拿 走 。
};

// ************************************************************
// 								Sammler
// ************************************************************
instance DIA_Wasili_Sammler(C_INFO)
{
	npc				= BAU_907_Wasili;
	nr				= 4;
	condition		= DIA_Wasili_Sammler_Condition;
	information		= DIA_Wasili_Sammler_Info;
	description		= "这 里 有 一 堆 垃 圾 。";
};

func int DIA_Wasili_Sammler_Condition()
{
	return TRUE;
};

func void DIA_Wasili_Sammler_Info()
{
	AI_Output(other, self, "DIA_Wasili_Sammler_15_00"); //这 里 有 一 堆 垃 圾 。
	AI_Output(self, other, "DIA_Wasili_Sammler_01_01"); //那 就 对 了 ， 它 里 面 大 都 是 欧 纳 尔 收 集 的 贵 重物 品 。
	AI_Output(self, other, "DIA_Wasili_Sammler_01_02"); //像 我 这 样 普 通 的 人 根 本 不 可 能 买 得 起 那 样 的 奢 侈 品 。 我 还 是 去 做 其 它 事 吧 。
	AI_Output(other, self, "DIA_Wasili_Sammler_15_03"); //那 会 是 什 么 ？
	AI_Output(self, other, "DIA_Wasili_Sammler_01_04"); //我 收 集 旧 币。

	MIS_Wasili_BringOldCoin = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info FirstOldCoin
///////////////////////////////////////////////////////////////////////
instance DIA_Wasili_FirstOldCoin(C_INFO)
{
	npc				= BAU_907_Wasili;
	nr				= 5;
	condition		= DIA_Wasili_FirstOldCoin_Condition;
	information		= DIA_Wasili_FirstOldCoin_Info;
	permanent		= TRUE;
	description		= "我 在 这 里 找 到 一 枚 旧 的 硬 币。";
};

var int Wasili_BringOldCoin_NoMore;
func int DIA_Wasili_FirstOldCoin_Condition()
{
	if ((MIS_Wasili_BringOldCoin == LOG_RUNNING)
	&& (WasilisOldCoinOffer == 0)
	&& (Npc_HasItems(other, ItMi_OldCoin) >= 1)
	&& (Wasili_BringOldCoin_NoMore == FALSE))
	{
		return TRUE;
	};
};

var int WasilisOldCoinOffer;
var int FirstOldCoin_angebotenXP_OneTime;
var int DIA_Wasili_FirstOldCoin_mehr_OneTime;
func void DIA_Wasili_FirstOldCoin_Info()
{
	AI_Output(other, self, "DIA_Wasili_FirstOldCoin_15_00"); //我 在 这 里 找 到 一 枚 旧 的 硬 币。
	if (FirstOldCoin_angebotenXP_OneTime == FALSE)
	{
		AI_Output(self, other, "DIA_Wasili_FirstOldCoin_01_01"); //嗯 。 让 我 看 看 。
	};

	B_GiveInvItems(other, self, ItMi_OldCoin, 1);

	if (FirstOldCoin_angebotenXP_OneTime == FALSE)
	{
		AI_Output(self, other, "DIA_Wasili_FirstOldCoin_01_02"); //哦 ， 对 。 那 在 自 由 市 场 上 不 需 要 花 很 多 钱 。
	};

	if (DIA_Wasili_FirstOldCoin_mehr_OneTime == FALSE)
	{
		AI_Output(self, other, "DIA_Wasili_FirstOldCoin_01_03"); //我 用 一 个 金 币 买 它 。 就 和 它 原 来 的 价 值 完 全 相 同 。
	}
	else
	{
		AI_Output(self, other, "DIA_Wasili_FirstOldCoin_01_04"); //你 知 道 我 会 付 多 少 钱 买 它 ， 你 这 个 坏 蛋 。 一 个 金 币 ， 不 能 再 多 了 。
	};

	Info_ClearChoices(DIA_Wasili_FirstOldCoin);
	Info_AddChoice(DIA_Wasili_FirstOldCoin, "不 ， 那 么 我 想 我 可 以 留 下 它 。", DIA_Wasili_FirstOldCoin_nein);
	Info_AddChoice(DIA_Wasili_FirstOldCoin, "还 是不 够 ？ ２ 个 金 币 呢 ？", DIA_Wasili_FirstOldCoin_mehr);
	Info_AddChoice(DIA_Wasili_FirstOldCoin, "成 交 。", DIA_Wasili_FirstOldCoin_ok);

	if (FirstOldCoin_angebotenXP_OneTime == FALSE)
	{
		B_GivePlayerXP(XP_BringOldCoin);
		FirstOldCoin_angebotenXP_OneTime = TRUE;
	};
};

func void DIA_Wasili_FirstOldCoin_ok()
{
	AI_Output(other, self, "DIA_Wasili_FirstOldCoin_ok_15_00"); //成 交 。
	AI_Output(self, other, "DIA_Wasili_FirstOldCoin_ok_01_01"); //好 。

	if (WasilisOldCoinOffer == 2)
	{
		AI_Output(self, other, "DIA_Wasili_FirstOldCoin_ok_01_02"); //这 是 2 枚 金 币 。
	}
	else
	{
		AI_Output(self, other, "DIA_Wasili_FirstOldCoin_ok_01_03"); //如 果 你 还 有 更 多 的 旧币 话 ， 你 知 道 去 哪 里 找 我。
		WasilisOldCoinOffer = 1;
	};

	CreateInvItems(self, ItMi_Gold, WasilisOldCoinOffer);
	B_GiveInvItems(self, other, ItMi_Gold, WasilisOldCoinOffer);

	Info_ClearChoices(DIA_Wasili_FirstOldCoin);
};

func void DIA_Wasili_FirstOldCoin_mehr()
{
	AI_Output(other, self, "DIA_Wasili_FirstOldCoin_mehr_15_00"); //还 是不 够 ？ ２ 个 金 币 呢 ？

	if (DIA_Wasili_FirstOldCoin_mehr_OneTime == FALSE)
	{
		AI_Output(self, other, "DIA_Wasili_FirstOldCoin_mehr_01_01"); //不 行 ！ 我 可 不 傻 ！ 走 开 ！
		DIA_Wasili_FirstOldCoin_mehr_OneTime = TRUE;
		B_GiveInvItems(self, other, ItMi_OldCoin, 1);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, other, "DIA_Wasili_FirstOldCoin_mehr_01_02"); //啊 。 该 死 。 好 吧 。 每 个 旧 币 卖2枚 金 币 。 你 可 以 卖 给 我 ， 那 是 我 最 后 的 出 价 。
		WasilisOldCoinOffer = 2;
		Info_AddChoice(DIA_Wasili_FirstOldCoin, "那 样 看 来 ， ３ 个 金币 听 起 来 不 错 。", DIA_Wasili_FirstOldCoin_ZumTeufel);
	};
};

func void DIA_Wasili_FirstOldCoin_nein()
{
	AI_Output(other, self, "DIA_Wasili_FirstOldCoin_nein_15_00"); //不 ， 那 么 我 想 我 可 以 留 下 它。
	AI_Output(self, other, "DIA_Wasili_FirstOldCoin_nein_01_01"); //它 们 对 你 来 说 没 有 任 何 价 值 ， 你 会 回 来 的。
	B_GiveInvItems(self, other, ItMi_OldCoin, 1);
	WasilisOldCoinOffer = 0;
	Info_ClearChoices(DIA_Wasili_FirstOldCoin);
};

func void DIA_Wasili_FirstOldCoin_ZumTeufel()
{
	AI_Output(other, self, "DIA_Wasili_FirstOldCoin_ZumTeufel_15_00"); //那 样 看 来 ， ３ 个 金币 听 起 来 不 错 。
	AI_Output(self, other, "DIA_Wasili_FirstOldCoin_ZumTeufel_01_01"); //见 鬼 去 吧 ， 你 这 个 混 蛋 。
	AI_StopProcessInfos(self);
	Wasili_BringOldCoin_NoMore = TRUE;
	WasilisOldCoinOffer = 0;
};

///////////////////////////////////////////////////////////////////////
//	Info BringOldCoin
///////////////////////////////////////////////////////////////////////
instance DIA_Wasili_BringOldCoin(C_INFO)
{
	npc				= BAU_907_Wasili;
	nr				= 5;
	condition		= DIA_Wasili_BringOldCoin_Condition;
	information		= DIA_Wasili_BringOldCoin_Info;
	permanent		= TRUE;
	description		= "还 想 要 再 来 一 些 旧 币 吗 ？";
};

func int DIA_Wasili_BringOldCoin_Condition()
{
	if ((WasilisOldCoinOffer > 0)
	&& (Npc_HasItems(other, ItMi_OldCoin) >= 1)
	&& (Wasili_BringOldCoin_NoMore == FALSE))
	{
		return TRUE;
	};
};

var int OldCoinCounter;

func void DIA_Wasili_BringOldCoin_Info()
{
	AI_Output(other, self, "DIA_Wasili_BringOldCoin_15_00"); //还 想 要 再 来 一 些 旧 币 吗 ？
	AI_Output(self, other, "DIA_Wasili_BringOldCoin_01_01"); //当 然 。 你 还 有 吗 ？

	var int OldCoinCount;
	var int XP_BringOldCoins;
	var int OldCoinGeld;

	OldCoinCount = Npc_HasItems(other, ItMi_OldCoin);

	if (OldCoinCount == 1)
	{
		AI_Output(other, self, "DIA_Wasili_BringOldCoin_15_02"); //一 个 。
		B_GivePlayerXP(XP_BringOldCoin);
		B_GiveInvItems(other, self, ItMi_OldCoin, 1);
		OldCoinCounter = OldCoinCounter + 1;
	}
	else
	{
		AI_Output(other, self, "DIA_Wasili_BringOldCoin_15_03"); //几 个 。

		B_GiveInvItems(other, self, ItMi_OldCoin, OldCoinCount);

		XP_BringOldCoins = (OldCoinCount * XP_BringOldCoin);
		OldCoinCounter = (OldCoinCounter + OldCoinCount);

		B_GivePlayerXP(XP_BringOldCoins);
	};

	AI_Output(self, other, "DIA_Wasili_BringOldCoin_01_04"); //谢 谢 。 这 是 你 的 钱 。 你 能 找 到 多 少 都 给 我 拿 来 。

	OldCoinGeld = (OldCoinCount * WasilisOldCoinOffer);

	CreateInvItems(self, ItMi_Gold, OldCoinGeld);
	B_GiveInvItems(self, other, ItMi_Gold, OldCoinGeld);
};

// ************************************************************
// 								PERM
// ************************************************************
instance DIA_Wasili_PERM(C_INFO)
{
	npc				= BAU_907_Wasili;
	nr				= 900;
	condition		= DIA_Wasili_PERM_Condition;
	information		= DIA_Wasili_PERM_Info;
	permanent		= TRUE;
	description		= "曾 经 有 人 想 要 偷 走 任 何 东 西 吗 ？";
};

func int DIA_Wasili_PERM_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Wasili_Job))
	{
		return TRUE;
	};
};

func void DIA_Wasili_perm_Info()
{
	AI_Output(other, self, "DIA_Wasili_PERM_15_00"); //曾 经 有 人 想 要 偷 走 任 何 东 西 吗 ？

	if (Kapitel <= 2)
	{
		if (PETZCOUNTER_Farm_Theft > 0)
		{
			AI_Output(self, other, "DIA_Wasili_PERM_01_01"); //你 的 意 思 是 除 了 你 之 外 ？
		};

		AI_Output(self, other, "DIA_Wasili_PERM_01_02"); //几 个 ！ 我 把 它 们 都 打 倒 了 ！
	};

	if (Kapitel == 3)
	{
		AI_Output(self, other, "DIA_Wasili_PERM_01_03"); //几 天 前 的 夜 里 ， 一 个 雇 佣 兵 鬼 鬼 祟 祟 地 穿 过 房 子 。
		AI_Output(self, other, "DIA_Wasili_PERM_01_04"); //他 穿 了 一 件 带 兜 帽 的 长 袍 ， 所 以 我 没 认 出 来 。
		AI_Output(self, other, "DIA_Wasili_PERM_01_05"); //但 是 我 把 他 赶 跑 了 。
	};

	if (kapitel == 4)
	{
		AI_Output(self, other, "DIA_Wasili_perm_01_06"); //不 。 最 近 没 有 。
	};

	if (kapitel >= 5)
	{
		AI_Output(self, other, "DIA_Wasili_perm_01_07"); //雇 佣 兵 们 似 乎 准 备 离 开 营 地 。
		AI_Output(self, other, "DIA_Wasili_perm_01_08"); //如 果 李 和 他 的 人 连 夜 离 开 这 个 岛 的 话 ， 我 绝 对 不 会 觉 得 奇 怪 。
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Wasili_PICKPOCKET(C_INFO)
{
	npc				= BAU_907_Wasili;
	nr				= 900;
	condition		= DIA_Wasili_PICKPOCKET_Condition;
	information		= DIA_Wasili_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Wasili_PICKPOCKET_Condition()
{
	C_Beklauen(55, 90);
};

func void DIA_Wasili_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wasili_PICKPOCKET);
	Info_AddChoice(DIA_Wasili_PICKPOCKET, DIALOG_BACK, DIA_Wasili_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wasili_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Wasili_PICKPOCKET_DoIt);
};

func void DIA_Wasili_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Wasili_PICKPOCKET);
};

func void DIA_Wasili_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wasili_PICKPOCKET);
};
