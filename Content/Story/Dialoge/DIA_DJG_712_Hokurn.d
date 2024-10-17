//*********************************************************************
//	Info EXIT
//*********************************************************************
instance DIA_Hokurn_EXIT(C_INFO)
{
	npc				= DJG_712_Hokurn;
	nr				= 999;
	condition		= DIA_Hokurn_EXIT_Condition;
	information		= DIA_Hokurn_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Hokurn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Hokurn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//*********************************************************************
//	Info Hello
//*********************************************************************
instance DIA_Hokurn_Hello(C_INFO)
{
	npc				= DJG_712_Hokurn;
	nr				= 4;
	condition		= DIA_Hokurn_Hello_Condition;
	information		= DIA_Hokurn_Hello_Info;
	important		= TRUE;
};

func int DIA_Hokurn_Hello_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Hello_Info()
{
	AI_Output(self, other, "DIA_Hokurn_Hello_01_00"); //你 有 什 么 喝 的 东 西 吗 ？
	AI_Output(other, self, "DIA_Hokurn_Hello_15_01"); //我 想 你 要 的 不 是 水 。
	AI_Output(self, other, "DIA_Hokurn_Hello_01_02"); //不 ， 该 死 ！ ！ 我 需 要 一 些 酒 ， 那 样 我 可 以 摆 脱 这 该 死 的 头 疼 。
	AI_Output(self, other, "DIA_Hokurn_Hello_01_03"); //在 我 没 有 任 何 东 西 能 喝 的 时 候 ， 我 的 头 骨 好 像 随 时 会 爆 炸 。

	Info_ClearChoices(DIA_Hokurn_Hello);
	Info_AddChoice(DIA_Hokurn_Hello, "我 没 东 西 给 你 了 。", DIA_Hokurn_Hello_No);

	if ((Npc_HasItems(other, ItFo_Beer) >= 1)
	|| (Npc_HasItems(other, ItFo_Booze) >= 1)
	|| (Npc_HasItems(other, ItFo_Wine) >= 1))
	{
		Info_AddChoice(DIA_Hokurn_Hello, "给 ， 拿 上 这 个 。", DIA_Hokurn_Hello_Yes);
	};
};

func void DIA_Hokurn_Hello_No()
{
	AI_Output(other, self, "DIA_Hokurn_Hello_No_15_00"); //我 没 东 西 给 你 了 。
	AI_Output(self, other, "DIA_Hokurn_Hello_No_01_01"); //那 快 走 ！

	Info_ClearChoices(DIA_Hokurn_Hello);
	Info_AddChoice(DIA_Hokurn_Hello, DIALOG_ENDE, DIA_Hokurn_Hello_END);
	Info_AddChoice(DIA_Hokurn_Hello, "还 有 一 件 事 … …", DIA_Hokurn_Hello_ASK1);
};

func void DIA_Hokurn_Hello_ASK1()
{
	AI_Output(other, self, "DIA_Hokurn_Hello_ASK1_15_00"); //还 有 一 件 事 … …
	AI_Output(self, other, "DIA_Hokurn_Hello_ASK1_01_01"); //（ 呼 气 ） 你 没 听 明 白 我 的 话 吗 ？ 滚 蛋 ！ ！ ！

	Info_ClearChoices(DIA_Hokurn_Hello);
	Info_AddChoice(DIA_Hokurn_Hello, DIALOG_ENDE, DIA_Hokurn_Hello_END);
	Info_AddChoice(DIA_Hokurn_Hello, "它 非 常 重 要 。", DIA_Hokurn_Hello_ASK2);
};

func void DIA_Hokurn_Hello_ASK2()
{
	AI_Output(other, self, "DIA_Hokurn_Hello_ASK2_15_00"); //它 非 常 重 要 。
	AI_Output(self, other, "DIA_Hokurn_Hello_ASK2_01_01"); //（ 呼 气 ） 你 自 讨 苦 吃 。

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_Hokurn_Hello_END()
{
	AI_StopProcessInfos(self);
};

func void B_Hokurn_Sauf()
{
	AI_Output(self, other, "B_Hokurn_Sauf_01_00"); //（ 打 嗝 ） 哈 ， 那 恰 到 好 处 。
	AI_Output(self, other, "B_Hokurn_Sauf_01_01"); //这 样 我 又 能 清 醒 地 思 考 了 。 我 能 帮 你 做 什 么 ？
};

func void DIA_Hokurn_Hello_Yes()
{
	AI_Output(other, self, "DIA_Hokurn_Hello_Yes_15_00"); //给 ， 拿 上 这 个 。

	if (Npc_HasItems(other, ItFo_Booze) >= 1)
	{
		B_GiveInvItems(other, self, ItFo_Booze, 1);
		B_UseItem(self, ItFo_Booze);
	}
	else if (Npc_HasItems(other, ItFo_Wine) >= 1)
	{
		B_GiveInvItems(other, self, ItFo_Wine, 1);
		B_UseItem(self, ItFo_Wine);
	}
	else if (Npc_HasItems(other, ItFo_Beer) >= 1)
	{
		B_GiveInvItems(other, self, ItFo_Beer, 1);
		B_UseItem(self, ItFo_Beer);
	};

	HokurnLastDrink = Wld_GetDay();
	HokurnGetsDrink = TRUE;

	B_Hokurn_Sauf();

	Info_ClearChoices(DIA_Hokurn_Hello);
};

//*********************************************************************
//	Ich hab dir was zu Trinken mitgebracht.
//*********************************************************************
instance DIA_Hokurn_Drink(C_INFO)
{
	npc				= DJG_712_Hokurn;
	nr				= 5;
	condition		= DIA_Hokurn_Drink_Condition;
	information		= DIA_Hokurn_Drink_Info;
	permanent		= TRUE;
	description		= "我 给 你 带 了 一 些 喝 的 。";
};

func int DIA_Hokurn_Drink_Condition()
{
	if ((HokurnGetsDrink == FALSE)
	&& ((Npc_HasItems(other, ItFo_Beer) >= 1)
	|| (Npc_HasItems(other, ItFo_Booze) >= 1)
	|| (Npc_HasItems(other, ItFo_Wine) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Drink_Info()
{
	AI_Output(other, self, "DIA_Hokurn_Drink_15_00"); //我 给 你 带 了 一 些 喝 的 。
	AI_Output(self, other, "DIA_Hokurn_Drink_01_01"); //（ 贪 婪 的 ） 给 我 ！ ！

	if (Npc_HasItems(other, ItFo_Booze) >= 1)
	{
		B_GiveInvItems(other, self, ItFo_Booze, 1);
		B_UseItem(self, ItFo_Booze);
	}
	else if (Npc_HasItems(other, ItFo_Wine) >= 1)
	{
		B_GiveInvItems(other, self, ItFo_Wine, 1);
		B_UseItem(self, ItFo_Wine);
	}
	else if (Npc_HasItems(other, ItFo_Beer) >= 1)
	{
		B_GiveInvItems(other, self, ItFo_Beer, 1);
		B_UseItem(self, ItFo_Beer);
	};

	HokurnLastDrink = Wld_GetDay();
	HokurnGetsDrink = TRUE;

	B_Hokurn_Sauf();
};

//*********************************************************************
//	Ich hab da ein paar Fragen.
//*********************************************************************
instance DIA_Hokurn_Question(C_INFO)
{
	npc				= DJG_712_Hokurn;
	nr				= 5;
	condition		= DIA_Hokurn_Question_Condition;
	information		= DIA_Hokurn_Question_Info;
	permanent		= TRUE;
	description		= "我 需 要 一 些 信 息 。";
};

func int DIA_Hokurn_Question_Condition()
{
	if (HokurnGetsDrink == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Question_Info()
{
	AI_Output(other, self, "DIA_Hokurn_Question_15_00"); //我 需 要 一 些 信 息 。
	AI_Output(self, other, "DIA_Hokurn_Question_01_01"); //（ 生 气 ） 我 想 你 明 白 我 的 意 思 。 我 只 和 朋 友 讲 话 。
	AI_Output(self, other, "DIA_Hokurn_Question_01_02"); //而 朋 友 会 给 你 一 些 喝 的 。 明 白 吗 ？ 现 在 走 开 ！
};

//*********************************************************************
//	Ich such jemanden, der mir was beibringen kann.
//*********************************************************************
instance DIA_Hokurn_Learn(C_INFO)
{
	npc				= DJG_712_Hokurn;
	nr				= 6;
	condition		= DIA_Hokurn_Learn_Condition;
	information		= DIA_Hokurn_Learn_Info;
	description		= "我 在 找 能 教 我 一 些 技 能 的 人。";
};

func int DIA_Hokurn_Learn_Condition()
{
	if (HokurnGetsDrink == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Learn_Info()
{
	AI_Output(other, self, "DIA_Hokurn_Learn_15_00"); //我 在 找 能 教 我 一 些 技 能 的 人。
	AI_Output(self, other, "DIA_Hokurn_Learn_01_01"); //我 可 以 教 你 一 点 东 西 。 我 是 方 圆 几 里 内 最 好 的 战 士 。
	AI_Output(self, other, "DIA_Hokurn_Learn_01_02"); //既 然 我 们 是 朋 友 ， 我 会 给 你 一 个 特 价 。300枚 金 币 。

	Info_ClearChoices(DIA_Hokurn_Learn);
	Info_AddChoice(DIA_Hokurn_Learn, "那 对 我 来 说 太 贵 了 。", DIA_Hokurn_Learn_TooExpensive);
	if (Npc_HasItems(other, ItMi_Gold) >= 300)
	{
		Info_AddChoice(DIA_Hokurn_Learn, "好 吧 ， 钱 在 这 里 。", DIA_Hokurn_Learn_OK);
	};
};

func void DIA_Hokurn_Learn_TooExpensive()
{
	AI_Output(other, self, "DIA_Hokurn_Learn_TooExpensive_15_00"); //那 对 我 来 说 太 贵 了 。
	AI_Output(self, other, "DIA_Hokurn_Learn_TooExpensive_01_01"); //太 贵 ？ 那 可 是 所 有 在 我 这 里 买 东 西 的 人 中 所 能 得 到 的 最 低 价 格 。
	AI_Output(self, other, "DIA_Hokurn_Learn_TooExpensive_01_02"); //好 好 想 想 吧 。

	Info_ClearChoices(DIA_Hokurn_Learn);
};

func void DIA_Hokurn_Learn_OK()
{
	AI_Output(other, self, "DIA_Hokurn_Learn_OK_15_00"); //好 吧 ， 钱 在 这 里 。
	B_GiveInvItems(other, self, ItMi_Gold, 300);
	Hokurn_TeachPlayer = TRUE;
	Info_ClearChoices(DIA_Hokurn_Learn);
};

//*********************************************************************
//	Hier ist dein Geld. Ich will trainieren.
//*********************************************************************
instance DIA_Hokurn_PayTeacher(C_INFO)
{
	npc				= DJG_712_Hokurn;
	nr				= 6;
	condition		= DIA_Hokurn_PayTeacher_Condition;
	information		= DIA_Hokurn_PayTeacher_Info;
	permanent		= TRUE;
	description		= "给 你 钱 。 我 要 接 受 训 练 。";
};

func int DIA_Hokurn_PayTeacher_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Hokurn_Learn))
	&& (Npc_HasItems(other, ItMi_Gold) >= 300)
	&& (HoKurn_TeachPlayer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_PayTeacher_Info()
{
	AI_Output(other, self, "DIA_Hokurn_PayTeacher_15_00"); //给 你 钱 。 我 要 接 受 训 练 。
	AI_Output(self, other, "DIA_Hokurn_PayTeacher_01_01"); //你 不 会 后 悔 的 ！

	B_GiveInvItems(other, self, ItMi_Gold, 300);
	Hokurn_TeachPlayer = TRUE;
};

//*********************************************************************
//	Hier ist dein Drink.
//*********************************************************************
instance DIA_Hokurn_DrinkAndLearn(C_INFO)
{
	npc				= DJG_712_Hokurn;
	nr				= 7;
	condition		= DIA_Hokurn_DrinkAndLearn_Condition;
	information		= DIA_Hokurn_DrinkAndLearn_Info;
	permanent		= TRUE;
	description		= "给 你 带 了 一 点 喝 的 。";
};

func int DIA_Hokurn_DrinkAndLearn_Condition()
{
	if ((HokurnGetsDrink == TRUE)
	&& ((Npc_HasItems(other, ItFo_Booze) >= 1)
	|| (Npc_HasItems(other, ItFo_Wine) >= 1)
	|| (Npc_HasItems(other, ItFo_Beer) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_DrinkAndLearn_Info()
{
	AI_Output(other, self, "DIA_Hokurn_DrinkAndLearn_15_00"); //给 你 带 了 一 点 喝 的。

	if (Npc_HasItems(other, ItFo_Booze) >= 1)
	{
		B_GiveInvItems(other, self, ItFo_Booze, 1);
		B_UseItem(self, ItFo_Booze);
	}
	else if (Npc_HasItems(other, ItFo_Wine) >= 1)
	{
		B_GiveInvItems(other, self, ItFo_Wine, 1);
		B_UseItem(self, ItFo_Wine);
	}
	else if (Npc_HasItems(other, ItFo_Beer) >= 1)
	{
		B_GiveInvItems(other, self, ItFo_Beer, 1);
		B_UseItem(self, ItFo_Beer);
	};

	HokurnLastDrink = Wld_GetDay();

	AI_Output(self, other, "DIA_Hokurn_DrinkAndLearn_01_01"); //我 感 觉 好 多 了 。 我 已 经 准 备 好 做 任 何 事 。
};

//*********************************************************************
//	Lass uns trainieren!
//*********************************************************************
instance DIA_Hokurn_Teach(C_INFO)
{
	npc				= DJG_712_Hokurn;
	nr				= 7;
	condition		= DIA_Hokurn_Teach_Condition;
	information		= DIA_Hokurn_Teach_Info;
	permanent		= TRUE;
	description		= "让 我 们 开 始 训 练 吧 。";
};

func int DIA_Hokurn_Teach_Condition()
{
	if (Hokurn_Teachplayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Teach_Info()
{
	AI_Output(other, self, "DIA_Hokurn_Teach_15_00"); //让 我 们 开 始 训 练 吧 。

	if (HokurnLastDrink < Wld_GetDay())
	{
		AI_Output(self, other, "DIA_Hokurn_Teach_01_01"); //先 给 我 拿 一 些 喝 的 来 ！
	}
	else
	{
		if (hero.guild == GIL_PAL)
		{
			AI_Output(self, other, "DIA_Hokurn_Teach_01_02"); //那 我 们 就 看 看 能 从 你 那 腐 烂 的 圣 骑 士 的 骨 头 里 弄 出 什 么 ， 嘿 ？
		}
		else if (hero.guild == GIL_KDF)
		{
			AI_Output(self, other, "DIA_Hokurn_Teach_01_03"); //你 知 道 什 么 。 即 使 魔 法 师 也 要 使 用 近 战 武 器 。
		};

		Info_ClearChoices(DIA_Hokurn_Teach);
		Info_AddChoice(DIA_Hokurn_Teach, DIALOG_BACK, DIA_Hokurn_Teach_Back);
		Info_AddChoice(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Hokurn_Teach_2H_1);
		Info_AddChoice(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Hokurn_Teach_2H_5);
		Info_AddChoice(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Hokurn_Teach_1H_1);
		Info_AddChoice(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Hokurn_Teach_1H_5);
	};
};

func void DIA_Hokurn_Teach_Back()
{
	Info_ClearChoices(DIA_Hokurn_Teach);
};

func void B_Hokurn_TeachedEnough()
{
	AI_Output(self, other, "B_Hokurn_TeachedEnough_01_00"); //你 不 再 需 要 老 师 来 进 行 这 项 训 练 了 。
};

func void DIA_Hokurn_Teach_2H_1()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_2H, 1, 100);

	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		B_Hokurn_TeachedEnough();
	};

	Info_AddChoice(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Hokurn_Teach_2H_1);
};

func void DIA_Hokurn_Teach_2H_5()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_2H, 5, 100);

	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		B_Hokurn_TeachedEnough();
	};

	Info_AddChoice(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Hokurn_Teach_2H_5);
};

func void DIA_Hokurn_Teach_1H_1()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_1H, 1, 100);

	if (other.HitChance[NPC_TALENT_1H] >= 100)
	{
		B_Hokurn_TeachedEnough();
	};

	Info_AddChoice(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Hokurn_Teach_1H_1);
};

func void DIA_Hokurn_Teach_1H_5()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_1H, 5, 100);

	if (other.HitChance[NPC_TALENT_1H] >= 100)
	{
		B_Hokurn_TeachedEnough();
	};

	Info_AddChoice(DIA_Hokurn_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Hokurn_Teach_1H_5);
};

//*********************************************************************
//	Wieso hängt ihr hier überhaupt rum?
//*********************************************************************
instance DIA_Hokurn_StayHere(C_INFO)
{
	npc				= DJG_712_Hokurn;
	nr				= 5;
	condition		= DIA_Hokurn_StayHere_Condition;
	information		= DIA_Hokurn_StayHere_Info;
	description		= "你 在 这 里 做 什 么 ？";
};

func int DIA_Hokurn_StayHere_Condition()
{
	if (HokurnGetsDrink == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Hokurn_StayHere_Info()
{
	AI_Output(other, self, "DIA_Hokurn_StayHere_15_00"); //你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Hokurn_StayHere_01_01"); //我 一 点 也 不 知 道 我 们 在 这 里 做 什 么 ， 或 者 是 从 什 么 时 候 开 始 的 。
	AI_Output(self, other, "DIA_Hokurn_StayHere_01_02"); //只 要 我 有 足 够 的 喝 的， 我 就 什 么 都 不 在 乎 。

	/*
	AI_Output(other, self, "DIA_Addon_Hokurn_StayHere_15_00"); //Was wollt ihr hier überhaupt?
	AI_Output(self, other, "DIA_Addon_Hokurn_StayHere_01_01"); //Keine Ahnung, was wir hier machen oder wann es los geht.
	AI_Output(self, other, "DIA_Addon_Hokurn_StayHere_01_02"); //Ist mir auch egal, solange ich genug zu trinken habe.
	*/
};

//*********************************************************************
//	Wisst ihr denn, wo die Drachen sind.
//*********************************************************************
instance DIA_Hokurn_WhereDragon(C_INFO)
{
	npc				= DJG_712_Hokurn;
	nr				= 5;
	condition		= DIA_Hokurn_WhereDragon_Condition;
	information		= DIA_Hokurn_WhereDragon_Info;
	permanent		= TRUE;
	description		= "那 你 知 道 龙 在 哪 里 ？";
};

func int DIA_Hokurn_WhereDragon_Condition()
{
	if ((HokurnGetsDrink == TRUE)
	&& (HokurnTellsDragon == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Hokurn_StayHere)))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_WhereDragon_Info()
{
	AI_Output(other, self, "DIA_Hokurn_WhereDragon_15_00"); //那 你 知 道 龙 在 哪 里 ？
	AI_Output(self, other, "DIA_Hokurn_WhereDragon_01_01"); //如 果 我 告 诉 你 的 话 ， 我 有 什 么 好 处 ？

	Info_ClearChoices(DIA_Hokurn_WhereDragon);
	Info_AddChoice(DIA_Hokurn_WhereDragon, "没 什 么 ， 我 自 己 去 找 它 们 。", DIA_Hokurn_WhereDragon_FindMyself);
	Info_AddChoice(DIA_Hokurn_WhereDragon, "我 愿 意 给 你 钱 买 那 些 信 息 。", DIA_Hokurn_WhereDragon_Gold);
	if (Npc_HasItems(other, ITFO_BOOZE) >= 1)
	{
		Info_AddChoice(DIA_Hokurn_WhereDragon, "我 还 有 一 瓶 姜 酒 。", DIA_Hokurn_WhereDragon_Booze);
	};
};

func void DIA_Hokurn_WhereDragon_FindMyself()
{
	AI_Output(other, self, "DIA_Hokurn_WhereDragon_FindMyself_15_00"); //没 什 么 ， 我 自 己 去 找 它 们 。
	AI_Output(self, other, "DIA_Hokurn_WhereDragon_FindMyself_01_01"); //你 最 好 小 心 。 你 前 面 将 是 一 场 恐 怖 的 战 斗 。
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
};

func void DIA_Hokurn_WhereDragon_Gold()
{
	AI_Output(other, self, "DIA_Hokurn_WhereDragon_Gold_15_00"); //我 愿 意 给 你 钱 买 那 些 信 息 。
	AI_Output(self, other, "DIA_Hokurn_WhereDragon_Gold_01_01"); //给 我 钱 ？ 嗯 。 我 告 诉 你 的 信 息 需 要200枚 金 币 。

	Info_ClearChoices(DIA_Hokurn_WhereDragon);
	Info_AddChoice(DIA_Hokurn_WhereDragon, "太 多 了", DIA_Hokurn_WhereDragon_TooMuch);
	if (Npc_HasItems(other, ItMi_Gold) >= 200)
	{
		Info_AddChoice(DIA_Hokurn_WhereDragon, "成 交 。 给 你 钱 。", DIA_Hokurn_WhereDragon_OK);
	};
};

func void DIA_Hokurn_WhereDragon_TooMuch()
{
	AI_Output(other, self, "DIA_Hokurn_WhereDragon_TooMuch_15_00"); //太 多 了 ！
	AI_Output(self, other, "DIA_Hokurn_WhereDragon_TooMuch_01_01"); //那 算 了 吧 。
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
};

func void DIA_Hokurn_WhereDragon_OK()
{
	AI_Output(other, self, "DIA_Hokurn_WhereDragon_OK_15_00"); //成 交 。 给 你 钱 。
	B_GiveInvItems(other, self, ItMi_gold, 200);

	HokurnTellsDragon = TRUE;
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
};

func void DIA_Hokurn_WhereDragon_Booze()
{
	AI_Output(other, self, "DIA_Hokurn_WhereDragon_Booze_15_00"); //我 还 有 一 瓶 姜 酒 ！
	AI_Output(self, other, "DIA_Hokurn_WhereDragon_Booze_01_01"); //一 瓶 好 酒 足 以 让 我 同 世 界 上 所 有 的 龙 战 斗 。
	AI_Output(self, other, "DIA_Hokurn_WhereDragon_Booze_01_02"); //同 意 。 给 我 酒 ！
	B_GiveInvItems(other, self, ItFo_booze, 1);
	AI_Output(self, other, "DIA_Hokurn_WhereDragon_Booze_01_03"); //我 要 把 那 个 留 到 雨 天 享 用 。

	HokurnTellsDragon = TRUE;
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
};

//*********************************************************************
//	Also, wo sind jetzt die Drachen?
//*********************************************************************
instance DIA_Hokurn_Dragon(C_INFO)
{
	npc				= DJG_712_Hokurn;
	nr				= 5;
	condition		= DIA_Hokurn_Dragon_Condition;
	information		= DIA_Hokurn_Dragon_Info;
	permanent		= TRUE;
	description		= "好 吧 ， 现 在 ， 那 些 龙 在 哪 里 ？";
};

func int DIA_Hokurn_Dragon_Condition()
{
	if (HokurnTellsDragon == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Dragon_Info()
{
	AI_Output(other, self, "DIA_Hokurn_Dragon_15_00"); //好 吧 ， 现 在 ， 那 些 龙 在 哪 里 ？
	AI_Output(self, other, "DIA_Hokurn_Dragon_01_01"); //很 自 然 ， 我 无 法 准 确 地 告 诉 你 ， 但 是 我 已 经 听 说 可 能 有 四 条 龙 。
	AI_Output(self, other, "DIA_Hokurn_Dragon_01_02"); //在 夜 里 ， 我 们 已 经 在 最 高 的 山 峰 上 看 见 一 道 红 光 。
	AI_Output(self, other, "DIA_Hokurn_Dragon_01_03"); //我 以 我 母 亲 的 名 义 发 誓 ， 如 果 你 要 找 龙 的 话 ， 肯 定 能 在 那 里 找 到 一 条 。
};

//*********************************************************************
//	AllDragonsDead
//*********************************************************************
instance DIA_Hokurn_AllDragonsDead(C_INFO)
{
	npc				= DJG_712_Hokurn;
	nr				= 5;
	condition		= DIA_Hokurn_AllDragonsDead_Condition;
	information		= DIA_Hokurn_AllDragonsDead_Info;
	permanent		= TRUE;
	description		= "我 已 经 杀 了 所 有 的 龙 。";
};

func int DIA_Hokurn_AllDragonsDead_Condition()
{
	if (MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Hokurn_AllDragonsDead_Info()
{
	AI_Output(other, self, "DIA_Hokurn_AllDragonsDead_15_00"); //我 已 经 杀 了 所 有 的 龙 。
	AI_Output(self, other, "DIA_Hokurn_AllDragonsDead_01_01"); //走 开 ， 去 找 别 人 说 你 那 些 幻 想 故 事 吧 。
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Hokurn_PICKPOCKET(C_INFO)
{
	npc				= DJG_712_Hokurn;
	nr				= 900;
	condition		= DIA_Hokurn_PICKPOCKET_Condition;
	information		= DIA_Hokurn_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Hokurn_PICKPOCKET_Condition()
{
	C_Beklauen(69, 210);
};

func void DIA_Hokurn_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hokurn_PICKPOCKET);
	Info_AddChoice(DIA_Hokurn_PICKPOCKET, DIALOG_BACK, DIA_Hokurn_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hokurn_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Hokurn_PICKPOCKET_DoIt);
};

func void DIA_Hokurn_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hokurn_PICKPOCKET);
};

func void DIA_Hokurn_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hokurn_PICKPOCKET);
};
