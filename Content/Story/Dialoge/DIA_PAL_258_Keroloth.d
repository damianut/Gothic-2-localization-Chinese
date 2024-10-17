// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Keroloth_EXIT(C_INFO)
{
	npc				= PAL_258_Keroloth;
	nr				= 999;
	condition		= DIA_Keroloth_EXIT_Condition;
	information		= DIA_Keroloth_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Keroloth_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Keroloth_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//**************************************************************
//	Ansprechen
//**************************************************************
instance DIA_Keroloth_HELLO(C_INFO)
{
	npc				= PAL_258_Keroloth;
	nr				= 2;
	condition		= DIA_Keroloth_HELLO_Condition;
	information		= DIA_Keroloth_HELLO_Info;
	important		= TRUE;
};

func int DIA_Keroloth_HELLO_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Keroloth_HELLO_Info()
{
	AI_Output(other, self, "DIA_Keroloth_HELLO_15_00"); //你 当 教 练 ？
	AI_Output(self, other, "DIA_Keroloth_HELLO_07_01"); //是 的 。 一 旦 那 些 兽 人 - 或 者 更 糟 糕 ， 那 些 龙 又 来 袭 击 的 话 ， 任 何 一 个 人 手 都 能 用 上 。
};

//***********************************************
//	Kannst DU mir was beibringen
//***********************************************
instance DIA_Keroloth_WantTeach(C_INFO)
{
	npc				= PAL_258_Keroloth;
	nr				= 3;
	condition		= DIA_Keroloth_WantTeach_Condition;
	information		= DIA_Keroloth_WantTeach_Info;
	description		= "你 也 能 训 练 我 吗 ？";
};

func int DIA_Keroloth_WantTeach_Condition()
{
	if (Keroloths_BeutelLeer == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Keroloth_WantTeach_Info()
{
	AI_Output(other, self, "DIA_Keroloth_WantTeach_15_00"); //你 也 能 训 练 我 吗 ？
	AI_Output(self, other, "DIA_Keroloth_WantTeach_07_01"); //当 然 。 我 会 训 练 所 有 好 人 。
	AI_Output(self, other, "DIA_Keroloth_WantTeach_07_02"); //但 是 ， 要 想 在 这 里 生 存 下 去 ， 除 了 才 干 ， 你 还 需 要 一 把 好 武 器 。
	AI_Output(self, other, "DIA_Keroloth_WantTeach_07_03"); //去 问 问 骑 士 坦 多 。 他 会 照 顾 你 的 。

	Keroloth_TeachPlayer = TRUE;
	Log_CreateTopic(TOPIC_Teacher_OC, LOG_NOTE);
	B_LogEntry(TOPIC_Teacher_OC, TOPIC_Teacher_OC_4);

	Log_CreateTopic(TOPIC_Trader_OC, LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC, TOPIC_Trader_OC_5);
};

//***********************************************
//	Kampflehrer EINHAND
//***********************************************
instance DIA_Keroloth_Teacher(C_INFO)
{
	npc				= PAL_258_Keroloth;
	nr				= 6;
	condition		= DIA_Keroloth_Teacher_Condition;
	information		= DIA_Keroloth_Teacher_Info;
	permanent		= TRUE;
	description		= "（ 学 习 单 手 战 斗 ）";
};

func int DIA_Keroloth_Teacher_Condition()
{
	if ((Keroloth_TeachPlayer == TRUE)
	&& (Keroloths_BeutelLeer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Keroloth_Teacher_Info()
{
	AI_Output(other, self, "DIA_Keroloth_Teacher_15_00"); //我 想 训 练 ！

	Info_ClearChoices(DIA_Keroloth_Teacher);
	Info_AddChoice(DIA_Keroloth_Teacher, DIALOG_BACK, DIA_Keroloth_Teacher_Back);
	Info_AddChoice(DIA_Keroloth_Teacher, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Keroloth_Teacher_1H_1);
	Info_AddChoice(DIA_Keroloth_Teacher, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Keroloth_Teacher_1H_5);
};

func void DIA_Keroloth_Teacher_Back()
{
	Info_ClearChoices(DIA_Keroloth_Teacher);
};

func void B_Keroloth_TeachNoMore1()
{
	AI_Output(self, other, "B_Keroloth_TeachNoMore1_07_00"); //你 非 常 好 。 我 已 经 没 有 别 的 可 以 教 你 了 。
};

func void B_Keroloth_TeachNoMore2()
{
	AI_Output(self, other, "B_Keroloth_TeachNoMore2_07_00"); //现 在 ， 只 有 训 练 有 素 的 剑 术 大 师 可 以 帮 助 你 了 。
};

func void DIA_Keroloth_Teacher_1H_1()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_1H, 1, 60);

	if (other.HitChance[NPC_TALENT_1H] >= 60)
	{
		B_Keroloth_TeachNoMore1();

		if (Npc_GetTalentSkill(other, NPC_TALENT_1H) == 2)
		{
			B_Keroloth_TeachNoMore2();
		};
	};

	Info_AddChoice(DIA_Keroloth_Teacher, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Keroloth_Teacher_1H_1);
};

func void DIA_Keroloth_Teacher_1H_5()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_1H, 5, 60);

	if (other.HitChance[NPC_TALENT_1H] >= 60)
	{
		B_Keroloth_TeachNoMore1();

		if (Npc_GetTalentSkill(other, NPC_TALENT_1H) == 2)
		{
			B_Keroloth_TeachNoMore2();
		};
	};

	Info_AddChoice(DIA_Keroloth_Teacher, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Keroloth_Teacher_1H_5);
};

//**************************************
//		Kampflehrer ZWEIHAND
//**************************************
instance DIA_Keroloth_Teach(C_INFO)
{
	npc				= PAL_258_Keroloth;
	nr				= 100;
	condition		= DIA_Keroloth_Teach_Condition;
	information		= DIA_Keroloth_Teach_Info;
	permanent		= TRUE;
	description		= "（ 学 习 双 手 战 斗 ）";
};

// ----------------------------------
var int DIA_Keroloth_Teach_permanent;
// ----------------------------------
func int DIA_Keroloth_Teach_Condition()
{
	if ((Keroloth_TeachPlayer == TRUE)
	&& (Keroloths_BeutelLeer == FALSE)
	&& (DIA_Keroloth_Teach_permanent == FALSE)
	&& (other.HitChance[NPC_TALENT_2H] < 60))
	{
		return TRUE;
	};
};

func void DIA_Keroloth_Teach_Info()
{
	AI_Output(other, self, "DIA_Keroloth_Teach_15_00"); //我 们 开 始 吧 。

	Info_ClearChoices(DIA_Keroloth_Teach);
	Info_AddChoice(DIA_Keroloth_Teach, DIALOG_BACK, DIA_Keroloth_Teach_Back);
	Info_AddChoice(DIA_Keroloth_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Keroloth_Teach_2H_1);
	Info_AddChoice(DIA_Keroloth_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Keroloth_Teach_2H_5);
};

func void DIA_Keroloth_Teach_Back()
{
	if (other.HitChance[NPC_TALENT_2H] >= 60)
	{
		B_Keroloth_TeachNoMore1();

		DIA_Keroloth_Teach_permanent = TRUE;
	};

	Info_ClearChoices(DIA_Keroloth_Teach);
};

func void DIA_Keroloth_Teach_2H_1()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_2H, 1, 60);

	Info_ClearChoices(DIA_Keroloth_Teach);
	Info_AddChoice(DIA_Keroloth_Teach, DIALOG_BACK, DIA_Keroloth_Teach_Back);
	Info_AddChoice(DIA_Keroloth_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Keroloth_Teach_2H_1);
	Info_AddChoice(DIA_Keroloth_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Keroloth_Teach_2H_5);
};

