///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Grimbald_EXIT(C_INFO)
{
	npc				= BAU_982_Grimbald;
	nr				= 999;
	condition		= DIA_Grimbald_EXIT_Condition;
	information		= DIA_Grimbald_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Grimbald_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Grimbald_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Grimbald_HALLO(C_INFO)
{
	npc				= BAU_982_Grimbald;
	nr				= 3;
	condition		= DIA_Grimbald_HALLO_Condition;
	information		= DIA_Grimbald_HALLO_Info;
	description		= "你 在 等 什 么 人 吗 ？";
};

func int DIA_Grimbald_HALLO_Condition()
{
	return TRUE;
};

var int Grimbald_PissOff;

func void DIA_Grimbald_HALLO_Info()
{
	AI_Output(other, self, "DIA_Grimbald_HALLO_15_00"); //你 在 等 什 么 人 吗 ？

	if (
	(Npc_IsDead(Grimbald_Snapper1))
	&& (Npc_IsDead(Grimbald_Snapper2))
	&& (Npc_IsDead(Grimbald_Snapper3)))
	{
		AI_Output(self, other, "DIA_Grimbald_HALLO_07_01"); //我 在 狩 猎 。 显 而 易 见 。
		Grimbald_PissOff = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Grimbald_HALLO_07_02"); //已 经 不 是 了 。 你 现 在 在 这 里 ， 不 是 吗 ？。

		Info_ClearChoices(DIA_Grimbald_HALLO);
		Info_AddChoice(DIA_Grimbald_HALLO, "我 有 自 己 的 事 要 处 理 。", DIA_Grimbald_HALLO_nein);
		Info_AddChoice(DIA_Grimbald_HALLO, "你 在 做 什 么 ？", DIA_Grimbald_HALLO_Was);
		Info_AddChoice(DIA_Grimbald_HALLO, "为 什 么 是 我 ？", DIA_Grimbald_HALLO_ich);
	};
};

func void DIA_Grimbald_HALLO_ich()
{
	AI_Output(other, self, "DIA_Grimbald_HALLO_ich_15_00"); //为 什 么 是 我 ？
	AI_Output(self, other, "DIA_Grimbald_HALLO_ich_07_01"); //你 看 起 来 很 强 壮 。 我 需 要 你 这 样 的 家 伙 。
};

func void DIA_Grimbald_HALLO_Was()
{
	AI_Output(other, self, "DIA_Grimbald_HALLO_Was_15_00"); //你 在 做 什 么 ？
	AI_Output(self, other, "DIA_Grimbald_HALLO_Was_07_01"); //我 想 要 捕 猎 那 里 的 暴 龙 ， 但 是 我 想 对 我 一 个 人 来 说 ， 它 们 的 数 量 太 多 了 。

	Info_AddChoice(DIA_Grimbald_HALLO, "不 要 把 我 算 上 。", DIA_Grimbald_HALLO_Was_neinnein);
	Info_AddChoice(DIA_Grimbald_HALLO, "好 。 我 会 帮 助 你 。 你 先 走 。", DIA_Grimbald_HALLO_Was_ja);
};

func void DIA_Grimbald_HALLO_Was_neinnein()
{
	AI_Output(other, self, "DIA_Grimbald_HALLO_Was_neinnein_15_00"); //不 要 把 我 算 上 。
	AI_Output(self, other, "DIA_Grimbald_HALLO_Was_neinnein_07_01"); //那 赶 快 走 开 ， 懦 夫 。
	Grimbald_PissOff = TRUE;
	Info_ClearChoices(DIA_Grimbald_HALLO);
};

func void DIA_Grimbald_HALLO_Was_ja()
{
	AI_Output(other, self, "DIA_Grimbald_HALLO_Was_ja_15_00"); //好 。 我 会 帮 助 你 。 你 先 走 。
	AI_Output(self, other, "DIA_Grimbald_HALLO_Was_ja_07_01"); //当 然 。 但 是 不 要 离 那 里 的 黑 巨 魔 太 近 。 否 则 它 会 把 你 撕 成 碎 片 ， 明 白 吗 ？
	AI_Output(self, other, "DIA_Grimbald_HALLO_Was_ja_07_02"); //如 果 你 退 缩 的 话 ， 痛 苦 将 在 你 身 上 降 临 。
	B_StartOtherRoutine(self, "Jagd");
	AI_StopProcessInfos(self);
};

func void DIA_Grimbald_HALLO_nein()
{
	AI_Output(other, self, "DIA_Grimbald_HALLO_nein_15_00"); //我 有 自 己 的 事 要 处 理 。
	AI_Output(self, other, "DIA_Grimbald_HALLO_nein_07_01"); //不 要 说 废 话 。 你 在 这 荒 山 野 地 里 有 什 么 重 要 的 事 要 做 ？
};

///////////////////////////////////////////////////////////////////////
//	Info Jagd
///////////////////////////////////////////////////////////////////////
instance DIA_Grimbald_Jagd(C_INFO)
{
	npc				= BAU_982_Grimbald;
	nr				= 3;
	condition		= DIA_Grimbald_Jagd_Condition;
	information		= DIA_Grimbald_Jagd_Info;
	permanent		= TRUE;
	description		= "你 能 教 我 如 何 狩 猎 吗 ？";
};

func int DIA_Grimbald_Jagd_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Grimbald_HALLO))
	&& (Grimbald_TeachAnimalTrophy == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Grimbald_Jagd_Info()
{
	AI_Output(other, self, "DIA_Grimbald_Jagd_15_00"); //你 能 教 我 如 何 狩 猎 吗 ？
	if (((Npc_IsDead(Grimbald_Snapper1))
	&& (Npc_IsDead(Grimbald_Snapper2))
	&& (Npc_IsDead(Grimbald_Snapper3)))
	|| (Grimbald_PissOff == FALSE))
	{
		AI_Output(self, other, "DIA_Grimbald_Jagd_07_01"); //嗯 。 好 吧 。 到 现 在 为 止 ， 你 还 没 有 给 我 帮 什 么 忙 ， 但 是 我 们 不 要 太 苛 刻 了 。
		Grimbald_TeachAnimalTrophy = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Grimbald_Jagd_07_02"); //当 然 。 但 是 那 需 要 花 点 钱 。
		B_Say_Gold(self, other, 200);

		Info_ClearChoices(DIA_Grimbald_Jagd);
		Info_AddChoice(DIA_Grimbald_Jagd, "我 会 考 虑 的 。", DIA_Grimbald_Jagd_zuviel);
		Info_AddChoice(DIA_Grimbald_Jagd, "好 吧 。 给 你 钱 。", DIA_Grimbald_Jagd_ja);
	};
};

func void DIA_Grimbald_Jagd_ja()
{
	AI_Output(other, self, "DIA_Grimbald_Jagd_ja_15_00"); //好 吧 。 给 你 钱 。

	if (B_GiveInvItems(other, self, ItMi_Gold, 200))
	{
		AI_Output(self, other, "DIA_Grimbald_Jagd_ja_07_01"); //好 。 那 告 诉 我 你 什 么 时 候 想 要 学 点 什 么 东 西 。
		Grimbald_TeachAnimalTrophy = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Grimbald_Jagd_ja_07_02"); //给 我 钱 ， 然 后 你 就 能 学 点 东 西 。
	};

	Info_ClearChoices(DIA_Grimbald_Jagd);
};

func void DIA_Grimbald_Jagd_zuviel()
{
	AI_Output(other, self, "DIA_Grimbald_Jagd_zuviel_15_00"); //我 会 考 虑 的 。
	AI_Output(self, other, "DIA_Grimbald_Jagd_zuviel_07_01"); //随 便 你 怎 么 说。
	Info_ClearChoices(DIA_Grimbald_Jagd);
};

///////////////////////////////////////////////////////////////////////
//	Info TeachHunting
///////////////////////////////////////////////////////////////////////
instance DIA_Grimbald_TEACHHUNTING(C_INFO)
{
	npc				= BAU_982_Grimbald;
	nr				= 12;
	condition		= DIA_Grimbald_TEACHHUNTING_Condition;
	information		= DIA_Grimbald_TEACHHUNTING_Info;
	permanent		= TRUE;
	description		= "教 我 如 何 狩 猎 。";
};

func int DIA_Grimbald_TEACHHUNTING_Condition()
{
	if (Grimbald_TeachAnimalTrophy == TRUE)
	{
		return TRUE;
	};
};

var int DIA_Grimbald_TEACHHUNTING_OneTime;
func void DIA_Grimbald_TEACHHUNTING_Info()
{
	AI_Output(other, self, "DIA_Grimbald_TEACHHUNTING_15_00"); //教 我 如 何 狩 猎 。
	if (DIA_Grimbald_TEACHHUNTING_OneTime == FALSE)
	{
		B_StartOtherRoutine(self, "JagdOver");
		DIA_Grimbald_TEACHHUNTING_OneTime = TRUE;
	};

	if (
	(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_CrawlerPlate] == FALSE)
	)
	{
		AI_Output(self, other, "DIA_Grimbald_TEACHHUNTING_07_01"); //你 究 竟 想 要 了 解 什 么 ？

		Info_AddChoice(DIA_Grimbald_TEACHHUNTING, DIALOG_BACK, DIA_Grimbald_TEACHHUNTING_BACK);

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING, B_BuildLearnString(NAME_LEARN_BLOODFLY_STING, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFSting)), DIA_Grimbald_TEACHHUNTING_BFSting);
		};

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING, B_BuildLearnString(NAME_LEARN_BLOODFLY_WING, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFWing)), DIA_Grimbald_TEACHHUNTING_BFWing);
		};

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING, B_BuildLearnString(NAME_LEARN_CLAWS, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)), DIA_Grimbald_TEACHHUNTING_Claws);
		};

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING, B_BuildLearnString(NAME_LEARN_MANDIBLES, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Mandibles)), DIA_Grimbald_TEACHHUNTING_Mandibles);
		};

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_CrawlerPlate] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING, B_BuildLearnString(NAME_LEARN_CRAWLER_PLATES, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_CrawlerPlate)), DIA_Grimbald_TEACHHUNTING_CrawlerPlate);
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Grimbald_TEACHHUNTING_07_02"); //你 已 经 学 会 了 我 所 有 能 够 传 授 的 技 能 。
	};
};

