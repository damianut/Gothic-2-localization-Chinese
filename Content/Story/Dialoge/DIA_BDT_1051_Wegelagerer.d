//*********************************************************************
//	Info EXIT
//*********************************************************************
instance DIA_1051_Wegelagerer_EXIT(C_INFO)
{
	npc				= BDT_1051_Wegelagerer;
	nr				= 999;
	condition		= DIA_1051_Wegelagerer_EXIT_Condition;
	information		= DIA_1051_Wegelagerer_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

var int BDT_1051_Wegelagerer_Angriff;

func int DIA_1051_Wegelagerer_EXIT_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_1051_Wegelagerer_Question))
	|| (BDT_1051_Wegelagerer_Angriff == TRUE))
	{
		return TRUE;
	};
};

func void DIA_1051_Wegelagerer_EXIT_Info()
{
	AI_StopProcessInfos(self);

	if (BDT_1051_Wegelagerer_Angriff == TRUE)
	{
		self.aivar[AIV_EnemyOverride] = FALSE;
		BDT_1052_Wegelagerer.aivar[AIV_EnemyOverride] = FALSE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Was machst ihr hier?
///////////////////////////////////////////////////////////////////////
instance DIA_1051_Wegelagerer_Hello(C_INFO)
{
	npc				= BDT_1051_Wegelagerer;
	nr				= 4;
	condition		= DIA_Wegelagerer_Hello_Condition;
	information		= DIA_Wegelagerer_Hello_Info;
	description		= "你 在 这 里 干 什 么 ？";
};

func int DIA_Wegelagerer_Hello_Condition()
{
	if (BDT_1051_Wegelagerer_Angriff == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Wegelagerer_Hello_Info()
{
	AI_Output(other, self, "DIA_1051_Wegelagerer_Hello_15_00"); //你 在 这 里 干 什 么 ？
	AI_Output(self, other, "DIA_1051_Wegelagerer_Hello_07_01"); //对 你 来 说 是 什 么 ？
};

///////////////////////////////////////////////////////////////////////
//	Ich suche einen Novizen.
///////////////////////////////////////////////////////////////////////
instance DIA_1051_Wegelagerer_Novice(C_INFO)
{
	npc				= BDT_1051_Wegelagerer;
	nr				= 4;
	condition		= DIA_Wegelagerer_Novice_Condition;
	information		= DIA_Wegelagerer_Novice_Info;
	description		= "我 在 找 一 个 新 信 徒 。";
};

func int DIA_Wegelagerer_Novice_Condition()
{
	if ((MIS_Novizenchase == LOG_RUNNING)
	&& (MIS_SCKnowsInnosEyeIsBroken == FALSE)
	&& (BDT_1051_Wegelagerer_Angriff == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wegelagerer_Novice_Info()
{
	AI_Output(other, self, "DIA_1051_Wegelagerer_Novice_15_00"); //我 在 找 一 个 新 信 徒 。
	AI_Output(self, other, "DIA_1051_Wegelagerer_Novice_07_01"); //那 太 有 趣 了 。 我 们 也 在 找 某 个 人 。

	Info_ClearChoices(DIA_1051_Wegelagerer_Question);
	Info_AddChoice(DIA_1051_Wegelagerer_Novice, "你 在 找 谁 ？", DIA_1051_Wegelagerer_Question_Novice_Who);
};

///////////////////////////////////////////////////////////////////////
//	War nur ne Frage.
///////////////////////////////////////////////////////////////////////
instance DIA_1051_Wegelagerer_Question(C_INFO)
{
	npc				= BDT_1051_Wegelagerer;
	nr				= 4;
	condition		= DIA_Wegelagerer_Question_Condition;
	information		= DIA_Wegelagerer_Question_Info;
	description		= "只 是 问 问 。";
};

func int DIA_Wegelagerer_Question_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_1051_Wegelagerer_Hello))
	&& (BDT_1051_Wegelagerer_Angriff == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wegelagerer_Question_Info()
{
	AI_Output(other, self, "DIA_1051_Wegelagerer_Question_15_00"); //只 是 问 问 。
	AI_Output(self, other, "DIA_1051_Wegelagerer_Question_07_01"); //明 白 了 。 但 是 你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_1051_Wegelagerer_Question_07_02"); //无 论 如 何 ， 这 是 我 们 的 路 ， 我 们 很 不 喜 欢 有 人 在 这 里 骚 扰 我 们 。

	Info_ClearChoices(DIA_1051_Wegelagerer_Question);
	if ((MIS_Novizenchase == LOG_RUNNING)
	&& (MIS_SCKnowsInnosEyeIsBroken == FALSE))
	{
		Info_AddChoice(DIA_1051_Wegelagerer_Question, "我 在 找 一 个 新 信 徒 。", DIA_1051_Wegelagerer_Question_Novice);
	};

	Info_AddChoice(DIA_1051_Wegelagerer_Question, "那 不 关 你 的 事 。", DIA_1051_Wegelagerer_Question_MyConcern);
	Info_AddChoice(DIA_1051_Wegelagerer_Question, "我 只 是 四 处 看 看 。", DIA_1051_Wegelagerer_Question_LookAround);
};

func void DIA_1051_Wegelagerer_Question_Novice()
{
	AI_Output(other, self, "DIA_1051_Wegelagerer_Question_Novice_15_00"); //我 在 找 一 个 新 信 徒 。
	AI_Output(self, other, "DIA_1051_Wegelagerer_Question_Novice_07_01"); //那 太 有 趣 了 。 我 们 也 在 找 某 个 人 。

	Info_ClearChoices(DIA_1051_Wegelagerer_Question);
	Info_AddChoice(DIA_1051_Wegelagerer_Question, "你 在 找 谁 ？", DIA_1051_Wegelagerer_Question_Novice_Who);
};

func void DIA_1051_Wegelagerer_Question_Novice_Who()
{
	AI_Output(other, self, "DIA_1051_Wegelagerer_Question_Novice_Who_15_00"); //那 人 是 谁 ？
	AI_Output(self, other, "DIA_1051_Wegelagerer_Question_Novice_Who_07_01"); //你 ！
	BDT_1051_Wegelagerer_Angriff = TRUE;
	Npc_SetRefuseTalk(self, 40);
	Info_ClearChoices(DIA_1051_Wegelagerer_Question);
};

func void DIA_1051_Wegelagerer_Question_MyConcern()
{
	AI_Output(other, self, "DIA_1051_Wegelagerer_Question_MyConcern_15_00"); //那 不 关 你 的 事 。
	AI_Output(self, other, "DIA_1051_Wegelagerer_Question_MyConcern_07_01"); //你 是 什 么 意 思 ？ 你 想 惹 麻 烦 吗 ？

	Info_ClearChoices(DIA_1051_Wegelagerer_Question);
	Info_AddChoice(DIA_1051_Wegelagerer_Question, "不 ， 别 担 心 。 没 问 题 。", DIA_1051_Wegelagerer_Question_MyConcern_No);
	Info_AddChoice(DIA_1051_Wegelagerer_Question, "如 果 你 坚 持 的 话 。", DIA_1051_Wegelagerer_Question_MyConcern_Yes);
};

func void DIA_1051_Wegelagerer_Question_MyConcern_No()
{
	AI_Output(other, self, "DIA_1051_Wegelagerer_Question_MyConcern_No_15_00"); //不 ， 别 担 心 。 没 问 题 。
	AI_Output(self, other, "DIA_1051_Wegelagerer_Question_MyConcern_No_07_01"); //我 明 白 了 ， 你 拉 在 裤 子 上 了 。 马 上 走 开 。

	AI_StopProcessInfos(self); // Joly: Ausweg ohne angegriffen zu werden!!!!!!!!!
};

func void DIA_1051_Wegelagerer_Question_MyConcern_Yes()
{
	AI_Output(other, self, "DIA_1051_Wegelagerer_Question_MyConcern_Yes_15_00"); //如 果 你 坚 持 的 话 。
	AI_Output(self, other, "DIA_1051_Wegelagerer_Question_MyConcern_Yes_07_01"); //呵 呵 ， 你 真 是 口 无 遮 拦 。
	AI_Output(self, other, "DIA_1051_Wegelagerer_Question_MyConcern_Yes_07_02"); //现 在 我 要 帮 你 闭 上 嘴 巴 。

	BDT_1051_Wegelagerer_Angriff = TRUE;
	Npc_SetRefuseTalk(self, 40);
	Info_ClearChoices(DIA_1051_Wegelagerer_Question);
};

func void DIA_1051_Wegelagerer_Question_LookAround()
{
	AI_Output(other, self, "DIA_1051_Wegelagerer_Question_LookAround_15_00"); //我 只 是 四 处 看 看 。
	AI_Output(self, other, "DIA_1051_Wegelagerer_Question_LookAround_07_01"); //那 么 做 吧 ， 但 是 不 要 烦 我 们 。

	AI_StopProcessInfos(self); // Joly: Ausweg ohne angegriffen zu werden!!!!!!!!!
};

///////////////////////////////////////////////////////////////////////
//	Info Angriff
///////////////////////////////////////////////////////////////////////
instance DIA_Wegelagerer_ANGRIFF(C_INFO)
{
	npc				= BDT_1051_Wegelagerer;
	nr				= 2;
	condition		= DIA_Wegelagerer_ANGRIFF_Condition;
	information		= DIA_Wegelagerer_ANGRIFF_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Wegelagerer_ANGRIFF_Condition()
{
	var C_Npc Pal;
	Pal = Hlp_GetNpc(BDT_1052_Wegelagerer);

	if ((Npc_RefuseTalk(self) == FALSE)
	&& ((BDT_1051_Wegelagerer_Angriff == TRUE) || (C_NpcIsDown(Pal))))
	{
		return TRUE;
	};
};

func void DIA_Wegelagerer_ANGRIFF_Info()
{
	AI_Output(self, other, "DIA_Wegelagerer_ANGRIFF_07_00"); //那 是 给 你 的 。

	AI_StopProcessInfos(self);

	Npc_SetRefuseTalk(self, 40);

	self.aivar[AIV_EnemyOverride] = FALSE;
	BDT_1052_Wegelagerer.aivar[AIV_EnemyOverride] = FALSE;
};
