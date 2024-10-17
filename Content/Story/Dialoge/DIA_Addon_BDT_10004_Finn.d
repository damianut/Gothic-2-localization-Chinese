// ----------------------------------------------------------------------
//	Info EXIT
// ----------------------------------------------------------------------
instance DIA_Addon_Finn_EXIT(C_INFO)
{
	npc				= BDT_10004_Addon_Finn;
	nr				= 999;
	condition		= DIA_Addon_Finn_EXIT_Condition;
	information		= DIA_Addon_Finn_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Finn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Finn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Finn_PICKPOCKET(C_INFO)
{
	npc				= BDT_10004_Addon_Finn;
	nr				= 900;
	condition		= DIA_Addon_Finn_PICKPOCKET_Condition;
	information		= DIA_Addon_Finn_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Addon_Finn_PICKPOCKET_Condition()
{
	C_Beklauen(35, 50);
};

func void DIA_Addon_Finn_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Finn_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Finn_PICKPOCKET, DIALOG_BACK, DIA_Addon_Finn_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Finn_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Finn_PICKPOCKET_DoIt);
};

func void DIA_Addon_Finn_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Finn_PICKPOCKET);
};

func void DIA_Addon_Finn_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Finn_PICKPOCKET);
};

// ----------------------------------------------------------------------
//	Info Hacker
// ----------------------------------------------------------------------
instance DIA_Addon_Finn_Hacker(C_INFO)
{
	npc				= BDT_10004_Addon_Finn;
	nr				= 9;
	condition		= DIA_Addon_Finn_Hacker_Condition;
	information		= DIA_Addon_Finn_Hacker_Info;
	permanent		= TRUE;
	description		= "回 来 继 续 工 作 ？";
};

func int DIA_Addon_Finn_Hacker_Condition()
{
	if (Npc_GetDistToWP(self, "ADW_MINE_PICK_06") <= 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Hacker_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10004_Finn_Hacker_15_00"); //回 来 继 续 工 作 ？
	AI_Output(self, other, "DIA_Addon_BDT_10004_Finn_Hacker_07_01"); //是 的 ， 我 要 把 这 个 矿 坑 里 最 后 一 片 金 子 拿 出 来 。
};

// ----------------------------------------------------------------------
//	Info Hacke
// ----------------------------------------------------------------------
instance DIA_Addon_Finn_Hi(C_INFO)
{
	npc				= BDT_10004_Addon_Finn;
	nr				= 1;
	condition		= DIA_Addon_Finn_Hi_Condition;
	information		= DIA_Addon_Finn_Hi_Info;
	important		= TRUE;
};

func int DIA_Addon_Finn_Hi_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10004_Finn_Hi_15_00"); //嗨 ！
	AI_Output(self, other, "DIA_Addon_BDT_10004_Finn_Hi_07_01"); //（ 粗 暴 的 ） 你 想 要 什 么 ？
};

// ----------------------------------------------------------------------
//	Info Hacke
// ----------------------------------------------------------------------
instance DIA_Addon_Finn_Hacke(C_INFO)
{
	npc				= BDT_10004_Addon_Finn;
	nr				= 2;
	condition		= DIA_Addon_Finn_Hacke_Condition;
	information		= DIA_Addon_Finn_Hacke_Info;
	description		= "我 从 哪 里 找 到 十 字 镐 ？";
};

func int DIA_Addon_Finn_Hacke_Condition()
{
	return TRUE;
};

func void DIA_Addon_Finn_Hacke_Info()
{
	AI_Output(other, self, "DIA_Addon_Finn_Hacke_15_00"); //我 从 哪 里 找 到 十 字 镐 ？
	AI_Output(self, other, "DIA_Addon_Finn_Hacke_07_01"); //去 找 铁 匠 胡 诺 。 但 是 即 使 你 拿 到 了 十 字 镐 ， 也 不 代 表 你 能 进 入 矿 井 。
	AI_Output(self, other, "DIA_Addon_Finn_Hacke_07_02"); //如 果 你 想 进 去 ， 你 必 须 同 伊 斯 特 班 谈 谈 。
	AI_Output(self, other, "DIA_Addon_Finn_Hacke_07_03"); //别 去 烦 托 鲁 斯 - 只 有 当 你 拥 有 一 块 红 石 头 的 时 候 ， 他 才 会 让 你 进 去 。
};

