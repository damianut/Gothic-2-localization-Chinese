// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Bennet_EXIT(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 999;
	condition		= DIA_Bennet_EXIT_Condition;
	information		= DIA_Bennet_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Bennet_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Bennet_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				  Hallo
// ************************************************************
instance DIA_Bennet_HALLO(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 1;
	condition		= DIA_Bennet_HALLO_Condition;
	information		= DIA_Bennet_HALLO_Info;
	important		= TRUE;
};

func int DIA_Bennet_HALLO_Condition()
{
	if ((Kapitel < 3)
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_HALLO_Info()
{
	AI_Output(self, other, "DIA_Bennet_HALLO_06_00"); //我 不 卖 任 何 武 器 ， 克 哈 莱 德 是 干 这 个 的 。 他 跟 欧 纳 尔 一 起 呆 在 屋 子 里 。

	Log_CreateTopic(Topic_SoldierTrader, LOG_NOTE);
	B_LogEntry(Topic_SoldierTrader, Topic_SoldierTrader_3);
};

// ************************************************************
// 			  				TRADE
// ************************************************************
instance DIA_Bennet_TRADE(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 700;
	condition		= DIA_Bennet_TRADE_Condition;
	information		= DIA_Bennet_TRADE_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "那 么 锻 造 装 备 呢 ？";
};

func int DIA_Bennet_TRADE_Condition()
{
	if ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)) // damit Bennet dir im Knast kein Schmieden beibringt
	{
		return TRUE;
	};
};

func void DIA_Bennet_TRADE_Info()
{
	AI_Output(other, self, "DIA_Bennet_TRADE_15_00"); //那 么 锻 造 装 备 呢 ？
	B_GiveTradeInv(self);

	// Joly: Mc ArrowBolt
	//////////////////////////////////////////////////////////////////////////////////////
	Npc_RemoveInvItems(self, ItRw_Bolt, Npc_HasItems(self, ItRw_Bolt));
	var int McBolzenAmount;
	McBolzenAmount = (Kapitel * 50);
	CreateInvItems(self, ItRw_Bolt, McBolzenAmount);

	Npc_RemoveInvItems(self, ItRw_Arrow, Npc_HasItems(self, ItRw_Arrow));
	var int McArrowAmount;
	McArrowAmount = (Kapitel * 50);
	CreateInvItems(self, ItRw_Arrow, McArrowAmount);
	//////////////////////////////////////////////////////////////////////////////////////

	AI_Output(self, other, "DIA_Bennet_TRADE_06_01"); //你 想 要 什 么 ？

	if (BennetLOG == FALSE)
	{
		Log_CreateTopic(Topic_SoldierTrader, LOG_NOTE);
		B_LogEntry(Topic_SoldierTrader, Topic_SoldierTrader_4);
		BennetLOG = TRUE;
	};
};

// ************************************************************
// 			  				WhichWeapons
// ************************************************************
instance DIA_Bennet_WhichWeapons(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 2;
	condition		= DIA_Bennet_WhichWeapons_Condition;
	information		= DIA_Bennet_WhichWeapons_Info;
	description		= "你 制 造 什 么 种 类 的 武 器 ？";
};

