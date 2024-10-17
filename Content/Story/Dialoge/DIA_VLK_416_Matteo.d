// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Matteo_EXIT(C_INFO)
{
	npc				= VLK_416_Matteo;
	nr				= 999;
	condition		= DIA_Matteo_EXIT_Condition;
	information		= DIA_MAtteo_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Matteo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Matteo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Matteo_PICKPOCKET(C_INFO)
{
	npc				= VLK_416_Matteo;
	nr				= 900;
	condition		= DIA_Matteo_PICKPOCKET_Condition;
	information		= DIA_Matteo_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Matteo_PICKPOCKET_Condition()
{
	C_Beklauen(80, 150);
};

func void DIA_Matteo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Matteo_PICKPOCKET);
	Info_AddChoice(DIA_Matteo_PICKPOCKET, DIALOG_BACK, DIA_Matteo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Matteo_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Matteo_PICKPOCKET_DoIt);
};

func void DIA_Matteo_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Matteo_PICKPOCKET);
};

func void DIA_Matteo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Matteo_PICKPOCKET);
};

// ************************************************************
// 			  				   Hallo
// ************************************************************
instance DIA_Matteo_Hallo(C_INFO)
{
	npc				= VLK_416_Matteo;
	nr				= 1;
	condition		= DIA_Matteo_Hallo_Condition;
	information		= DIA_MAtteo_Hallo_Info;
	important		= TRUE;
};

func int DIA_Matteo_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Matteo_Hallo_Info()
{
	AI_Output(self, other, "DIA_Matteo_Hallo_09_00"); //我 能 为 你 做 什 么 ？
};

// ************************************************************
// 			  				   Sell What
// ************************************************************
instance DIA_Matteo_SellWhat(C_INFO)
{
	npc				= VLK_416_Matteo;
	nr				= 1;
	condition		= DIA_Matteo_SellWhat_Condition;
	information		= DIA_MAtteo_SellWhat_Info;
	description		= "你 出 售 什 么 东 西 ？";
};

func int DIA_Matteo_SellWhat_Condition()
{
	return TRUE;
};

func void DIA_Matteo_SellWhat_Info()
{
	AI_Output(other, self, "DIA_Matteo_SellWhat_15_00"); //你 出 售 什 么 东 西 ？
	AI_Output(self, other, "DIA_Matteo_SellWhat_09_01"); //我 可 以 为 你 提 供 在 荒 野 里 生 存 的 一 切 必 需 品 。 武 器 、 火 把 、 供 给 品 … … 甚 至 盔 甲 。
	AI_Output(self, other, "DIA_Matteo_SellWhat_09_02"); //我 还 留 着 一 个 特 别 的 玩 意 。
	AI_Output(self, other, "DIA_Matteo_SellWhat_09_03"); //双 倍 强 化 暴 龙 皮 盔 甲 - 还 没 用 过 的 。 感 兴 趣 吗 ？

	if (Knows_Matteo == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader, TOPIC_CityTrader_8);
		Knows_Matteo = TRUE;
	};
};

// *********************************************************
// 		  					TRADE
// *********************************************************
instance DIA_Matteo_TRADE(C_INFO)
{
	npc				= VLK_416_Matteo;
	nr				= 800;
	condition		= DIA_Matteo_TRADE_Condition;
	information		= DIA_Matteo_TRADE_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "让 我 看 看 你 的 货 物 。";
};

func int DIA_Matteo_TRADE_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Matteo_SellWhat))
	{
		return TRUE;
	};
};

var int Matteo_TradeNewsPermanent;

