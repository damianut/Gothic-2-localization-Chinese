//*********************************************************************
//	Info EXIT
//*********************************************************************
instance DIA_Godar_EXIT(C_INFO)
{
	npc				= DJG_711_Godar;
	nr				= 999;
	condition		= DIA_Godar_EXIT_Condition;
	information		= DIA_Godar_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Godar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Godar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//*********************************************************************
//	Info Hello
//*********************************************************************
instance DIA_Godar_Hello(C_INFO)
{
	npc				= DJG_711_Godar;
	nr				= 4;
	condition		= DIA_Godar_Hello_Condition;
	information		= DIA_Godar_Hello_Info;
	important		= TRUE;
};

func int DIA_Godar_Hello_Condition()
{
	if (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

func void DIA_Godar_Hello_Info()
{
	AI_Output(self, other, "DIA_Godar_Hello_13_00"); //呃 ？ 什 么 ？
};

//*********************************************************************
//	Wo kommt ihr überhaupt her?
//*********************************************************************
instance DIA_Godar_ComeFrom(C_INFO)
{
	npc				= DJG_711_Godar;
	nr				= 4;
	condition		= DIA_Godar_ComeFrom_Condition;
	information		= DIA_Godar_ComeFrom_Info;
	description		= "你 从 哪 里 来 ？";
};

func int DIA_Godar_ComeFrom_Condition()
{
	return TRUE;
};

func void DIA_Godar_ComeFrom_Info()
{
	AI_Output(other, self, "DIA_Godar_ComeFrom_15_00"); //你 从 哪 里 来 ？
	AI_Output(self, other, "DIA_Godar_ComeFrom_13_01"); //我 们 来 自 … … 呃 ， 城 里 。

	Info_ClearChoices(DIA_Godar_ComeFrom);
	Info_AddChoice(DIA_Godar_ComeFrom, "你 们 是 强 盗 ！", DIA_Godar_ComeFrom_Bandits);
	Info_AddChoice(DIA_Godar_ComeFrom, "为 什 么 我 以 前 从 没 在 镇 上 见 过 你 ？", DIA_Godar_ComeFrom_NotCity);
	Info_AddChoice(DIA_Godar_ComeFrom, "明 白 了 。 那 么 ， 从 城 里 来 的 。", DIA_Godar_ComeFrom_Understand);
};

func void DIA_Godar_ComeFrom_Bandits()
{
	AI_Output(other, self, "DIA_Godar_ComeFrom_Bandits_15_00"); //你 们 是 强 盗 ！
	AI_Output(self, other, "DIA_Godar_ComeFrom_Bandits_13_01"); //小 心 ！ 你 太 不 自 量 力 了 ！

	Info_ClearChoices(DIA_Godar_ComeFrom);
	Info_AddChoice(DIA_Godar_ComeFrom, "放 松 。 我 不 会 出 卖 你 的 。", DIA_Godar_ComeFrom_Bandits_KeepCalm);
	Info_AddChoice(DIA_Godar_ComeFrom, "你 吓 唬 不 了 我 。", DIA_Godar_ComeFrom_Bandits_NoFear);
};

func void DIA_Godar_ComeFrom_Bandits_KeepCalm()
{
	AI_Output(other, self, "DIA_Godar_ComeFrom_Bandits_KeepCalm_15_00"); //放 松 。 我 不 会 出 卖 你 的 。
	AI_Output(self, other, "DIA_Godar_ComeFrom_Bandits_KeepCalm_13_01"); //我 希 望 如 此 ， 为 了 你 着 想 。 否 则 你 就 死 了 ！

	Info_ClearChoices(DIA_Godar_ComeFrom);
};

func void DIA_Godar_ComeFrom_Bandits_NoFear()
{
	AI_Output(other, self, "DIA_Godar_ComeFrom_Bandits_NoFear_15_00"); //你 吓 唬 不 了 我 。
	AI_Output(self, other, "DIA_Godar_ComeFrom_Bandits_NoFear_13_01"); //关 于 那 个 到 时 候 就 知 道 了 。

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_Godar_ComeFrom_NotCity()
{
	AI_Output(other, self, "DIA_Godar_ComeFrom_NotCity_15_00"); //我 以 前 没 在 镇 上 见 过 你 。
	AI_Output(self, other, "DIA_Godar_ComeFrom_NotCity_13_01"); //我 忍 受 不 了 那 些 四 处 打 探 和 他 无 关 的 事 的 人 ， 明 白 吗 ？

	Info_ClearChoices(DIA_Godar_ComeFrom);
	Info_AddChoice(DIA_Godar_ComeFrom, "不 。", DIA_Godar_ComeFrom_NotCity_CutThroat);
	Info_AddChoice(DIA_Godar_ComeFrom, "我 知 道 了 ， 你 来 自 城 市 。", DIA_Godar_ComeFrom_NotCity_Forget);
};

func void DIA_Godar_ComeFrom_NotCity_Forget()
{
	AI_Output(other, self, "DIA_Godar_ComeFrom_NotCity_Forget_15_00"); //我 知 道 了 ， 你 来 自 城 市 。
	AI_Output(self, other, "DIA_Godar_ComeFrom_NotCity_Forget_13_01"); //完全正确。

	Info_ClearChoices(DIA_Godar_ComeFrom);
};

func void DIA_Godar_ComeFrom_NotCity_CutThroat()
{
	AI_Output(other, self, "DIA_Godar_ComeFrom_NotCity_CutThroat_15_00"); //不 。
	AI_Output(self, other, "DIA_Godar_ComeFrom_NotCity_CutThroat_13_01"); //那 我 就 必 须 让 你 知 道 。

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_Godar_ComeFrom_Understand()
{
	AI_Output(other, self, "DIA_Godar_ComeFrom_Understand_15_00"); //明 白 了 。 那 么 ， 从 城 里 来 的 。
	AI_Output(self, other, "DIA_Godar_ComeFrom_Understand_13_01"); //看 ！ 你 明 白 了 ！
	AI_Output(self, other, "DIA_Godar_ComeFrom_Understand_13_02"); //给 ， 喝 吧 ！

	CreateInvItems(self, ItFo_Beer, 1);
	B_GiveInvItems(self, other, ItFo_Beer, 1);
	B_UseItem(other, ItFo_Beer);
	Info_ClearChoices(DIA_Godar_ComeFrom);
};

//*********************************************************************
//	Was macht ihr hier?
//*********************************************************************
instance DIA_Godar_Plan(C_INFO)
{
	npc				= DJG_711_Godar;
	nr				= 5;
	condition		= DIA_Godar_Plan_Condition;
	information		= DIA_Godar_Plan_Info;
	description		= "你 在 这 里 做 什 么 ？";
};

func int DIA_Godar_Plan_Condition()
{
	return TRUE;
};

func void DIA_Godar_Plan_Info()
{
	AI_Output(other, self, "DIA_Godar_Plan_15_00"); //你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Godar_Plan_13_01"); //我 们 听 说 了 关 于 龙 猎 手 的 事 。 所 以 我 们 把 东 西 收 拾 好 就 来 这 里 了 。
	AI_Output(self, other, "DIA_Godar_Plan_13_02"); //不 过 说 实 话 ， 我 一 点 也 不 在 乎 什 么 龙 。 我 只 想 要 点 钱 。
	AI_Output(self, other, "DIA_Godar_Plan_13_03"); //龙 有 金 子 ， 是 吗 ？
	AI_Output(other, self, "DIA_Godar_Plan_15_04"); //当 然 。
};

//*********************************************************************
//	Wisst ihr was über die Drachen?
//*********************************************************************
instance DIA_Godar_DragonLore(C_INFO)
{
	npc				= DJG_711_Godar;
	nr				= 5;
	condition		= DIA_Godar_DragonLore_Condition;
	information		= DIA_Godar_DragonLore_Info;
	description		= "关 于 龙 你 了 解 什 么 ？";
};

func int DIA_Godar_DragonLore_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Godar_Plan))
	{
		return TRUE;
	};
};

func void DIA_Godar_DragonLore_Info()
{
	AI_Output(other, self, "DIA_Godar_DragonLore_15_00"); //关 于 龙 你 了 解 什 么 ？
	AI_Output(self, other, "DIA_Godar_DragonLore_13_01"); //我 只 知 道 大 人 告 诉 小 孩 的 那 些 故 事 。
	AI_Output(self, other, "DIA_Godar_DragonLore_13_02"); //你 知 道 ， 女 孩 、 金 子 、 喷 火 ， 那 类 事 情 。
};

//*********************************************************************
//	Wo wollt ihr hin?
//*********************************************************************
instance DIA_Godar_Destination(C_INFO)
{
	npc				= DJG_711_Godar;
	nr				= 5;
	condition		= DIA_Godar_Destination_Condition;
	information		= DIA_Godar_Destination_Info;
	description		= "你 打 算 从 这 里 去 哪 儿 ？";
};

func int DIA_Godar_Destination_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Godar_Plan))
	{
		return TRUE;
	};
};