func void DIA_Keroloth_Teach_2H_5()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_2H, 5, 60);

	Info_ClearChoices(DIA_Keroloth_Teach);
	Info_AddChoice(DIA_Keroloth_Teach, DIALOG_BACK, DIA_Keroloth_Teach_Back);
	Info_AddChoice(DIA_Keroloth_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Keroloth_Teach_2H_1);
	Info_AddChoice(DIA_Keroloth_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Keroloth_Teach_2H_5);
};

//************************************
//	Suche andere Lehrer
//************************************
instance DIA_Keroloth_Udar(C_INFO)
{
	npc				= PAL_258_Keroloth;
	nr				= 4;
	condition		= DIA_Keroloth_Udar_Condition;
	information		= DIA_Keroloth_Udar_Info;
	description		= "那 么 远 程 战 斗 呢 ？";
};

func int DIA_Keroloth_Udar_Condition()
{
	if ((Keroloth_TeachPlayer == TRUE)
	&& (Keroloths_BeutelLeer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Keroloth_Udar_Info()
{
	AI_Output(other, self, "DIA_Keroloth_Udar_15_00"); //那 么 远 程 战 斗 呢 ？
	AI_Output(self, other, "DIA_Keroloth_Udar_07_01"); //它 怎 么 样 了 ？
	AI_Output(other, self, "DIA_Keroloth_Udar_15_02"); //你 也 能 教 我 那 些 吗 ？
	AI_Output(self, other, "DIA_Keroloth_Udar_07_03"); //不 ， 但 你 可 以 去 问 问 尤 达 ， 他 是 个 好 的..不 ， 他 是 我 所 知 道 的 最 好 的 弩 手 。

	Log_CreateTopic(TOPIC_Teacher_OC, LOG_NOTE);
	B_LogEntry(TOPIC_Teacher_OC, TOPIC_Teacher_OC_5);
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
instance DIA_Keroloth_KAP3_EXIT(C_INFO)
{
	npc				= PAL_258_Keroloth;
	nr				= 999;
	condition		= DIA_Keroloth_KAP3_EXIT_Condition;
	information		= DIA_Keroloth_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Keroloth_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Keroloth_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
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
instance DIA_Keroloth_KAP4_EXIT(C_INFO)
{
	npc				= PAL_258_Keroloth;
	nr				= 999;
	condition		= DIA_Keroloth_KAP4_EXIT_Condition;
	information		= DIA_Keroloth_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Keroloth_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Keroloth_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Kap4_Hello
///////////////////////////////////////////////////////////////////////
instance DIA_Keroloth_KAP4_HELLO(C_INFO)
{
	npc				= PAL_258_Keroloth;
	nr				= 40;
	condition		= DIA_Keroloth_KAP4_HELLO_Condition;
	information		= DIA_Keroloth_KAP4_HELLO_Info;
	description		= "你 看 起 来 脸 色 很 不 好 。";
};

func int DIA_Keroloth_KAP4_HELLO_Condition()
{
	if (Kapitel >= 4)
	{
		return TRUE;
	};
};

func void DIA_Keroloth_KAP4_HELLO_Info()
{
	AI_Output(other, self, "DIA_Keroloth_KAP4_HELLO_15_00"); //你 看 起 来 脸 色 很 不 好 。
	AI_Output(self, other, "DIA_Keroloth_KAP4_HELLO_07_01"); //（ 激 动 的 ） 该 死 的 。 我 告 诉 你 ， 你 必 须 象 鹰 一 样 戒 备 。
	AI_Output(self, other, "DIA_Keroloth_KAP4_HELLO_07_02"); //只 要 你 一 转 身 ， 你 所 有 的 东 西 就 没 了 。 该 死 的 垃 圾 ！

	Info_AddChoice(DIA_Keroloth_KAP4_HELLO, DIALOG_BACK, DIA_Keroloth_KAP4_HELLO_ende);
	Info_AddChoice(DIA_Keroloth_KAP4_HELLO, "圣 骑 士 不 应 该 那 样 失 态 。", DIA_Keroloth_KAP4_HELLO_ruhig);
	Info_AddChoice(DIA_Keroloth_KAP4_HELLO, "有 人 偷 了 你 的 东 西 ？", DIA_Keroloth_KAP4_HELLO_bestohlen);
	Info_AddChoice(DIA_Keroloth_KAP4_HELLO, "什 么 垃 圾 ？", DIA_Keroloth_KAP4_HELLO_pack);
};

func void DIA_Keroloth_KAP4_HELLO_ende()
{
	Info_ClearChoices(DIA_Keroloth_KAP4_HELLO);
};

func void DIA_Keroloth_KAP4_HELLO_bestohlen()
{
	AI_Output(other, self, "DIA_Keroloth_KAP4_HELLO_bestohlen_15_00"); //有 人 偷 了 你 的 东 西 ？
	AI_Output(self, other, "DIA_Keroloth_KAP4_HELLO_bestohlen_07_01"); //不 。 他 们 从 我 的 口 袋 里 偷 走 了 2 0 个 金 币 。 他 们 当 然 还 偷 了 一 些 东 西 ， 你 这 个 白 痴 ！
	AI_Output(self, other, "DIA_Keroloth_KAP4_HELLO_bestohlen_07_02"); //我 告 诉 你 ， 当 我 抓 住 这 只 肮 脏 的 猪 … …

	Info_AddChoice(DIA_Keroloth_KAP4_HELLO, "那 么 你 丢 了 什 么 ？", DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt);
};

func void DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt()
{
	AI_Output(other, self, "DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_15_00"); //那 么 你 丢 了 什 么 ？
	AI_Output(self, other, "DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_01"); //我 的 钱 包 ， 里 面 有 我 所 有 的 积 蓄 。
	AI_Output(self, other, "DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_02"); //现 在 它 不 见 了 ！
	AI_Output(other, self, "DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_15_03"); //它 会 在 某 个 地 方 出 现 的 。
	AI_Output(self, other, "DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_04"); //等 我 抓 住 他 的 时 候 … …

	Log_CreateTopic(TOPIC_KerolothsGeldbeutel, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KerolothsGeldbeutel, LOG_RUNNING);
	B_LogEntry(TOPIC_KerolothsGeldbeutel, TOPIC_KerolothsGeldbeutel_1);

	Info_ClearChoices(DIA_Keroloth_KAP4_HELLO);
};

func void DIA_Keroloth_KAP4_HELLO_pack()
{
	AI_Output(other, self, "DIA_Keroloth_KAP4_HELLO_pack_15_00"); //什 么 垃 圾 ？

	if (hero.guild == GIL_DJG)
	{
		AI_Output(self, other, "DIA_Keroloth_KAP4_HELLO_pack_07_01"); //当 然 是 你 们 这 些 卑 鄙 的 龙 猎 手 。 还 有 谁 ？
	}
	else
	{
		AI_Output(self, other, "DIA_Keroloth_KAP4_HELLO_pack_07_02"); //当 然 是 那 些 捕 龙 的 流 氓 。 你 觉 得 我 在 说 谁 ？
	};

	AI_Output(self, other, "DIA_Keroloth_KAP4_HELLO_pack_07_03"); //（ 自 言 自 语 ） 你 们 得 小 心 ， 我 告 诉 你 们 。
};

func void DIA_Keroloth_KAP4_HELLO_ruhig()
{
	AI_Output(other, self, "DIA_Keroloth_KAP4_HELLO_ruhig_15_00"); //冷 静 点 ！ 一 个 圣 骑 士 不 能 这 样 大 发 脾 气 。
	AI_Output(self, other, "DIA_Keroloth_KAP4_HELLO_ruhig_07_01"); //但 我 不 想 冷 静 。 那 是 我 拥 有 的 一 切 ， 该 死 ！
};

///////////////////////////////////////////////////////////////////////
//	Info GELDGEFUNDEN
///////////////////////////////////////////////////////////////////////
instance DIA_Keroloth_KAP4_GELDGEFUNDEN(C_INFO)
{
	npc				= PAL_258_Keroloth;
	nr				= 42;
	condition		= DIA_Keroloth_KAP4_GELDGEFUNDEN_Condition;
	information		= DIA_Keroloth_KAP4_GELDGEFUNDEN_Info;
	description		= "我 想 我 已 经 找 到 了 你 的 钱 包 。";
};

func int DIA_Keroloth_KAP4_GELDGEFUNDEN_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Keroloth_KAP4_HELLO))
	&& (
	(Npc_HasItems(other, ItMi_KerolothsGeldbeutel_MIS))
	|| (Npc_HasItems(other, ItMi_KerolothsGeldbeutelLeer_MIS))
	))
	{
		return TRUE;
	};
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_Info()
{
	AI_Output(other, self, "DIA_Keroloth_KAP4_GELDGEFUNDEN_15_00"); //我 想 我 已 经 找 到 了 你 的 钱 包 。
	TOPIC_END_KerolothsGeldbeutel = TRUE;
	B_GivePlayerXP(XP_KerolothsGeldbeutel);
	if (B_GiveInvItems(other, self, ItMi_KerolothsGeldbeutelLeer_MIS, 1))
	{
		AI_Output(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_07_01"); //钱 袋 空 了 。 哪 个 混 蛋 干 的 ？

		Keroloths_BeutelLeer = TRUE;
	};

	if (B_GiveInvItems(other, self, ItMi_KerolothsGeldbeutel_MIS, 1))
	{
		AI_Output(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_07_02"); //什 么 ？ 在 哪 儿 ？ 哪 个 混 蛋 干 的 ？
	};

	if (hero.guild == GIL_DJG)
	{
		Info_AddChoice(DIA_Keroloth_KAP4_GELDGEFUNDEN, "等 一 下 。 那 么 报 酬 呢 ？", DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn);
	};

	Info_AddChoice(DIA_Keroloth_KAP4_GELDGEFUNDEN, "它 在 那 边 ， 铁 匠 铺 旁 边 。", DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede);
	Info_AddChoice(DIA_Keroloth_KAP4_GELDGEFUNDEN, "我 怀 疑 一 个 龙 猎 手 。", DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG);
	Info_AddChoice(DIA_Keroloth_KAP4_GELDGEFUNDEN, "我 怎 么 知 道 。", DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung);
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung()
{
	AI_Output(other, self, "DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_15_00"); //我 怎 么 知 道 。

	if (hero.guild == GIL_DJG)
	{
		AI_Output(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_07_01"); //你 在 跟 我 开 玩 笑 吗 ？ 是 你 ， 承 认 吧 。

		Info_ClearChoices(DIA_Keroloth_KAP4_GELDGEFUNDEN);
		Info_AddChoice(DIA_Keroloth_KAP4_GELDGEFUNDEN, "我 怀 疑 一 个 龙 猎 手 。", DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG);
		Info_AddChoice(DIA_Keroloth_KAP4_GELDGEFUNDEN, "吻 我 的 屁 股 。", DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_kannstmich);
	}
	else
	{
		AI_Output(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_07_02"); //我 还 是 会 弄 清 楚 的 。
		AI_StopProcessInfos(self);
	};
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_kannstmich()
{
	AI_Output(other, self, "DIA_Keroloth_KAP4_kannstmich_15_00"); //吻 我 的 屁 股 。
	AI_Output(self, other, "DIA_Keroloth_KAP4_kannstmich_07_01"); //我 会 教 你 怎 么 从 像 样 的 家 伙 那 里 偷 窃 。

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG()
{
	AI_Output(other, self, "DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_15_00"); //我 怀 疑 一 个 龙 猎 手 。

	AI_Output(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_01"); //（ 愤 怒 的 ） 我 知 道 。

	if (hero.guild == GIL_DJG)
	{
		AI_Output(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_02"); //（ 怒 吼 ） 他 们 就 不 该 让 你 们 进 入 这 座 城 堡 。
	}
	else
	{
		AI_Output(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_03"); //等 着 吧 ， 我 会 狠 狠 地 教 训 那 些 猪 。
	};

	AI_StopProcessInfos(self);
	other.aivar[AIV_INVINCIBLE] = FALSE;

	if ((Npc_IsDead(Ferros) == FALSE)
	&& ((Npc_GetDistToNpc(self, Ferros)) <= 2000))
	{
		B_Attack(self, Ferros, AR_NONE, 1);
	}
	else if ((Npc_IsDead(Jan) == FALSE)
	&& ((Npc_GetDistToNpc(self, Jan)) <= 2000))
	{
		B_Attack(self, Jan, AR_NONE, 1);
	}
	else if ((Npc_IsDead(Rethon) == FALSE)
	&& ((Npc_GetDistToNpc(self, Rethon)) <= 2000))
	{
		B_Attack(self, Rethon, AR_NONE, 1);
	};
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede()
{
	AI_Output(other, self, "DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede_15_00"); //嗯 。 它 在 那 边 ， 铁 匠 铺 旁 边 。
	AI_Output(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede_07_01"); //哪 里 ？ 铁 匠 铺 附 近 ？ 它 一 定 是 从 哪 个 龙 猎 手 的 口 袋 里 掉 在 那 里 的 ， 别 跟 我 说 别 的 。
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn()
{
	AI_Output(other, self, "DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_15_00"); //等 一 下 。 报 酬 呢 ？

	if (Keroloths_BeutelLeer == TRUE)
	{
		AI_Output(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_07_01"); //真 是 让 人 忍 无 可 忍 了 。 你 的 嘴 上 好 久 没 吃 拳 头 了 ， 哼 ？
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_NONE, 1);
	}
	else
	{
		AI_Output(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_07_02"); //啊 。 好 吧 。 这 里 有 一 点 钱 。 马 上 告 诉 我 ， 是 谁 干 的 ？
		CreateInvItems(self, ItMi_Gold, 50);
		B_GiveInvItems(self, other, ItMi_Gold, 50);
		Keroloth_HasPayed = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info belohnung
///////////////////////////////////////////////////////////////////////
instance DIA_Keroloth_KAP4_BELOHNUNG(C_INFO)
{
	npc				= PAL_258_Keroloth;
	nr				= 43;
	condition		= DIA_Keroloth_KAP4_BELOHNUNG_Condition;
	information		= DIA_Keroloth_KAP4_BELOHNUNG_Info;
	permanent		= TRUE;
	description		= "我 想 要 帮 你 找 回 钱 包 的 奖 金 。";
};

func int DIA_Keroloth_KAP4_BELOHNUNG_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Keroloth_KAP4_GELDGEFUNDEN))
	&& (Keroloth_HasPayed == FALSE)
	&& (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Keroloth_KAP4_BELOHNUNG_Info()
{
	AI_Output(other, self, "DIA_Keroloth_KAP4_BELOHNUNG_15_00"); //我 想 要 帮 你 找 回 钱 包 的 奖 金 。

	if ((Keroloths_BeutelLeer == TRUE) || (hero.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Keroloth_KAP4_BELOHNUNG_07_01"); //你 的 下 巴 应 该 狠 狠 挨 一 拳 ！
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_NONE, 1);
	}
	else
	{
		AI_Output(self, other, "DIA_Keroloth_KAP4_BELOHNUNG_07_02"); //那 就 是 你 最 大 的 担 忧 吗 ？ 这 里 有 点 钱 ， 马 上 滚 。

		CreateInvItems(self, ItMi_Gold, 50);
		B_GiveInvItems(self, other, ItMi_Gold, 50);

		Keroloth_HasPayed = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info entspanndich
///////////////////////////////////////////////////////////////////////
instance DIA_Keroloth_KAP4_ENTSPANNDICH(C_INFO)
{
	npc				= PAL_258_Keroloth;
	nr				= 44;
	condition		= DIA_Keroloth_KAP4_ENTSPANNDICH_Condition;
	information		= DIA_Keroloth_KAP4_ENTSPANNDICH_Info;
	permanent		= TRUE;
	description		= "放 松 。";
};

func int DIA_Keroloth_KAP4_ENTSPANNDICH_Condition()
{
	if (((Npc_KnowsInfo(other, DIA_Keroloth_KAP4_GELDGEFUNDEN))
	&& (Kapitel >= 4))
	|| (MIS_OCGateOpen == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Keroloth_KAP4_ENTSPANNDICH_Info()
{
	AI_Output(other, self, "DIA_Keroloth_KAP4_ENTSPANNDICH_15_00"); //放 松 。

	if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Keroloth_KAP4_ENTSPANNDICH_07_01"); //好 的 ， 长 官 。 我 会 试 试 。
	}
	else if (MIS_OCGateOpen == TRUE)
	{
		AI_Output(self, other, "DIA_Keroloth_KAP4_ENTSPANNDICH_07_02"); //我 无 法 证 明 ， 但 我 知 道 你 就 是 那 个 打 开 大 门 的 叛 徒 。
		AI_Output(self, other, "DIA_Keroloth_KAP4_ENTSPANNDICH_07_03"); //你 马 上 就 要 为 此 付 出 代 价 。
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_NONE, 1);
	}
	else
	{
		AI_Output(other, self, "DIA_Keroloth_KAP4_ENTSPANNDICH_15_04"); //你 已 经 找 回 了 你 的 钱 袋 ， 对 吧 。
		AI_Output(self, other, "DIA_Keroloth_KAP4_ENTSPANNDICH_07_05"); //别 逼 我 ， 小 子 ！ 走 开 ！
		AI_StopProcessInfos(self);
	};
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
instance DIA_Keroloth_KAP5_EXIT(C_INFO)
{
	npc				= PAL_258_Keroloth;
	nr				= 999;
	condition		= DIA_Keroloth_KAP5_EXIT_Condition;
	information		= DIA_Keroloth_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Keroloth_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Keroloth_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 6
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************
instance DIA_Keroloth_KAP6_EXIT(C_INFO)
{
	npc				= PAL_258_Keroloth;
	nr				= 999;
	condition		= DIA_Keroloth_KAP6_EXIT_Condition;
	information		= DIA_Keroloth_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Keroloth_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Keroloth_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Keroloth_PICKPOCKET(C_INFO)
{
	npc				= PAL_258_Keroloth;
	nr				= 900;
	condition		= DIA_Keroloth_PICKPOCKET_Condition;
	information		= DIA_Keroloth_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Keroloth_PICKPOCKET_Condition()
{
	C_Beklauen(25, 45);
};

func void DIA_Keroloth_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Keroloth_PICKPOCKET);
	Info_AddChoice(DIA_Keroloth_PICKPOCKET, DIALOG_BACK, DIA_Keroloth_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Keroloth_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Keroloth_PICKPOCKET_DoIt);
};

func void DIA_Keroloth_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Keroloth_PICKPOCKET);
};

func void DIA_Keroloth_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Keroloth_PICKPOCKET);
};
