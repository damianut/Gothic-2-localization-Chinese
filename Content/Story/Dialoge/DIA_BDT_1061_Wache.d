// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_1061_Wache_EXIT(C_INFO)
{
	npc				= BDT_1061_Wache;
	nr				= 999;
	condition		= DIA_1061_Wache_EXIT_Condition;
	information		= DIA_1061_Wache_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_1061_Wache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_1061_Wache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  	Hallo
// ************************************************************
instance DIA_1061_Wache_Hallo(C_INFO)
{
	npc				= BDT_1061_Wache;
	nr				= 1;
	condition		= DIA_1061_Wache_Hallo_Condition;
	information		= DIA_1061_Wache_Hallo_Info;
	important		= TRUE;
};

func int DIA_1061_Wache_Hallo_Condition()
{
	return TRUE;
};

func void DIA_1061_Wache_Hallo_Info()
{
	AI_Output(self, other, "DIA_1061_Wache_Hallo_01_00"); //停 下 - 你 不 能 通 过 这 里 。
	AI_Output(other, self, "DIA_1061_Wache_Hallo_15_01"); //我 要 和 你 的 首 领 谈 话 。
	AI_Output(self, other, "DIA_1061_Wache_Hallo_01_02"); //（ 挖 苦 的 ） 哦 ， 我 明 白 ， 你 想 要 和 我 的 老 板 说 话 。 嗯 ， 那 么 我 当 然 要 让 你 过 去 。
	AI_Output(self, other, "DIA_1061_Wache_Hallo_01_03"); //（ 非 常 严 肃 ） 但 是 除 非 你 知 道 他 的 名 字 - 因 为 如 果 你 不 知 道 的 话 ， 我 就 将 被 迫 杀 死 你 ！ 嗯 ？

	Info_ClearChoices(DIA_1061_Wache_Hallo);
	Info_AddChoice(DIA_1061_Wache_Hallo, "李", DIA_1061_Wache_Hallo_Lee);
	if ((Bdt13_Dexter_verraten == TRUE)
	|| (Ranger_SCKnowsDexter == TRUE)) // ADDON
	{
		Info_AddChoice(DIA_1061_Wache_Hallo, "德 克 斯 特", DIA_1061_Wache_Hallo_Dexter);
	};

	Info_AddChoice(DIA_1061_Wache_Hallo, "迪 雅 戈", DIA_1061_Wache_Hallo_Diego);
	Info_AddChoice(DIA_1061_Wache_Hallo, "不 知 道 。", DIA_1061_Wache_Hallo_Ahnung);
};

func void DIA_1061_Wache_Hallo_Lee()
{
	AI_Output(other, self, "DIA_1061_Wache_Hallo_Lee_15_00"); //李 。
	AI_Output(self, other, "DIA_1061_Wache_Hallo_Lee_01_01"); //恩 ， 要 我 说 什 么 呢 ？ 你 的 命 刚 刚 丢 了 ， 老 兄 ！

	Info_ClearChoices(DIA_1061_Wache_Hallo);
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_SuddenEnemyInferno, 0);
};

func void DIA_1061_Wache_Hallo_Dexter()
{
	AI_Output(other, self, "DIA_1061_Wache_Hallo_Dexter_15_00"); //德 克 斯 特 。
	AI_Output(self, other, "DIA_1061_Wache_Hallo_Dexter_01_01"); //嗯 ， … … 我 想 你 认 识 老 板 。 好 吧 ， 我 让 你 过 去 。 但 是 我 警 告 你 。
	AI_Output(self, other, "DIA_1061_Wache_Hallo_Dexter_01_02"); //如 果 你 离 别 人 太 近 的 话 ， 你 就 别 想 活 着 从 离 开 这 里 ！
	AI_Output(self, other, "DIA_1061_Wache_Hallo_Dexter_01_03"); //那 么 深 吸 一 口 气 ， 然 后 把 你 的 武 器 放 回 原 处 。 你 可 以 在 房 子 里 找 到 德 克 斯 特 。

	Knows_Dexter = TRUE;
	BanditGuard.aivar[AIV_PASSGATE] = TRUE;
	Info_ClearChoices(DIA_1061_Wache_Hallo);
	AI_StopProcessInfos(self);
};

func void DIA_1061_Wache_Hallo_Diego()
{
	AI_Output(other, self, "DIA_1061_Wache_Hallo_Diego_15_00"); //迪 雅 戈 。
	AI_Output(self, other, "DIA_1061_Wache_Hallo_Diego_01_01"); //正 确 ！
	AI_Output(self, other, "DIA_1061_Wache_Hallo_Diego_01_02"); //不 ， 那 只 是 在 开 玩 笑 。 你 根 本 不 知 道 我 的 老 板 是 谁 。
	AI_Output(self, other, "DIA_1061_Wache_Hallo_Diego_01_03"); //所 以 我 没 有 理 由 不 杀 死 你 。

	Info_ClearChoices(DIA_1061_Wache_Hallo);
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_SuddenEnemyInferno, 0);
};

func void DIA_1061_Wache_Hallo_Ahnung()
{
	AI_Output(other, self, "DIA_1061_Wache_Hallo_Ahnung_15_00"); //不 知 道 。
	AI_Output(self, other, "DIA_1061_Wache_Hallo_Ahnung_01_01"); //你 将 无 知 地 死 去 。

	Info_ClearChoices(DIA_1061_Wache_Hallo);
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_SuddenEnemyInferno, 0);
};

// ************************************************************
// 			  Perm
//**************************************
instance DIA_1061_Wache_Perm(C_INFO)
{
	npc				= BDT_1061_Wache;
	nr				= 2;
	condition		= DIA_1061_Wache_Perm_Condition;
	information		= DIA_1061_Wache_Perm_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_1061_Wache_Perm_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (Knows_Dexter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_1061_Wache_Perm_Info()
{
	AI_Output(self, other, "DIA_1061_Wache_Perm_01_00"); //记 住 ， 保 持 冷 静 ， 你 才 能 活 着 离 开 这 里 。
	AI_StopProcessInfos(self);
};
