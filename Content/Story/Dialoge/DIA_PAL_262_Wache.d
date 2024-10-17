///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_262_EXIT(C_INFO)
{
	npc				= PAL_262_Wache;
	nr				= 999;
	condition		= DIA_PAL_262_EXIT_Condition;
	information		= DIA_PAL_262_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_PAL_262_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_262_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_262_GREET(C_INFO)
{
	npc				= PAL_262_Wache;
	nr				= 2;
	condition		= DIA_PAL_262_GREET_Condition;
	information		= DIA_PAL_262_GREET_Info;
	important		= TRUE;
};

func int DIA_PAL_262_GREET_Condition()
{
	return TRUE;
};

func void DIA_PAL_262_GREET_Info()
{
	AI_Output(self, other, "DIA_PAL_262_GREET_10_00"); //站 住 - 你 是 谁 ？
	AI_Output(other, self, "DIA_PAL_262_GREET_15_01"); //我 从 哪 里 来 这 个 问 题 更 重 要 。 我 从 关 卡 那 边 来 。
	AI_Output(other, self, "DIA_PAL_262_GREET_15_02"); //那 么 ， 你 现 在 准 备 阻 止 我 ， 还 是 我 可 以 进 去 了 ？
	AI_Output(self, other, "DIA_PAL_262_GREET_10_03"); //好 吧 ， 我 刚 才 不 知 道 。 当 然 你 可 以 进 来 。

	/*
	AI_Output(self, other, "DIA_Addon_PAL_262_GREET_10_00"); //Halt - wer bist du?
	AI_Output(other, self, "DIA_Addon_PAL_262_GREET_15_01"); //Viel wichtiger ist die Frage, wo ich herkomme. Ich bin über den Pass gekommen.
	AI_Output(other, self, "DIA_Addon_PAL_262_GREET_15_02"); //Also willst du mich jetzt aufhalten oder kann ich rein?
	AI_Output(self, other, "DIA_Addon_PAL_262_GREET_10_03"); //Konnte ich ja nicht wissen. Klar kannst du rein.
	*/

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Wache_PERM(C_INFO)
{
	npc				= PAL_262_Wache;
	nr				= 3;
	condition		= DIA_Wache_PERM_Condition;
	information		= DIA_Wache_PERM_Info;
	permanent		= TRUE;
	description		= "谁 主 管 这 里 ？";
};

func int DIA_Wache_PERM_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_PAL_262_GREET))
	{
		return TRUE;
	};
};

func void DIA_Wache_PERM_Info()
{
	/* obskur
	AI_Output(other, self, "DIA_Wache_PERM_15_00"); //Wer hat hier das Sagen?
	AI_Output(self, other, "DIA_Wache_PERM_10_01"); //Unser Kommandant Garond und seine beiden Berater, die Paladine Oric und Parcival.
	AI_Output(self, other, "DIA_Wache_PERM_10_02"); //Geh einfach rein. Tagsüber halten sie sich im Thronsaal im Erdgeschoss auf.
	*/
	AI_Output(other, self, "DIA_Addon_Wache_PERM_15_00"); //谁 主 管 这 里 ？
	AI_Output(self, other, "DIA_Addon_Wache_PERM_10_01"); //我 们 的 指 挥 官 加 隆 德 和 他 的 两 个 顾 问 ， 圣 骑 士 奥 里 克 和 帕 西 沃 。
	AI_Output(self, other, "DIA_Addon_Wache_PERM_10_02"); //一 直 往 里 走 。 白 天 的 时 候 ， 你 可 以 在 一 层 王 座 室 找 他 们 。
};