func void DIA_Matteo_TRADE_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other, self, "DIA_Matteo_TRADE_15_00"); //让 我 看 看 你 的 货 物 。
	if ((Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	&& (Matteo_TradeNewsPermanent == FALSE))
	{
		AI_Output(self, other, "DIA_Matteo_TRADE_09_01"); //自 从 那 个 雇 佣 兵 杀 害 了 圣 骑 士 洛 萨 ， 圣 骑 士 的 检 查 就 严 格 多 了 。
		AI_Output(self, other, "DIA_Matteo_TRADE_09_02"); //我 希 望 他 们 把 凶 手 绞 死 后 局 势 会 缓 和 一 点 。

		Matteo_TradeNewsPermanent = 1;
	};

	if ((Kapitel == 5)
	&& (Matteo_TradeNewsPermanent < 2))
	{
		AI_Output(self, other, "DIA_Matteo_TRADE_09_03"); //看 来 ， 这 次 那 些 圣 骑 士 是 动 真 格 的 了 ， 他 们 甚 至 把 守 船 的 卫 兵 都 调 回 去 了 。
		AI_Output(self, other, "DIA_Matteo_TRADE_09_04"); //你 又 开 始 恢 复 你 的 供 应 了 ， 这 是 件 好 事 ， 谁 知 道 这 座 城 市 下 个 星 期 还 在 不 在 呢 。

		Matteo_TradeNewsPermanent = 2;
	};
};

// *********************************************************
// 		  					ARMOR
// *********************************************************

// -------------------------------------
var int Matteo_LeatherBought;
// -------------------------------------
instance DIA_Matteo_LEATHER(C_INFO)
{
	npc				= VLK_416_Matteo;
	nr				= 850;
	condition		= DIA_Matteo_LEATHER_Condition;
	information		= DIA_Matteo_LEATHER_Info;
	permanent		= TRUE;
	description		= "购 买 皮 甲 。 防 护 ： 武 器 ２ ５ ， 箭 ２ ０ 。 （ ２ ５ ０ 金 币 ）";
};

func int DIA_Matteo_LEATHER_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Matteo_SellWhat))
	&& (Matteo_LeatherBought == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Matteo_LEATHER_Info()
{
	AI_Output(other, self, "DIA_Matteo_LEATHER_15_00"); //好 吧 ， 给 我 那 个 盔 甲 。

	if (B_GiveInvItems(other, self, ItMi_Gold, 250))
	{
		AI_Output(self, other, "DIA_Matteo_LEATHER_09_01"); //你 会 喜 欢 它 的 。 （ 咧 着 嘴 笑 ）

		B_GiveInvItems(self, other, ItAr_Leather_L, 1);
		Matteo_LeatherBought = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Matteo_LEATHER_09_02"); //这 套 盔 甲 价 格 不 低 - 但 是 它 值 这 个 价 。 那 么 ， 等 你 有 足 够 的 钱 了 再 来 。
	};
};

// ************************************************************
// 			  				Paladine E1
// ************************************************************
instance DIA_Matteo_Paladine(C_INFO)
{
	npc				= VLK_416_Matteo;
	nr				= 2;
	condition		= DIA_Matteo_Paladine_Condition;
	information		= DIA_MAtteo_Paladine_Info;
	description		= "关 于 那 些 圣 骑 士 你 都 知 道 什 么 事 ？";
};

func int DIA_Matteo_Paladine_Condition()
{
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_Matteo_Paladine_Info()
{
	AI_Output(other, self, "DIA_Matteo_Paladine_15_00"); //关 于 那 些 圣 骑 士 你 都 知 道 什 么 事 ？
	AI_Output(self, other, "DIA_Matteo_Paladine_09_01"); //自 从 这 些 混 蛋 来 了 这 个 城 里 ， 我 除 了 麻 烦 就 没 得 到 什 么 ！
	AI_Output(self, other, "DIA_Matteo_Paladine_09_02"); //上 一 次 我 往 城 里 富 人 区 那 头 去 的 时 候 ， 士 兵 拦 住 了 我 ， 问 我 去 那 里 有 什 么 事 ！
	AI_Output(other, self, "DIA_Matteo_Paladine_15_03"); //然 后 ？
	AI_Output(self, other, "DIA_Matteo_Paladine_09_04"); //当 然 他 们 让 我 进 去 了 ！
	AI_Output(self, other, "DIA_Matteo_Paladine_09_05"); //当 大 部 分 的 那 些 装 模 作 样 的 笨 蛋 还 在 拿 着 木 剑 赶 猪 时 ， 我 就 在 城 里 有 了 自 己 的 店 铺 ！
	AI_Output(self, other, "DIA_Matteo_Paladine_09_06"); //昨 天 那 些 混 蛋 来 了 ， 把 我 一 半 的 货 物 都 充 了 公 ！
};

// ************************************************************
// 			  				Confiscated E2
// ************************************************************
instance DIA_Matteo_Confiscated(C_INFO)
{
	npc				= VLK_416_Matteo;
	nr				= 2;
	condition		= DIA_Matteo_Confiscated_Condition;
	information		= DIA_MAtteo_Confiscated_Info;
	description		= "圣 骑 士 没 收 了 你 的 货 物 ？";
};

func int DIA_Matteo_Confiscated_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Matteo_Paladine))
	{
		return TRUE;
	};
};

