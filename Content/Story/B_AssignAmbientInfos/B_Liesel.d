// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Liesel_EXIT(C_INFO)
{
	npc				= Follow_Sheep;
	nr				= 999;
	condition		= DIA_Liesel_EXIT_Condition;
	information		= DIA_Liesel_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Liesel_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Liesel_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  			Hallo (Durchsuchen)
// ************************************************************
instance DIA_Liesel_Hallo(C_INFO)
{
	npc				= Follow_Sheep;
	nr				= 1;
	condition		= DIA_Liesel_Hallo_Condition;
	information		= DIA_Liesel_Hallo_Info;
	description		= "你 好 ！";
};

func int DIA_Liesel_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Liesel_Hallo_Info()
{
	AI_Output(other, self, "DIA_Liesel_Hallo_15_00"); //你 好 … … （ 清 清 他 的 喉 咙 ） … … 绵 羊 。
	B_LieselMaeh();
};

// ************************************************************
// 			  			Komm mit
// ************************************************************
instance DIA_Liesel_KommMit(C_INFO)
{
	npc				= Follow_Sheep;
	nr				= 1;
	condition		= DIA_Liesel_KommMit_Condition;
	information		= DIA_Liesel_KommMit_Info;
	permanent		= TRUE;
	description		= "跟 我 来 ！";
};

func int DIA_Liesel_KommMit_Condition()
{
	if ((self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Liesel_Hallo))
	&& (self.aivar[AIV_TAPOSITION] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Liesel_KommMit_Info()
{
	AI_Output(other, self, "DIA_Liesel_KommMit_15_00"); //跟 我 来 ！
	B_LieselMaeh();

	self.aivar[AIV_PARTYMEMBER] = TRUE;

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  			Warte hier
// ************************************************************
instance DIA_Liesel_WarteHier(C_INFO)
{
	npc				= Follow_Sheep;
	nr				= 1;
	condition		= DIA_Liesel_WarteHier_Condition;
	information		= DIA_Liesel_WarteHier_Info;
	permanent		= TRUE;
	description		= "在 这 里 等 ！";
};

func int DIA_Liesel_WarteHier_Condition()
{
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_KnowsInfo(other, DIA_Liesel_Hallo))
	&& (self.aivar[AIV_TAPOSITION] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Liesel_WarteHier_Info()
{
	AI_Output(other, self, "DIA_Liesel_WarteHier_15_00"); //在 这 里 等 ！
	B_LieselMaeh();

	self.aivar[AIV_PARTYMEMBER] = FALSE;

	AI_StopProcessInfos(self);
};
