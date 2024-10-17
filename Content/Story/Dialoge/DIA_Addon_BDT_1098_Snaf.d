// ---------------------------------------------------------------------
//	Info EXIT
// ---------------------------------------------------------------------
instance DIA_Addon_Snaf_EXIT(C_INFO)
{
	npc				= BDT_1098_Addon_Snaf;
	nr				= 999;
	condition		= DIA_Addon_Snaf_EXIT_Condition;
	information		= DIA_Addon_Snaf_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Snaf_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Snaf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Snaf_PICKPOCKET(C_INFO)
{
	npc				= BDT_1098_Addon_Snaf;
	nr				= 900;
	condition		= DIA_Addon_Snaf_PICKPOCKET_Condition;
	information		= DIA_Addon_Snaf_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Addon_Snaf_PICKPOCKET_Condition()
{
	C_Beklauen(49, 56);
};

func void DIA_Addon_Snaf_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Snaf_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Snaf_PICKPOCKET, DIALOG_BACK, DIA_Addon_Snaf_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Snaf_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Snaf_PICKPOCKET_DoIt);
};

func void DIA_Addon_Snaf_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Snaf_PICKPOCKET);
};

func void DIA_Addon_Snaf_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Snaf_PICKPOCKET);
};

// ---------------------------------------------------------------------
//	Info Hi
// ---------------------------------------------------------------------
instance DIA_Addon_Snaf_Hi(C_INFO)
{
	npc				= BDT_1098_Addon_Snaf;
	nr				= 1;
	condition		= DIA_Addon_Snaf_Hi_Condition;
	information		= DIA_Addon_Snaf_Hi_Info;
	important		= TRUE;
};

func int DIA_Addon_Snaf_Hi_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_Hi_Info()
{
	AI_Output(self, other, "DIA_Addon_Snaf_Hi_01_00"); //你 想 要 吃 的 还 是 来 聊 天 ？ 要 什 么 ？
};

// ---------------------------------------------------------------------
//	Was gibt's denn leckeres?
// ---------------------------------------------------------------------
instance DIA_Addon_Snaf_Cook(C_INFO)
{
	npc				= BDT_1098_Addon_Snaf;
	nr				= 2;
	condition		= DIA_Addon_Snaf_Cook_Condition;
	information		= DIA_Addon_Snaf_Cook_Info;
	description		= "菜 单 上 有 什 么 ？";
};

func int DIA_Addon_Snaf_Cook_Condition()
{
	return TRUE;
};

func void DIA_Addon_Snaf_Cook_Info()
{
	AI_Output(other, self, "DIA_Addon_Snaf_Cook_15_00"); //菜 单 上 有 什 么 ？
	AI_Output(self, other, "DIA_Addon_Snaf_Cook_01_01"); //我 想 试 验 一 道 新 菜 - ‘ 海 默 酒 加 火 带 ’ 。

	Info_ClearChoices(DIA_Addon_Snaf_Cook);
	Info_AddChoice(DIA_Addon_Snaf_Cook, "火 带 ？ ", DIA_Addon_Snaf_Cook_FEUER);
	Info_AddChoice(DIA_Addon_Snaf_Cook, "海 默 酒 ？ ", DIA_Addon_Snaf_Cook_HAMMER);
};

// ---------------------------------------------------------------------
func void DIA_Addon_Snaf_Cook_FEUER()
{
	AI_Output(other, self, "DIA_Addon_Snaf_Cook_FEUER_15_00"); //火 带 ？
	AI_Output(self, other, "DIA_Addon_Snaf_Cook_FEUER_01_01"); //松 脆 、 美 味 的 烤 肉 ， 配 上 盐 渍 柳 兰 。
	AI_Output(self, other, "DIA_Addon_Snaf_Cook_FEUER_01_02"); //不 过 别 担 心 - 我 已 经 有 原 料 了 。
};

