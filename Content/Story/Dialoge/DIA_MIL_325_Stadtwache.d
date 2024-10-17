// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Mil_325_Miliz_EXIT(C_INFO)
{
	npc				= Mil_325_Miliz;
	nr				= 999;
	condition		= DIA_Mil_325_Miliz_EXIT_Condition;
	information		= DIA_Mil_325_Miliz_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Mil_325_Miliz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_325_Miliz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
const string Mil_325_Checkpoint = "NW_CITY_MERCHANT_PATH_03"; // WP in Matteos Lager
// -----------------------------------------------------------
instance DIA_Mil_325_Miliz_FirstWarn(C_INFO)
{
	npc				= Mil_325_Miliz;
	nr				= 1;
	condition		= DIA_Mil_325_Miliz_FirstWarn_Condition;
	information		= DIA_Mil_325_Miliz_FirstWarn_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Mil_325_Miliz_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, Mil_325_Checkpoint) < 650) // NICHT von hinten!
	{
		Npc_SetRefuseTalk(self, 5);
		return FALSE;
	};

	if ((self.aivar[AIV_Guardpassage_Status] == GP_NONE)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE)
	&& (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_325_Miliz_FirstWarn_Info()
{
	AI_Output(self, other, "DIA_Mil_325_Miliz_FirstWarn_12_00"); //停 下 ！
	AI_Output(self, other, "DIA_Mil_325_Miliz_FirstWarn_12_01"); //没 人 可 以 进 入 储 藏 室 。

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other, Mil_325_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************
instance DIA_Mil_325_Miliz_SecondWarn(C_INFO)
{
	npc				= Mil_325_Miliz;
	nr				= 2;
	condition		= DIA_Mil_325_Miliz_SecondWarn_Condition;
	information		= DIA_Mil_325_Miliz_SecondWarn_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Mil_325_Miliz_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE)
	&& (Npc_GetDistToWP(other, Mil_325_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_325_Miliz_SecondWarn_Info()
{
	AI_Output(self, other, "DIA_Mil_325_Miliz_SecondWarn_12_00"); //你 聋 了 吗 ？ 再 靠 近 一 步 ， 我 就 把 你 切 成 碎 片 ！

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other, Mil_325_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;

	AI_StopProcessInfos(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************
instance DIA_Mil_325_Miliz_Attack(C_INFO)
{
	npc				= Mil_325_Miliz;
	nr				= 3;
	condition		= DIA_Mil_325_Miliz_Attack_Condition;
	information		= DIA_Mil_325_Miliz_Attack_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Mil_325_Miliz_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE)
	&& (Npc_GetDistToWP(other, Mil_325_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_325_Miliz_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE; // wird auch in ZS_Attack resettet

	AI_Output(self, other, "DIA_Mil_325_Miliz_Attack_12_00"); //那 是 一 个 错 误 ！

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_GuardStopsIntruder, 0);
};

// ************************************************************
// 							Bestechung!
// ************************************************************
instance DIA_Mil_325_Miliz_Pass(C_INFO)
{
	npc				= Mil_325_Miliz;
	nr				= 5;
	condition		= DIA_Mil_325_Miliz_Pass_Condition;
	information		= DIA_Mil_325_Miliz_Pass_Info;
	description		= "我 属 于 皇 家 军 队 。 我 要 武 装 自 己 ！";
};

func int DIA_Mil_325_Miliz_Pass_Condition()
{
	if ((self.aivar[AIV_PASSGATE] == FALSE)
	&& ((other.guild == GIL_MIL) || (other.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Mil_325_Miliz_Pass_Info()
{
	AI_Output(other, self, "DIA_Mil_325_Miliz_Pass_15_00"); //我 属 于 皇 家 军 队 。 我 要 武 装 自 己 ！
	AI_Output(self, other, "DIA_Mil_325_Miliz_Pass_12_01"); //你 得 到 命 令 那 样 做 吗 ？

	Info_ClearChoices(DIA_Mil_325_Miliz_Pass);
	Info_AddChoice(DIA_Mil_325_Miliz_Pass, "不.", DIA_Mil_325_Miliz_Pass_No);
	Info_AddChoice(DIA_Mil_325_Miliz_Pass, "当 然 。", DIA_Mil_325_Miliz_Pass_Yes);
};

func void DIA_Mil_325_Miliz_Pass_Yes()
{
	AI_Output(other, self, "DIA_Mil_325_Miliz_Pass_Yes_15_00"); //当 然 。
	AI_Output(self, other, "DIA_Mil_325_Miliz_Pass_Yes_12_01"); //好 ， 你 可 以 进 去 ！
	self.aivar[AIV_PASSGATE] = TRUE;
	Info_ClearChoices(DIA_Mil_325_Miliz_Pass);
	AI_StopProcessInfos(self);
};

func void DIA_Mil_325_Miliz_Pass_No()
{
	AI_Output(other, self, "DIA_Mil_325_Miliz_Pass_No_15_00"); //不.
	AI_Output(self, other, "DIA_Mil_325_Miliz_Pass_No_12_01"); //那 么 离 开 这 里 。
	Info_ClearChoices(DIA_Mil_325_Miliz_Pass);
	AI_StopProcessInfos(self);
};

// ************************************************************
// 							PERM
// ************************************************************
instance DIA_Mil_325_Miliz_PERM(C_INFO)
{
	npc				= Mil_325_Miliz;
	nr				= 5;
	condition		= DIA_Mil_325_Miliz_PERM_Condition;
	information		= DIA_Mil_325_Miliz_PERM_Info;
	permanent		= TRUE;
	description		= "为 什 么 任 何 人 都 不 许 进 入 仓 库 ？";
};

func int DIA_Mil_325_Miliz_PERM_Condition()
{
	return TRUE;
};

func void DIA_Mil_325_Miliz_PERM_Info()
{
	AI_Output(other, self, "DIA_Mil_325_Miliz_PERM_15_00"); //为 什 么 任 何 人 都 不 许 进 入 仓 库 ？
	AI_Output(self, other, "DIA_Mil_325_Miliz_PERM_12_01"); //尊 敬 的 哈 根 勋 爵 已 经 责 成 国 王 的 军 队 没 收 这 些 货 物 。
};