func void DIA_Grimbald_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_BFSting()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_BFSting))
	{
		AI_Output(self, other, "DIA_Grimbald_TEACHHUNTING_BFSting_07_00"); //要 拔 掉 血 蝇 的 刺 真 的 没 什 么 难 的 。 你 只 要 找 到 基 点 ， 然 后 坚 定 地 下 刀 。
	};

	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_BFWing()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_BFWing))
	{
		AI_Output(self, other, "DIA_Grimbald_TEACHHUNTING_BFWing_07_00"); //你 也 可 以 把 血 蝇 的 翅 膀 拉 下 来 ， 或 者 用 快 刀 割 下 来 。
	};

	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_Claws()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_Claws))
	{
		AI_Output(self, other, "DIA_Grimbald_TEACHHUNTING_Claws_07_00"); //有 几 种 方 法 取 下 爪 子 。 对 某 些 动 物 来 说 ， 必 须 要 猛 剁 - 对 另 外 一 些 动 物 ， 你 可 以 用 刀 把 轻 松 的 砍 下 来 。
	};

	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_Mandibles()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_Mandibles))
	{
		AI_Output(self, other, "DIA_Grimbald_TEACHHUNTING_Mandibles_07_00"); //矿 井 爬 行 者 和 旷 野 袭 击 者 的 额 骨 非 常 坚 硬 ， 你 可 以 用 力 把 它 从 动 物 头 骨 上 拉 下 来 。
	};

	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_CrawlerPlate()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_CrawlerPlate))
	{
		AI_Output(self, other, "DIA_Grimbald_TEACHHUNTING_CrawlerPlate_07_00"); //矿 井 爬 行 者 的 鳞 片 紧 紧 地 贴 在 它 的 身 上 ， 但 是 你 可 以 用 坚 固 的 利 刃 把 它 们 完 整 地 取 下 。
	};

	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

