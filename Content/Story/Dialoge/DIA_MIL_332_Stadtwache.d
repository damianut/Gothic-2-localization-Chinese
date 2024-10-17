///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Mil_332_Stadtwache_EXIT(C_INFO)
{
	npc				= Mil_332_Stadtwache;
	nr				= 999;
	condition		= DIA_Mil_332_Stadtwache_EXIT_Condition;
	information		= DIA_Mil_332_Stadtwache_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Mil_332_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_332_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WASMACHSTDU2
///////////////////////////////////////////////////////////////////////
instance DIA_Mil_332_Stadtwache_PERM(C_INFO)
{
	npc				= Mil_332_Stadtwache;
	nr				= 1;
	condition		= DIA_Mil_332_Stadtwache_PERM_Condition;
	information		= DIA_Mil_332_Stadtwache_PERM_Info;
	permanent		= TRUE;
	description		= "进 行 的 怎 么 样 ？";
};

func int DIA_Mil_332_Stadtwache_PERM_Condition()
{
	return TRUE;
};

func void DIA_Mil_332_Stadtwache_PERM_Info()
{
	AI_Output(other, self, "DIA_Mil_332_Stadtwache_PERM_15_00"); //进 行 的 怎 么 样 ？
	AI_Output(self, other, "DIA_Mil_332_Stadtwache_PERM_04_01"); //走 开 ！ 我 正 在 执 行 任 务 ！
	AI_StopProcessInfos(self);
};
