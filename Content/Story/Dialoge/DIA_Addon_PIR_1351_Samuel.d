// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Addon_Samuel_EXIT(C_INFO)
{
	npc				= PIR_1351_Addon_Samuel;
	nr				= 999;
	condition		= DIA_Addon_Samuel_EXIT_Condition;
	information		= DIA_Addon_Samuel_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Samuel_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				   Hello
// ************************************************************
instance DIA_Addon_Samuel_Hello(C_INFO)
{
	npc				= PIR_1351_Addon_Samuel;
	nr				= 1;
	condition		= DIA_Addon_Samuel_Hello_Condition;
	information		= DIA_Addon_Samuel_Hello_Info;
	important		= TRUE;
};

func int DIA_Addon_Samuel_Hello_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Samuel_Hello_Info()
{
	AI_Output(self, other, "DIA_Addon_Samuel_Hello_14_00"); //啊 ， 一 张 新 面 孔 ！
	AI_Output(self, other, "DIA_Addon_Samuel_Hello_14_01"); //你 想 要 什 么 - 朗 姆 酒 还 是 什 么 更 烈 的 东 西 ？

	Log_CreateTopic(Topic_Addon_PIR_Trader, LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Trader, Log_Text_Addon_SamuelTrade);
};

// ************************************************************
// 			  				Francis
// ************************************************************
instance DIA_Addon_Samuel_Francis(C_INFO)
{
	npc				= PIR_1351_Addon_Samuel;
	nr				= 2;
	condition		= DIA_Addon_Samuel_Francis_Condition;
	information		= DIA_Addon_Samuel_Francis_Info;
	description		= "我 想 要 和 你 谈 谈 关 于 弗 朗 西 斯 的 事 。";
};

func int DIA_Addon_Samuel_Francis_Condition()
{
	if (Francis_ausgeschissen == FALSE)
	{
		if ((Npc_KnowsInfo(other, DIA_Addon_Skip_GregsHut))
		|| (Francis.aivar[AIV_TalkedToPlayer] == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Samuel_Francis_Info()
{
	AI_Output(other, self, "DIA_Addon_Samuel_Francis_15_00"); //我 想 要 和 你 谈 谈 关 于 弗 朗 西 斯 的 事 。
	AI_Output(self, other, "DIA_Addon_Samuel_Francis_14_01"); //只 是 不 要 提 起 那 个 自 诩 的 船 长 ！
	AI_Output(self, other, "DIA_Addon_Samuel_Francis_14_02"); //他 的 肥 屁 股 整 天 只 会 坐 着 ， 而 且 装 作 很 重 要 的 样 子 ！
	AI_Output(self, other, "DIA_Addon_Samuel_Francis_14_03"); //我 们 都 想 知 道 ， 当 那 个 船 长 在 这 里 下 命 令 时 他 究 竟 是 怎 么 想 的 ！
	AI_Output(self, other, "DIA_Addon_Samuel_Francis_14_04"); //你 想 从 那 个 蠢 货 那 里 得 到 什 么 ？
};

// ************************************************************
// 			  		In Gregs Hütte (Versteck)
// ************************************************************
instance DIA_Addon_Samuel_Versteck(C_INFO)
{
	npc				= PIR_1351_Addon_Samuel;
	nr				= 3;
	condition		= DIA_Addon_Samuel_Versteck_Condition;
	information		= DIA_Addon_Samuel_Versteck_Info;
	description		= "我 必 须 要 进 入 格 雷 格 的 小 屋 。";
};

func int DIA_Addon_Samuel_Versteck_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Samuel_Francis))
	&& (Francis_ausgeschissen == FALSE)
	&& (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Samuel_Versteck_Info()
{
	AI_Output(other, self, "DIA_Addon_Samuel_Francis_15_02"); //我 必 须 要 进 入 格 雷 格 的 小 屋 。
	AI_Output(self, other, "DIA_Addon_Samuel_Francis_14_05"); //（ 狡 诈 的 ） 真 的 ？ 做 什 么 ？
	AI_Output(other, self, "DIA_Addon_Samuel_Francis_15_01"); //我 需 要 一 套 强 盗 盔 甲 。
	AI_Output(self, other, "DIA_Addon_Samuel_Francis_14_06"); //（ 大 笑 ） 弗 朗 西 斯 永 远 不 会 让 你 进 小 屋 去 拿 格 雷 格 的 东 西 。
	AI_Output(self, other, "DIA_Addon_Samuel_Francis_14_07"); //除 非 … …
	AI_Output(other, self, "DIA_Addon_Samuel_Francis_15_03"); //嗯 ？
	AI_Output(self, other, "DIA_Addon_Samuel_Francis_14_08"); //… … 你 有 一 些 他 非 常 想 要 的 东 西 。
	AI_Output(self, other, "DIA_Addon_Samuel_Francis_14_09"); //我 知 道 那 个 弗 朗 西 斯 在 峡 谷 里 一 座 废 弃 的 矿 井 中 藏 了 一 些 东 西 。
	AI_Output(self, other, "DIA_Addon_Samuel_Francis_14_10"); //以 前 ， 有 一 次 我 们 一 起 执 行 守 卫 任 务 的 时 候 ， 他 像 平 时 一 样 在 打 盹 ， 他 是 在 睡 觉 时 候 去 做 的 。
	AI_Output(self, other, "DIA_Addon_Samuel_Francis_14_11"); //我 不 知 道 他 在 那 里 埋 了 什 么 ， 但 是 也 许 它 非 常 重 要 ， 甚 至 他 愿 意 让 你 进 入 小 屋 以 换 回 它 … …
	AI_Output(self, other, "DIA_Addon_Samuel_Francis_14_12"); //（ 快 乐 的 ） 等 船 长 回 来 并 发 现 他 的 东 西 失 踪 了 的 话 ， 他 一 定 会 扒 了 弗 朗 西 斯 的 皮 。

	B_LogEntry(TOPIC_Addon_BDTRuestung, TOPIC_Addon_BDTRuestung_4);
};

// ************************************************************
// 			  				Rezepte
// ************************************************************
var int Samuel_Knows_LousHammer;
var int Samuel_Knows_SchlafHammer;
// ------------------------------------------------------------
instance DIA_Addon_Samuel_Recipe(C_INFO)
{
	npc				= PIR_1351_Addon_Samuel;
	nr				= 4;
	condition		= DIA_Addon_Samuel_Recipe_Condition;
	information		= DIA_Addon_Samuel_Recipe_Info;
	permanent		= TRUE;
	description		= "我 有 一 个 配 方 可 以 给 你 ！";
};

func int DIA_Addon_Samuel_Recipe_Condition()
{
	if (((Samuel_Knows_LousHammer == FALSE) && (Npc_HasItems(other, ITWr_Addon_Lou_Rezept) > 0))
	|| ((Samuel_Knows_SchlafHammer == FALSE) && (Npc_HasItems(other, ITWr_Addon_Lou_Rezept2) > 0)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Samuel_Recipe_Info()
{
	AI_Output(other, self, "DIA_Addon_Samuel_Recipe_15_00"); //我 有 一 个 配 方 可 以 给 你 ！
	AI_Output(self, other, "DIA_Addon_Samuel_Recipe_14_01"); //棒 极 了 ， 让 我 看 看 。 什 么 样 的 配 方 ？

	Info_ClearChoices(DIA_Addon_Samuel_Recipe);
	if ((Samuel_Knows_LousHammer == FALSE)
	&& (Npc_HasItems(other, ITWr_Addon_Lou_Rezept) > 0))
	{
		Info_AddChoice(DIA_Addon_Samuel_Recipe, "卢 的 海 默 酒", DIA_Addon_Samuel_Recipe_LousHammer);
	};

	if ((Samuel_Knows_SchlafHammer == FALSE)
	&& (Npc_HasItems(other, ITWr_Addon_Lou_Rezept2) > 0))
	{
		Info_AddChoice(DIA_Addon_Samuel_Recipe, "卢 的 双 倍 海 默 酒", DIA_Addon_Samuel_Recipe_LousDoubleHammer);
	};
};

func void DIA_Addon_Samuel_Recipe_Back()
{
	Info_ClearChoices(DIA_Addon_Samuel_Recipe);
};

func void DIA_Addon_Samuel_Recipe_LousHammer()
{
	AI_Output(other, self, "DIA_Addon_Samuel_Recipe_LousHammer_15_00"); //从 斯 耐 夫 那 里 弄 到 的 。
	B_GiveInvItems(other, self, ITWr_Addon_Lou_Rezept, 1);
	B_UseFakeScroll();
	AI_Output(self, other, "DIA_Addon_Samuel_Recipe_LousHammer_14_04"); //但 是 那 听 起 来 很 恐 怖 - 我 必 须 马 上 试 一 下 。

	B_GivePlayerXP(XP_Ambient);
	Samuel_Knows_LousHammer = TRUE;
};

func void DIA_Addon_Samuel_Recipe_LousDoubleHammer()
{
	AI_Output(other, self, "DIA_Addon_Samuel_Recipe_LousDoubleHammer_15_00"); //小 心 - 那 绝 对 是 致 命 的 东 西 ！
	B_GiveInvItems(other, self, ITWr_Addon_Lou_Rezept2, 1);
	B_UseFakeScroll();
	AI_Output(self, other, "DIA_Addon_Samuel_Recipe_LousDoubleHammer_14_04"); //你 在 吓 唬 我 。 但 是 我 无 论 如 何 也 要 试 试 它 。

	B_GivePlayerXP(XP_Ambient);
	Samuel_Knows_SchlafHammer = TRUE;
};

// ************************************************************
// 			  	  				 Grog
// ************************************************************
var int Samuel_Grog_Varianz;
// ------------------------------------------------------------
instance DIA_Addon_Samuel_Grog(C_INFO)
{
	npc				= PIR_1351_Addon_Samuel;
	nr				= 5;
	condition		= DIA_Addon_Samuel_Grog_Condition;
	information		= DIA_Addon_Samuel_Grog_Info;
	permanent		= TRUE;
	description		= "我 要 一 些 烈 酒 ！ （ １ ０ 金 币 ）";
};

func int DIA_Addon_Samuel_Grog_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_Grog_Info()
{
	AI_Output(other, self, "DIA_Addon_Samuel_Grog_15_00"); //我 来 拿 我 的 那 一 份 烈 酒 。
	if (B_GiveInvItems(other, self, itmi_gold, 10))
	{
		if (Samuel_Grog_Varianz == 0)
		{
			AI_Output(self, other, "DIA_Addon_Samuel_Grog_14_01"); //你 们 这 些 家 伙 没 有 烈 酒 什 么 都 不 做 ， 嗯 ？ 好 吧 ， 给 你 。
			Samuel_Grog_Varianz = 1;
		}
		else if (Samuel_Grog_Varianz == 1)
		{
			AI_Output(self, other, "DIA_Addon_Samuel_Grog_14_02"); //我 希 望 它 能 入 口 。 我 的 淡 水 已 经 喝 完 了 。 但 是 含 有 一 点 点 盐 分 的 水 不 会 要 任 何 人 的 命 ， 对 吗 ？
			Samuel_Grog_Varianz = 2;
		}
		else // (Samuel_Grog_Varianz == 2)
		{
			AI_Output(self, other, "DIA_Addon_Samuel_Grog_14_03"); //你 想 喝 多 少 烈 酒 就 喝 多 少 ！
		};

		B_GiveInvItems(self, other, ItFo_Addon_Grog, 1);
	}
	else // nicht genug Gold
	{
		AI_Output(self, other, "DIA_Addon_Samuel_Grog_14_04"); //我 卖 的 很 便 宜 ， 但 是 不 会 白 送 ！ 先 去 弄 点 钱 吧 ， 小 子 ！
	};
};

// ************************************************************
// 			  	  				Rum
// ************************************************************
var int Samuel_Rum_Varianz;
// ------------------------------------------------------------
instance DIA_Addon_Samuel_Rum(C_INFO)
{
	npc				= PIR_1351_Addon_Samuel;
	nr				= 6;
	condition		= DIA_Addon_Samuel_Rum_Condition;
	information		= DIA_Addon_Samuel_Rum_Info;
	permanent		= TRUE;
	description		= "给 我 一 些 朗 姆 酒 （ ３ ０ 金 币 ）";
};

func int DIA_Addon_Samuel_Rum_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_Rum_Info()
{
	AI_Output(other, self, "DIA_Addon_Samuel_Rum_15_00"); //我 要 朗 姆 酒 ！

	if (B_GiveInvItems(other, self, ItMi_Gold, 30))
	{
		if (Samuel_Rum_Varianz == 0)
		{
			AI_Output(self, other, "DIA_Addon_Samuel_Rum_14_01"); //啊 ！ 对 水 手 来 讲 ， 这 是 母 亲 的 乳 汁 ！ 给 ！
			Samuel_Rum_Varianz = 1;
		}
		else if (Samuel_Rum_Varianz == 1)
		{
			AI_Output(self, other, "DIA_Addon_Samuel_Rum_14_02"); //这 些 朗 姆 酒 可 能 尝 起 来 有 些 鱼 腥 味 ， 因 为 我 们 这 里 只 有 这 样 的 旧 鱼 桶 。 不 过 朗 姆 酒 就 是 朗 姆 酒 。 为 健 康 干 杯 ！
			Samuel_Rum_Varianz = 2;
		}
		else // (Samuel_Rum_Varianz == 2)
		{
			AI_Output(self, other, "DIA_Addon_Samuel_Rum_14_03"); //给 你 吧 ！
		};

		B_GiveInvItems(self, other, ItFo_Addon_rum, 1);
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Samuel_Rum_14_04"); //你 没 有 足 够 的 金 币 ， 朋 友 ！ 来 点 掺 水 的 酒 怎 么 样 ？
	};
};

// ************************************************************
// 			  	  			Was Stärkeres
// ************************************************************
var int Samuel_Stronger_Varianz;
var int Samuel_DoppelHammer_Varianz;
// ------------------------------------------------------------
instance DIA_Addon_Samuel_Stronger(C_INFO)
{
	npc				= PIR_1351_Addon_Samuel;
	nr				= 7;
	condition		= DIA_Addon_Samuel_Stronger_Condition;
	information		= DIA_Addon_Samuel_Stronger_Info;
	permanent		= TRUE;
	description		= "我 要 更 烈 一 些 的 ！";
};

func int DIA_Addon_Samuel_Stronger_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_Stronger_Info()
{
	AI_Output(other, self, "DIA_Addon_Samuel_Stronger_15_00"); //我 要 更 烈 一 些 的 ！

	if (Samuel_Stronger_Varianz == 0)
	{
		AI_Output(self, other, "DIA_Addon_Samuel_Stronger_14_01"); //啊 ， 一 个 搜 索 者 ！ 我 总 是 追 求 一 些 新 的 配 方 ！
		AI_Output(self, other, "DIA_Addon_Samuel_Stronger_14_02"); //好 的 烈 性 酒 应 该 醇 而 且 厚 ， 并 象 液 体 火 焰 一 样 让 你 的 喉 咙 烧 起 来 。
		AI_Output(self, other, "DIA_Addon_Samuel_Stronger_14_03"); //你 不 会 经 常 遇 到 。 但 是 我 说 的 太 多 了 。 你 想 喝 一 杯 ！
		AI_Output(self, other, "DIA_Addon_Samuel_Stronger_14_04"); //给 ！ 我 自 己 的 配 方 ！ 你 喜 欢 它 吗 ？ 我 管 它 叫 ‘ 急 躁 鲱 鱼 ’
		B_GiveInvItems(self, other, ItFo_Addon_Schnellerhering, 1);
		B_UseItem(other, ItFo_Addon_Schnellerhering);
		AI_Output(other, self, "DIA_Addon_Samuel_Stronger_15_05"); //令 人 难 忘 ！
		AI_Output(self, other, "DIA_Addon_Samuel_Stronger_14_06"); //（ 大 笑 ） 你 可 以 再 说 一 遍 ！
		AI_Output(self, other, "DIA_Addon_Samuel_Stronger_14_07"); //你 不 会 刚 好 知 道 某 种 烈 性 酒 的 配 方 吧 ？ 如 果 你 知 道 ， 一 定 要 告 诉 我 。
		AI_Output(self, other, "DIA_Addon_Samuel_Stronger_14_08"); //还 要 吗 ？
		Samuel_Stronger_Varianz = 1;
	}
	else // (Samuel_Stronger_Varianz == 1)
	{
		AI_Output(self, other, "DIA_Addon_Samuel_Stronger_14_09"); //给 你 的 毒 药 起 个 名 字 ？
	};

	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger, DIALOG_BACK, DIA_Addon_Samuel_Stronger_Back);
	if (Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger, "卢 的 双 倍 海 默 酒 （ ６ ０ 金 币 ）", DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};

	if (Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger, "卢 的 海 默 酒 （ ３ ０ 金 币 ）", DIA_Addon_Samuel_Stronger_LousHammer);
	};

	Info_AddChoice(DIA_Addon_Samuel_Stronger, "急 躁 鲱 鱼 （ ３ ０ 金 币 ）", DIA_Addon_Samuel_Stronger_SchnellerHering);
};

// ------------------------------------------------------------
func void B_Addon_Samuel_NoGold()
{
	AI_Output(self, other, "DIA_Addon_Samuel_NoGold_14_00"); //没 有 钱 ， 就 没 有 酒 ！
};

// ------------------------------------------------------------

func void DIA_Addon_Samuel_Stronger_Back()
{
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
};

func void DIA_Addon_Samuel_Stronger_SchnellerHering()
{
	AI_Output(other, self, "DIA_Addon_Samuel_Stronger_SchnellerHering_15_00"); //给 我 一 点 你 的 急 躁 鲱 鱼 。
	if (B_GiveInvItems(other, self, ItMi_Gold, 30))
	{
		AI_Output(self, other, "DIa_Addon_Samuel_Stronger_SchnellerHering_14_01"); //像 劣 质 肥 料 一 样 ， 但 是 有 劲 ！
		B_GiveInvItems(self, other, ItFo_Addon_SchnellerHering, 1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};

	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger, DIALOG_BACK, DIA_Addon_Samuel_Stronger_Back);
	if (Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger, "卢 的 双 倍 海 默 酒 （ ６ ０ 金 币 ）", DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};

	if (Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger, "卢 的 海 默 酒 （ ３ ０ 金 币 ）", DIA_Addon_Samuel_Stronger_LousHammer);
	};

	Info_AddChoice(DIA_Addon_Samuel_Stronger, "急 躁 鲱 鱼 （ ３ ０ 金 币 ）", DIA_Addon_Samuel_Stronger_SchnellerHering);
};

func void DIA_Addon_Samuel_Stronger_LousHammer()
{
	AI_Output(other, self, "DIA_Addon_Samuel_Stronger_LousHammer_15_00"); //我 想 要 卢 的 海 默 酒 ！
	if (B_GiveInvItems(other, self, ItMi_Gold, 30))
	{
		AI_Output(self, other, "DIA_Addon_Samuel_Stronger_LousHammer_14_01"); //好 东 西 ！ 干 杯 ！
		B_GiveInvItems(self, other, ItFo_Addon_LousHammer, 1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};

	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger, DIALOG_BACK, DIA_Addon_Samuel_Stronger_Back);
	if (Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger, "卢 的 双 倍 海 默 酒 （ ６ ０ 金 币 ）", DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};

	if (Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger, "卢 的 海 默 酒 （ ３ ０ 金 币 ）", DIA_Addon_Samuel_Stronger_LousHammer);
	};

	Info_AddChoice(DIA_Addon_Samuel_Stronger, "急 躁 鲱 鱼 （ ３ ０ 金 币 ）", DIA_Addon_Samuel_Stronger_SchnellerHering);
};

func void DIA_Addon_Samuel_Stronger_LousDoubleHammer()
{
	AI_Output(other, self, "DIA_Addon_Samuel_Stronger_LousDoubleHammer_15_00"); //（ 随 便 的 ） 给 我 双 份的 ， 双 倍 海 默 酒 。
	if (B_GiveInvItems(other, self, ItMi_Gold, Value_SchlafHammer))
	{
		if (Samuel_DoppelHammer_Varianz == 0)
		{
			AI_Output(self, other, "DIA_Addon_Samuel_Stronger_LousDoubleHammer_14_01"); //不 要 做 任 何 会 让 你 自 己 后 悔 的 事 ， 小 子 。 我 希 望 你 不 会 亲 自 尝 到 这 个 。
		}
		else
		{
			AI_Output(self, other, "DIa_Addon_Samuel_Stronger_LousDoubleHammer_14_02"); //（ 粗 暴 的 ） 是 的 ！ 没 有 能 够 像 它 那 样 恢 复 你 的 心 情 的 东 西 ！
		};

		B_GiveInvItems(self, other, ItFo_Addon_SchlafHammer, 1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};

	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger, DIALOG_BACK, DIA_Addon_Samuel_Stronger_Back);
	if (Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger, "卢 的 双 倍 海 默 酒 （ ６ ０ 金 币 ）", DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};

	if (Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger, "卢 的 海 默 酒 （ ３ ０ 金 币 ）", DIA_Addon_Samuel_Stronger_LousHammer);
	};

	Info_AddChoice(DIA_Addon_Samuel_Stronger, "急 躁 鲱 鱼 （ ３ ０ 金 币 ）", DIA_Addon_Samuel_Stronger_SchnellerHering);
};

// ************************************************************
// 			  				 Trade
// ************************************************************
instance DIA_Addon_Samuel_Trade(C_INFO)
{
	npc				= PIR_1351_Addon_Samuel;
	nr				= 8;
	condition		= DIA_Addon_Samuel_Trade_Condition;
	information		= DIA_Addon_Samuel_Trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "你 还 有 什 么 ？";
};

func int DIA_Addon_Samuel_Trade_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_Trade_Info()
{
	B_GiveTradeInv(self);

	Npc_RemoveInvItems(self, ItFo_Addon_Grog, Npc_HasItems(self, ItFo_Addon_Grog));
	CreateInvItems(self, ItFo_Addon_Grog, 15);

	AI_Output(other, self, "DIA_Addon_Samuel_Trade_15_00"); //你 还 有 什 么 ？
	AI_Output(self, other, "DIA_Addon_Samuel_Trade_14_01"); //我 可 以 给 你 任 何 海 盗 用 以 生 存 的 东 西 ！
};

// ************************************************************
// 			  	Was gibt's neues im Lager (PERM)
// ************************************************************
instance DIA_Addon_Samuel_News(C_INFO)
{
	npc				= PIR_1351_Addon_Samuel;
	nr				= 99;
	condition		= DIA_Addon_Samuel_News_Condition;
	information		= DIA_Addon_Samuel_News_Info;
	permanent		= TRUE;
	description		= "营 地 近 来 有 什 么 新 消 息 ？";
};

func int DIA_Addon_Samuel_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_News_Info()
{
	AI_Output(other, self, "DIA_Addon_Samuel_News_15_00"); //营 地 近 来 有 什 么 新 消 息 ？

	if ((Npc_IsDead(Francis))
	|| (Francis_ausgeschissen == TRUE))
	{
		AI_Output(self, other, "DIA_Addon_Samuel_News_14_01"); //弗 朗 西 斯 罪 有 应 得 ！ 我 说 不 出 那 让 我 多 么 的 高 兴 ！
		AI_Output(self, other, "DIA_Addon_Samuel_News_14_02"); //你 没 有 事 吧 ， 我 们 喝 一 杯 - 我 请 客 ！
		if (GregIsBack == TRUE)
		{
			AI_Output(self, other, "DIA_Addon_Samuel_News_14_03"); //格 雷 格 终 于 回 来 了 。 他 的 船 丢 了 ， 但 是 至 少 他 恢 复 了 营 地 的 秩 序 。
		};
	}
	else // Greg noch weg UND Francis lebt noch
	{
		if (!Npc_IsDead(Morgan))
		{
			AI_Output(self, other, "DIA_Addon_Samuel_News_14_04"); //自 从 格 雷 格 离 开 后 ， 这 里 没 发 生 任 何 事 。 摩 根 和 他 的 人 只 是 整 天 游 荡 、 饮 酒 作 乐 。
		};

		if (!Npc_IsDead(Henry))
		{
			AI_Output(self, other, "DIA_Addon_Samuel_News_14_05"); //唯 一 做 了 点 事 的 就 是 亨 利 。 他 和 他 的 人 正 在 修 建 栅 栏 。
		};

		AI_Output(self, other, "DIA_Addon_Samuel_News_14_06"); //船 长 格 雷 格 早 应 该 回 来 ， 并 好 好 教 训 一 下 那 个 弗 朗 西 斯 ！
	};
};