// ----------------------------------------------------------------------
//	Info Esteban
// ----------------------------------------------------------------------
instance DIA_Addon_Finn_Esteban(C_INFO)
{
	npc				= BDT_10004_Addon_Finn;
	nr				= 3;
	condition		= DIA_Addon_Finn_Esteban_Condition;
	information		= DIA_Addon_Finn_Esteban_Info;
	description		= "告 诉 我 ， 对 于 伊 斯 特 班 你 怎 么 看 ？";
};

func int DIA_Addon_Finn_Esteban_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Finn_Hacke))
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Esteban_Info()
{
	AI_Output(other, self, "DIA_Addon_Finn_Esteban_15_00"); //告 诉 我 ， 对 于 伊 斯 特 班 你 怎 么 看 ？
	AI_Output(self, other, "DIA_Addon_Finn_Esteban_07_01"); //（ 小 心 的 ） 他 是 这 里 的 头 … … 他 是 … … 好 吧 ， 我 认 为 是 。
	AI_Output(self, other, "DIA_Addon_Finn_Esteban_07_02"); //（ 吞 吞 吐 吐 ） 他 只 让 优 秀 的 人 进 入 矿 井 。 我 是 说 ， 那 些 人 必 须 知 道 如 何 采 矿 。
};

// ----------------------------------------------------------------------
//	Info Esteban
// ----------------------------------------------------------------------
instance DIA_Addon_Finn_Profi(C_INFO)
{
	npc				= BDT_10004_Addon_Finn;
	nr				= 4;
	condition		= DIA_Addon_Finn_Profi_Condition;
	information		= DIA_Addon_Finn_Profi_Info;
	description		= "你 知 道 关 于 采 矿 的 事 情 吗 ？";
};

func int DIA_Addon_Finn_Profi_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Finn_Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Profi_Info()
{
	AI_Output(other, self, "DIA_Addon_Finn_Profi_15_00"); //你 知 道 关 于 采 矿 的 事 情 吗 ？
	AI_Output(self, other, "DIA_Addon_Finn_Profi_07_01"); //我 是 最 好 的 ！
};

// ----------------------------------------------------------------------
//	Info Mine
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10004_Finn_Mine(C_INFO)
{
	npc				= BDT_10004_Addon_Finn;
	nr				= 5;
	condition		= DIA_Addon_Finn_Mine_Condition;
	information		= DIA_Addon_Finn_Mine_Info;
	description		= DIALOG_ADDON_MINE_DESCRIPTION;
};

