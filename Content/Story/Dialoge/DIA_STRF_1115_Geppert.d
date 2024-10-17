///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Geppert_EXIT(C_INFO)
{
	npc				= STRF_1115_Geppert;
	nr				= 999;
	condition		= DIA_Geppert_EXIT_Condition;
	information		= DIA_Geppert_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Geppert_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Geppert_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Geppert_HALLO(C_INFO)
{
	npc				= STRF_1115_Geppert;
	nr				= 4;
	condition		= DIA_Geppert_HALLO_Condition;
	information		= DIA_Geppert_HALLO_Info;
	important		= TRUE;
};

func int DIA_Geppert_HALLO_Condition()
{
	return TRUE;
};

var int Kervo_GotStuff;
func void DIA_Geppert_HALLO_Info()
{
	if (((Npc_IsDead(Kervo)) == FALSE)
	&& (Kervo_GotStuff == FALSE))
	{
		if (hero.guild == GIL_KDF)
		{
			CreateInvItems(Kervo, ItMi_RuneBlank, 1);
		}
		else
		{
			CreateInvItems(Kervo, ItMi_Nugget, 1);
		};

		Kervo_GotStuff = TRUE;
	};

	AI_Output(self, other, "DIA_Geppert_HALLO_10_00"); //停 下 ！ 谁 在 往 那 边 走 ？
	AI_Output(self, other, "DIA_Geppert_HALLO_10_01"); //你 不 是 来 把 我 送 回 到 矿 区 那 里 去 的 吧 ， 是 吗 ？。
	AI_Output(self, other, "DIA_Geppert_HALLO_10_02"); //那 么 我 不 得 不 让 你 失 望 了 。 我 决 不 回 去 。

	Info_ClearChoices(DIA_Geppert_HALLO);
	Info_AddChoice(DIA_Geppert_HALLO, "你 在 这 里 做 什 么 ？", DIA_Geppert_HALLO_Wasmachtihr);
	Info_AddChoice(DIA_Geppert_HALLO, "你 是 一 名 正 在 潜 逃 的 罪 犯 ， 对 吗 ？", DIA_Geppert_HALLO_Flucht);
};

func void DIA_Geppert_HALLO_Flucht()
{
	AI_Output(other, self, "DIA_Geppert_HALLO_Flucht_15_00"); //你 是 一 名 正 在 潜 逃 的 罪 犯 ， 对 吗 ？
	AI_Output(self, other, "DIA_Geppert_HALLO_Flucht_10_01"); //你 真 敏 锐 。 我 怎 么 就 到 了 这 个 肮 脏 的 洞 里 来 了 ？
	Info_ClearChoices(DIA_Geppert_HALLO);
};

func void DIA_Geppert_HALLO_Wasmachtihr()
{
	AI_Output(other, self, "DIA_Geppert_HALLO_Wasmachtihr_15_00"); //你 在 这 里 做 什 么 ？

	if ((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self, other, "DIA_Geppert_HALLO_Wasmachtihr_10_01"); //那 是 多 么 愚 蠢 的 问 题 ？ 我 藏 在 这 里 就 是 要 躲 开 你 们 这 些 士 兵 。
		AI_Output(self, other, "DIA_Geppert_HALLO_Wasmachtihr_10_02"); //别 在 这 里 转 弯 抹 角 了 。 要 么 就 杀 了 我 ， 要 么 走 开 。
	}
	else
	{
		AI_Output(self, other, "DIA_Geppert_HALLO_Wasmachtihr_10_03"); //愚 蠢 的 问 题 。 藏 在 这 里 ， 还 有 什 么 ？ 到 处 都 是 那 些 民 兵 的 探 子 。
	};

	AI_Output(self, other, "DIA_Geppert_HALLO_Wasmachtihr_10_04"); //我 不 会 回 到 矿 区 去 ， 那 就 是 决 定 。
	Info_ClearChoices(DIA_Geppert_HALLO);
};

///////////////////////////////////////////////////////////////////////
//	Info Braten
///////////////////////////////////////////////////////////////////////
instance DIA_Geppert_BRATEN(C_INFO)
{
	npc				= STRF_1115_Geppert;
	nr				= 5;
	condition		= DIA_Geppert_BRATEN_Condition;
	information		= DIA_Geppert_BRATEN_Info;
	permanent		= TRUE;
	description		= "那 烤 肉 闻 起 来 很 香 。";
};

func int DIA_Geppert_BRATEN_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Geppert_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Geppert_BRATEN_Info()
{
	AI_Output(other, self, "DIA_Geppert_BRATEN_15_00"); //那 烤 肉 闻 起 来 很 香 。
	AI_Output(self, other, "DIA_Geppert_BRATEN_10_01"); //别 碰 ！
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Geppert_PICKPOCKET(C_INFO)
{
	npc				= STRF_1115_Geppert;
	nr				= 900;
	condition		= DIA_Geppert_PICKPOCKET_Condition;
	information		= DIA_Geppert_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Geppert_PICKPOCKET_Condition()
{
	C_Beklauen(56, 5);
};

func void DIA_Geppert_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Geppert_PICKPOCKET);
	Info_AddChoice(DIA_Geppert_PICKPOCKET, DIALOG_BACK, DIA_Geppert_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Geppert_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Geppert_PICKPOCKET_DoIt);
};

func void DIA_Geppert_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Geppert_PICKPOCKET);
};

func void DIA_Geppert_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Geppert_PICKPOCKET);
};
