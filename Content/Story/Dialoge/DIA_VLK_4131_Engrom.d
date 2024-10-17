///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Engrom_EXIT(C_INFO)
{
	npc				= VLK_4131_Engrom;
	nr				= 999;
	condition		= DIA_Engrom_EXIT_Condition;
	information		= DIA_Engrom_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Engrom_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Engrom_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Engrom_HALLO(C_INFO)
{
	npc				= VLK_4131_Engrom;
	nr				= 5;
	condition		= DIA_Engrom_HALLO_Condition;
	information		= DIA_Engrom_HALLO_Info;
	description		= "有 什 么 新 鲜 事 吗 ？";
};

func int DIA_Engrom_HALLO_Condition()
{
	if (Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Engrom_HALLO_Info()
{
	AI_Output(other, self, "DIA_Engrom_HALLO_15_00"); //情 况 怎 么 样 了 ？
	AI_Output(self, other, "DIA_Engrom_HALLO_12_01"); //讨 厌 ！
	AI_Output(other, self, "DIA_Engrom_HALLO_15_02"); //嗯 ！
	AI_Output(self, other, "DIA_Engrom_HALLO_12_03"); //我 还 能 说 点 什 么 。 每 天 除 了 在 这 该 死 的 河 边 左 右 行 走 就 没 别 的 了 。
	AI_Output(self, other, "DIA_Engrom_HALLO_12_04"); //兽 人 埋 伏 在 左 边 ， 强 盗 们 埋 伏 在 右 边 ， 每 天 我 都 在 吃 着 潜 伏 者 的 肉 。 你 知 道 ， 我 再 也 无 法 忍 受 了 。？
};

///////////////////////////////////////////////////////////////////////
//	Info WhatAboutLeaving
///////////////////////////////////////////////////////////////////////
instance DIA_Engrom_WhatAboutLeaving(C_INFO)
{
	npc				= VLK_4131_Engrom;
	nr				= 6;
	condition		= DIA_Engrom_WhatAboutLeaving_Condition;
	information		= DIA_Engrom_WhatAboutLeaving_Info;
	description		= "想 过 离 开 这 里 吗 ？";
};

func int DIA_Engrom_WhatAboutLeaving_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Engrom_HALLO))
	&& (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Engrom_WhatAboutLeaving_Info()
{
	AI_Output(other, self, "DIA_Engrom_WhatAboutLeaving_15_00"); //想 过 离 开 这 里 吗 ？
	AI_Output(self, other, "DIA_Engrom_WhatAboutLeaving_12_01"); //是 的 ， 当 然 。 一 点 问 题 都 没 有。
	AI_Output(self, other, "DIA_Engrom_WhatAboutLeaving_12_02"); //首 先 ， 我 会 从 兽 人 的 部 落 里 劈 开 一 条 路 ， 对 其 他 无 处 不 在 的 怪 物 打 打 招 呼 ， 然 后 大 摇 大 摆 地 直 接 穿 过 关 卡 ！
	AI_Output(self, other, "DIA_Engrom_WhatAboutLeaving_12_03"); //那 是 个 大 谎 话 ！
	AI_Output(other, self, "DIA_Engrom_WhatAboutLeaving_15_04"); //我 也 到 了 这 里 。
	AI_Output(self, other, "DIA_Engrom_WhatAboutLeaving_12_05"); //你 是 在 告 诉 我 你 刚 刚 穿 过 关 卡 ？
	AI_Output(other, self, "DIA_Engrom_WhatAboutLeaving_15_06"); //差 不 多 ， 是 的 ！
	AI_Output(self, other, "DIA_Engrom_WhatAboutLeaving_12_07"); //那 么 ， 你 走 运 了 。 只 要 这 周 围 还 是 一 片 混 乱 ， 我 就 不 会 挪 窝 。
};

///////////////////////////////////////////////////////////////////////
//	Info Jagd
///////////////////////////////////////////////////////////////////////
instance DIA_Engrom_Jagd(C_INFO)
{
	npc				= VLK_4131_Engrom;
	nr				= 6;
	condition		= DIA_Engrom_Jagd_Condition;
	information		= DIA_Engrom_Jagd_Info;
	permanent		= TRUE;
	description		= "狩 猎 进 行 的 怎 么 样 ？";
};

func int DIA_Engrom_Jagd_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Engrom_HALLO))
	&& (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Engrom_Jagd_Info()
{
	B_WasMachtJagd();
	// Joly:AI_Output(other, self, "DIA_Engrom_Jagd_15_00"); // Schon mal dran gedacht, hier abzuhauen?
	AI_Output(self, other, "DIA_Engrom_Jagd_12_01"); //捕 猎 是 我 唯 一 的 安 慰 。 但 是 我 更 喜 欢 偶 尔 能 看 到 这 些 恶 心 的 潜 伏 者 以 外 的 目 标 。
};

// #####################################################################
// ##
// ##
// ## KAPITEL 3
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************
instance DIA_Engrom_KAP3_EXIT(C_INFO)
{
	npc				= VLK_4131_Engrom;
	nr				= 999;
	condition		= DIA_Engrom_KAP3_EXIT_Condition;
	information		= DIA_Engrom_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Engrom_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Engrom_KAP3_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 4
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************
instance DIA_Engrom_KAP4_EXIT(C_INFO)
{
	npc				= VLK_4131_Engrom;
	nr				= 999;
	condition		= DIA_Engrom_KAP4_EXIT_Condition;
	information		= DIA_Engrom_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Engrom_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Engrom_KAP4_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};

///////////////////////////////////////////////////////////////////////
//	Info perm4
///////////////////////////////////////////////////////////////////////
instance DIA_Engrom_B_NpcObsessedByDMT(C_INFO)
{
	npc				= VLK_4131_Engrom;
	nr				= 32;
	condition		= DIA_Engrom_B_NpcObsessedByDMT_Condition;
	information		= DIA_Engrom_B_NpcObsessedByDMT_Info;
	description		= "一 切 都 好 吗 ？";
};

func int DIA_Engrom_B_NpcObsessedByDMT_Condition()
{
	if ((NpcObsessedByDMT_Engrom == FALSE)
	&& (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Engrom_B_NpcObsessedByDMT_Info()
{
	MIS_Tabin_LookForEngrom = LOG_SUCCESS;
	B_NpcObsessedByDMT(self);
};

///////////////////////////////////////////////////////////////////////
//	Info bessen
///////////////////////////////////////////////////////////////////////
instance DIA_Engrom_BESSEN(C_INFO)
{
	npc				= VLK_4131_Engrom;
	nr				= 55;
	condition		= DIA_Engrom_BESSEN_Condition;
	information		= DIA_Engrom_BESSEN_Info;
	permanent		= TRUE;
	description		= "邪 恶 已 经 控 制 了 你 。";
};

func int DIA_Engrom_BESSEN_Condition()
{
	if ((NpcObsessedByDMT_Engrom == TRUE)
	&& (NpcObsessedByDMT == FALSE)
	&& (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Engrom_BESSEN_Info()
{
	AI_Output(other, self, "DIA_Engrom_BESSEN_15_00"); //邪 恶 已 经 控 制 了 你 。

	AI_Output(other, self, "DIA_Engrom_BESSEN_15_01"); //让 我 来 帮 帮 你 。
	AI_Output(self, other, "DIA_Engrom_BESSEN_12_02"); //（ 尖 叫 ） 别 碰 我 ！

	B_NpcClearObsessionByDMT(self);

	Npc_SetTarget(self, other);

	self.aivar[AIV_INVINCIBLE] = FALSE; // HACK, weil durch AI_StartState(böse) Flag nicht zurückgesetzt wird
	other.aivar[AIV_INVINCIBLE] = FALSE;

	AI_StartState(self, ZS_Flee, 0, "");
};

// #####################################################################
// ##
// ##
// ## KAPITEL 5
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************
instance DIA_Engrom_KAP5_EXIT(C_INFO)
{
	npc				= VLK_4131_Engrom;
	nr				= 999;
	condition		= DIA_Engrom_KAP5_EXIT_Condition;
	information		= DIA_Engrom_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Engrom_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Engrom_KAP5_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 6
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************
instance DIA_Engrom_KAP6_EXIT(C_INFO)
{
	npc				= VLK_4131_Engrom;
	nr				= 999;
	condition		= DIA_Engrom_KAP6_EXIT_Condition;
	information		= DIA_Engrom_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Engrom_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Engrom_KAP6_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Engrom_PICKPOCKET(C_INFO)
{
	npc				= VLK_4131_Engrom;
	nr				= 900;
	condition		= DIA_Engrom_PICKPOCKET_Condition;
	information		= DIA_Engrom_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Engrom_PICKPOCKET_Condition()
{
	C_Beklauen(10, 5);
};

func void DIA_Engrom_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Engrom_PICKPOCKET);
	Info_AddChoice(DIA_Engrom_PICKPOCKET, DIALOG_BACK, DIA_Engrom_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Engrom_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Engrom_PICKPOCKET_DoIt);
};

func void DIA_Engrom_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Engrom_PICKPOCKET);
};

func void DIA_Engrom_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Engrom_PICKPOCKET);
};