func void DIA_Matteo_Confiscated_Info()
{
	AI_Output(other, self, "DIA_Matteo_Confiscated_15_00"); //圣 骑 士 没 收 了 你 的 货 物 ？
	AI_Output(self, other, "DIA_Matteo_Confiscated_09_01"); //我 储 存 在 后 院 里 的 所 有 东 西 。
	AI_Output(self, other, "DIA_Matteo_Confiscated_09_02"); //他 们 派 了 一 个 守 卫 站 在 院 子 的 入 口 前 面 。
	AI_Output(self, other, "DIA_Matteo_Confiscated_09_03"); //如 果 我 走 运 的 话 ， 他 们 不 会 拿 走 所 有 的 东 西 。 至 少 他 们 应 该 会 把 那 副 盔 甲 留 下 。
};

// ************************************************************
// 			  				HelpMeToOV E2
// ************************************************************
instance DIA_Matteo_HelpMeToOV(C_INFO)
{
	npc				= VLK_416_Matteo;
	nr				= 3;
	condition		= DIA_Matteo_HelpMeToOV_Condition;
	information		= DIA_MAtteo_HelpMeToOV_Info;
	description		= "那 么 你 能 帮 我 进 入 富 人 区 吗 ？";
};

func int DIA_Matteo_HelpMeToOV_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Matteo_Paladine))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Matteo_HelpMeToOV_Info()
{
	AI_Output(other, self, "DIA_Matteo_HelpMeToOV_15_00"); //那 么 你 能 帮 我 进 入 富 人 区 吗 ？
	AI_Output(self, other, "DIA_Matteo_HelpMeToOV_09_01"); //（ 目 瞪 口 呆 ） 什 么 ？ 你 准 备 去 那 里 干 什 么 ？
	AI_Output(other, self, "DIA_Matteo_HelpMeToOV_15_02"); //我 得 到 了 一 个 重 要 的 消 息 … …
	AI_Output(self, other, "DIA_Matteo_HelpMeToOV_09_03"); //好 ， 好 … … 你 试 过 设 法 通 过 守 卫 吗 ？

	if (Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(other, self, "DIA_Matteo_HelpMeToOV_15_04"); //（ 苦 笑 ） 哦 ， 伙 计 ， 算 了 吧 ！
		AI_Output(self, other, "DIA_Matteo_HelpMeToOV_09_05"); //（ 大 笑 ） 那 是 那 些 乞 丐 的 像 征 ！
	}
	else
	{
		AI_Output(other, self, "DIA_Matteo_HelpMeToOV_15_06"); //我 甚 至 不 明 白 自 己 为 什 么 要 去 试 。
		AI_Output(self, other, "DIA_Matteo_HelpMeToOV_09_07"); //你 也 许 是 对 的 。
	};

	AI_Output(self, other, "DIA_Matteo_HelpMeToOV_09_08"); //我 不 知 道 你 的 消 息 有 多 重 要 - 而 且 那 也 不 关 我 的 事 。
	AI_Output(self, other, "DIA_Matteo_HelpMeToOV_09_09"); //但 是 ， 即 使 你 告 诉 他 们 有 满 满 一 船 的 兽 人 刚 刚 在 港 口 靠 岸 了 ， 他 们 还 是 会 你 让 你 开 。
	AI_Output(self, other, "DIA_Matteo_HelpMeToOV_09_10"); //因 为 他 们 有 他 们 的 命 令 在 身 。
};

// ************************************************************
// 			  				HelpMeNow E3
// ************************************************************

