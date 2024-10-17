// ***********************************************************
// 							EXIT
// ***********************************************************
instance DIA_Niclas_EXIT(C_INFO)
{
	npc				= BAU_984_Niclas;
	nr				= 999;
	condition		= DIA_Niclas_EXIT_Condition;
	information		= DIA_Niclas_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Niclas_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Niclas_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ***********************************************************
// 							Hello
// ***********************************************************
instance DIA_Niclas_Hello(C_INFO)
{
	npc				= BAU_984_Niclas;
	nr				= 1;
	condition		= DIA_Niclas_Hello_Condition;
	information		= DIA_Niclas_Hello_Info;
	important		= TRUE;
};

func int DIA_Niclas_Hello_Condition()
{
	return TRUE;
};

func void DIA_Niclas_Hello_Info()
{
	AI_Output(self, other, "DIA_Niclas_Hello_03_00"); //你 也 逃 走 了 吗 ？
	AI_Output(other, self, "DIA_Niclas_Hello_15_01"); //你 为 什 么 会 那 么 想 ？
	AI_Output(self, other, "DIA_Niclas_Hello_03_02"); //你 为 什 么 要 独 自 一 人 来 这 里 ？ 这 里 什 么 也 没 有 。
};

// ***********************************************************
// 							Ich wollte mich nur mal umsehen.
// ***********************************************************
instance DIA_Niclas_HaveALook(C_INFO)
{
	npc				= BAU_984_Niclas;
	nr				= 1;
	condition		= DIA_Niclas_HaveALook_Condition;
	information		= DIA_Niclas_HaveALook_Info;
	description		= "我 只 想 四 处 看 看 。";
};

func int DIA_Niclas_HaveALook_Condition()
{
	return TRUE;
};

func void DIA_Niclas_HaveALook_Info()
{
	AI_Output(other, self, "DIA_Niclas_HaveALook_15_00"); //我 只 想 四 处 看 看 。
	AI_Output(self, other, "DIA_Niclas_HaveALook_03_01"); //好 吧 ， 做 我 的 客 人 。 你 想 要 一 片 肉 吗 ？

	CreateInvItems(self, ItFoMutton, 1);

	Info_ClearChoices(DIA_Niclas_HaveALook);
	Info_AddChoice(DIA_Niclas_HaveALook, "不 ， 谢 谢 你 。", DIA_Niclas_HaveALook_No);
	Info_AddChoice(DIA_Niclas_HaveALook, "是 的 ， 很 乐 意 。", DIA_Niclas_HaveALook_Yes);
};

func void DIA_Niclas_HaveALook_No()
{
	AI_Output(other, self, "DIA_Niclas_HaveALook_No_15_00"); //不 ， 谢 谢 你 。
	AI_Output(self, other, "DIA_Niclas_HaveALook_No_03_01"); //你 请 随 便 吧 。 希 望 我 吃 东 西 不 会 干 扰 你 。

	B_UseItem(self, ItFoMutton);

	Info_ClearChoices(DIA_Niclas_HaveALook);
};

func void DIA_Niclas_HaveALook_Yes()
{
	AI_Output(other, self, "DIA_Niclas_HaveALook_Yes_15_00"); //是 的 ， 很 乐 意 。
	AI_Output(self, other, "DIA_Niclas_HaveALook_Yes_03_01"); //给 ， 鼹 鼠 腿 上 最 好 的 肉 。 按 照 我 自 己 的 配 方 制 作 。

	B_GiveInvItems(self, other, ItFOMutton, 1);

	Info_ClearChoices(DIA_Niclas_HaveALook);
};

// ***********************************************************
// 					Wieso bist du denn hier?
// ***********************************************************
instance DIA_Niclas_WhyHere(C_INFO)
{
	npc				= BAU_984_Niclas;
	nr				= 2;
	condition		= DIA_Niclas_WhyHere_Condition;
	information		= DIA_Niclas_WhyHere_Info;
	description		= "那 么 你 为 什 么 在 这 里 ？";
};

func int DIA_Niclas_WhyHere_Condition()
{
	return TRUE;
};

func void DIA_Niclas_WhyHere_Info()
{
	AI_Output(other, self, "DIA_Niclas_WhyHere_15_00"); //那 么 你 为 什 么 在 这 里 ？
	AI_Output(self, other, "DIA_Niclas_WhyHere_03_01"); //我 在 这 里 能 得 到 一 点 安 宁 。 我 总 是 觉 得 城 市 里 太 拘 束 了 。
};

// ***********************************************************
// 			Musst du nicht arbeiten?
// ***********************************************************
instance DIA_Niclas_ShouldntWork(C_INFO)
{
	npc				= BAU_984_Niclas;
	nr				= 2;
	condition		= DIA_Niclas_ShouldntWork_Condition;
	information		= DIA_Niclas_ShouldntWork_Info;
	description		= "你 没 有 工 作 吗 ？";
};

func int DIA_Niclas_ShouldntWork_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Niclas_WhyHere))
	{
		return TRUE;
	};
};