func void DIA_Godar_Destination_Info()
{
	AI_Output(other, self, "DIA_Godar_Destination_15_00"); //你 打 算 从 这 里 去 哪 儿 ？
	AI_Output(self, other, "DIA_Godar_Destination_13_01"); //不 知 道 。 我 们 还 在 考 虑 。

	if ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(other, self, "DIA_Godar_Destination_15_02"); //你 可 以 去 城 堡 。
		AI_Output(self, other, "DIA_Godar_Destination_13_03"); //就 算 用 野 马 也 别 想 把 我 拉 到 那 里 去 。 我 不 去 圣 骑 士 那 儿 。
		AI_Output(self, other, "DIA_Godar_Destination_13_04"); //我 不 想 回 监 狱 。 我 进 去 过 一 次 了 ， 我 已 经 受 够 了 。
	};
};

//*********************************************************************
//	Was ist mit den Orks?
//*********************************************************************
instance DIA_Godar_Orks(C_INFO)
{
	npc				= DJG_711_Godar;
	nr				= 5;
	condition		= DIA_Godar_Orks_Condition;
	information		= DIA_Godar_Orks_Info;
	description		= "那 兽 人 呢 ？";
};

func int DIA_Godar_Orks_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Godar_Destination))
	{
		return TRUE;
	};
};

