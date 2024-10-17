// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Larius_EXIT(C_INFO)
{
	npc				= VLK_400_Larius;
	nr				= 999;
	condition		= DIA_Larius_EXIT_Condition;
	information		= DIA_Larius_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Larius_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Larius_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				   Hello
// ************************************************************
instance DIA_Larius_Hello(C_INFO)
{
	npc				= VLK_400_Larius;
	nr				= 1;
	condition		= DIA_Larius_Hello_Condition;
	information		= DIA_Larius_Hello_Info;
	important		= TRUE;
};

func int DIA_Larius_Hello_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Larius_Hello_Info()
{
	AI_Output(self, other, "DIA_Larius_Hello_01_00"); //你 到 这 里 干 什 么 ？ 如 果 你 想 要 什 么 东 西 ， 先 预 约 。
};

// ************************************************************
// 			  		Wer bist du
// ************************************************************
instance DIA_Larius_WhoAreYou(C_INFO)
{
	npc				= VLK_400_Larius;
	nr				= 2;
	condition		= DIA_Larius_WhoAreYou_Condition;
	information		= DIA_Larius_WhoAreYou_Info;
	description		= "你 是 谁 ？";
};

func int DIA_Larius_WhoAreYou_Condition()
{
	return TRUE;
};

func void DIA_Larius_WhoAreYou_Info()
{
	AI_Output(other, self, "DIA_Larius_WhoAreYou_15_00"); //你 是 谁 ？
	AI_Output(self, other, "DIA_Larius_WhoAreYou_01_01"); //我 是 拉 里 厄 斯 ， 本 地 的 总 督 。
	AI_Output(self, other, "DIA_Larius_WhoAreYou_01_02"); //虽 然 现 在 看 起 来 不 太 象 ， 但 我 是 城 里 权 力 最 大 的 人 。
	AI_Output(other, self, "DIA_Larius_WhoAreYou_15_03"); //那 么 ， 你 管 辖 这 个 地 方 ？
	AI_Output(self, other, "DIA_Larius_WhoAreYou_01_04"); //我 … … 嗯 … … 现 在 我 是 束 手 束 脚 。
	AI_Output(self, other, "DIA_Larius_WhoAreYou_01_05"); //那 个 哈 根 勋 爵 在 这 里 指 挥 ， 无 论 什 么 时 候 ， 只 要 他 还 在 这 个 城 里 。
};

// ************************************************************
// 			  		Disturb
// ************************************************************
instance DIA_Larius_Disturb(C_INFO)
{
	npc				= VLK_400_Larius;
	nr				= 3;
	condition		= DIA_Larius_Disturb_Condition;
	information		= DIA_Larius_Disturb_Info;
	permanent		= TRUE;
	description		= "我 没 想 冒 犯 。";
};

func int DIA_Larius_Disturb_Condition()
{
	return TRUE;
};

func void DIA_Larius_Disturb_Info()
{
	AI_Output(other, self, "DIA_Larius_Disturb_15_00"); //我 没 想 冒 犯 。
	AI_Output(self, other, "DIA_Larius_Disturb_01_01"); //但 是 你 已 经 彻 底 失 败 了 。 那 么 走 开 ！
};

// ************************************************************
// 			  		Wie siehts aus?
// ************************************************************
instance DIA_Larius_DieLage(C_INFO)
{
	npc				= VLK_400_Larius;
	nr				= 2;
	condition		= DIA_Larius_DieLage_Condition;
	information		= DIA_Larius_DieLage_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 鲜 事 吗 ？";
};

func int DIA_Larius_DieLage_Condition()
{
	return TRUE;
};

func void DIA_Larius_DieLage_Info()
{
	AI_Output(other, self, "DIA_Larius_DieLage_15_00"); //进 行 的 怎 么 样 了 ？
	AI_Output(self, other, "DIA_Larius_DieLage_01_01"); //这 关 你 什 么 事 ？ 只 要 那 些 圣 骑 士 还 在 城 里 ， 哈 根 勋 爵 就 要 管 理 一 切 跟 这 个 城 有 关 的 事 务 。
};

// ************************************************************
// 		Richterueberfall
// ************************************************************
instance DIA_Larius_Richterueberfall(C_INFO)
{
	npc				= VLK_400_Larius;
	nr				= 2;
	condition		= DIA_Larius_Richterueberfall_Condition;
	information		= DIA_Larius_Richterueberfall_Info;
	description		= "法 官 雇 了 一 些 刺 客 来 杀 死 你 。";
};

func int DIA_Larius_Richterueberfall_Condition()
{
	if (SCKnowsRichterKomproBrief == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Larius_Richterueberfall_Info()
{
	AI_Output(other, self, "DIA_Larius_Richterueberfall_15_00"); //那 个 法 官 雇 了 一 些 暴 徒 来 袭 击 你 。 我 能 证 明 这 件 事 。
	AI_Output(self, other, "DIA_Larius_Richterueberfall_01_01"); //别 在 这 里 胡 说 八 道 了 ， 你 希 望 我 叫 人 把 你 关 起 来 ？
	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self, other, "DIA_Larius_Richterueberfall_01_02"); //即 使 你 是 英 诺 斯 的 勇 士 … …
	};

	if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Larius_Richterueberfall_01_03"); //即 使 你 是 得 到 任 命 的 魔 法 师 … …
	};

	AI_Output(self, other, "DIA_Larius_Richterueberfall_01_04"); //我 的 话 在 这 个 城 里 还 是 有 一 些 份 量 的 。 再 也 不 要 胆 敢 玷 污 尊 敬 的 法 官 大 人 的 名 声 了 ！
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Larius_PICKPOCKET(C_INFO)
{
	npc				= VLK_400_Larius;
	nr				= 900;
	condition		= DIA_Larius_PICKPOCKET_Condition;
	information		= DIA_Larius_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Larius_PICKPOCKET_Condition()
{
	C_Beklauen(35, 120);
};

func void DIA_Larius_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Larius_PICKPOCKET);
	Info_AddChoice(DIA_Larius_PICKPOCKET, DIALOG_BACK, DIA_Larius_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Larius_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Larius_PICKPOCKET_DoIt);
};

func void DIA_Larius_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Larius_PICKPOCKET);
};

func void DIA_Larius_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Larius_PICKPOCKET);
};