func void DIA_Niclas_ShouldntWork_Info()
{
	AI_Output(other, self, "DIA_Niclas_ShouldntWork_15_00"); //你 没 有 工 作 吗 ？
	AI_Output(self, other, "DIA_Niclas_ShouldntWork_03_01"); //我 需 要 的 一 切 ， 都 能 自 己 弄 到 。 我 自 己 制 箭 ， 而 大 自 然 提 供 食 物 。
	AI_Output(other, self, "DIA_Niclas_ShouldntWork_15_02"); //那 么 说 你 是 一 名 猎 人 。
	AI_Output(self, other, "DIA_Niclas_ShouldntWork_03_03"); //是 的 ， 如 果 你 想 那 么 说 的 话 。 但 是 我 只 捕 猎 我 必 需 的 ， 而 不 是 为 了 赚 钱 。
};

// ***********************************************************
// 			Dann kannst du mir bestimmt was beibringen.
// ***********************************************************
instance DIA_Niclas_CanTeachMe(C_INFO)
{
	npc				= BAU_984_Niclas;
	nr				= 2;
	condition		= DIA_Niclas_CanTeachMe_Condition;
	information		= DIA_Niclas_CanTeachMe_Info;
	description		= "如 果 是 那 样 的 话 ， 我 肯 定 你 能 教 我 些 什 么 。";
};

func int DIA_Niclas_CanTeachMe_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Niclas_ShouldntWork))
	{
		return TRUE;
	};
};

func void DIA_Niclas_CanTeachMe_Info()
{
	AI_Output(other, self, "DIA_Niclas_CanTeachMe_15_00"); //如 果 是 那 样 的 话 ， 我 肯 定 你 能 教 我 些 什 么 。
	AI_Output(self, other, "DIA_Niclas_CanTeachMe_03_01"); //为 什 么 不 。 我 可 以 教 你 如 何 使 用 弓 。

	Log_CreateTopic(TOPIC_Teacher, LOG_NOTE);
	B_LogEntry(TOPIC_Teacher, TOPIC_Teacher_2);
};

// ***********************************************************
// 			Zeig mir den Umgang mit dem Bogen.
// ***********************************************************
instance DIA_Niclas_Teach(C_INFO)
{
	npc				= BAU_984_Niclas;
	nr				= 2;
	condition		= DIA_Niclas_Teach_Condition;
	information		= DIA_Niclas_Teach_Info;
	permanent		= TRUE;
	description		= "教 我 如 何 使 用 弓。";
};

func int DIA_Niclas_Teach_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Niclas_CanTeachMe))
	{
		return TRUE;
	};
};

func void DIA_Niclas_Teach_Info()
{
	AI_Output(other, self, "DIA_Niclas_Teach_15_00"); //教 我 如 何 使 用 弓。

	if (other.HitChance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self, other, "DIA_Niclas_Teach_03_01"); //我 已 经 把 我 会 的 都 教 给 你 了 。 你 可 以 去 找 另 外 的 老 师 了 。
	}
	else
	{
		Info_ClearChoices(DIA_Niclas_Teach);
		Info_AddChoice(DIA_Niclas_Teach, DIALOG_BACK, DIA_Niclas_Teach_Back);
		Info_AddChoice(DIA_Niclas_Teach, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)), DIA_Niclas_Teach_BOW_1);
		Info_AddChoice(DIA_Niclas_Teach, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1) * 5), DIA_Niclas_Teach_BOW_5);
	};
};

func void DIA_Niclas_Teach_Back()
{
	if (other.HitChance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self, other, "DIA_Niclas_Teach_03_00"); //我 无 法 再 教 你 任 何 窍 门 了 。
	};

	Info_ClearChoices(DIA_Niclas_Teach);
};

func void DIA_Niclas_Teach_BOW_1()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_BOW, 1, 60);

	Info_ClearChoices(DIA_Niclas_Teach);
	Info_AddChoice(DIA_Niclas_Teach, DIALOG_BACK, DIA_Niclas_Teach_Back);
	Info_AddChoice(DIA_Niclas_Teach, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)), DIA_Niclas_Teach_BOW_1);
	Info_AddChoice(DIA_Niclas_Teach, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1) * 5), DIA_Niclas_Teach_BOW_5);
};

func void DIA_Niclas_Teach_BOW_5()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_BOW, 5, 60);

	Info_ClearChoices(DIA_Niclas_Teach);
	Info_AddChoice(DIA_Niclas_Teach, DIALOG_BACK, DIA_Niclas_Teach_Back);
	Info_AddChoice(DIA_Niclas_Teach, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)), DIA_Niclas_Teach_BOW_1);
	Info_AddChoice(DIA_Niclas_Teach, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1) * 5), DIA_Niclas_Teach_BOW_5);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Niclas_PICKPOCKET(C_INFO)
{
	npc				= BAU_984_Niclas;
	nr				= 900;
	condition		= DIA_Niclas_PICKPOCKET_Condition;
	information		= DIA_Niclas_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Niclas_PICKPOCKET_Condition()
{
	C_Beklauen(27, 20);
};

func void DIA_Niclas_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Niclas_PICKPOCKET);
	Info_AddChoice(DIA_Niclas_PICKPOCKET, DIALOG_BACK, DIA_Niclas_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Niclas_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Niclas_PICKPOCKET_DoIt);
};

func void DIA_Niclas_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Niclas_PICKPOCKET);
};

func void DIA_Niclas_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Niclas_PICKPOCKET);
};