func int DIA_Bennet_WhichWeapons_Condition()
{
	if (((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))
	&& (MIS_Bennet_BringOre == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhichWeapons_Info()
{
	AI_Output(other, self, "DIA_Bennet_WhichWeapons_15_00"); //你 制 造 什 么 种 类 的 武 器 ？
	AI_Output(self, other, "DIA_Bennet_WhichWeapons_06_01"); //现 在 只 有 长 剑 ， 没 别 的 了 。
	AI_Output(self, other, "DIA_Bennet_WhichWeapons_06_02"); //但 如 果 我 有 一 些 魔 法 矿 石 就 可 以 铸 造 一 些 武 器 ， 它 们 会 比 普 通 熟 铁 铸 造 的 武 器 更 好 。
	AI_Output(self, other, "DIA_Bennet_WhichWeapons_06_03"); //你 不 会 正 好 知 道 在 附 近 哪 里 能 找 到 一 些 吧 ？ （ 大 笑 ） 我 的 意 思 是 除 了 矿 藏 山 谷 里 以 外 。
	AI_Output(other, self, "DIA_Bennet_WhichWeapons_15_04"); //不 。
	AI_Output(self, other, "DIA_Bennet_WhichWeapons_06_05"); //当 然 不 。
};

// ************************************************************
// 			  				BauOrSld
// ************************************************************
instance DIA_Bennet_BauOrSld(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 3;
	condition		= DIA_Bennet_BauOrSld_Condition;
	information		= DIA_Bennet_BauOrSld_Info;
	description		= "你 站 在 农 民 一 边 还 是 雇 佣 兵 一 边 ？";
};

func int DIA_Bennet_BauOrSld_Condition()
{
	return TRUE;
};

func void DIA_Bennet_BauOrSld_Info()
{
	AI_Output(other, self, "DIA_Bennet_BauOrSld_15_00"); //你 站 在 农 民 一 边 还 是 雇 佣 兵 一 边 ？
	AI_Output(self, other, "DIA_Bennet_BauOrSld_06_01"); //你 在 跟 我 开 玩 笑 ， 是 吗 ？
	AI_Output(other, self, "DIA_Bennet_BauOrSld_15_02"); //我 只 是 好 奇 。
	AI_Output(self, other, "DIA_Bennet_BauOrSld_06_03"); //你 见 过 一 个 会 铸 造 武 器 的 农 民 吗 ？
	AI_Output(other, self, "DIA_Bennet_BauOrSld_15_04"); //不 。
	AI_Output(self, other, "DIA_Bennet_BauOrSld_06_05"); //那 你 为 什 么 问 这 么 愚 蠢 的 问 题 ？
};

// ************************************************************
// 			  				WannaJoin
// ************************************************************
instance DIA_Bennet_WannaJoin(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 4;
	condition		= DIA_Bennet_WannaJoin_Condition;
	information		= DIA_Bennet_WannaJoin_Info;
	permanent		= TRUE;
	description		= "我 想 要 加 入 雇 佣 兵 ！";
};

func int DIA_Bennet_WannaJoin_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Bennet_BauOrSld))
	&& (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaJoin_Info()
{
	AI_Output(other, self, "DIA_Bennet_WannaJoin_15_00"); //我 想 要 加 入 雇 佣 兵 ！
	AI_Output(self, other, "DIA_Bennet_WannaJoin_06_01"); //别 在 这 里 瞎 扯 了 ， 去 找 托 尔 洛 夫 让 他 对 你 进 行 测 试 。
	if ((MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	|| (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS))
	{
		AI_Output(other, self, "DIA_Bennet_WannaJoin_15_02"); //我 已 经 通 过 测 试 了 。
		AI_Output(self, other, "DIA_Bennet_WannaJoin_06_03"); //很 好 ， 那 么 我 会 给 你 投 票 。
	};
};

// ************************************************************
// 			  				WannaSmith
// ************************************************************
instance DIA_Bennet_WannaSmith(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 5;
	condition		= DIA_Bennet_WannaSmith_Condition;
	information		= DIA_Bennet_WannaSmith_Info;
	permanent		= TRUE;
	description		= "你 能 教 我 如 何 铸 剑 吗 ？";
};

func int DIA_Bennet_WannaSmith_Condition()
{
	if ((PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	&& (Bennet_TeachCommon == FALSE)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaSmith_Info()
{
	AI_Output(other, self, "DIA_Bennet_WannaSmith_15_00"); //你 能 教 我 如 何 铸 剑 吗 ？
	AI_Output(self, other, "DIA_Bennet_WannaSmith_06_01"); //当 然 。
	AI_Output(self, other, "DIA_Bennet_WannaSmith_06_02"); //可 是 你 得 为 此 花 点 钱 。 就 3 0 个 金 币 吧 。

	Info_ClearChoices(DIA_Bennet_WannaSmith);
	Info_AddChoice(DIA_Bennet_WannaSmith, "以 后 再 说 。", DIA_Bennet_WannaSmith_Later);
	Info_AddChoice(DIA_Bennet_WannaSmith, "好 。 这 是 你 的 ３ ０ 金 币 。", DIA_Bennet_WannaSmith_Pay);
};

func void DIA_Bennet_WannaSmith_Pay()
{
	AI_Output(other, self, "DIA_Bennet_WannaSmith_Pay_15_00"); //好 。 这 是 你 的 ３ ０ 金 币 。

	if (B_GiveInvItems(other, self, itmi_gold, 30))
	{
		AI_Output(self, other, "DIA_Bennet_WannaSmith_Pay_06_01"); //而 且 ， 这 个 价 钱 非 常 不 错 了 ！ 一 旦 你 准 备 好 了 ， 我 们 就 可 以 开 始 了 。

		Bennet_TeachCommon = TRUE;
		Log_CreateTopic(Topic_SoldierTeacher, LOG_NOTE);
		B_LogEntry(Topic_SoldierTeacher, Topic_SoldierTeacher_2);
	}
	else
	{
		AI_Output(self, other, "DIA_Bennet_WannaSmith_Pay_06_02"); //别 把 我 当 成 三 岁 小 孩 玩 了 。30就30， 一 分 钱 都 不 能 少 。
	};

	Info_ClearChoices(DIA_Bennet_WannaSmith);
};

func void DIA_Bennet_WannaSmith_Later()
{
	AI_Output(other, self, "DIA_Bennet_WannaSmith_Later_15_00"); //以 后 再 说 。
	Info_ClearChoices(DIA_Bennet_WannaSmith);
};

// ************************************************************
// 			  				Teach COMMON
// ************************************************************
instance DIA_Bennet_TeachCOMMON(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 6;
	condition		= DIA_Bennet_TeachCOMMON_Condition;
	information		= DIA_Bennet_TeachCOMMON_Info;
	permanent		= TRUE;
	description		= B_BuildLearnString(NAME_LEARN_SMITHING, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common));
};

func int DIA_Bennet_TeachCOMMON_Condition()
{
	if ((PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	&& (Bennet_TeachCommon == TRUE)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))) // damit Bennet dir im Knast kein Schmieden beibringt
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachCOMMON_Info()
{
	AI_Output(other, self, "DIA_Bennet_TeachCOMMON_15_00"); //教 我 怎 么 铸 剑 ！

	if (B_TeachPlayerTalentSmith(self, other, WEAPON_Common))
	{
		AI_Output(self, other, "DIA_Bennet_TeachCOMMON_06_01"); //非 常 简 单 ： 弄 块 生 铁 ， 把 它 放 在 火 上 烧 ， 直 到 它 被 烧 红 。
		AI_Output(self, other, "DIA_Bennet_TeachCOMMON_06_02"); //然 后 把 它 放 在 铁 砧 上 用 锤 子 把 它 锤 打 成 型 。
		AI_Output(self, other, "DIA_Bennet_TeachCOMMON_06_03"); //最 重 要 的 是 ， 要 注 意 别 让 铁 块 冷 却 。 只 有 几 分 钟 时 间 用 来 使 武 器 成 型 … …
		AI_Output(self, other, "DIA_Bennet_TeachCOMMON_06_04"); //剩 下 的 要 你 自 己 去 琢 磨 了 - 那 都 是 实 践 的 问 题 。
	};
};

// ************************************************************
// 			  				WannaSmithORE
// ************************************************************
instance DIA_Bennet_WannaSmithORE(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 7;
	condition		= DIA_Bennet_WannaSmithORE_Condition;
	information		= DIA_Bennet_WannaSmithORE_Info;
	permanent		= TRUE;
	description		= "教 我 如 何 铸 造 魔 法 矿 石 武 器 ！";
};

func int DIA_Bennet_WannaSmithORE_Condition()
{
	if ((Bennet_TeachSmith == FALSE)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaSmithORE_Info()
{
	AI_Output(other, self, "DIA_Bennet_WannaSmithORE_15_00"); //教 我 如 何 铸 造 魔 法 矿 石 武 器 ！

	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		AI_Output(self, other, "DIA_Bennet_WannaSmithORE_06_01"); //但 是 ， 你 连 一 点 基 础 都 不 会 。
		AI_Output(self, other, "DIA_Bennet_WannaSmithORE_06_02"); //首 先 ， 你 必 须 学 会 铸 造 一 把 象 样 的 剑 。 然 后 我 们 再 商 量 。
	}
	else if ((other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG))
	{
		AI_Output(self, other, "DIA_Bennet_WannaSmithORE_06_03"); //只 要 你 还 不 是 我 们 的 人 ， 我 就 不 能 把 魔 法 矿 石 武 器 的 秘 密 告 诉 你 ， 否 则 我 会 受 到 惩 罚 的 。
		AI_Output(self, other, "DIA_Bennet_WannaSmithORE_06_04"); //只 有 很 少 数 几 个 铁 匠 知 道 全 部 的 事 情 ， 而 且 ， 我 相 信 就 连 城 里 的 铁 匠 都 根 本 不 知 道 这 件 事 。
		AI_Output(self, other, "DIA_Bennet_WannaSmithORE_06_05"); //这 也 是 件 好 事 。 否 则 ， 以 后 城 里 那 些 酒 鬼 卫 兵 都 会 使 用 魔 法 剑 了 。
		if (other.guild == GIL_MIL)
		{
			AI_Output(self, other, "DIA_Bennet_WannaSmithORE_06_06"); //完 全 赞 同 你 。 （ 咧 着 嘴 笑 ） 你 看 起 来 很 好 。
		};
	}
	else if (MIS_Bennet_BringOre != LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Bennet_WannaSmithORE_06_07"); //如 果 我 有 魔 法 矿 石 ， 我 甚 至 也 会 那 样 做 。
		AI_Output(other, self, "DIA_Bennet_WannaSmithORE_15_08"); //噢 ， 算 了 吧 - 我 跟 雇 佣 兵 在 一 起 ， 而 且 我 能 铸 造 武 器 - 你 还 想 要 什 么 ？
		AI_Output(self, other, "DIA_Bennet_WannaSmithORE_06_09"); //那 么 你 能 不 能 告 诉 我 ， 没 有 魔 法 矿 石 的 话 ， 我 要 怎 样 铸 造 魔 法 矿 石 武 器 ？
		AI_Output(other, self, "DIA_Bennet_WannaSmithORE_15_10"); //好 … …
		AI_Output(self, other, "DIA_Bennet_WannaSmithORE_06_11"); //我 也 这 么 想 。 我 需 要 至 少5块 这 样 的 矿 石 - 否 则 就 算 了。
		if (MIS_Bennet_BringOre == FALSE)
		{
			MIS_Bennet_BringOre = LOG_RUNNING;
		};
	}
	else // alles OK
	{
		AI_Output(self, other, "DIA_Bennet_WannaSmithORE_06_12"); //很 好 ， 你 给 我 拿 来 了 矿 石 ， 而 且 你 也 知 道 怎 样 铸 造 一 把 像 样 的 剑 。
		AI_Output(other, self, "DIA_Bennet_WannaSmithORE_15_13"); //好 吧 ， 那 就 开 始 吧 … …
		AI_Output(self, other, "DIA_Bennet_WannaSmithORE_06_14"); //最 重 要 的 事 情 是 ： 无 论 你 的 武 器 是 全 部 用 魔 法 矿 石 打 造 的 ， 还 是 仅 仅 在 一 把 普 通 的 刀 剑 上 覆 盖 了 一 层 矿 石 ， 这 样 都 没 问 题 。 关 键 是 表 层 的 问 题 。
		AI_Output(self, other, "DIA_Bennet_WannaSmithORE_06_15"); //而 且 ， 由 于 那 些 该 死 的 材 料 十 分 昂 贵 ， 你 就 用 一 块 钢 坯 和 一 两 块 矿 石 就 行 了 。
		AI_Output(self, other, "DIA_Bennet_WannaSmithORE_06_16"); //当 然 ， 如 果 仅 仅 在 一 把 已 经 打 好 的 剑 上 镀 一 层 魔 法 矿 石 是 不 行 的 。 你 必 须 从 头 至 尾 亲 自 打 造 这 把 武 器 。
		AI_Output(self, other, "DIA_Bennet_WannaSmithORE_06_17"); //其 它 的 事 情 取 决 于 你 想 要 做 出 什 么 样 的 武 器 了 。
		Bennet_TeachSmith = TRUE;
	};
};

// ************************************************************
// 			  				WhereOre
// ************************************************************
instance DIA_Bennet_WhereOre(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 8;
	condition		= DIA_Bennet_WhereOre_Condition;
	information		= DIA_Bennet_WhereOre_Info;
	description		= "我 在 哪 里 能 找 到 魔 法 矿 石 ？";
};

func int DIA_Bennet_WhereOre_Condition()
{
	if ((MIS_Bennet_BringOre == LOG_RUNNING)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhereOre_Info()
{
	AI_Output(other, self, "DIA_Bennet_WhereOre_15_00"); //我 在 哪 里 能 找 到 魔 法 矿 石 ？
	AI_Output(self, other, "DIA_Bennet_WhereOre_06_01"); //好 了 ， 要 是 我 知 道 就 好 了 。 在 矿 区 流 放 地 一 定 有 一 些 。
	AI_Output(self, other, "DIA_Bennet_WhereOre_06_02"); //不 过 ， 也 许 运 气 特 别 好 的 话 ， 你 能 在 附 近 找 到 一 些 剩 下 的 小 块 矿 石 。
	AI_Output(self, other, "DIA_Bennet_WhereOre_06_03"); //我 想 南 边 那 座 山 底 下 会 有 一 些 采 矿 隧 道 。 也 许 你 可 以 去 那 里 碰 碰 运 气 。
	AI_Output(self, other, "DIA_Bennet_WhereOre_06_04"); //不 过 要 小 心 点 ， 我 听 说 那 里 强 盗 猖 獗 。
};

// ************************************************************
// 			  				BringOre
// ************************************************************
instance DIA_Bennet_BringOre(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 9;
	condition		= DIA_Bennet_BringOre_Condition;
	information		= DIA_Bennet_BringOre_Info;
	description		= "给 你 - ５ 块 魔 法 矿 石 。";
};

func int DIA_Bennet_BringOre_Condition()
{
	if ((MIS_Bennet_BringOre == LOG_RUNNING)
	&& (Npc_HasItems(other, ItMi_Nugget) >= 5))
	{
		return TRUE;
	};
};

func void DIA_Bennet_BringOre_Info()
{
	AI_Output(other, self, "DIA_Bennet_BringOre_15_00"); //给 你 - ５ 块 魔 法 矿 石 。
	AI_Output(self, other, "DIA_Bennet_BringOre_06_01"); //（ 大 笑 ） 让 我 看 看 ！
	B_GiveInvItems(other, self, itmi_nugget, 5);
	AI_Output(self, other, "DIA_Bennet_BringOre_06_02"); //真 的 ！ 这 太 让 我 惊 讶 了 ！
	AI_Output(self, other, "DIA_Bennet_BringOre_06_03"); //你 可 以 拿 走 其 中 两 块 。 你 铸 造 自 己 的 武 器 时 会 要 用 到 它 们 。
	B_GiveInvItems(self, other, itmi_nugget, 2);
	MIS_Bennet_BringOre = LOG_SUCCESS;
};

// ************************************************************
// 			  				  Teach
// ************************************************************
var int Bennet_Kap2Smith;
var int Bennet_Kap3Smith;
var int Bennet_Kap4Smith;
var int Bennet_Kap5Smith;
// ---------------------------------

func void B_SayBennetLATER()
{
	AI_Output(self, other, "DIA_Bennet_GetInnosEye_06_04"); //不 ， 还 没 。 过 一 会 儿 再 来 。
};
instance DIA_Bennet_TeachSmith(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 30;
	condition		= DIA_Bennet_TeachSmith_Condition;
	information		= DIA_Bennet_TeachSmith_Info;
	permanent		= TRUE;
	description		= "我 想 知 道 更 多 关 于 魔 法 矿 石 武 器 的 铸 造 知 识 。";
};

func int DIA_Bennet_TeachSmith_Condition()
{
	if ((Bennet_TeachSmith == TRUE)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))) // damit Bennet dir im Knast kein Schmieden beibringt
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachSmith_Info()
{
	AI_Output(other, self, "DIA_Bennet_TeachSmith_15_00"); //我 想 知 道 更 多 关 于 魔 法 矿 石 武 器 的 铸 造 知 识 。

	if (Kapitel == 1) // HACK Mattes
	{
		B_SayBennetLATER();
	}
	else if ((Kapitel == 2)
	&& (Bennet_Kap2Smith == FALSE))
	{
		AI_Output(self, other, "DIA_Bennet_TeachSmith_06_01"); //我 可 以 教 你 怎 样 铸 造 魔 法 矿 石 剑 ， 甚 至 双 手 剑 。
		Bennet_Kap2Smith = TRUE;
	}
	else if ((Kapitel == 3)
	&& (MIS_ReadyForChapter4 == FALSE)
	&& (Bennet_Kap3Smith == FALSE))
	{
		AI_Output(self, other, "DIA_Bennet_TeachSmith_06_02"); //我 已 经 改 进 了 我 的 工 艺 。 现 在 ， 我 可 以 教 你 怎 样 用 矿 石 制 造 异 型 剑 或 是 双 手 重 剑 。
		Bennet_Kap3Smith = TRUE;
	}
	else if ((MIS_ReadyForChapter4 == TRUE)
	&& (Kapitel < 5)
	&& (Bennet_Kap4Smith == FALSE))
	{
		AI_Output(self, other, "DIA_Bennet_TeachSmith_06_03"); //我 想 这 次 我 已 经 超 越 自 我 了 。 我 设 计 了 两 把 战 刀 。 到 目 前 为 止 ， 那 是 我 见 过 的 最 好 的 东 西 了 。
		Bennet_Kap4Smith = TRUE;
	}
	else if ((Kapitel >= 5)
	&& (Bennet_Kap5Smith == FALSE))
	{
		AI_Output(self, other, "DIA_Bennet_TeachSmith_06_04"); //听 着 。 我 想 我 刚 有 了 个 巧 妙 的 灵 感 。 魔 法 矿 石 武 器 ， 上 面 涂 上 一 层 龙 血 。 而 且 ， 我 清 楚 地 知 道 我 会 怎 样 去 把 它 做 出 来 ！
		AI_Output(self, other, "DIA_Bennet_TeachSmith_06_05"); //（ 咧 着 嘴 笑 ） 你 想 知 道 ？
		Bennet_Kap5Smith = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Bennet_TeachSmith_06_06"); //你 想 制 造 哪 一 种 武 器 ？
	};

	Info_ClearChoices(DIA_Bennet_TeachSmith);
	Info_AddChoice(DIA_Bennet_TeachSmith, DIALOG_BACK, DIA_Bennet_TeachSmith_BACK);
	// ------ Kapitel 2 ------
	if ((PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE)
	&& (Kapitel >= 2))
	{
		Info_AddChoice(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_01, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_01)), DIA_Bennet_TeachSmith_1hSpecial1);
	};

	if ((PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE)
	&& (Kapitel >= 2))
	{
		Info_AddChoice(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_01, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_01)), DIA_Bennet_TeachSmith_2hSpecial1);
	};

	// ------ Kapitel 3 ------
	if ((PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE)
	&& (Kapitel >= 3))
	{
		Info_AddChoice(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_02)), DIA_Bennet_TeachSmith_1hSpecial2);
	};

	if ((PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE)
	&& (Kapitel >= 3))
	{
		Info_AddChoice(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_02)), DIA_Bennet_TeachSmith_2hSpecial2);
	};

	// ------ Kapitel 4 ------
	if ((PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == FALSE)
	&& (Kapitel >= 4))
	{
		Info_AddChoice(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_03, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_03)), DIA_Bennet_TeachSmith_1hSpecial3);
	};

	if ((PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == FALSE)
	&& (Kapitel >= 4))
	{
		Info_AddChoice(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_03, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_03)), DIA_Bennet_TeachSmith_2hSpecial3);
	};

	// ------ Kapitel 5 ------
	if ((PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == FALSE)
	&& (Kapitel >= 5))
	{
		Info_AddChoice(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_04, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_04)), DIA_Bennet_TeachSmith_1hSpecial4);
	};

	if ((PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == FALSE)
	&& (Kapitel >= 5))
	{
		Info_AddChoice(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_04, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_04)), DIA_Bennet_TeachSmith_2hSpecial4);
	};
};