func int DIA_Addon_Finn_Mine_Condition()
{
	if ((MIS_Send_Buddler == LOG_RUNNING)
	&& (Player_SentBuddler < 3)
	&& (Npc_HasItems(other, ItmI_Addon_Stone_01) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Mine_Info()
{
	B_Say(other, self, "$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other, self, ItmI_Addon_Stone_01, 1);
	AI_Output(self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_00"); //当 然 ， 头 儿 。 你 想 看 到 矿 井 里 最 棒 的 ？ 那 我 马 上 去 办 … …

	AI_Output(self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_01"); //哦 ， 其 它 事 情 。 我 会 让 你 分 享 一 个 矿 工 的 秘 密 。
	AI_Output(self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_02"); //偶 尔 来 说 猛 击 一 下 也 不 错 。
	AI_Output(self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_03"); //如 果 在 挖 了 一 段 时 间 却 什 么 都 没 挖 到 的 话 ， 那 就 换 个 地 方 ， 从 岩 石 后 面 下 十 字 镐 。
	AI_Output(self, other, "DIA_Addon_BDT_10004_Finn_Mine_07_04"); //如 果 有 一 点 运 气 的 话 ， 你 那 样 可 以 一 次 得 到 几 块 。

	B_Upgrade_hero_HackChance(10);
	Knows_Truemmerschlag = TRUE;

	Player_SentBuddler = (Player_SentBuddler + 1);
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "MINE");
};

// ---------------------------------------------------------------------
//	Info Gold
// ---------------------------------------------------------------------
instance DIA_Addon_Finn_Gold(C_INFO)
{
	npc				= BDT_10004_Addon_Finn;
	nr				= 6;
	condition		= DIA_Addon_Finn_Gold_Condition;
	information		= DIA_Addon_Finn_Gold_Info;
	description		= DIALOG_ADDON_GOLD_DESCRIPTION;
};

func int DIA_Addon_Finn_Gold_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Finn_Profi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Gold_Info()
{
	B_Say(other, self, "$ADDON_GOLD_DESCRIPTION");
	AI_Output(self, other, "DIA_Addon_Finn_Gold_07_00"); //嗯 ， 有 一 些 事 情 你 必 须 要 了 解 ， 金 子 不 是 矿 石 。 它 们 之 间 有 很 大 的 不 同 。
	AI_Output(self, other, "DIA_Addon_Finn_Gold_07_01"); //我 是 说 ， 哪 个 女 人 愿 意 她 的 脖 子 上 挂 一 大 串 矿 石 ？ （ 大 笑 ）
	AI_Output(self, other, "DIA_Addon_Finn_Gold_07_02"); //在 挖 掘 的 时 候 ， 从 顶 挖 到 底 。 那 样 你 可 以 轻 松 地 挖 动 金 矿 石 。
	AI_Output(self, other, "DIA_Addon_Finn_Gold_07_03"); //也 有 矿 工 使 用 其 它 的 方 式 来 做 - 不 过 那 更 加 困 难 。

	B_Upgrade_hero_HackChance(10);
};

// ---------------------------------------------------------------------
//	Info einschätzen
// ---------------------------------------------------------------------
instance DIA_Addon_Finn_ein(C_INFO)
{
	npc				= BDT_10004_Addon_Finn;
	nr				= 7;
	condition		= DIA_Addon_Finn_ein_Condition;
	information		= DIA_Addon_Finn_ein_Info;
	permanent		= TRUE;
	description		= "你 能 判 断 我 挖 金 子 的 能 力 吗 ？";
};

func int DIA_Addon_Finn_ein_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Finn_Profi))
	{
		return TRUE;
	};
};

var int Finn_einmal;
var int Finn_Gratulation;
func void DIA_Addon_Finn_ein_Info()
{
	AI_Output(other, self, "DIA_Addon_Finn_ein_15_00"); //你 能 判 断 我 挖 金 子 的 能 力 吗 ？

	if (Finn_einmal == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Finn_ein_07_01"); //当 然 。 我 已 经 干 了35年 。 没 有 我 不 能 评 估 的 ！
		Finn_einmal = TRUE;
	};

	AI_Output(self, other, "DIA_Addon_Finn_ein_07_02"); //对 于 你 ， 我 要 说 你 是 … …

	if (Hero_HackChance < 20)
	{
		AI_Output(self, other, "DIA_Addon_Finn_ein_07_03"); //绝 对 的 初 学 者 。
	}
	else if (Hero_HackChance < 40)
	{
		AI_Output(self, other, "DIA_Addon_Finn_ein_07_04"); //一 个 过 得 去 的 矿 工 。
	}
	else if (Hero_HackChance < 55)
	{
		AI_Output(self, other, "DIA_Addon_Finn_ein_07_05"); //老 练 的 金 矿 矿 工 。
	}
	else if (Hero_HackChance < 75)
	{
		AI_Output(self, other, "DIA_Addon_Finn_ein_07_06"); //一 个 名 副 其 实 的 矿 工 。
	}
	else if (Hero_HackChance < 90)
	{
		AI_Output(self, other, "DIA_Addon_Finn_ein_07_07"); //一 个 非 常 出 色 的 矿 工 。
	}
	else if (Hero_HackChance < 98)
	{
		AI_Output(self, other, "DIA_Addon_Finn_ein_07_08"); //一 个 专 家 级 的 矿 工 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Finn_ein_07_09"); //一 个 大 师 级 的 矿 工 。

		if (Finn_Gratulation == FALSE)
		{
			AI_Output(self, other, "DIA_Addon_Finn_ein_07_10"); //现 在 你 和 我 一 样 出 色 。 祝 贺 你 ， 伙 伴 。
			B_GivePlayerXP(XP_Ambient * 2);
			Snd_Play("LevelUP");
			Finn_Gratulation = TRUE;
		};
	};

	var string ConcatText;

	ConcatText = ConcatStrings(PRINT_GOLD_SKILL, IntToString(Hero_HackChance));
	ConcatText = ConcatStrings(ConcatText, PRINT_GOLD_PERCENT);
	PrintScreen(concatText, -1, -1, FONT_ScreenSmall, 2);
};

// ----------------------------------------------------------------------
//	Attentat
// ----------------------------------------------------------------------
instance DIA_Addon_Finn_Attentat(C_INFO)
{
	npc				= BDT_10004_Addon_Finn;
	nr				= 8;
	condition		= DIA_Addon_Finn_Attentat_Condition;
	information		= DIA_Addon_Finn_Attentat_Info;
	description		= "关 于 伊 斯 特 班 的 谋 杀 未 遂 者 … …";
};

func int DIA_Addon_Finn_Attentat_Condition()
{
	if (MIS_Judas == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Attentat_Info()
{
	B_Say(other, self, "$ATTENTAT_ADDON_DESCRIPTION2"); // Wegen des Attentats auf Esteban
	AI_Output(self, other, "DIA_Addon_Finn_Attentat_07_00"); //（ 谨 慎 的 ） 是 吗 ？
	AI_Output(other, self, "DIA_Addon_Finn_Attentat_15_01"); //你 知 道 谁 是 幕 后 指 使 吗 ？
	AI_Output(self, other, "DIA_Addon_Finn_Attentat_07_02"); //你 为 什 么 想 知 道 ？

	Info_ClearChoices(DIA_Addon_Finn_Attentat);
	Info_AddChoice(DIA_Addon_Finn_Attentat, "我 要 和 这 个 家 伙 谈 谈 … …", DIA_Addon_Finn_Attentat_WannaTalk);
	Info_AddChoice(DIA_Addon_Finn_Attentat, "伊 斯 特 班 想 要 他 死 ！", DIA_Addon_Finn_Attentat_ForTheBoss);
};

func void B_Addon_Finn_TellAll()
{
	AI_Output(self, other, "DIA_Addon_Finn_TellAll_07_00"); //（ 叙 述 ） 攻 击 什 么 时 候 开 始 的 ， 我 想 从 铁 匠 胡 诺 那 里 取 得 我 的 十 字 镐 。
	AI_Output(self, other, "DIA_Addon_Finn_TellAll_07_01"); //但 是 他 不 在 那 里 。
	AI_Output(other, self, "DIA_Addon_Finn_TellAll_15_02"); //还 好 吗 ？
	AI_Output(self, other, "DIA_Addon_Finn_TellAll_07_03"); //一 般 来 说 他 ‘ 总 是 ’ 在 那 里 。 如 果 你 要 问 我 的 话 ， 那 ‘ 非 常 ’ 可 疑 。

	Finn_TellAll = TRUE;
	B_LogEntry(Topic_Addon_Esteban, Topic_Addon_Esteban_6);
};

func void DIA_Addon_Finn_Attentat_ForTheBoss()
{
	AI_Output(other, self, "DIA_Addon_Finn_ForTheBoss_15_00"); //伊 斯 特 班 想 要 他 死 ！
	AI_Output(self, other, "DIA_Addon_Finn_ForTheBoss_07_01"); //哦 ！ 你 为 老 板 工 作 ？
	AI_Output(self, other, "DIA_Addon_Finn_ForTheBoss_07_02"); //那 我 将 告 诉 你 我 所 知 道 的 事 。

	B_Addon_Finn_TellAll();

	Info_ClearChoices(DIA_Addon_Finn_Attentat);
};

func void DIA_Addon_Finn_Attentat_WannaTalk()
{
	AI_Output(other, self, "DIA_Addon_Finn_WannaTalk_15_00"); //我 要 和 这 个 家 伙 谈 谈 … …
	AI_Output(self, other, "DIA_Addon_Finn_WannaTalk_07_01"); //（ 谨 慎 的 ） 真 的 ？ 你 想 从 他 那 得 到 什 么 ?

	Info_ClearChoices(DIA_Addon_Finn_Attentat);
	Info_AddChoice(DIA_Addon_Finn_Attentat, "那 不 关 你 的 事 ！", DIA_Addon_Finn_Attentat_ForgetIt);
	Info_AddChoice(DIA_Addon_Finn_Attentat, "我 有 一 些 关 于 他 的 有 趣 的 消 息 ！", DIA_Addon_Finn_Attentat_HaveInfos);
	Info_AddChoice(DIA_Addon_Finn_Attentat, "我 想 要 干 掉 伊 斯 特 班 ， 我 正 在 找 同 伴 ！", DIA_Addon_Finn_Attentat_KillEsteban);
};

func void DIA_Addon_Finn_Attentat_KillEsteban()
{
	AI_Output(other, self, "DIA_Addon_Finn_KillEsteban_15_00"); //我 想 要 干 掉 伊 斯 特 班 ， 我 正 在 找 同 伴 ！
	AI_Output(self, other, "DIA_Addon_Finn_KillEsteban_07_01"); //那 我 也 无 能 为 力 ！

	Finn_Petzt = TRUE;

	Info_ClearChoices(DIA_Addon_Finn_Attentat);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Finn_Attentat_HaveInfos()
{
	AI_Output(other, self, "DIA_Addon_Finn_HaveInfos_15_00"); //我 有 一 些 关 于 他 的 有 趣 的 消 息 ！
	AI_Output(self, other, "DIA_Addon_Finn_HaveInfos_07_01"); //你 是 那 个 安 排 这 件 事 的 家 伙 的 同 伙 ， 是 吗 ？

	Info_ClearChoices(DIA_Addon_Finn_Attentat);
	Info_AddChoice(DIA_Addon_Finn_Attentat, "我 想 要 干 掉 伊 斯 特 班 ， 我 正 在 找 同 伴 ！", DIA_Addon_Finn_Attentat_KillEsteban);
	Info_AddChoice(DIA_Addon_Finn_Attentat, "那 不 关 你 的 事 ！", DIA_Addon_Finn_Attentat_ForgetIt);
	Info_AddChoice(DIA_Addon_Finn_Attentat, "绝 对 不 是 ！", DIA_Addon_Finn_Attentat_NoNo);
};

func void DIA_Addon_Finn_Attentat_NoNo()
{
	AI_Output(other, self, "DIA_Addon_Finn_NoNo_15_00"); //绝 对 不 是 ！
	AI_Output(self, other, "DIA_Addon_Finn_NoNo_07_01"); //（ 评 价 的 眼 光 ） 好 ！ 我 将 告 诉 你 我 知 道 的 。

	B_Addon_Finn_TellAll();
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
};

func void DIA_Addon_Finn_Attentat_ForgetIt()
{
	AI_Output(other, self, "DIA_Addon_Finn_ForgetIt_15_00"); //那 不 关 你 的 事 ！
	AI_Output(self, other, "DIA_Addon_Finn_ForgetIt_07_01"); //真 的 ？ 嗯 ， 那 我 不 知 道 任 何 与 此 事 有 关 的 事 。

	Info_ClearChoices(DIA_Addon_Finn_Attentat);
};

// ----------------------------------------------------------------------
//	Nochmal Attentat
// ----------------------------------------------------------------------
instance DIA_Addon_Finn_Again(C_INFO)
{
	npc				= BDT_10004_Addon_Finn;
	nr				= 9;
	condition		= DIA_Addon_Finn_Again_Condition;
	information		= DIA_Addon_Finn_Again_Info;
	permanent		= TRUE;
	description		= "还 是 关 于 袭 击 … …";
};

func int DIA_Addon_Finn_Again_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Finn_Attentat))
	&& (!Npc_IsDead(Esteban)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Again_Info()
{
	AI_Output(other, self, "DIA_Addon_Finn_Again_15_00"); //还 是 关 于 袭 击 … …
	if (Finn_TellAll == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_Finn_Again_07_01"); //我 已 经 告 诉 了 你 我 知 道 的 一 切 。

		Info_ClearChoices(DIA_Addon_Finn_Again);
		Info_AddChoice(DIA_Addon_Finn_Again, "好 吧 … … （ 返 回 ）", DIA_Addon_Finn_Again_Exit);
		Info_AddChoice(DIA_Addon_Finn_Again, "再 告 诉 我 一 次 ！", DIA_Addon_Finn_Again_Nochmal);
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Finn_Again_07_02"); //马 上 走 开 ！
		AI_StopProcessInfos(self);
	};
};

func void DIA_Addon_Finn_Again_Exit()
{
	AI_Output(other, self, "DIA_Addon_Finn_Again_Exit_15_00"); //（ 评 价 的 眼 光 ） 好 吧 … …
	Info_ClearChoices(DIA_Addon_Finn_Again);
};

func void DIA_Addon_Finn_Again_Nochmal()
{
	AI_Output(other, self, "DIA_Addon_Finn_Again_Nochmal_15_00"); //再 告 诉 我 一 次 ！

	B_Addon_Finn_TellAll();

	Info_ClearChoices(DIA_Addon_Finn_Again);
};