func void DIA_Godar_Orks_Info()
{
	AI_Output(other, self, "DIA_Godar_Orks_15_00"); //那 兽 人 呢 ？
	AI_Output(self, other, "DIA_Godar_Orks_13_01"); //整 个 城 堡 已 经 被 包 围 了 。 没 有 任 何 突 破 口 。
	AI_Output(self, other, "DIA_Godar_Orks_13_02"); //想 要 溜 进 那 里 是 极 愚 蠢 的 想 法 。 如 果 你 打 算 战 斗 的 话 ， 你 死 定 了 。
	AI_Output(self, other, "DIA_Godar_Orks_13_03"); //没 人 能 通 过 那 里 。
	AI_Output(other, self, "DIA_Godar_Orks_15_04"); //啊 ， 真 的 。
};

//*********************************************************************
//	Weswegen warst du im Knast?
//*********************************************************************
instance DIA_Godar_Prison(C_INFO)
{
	npc				= DJG_711_Godar;
	nr				= 5;
	condition		= DIA_Godar_Prison_Condition;
	information		= DIA_Godar_Prison_Info;
	description		= "你 为 什 么 会 在 监 狱 里 ？";
};

func int DIA_Godar_Prison_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Godar_Destination))
	&& ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Godar_Prison_Info()
{
	AI_Output(other, self, "DIA_Godar_Prison_15_00"); //你 为 什 么 会 在 监 狱 里 ？

	if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Godar_Prison_13_01"); //也 许 我 会 告 诉 你 的 ， 嗯 ？
		AI_Output(self, other, "DIA_Godar_Prison_13_02"); //你 们 魔 法 师 在 与 圣 骑 士 勾 结 。 不 ， 我 的 朋 友 。 不 要 再 提 了 。
	}
	else
	{
		AI_Output(self, other, "DIA_Godar_Prison_13_03"); //那 个 畜 牲 以 盗 窃 罪 抓 住 了 我 。 就 是 因 为 两 只 可 恶 的 野 兔 ！
		AI_Output(self, other, "DIA_Godar_Prison_13_04"); //他 们 为 了 那 个 关 了 我 1 0 年 。
		AI_Output(other, self, "DIA_Godar_Prison_15_05"); //就 这 些 ?
		AI_Output(self, other, "DIA_Godar_Prison_13_06"); //嗯 ， 好 吧 ， 当 然 我 反 抗 了 。
		AI_Output(other, self, "DIA_Godar_Prison_15_07"); //然 后 ？
		AI_Output(self, other, "DIA_Godar_Prison_13_08"); //我 什 么 都 没 做 ， 那 个 家 伙 绊 倒 了 ， 并 扭 断 了 自 己 的 脖 子 。 是 真 的 ！

		Info_ClearChoices(DIA_Godar_Prison);
		Info_AddChoice(DIA_Godar_Prison, "听 起 来 很 熟 悉 。", DIA_Godar_Prison_Court);
		Info_AddChoice(DIA_Godar_Prison, "你 不 应 该 让 自 己 被 捕 。？", DIA_Godar_Prison_Pissoff);
	};
};

