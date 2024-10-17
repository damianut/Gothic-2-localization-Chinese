///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_EXIT(C_INFO)
{
	npc				= VLK_4108_Engor;
	nr				= 999;
	condition		= DIA_Engor_EXIT_Condition;
	information		= DIA_Engor_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Engor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Engor_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HALLO
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_HALLO(C_INFO)
{
	npc				= VLK_4108_Engor;
	nr				= 2;
	condition		= DIA_Engor_HALLO_Condition;
	information		= DIA_Engor_HALLO_Info;
	important		= TRUE;
};

func int DIA_Engor_HALLO_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Engor_HALLO_Info()
{
	AI_Output(self, other, "DIA_Engor_HALLO_13_00"); //啊 ， 那 么 你 是 那 个 通 过 了 关 卡 的 家 伙 。
	AI_Output(other, self, "DIA_Engor_HALLO_15_01"); //是 的 。
	AI_Output(self, other, "DIA_Engor_HALLO_13_02"); //太 棒 了 。 我 是 恩 高 尔 - 我 领 导 这 次 远 征 。
	AI_Output(self, other, "DIA_Engor_HALLO_13_03"); //千 万 别 有 这 样 的 念 头 ， 认 为 我 会 免 费 提 供 任 何 东 西 ！
	AI_Output(self, other, "DIA_Engor_HALLO_13_04"); //但 是 ， 如 果 你 口 袋 里 有 钱 ， 我 总 是 会 愿 意 给 予 一 点 优 惠 。

	Log_CreateTopic(TOPIC_Trader_OC, LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC, TOPIC_Trader_OC_7);
};

///////////////////////////////////////////////////////////////////////
//	Info Handeln
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_HANDELN(C_INFO)
{
	npc				= VLK_4108_Engor;
	nr				= 10;
	condition		= DIA_Engor_HANDELN_Condition;
	information		= DIA_Engor_HANDELN_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "让 我 看 看 你 的 货 物";
};

func int DIA_Engor_HANDELN_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Engor_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Engor_HANDELN_Info()
{
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

	AI_Output(other, self, "DIA_Engor_HANDELN_15_00"); //让 我 看 看 你 的 货 物。
};

///////////////////////////////////////////////////////////////////////
//	Info ABOUTPARLAF
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_ABOUTPARLAF(C_INFO)
{
	npc				= VLK_4108_Engor;
	nr				= 2;
	condition		= DIA_Engor_ABOUTPARLAF_Condition;
	information		= DIA_Engor_ABOUTPARLAF_Info;
	description		= "你 是 那 个 负 责 分 配 定 额 的 人 ， 我 是 这 么 听 说 的 。";
};

func int DIA_Engor_ABOUTPARLAF_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Parlaf_ENGOR))
	{
		return TRUE;
	};
};

func void DIA_Engor_ABOUTPARLAF_Info()
{
	AI_Output(other, self, "DIA_Engor_ABOUTPARLAF_15_00"); //你 是 那 个 负 责 分 配 定 额 的 人 ， 我 是 这 么 听 说 的 。
	AI_Output(self, other, "DIA_Engor_ABOUTPARLAF_13_01"); //这 就 对 了 。 为 什 么 ？ 我 现 在 也 应 该 让 你 吃 饱 ？
	AI_Output(self, other, "DIA_Engor_ABOUTPARLAF_13_02"); //如 果 你 想 要 什 么 东 西 ， 你 就 得 付 钱 - 就 象 其 它 任 何 人 一 样 。
};

///////////////////////////////////////////////////////////////////////
//	Info Ruestung
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_Ruestung(C_INFO)
{
	npc				= VLK_4108_Engor;
	nr				= 2;
	condition		= DIA_Engor_Ruestung_Condition;
	information		= DIA_Engor_Ruestung_Info;
	description		= "你 有 什 么 能 让 我 感 兴 趣 的 东 西 吗 ？";
};