func void DIA_Addon_Snaf_Cook_HAMMER()
{
	AI_Output(other, self, "DIA_Addon_Snaf_Cook_HAMMER_15_00"); //海 默 酒 ？
	AI_Output(self, other, "DIA_Addon_Snaf_Cook_HAMMER_01_01"); //一 种 使 用 高 度 烈 性 海 默 酒 制 造 的 酒 。 我 是 从 一 个 叫 卢 的 家 伙 那 里 弄 到 的 配 方 。
	AI_Output(self, other, "DIA_Addon_Snaf_Cook_HAMMER_01_02"); //你 收 集 原 料 ， 然 后 在 炼 金 术 士 工 作 台 上 蒸 馏 烈 性 酒 ， 然 后 我 就 用 它 来 提 取 烈 酒 。 你 觉 得 怎 么 样 ？

	Info_AddChoice(DIA_Addon_Snaf_Cook, "我 没 时 间 。", DIA_Addon_Snaf_Cook_NO);
	Info_AddChoice(DIA_Addon_Snaf_Cook, "好 吧 ， 我 同 意 做 。 ", DIA_Addon_Snaf_Cook_YES);
};

func void DIA_Addon_Snaf_Cook_NO()
{
	AI_Output(other, self, "DIA_Addon_Snaf_Cook_HAMMER_NO_15_00"); //我 没 时 间 。
	AI_Output(self, other, "DIA_Addon_Snaf_Cook_HAMMER_NO_01_01"); //那 算 了 吧 。

	MIS_SnafHammer = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Addon_Snaf_Cook);
};

func void DIA_Addon_Snaf_Cook_YES()
{
	AI_Output(other, self, "DIA_Addon_Snaf_Cook_HAMMER_YES_15_00"); //好 吧 ， 我 同 意 做 。
	AI_Output(self, other, "DIA_Addon_Snaf_Cook_HAMMER_YES_01_01"); //好 吧 。 这 是 配 方 。

	B_GiveInvItems(self, other, ItWr_Addon_Lou_Rezept, 1);
	MIS_SnafHammer = LOG_RUNNING;
	Info_ClearChoices(DIA_Addon_Snaf_Cook);

	Log_CreateTopic(Topic_Addon_Hammer, LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Hammer, LOG_RUNNING);
	B_LogEntry(Topic_Addon_Hammer, Topic_Addon_Hammer_1);
};

// ---------------------------------------------------------------------
//	Info Booze
// ---------------------------------------------------------------------
var int Snaf_Tip_Kosten;
// ---------------------------------------------------------------------
instance DIA_Addon_Snaf_Booze(C_INFO)
{
	npc				= BDT_1098_Addon_Snaf;
	nr				= 3;
	condition		= DIA_Addon_Snaf_Booze_Condition;
	information		= DIA_Addon_Snaf_Booze_Info;
	description		= "我 蒸 馏 了 酒 。";
};