func void B_Matteo_Preis()
{
	AI_Output(self, other, "DIA_Matteo_HelpMeNow_09_01"); //那 看 来 对 你 才 是 真 正 重 要 的 。
	AI_Output(self, other, "DIA_Matteo_HelpMeNow_09_02"); //（ 奸 诈 地 ） 问 题 在 于 ： 那 对 你 来 说 有 ‘ 多 么 ’ 重 要 ？
	AI_Output(other, self, "DIA_Matteo_HelpMeNow_15_03"); //你 在 暗 示 什 么 ？
	AI_Output(self, other, "DIA_Matteo_HelpMeNow_09_04"); //我 可 以 帮 你 - 总 之 ， 我 是 这 里 最 有 势 力 的 人 物 之 一 。
	AI_Output(self, other, "DIA_Matteo_HelpMeNow_09_05"); //但 这 得 让 你 花 点 钱 。
};
instance DIA_Matteo_HelpMeNow(C_INFO)
{
	npc				= VLK_416_Matteo;
	nr				= 3;
	condition		= DIA_Matteo_HelpMeNow_Condition;
	information		= DIA_MAtteo_HelpMeNow_Info;
	description		= "那 么 你 能 帮 我 进 入 富 人 区 吗 ？";
};

func int DIA_Matteo_HelpMeNow_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Matteo_HelpMeToOV))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Matteo_HelpMeNow_Info()
{
	AI_Output(other, self, "DIA_Matteo_HelpMeNow_15_00"); //那 么 你 能 帮 我 进 入 富 人 区 吗 ？
	B_Matteo_Preis();
};

// ************************************************************
// 			  		LEHRLING als GILDE X
// ************************************************************
instance DIA_Matteo_LehrlingLater(C_INFO)
{
	npc				= VLK_416_Matteo;
	nr				= 3;
	condition		= DIA_Matteo_LehrlingLater_Condition;
	information		= DIA_MAtteo_LehrlingLater_Info;
	description		= "帮 我 成 为 某 个 大 师 的 学 徒 ！";
};

func int DIA_Matteo_LehrlingLater_Condition()
{
	if ((Player_IsApprentice == APP_NONE)
	&& (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Matteo_LehrlingLater_Info()
{
	AI_Output(other, self, "DIA_Matteo_LehrlingLater_15_00"); //那 么 你 能 帮 我 进 入 富 人 区 吗 ？！
	B_Matteo_Preis();
};

// ************************************************************
// 			  		PriceOfHelp (MISSION) E4
// ************************************************************
instance DIA_Matteo_PriceOfHelp(C_INFO)
{
	npc				= VLK_416_Matteo;
	nr				= 3;
	condition		= DIA_Matteo_PriceOfHelp_Condition;
	information		= DIA_MAtteo_PriceOfHelp_Info;
	description		= "你 在 征 求 什 么 帮 助 ？";
};

func int DIA_Matteo_PriceOfHelp_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Matteo_HelpMeNow))
	|| (Npc_KnowsInfo(other, DIA_Matteo_LehrlingLater)))
	{
		return TRUE;
	};
};

func void DIA_Matteo_PriceOfHelp_Info()
{
	AI_Output(other, self, "DIA_Matteo_PriceOfHelp_15_00"); //你 在 征 求 什 么 帮 助 ？
	AI_Output(self, other, "DIA_Matteo_PriceOfHelp_09_01"); //1 0 0 枚 金 币 。

	Info_ClearChoices(DIA_Matteo_PriceOfHelp);
	Info_AddChoice(DIA_Matteo_PriceOfHelp, "那 太 多 了 … …", DIA_Matteo_PriceOfHelp_Wow);
	Info_AddChoice(DIA_Matteo_PriceOfHelp, "你 这 个 骗 子 ！", DIA_Matteo_PriceOfHelp_Cutthroat);
};