func void DIA_Godar_Prison_Court()
{
	AI_Output(other, self, "DIA_Godar_Prison_Court_15_00"); //听 起 来 很 耳 熟 。
	AI_Output(self, other, "DIA_Godar_Prison_Court_13_01"); //你 知 道 我 的 意 思 。 那 些 有 钱 的 混 蛋 们 根 本 不 知 道 我 们 受 到 什 么 样 的 待 遇 。
	AI_Output(self, other, "DIA_Godar_Prison_Court_13_02"); //那 丝 毫 不 用 他 们 担 心 。

	Info_ClearChoices(DIA_Godar_Prison);
	GodarLikesYou = TRUE;
};

func void DIA_Godar_Prison_Pissoff()
{
	AI_Output(other, self, "DIA_Godar_Prison_Pissoff_15_00"); //你 不 应 该 让 自 己 被 捕 。？
	AI_Output(self, other, "DIA_Godar_Prison_Pissoff_13_01"); //（ 生 气 ） 我 打 赌 你 从 来 没 有 进 过 监 狱 ， 是 吗 ？
	AI_Output(self, other, "DIA_Godar_Prison_Pissoff_13_02"); //那 我 要 教 你 一 课 ， 在 监 狱 里 一 个 人 会 遇 到 什 么 样 的 事 。

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

//*********************************************************************
//	Kannst du mir beibringen wie man jagt?
//*********************************************************************
instance DIA_Godar_Hunting(C_INFO)
{
	npc				= DJG_711_Godar;
	nr				= 5;
	condition		= DIA_Godar_Hunting_Condition;
	information		= DIA_Godar_Hunting_Info;
	description		= "你 能 教 我 如 何 狩 猎 吗 ？";
};

func int DIA_Godar_Hunting_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Godar_Prison))
	&& ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Godar_Hunting_Info()
{
	AI_Output(other, self, "DIA_Godar_Hunting_15_00"); //你 能 教 我 如 何 狩 猎 吗 ？
	if (GodarLikesYou == FALSE)
	{
		AI_Output(self, other, "DIA_Godar_Hunting_13_01"); //你 不 是 认 真 的 吧 ， 对 吗 ？ 走 开 ！
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, other, "DIA_Godar_Hunting_13_03"); //一 头 动 物 身 上 不 光 只 有 肉 。 你 还 能 出 售 皮 毛 和 爪 子 。 那 可 以 带 来 一 笔 客 观 的 收 入 。
		AI_Output(self, other, "DIA_Godar_Hunting_13_04"); //我 几 乎 迫 不 及 待 要 去 把 龙 解 决 掉 。

		Godar_TeachAnimalTrophy = TRUE;
	};
};

//*********************************************************************
// 	Dragonstuff
//*********************************************************************
instance DIA_Godar_Dragonstuff(C_INFO)
{
	npc				= DJG_711_Godar;
	nr				= 5;
	condition		= DIA_Godar_Dragonstuff_Condition;
	information		= DIA_Godar_Dragonstuff_Info;
	permanent		= TRUE;
	description		= "告 诉 我 怎 么 解 剖 一 条 龙 。";
};