func int DIA_Addon_Snaf_Booze_Condition()
{
	if ((Npc_HasItems(other, ItFo_Addon_LousHammer) >= 1)
	&& (MIS_SnafHammer == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_Booze_Info()
{
	AI_Output(other, self, "DIA_Addon_Snaf_Booze_15_00"); //我 蒸 馏 了 酒 。

	// PATCH N.B.
	B_GiveInvItems(other, self, ItFo_Addon_LousHammer, 1);

	AI_Output(self, other, "DIA_Addon_Snaf_Booze_01_01"); //好 极 了 ， 那 么 我 来 完 成 它 。
	AI_Output(self, other, "DIA_Addon_Snaf_Booze_01_02"); //给 ， 你 可 以 马 上 试 着 喝 点 。 那 东 西 会 让 你 的 胳 膊 充 满 力 量 。
	AI_Output(self, other, "DIA_Addon_Snaf_Booze_01_03"); //哦 ， 如 果 我 能 帮 助 你 的 话 … … 对 你 ， 从 现 在 起 ， 所 有 的 信 息 都 免 费 。
	Snaf_Tip_Kosten = 0;
	B_GiveInvItems(self, other, ItFo_Addon_FireStew, 1);
	MIS_SnafHammer = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Loushammer);
};

// ---------------------------------------------------------------------
//	ATTENTAT
// ---------------------------------------------------------------------
instance DIA_Addon_Snaf_Attentat(C_INFO)
{
	npc				= BDT_1098_Addon_Snaf;
	nr				= 4;
	condition		= DIA_Addon_Snaf_Attentat_Condition;
	information		= DIA_Addon_Snaf_Attentat_Info;
	description		= "关 于 那 次 袭 击 ， 你 都 知 道 些 什 么 ？";
};

func int DIA_Addon_Snaf_Attentat_Condition()
{
	if (MIS_Judas == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_Attentat_Info()
{
	AI_Output(other, self, "DIA_Addon_Snaf_Attentat_15_00"); //关 于 那 次 袭 击 ， 你 都 知 道 些 什 么 ？
	AI_Output(self, other, "DIA_Addon_Snaf_Attentat_01_01"); //伊 斯 特 班 的 事 ？
	AI_Output(self, other, "DIA_Addon_Snaf_Attentat_01_02"); //你 知 道 怎 么 回 事 。 酒 吧 老 板 什 么 都 能 听 到 ， 但 是 从 来 不 摆 明 立 场 … …

	Info_ClearChoices(DIA_Addon_Snaf_Attentat);
	Info_AddChoice(DIA_Addon_Snaf_Attentat, "至 少 告 诉 我 去 什 么 人 那 里 。", DIA_Addon_Snaf_Attentat_GoWhere);
	Info_AddChoice(DIA_Addon_Snaf_Attentat, "如 果 你 处 在 我 的 位 置 ， 你 要 怎 么 做 ？", DIA_Addon_Snaf_Attentat_YouBeingMe);
	Info_AddChoice(DIA_Addon_Snaf_Attentat, "那 么 你 知 道 一 些 事 情 ？", DIA_Addon_Snaf_Attentat_Something);
};

func void DIA_Addon_Snaf_Attentat_Something()
{
	AI_Output(other, self, "DIA_Addon_Snaf_Attentat_Something_15_00"); //那 么 你 知 道 一 些 事 情 ？
	AI_Output(self, other, "DIA_Addon_Snaf_Attentat_Something_01_01"); //我 没 有 那 么 说 。
};

func void DIA_Addon_Snaf_Attentat_GoWhere()
{
	AI_Output(other, self, "DIA_Addon_Snaf_Attentat_GoWhere_15_00"); //至 少 告 诉 我 去 什 么 人 那 里 。
	AI_Output(self, other, "DIA_Addon_Snaf_Attentat_GoWhere_01_01"); //哦 ， 老 兄 ！ 有 什 么 不 同 吗 ？ 别 想 了 ！
};

func void DIA_Addon_Snaf_Attentat_YouBeingMe()
{
	AI_Output(other, self, "DIA_Addon_Snaf_Attentat_YouBeingMe_15_00"); //如 果 你 处 在 我 的 位 置 ， 你 要 怎 么 做 ？
	AI_Output(self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_01"); //我 会 想 一 下 我 对 那 个 幕 后 指 使 者 知 道 些 什 么 。
	AI_Output(self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_02"); //首 先 ， 他 可 能 是 一 个 强 盗 ， 那 就 是 说 他 在 这 个 营 地 里 。
	AI_Output(self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_03"); //其 次 ， 他 在 这 个 营 地 里 面 ， 就 意 味 着 他 在 监 视 你 。
	AI_Output(self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_04"); //第 三 ， 只 要 他 认 为 你 是 站 在 伊 斯 特 班 一 边 的 ， 他 就 不 会 向 你 暴 露 身 份 。
	AI_Output(self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_05"); //所 以 有 趣 的 问 题 就 是 ： 你 找 到 要 找 的 人 的 可 能 性 有 多 大 ？

	Info_ClearChoices(DIA_Addon_Snaf_Attentat);
};

// ---------------------------------------------------------------------
//	Info Abrechnung
// ---------------------------------------------------------------------
instance DIA_Addon_Snaf_Abrechnung(C_INFO)
{
	npc				= BDT_1098_Addon_Snaf;
	nr				= 5;
	condition		= DIA_Addon_Snaf_Abrechnung_Condition;
	information		= DIA_Addon_Snaf_Abrechnung_Info;
	permanent		= TRUE;
	description		= "我 找 到 我 的 人 机 会 有 多 大 ？";
};

func int DIA_Addon_Snaf_Abrechnung_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Snaf_Attentat)
	&& (MIS_JUDAS == LOG_RUNNING)
	&& (Huno_zuSnaf == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_Abrechnung_Info()
{
	AI_Output(other, self, "DIA_Addon_Snaf_Abrechnung_15_00"); //我 找 到 我 的 人 机 会 有 多 大 ？
	AI_Output(self, other, "DIA_Addon_Snaf_Abrechnung_01_01"); //嗯 … …

	if ((Senyan_Erpressung == LOG_RUNNING)
	&& (!Npc_IsDead(Senyan)))
	{
		AI_Output(self, other, "DIA_Addon_Snaf_Abrechnung_01_02"); //他 们 都 是 十 足 的 傻 瓜 。 有 人 已 经 注 意 到 你 和 森 延 牵 扯 到 了 一 起 。
		AI_Output(self, other, "DIA_Addon_Snaf_Abrechnung_01_03"); //你 必 须 断 绝 与 他 的 联 系 ， 否 则 你 将 永 远 没 有 机 会 查 明 谁 应 该 对 那 次 袭 击 负 责 。

		if (Snaf_Tip_Senyan == FALSE)
		{
			B_LogEntry(Topic_Addon_Senyan, Topic_Addon_Senyan_3);
			Snaf_Tip_Senyan = TRUE;
		};
	}
	else if (Npc_IsDead(Senyan))
	{
		AI_Output(self, other, "DIA_Addon_Snaf_Abrechnung_01_04"); //你 干 掉 了 一 个 伊 斯 特 班 的 人 。 你 在 找 的 那 个 人 一 定 会 相 信 你 是 站 在 他 一 边 的 。
		AI_Output(self, other, "DIA_Addon_Snaf_Abrechnung_01_05"); //但 是 他 不 会 那 么 简 单 向 你 暴 露 身 份 的 。 你 还 必 须 查 明 更 多 真 相 。
	}
	else if (Finn_Petzt == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_Snaf_Abrechnung_01_06"); //自 从 你 和 他 谈 过 话 后 ， 分 恩 看 起 来 非 常 不 安 。
		AI_Output(self, other, "DIA_Addon_Snaf_Abrechnung_01_07"); //而 这 里 所 有 的 人 都 知 道 他 是 倾 向 伊 斯 特 班 一 边 的 。
		AI_Output(self, other, "DIA_Addon_Snaf_Abrechnung_01_08"); //那 就 意 味 着 ， 也 许 你 对 他 说 了 一 些 他 不 想 听 到 的 事 。
		AI_Output(self, other, "DIA_Addon_Snaf_Abrechnung_01_09"); //那 会 让 你 正 在 寻 找 的 人 高 兴 … …
		AI_Output(self, other, "DIA_Addon_Snaf_Abrechnung_01_10"); //然 而 ， 这 就 有 使 得 他 投 靠 伊 斯 特 班 的 危 险 - （ 讽 刺 的 ） 不 过 你 自 己 也 知 道 那 些 … …
	};

	if (Finn_TellAll == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_Snaf_Abrechnung_01_11"); //他 们 说 你 告 诉 芬 恩 你 在 为 伊 斯 特 班 工 作 。
		AI_Output(self, other, "DIA_Addon_Snaf_Abrechnung_01_12"); //我 不 知 道 你 真 正 的 计 划 是 什 么 ， 不 过 你 正 在 寻 找 的 那 个 人 从 现 在 起 一 定 会 更 加 小 心 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Snaf_Abrechnung_01_13"); //到 现 在 为 止 ， 一 切 事 情 还 都 悬 而 未 决 。
	};

	// ------------------- Abschied ----------------------------------
	if (Snaf_Rechnung == FALSE)
	{
		if (Snaf_Einmal == FALSE)
		{
			AI_Output(other, self, "DIA_Addon_Snaf_Abschied_15_14"); //谢 谢 。
			AI_Output(self, other, "DIA_Addon_Snaf_Abschied_01_15"); //（ 敷 衍 了 事 ） 嘿 ！ 我 没 有 对 你 说 过 任 何 你 不 知 道 的 事 ， 明 白 吗 ？

			Snaf_Einmal = TRUE;
		}
		else
		{
			AI_Output(other, self, "DIA_Addon_Snaf_Abschied_15_16"); //我 知 道 … …
			AI_Output(self, other, "DIA_Addon_Snaf_Abschied_01_17"); //确 实 如 此 。
		};
	};
};

// ---------------------------------------------------------------------
//	HOCH
// ---------------------------------------------------------------------
instance DIA_Addon_Snaf_HOCH(C_INFO)
{
	npc				= BDT_1098_Addon_Snaf;
	nr				= 6;
	condition		= DIA_Addon_Snaf_HOCH_Condition;
	information		= DIA_Addon_Snaf_HOCH_Info;
	description		= "胡 诺 说 我 可 以 在 这 里 见 到 某 个 人 … …";
};

func int DIA_Addon_Snaf_HOCH_Condition()
{
	if (Huno_zuSnaf == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_HOCH_Info()
{
	AI_Output(other, self, "DIA_Addon_Snaf_HOCH_15_00"); //胡 诺 派 我 来 的 。
	AI_Output(self, other, "DIA_Addon_Snaf_HOCH_01_01"); //看 来 你 找 到 了 你 的 人 。
	AI_Output(self, other, "DIA_Addon_Snaf_HOCH_01_02"); //上 去 到 第 二 层 ， 那 里 有 人 在 等 你 。

	AI_StopProcessInfos(self);
	AI_Teleport(Fisk, "BL_INN_UP_06");
	B_StartotherRoutine(Fisk, "MEETING");

	B_GivePlayerXP(XP_Addon_Auftraggeber);
};

// ---------------------------------------------------------------------
//	People
// ---------------------------------------------------------------------
var int Kosten_Einmal;
// ---------------------------------------------------------------------
instance DIA_Addon_Snaf_People(C_INFO)
{
	npc				= BDT_1098_Addon_Snaf;
	nr				= 6;
	condition		= DIA_Addon_Snaf_People_Condition;
	information		= DIA_Addon_Snaf_People_Info;
	permanent		= TRUE;
	description		= "这 里 的 人 怎 么 看 伊 斯 特 班 ？";
};

func int DIA_Addon_Snaf_People_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Snaf_Attentat))
	&& (!Npc_IsDead(Esteban)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_People_Info()
{
	AI_Output(other, self, "DIA_Addon_Snaf_People_15_00"); //这 里 的 人 怎 么 看 伊 斯 特 班 ？
	AI_Output(self, other, "DIA_Addon_Snaf_People_01_01"); //你 应 该 再 严 谨 一 点 … …
	if ((Kosten_Einmal == FALSE)
	&& (MIS_SnafHammer != LOG_SUCCESS))
	{
		AI_Output(self, other, "DIA_Addon_Snaf_People_01_02"); //每 一 条 信 息 都 会 让 你 物 有 所 值 … …
		AI_Output(other, self, "DIA_Addon_Snaf_People_15_03"); //多 少 钱 ？
		AI_Output(self, other, "DIA_Addon_Snaf_People_01_04"); //每 条10金 币 ！

		Snaf_Tip_Kosten = 10;
		Kosten_Einmal = TRUE;
	};

	Info_ClearChoices(DIA_Addon_Snaf_People);
	Info_AddChoice(DIA_Addon_Snaf_People, DIALOG_BACK, DIA_Addon_Snaf_People_BACK);
	Info_AddChoice(DIA_Addon_Snaf_People, "保 罗 。", DIA_Addon_Snaf_People_Paul);
	Info_AddChoice(DIA_Addon_Snaf_People, "胡 诺 。", DIA_Addon_Snaf_People_Huno);
	Info_AddChoice(DIA_Addon_Snaf_People, "费 斯 克。", DIA_Addon_Snaf_People_Fisk);
	Info_AddChoice(DIA_Addon_Snaf_People, "艾 米 里 欧。", DIA_Addon_Snaf_People_Emilio);
	if (!Npc_IsDead(Senyan))
	{
		Info_AddChoice(DIA_Addon_Snaf_People, "森 延。", DIA_Addon_Snaf_People_Senyan);
	};

	Info_AddChoice(DIA_Addon_Snaf_People, "雷 纳 尔。", DIA_Addon_Snaf_People_Lennar);
	Info_AddChoice(DIA_Addon_Snaf_People, "芬 恩。", DIA_Addon_Snaf_People_Finn);
};

// --------------------------------------------
func void B_Addon_Snaf_NotEnough()
{
	AI_Output(self, other, "DIA_Addon_Snaf_NotEnough_01_00"); //你 没 有 足 够 的 金 币 ， 小 子 ！
};

func void DIA_Addon_Snaf_People_BACK()
{
	Info_ClearChoices(DIA_Addon_Snaf_People);
};

func void DIA_Addon_Snaf_People_Paul()
{
	AI_Output(other, self, "DIA_Addon_Snaf_People_Paul_15_00"); //那 么 保 罗 呢 ？
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output(self, other, "DIA_Addon_Snaf_People_Paul_01_01"); //我 不 认 为 他 特 别 喜 欢 伊 斯 特 班 。 因 为 为 胡 诺 工 作 的 话 ， 他 就 永 远 进 不 了 矿 井 。
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

func void DIA_Addon_Snaf_People_Huno()
{
	AI_Output(other, self, "DIA_Addon_Snaf_People_Huno_15_00"); //胡 诺 怎 么 看 伊 斯 特 班 ？
	AI_Output(self, other, "DIA_Addon_Snaf_People_Huno_01_01"); //啊 ！ 胡 诺 。 我 对 他 几 乎 一 无 所 知 。
	AI_Output(self, other, "DIA_Addon_Snaf_People_Huno_01_02"); //（ 露 齿 而 笑 ） 那 条 信 息 ， 当 然 ， 免 费 。
};

func void DIA_Addon_Snaf_People_Fisk()
{
	AI_Output(other, self, "DIA_Addon_Snaf_People_Fisk_15_00"); //那 么 费 斯 克 呢 ？
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output(self, other, "DIA_Addon_Snaf_People_Fisk_01_01"); //费 斯 克 就 是 费 斯 克 。 他 付 给 伊 斯 特 班 一 份 钱 ， 并 主 要 分 配 从 海 盗 手 里 得 来 的 货 物 。
		AI_Output(self, other, "DIA_Addon_Snaf_People_Fisk_01_02"); //我 不 认 为 他 真 的 关 心 伊 斯 特 班 。
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

func void DIA_Addon_Snaf_People_Emilio()
{
	AI_Output(other, self, "DIA_Addon_Snaf_People_Emilio_15_00"); //艾 米 里 欧 。 他 怎 么 看 伊 斯 特 班 ？
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output(self, other, "DIA_Addon_Snaf_People_Emilio_01_01"); //我 不 认 为 他 会 在 伊 斯 特 班 的 坟 墓 上 献 一 朵 花 ， 如 果 你 能 明 白 我 的 意 思 的 话 。
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

func void DIA_Addon_Snaf_People_Senyan()
{
	AI_Output(other, self, "DIA_Addon_Snaf_People_Senyan_15_00"); //那 么 森 延 呢 ？
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output(self, other, "DIA_Addon_Snaf_People_Senyan_01_01"); //森 延 是 伊 斯 特 班 的 人 。 他 已 经 为 他 工 作 相 当 一 段 时 间 了 。
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

func void DIA_Addon_Snaf_People_Lennar()
{
	AI_Output(other, self, "DIA_Addon_Snaf_People_Lennar_15_00"); //那 么 雷 纳 尔 呢 ？ 怎 么 看 待 伊 斯 特 班 ？
	AI_Output(self, other, "DIA_Addon_Snaf_People_Lennar_01_01"); //据 我 所 知 ， 雷 纳 尔 ？ 根 本 不 会 在 乎 。 所 以 这 条 信 息 免 费 。
};

func void DIA_Addon_Snaf_People_Finn()
{
	AI_Output(other, self, "DIA_Addon_Snaf_People_Finn_15_00"); //那 么 芬 恩 怎 么 样 ？
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output(self, other, "DIA_Addon_Snaf_People_Finn_01_01"); //一 个 出 色 的 矿 工 。 他 的 鼻 子 能 嗅 到 金 子 。
		AI_Output(self, other, "DIA_Addon_Snaf_People_Finn_01_02"); //伊 斯 特 班 喜 欢 他 就 是 因 为 这 个 。 我 认 为 他 们 走 得 相 当 近 。
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

// ---------------------------------------------------------------------
//	Und du?
// ---------------------------------------------------------------------
instance DIA_Addon_Snaf_Himself(C_INFO)
{
	npc				= BDT_1098_Addon_Snaf;
	nr				= 7;
	condition		= DIA_Addon_Snaf_Himself_Condition;
	information		= DIA_Addon_Snaf_Himself_Info;
	description		= "你 怎 么 看 伊 斯 特 班 ？";
};

func int DIA_Addon_Snaf_Himself_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Snaf_Attentat))
	&& (!Npc_IsDead(Esteban)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_Himself_Info()
{
	AI_Output(other, self, "DIA_Addon_Snaf_Himself_15_00"); //你 怎 么 看 伊 斯 特 班 ？
	AI_Output(self, other, "DIA_Addon_Snaf_Himself_01_01"); //任 何 谈 论 过 他 的 人 很 快 就 死 了 … …
	// AI_Output(other, self, "DIA_Addon_Snaf_Himself_15_02"); // Und?
	// AI_Output(self, other, "DIA_Addon_Snaf_Himself_01_03"); // Ende der Geschichte. // wav fehlt
};

// ---------------------------------------------------------------------
//	PERM
// ---------------------------------------------------------------------
instance DIA_Addon_Snaf_PERM(C_INFO)
{
	npc				= BDT_1098_Addon_Snaf;
	nr				= 8;
	condition		= DIA_Addon_Snaf_PERM_Condition;
	information		= DIA_Addon_Snaf_PERM_Info;
	permanent		= TRUE;
	description		= "最 近 生 意 好 吗 ？";
};

func int DIA_Addon_Snaf_PERM_Condition()
{
	if (Npc_IsDead(Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_PERM_Info()
{
	AI_Output(other, self, "DIA_Addon_Snaf_PERM_15_00"); //最 近 生 意 好 吗 ？
	AI_Output(self, other, "DIA_Addon_Snaf_PERM_01_01"); //好 ！ 伊 斯 特 班 的 死 正 是 这 里 庆 祝 的 原 因 … …
};