func void DIA_Bennet_TeachSmith_Back()
{
	Info_ClearChoices(DIA_Bennet_TeachSmith);
};

func void DIA_Bennet_TeachSmith_1hSpecial1()
{
	B_TeachPlayerTalentSmith(self, other, WEAPON_1H_Special_01);
};

func void DIA_Bennet_TeachSmith_2hSpecial1()
{
	B_TeachPlayerTalentSmith(self, other, WEAPON_2H_Special_01);
};

func void DIA_Bennet_TeachSmith_1hSpecial2()
{
	B_TeachPlayerTalentSmith(self, other, WEAPON_1H_Special_02);
};

func void DIA_Bennet_TeachSmith_2hSpecial2()
{
	B_TeachPlayerTalentSmith(self, other, WEAPON_2H_Special_02);
};

func void DIA_Bennet_TeachSmith_1hSpecial3()
{
	B_TeachPlayerTalentSmith(self, other, WEAPON_1H_Special_03);
};

func void DIA_Bennet_TeachSmith_2hSpecial3()
{
	B_TeachPlayerTalentSmith(self, other, WEAPON_2H_Special_03);
};

func void DIA_Bennet_TeachSmith_1hSpecial4()
{
	B_TeachPlayerTalentSmith(self, other, WEAPON_1H_Special_04);
};