///////////////////////////////////////////////////////////////////////
//	Info NovChase
///////////////////////////////////////////////////////////////////////
instance DIA_Grimbald_NovChase(C_INFO)
{
	npc				= BAU_982_Grimbald;
	nr				= 3;
	condition		= DIA_Grimbald_NovChase_Condition;
	information		= DIA_Grimbald_NovChase_Info;
	description		= "你 看 到 一 个 学 徒 经 过 这 里 吗 ？";
};

func int DIA_Grimbald_NovChase_Condition()
{
	if (MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Grimbald_NovChase_Info()
{
	AI_Output(other, self, "DIA_Grimbald_NovChase_15_00"); //你 看 到 一 个 学 徒 经 过 这 里 吗 ？
	AI_Output(self, other, "DIA_Grimbald_NovChase_07_01"); //今 天 有 很 多 奇 怪 的 人 从 这 里 经 过 - 包 括 那 两 个 家 伙 ， 从 石 拱 上 面 。
	AI_Output(self, other, "DIA_Grimbald_NovChase_07_02"); //一 段 时 间 之 前 ， 一 个 火 魔 法 师 的 新 信 徒 和 他 们 一 起 过 去 了 。
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info Trolltot
///////////////////////////////////////////////////////////////////////
instance DIA_Grimbald_Trolltot(C_INFO)
{
	npc				= BAU_982_Grimbald;
	nr				= 3;
	condition		= DIA_Grimbald_Trolltot_Condition;
	information		= DIA_Grimbald_Trolltot_Info;
	important		= TRUE;
};

func int DIA_Grimbald_Trolltot_Condition()
{
	if (Npc_IsDead(Troll_Black))
	{
		return TRUE;
	};
};

func void DIA_Grimbald_Trolltot_Info()
{
	AI_Output(self, other, "DIA_Grimbald_Trolltot_07_00"); //黑 巨 魔 死 了 。 干 得 太 好 了 。 我 从 来 没 想 过 那 东 西 竟 然 能 被 杀 死 。 我 不 会 忘 记 的 。
	B_GivePlayerXP(XP_Ambient);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Grimbald_PICKPOCKET(C_INFO)
{
	npc				= BAU_982_Grimbald;
	nr				= 900;
	condition		= DIA_Grimbald_PICKPOCKET_Condition;
	information		= DIA_Grimbald_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_100;
};

func int DIA_Grimbald_PICKPOCKET_Condition()
{
	C_Beklauen(85, 250);
};

func void DIA_Grimbald_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Grimbald_PICKPOCKET);
	Info_AddChoice(DIA_Grimbald_PICKPOCKET, DIALOG_BACK, DIA_Grimbald_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Grimbald_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Grimbald_PICKPOCKET_DoIt);
};

func void DIA_Grimbald_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Grimbald_PICKPOCKET);
};

func void DIA_Grimbald_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Grimbald_PICKPOCKET);
};