var int Godar_TeachDragonStuff;
func int DIA_Godar_Dragonstuff_Condition()
{
	if ((Godar_TeachAnimalTrophy == TRUE)
	&& ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	&& ((PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonScale] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonBlood] == FALSE))
	&& (Godar_TeachDragonStuff == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Godar_Dragonstuff_Info()
{
	AI_Output(other, self, "DIA_Godar_Dragonstuff_15_00"); //告 诉 我 怎 么 解 剖 一 条 龙 。

	AI_Output(self, other, "DIA_Godar_Dragonstuff_13_01"); //那 样 你 可 以 一 个 人 把 钱 都 拿 走 ， 嗯 ？

	AI_Output(self, other, "DIA_Godar_Dragonstuff_13_02"); //嗯 ， 好 吧 ， 但 是 那 需 要1000枚 金 币 。

	Info_ClearChoices(DIA_Godar_Dragonstuff);
	Info_AddChoice(DIA_Godar_Dragonstuff, "对 我 来 说 那 不 值 得 。", DIA_Godar_Dragonstuff_nein);
	Info_AddChoice(DIA_Godar_Dragonstuff, "那 很 公 平 。", DIA_Godar_Dragonstuff_fair);
};

func void DIA_Godar_Dragonstuff_fair()
{
	AI_Output(other, self, "DIA_Godar_Dragonstuff_fair_15_00"); //那 很 公 平 。

	if (B_GiveInvItems(other, self, ItMi_Gold, 1000))
	{
		Godar_TeachDragonStuff = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Godar_Dragonstuff_fair_13_01"); //没 钱 的 话 不 行 。 先 去 弄 点 现 金 。
	};

	Info_ClearChoices(DIA_Godar_Dragonstuff);
};

func void DIA_Godar_Dragonstuff_nein()
{
	AI_Output(other, self, "DIA_Godar_Dragonstuff_nein_15_00"); //对 我 来 说 那 不 值 得 。
	AI_Output(self, other, "DIA_Godar_Dragonstuff_nein_13_01"); //随 你 的 便 吧 。
	Info_ClearChoices(DIA_Godar_Dragonstuff);
};

//*********************************************************************
//	Zeig mir wie man jagd.
//*********************************************************************
instance DIA_Godar_Teach(C_INFO)
{
	npc				= DJG_711_Godar;
	nr				= 5;
	condition		= DIA_Godar_Teach_Condition;
	information		= DIA_Godar_Teach_Info;
	permanent		= TRUE;
	description		= "告 诉 我 如 何 打 猎 。";
};

func int DIA_Godar_Teach_Condition()
{
	if ((Godar_TeachAnimalTrophy == TRUE)
	&& ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Godar_Teach_Info()
{
	AI_Output(other, self, "DIA_Godar_Teach_15_00"); //告 诉 我 如 何 打 猎 。
	if (
	(Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonScale] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonBlood] == FALSE)
	)
	{
		Info_AddChoice(DIA_Godar_Teach, Dialog_Back, DIA_Godar_Teach_Back);

		if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == FALSE)
		{
//#if zpe
//			Info_AddChoice(DIA_Godar_Teach, B_BuildLearnString(TXT_TALENTS[NPC_TALENT_SNEAK], B_GetLearnCostTalent(other, NPC_TALENT_SNEAK, 1)), DIA_Godar_Teach_Thief_Sneak);
//#else
			Info_AddChoice(DIA_Godar_Teach, B_BuildLearnString(NAME_TALENT_SNEAK, B_GetLearnCostTalent(other, NPC_TALENT_SNEAK, 1)), DIA_Godar_Teach_Thief_Sneak);
//#endif
		};

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(DIA_Godar_Teach, B_BuildLearnString(NAME_LEARN_TEETH, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)), DIA_Godar_Teach_TROPHYS_Teeth);
		};

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
		{
			Info_AddChoice(DIA_Godar_Teach, B_BuildLearnString(NAME_LEARN_BLOODFLY_STING, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFSting)), DIA_Godar_Teach_TROPHYS_BFSting);
		};

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
		{
			Info_AddChoice(DIA_Godar_Teach, B_BuildLearnString(NAME_LEARN_BLOODFLY_WING, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFWing)), DIA_Godar_Teach_TROPHYS_BFWing);
		};

		if (Godar_TeachDragonStuff == TRUE)
		{
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonScale] == FALSE)
			{
				Info_AddChoice(DIA_Godar_Teach, B_BuildLearnString(NAME_LEARN_DRAGON_SCALES, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DragonScale)), DIA_Godar_Teach_TROPHYS_DragonScale);
			};

			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonBlood] == FALSE)
			{
				Info_AddChoice(DIA_Godar_Teach, B_BuildLearnString(NAME_LEARN_DRAGON_BLOOD, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DragonBlood)), DIA_Godar_Teach_TROPHYS_DragonBlood);
			};
		};
	}
	else
	{
		B_Say(self, other, "$NOLEARNYOUREBETTER"); // Ich kann dir nichts mehr beibringen. Du bist schon zu gut...
	};
};