func void DIA_Bennet_TeachSmith_2hSpecial4()
{
	B_TeachPlayerTalentSmith(self, other, WEAPON_2H_Special_04);
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
instance DIA_Bennet_KAP3_EXIT(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 999;
	condition		= DIA_Bennet_KAP3_EXIT_Condition;
	information		= DIA_Bennet_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Bennet_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Bennet_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//*********************************************************************
//	Was machst du hier im Knast?
//*********************************************************************
instance DIA_Bennet_WhyPrison(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 8;
	condition		= DIA_Bennet_WhyPrison_Condition;
	information		= DIA_Bennet_WhyPrison_Info;
	description		= "你 怎 么 来 的 监 狱 ？";
};

func int DIA_Bennet_WhyPrison_Condition()
{
	if ((Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhyPrison_Info()
{
	AI_Output(other, self, "DIA_Bennet_WhyPrison_15_00"); //你 怎 么 来 的 监 狱 ？
	AI_Output(self, other, "DIA_Bennet_WhyPrison_06_01"); //那 些 猪 把 我 扔 在 了 监 狱 ， 我 被 认 定 杀 了 一 个 圣 骑 士 。
	AI_Output(self, other, "DIA_Bennet_WhyPrison_06_02"); //但 我 没 有 ， 他 们 只 是 想 陷 害 我 。
	AI_Output(other, self, "DIA_Bennet_WhyPrison_15_03"); //他 们 为 什 么 那 么 做 ？
	AI_Output(self, other, "DIA_Bennet_WhyPrison_06_04"); //我 怎 么 知 道 ？ 你 必 须 把 我 从 这 里 弄 出 去 。
	AI_Output(self, other, "DIA_Bennet_WhyPrison_06_05"); //去 跟 哈 根 勋 爵 谈 谈 ， 打 开 天 窗 说 亮 话 ， 谁 怕 谁 呢 - 总 要 做 点 什 么 。

	MIS_RescueBennet = LOG_RUNNING;
	Log_CreateTopic(TOPIC_RESCUEBENNET, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET, LOG_RUNNING);
	B_LogEntry(TOPIC_RESCUEBENNET, TOPIC_RESCUEBENNET_9);
};

//*********************************************************************
//	Was ist passiert?
//*********************************************************************
instance DIA_Bennet_WhatHappened(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 8;
	condition		= DIA_Bennet_WhatHappened_Condition;
	information		= DIA_Bennet_WhatHappened_Info;
	description		= "发 生 了 什 么 事 ？";
};

func int DIA_Bennet_WhatHappened_Condition()
{
	if ((MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Bennet_WhyPrison)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhatHappened_Info()
{
	AI_Output(other, self, "DIA_Bennet_WhatHappened_15_00"); //发 生 了 什 么 事 ？
	AI_Output(self, other, "DIA_Bennet_WhatHappened_06_01"); //我 跟 霍 奇 斯 去 了 城 里 给 我 们 的 人 买 一 些 供 应 品 。
	AI_Output(self, other, "DIA_Bennet_WhatHappened_06_02"); //突 然 我 们 听 到 一 声 响 亮 的 尖 叫 声 和 脚 步 跑 动 的 声 音 。
	AI_Output(other, self, "DIA_Bennet_WhatHappened_15_03"); //言 归 正 传 吧 。
	AI_Output(self, other, "DIA_Bennet_WhatHappened_06_04"); //我 们 立 刻 意 识 到 有 什 么 事 情 发 生 了 ， 如 果 他 们 看 到 我 们 在 那 里 ， 一 定 会 马 上 把 我 们 抓 起 来 。
	AI_Output(self, other, "DIA_Bennet_WhatHappened_06_05"); //我 们 狂 奔 了 一 阵 。 后 来 ， 在 快 到 达 城 门 时 ， 我 绊 倒 了 并 扭 伤 了 脚 。
	AI_Output(self, other, "DIA_Bennet_WhatHappened_06_06"); //剩 下 的 大 家 都 知 道 了 。 民 兵 立 刻 把 我 抓 了 起 来 ， 并 直 接 把 我 扔 进 了 这 里 。
};

//*********************************************************************
//	Wer ist ermordet worden?
//*********************************************************************
instance DIA_Bennet_Victim(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 8;
	condition		= DIA_Bennet_Victim_Condition;
	information		= DIA_Bennet_Victim_Info;
	description		= "谁 被 谋 杀 了 ？";
};

func int DIA_Bennet_Victim_Condition()
{
	if ((MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Bennet_WhyPrison)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_Victim_Info()
{
	AI_Output(other, self, "DIA_Bennet_Victim_15_00"); //谁 被 谋 杀 了 ？
	AI_Output(self, other, "DIA_Bennet_Victim_06_01"); //我 不 知 道 - 是 一 个 圣 骑 士 ， 我 不 认 识 他 们 。
	AI_Output(other, self, "DIA_Bennet_Victim_15_02"); //你 听 说 了 什 么 名 字 没 有 ？
	AI_Output(self, other, "DIA_Bennet_Victim_06_03"); //什 么 洛 萨 ， 我 想 是 的 。 嗯 ， 我 不 知 道 ， 我 不 很 确 定 。
	AI_Output(self, other, "DIA_Bennet_Victim_06_04"); //你 最 好 去 问 问 哈 根 勋 爵 ， 他 知 道 所 有 的 细 节 。

	B_LogEntry(TOPIC_RESCUEBENNET, TOPIC_RESCUEBENNET_10);
};

//*********************************************************************
//	Haben sie Beweise gegen dich?
//*********************************************************************
instance DIA_Bennet_Evidence(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 8;
	condition		= DIA_Bennet_Evidence_Condition;
	information		= DIA_Bennet_Evidence_Info;
	description		= "他 们 有 任 何 证 据 对 你 不 利 吗 ？";
};

func int DIA_Bennet_Evidence_Condition()
{
	if ((MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Bennet_WhyPrison)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_Evidence_Info()
{
	AI_Output(other, self, "DIA_Bennet_Evidence_15_00"); //他 们 有 任 何 证 据 对 你 不 利 吗 ？
	AI_Output(self, other, "DIA_Bennet_Evidence_06_01"); //他 们 说 他 们 有 认 识 我 的 证 人 。
	AI_Output(other, self, "DIA_Bennet_Evidence_15_02"); //你 知 道 那 个 证 人 是 谁 吗 ？
	AI_Output(self, other, "DIA_Bennet_Evidence_06_03"); //不 知 道 。 我 只 知 道 他 在 撒 谎 。

	B_LogEntry(TOPIC_RESCUEBENNET, TOPIC_RESCUEBENNET_11);

	RescueBennet_KnowsWitness = TRUE;
};

//*********************************************************************
//	Wer führt die Untersuchungen durch?
//*********************************************************************
instance DIA_Bennet_Investigation(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 8;
	condition		= DIA_Bennet_Investigation_Condition;
	information		= DIA_Bennet_Investigation_Info;
	description		= "谁 在 指 挥 这 次 调 查 ？";
};

func int DIA_Bennet_Investigation_Condition()
{
	if ((MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Bennet_Evidence)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_Investigation_Info()
{
	AI_Output(other, self, "DIA_Bennet_Investigation_15_00"); //谁 负 责 这 次 调 查 ？
	AI_Output(self, other, "DIA_Bennet_Investigation_06_01"); //哈 根 勋 爵 本 人 。 因 为 受 害 人 是 一 个 圣 骑 士 ， 这 件 事 就 划 归 了 军 事 法 庭 处 理 。
	AI_Output(other, self, "DIA_Bennet_Investigation_15_02"); //那 是 什 么 意 思 ？
	AI_Output(self, other, "DIA_Bennet_Investigation_06_03"); //很 容 易 想 到 。 如 果 我 不 离 开 这 里 ， 他 们 会 干 脆 痛 快 地 把 我 吊 死 。
	AI_Output(self, other, "DIA_Bennet_Investigation_06_04"); //你 得 帮 帮 我 ， 否 则 会 有 一 场 战 争 发 生 。 李 是 不 会 逆 来 顺 受 的 。
	AI_Output(self, other, "DIA_Bennet_Investigation_06_05"); //你 可 以 自 己 想 想 ， 那 样 意 味 着 什 么 。
};

//*********************************************************************
//	Mann, ich hatte echt schon geglaubt, dass die mich hängen!
//*********************************************************************
instance DIA_Bennet_ThankYou(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 8;
	condition		= DIA_Bennet_ThankYou_Condition;
	information		= DIA_Bennet_ThankYou_Info;
	important		= TRUE;
};

func int DIA_Bennet_ThankYou_Condition()
{
	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Bennet_ThankYou_Info()
{
	if (hero.guild == GIL_SLD)
	{
		other.guild = GIL_DJG;
		Npc_SetTrueGuild(other, GIL_DJG);
	};

	AI_Output(self, other, "DIA_Bennet_ThankYou_06_00"); //老 兄 ， 我 刚 在 还 在 想 他 们 真 的 会 把 我 吊 死 ！
	AI_Output(other, self, "DIA_Bennet_ThankYou_15_01"); //好 吧 ， 最 终 顺 利 解 决 了 。
	AI_Output(self, other, "DIA_Bennet_ThankYou_06_02"); //是 这 样 的 。 当 他 不 得 不 放 我 出 去 时 ， 你 应 该 看 见 了 那 个 士 兵 的 脸 。
	AI_Output(self, other, "DIA_Bennet_ThankYou_06_03"); //（ 大 笑 ） 他 害 怕 得 要 命 ， 几 乎 要 拉 裤 子 了 。
	AI_Output(self, other, "DIA_Bennet_ThankYou_06_04"); //那 提 醒 了 我 ， 我 有 一 些 东 西 给 你 ！
	AI_Output(other, self, "DIA_Bennet_ThankYou_15_05"); //你 是 什 么 意 思 ？
	AI_Output(self, other, "DIA_Bennet_ThankYou_06_06"); //（ 咧 着 嘴 笑 ） 一 份 礼 物 。
};

//*********************************************************************
//	Was für ein Geschenk?
//*********************************************************************
instance DIA_Bennet_Present(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 8;
	condition		= DIA_Bennet_Present_Condition;
	information		= DIA_Bennet_Present_Info;
	description		= "什 么 礼 物 ？";
};

func int DIA_Bennet_Present_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Bennet_ThankYou))
	{
		return TRUE;
	};
};

func void DIA_Bennet_Present_Info()
{
	AI_Output(other, self, "DIA_Bennet_Present_15_00"); //什 么 礼 物 ？

	AI_Output(self, other, "DIA_Bennet_Present_06_01"); //我 们 听 说 了 龙 的 事 ， 据 说 它 们 在 山 谷 里 。
	AI_Output(other, self, "DIA_Bennet_Present_15_02"); //它 们 真 的 在 那 里 ！
	AI_Output(self, other, "DIA_Bennet_Present_06_03"); //好 吧 ， 我 相 信 你 。

	if (hero.guild == GIL_DJG)
	{
		AI_Output(self, other, "DIA_Bennet_Present_06_04"); //无 论 如 何 ， 有 一 些 人 已 经 决 定 去 山 谷 里 了 。
		AI_Output(self, other, "DIA_Bennet_Present_06_05"); //（ 咧 着 嘴 笑 ） 他 们 计 划 去 收 拾 那 里 。
		AI_Output(other, self, "DIA_Bennet_Present_15_06"); //那 关 我 什 么 事 ？
		AI_Output(self, other, "DIA_Bennet_Present_06_07"); //（ 自 豪 的 ） 我 开 发 了 一 种 新 型 盔 甲 。 龙 猎 手 盔 甲 ！
		AI_Output(self, other, "DIA_Bennet_Present_06_08"); //它 比 传 统 盔 甲 更 坚 固 、 更 轻 。
		AI_Output(self, other, "DIA_Bennet_Present_06_09"); //因 为 你 是 我 的 救 命 恩 人 ， 我 想 要 你 第 一 个 拥 有 它 。 是 一 份 礼 物 ！

		CreateInvItems(self, ITAR_DJG_L, 1);
		B_GiveInvItems(self, other, ITAR_DJG_L, 1);

		AI_Output(self, other, "DIA_Bennet_Present_06_10"); //我 想 你 也 许 希 望 参 与 这 次 娱 乐 活 动 。 当 你 去 那 个 山 谷 时 ， 将 会 需 要 合 适 的 装 备 。
		AI_Output(self, other, "DIA_Bennet_Present_06_11"); //还 有 ， 我 对 龙 鳞 很 感 兴 趣 。 真 正 的 龙 鳞 。 我 会 给 你 个 好 价 钱 买 下 它 们 。
		AI_Output(other, self, "DIA_Bennet_Present_15_12"); //一 片 鳞 能 换 多 少 钱 ？
		B_Say_Gold(self, other, Value_DragonScale);
	}
	else
	{
		AI_Output(self, other, "DIA_Bennet_Present_06_13"); //总 之 ， 我 想 你 肯 定 想 要 参 加 即 将 开 始 的 猎 龙 行 动 。
		AI_Output(other, self, "DIA_Bennet_Present_15_14"); //然 后 ？
		AI_Output(self, other, "DIA_Bennet_Present_06_15"); //给 你 ， 带 上 这 个 护 身 符 。 我 想 你 比 我 更 需 要 它 。

		CreateInvItems(self, ItAm_Hp_01, 1);
		B_GiveInvItems(self, other, ItAm_Hp_01, 1);
	};
};

//*********************************************************************
//		DragonScale
//*********************************************************************

// -------------------------------------------------
var int Bennet_DragonScale_Counter;
var int Show_DJG_Armor_M;
// -------------------------------------------------
instance DIA_Bennet_DragonScale(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 8;
	condition		= DIA_Bennet_DragonScale_Condition;
	information		= DIA_Bennet_DragonScale_Info;
	permanent		= TRUE;
	description		= "我 给 你 带 来 了 一 些 龙 鳞 。";
};

func int DIA_Bennet_DragonScale_Condition()
{
	if ((Npc_HasItems(other, ItAt_Dragonscale) > 0)
	&& (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DragonScale_Info()
{
	AI_Output(other, self, "DIA_Bennet_DragonScale_15_00"); //我 给 你 带 来 了 一 些 龙 鳞 。
	AI_Output(self, other, "DIA_Bennet_DragonScale_06_01"); //真 正 的 龙 鳞 ！
	AI_Output(self, other, "DIA_Bennet_DragonScale_06_02"); //这 是 你 的 钱 ！

	Bennet_DragonScale_Counter = (Bennet_DragonScale_Counter + (Npc_HasItems(other, ItAT_Dragonscale)));

	B_GiveInvItems(self, other, ItMi_Gold, (Npc_HasItems(other, ItAT_Dragonscale) * Value_DragonScale));
	B_GiveInvItems(other, self, ItAt_Dragonscale, (Npc_HasItems(other, ItAT_Dragonscale)));

	if ((Bennet_DragonScale_Counter >= 20)
	&& (Show_DJG_Armor_M == FALSE))
	{
		AI_Output(self, other, "DIA_Bennet_DragonScale_06_03"); //好 的 ， 这 就 应 该 够 了 。 如 果 你 愿 意 ， 我 可 以 卖 给 你 新 的 、 改 良 过 的 盔 甲 。

		Show_DJG_Armor_M = TRUE;
	};
};

//*********************************************************************
//		DJG_ARMOR_M
//*********************************************************************

// -----------------------------
var int Bennet_DIA_Bennet_DJG_ARMOR_M_permanent;
// -----------------------------
instance DIA_Bennet_DJG_ARMOR_M(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 8;
	condition		= DIA_Bennet_DJG_ARMOR_M_Condition;
	information		= DIA_Bennet_DJG_ARMOR_M_Info;
	permanent		= TRUE;
	description		= "中 型 龙 猎 手 盔 甲 - 防 护 ： 武 器 ８ ０ ， 箭 ８ ０ （ １ ２ ０ ０ ０ 金 币 ）"; // Wenn ändern, dann bitte auch in der Info-Instanz. s.u.
};

func int DIA_Bennet_DJG_ARMOR_M_Condition()
{
	if ((Bennet_DIA_Bennet_DJG_ARMOR_M_permanent == FALSE)
	&& (hero.guild == GIL_DJG)
	&& (Show_DJG_Armor_M == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DJG_ARMOR_M_Info()
{
	AI_Output(other, self, "DIA_Bennet_DJG_ARMOR_M_15_00"); //我 给 你 带 来 了 一 些 龙 鳞 。

	if (Npc_HasItems(other, itmi_Gold) >= 12000)
	{
		AI_Output(self, other, "DIA_Bennet_DJG_ARMOR_M_06_01"); //很 好 。 你 会 喜 欢 它 的 。
		AI_Output(other, self, "DIA_Bennet_DJG_ARMOR_M_15_02"); //我 当 然 会 想 到 它 值 这 个 价 。
		AI_Output(self, other, "DIA_Bennet_DJG_ARMOR_M_06_03"); //你 会 发 现 你 为 它 花 的 每 一 个 子 儿 都 很 值 。

		B_GiveInvItems(other, self, ItMi_Gold, 12000);
		CreateInvItems(self, ITAR_DJG_M, 1);
		B_GiveInvItems(self, other, ITAR_DJG_M, 1);

		Bennet_DIA_Bennet_DJG_ARMOR_M_permanent = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Bennet_DJG_ARMOR_M_06_04"); //你 没 有 足 够 的 金 币 。
	};
};

//*********************************************************************
//		Ich weiss, wie man die Rüstung noch mehr verbessern kann.
//*********************************************************************
instance DIA_Bennet_BetterArmor(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 8;
	condition		= DIA_Bennet_BetterArmor_Condition;
	information		= DIA_Bennet_BetterArmor_Info;
	description		= "我 知 道 如 何 进 一 步 强 化 盔 甲 。 ";
};

func int DIA_Bennet_BetterArmor_Condition()
{
	if ((PlayerGetsFinalDJGArmor == TRUE)
	&& (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Bennet_BetterArmor_Info()
{
	AI_Output(other, self, "DIA_Bennet_BetterArmor_15_00"); //我 知 道 如 何 进 一 步 强 化 盔 甲 。
	AI_Output(self, other, "DIA_Bennet_BetterArmor_06_01"); //（ 对 自 己 笑 ） 那 就 告 诉 我 吧 。
	AI_Output(other, self, "DIA_Bennet_BetterArmor_15_02"); //你 可 以 把 魔 法 矿 石 覆 盖 在 龙 鳞 上 。
	AI_Output(self, other, "DIA_Bennet_BetterArmor_06_03"); //（ 大 笑 ） 这 个 想 法 也 已 经 在 我 脑 子 里 出 现 过 了 。 你 是 对 的 。
	AI_Output(self, other, "DIA_Bennet_BetterArmor_06_04"); //我 的 最 新 的 盔 甲 能 抵 抗 你 所 见 过 的 任 何 东 西 。 它 不 但 重 量 很 轻 还 很 坚 固 。
	AI_Output(self, other, "DIA_Bennet_BetterArmor_06_05"); //非 常 完 美 。
	AI_Output(self, other, "DIA_Bennet_BetterArmor_06_06"); //如 果 你 愿 意 ， 你 可 以 买 下 它 。 我 不 会 轻 易 对 人 出 价 ， 而 这 个 价 格 仅 仅 包 含 了 制 造 成 本 。
};

//*********************************************************************
//		DJG_ARMOR_H
//*********************************************************************

// ---------------------------------------------------
var int Bennet_DIA_Bennet_DJG_ARMOR_H_permanent;
// ---------------------------------------------------
instance DIA_Bennet_DJG_ARMOR_H(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 8;
	condition		= DIA_Bennet_DJG_ARMOR_H_Condition;
	information		= DIA_Bennet_DJG_ARMOR_H_Info;
	permanent		= TRUE;
	description		= "重 型 龙 猎 手 盔 甲 ： 防 护 ： 武 器 ９ ０ ， 箭 ９ ０ 。 （ ２ ０ ０ ０ ０ 金 币 ）"; // Wenn ändern, dann bitte auch in der Info-Instanz. s.u.
};

func int DIA_Bennet_DJG_ARMOR_H_Condition()
{
	if ((Bennet_DIA_Bennet_DJG_ARMOR_H_permanent == FALSE)
	&& (hero.guild == GIL_DJG)
	&& (Npc_KnowsInfo(other, DIA_Bennet_BetterArmor)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DJG_ARMOR_H_Info()
{
	AI_Output(other, self, "DIA_Bennet_DJG_ARMOR_H_15_00"); //给 我 盔 甲

	if (Npc_HasItems(other, itmi_Gold) >= 20000)
	{
		AI_Output(self, other, "DIA_Bennet_DJG_ARMOR_H_06_01"); //这 是 我 做 出 的 最 好 的 盔 甲 。
		AI_Output(self, other, "DIA_Bennet_DJG_ARMOR_H_06_02"); //一 个 真 正 的 杰 作 。

		B_GiveInvItems(other, self, ItMi_Gold, 20000);
		CreateInvItems(self, ITAR_DJG_H, 1);
		B_GiveInvItems(self, other, ITAR_DJG_H, 1);

		Bennet_DIA_Bennet_DJG_ARMOR_H_permanent = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Bennet_DJG_ARMOR_H_06_03"); //你 没 有 足 够 的 金 币 。
	};
};

//*********************************************************************
//	Kannst du auch Schmuckstücke reparieren?
//*********************************************************************
instance DIA_Bennet_RepairNecklace(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 8;
	condition		= DIA_Bennet_RepairNecklace_Condition;
	information		= DIA_Bennet_RepairNecklace_Info;
	description		= "你 能 修 理 珠 宝 吗 ？";
};

func int DIA_Bennet_RepairNecklace_Condition()
{
	if ((MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS)
	&& ((Npc_HasItems(other, ItMi_InnosEye_Broken_MIS))
	|| (MIS_SCKnowsInnosEyeIsBroken == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_RepairNecklace_Info()
{
	AI_Output(other, self, "DIA_Bennet_RepairNecklace_15_00"); //你 能 修 理 珠 宝 吗 ？
	AI_Output(self, other, "DIA_Bennet_RepairNecklace_06_01"); //要 看 情 况 而 定 。 你 必 须 先 让 我 知 道 它 的 价 格 。

	if (MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Bennet_RepairNecklace_06_02"); //还 有 ， 我 必 须 先 从 这 里 出 来 。
		AI_Output(self, other, "DIA_Bennet_RepairNecklace_06_03"); //在 那 之 前 ， 我 什 么 也 做 不 了 ， 这 是 显 然 的 。
	};

	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};

//*********************************************************************
//		Hier wird das Amulett repariert
//*********************************************************************

//*********************************************************************
//	Kannst du mir dieses Amulett reparieren?
//*********************************************************************
instance DIA_Bennet_ShowInnosEye(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 8;
	condition		= DIA_Bennet_ShowInnosEye_Condition;
	information		= DIA_Bennet_ShowInnosEye_Info;
	description		= "你 能 看 一 下 这 个 护 身 符 吗 ？";
};

func int DIA_Bennet_ShowInnosEye_Condition()
{
	if ((Npc_HasItems(other, ItMi_InnosEye_Broken_MIS))
	&& (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_ShowInnosEye_Info()
{
	AI_Output(other, self, "DIA_Bennet_ShowInnosEye_15_00"); //你 能 看 一 下 这 个 护 身 符 吗 ？
	AI_Output(self, other, "DIA_Bennet_ShowInnosEye_06_01"); //当 然 ， 让 我 看 看 。
	AI_Output(self, other, "DIA_Bennet_ShowInnosEye_06_02"); //唔 ， 真 是 一 件 漂 亮 的 作 品 。 底 座 坏 了 。 可 是 我 想 我 能 修 好 它 。
	AI_Output(other, self, "DIA_Bennet_ShowInnosEye_15_03"); //那 会 需 要 多 长 时 间 ？
	if (MIS_REscueBennet != LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Bennet_ShowInnosEye_06_04"); //唔 ， 我 现 在 被 关 在 这 里 了 。 难 道 ， 你 看 见 这 里 有 锻 铁 炉 吗 ？
		AI_Output(self, other, "DIA_Bennet_ShowInnosEye_06_05"); //如 果 我 在 我 的 铁 匠 铺 里 ， 一 天 时 间 就 能 做 完 。 不 过 ， 当 然 ， 首 先 我 得 从 这 里 出 去 。
	}
	else
	{
		AI_Output(self, other, "DIA_Bennet_ShowInnosEye_06_06"); //如 果 你 把 它 放 在 我 这 里 ， 你 明 天 再 来 的 时 候 就 弄 好 了 。
		AI_Output(self, other, "DIA_Bennet_ShowInnosEye_06_07"); //而 且 我 不 会 为 此 向 你 收 钱 。 不 管 怎 样 ， 是 你 把 我 救 出 了 监 狱 。
	};

	B_LogEntry(TOPIC_INNOSEYE, TOPIC_INNOSEYE_17);

	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};

//*********************************************************************
//	Kannst du mir dieses Amulett reparieren?
//*********************************************************************
instance DIA_Bennet_GiveInnosEye(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 8;
	condition		= DIA_Bennet_GiveInnosEye_Condition;
	information		= DIA_Bennet_GiveInnosEye_Info;
	description		= "这 是 护 身 符 ， 请 帮 我 修 好 它 。";
};

func int DIA_Bennet_GiveInnosEye_Condition()
{
	if ((Npc_HasItems(other, ItMi_InnosEye_Broken_Mis) >= 1)
	&& (MIS_SCKnowsInnosEyeIsBroken == TRUE)
	&& (MIS_REscueBennet == LOG_SUCCESS)
	&& (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_GiveInnosEye_Info()
{
	AI_Output(other, self, "DIA_Bennet_GiveInnosEye_15_00"); //这 是 护 身 符 ， 请 帮 我 修 好 它 。
	AI_Output(self, other, "DIA_Bennet_GiveInnosEye_06_01"); //好 吧 。 到 明 天 我 就 做 好 新 的 底 座 了 。
	AI_Output(self, other, "DIA_Bennet_GiveInnosEye_06_02"); //那 时 你 来 找 我 就 可 以 把 它 拿 走 了 。

	Npc_RemoveInvItems(other, ItMi_InnosEye_Broken_Mis, 1);
	AI_PrintScreen(Print_InnoseyeGiven, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

	Bennet_RepairDay = Wld_GetDay();
};

///////////////////////////////////////////////////////////////////////
//	Kannst du mir dieses Amulett reparieren?
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_GetInnosEye(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 8;
	condition		= DIA_Bennet_GetInnosEye_Condition;
	information		= DIA_Bennet_GetInnosEye_Info;
	permanent		= TRUE;
	description		= "这 个 护 身 符 准 备 好 了 吗 ？";
};

func int DIA_Bennet_GetInnosEye_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Bennet_GiveInnosEye)
	&& (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_GetInnosEye_Info()
{
	AI_Output(other, self, "DIA_Bennet_GetInnosEye_15_00"); //这 个 护 身 符 准 备 好 了 吗 ？

	if (Bennet_RepairDay < Wld_GetDay())
	{
		AI_Output(self, other, "DIA_Bennet_GetInnosEye_06_01"); //是 的 ， 给 。

		TEXT_Innoseye_Setting = TEXT_Innoseye_Setting_Repaired;
		CreateInvItems(other, ItMi_InnosEye_Broken_Mis, 1);
		AI_PrintScreen(Print_InnoseyeGet, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

		AI_Output(self, other, "DIA_Bennet_GetInnosEye_06_02"); //我 必 须 给 这 个 石 头 做 一 个 新 的 底 座 。
		AI_Output(self, other, "DIA_Bennet_GetInnosEye_06_03"); //我 干 了 一 个 通 宵 ， 现 在 它 跟 新 的 一 样 好 了 。

		B_LogEntry(TOPIC_INNOSEYE, TOPIC_INNOSEYE_10);

		MIS_Bennet_InnosEyeRepairedSetting = LOG_SUCCESS;

		B_GivePlayerXP(XP_InnosEyeIsRepaired);
	}
	else
	{ // Hack Mattes
		B_SayBennetLATER();
		// AI_Output(self, other, "DIA_Bennet_GetInnosEye_06_04"); // Nein, noch nicht. Komm später wieder.
		AI_Output(self, other, "DIA_Bennet_GetInnosEye_06_05"); //如 果 你 一 直 打 搅 我 的 工 作 ， 就 会 需 要 更 长 的 时 间 了 。

		AI_StopProcessInfos(self);
	};
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
instance DIA_Bennet_KAP4_EXIT(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 999;
	condition		= DIA_Bennet_KAP4_EXIT_Condition;
	information		= DIA_Bennet_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Bennet_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Bennet_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Dracheneier
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_DRACHENEIER(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 5;
	condition		= DIA_Bennet_DRACHENEIER_Condition;
	information		= DIA_Bennet_DRACHENEIER_Info;
	permanent		= TRUE;
	description		= "你 拿 龙 蛋 能 做 任 何 东 西 吗 ？";
};

func int DIA_Bennet_DRACHENEIER_Condition()
{
	if ((Kapitel >= 4)
	&& (BennetsDragonEggOffer == 0)
	&& (Npc_HasItems(other, ItAt_DragonEgg_MIS) >= 1)
	&& (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

var int BennetsDragonEggOffer;
var int DRACHENEIER_angebotenXP_OneTime;
func void DIA_Bennet_DRACHENEIER_Info()
{
	AI_Output(other, self, "DIA_Bennet_DRACHENEIER_15_00"); //你 拿 龙 蛋 能 做 任 何 东 西 吗 ？
	if (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
		AI_Output(self, other, "DIA_Bennet_DRACHENEIER_06_01"); //龙 蛋 ？ 你 到 底 怎 么 弄 到 这 些 东 西 的 ？
		AI_Output(other, self, "DIA_Bennet_DRACHENEIER_15_02"); //我 从 一 些 蜥 蜴 人 那 里 拿 到 它 们 的 。
		AI_Output(self, other, "DIA_Bennet_DRACHENEIER_06_03"); //让 我 看 看 。
	};

	Npc_RemoveInvItems(other, ItAt_DragonEgg_MIS, 1);
	AI_PrintScreen(PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2); // "1 Gegenstand gegeben"

	if (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
		AI_Output(self, other, "DIA_Bennet_DRACHENEIER_06_04"); //嗯 。 非 常 坚 固 的 材 料 。 用 来 抛 光 盔 甲 再 合 适 不 过 了 。 如 果 有 人 能 想 法 子 打 开 它 们 就 好 了 。
		AI_Output(other, self, "DIA_Bennet_DRACHENEIER_15_05"); //那 么 ， 怎 么 样 ？ 你 想 要 吗 ？
		AI_Output(self, other, "DIA_Bennet_DRACHENEIER_06_06"); //当 然 ！ 接 着 往 下 说 。
	}
	else
	{
		AI_Output(self, other, "DIA_Bennet_DRACHENEIER_06_07"); //你 还 准 备 跟 我 讲 多 少 次 要 把 那 个 该 死 的 东 西 推 销 给 我 ？ 你 希 望 我 买 还 是 不 买 ？
	};

	AI_Output(self, other, "DIA_Bennet_DRACHENEIER_06_08"); //我 会 付 钱 给 你 ， 嗯 ， 你 每 带 给 我 一 个 蛋 ， 就 给 你 3 0 0 个 金 币 吧 。

	Info_ClearChoices(DIA_Bennet_DRACHENEIER);
	Info_AddChoice(DIA_Bennet_DRACHENEIER, "那 么 收 回 你 的 金 币 吧 。 我 要 留 下 它 。", DIA_Bennet_DRACHENEIER_nein);
	Info_AddChoice(DIA_Bennet_DRACHENEIER, "这 些 是 龙 蛋 ， 而 非 微 不 足 道 鸡 蛋 。", DIA_Bennet_DRACHENEIER_mehr);
	Info_AddChoice(DIA_Bennet_DRACHENEIER, "成 交 。", DIA_Bennet_DRACHENEIER_ok);

	if (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
		B_LogEntry(TOPIC_DRACHENEIER, TOPIC_DRACHENEIER_3);
		B_GivePlayerXP(XP_DJG_BringDragonEgg);
		DRACHENEIER_angebotenXP_OneTime = TRUE;
	};
};

func void DIA_Bennet_DRACHENEIER_ok()
{
	AI_Output(other, self, "DIA_Bennet_DRACHENEIER_ok_15_00"); //成 交 。
	AI_Output(self, other, "DIA_Bennet_DRACHENEIER_ok_06_01"); //好 。
	AI_Output(self, other, "DIA_Bennet_DRACHENEIER_ok_06_02"); //如 果 你 能 弄 到 ， 那 就 源 源 不 断 地 把 它 们 送 过 来 给 我 。

	if (BennetsDragonEggOffer != 350)
	{
		BennetsDragonEggOffer = 300;
	};

	CreateInvItems(self, ItMi_Gold, BennetsDragonEggOffer);
	B_GiveInvItems(self, other, ItMi_Gold, BennetsDragonEggOffer);

	AI_Output(self, other, "DIA_Bennet_DRACHENEIER_ok_06_03"); //唔 。 你 说 你 从 蜥 蜴 人 那 里 拿 到 这 些 东 西 的 ？
	AI_Output(other, self, "DIA_Bennet_DRACHENEIER_ok_15_04"); //好 的 。
	AI_Output(self, other, "DIA_Bennet_DRACHENEIER_ok_06_05"); //据 我 所 知 ， 大 部 分 蜥 蜴 人 居 住 在 洞 穴 里 面 。
	AI_Output(self, other, "DIA_Bennet_DRACHENEIER_ok_06_06"); //如 果 你 在 周 围 的 洞 穴 里 找 到 更 多 这 种 东 西 ， 我 也 一 点 都 不 感 到 奇 怪 。
	B_LogEntry(TOPIC_DRACHENEIER, TOPIC_DRACHENEIER_4);

	AI_Output(self, other, "DIA_Bennet_DRACHENEIER_ok_06_07"); //给 你 。 拿 着 这 张 地 图 。 它 会 帮 你 找 到 那 些 洞 穴 。
	CreateInvItems(self, ItWr_Map_Caves_MIS, 1);
	B_GiveInvItems(self, other, ItWr_Map_Caves_MIS, 1);
	B_LogEntry(TOPIC_DRACHENEIER, TOPIC_DRACHENEIER_5);

	if (1 == 2) // MH: Besser Karte direkt (war sowieso so - wegen Bug)
	{
		AI_Output(self, other, "DIA_Bennet_DRACHENEIER_ok_06_08"); //但 首 先 你 必 须 到 城 里 的 一 个 制 图 师 那 里 弄 到 一 张 洞 穴 地 图 。 如 果 你 不 能 把 它 们 全 都 找 出 来 ， 将 会 是 一 种 遗 憾 。
		B_LogEntry(TOPIC_DRACHENEIER, TOPIC_DRACHENEIER_6);
	};

	Info_ClearChoices(DIA_Bennet_DRACHENEIER);
};

func void DIA_Bennet_DRACHENEIER_mehr()
{
	AI_Output(other, self, "DIA_Bennet_DRACHENEIER_mehr_15_00"); //这 些 是 龙 蛋 ， 而 非 微 不 足 道 鸡 蛋 。
	AI_Output(self, other, "DIA_Bennet_DRACHENEIER_mehr_06_01"); //（ 被 激 怒 ） 好 吧 。 就 3 5 0 。 但 我 不 能 给 你 更 多 了 - 否 则 ， 我 就 得 不 偿 失 了 。
	BennetsDragonEggOffer = 350;
};

func void DIA_Bennet_DRACHENEIER_nein()
{
	AI_Output(other, self, "DIA_Bennet_DRACHENEIER_nein_15_00"); //那 么 收 回 你 的 金 币 吧 。 我 要 留 下 它 。
	AI_Output(self, other, "DIA_Bennet_DRACHENEIER_nein_06_01"); //你 改 变 主 意 了 就 告 诉 我 。

	CreateInvItems(other, ItAt_DragonEgg_MIS, 1);
	AI_PrintScreen(PRINT_ItemErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2); // "1 Gegenstand erhalten"

	BennetsDragonEggOffer = 0;
	Info_ClearChoices(DIA_Bennet_DRACHENEIER);
};

///////////////////////////////////////////////////////////////////////
//	Info EierBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_EierBringen(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 5;
	condition		= DIA_Bennet_EierBringen_Condition;
	information		= DIA_Bennet_EierBringen_Info;
	permanent		= TRUE;
	description		= "有 兴 趣 再 要 些 龙 蛋 吗 ？";
};

func int DIA_Bennet_EierBringen_Condition()
{
	if ((BennetsDragonEggOffer > 0)
	&& (Kapitel >= 4)
	&& (Npc_HasItems(other, ItAt_DragonEgg_MIS) >= 1)
	&& (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

var int DragonEggCounter;

func void DIA_Bennet_EierBringen_Info()
{
	AI_Output(other, self, "DIA_Bennet_EierBringen_15_00"); //有 兴 趣 再 要 些 龙 蛋 吗 ？
	AI_Output(self, other, "DIA_Bennet_EierBringen_06_01"); //当 然 !

	var int DragonEggCount;
	var int XP_DJG_BringDragonEggs;
	var int DragonEggGeld;
	var string concatText;

	DragonEggCount = Npc_HasItems(other, ItAt_DragonEgg_MIS);

	if (DragonEggCount == 1)
	{
		AI_Output(other, self, "DIA_Bennet_EierBringen_15_02"); //给 你 。 我 又 弄 了 一 个 。
		B_GivePlayerXP(XP_DJG_BringDragonEgg);
		Npc_RemoveInvItems(other, ItAt_DragonEgg_MIS, 1);
		AI_PrintScreen(PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2); // "1 Gegenstand gegeben"
		DragonEggCounter = DragonEggCounter + 1;
	}
	else
	{
		AI_Output(other, self, "DIA_Bennet_EierBringen_15_03"); //我 这 里 还 有 更 多 。

		Npc_RemoveInvItems(other, ItAt_DragonEgg_MIS, DragonEggCount);
		concatText = ConcatStrings(IntToString(DragonEggCount), PRINT_ItemsGegeben); // "x Gegenstände gegeben"
		AI_PrintScreen(concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

		XP_DJG_BringDragonEggs = (DragonEggCount * XP_DJG_BringDragonEgg);
		DragonEggCounter = (DragonEggCounter + DragonEggCount);

		B_GivePlayerXP(XP_DJG_BringDragonEggs);
	};

	if (DragonEggCounter <= 7)
	{
		AI_Output(self, other, "DIA_Bennet_EierBringen_06_04"); //太 棒 了 。 放 在 这 里 。 那 么 ， 你 已 经 看 过 每 一 个 地 方 了 ？ 肯 定 还 有 更 多 。
	}
	else if (DragonEggCounter <= 11)
	{
		AI_Output(self, other, "DIA_Bennet_EierBringen_06_05"); //你 到 底 在 哪 里 挖 出 那 些 东 西 的 ？ 现 在 不 可 能 再 有 很 多 了 。
	}
	else
	{
		AI_Output(self, other, "DIA_Bennet_EierBringen_06_06"); //我 想 你 不 会 再 找 到 很 多 了 。 而 且 ， 我 已 经 有 这 么 多 了 ， 我 不 知 道 拿 它 们 有 什 么 用 。
		TOPIC_END_DRACHENEIER = TRUE;
	};

	AI_Output(self, other, "DIA_Bennet_EierBringen_06_07"); //哦 ， 对 了 。 这 是 你 的 钱 。

	DragonEggGeld = (DragonEggCount * BennetsDragonEggOffer);

	CreateInvItems(self, ItMi_Gold, DragonEggGeld);
	B_GiveInvItems(self, other, ItMi_Gold, DragonEggGeld);
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
instance DIA_Bennet_KAP5_EXIT(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 999;
	condition		= DIA_Bennet_KAP5_EXIT_Condition;
	information		= DIA_Bennet_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Bennet_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Bennet_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_KnowWhereEnemy(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 55;
	condition		= DIA_Bennet_KnowWhereEnemy_Condition;
	information		= DIA_Bennet_KnowWhereEnemy_Info;
	permanent		= TRUE;
	description		= "我 要 去 一 个 岛 上 。 我 需 要 一 名 铁 匠 。";
};

func int DIA_Bennet_KnowWhereEnemy_Condition()
{
	if ((MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Bennet_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_KnowWhereEnemy_Info()
{
	AI_Output(other, self, "DIA_Bennet_KnowWhereEnemy_15_00"); //我 要 去 一 个 岛 上 。 我 需 要 一 名 铁 匠 。
	AI_Output(self, other, "DIA_Bennet_KnowWhereEnemy_06_01"); //你 把 我 想 成 这 样 ？
	AI_Output(other, self, "DIA_Bennet_KnowWhereEnemy_15_02"); //是 的 。 你 认 为 怎 么 样 ？ 至 少 ， 那 可 以 让 你 离 开 这 里 。
	AI_Output(self, other, "DIA_Bennet_KnowWhereEnemy_06_03"); //比 欧 纳 尔 的 农 场 要 好 。 小 子 ， 就 算 地 狱 都 不 会 比 那 里 更 可 怕 。 把 我 算 上 。

	Log_CreateTopic(TOPIC_Crew, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING);
	B_LogEntry(TOPIC_Crew, TOPIC_Crew_15);

	if (crewmember_count >= Max_Crew)
	{
		AI_Output(other, self, "DIA_Bennet_KnowWhereEnemy_15_04"); //现 在 我 的 船 员 队 伍 已 经 满 了 。
		AI_Output(self, other, "DIA_Bennet_KnowWhereEnemy_06_05"); //那 就 必 须 又 要 让 一 个 人 离 开 。
	}
	else
	{
		Info_ClearChoices(DIA_Bennet_KnowWhereEnemy);
		Info_AddChoice(DIA_Bennet_KnowWhereEnemy, "当 我 需 要 你 的 时 候 ， 我 会 告 诉 你 。", DIA_Bennet_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Bennet_KnowWhereEnemy, "那 么 做 我 的 铁 匠 吧 。 港 口 见 。", DIA_Bennet_KnowWhereEnemy_Yes);
	};
};

func void DIA_Bennet_KnowWhereEnemy_Yes()
{
	AI_Output(other, self, "DIA_Bennet_KnowWhereEnemy_Yes_15_00"); //那 么 做 我 的 铁 匠 吧 。 港 口 见 。
	AI_Output(self, other, "DIA_Bennet_KnowWhereEnemy_Yes_06_01"); //好 吧 。 再 见 。

	B_GivePlayerXP(XP_Crewmember_Success);

	self.flags = NPC_FLAG_IMMORTAL;
	Bennet_IsOnBoard = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count + 1);

	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self, "SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self, "WAITFORSHIP");
	};

	Info_ClearChoices(DIA_Bennet_KnowWhereEnemy);
};

func void DIA_Bennet_KnowWhereEnemy_No()
{
	AI_Output(other, self, "DIA_Bennet_KnowWhereEnemy_No_15_00"); //当 我 需 要 你 的 时 候 ， 我 会 告 诉 你 。
	AI_Output(self, other, "DIA_Bennet_KnowWhereEnemy_No_06_01"); //好 了 。 我 知 道 了 。

	Bennet_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Bennet_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_LeaveMyShip(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 55;
	condition		= DIA_Bennet_LeaveMyShip_Condition;
	information		= DIA_Bennet_LeaveMyShip_Info;
	permanent		= TRUE;
	description		= "我 会 给 自 己 找 个 别 的 铁 匠 。";
};

func int DIA_Bennet_LeaveMyShip_Condition()
{
	if ((Bennet_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_LeaveMyShip_Info()
{
	AI_Output(other, self, "DIA_Bennet_LeaveMyShip_15_00"); //我 会 给 自 己 找 个 别 的 铁 匠 。
	AI_Output(self, other, "DIA_Bennet_LeaveMyShip_06_01"); //前 一 分 钟 是 这 样 ， 下 一 分 钟 又 是 那 样 。 下 定 决 心 ， 行 吗 ？ 一 旦 你 想 好 了 自 己 要 做 什 么 ， 就 告 诉 我 一 声 。

	Bennet_IsOnBoard = LOG_OBSOLETE; // Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit!
	crewmember_Count = (Crewmember_Count - 1);

	Npc_ExchangeRoutine(self, "Start");
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_StillNeedYou(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 55;
	condition		= DIA_Bennet_StillNeedYou_Condition;
	information		= DIA_Bennet_StillNeedYou_Info;
	permanent		= TRUE;
	description		= "回 来 吧 。 我 找 不 到 其 它 的 铁 匠 。";
};

func int DIA_Bennet_StillNeedYou_Condition()
{
	if (((Bennet_IsOnBOard == LOG_OBSOLETE)
	|| (Bennet_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_Bennet_StillNeedYou_Info()
{
	AI_Output(other, self, "DIA_Bennet_StillNeedYou_15_00"); //回 来 吧 。 我 找 不 到 其 它 的 铁 匠 。
	AI_Output(self, other, "DIA_Bennet_StillNeedYou_06_01"); //（ 愤 怒 的 ） 对 ！ 我 就 是 这 样 ， 管 他 呢 。 码 头 上 见 。

	self.flags = NPC_FLAG_IMMORTAL;
	Bennet_IsOnBoard = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count + 1);

	AI_StopProcessInfos(self);

	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self, "SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self, "WAITFORSHIP");
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Bennet_PICKPOCKET(C_INFO)
{
	npc				= SLD_809_Bennet;
	nr				= 900;
	condition		= DIA_Bennet_PICKPOCKET_Condition;
	information		= DIA_Bennet_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Bennet_PICKPOCKET_Condition()
{
	C_Beklauen(35, 45);
};

func void DIA_Bennet_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bennet_PICKPOCKET);
	Info_AddChoice(DIA_Bennet_PICKPOCKET, DIALOG_BACK, DIA_Bennet_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bennet_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Bennet_PICKPOCKET_DoIt);
};

func void DIA_Bennet_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bennet_PICKPOCKET);
};

func void DIA_Bennet_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bennet_PICKPOCKET);
};