func void B_Matteo_RegDichAb()
{
	AI_Output(self, other, "B_Matteo_RegDichAb_09_00"); //别 紧 张 ！ 我 提 到 的 不 是 ‘ 你 的 ’ 金 子 。
	AI_Output(other, self, "B_Matteo_RegDichAb_15_01"); //但 是 ？
	AI_Output(self, other, "B_Matteo_RegDichAb_09_02"); //原 则 上 来 说 ， 那 是 我 的 金 子 。
	AI_Output(self, other, "B_Matteo_RegDichAb_09_03"); //格 里 塔 ， 就 是 木 匠 的 侄 女 ， 她 有 一 笔 货 款 好 久 了 都 还 没 还 给 我 。
	AI_Output(self, other, "B_Matteo_RegDichAb_09_04"); //但 这 个 乳 臭 未 干 的 女 人 经 常 穿 着 新 衣 服 到 处 溜 达 - 那 就 是 说 ， 她 有 钱 。
	AI_Output(self, other, "B_Matteo_RegDichAb_09_05"); //我 希 望 从 她 身 上 榨 出 这 笔 钱 ， 但 是 托 尔 本 大 师 - 那 个 木 匠 - 同 样 也 相 当 有 势 力 。
	AI_Output(self, other, "B_Matteo_RegDichAb_09_06"); //给 我 弄 到 那 笔 钱 ， 我 就 将 帮 助 你 。

	MIS_Matteo_Gold = LOG_RUNNING;
	Log_CreateTopic(Topic_Matteo, LOG_MISSION);
	Log_SetTopicStatus(Topic_Matteo, LOG_RUNNING);
	B_LogEntry(Topic_Matteo, Topic_Matteo_1);
};

func void DIA_Matteo_PriceOfHelp_Cutthroat()
{
	AI_Output(other, self, "DIA_Matteo_PriceOfHelp_Cutthroat_15_00"); //你 这 个 骗 子 ！
	B_Matteo_RegDichAb();
	Info_ClearChoices(DIA_Matteo_PriceOfHelp);
};

func void DIA_Matteo_PriceOfHelp_Wow()
{
	AI_Output(other, self, "DIA_Matteo_PriceOfHelp_Wow_15_00"); //那 太 多 了 … …
	B_Matteo_RegDichAb();
	Info_ClearChoices(DIA_Matteo_PriceOfHelp);
};

// ************************************************************
// 			  				WoGritta E5
// ************************************************************
instance DIA_Matteo_WoGritta(C_INFO)
{
	npc				= VLK_416_Matteo;
	nr				= 2;
	condition		= DIA_Matteo_WoGritta_Condition;
	information		= DIA_MAtteo_WoGritta_Info;
	description		= "我 在 哪 里 找 这 个 格 里 塔 ？";
};