func void DIA_Godar_Teach_Back()
{
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_Teeth()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_Teeth))
	{
		AI_Output(self, other, "DIA_Godar_TEACHHUNTING_Teeth_13_00"); //取 下 牙 齿 最 好 的 方 法 是 用 一 把 坚 固 的 刀 。
	};

	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_BFSting()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_BFSting))
	{
		AI_Output(self, other, "DIA_Godar_TEACHHUNTING_BFSting_13_00"); //取 下 血 蝇 刺 最 快 的 方 法 是 在 用 刀 切 之 前 ， 先 把 它 挤 出 来 。
	};

	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_BFWing()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_BFWing))
	{
		AI_Output(self, other, "DIA_Godar_TEACHHUNTING_BFWing_13_00"); //血 蝇 的 翅 膀 非 常 容 易 受 损 。 所 以 在 切 它 们 的 时 候 ， 要 小 心 。
	};

	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_Thief_Sneak()
{
	if (B_TeachThiefTalent(self, other, NPC_TALENT_SNEAK))
	{
		AI_Output(self, other, "DIA_Godar_TEACHHUNTING_Sneak_13_00"); //当 你 在 潜 行 的 时 候 要 穿 软 底 鞋 。 坚 硬 的 鞋 底 会 发 出 非 常 大 的 声 音 。
	};

	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_DragonScale()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_DragonScale))
	{
		AI_Output(self, other, "DIA_Godar_TEACHHUNTING_DragonScale_13_00"); //你 需 要 很 大 的 力 气 才 能 把 龙 鳞 从 龙 的 身 上 取 下 。 但 是 你 能 做 到 。
	};

	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_DragonBlood()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_DragonBlood))
	{
		AI_Output(self, other, "DIA_Godar_TEACHHUNTING_DragonBlood_13_00"); //在 龙 的 腹 部 寻 找 一 个 柔 软 的 位 置 ， 那 是 取 龙 血 最 简 单 的 方 式 。
	};

	Info_ClearChoices(DIA_Godar_Teach);
};

//*********************************************************************
//	AllDragonsDead
//*********************************************************************
instance DIA_Godar_AllDragonsDead(C_INFO)
{
	npc				= DJG_711_Godar;
	nr				= 5;
	condition		= DIA_Godar_AllDragonsDead_Condition;
	information		= DIA_Godar_AllDragonsDead_Info;
	description		= "我 已 经 杀 了 所 有 的 龙 。";
};

func int DIA_Godar_AllDragonsDead_Condition()
{
	if (MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Godar_AllDragonsDead_Info()
{
	AI_Output(other, self, "DIA_Godar_AllDragonsDead_15_00"); //我 已 经 杀 了 所 有 的 龙 。
	AI_Output(self, other, "DIA_Godar_AllDragonsDead_13_01"); //嗯 ， 那 又 怎 么 样 ？ 山 谷 这 里 还 有 足 够 的 数 量 。
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Godar_PICKPOCKET(C_INFO)
{
	npc				= DJG_711_Godar;
	nr				= 900;
	condition		= DIA_Godar_PICKPOCKET_Condition;
	information		= DIA_Godar_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Godar_PICKPOCKET_Condition()
{
	C_Beklauen(16, 160);
};

func void DIA_Godar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Godar_PICKPOCKET);
	Info_AddChoice(DIA_Godar_PICKPOCKET, DIALOG_BACK, DIA_Godar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Godar_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Godar_PICKPOCKET_DoIt);
};

func void DIA_Godar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Godar_PICKPOCKET);
};

func void DIA_Godar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Godar_PICKPOCKET);
};
