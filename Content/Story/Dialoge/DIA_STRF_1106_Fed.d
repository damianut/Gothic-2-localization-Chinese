///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Fed_EXIT(C_INFO)
{
	npc				= STRF_1106_Fed;
	nr				= 999;
	condition		= DIA_Fed_EXIT_Condition;
	information		= DIA_Fed_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Fed_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fed_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Fed_HALLO(C_INFO)
{
	npc				= STRF_1106_Fed;
	nr				= 2;
	condition		= DIA_Fed_HALLO_Condition;
	information		= DIA_Fed_HALLO_Info;
	important		= TRUE;
};

func int DIA_Fed_HALLO_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (MIS_Fajeth_Kill_Snapper != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Fed_HALLO_Info()
{
	AI_Output(self, other, "DIA_Fed_HALLO_08_00"); //你 想 从 我 这 里 得 到 些 什 么 ？ 我 哪 里 都 不 去 ！
	AI_Output(other, self, "DIA_Fed_HALLO_15_01"); //保 持 冷 静 ， 放 松 - 没 有 人 要 你 去 别 的 地 方 。
	AI_Output(self, other, "DIA_Fed_HALLO_08_02"); //感 谢 英 诺 斯 。 你 知 道 ， 最 近 几 天 以 来 ， 好 几 个 人 已 经 离 开 了 营 地 - 而 他 们 没 有 一 个 人 回 来 。
	AI_Output(self, other, "DIA_Fed_HALLO_08_03"); //他 们 都 被 暴 龙 吃 掉 了 ， 但 我 没 有 。 我 会 呆 在 原 地 一 直 到 这 一 切 都 结 束 。
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Fed_Snapper(C_INFO)
{
	npc				= STRF_1106_Fed;
	nr				= 3;
	condition		= DIA_Fed_Snapper_Condition;
	information		= DIA_Fed_Snapper_Info;
	description		= "关 于 那 些 暴 龙 你 了 解 什 么 ？";
};

func int DIA_Fed_Snapper_Condition()
{
	if (MIS_Fajeth_Kill_Snapper == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Fed_Snapper_Info()
{
	AI_Output(other, self, "DIA_Fed_Snapper_15_00"); //关 于 那 些 暴 龙 你 了 解 什 么 ？
	AI_Output(self, other, "DIA_Fed_Snapper_08_01"); //晚 上 比 尔 戈 特 看 到 了 它 们 。 有 几 个 去 了 那 座 黑 塔 下 面 的 池 子 那 里 。
	AI_Output(self, other, "DIA_Fed_Snapper_08_02"); //其 它 的 就 在 我 们 上 方 - 在 这 座 悬 崖 的 顶 上 。 它 们 只 是 在 等 着 我 们 全 都 变 得 筋 疲 力 尽 。
	AI_Output(self, other, "DIA_Fed_Snapper_08_03"); //我 们 被 困 在 这 里 了 。 很 快 它 们 就 会 来 攻 击 营 地 - 然 后 举 办 它 们 的 鲜 血 盛 宴 … …
	AI_Output(other, self, "DIA_Fed_Snapper_15_04"); //我 明 白 了 。
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Fed_Perm(C_INFO)
{
	npc				= STRF_1106_Fed;
	nr				= 5;
	condition		= DIA_Fed_Perm_Condition;
	information		= DIA_Fed_Perm_Info;
	permanent		= TRUE;
	description		= "你 还 好 吗 ？";
};

func int DIA_Fed_Perm_Condition()
{
	return TRUE;
};

func void DIA_Fed_Perm_Info()
{
	AI_Output(other, self, "DIA_Fed_Perm_15_00"); //你 还 好 吗 ?

	if (MIS_Fajeth_Kill_Snapper != LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Fed_Perm_08_01"); //那 些 暴 龙 就 在 那 里 。 你 能 闻 到 它 们 吗 … … ？ 我 能 闻 到 它 们 … …
	}
	else
	{
		AI_Output(self, other, "DIA_Fed_Perm_08_02"); //那 些 暴 龙 像 是 已 经 撤 退 了 。 不 过 ， 那 并 不 意 味 着 任 何 事 情 。 它 们 还 会 回 来 - 或 者 是 狼 、 或 者 是 蜥 蜴 、 或 者 是 兽 人 。
		AI_Output(self, other, "DIA_Fed_Perm_08_03"); //迟 早 它 们 会 抓 住 我 们 并 吃 掉 我 们 的 尸 体 … …
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Fed_PICKPOCKET(C_INFO)
{
	npc				= STRF_1106_Fed;
	nr				= 900;
	condition		= DIA_Fed_PICKPOCKET_Condition;
	information		= DIA_Fed_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Fed_PICKPOCKET_Condition()
{
	C_Beklauen(32, 8);
};

func void DIA_Fed_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fed_PICKPOCKET);
	Info_AddChoice(DIA_Fed_PICKPOCKET, DIALOG_BACK, DIA_Fed_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fed_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Fed_PICKPOCKET_DoIt);
};

func void DIA_Fed_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Fed_PICKPOCKET);
};

func void DIA_Fed_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fed_PICKPOCKET);
};