func int DIA_Matteo_WoGritta_Condition()
{
	if ((MIS_Matteo_Gold == LOG_RUNNING)
	&& (Gritta.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Matteo_WoGritta_Info()
{
	AI_Output(other, self, "DIA_Matteo_WoGritta_15_00"); //我 在 哪 里 找 这 个 格 里 塔 ？
	AI_Output(self, other, "DIA_Matteo_WoGritta_09_01"); //像 我 说 的 那 样 - 她 是 那 个 木 匠 的 侄 女 - 他 的 房 子 就 在 街 道 那 头 ， 右 边 最 后 一 座 房 子 ， 在 铁 匠 铺 前 面 。
};

// ************************************************************
// 			  				GoldRunning E5
// ************************************************************
instance DIA_Matteo_GoldRunning(C_INFO)
{
	npc				= VLK_416_Matteo;
	nr				= 500;
	condition		= DIA_Matteo_GoldRunning_Condition;
	information		= DIA_MAtteo_GoldRunning_Info;
	permanent		= TRUE;
	description		= "这 是 你 的 １ ０ ０ 金 币 ！";
};

func int DIA_Matteo_GoldRunning_Condition()
{
	if ((MIS_Matteo_Gold == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Gritta_WantsMoney) || Npc_IsDead(Gritta)))
	{
		return TRUE;
	};
};

func void DIA_Matteo_GoldRunning_Info()
{
	AI_Output(other, self, "DIA_Matteo_GoldRunning_15_00"); //这 是 你 的 １ ０ ０ 金 币 ！

	// EXIT if...

	if (Npc_IsDead(Gritta))
	{
		AI_Output(self, other, "DIA_Matteo_GoldRunning_09_01"); //那 些 金 子 上 面 有 格 里 塔 的 血 迹 ！ 我 从 来 没 有 说 过 一 句 让 你 杀 掉 她 的 话 ！
		AI_Output(self, other, "DIA_Matteo_GoldRunning_09_02"); //我 不 想 管 这 件 事 。 你 可 以 忘 了 我 们 的 交 易 ！ 而 且 永 远 不 要 对 我 再 说 起 这 件 事 ！
		MIS_Matteo_Gold = LOG_FAILED;
		B_CheckLog();
		AI_StopProcessInfos(self);
		return;
	};

	// FUNC

	if (B_GiveInvItems(other, self, itmi_gold, 100))
	{
		if (Npc_HasItems(Gritta, itmi_gold) < 100)
		{
			AI_Output(self, other, "DIA_Matteo_GoldRunning_09_03"); //还 有 吗 ？ 她 惹 了 什 么 麻 烦 吗 ？
			AI_Output(other, self, "DIA_Matteo_GoldRunning_15_04"); //没 什 么 可 说 的 。
			AI_Output(self, other, "DIA_Matteo_GoldRunning_09_05"); //很 好 ！ 在 这 笔 交 易 中 ， 你 已 经 尽 到 了 自 己 的 义 务 。
		}
		else
		{
			AI_Output(self, other, "DIA_Matteo_GoldRunning_09_06"); //你 想 要 帮 她 付 钱 ？ 嗯 - 我 更 希 望 你 把 钱 从 她 那 里 榨 出 来 ！
			AI_Output(self, other, "DIA_Matteo_GoldRunning_09_07"); //尽 管 这 样 - 1 0 0 个 金 币 还 是 1 0 0 个 金 币 。
			AI_Output(self, other, "DIA_Matteo_GoldRunning_09_08"); //这 笔 交 易 中 ， 你 已 经 尽 到 了 自 己 的 义 务 。
		};

		MIS_Matteo_Gold = LOG_SUCCESS;
		B_GivePlayerXP(XP_Matteo_Gold);
	}
	else
	{
		AI_Output(self, other, "DIA_Matteo_GoldRunning_09_09"); //算 术 不 是 你 的 强 项 ， 是 吗 ？ 你 没 有 1 0 0 个 金 币 。
	};
};

// ************************************************************
// 		  				Stimme abgeben E5 - PERM
// ************************************************************
instance DIA_Matteo_Zustimmung(C_INFO)
{
	npc				= VLK_416_Matteo;
	nr				= 4;
	condition		= DIA_Matteo_Zustimmung_Condition;
	information		= DIA_MAtteo_Zustimmung_Info;
	permanent		= TRUE;
	description		= "帮 我 成 为 某 个 大 师 的 学 徒 !";
};

var int DIA_Matteo_Zustimmung_perm;
func int DIA_Matteo_Zustimmung_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Matteo_HowCanYouHelp))
	&& ((MIS_Matteo_Gold == LOG_RUNNING) || (MIS_Matteo_Gold == LOG_SUCCESS))
	&& (Player_IsApprentice == APP_NONE)
	&& (DIA_Matteo_Zustimmung_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Matteo_Zustimmung_Info()
{
	AI_Output(other, self, "DIA_Matteo_Zustimmung_15_00"); //帮 我 跟 一 个 大 师 签 约 当 学 徒 ！

	if (MIS_Matteo_Gold == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Matteo_Zustimmung_09_01"); //别 担 心 。 我 会 履 行 这 次 交 易 中 我 的 义 务 。
		AI_Output(self, other, "DIA_Matteo_Zustimmung_09_02"); //其 它 的 大 师 只 会 在 我 这 里 听 到 你 最 好 的 一 面 。

		B_GivePlayerXP(XP_Zustimmung);
		B_LogEntry(Topic_Lehrling, Topic_Lehrling_8);
		DIA_Matteo_Zustimmung_perm = TRUE;
	}
	else // LOG_RUNNING
	{
		AI_Output(self, other, "DIA_Matteo_Zustimmung_09_03"); //一 次 一 件 事 。 首 先 你 得 履 行 这 次 交 易 中 应 尽 的 义 务 ， 把 金 子 带 给 我 ！
	};
};

// ************************************************************
// 			  				HowCanYouHelp E4
// ************************************************************
instance DIA_Matteo_HowCanYouHelp(C_INFO)
{
	npc				= VLK_416_Matteo;
	nr				= 4;
	condition		= DIA_Matteo_HowCanYouHelp_Condition;
	information		= DIA_MAtteo_HowCanYouHelp_Info;
	description		= "你 究 竟 能 怎 么 帮 我 ？";
};

func int DIA_Matteo_HowCanYouHelp_Condition()
{
	if (((Npc_KnowsInfo(other, DIA_Matteo_HelpMeNow))
	|| (Npc_KnowsInfo(other, DIA_Matteo_LehrlingLater)))
	&& (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Matteo_HowCanYouHelp_Info()
{
	AI_Output(other, self, "DIA_Matteo_HowCanYouHelp_15_00"); //你 究 竟 能 怎 么 帮 我 ？
	AI_Output(self, other, "DIA_Matteo_HowCanYouHelp_09_01"); //非 常 简 单 。 我 将 用 我 的 影 响 力 使 这 里 的 一 位 工 匠 大 师 接 纳 你 成 为 学 徒 。
	if (other.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Matteo_HowCanYouHelp_09_02"); //这 样 的 话 ， 实 际 上 你 就 将 成 为 城 里 市 民 的 一 员 ， 并 能 进 入 富 人 区 了 。 此 外 ， 你 在 这 里 的 时 候 还 能 挣 到 一 些 钱 。
	};

	Log_CreateTopic(TOPIC_Lehrling, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling, LOG_RUNNING);
	B_LogEntry(TOPIC_Lehrling, TOPIC_Lehrling_9);
};

// ************************************************************
// 			  				WoAlsLehrling E5
// ************************************************************
instance DIA_Matteo_WoAlsLehrling(C_INFO)
{
	npc				= VLK_416_Matteo;
	nr				= 4;
	condition		= DIA_Matteo_WoAlsLehrling_Condition;
	information		= DIA_MAtteo_WoAlsLehrling_Info;
	description		= "那 我 怎 么 签 约 成 为 学 徒 ？";
};

func int DIA_Matteo_WoAlsLehrling_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Matteo_HowCanYouHelp))
	&& (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Matteo_WoAlsLehrling_Info()
{
	AI_Output(other, self, "DIA_Matteo_WoAlsLehrling_15_00"); //那 我 怎 么 签 约 成 为 学 徒 ？
	AI_Output(self, other, "DIA_Matteo_WoAlsLehrling_09_01"); //基 本 上 ， 这 里 所 有 的 大 师 都 在 主 街 道 上 。
	AI_Output(self, other, "DIA_Matteo_WoAlsLehrling_09_02"); //他 们 是 铁 匠 哈 莱 德 、 制 弓 匠 伯 斯 波 、 木 匠 托 尔 本 和 炼 金 术 士 康 斯 坦 提 诺 。
	AI_Output(self, other, "DIA_Matteo_WoAlsLehrling_09_03"); //他 们 中 的 某 一 位 一 定 会 接 纳 你 的 。
	AI_Output(self, other, "DIA_Matteo_WoAlsLehrling_09_04"); //但 是 ， 重 要 的 是 其 它 的 大 师 也 要 同 意 你 。 这 是 克 霍 里 尼 斯 里 向 来 的 惯 例 。

	Log_CreateTopic(Topic_Lehrling, LOG_MISSION);
	Log_SetTopicStatus(Topic_Lehrling, LOG_RUNNING);
	B_LogEntry(Topic_Lehrling, Topic_Lehrling_10);
	Log_AddEntry(Topic_Lehrling, Topic_Lehrling_11);
};

// ************************************************************
// 			  				WieZustimmung E6
// ************************************************************
instance DIA_Matteo_WieZustimmung(C_INFO)
{
	npc				= VLK_416_Matteo;
	nr				= 5;
	condition		= DIA_Matteo_WieZustimmung_Condition;
	information		= DIA_MAtteo_WieZustimmung_Info;
	description		= "我 怎 么 才 能 得 到 其 它 大 师 的 批 准 ？";
};

func int DIA_Matteo_WieZustimmung_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Matteo_WoAlsLehrling) || Npc_KnowsInfo(other, DIA_Matteo_WarumNichtBeiDir))
	&& (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Matteo_WieZustimmung_Info()
{
	AI_Output(other, self, "DIA_Matteo_WieZustimmung_15_00"); //我 怎 么 才 能 得 到 其 它 大 师 的 批 准 ？
	AI_Output(self, other, "DIA_Matteo_WieZustimmung_09_01"); //你 必 须 得 说 服 他 们 。 去 跟 他 们 谈 谈 。
	AI_Output(self, other, "DIA_Matteo_WieZustimmung_09_02"); //但 是 如 果 他 们 中 有 超 过 一 位 的 人 反 对 你 ， 你 就 没 有 机 会 ！ 所 以 ， 注 意 你 的 言 行 ！

	B_LogEntry(Topic_Lehrling, Topic_Lehrling_12);
};

// ************************************************************
// 			  				WarumNichtBeiDir E5
// ************************************************************
instance DIA_Matteo_WarumNichtBeiDir(C_INFO)
{
	npc				= VLK_416_Matteo;
	nr				= 6;
	condition		= DIA_Matteo_WarumNichtBeiDir_Condition;
	information		= DIA_MAtteo_WarumNichtBeiDir_Info;
	description		= "你 为 什 么 不 收 我 做 学 徒 ？";
};

func int DIA_Matteo_WarumNichtBeiDir_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Matteo_HowCanYouHelp))
	&& (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Matteo_WarumNichtBeiDir_Info()
{
	AI_Output(other, self, "DIA_Matteo_WarumNichtBeiDir_15_00"); //你 为 什 么 不 收 我 做 学 徒 ？
	AI_Output(self, other, "DIA_Matteo_WarumNichtBeiDir_09_01"); //我 会 的 - 但 是 其 它 的 大 师 们 不 会 同 意 。
	AI_Output(self, other, "DIA_Matteo_WarumNichtBeiDir_09_02"); //我 最 近 刚 刚 收 了 一 个 学 徒 。
};

// ************************************************************
// 			  				Andere Möglichkeie E5
// ************************************************************
instance DIA_Matteo_OtherWay(C_INFO)
{
	npc				= VLK_416_Matteo;
	nr				= 6;
	condition		= DIA_Matteo_OtherWay_Condition;
	information		= DIA_MAtteo_OtherWay_Info;
	description		= "还 有 其 它 方 法 进 入 富 人 区 吗 ？ ";
};

func int DIA_Matteo_OtherWay_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Matteo_HowCanYouHelp))
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Matteo_OtherWay_Info()
{
	AI_Output(other, self, "DIA_Matteo_OtherWay_15_00"); //还 有 其 它 方 法 进 入 富 人 区 吗 ？
	AI_Output(self, other, "DIA_Matteo_OtherWay_09_01"); //也 许 … … 如 果 我 想 到 了 什 么 ， 我 会 告 诉 你 。
};

// ************************************************************
// 		Minenanteil
// ************************************************************
instance DIA_Matteo_Minenanteil(C_INFO)
{
	npc				= VLK_416_Matteo;
	nr				= 3;
	condition		= DIA_Matteo_Minenanteil_Condition;
	information		= DIA_MAtteo_Minenanteil_Info;
	description		= "你 的 货 物 里 有 一 些 矿 井 股 票 。";
};

func int DIA_Matteo_Minenanteil_Condition()
{
	if ((other.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Matteo_SellWhat)))
	{
		return TRUE;
	};
};

func void DIA_Matteo_Minenanteil_Info()
{
	AI_Output(other, self, "DIA_Matteo_Minenanteil_15_00"); //你 的 物 品 中 有 一 些 矿 井 股 票 。 谁 把 它 们 卖 给 你 的 ？
	AI_Output(self, other, "DIA_Matteo_Minenanteil_09_01"); //（ 不 安 的 ） 矿 井 股 票 ？ 哎 呦 。 它 们 从 哪 里 来 的 ？ 我 不 知 道 在 哪 里 弄 到 它 们 的 。 确 实 是 这 样 ， 尊 敬 的 先 生 。
	B_GivePlayerXP(XP_Ambient);
};
