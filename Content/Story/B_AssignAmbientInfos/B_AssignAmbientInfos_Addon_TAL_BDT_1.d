// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Addon_TAL_BDT_1_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_Addon_TAL_BDT_1_EXIT_Condition;
	information		= DIA_Addon_TAL_BDT_1_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_TAL_BDT_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 							Hi
// *************************************************************************
instance DIA_Addon_TAL_BDT_1_Hi(C_INFO)
{
	nr				= 2;
	condition		= DIA_Addon_TAL_BDT_1_Hi_Condition;
	information		= DIA_Addon_TAL_BDT_1_Hi_Info;
	permanent		= TRUE;
	description		= "怎 么 样 了 ？";
};

func int DIA_Addon_TAL_BDT_1_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_TAL_BDT_1_Hi_15_00"); //怎 么 样 了 ？
	AI_Output(self, other, "DIA_Addon_TAL_BDT_1_Hi_01_01"); //我 在 等 他 们 招 收 新 人 ， 该 轮 到 我 了 。
	if (!Npc_IsDead(Franco))
	{
		AI_Output(self, other, "DIA_Addon_TAL_BDT_1_Hi_01_02"); //外 面 所 有 这 些 人 里 ， 只 有 佛 朗 哥 能 进 去 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_TAL_BDT_1_Hi_01_03"); //现 在 那 个 佛 朗 哥 死 了 ， 我 很 有 希 望 得 到 更 好 的 机 会 。
	};
};

// *************************************************************************
// 							Lager
// *************************************************************************
instance DIA_Addon_TAL_BDT_1_Lager(C_INFO)
{
	nr				= 3;
	condition		= DIA_Addon_TAL_BDT_1_Lager_Condition;
	information		= DIA_Addon_TAL_BDT_1_Lager_Info;
	permanent		= TRUE;
	description		= "关 于 营 地 你 能 告 诉 我 些 什 么 ？";
};

func int DIA_Addon_TAL_BDT_1_Lager_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_Lager_Info()
{
	AI_Output(other, self, "DIA_Addon_TAL_BDT_1_Lager_15_00"); //关 于 营 地 你 能 告 诉 我 些 什 么 ？
	AI_Output(self, other, "DIA_Addon_TAL_BDT_1_Lager_01_01"); //要 注 意 你 在 和 谁 争 吵 ！ 如 果 你 毫 无 理 由 的 打 架 ， 他 们 会 一 起 反 对 你 ！
	AI_Output(self, other, "DIA_Addon_TAL_BDT_1_Lager_01_02"); //他 们 大 多 数 人 都 十 分 在 意 他 们 的 金 子 ， 还 有 一 些 人 都 在 互 相 戒 备 。
};

// *************************************************************************
// 							News
// *************************************************************************
instance DIA_Addon_TAL_BDT_1_Raven(C_INFO)
{
	nr				= 4;
	condition		= DIA_Addon_TAL_BDT_1_Raven_Condition;
	information		= DIA_Addon_TAL_BDT_1_Raven_Info;
	permanent		= TRUE;
	description		= "你 都 知 道 关 于 瑞 雯 的 什 么 事 情 ？";
};

func int DIA_Addon_TAL_BDT_1_Raven_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_Raven_Info()
{
	AI_Output(other, self, "DIA_Addon_TAL_BDT_1_Raven_15_00"); //你 都 知 道 关 于 瑞 雯 的 什 么 事 情 ？
	AI_Output(self, other, "DIA_Addon_TAL_BDT_1_Raven_01_01"); //他 是 和 他 的 人 最 早 一 起 出 现 在 这 里 的 。
	AI_Output(self, other, "DIA_Addon_TAL_BDT_1_Raven_01_02"); //他 是 营 地 的 首 领 。 你 不 会 弄 错 的 ， 我 来 告 诉 你 。
	AI_Output(self, other, "DIA_Addon_TAL_BDT_1_Raven_01_03"); //有 一 次 他 们 要 了 五 个 新 人 ， 因 为 他 要 把 怒 气 发 到 了 自 己 人 身 上 。
};

func void B_AssignAmbientInfos_Addon_TAL_BDT_1(var C_Npc slf)
{
	DIA_Addon_TAL_BDT_1_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_1_HI.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_1_Lager.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_1_Raven.npc = Hlp_GetInstanceID(slf);
};
