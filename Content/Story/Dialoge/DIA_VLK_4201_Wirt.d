///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Wirt_EXIT(C_INFO)
{
	npc				= VLK_4201_Wirt;
	nr				= 999;
	condition		= DIA_Wirt_EXIT_Condition;
	information		= DIA_Wirt_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Wirt_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wirt_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Wirt_PICKPOCKET(C_INFO)
{
	npc				= VLK_4201_Wirt;
	nr				= 900;
	condition		= DIA_Wirt_PICKPOCKET_Condition;
	information		= DIA_Wirt_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Wirt_PICKPOCKET_Condition()
{
	C_Beklauen(60, 65);
};

func void DIA_Wirt_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wirt_PICKPOCKET);
	Info_AddChoice(DIA_Wirt_PICKPOCKET, DIALOG_BACK, DIA_Wirt_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wirt_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Wirt_PICKPOCKET_DoIt);
};

func void DIA_Wirt_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Wirt_PICKPOCKET);
};

func void DIA_Wirt_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wirt_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Wirt_Hallo(C_INFO)
{
	npc				= VLK_4201_Wirt;
	nr				= 2;
	condition		= DIA_Wirt_Hallo_Condition;
	information		= DIA_Wirt_Hallo_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Wirt_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Wirt_Hallo_Info()
{
	var int randy;
	randy = Hlp_Random(2);

	AI_Output(self, other, "DIA_Wirt_Hallo_14_00"); //嘿 ， 走 近 点 。 休 息 一 下 喝 口 冰 啤 酒 。

	if (self.aivar [AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self, other, "DIA_Wirt_Hallo_14_01"); //安 德 烈 勋 爵 正 在 分 发 几 桶 免 费 的 啤 酒 。
		AI_StopProcessInfos(self);
	}
	else if (randy == 0)
	{
		AI_Output(self, other, "DIA_Wirt_Hallo_14_02"); //没 什 么 比 工 作 之 余 的 一 杯 啤 酒 更 让 人 感 到 惬 意 的 了 。
		AI_StopProcessInfos(self);
	}
	else if (randy == 1)
	{
		AI_Output(self, other, "DIA_Wirt_Hallo_14_03"); //那 些 圣 骑 士 会 处 理 好 一 切 的 。 那 么 ， 再 喝 一 口 酒 好 好 享 受 吧 。

		B_GiveInvItems(self, other, ItFo_Beer, 1);
		AI_StopProcessInfos(self);
	}
	else if (randy == 2)
	{
		AI_Output(self, other, "DIA_Wirt_Hallo_14_04"); //你 可 以 随 便 谈 论 关 于 克 霍 里 尼 斯 的 事 ， 但 是 我 们 的 ‘ 黑 暗 圣 骑 士 ’ 是 整 个 米 尔 塔 纳 王 国 最 好 的 。
		AI_StopProcessInfos(self);
	};
};

/*
Wenn du ein Problem hast und es lässt sich lösen, dann denk nicht weiter drüber nach.
Und wenn du es nicht lösen kannst, dann brauchst du auch nicht weiter drüber nachzudenken.
*/