func int DIA_Engor_Ruestung_Condition()
{
	if (other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void DIA_Engor_Ruestung_Info()
{
	AI_Output(other, self, "DIA_Engor_Ruestung_15_00"); //你 有 什 么 能 让 我 感 兴 趣 的 东 西 吗 ？
	AI_Output(self, other, "DIA_Engor_Ruestung_13_01"); //我 可 以 给 你 更 好 的 盔 甲 - 重 型 民 兵 盔 甲 ， 如 果 你 感 兴 趣 的 话 。
	AI_Output(self, other, "DIA_Engor_Ruestung_13_02"); //当 然 ， 它 不 便 宜 。 那 么 去 拿 钱 来 ， 然 后 ， 我 就 给 你 盔 甲 。
};

///////////////////////////////////////////////////////////////////////
//	Info RSkaufen
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_RSkaufen(C_INFO)
{
	npc				= VLK_4108_Engor;
	nr				= 2;
	condition		= DIA_Engor_RSkaufen_Condition;
	information		= DIA_Engor_RSkaufen_Info;
	permanent		= TRUE;
	description		= "购 买 重 型 民 兵 盔 甲 （ 防 护 ： 武 器 ６ ０ ， 箭 ６ ０ 。 价 格 ： ２ ５ ０ ０ 金 币 ）";
};

// --------------------------------------
var int DIA_Engor_RSkaufen_perm;
// --------------------------------------
func int DIA_Engor_RSkaufen_Condition()
{
	if ((other.guild == GIL_MIL)
	&& Npc_KnowsInfo(other, DIA_Engor_Ruestung)
	&& (DIA_Engor_RSkaufen_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Engor_RSkaufen_Info()
{
	if (B_GiveInvItems(other, self, Itmi_Gold, 2500))
	{
		AI_Output(other, self, "DIA_Engor_RSkaufen_15_00"); //给 我 那 个 盔 甲 。
		AI_Output(self, other, "DIA_Engor_RSkaufen_13_01"); //给 你 吧 ， 它 会 很 好 地 保 护 你 - 它 是 一 件 非 常 不 错 的 作 品 。
		B_GiveInvItems(self, other, ITAR_MIL_M, 1);
		DIA_Engor_RSkaufen_perm = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Engor_RSkaufen_13_02"); //先 把 金 子 拿 来 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info HELP
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_HELP(C_INFO)
{
	npc				= VLK_4108_Engor;
	nr				= 3;
	condition		= DIA_Engor_HELP_Condition;
	information		= DIA_Engor_HELP_Info;
	description		= "也 许 我 可 以 帮 你 工 作 。";
};

func int DIA_Engor_HELP_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Engor_ABOUTPARLAF))
	{
		return TRUE;
	};
};

func void DIA_Engor_HELP_Info()
{
	AI_Output(other, self, "DIA_Engor_HELP_15_00"); //也 许 我 可 以 帮 你 工 作 。
	AI_Output(self, other, "DIA_Engor_HELP_13_01"); //嗯 … … 当 然 ， 为 什 么 不 呢 ？ 我 需 要 一 些 帮 助 。
	AI_Output(other, self, "DIA_Engor_HELP_15_02"); //那 么 ， 需 要 干 些 什 么 事 ？
	AI_Output(self, other, "DIA_Engor_HELP_13_03"); //我 们 的 食 物 供 应 很 少 。 最 重 要 的 是 ， 我 们 几 乎 没 有 肉 吃 了 。
	AI_Output(self, other, "DIA_Engor_HELP_13_04"); //所 以 ， 如 果 你 能 给 我 们 找 一 些 肉 ， 生 的 或 者 熟 的 、 火 腿 或 者 香 肠 ， 那 会 是 最 让 人 感 激 的 事 。 怎 么 样 ， 你 会 帮 我 们 吗 ？

	Info_ClearChoices(DIA_Engor_HELP);
	Info_AddChoice(DIA_Engor_HELP, "我 没 时 间 做 那 些", DIA_Engor_HELP_NO);
	Info_AddChoice(DIA_Engor_HELP, "不 要 担 心 。 我 会 给 你 找 一 些 肉", DIA_Engor_HELP_YES);
};

func void DIA_Engor_HELP_NO()
{
	AI_Output(other, self, "DIA_Engor_HELP_NO_15_00"); //我 没 时 间 。
	AI_Output(self, other, "DIA_Engor_HELP_NO_13_01"); //那 么 ， 你 为 什 么 要 在 这 里 浪 费 我 的 时 间 ？

	MIS_Engor_BringMeat = LOG_OBSOLETE;
	AI_StopProcessInfos(self);
};

func void DIA_Engor_HELP_YES()
{
	AI_Output(other, self, "DIA_Engor_HELP_YES_15_00"); //不 要 担 心 。 我 会 给 你 找 一 些 肉 。
	AI_Output(self, other, "DIA_Engor_HELP_YES_13_01"); //两 打 （ 2 4 ） 大 块 的 肉 应 该 能 帮 我 喂 饱 很 多 饥 饿 的 嘴 了 。 等 你 有 了 足 够 的 肉 就 回 来 吧 。 我 现 在 必 须 回 去 工 作 了 。

	Log_CreateTopic(TOPIC_BringMeat, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BringMeat, LOG_RUNNING);
	B_LogEntry(TOPIC_BringMeat, TOPIC_BringMeat_1);
	Log_AddEntry(TOPIC_BringMeat, TOPIC_BringMeat_2);

	MIS_Engor_BringMeat = LOG_RUNNING;
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BRINGMEAT
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_BRINGMEAT(C_INFO)
{
	npc				= VLK_4108_Engor;
	nr				= 4;
	condition		= DIA_Engor_BRINGMEAT_Condition;
	information		= DIA_Engor_BRINGMEAT_Info;
	permanent		= TRUE;
	description		= "给 ， 我 给 你 带 来 一 些 东 西 （ 给 他 肉 ）";
};

func int DIA_Engor_BRINGMEAT_Condition()
{
	if ((MIS_Engor_BringMeat == LOG_RUNNING)
	&& (Meat_Counter < Meat_Amount)
	&& ((Npc_HasItems(hero, ItFo_Bacon) >= 1)
	|| (Npc_HasItems(hero, ItFoMuttonRaw) >= 1)
	|| (Npc_HasItems(hero, ItFoMutton) >= 1)
	|| (Npc_HasItems(hero, ItFo_Sausage) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Engor_BRINGMEAT_Info()
{
	var string ConcatRaw;
	var string ConcatMutton;
	var string ConcatBacon;
	var string ConcatSausage;

	AI_Output(other, self, "DIA_Engor_BRINGMEAT_15_00"); //给 ， 我 给 你 带 来 了 一 些 东 西 。

// ***** Rohes Fleisch *****
	if (Npc_HasItems(hero, ItFoMuttonRaw) >= 1)
	{
		if ((Npc_HasItems(hero, ItFoMuttonRaw) >= Meat_Amount)
		&& (Meat_Counter < Meat_Amount))
		{
			B_GiveInvItems(hero, self, ItFoMuttonRaw,(Meat_Amount - Meat_Counter));

			Meat_Counter = (Meat_Counter + (Meat_Amount - Meat_Counter));
		}
		else if ((Npc_HasItems(hero, ItFoMuttonRaw) < Meat_Amount) // muss hier stehen, wegen nächster Zeile
		&& (Meat_Counter < Meat_Amount))
		{
			Meat_Counter = Meat_Counter + (Npc_HasItems(hero, ItFoMuttonRaw));

			// B_GiveInvItems (hero, self,ItFoMuttonRaw, (Npc_HasItems(hero,ItFoMuttonRaw)));

			ConcatRaw = IntToString(Npc_HasItems(other, ItFoMuttonRaw));
			ConcatRaw = ConcatStrings(ConcatRaw, PRINT_GIVE_RAW_MEAT);

			AI_PrintScreen(ConcatRaw, -1, 35, FONT_ScreenSmall, 2);
			Npc_RemoveInvItems(other, ItFoMuttonRaw, (Npc_HasItems(other, ItFoMuttonRaw)));
		};
	};

// ***** gebratenes Fleisch *****
	if (Npc_HasItems(hero, ItFoMutton) >= 1)
	{
		if ((Npc_HasItems(hero, ItFoMutton) >= Meat_Amount)
		&& (Meat_Counter < Meat_Amount))
		{
			B_GiveInvItems(hero, self, ItFoMutton,(Meat_Amount - Meat_Counter));
			Meat_Counter = (Meat_Counter + (Meat_Amount - Meat_Counter));
		}
		else if ((Npc_HasItems(hero, ItFoMutton) < Meat_Amount)
		&& (Meat_Counter < Meat_Amount))
		{
			Meat_Counter = Meat_Counter + (Npc_HasItems(hero, ItFoMutton));

			// B_GiveInvItems (hero, self,ItFoMutton, (Npc_HasItems(hero,ItFoMutton)));

			ConcatMutton = IntToString(Npc_HasItems(other, ItFoMutton));
			ConcatMutton = ConcatStrings(ConcatMutton, PRINT_GIVE_COOKED_MEAT);

			AI_PrintScreen(ConcatMutton, -1, 38, FONT_ScreenSmall, 2);
			Npc_RemoveInvItems(other, ItFoMutton, (Npc_HasItems(other, ItFoMutton)));
		};
	};

// ***** Schinken *****
	if (Npc_HasItems(hero, ItFo_Bacon) >= 1)
	{
		if ((Npc_HasItems(hero, ItFo_Bacon) >= Meat_Amount)
		&& (Meat_Counter < Meat_Amount))
		{
			B_GiveInvItems(hero, self, ItFo_Bacon,(Meat_Amount - Meat_Counter));
			Meat_Counter = (Meat_Counter + (Meat_Amount - Meat_Counter));
		}
		else if ((Npc_HasItems(hero, ItFo_Bacon) < Meat_Amount)
		&& (Meat_Counter < Meat_Amount))
		{
			Meat_Counter = Meat_Counter + (Npc_HasItems(hero, ItFo_Bacon));

			// B_GiveInvItems (hero, self,ItFo_Bacon, (Npc_HasItems(hero,ItFo_Bacon)));

			ConcatBacon = IntToString(Npc_HasItems(other, ItFo_Bacon));
			ConcatBacon = ConcatStrings(ConcatBacon, PRINT_GIVE_HAM);

			AI_PrintScreen(ConcatBacon, -1, 41, FONT_ScreenSmall, 3);

			Npc_RemoveInvItems(other, ItFo_Bacon, (Npc_HasItems(other, ItFo_Bacon)));
		};
	};

	// ***** Würste *****
	if (Npc_HasItems(hero, ItFo_Sausage) >= 1)
	{
		if ((Npc_HasItems(hero, ItFo_Sausage) >= Meat_Amount)
		&& (Meat_Counter < Meat_Amount))
		{
			B_GiveInvItems(hero, self, ItFo_Sausage,(Meat_Amount - Meat_Counter));
			Meat_Counter = (Meat_Counter + (Meat_Amount - Meat_Counter));
		}
		else if ((Npc_HasItems(hero, ItFo_Sausage) < Meat_Amount)
		&& (Meat_Counter < Meat_Amount))
		{
			Meat_Counter = Meat_Counter + (Npc_HasItems(hero, ItFo_Sausage));

			// B_GiveInvItems (hero, self,ItFo_Sausage, (Npc_HasItems(hero,ItFo_Sausage)));

			ConcatSausage = IntToString(Npc_HasItems(other, ItFo_Sausage));
			ConcatSausage = ConcatStrings(ConcatSausage, PRINT_GIVE_SAUSAGE);

			AI_PrintScreen(ConcatSausage, -1, 44, FONT_ScreenSmall, 3);
			Npc_RemoveInvItems(other, ItFo_Sausage, (Npc_HasItems(other, ItFo_Sausage)));
		};
	};

	// ***** Dialoge und XP *****
	if (Meat_Amount > Meat_Counter)
	{
		var string GesamtFleisch;

		AI_Output(self, other, "DIA_Engor_BRINGMEAT_13_01"); //用 它 做 开 胃 菜 不 错 ， 但 是 ， 我 需 要 更 多 的 。

		GesamtFleisch = IntToString(Meat_Counter);
		GesamtFleisch = ConcatStrings(PRINT_GIVE_TOTAL_MEAT, GesamtFleisch);

		AI_PrintScreen(GesamtFleisch, -1, 48, FONT_ScreenSmall, 3);
	};

	if (Meat_counter >= Meat_Amount)
	{
		AI_Output(self, other, "DIA_Engor_BRINGMEAT_13_02"); //好 极 了 ， 你 带 来 了 足 够 的 肉 。 那 可 以 应 付 一 阵 子 了 。
		AI_Output(self, other, "DIA_Engor_BRINGMEAT_13_03"); //但 是 ， 千 万 别 以 为 我 现 在 会 免 费 给 你 什 么 东 西 ！
		/*
		AI_Output(self, other, "DIA_Engor_BRINGMEAT_13_04"); //Hm...
		AI_Output(self, other, "DIA_Engor_BRINGMEAT_13_05"); //Na schön. Du hast mir geholfen, du kriegst was umsonst. Ich gebe dir eine Information.
		*/
		MIS_Engor_BringMeat = LOG_SUCCESS;
		B_GivePlayerXP(XP_BringMeat);
		B_LogEntry(TOPIC_BringMeat, TOPIC_BringMeat_3);
	};
};

//*************************************
//*************************************
//*** ***
//*** Kapitel 4 ***
//*** ***
//*************************************
//*************************************

///////////////////////////////////////////////////////////////////////
//	Wie laufen die Geschäfte?
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_Business(C_INFO)
{
	npc				= VLK_4108_Engor;
	nr				= 1;
	condition		= DIA_Engor_Business_Condition;
	information		= DIA_Engor_Business_Info;
	description		= "最 近 生 意 好 吗 ？";
};

func int DIA_Engor_Business_Condition()
{
	if ((Kapitel >= 4)
	&& (MIS_Engor_BringMeat == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Engor_Business_Info()
{
	AI_Output(other, self, "DIA_Engor_Business_15_00"); //最 近 生 意 好 吗 ？

	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self, other, "DIA_Engor_Business_13_01"); //一 般 般 。 我 希 望 龙 猎 手 们 都 带 足 了 钱 ， 就 象 他 们 吹 嘘 的 那 样 。
	};

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Engor_Business_13_02"); //讨 厌 ！ 那 些 圣 骑 士 什 么 都 不 准 备 买 。
	};

	AI_Output(self, other, "DIA_Engor_Business_13_03"); //你 怎 么 样 ， 有 没 有 你 需 要 的 其 它 东 西 ？
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Engor_PICKPOCKET(C_INFO)
{
	npc				= VLK_4108_Engor;
	nr				= 900;
	condition		= DIA_Engor_PICKPOCKET_Condition;
	information		= DIA_Engor_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "（ 偷 他 的 地 图 比 较 冒 险 ）";
};

func int DIA_Engor_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItWr_Map_Oldworld) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (40 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Engor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Engor_PICKPOCKET);
	Info_AddChoice(DIA_Engor_PICKPOCKET, DIALOG_BACK, DIA_Engor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Engor_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Engor_PICKPOCKET_DoIt);
};

func void DIA_Engor_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 40)
	{
		B_GiveInvItems(self, other, ItWr_Map_Oldworld, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Engor_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Engor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Engor_PICKPOCKET);
};
