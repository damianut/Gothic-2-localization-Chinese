// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Addon_BL_BDT_13_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_Addon_BL_BDT_13_EXIT_Condition;
	information		= DIA_Addon_BL_BDT_13_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_BL_BDT_13_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_13_EXIT_Info()
{
	BDT_13_Nerver = 0;

	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									Chef
// *************************************************************************
instance DIA_Addon_BL_BDT_13_Chef(C_INFO)
{
	nr				= 2;
	condition		= DIA_Addon_BL_BDT_13_Chef_Condition;
	information		= DIA_Addon_BL_BDT_13_Chef_Info;
	permanent		= TRUE;
	description		= "谁 主 管 这 里 ？";
};

func int DIA_Addon_BL_BDT_13_Chef_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_13_Chef_Info()
{
	AI_Output(other, self, "DIA_Addon_BL_BDT_13_Chef_15_00"); //谁 主 管 这 里 ？

	if (RavenIsDead == TRUE)
	{
		if (Npc_IsDead(Thorus))
		{
			AI_Output(self, other, "DIA_Addon_BL_BDT_13_Chef_13_01"); //（ 欢 呼 ） 我 们 光 荣 的 首 领 托 鲁 斯 。 他 会 让 我 们 大 家 都 发 财 ！
		}
		else
		{
			AI_Output(self, other, "DIA_Addon_BL_BDT_13_Chef_13_02"); //我 们 光 荣 的 首 领 … … 呃 … … 不 知 道 … …
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_BL_BDT_13_Chef_13_03"); //（ 欢 呼 ） 我 们 光 荣 的 首 领 瑞 雯 。 他 会 让 我 们 大 家 都 发 财 ！
	};
};

// *************************************************************************
// 									Lager
// *************************************************************************
instance DIA_Addon_BL_BDT_13_Lager(C_INFO)
{
	nr				= 3;
	condition		= DIA_Addon_BL_BDT_13_Lager_Condition;
	information		= DIA_Addon_BL_BDT_13_Lager_Info;
	permanent		= TRUE;
	description		= "关 于 营 地 你 知 道 什 么 ？";
};

func int DIA_Addon_BL_BDT_13_Lager_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_13_Lager_Info()
{
	AI_Output(other, self, "DIA_Addon_BL_BDT_13_Lager_15_00"); //关 于 营 地 你 知 道 什 么 ？
	AI_Output(self, other, "DIA_Addon_BL_BDT_13_Lager_13_01"); //如 果 你 需 要 的 是 信 息 ， 那 就 去 找 斯 耐 夫 。 那 个 胖 厨 师 知 道 很 多 。
	AI_Output(self, other, "DIA_Addon_BL_BDT_13_Lager_13_02"); //如 果 你 想 买 什 么 东 西 的 话 ， 去 找 费 斯 克 。 他 有 各 种 各 样 的 东 西 … …
};

// *************************************************************************
// 								News
// *************************************************************************
instance DIA_Addon_BL_BDT_13_News(C_INFO)
{
	nr				= 4;
	condition		= DIA_Addon_BL_BDT_13_News_Condition;
	information		= DIA_Addon_BL_BDT_13_News_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 的 吗 ？";
};

func int DIA_Addon_BL_BDT_13_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_13_News_Info()
{
	AI_Output(other, self, "DIA_Addon_BL_BDT_13_News_15_00"); //有 什 么 新 的 吗 ？

	if (RavenIsDead == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_BL_BDT_13_News_13_01"); //瑞 雯 死 了 。 现 在 我 们 永 远 无 法 离 开 这 个 岛 了 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_BL_BDT_13_News_13_02"); //海 盗 们 已 经 出 航 离 开 了 。
		AI_Output(self, other, "DIA_Addon_BL_BDT_13_News_13_03"); //现 在 只 有 一 群 白 痴 坐 在 海 滩 上 ， 他 们 没 有 一 条 象 样 的 船 。
		AI_Output(self, other, "DIA_Addon_BL_BDT_13_News_13_04"); //即 使 贝 利 尔 也 不 知 道 我 们 该 怎 么 离 开 这 个 岛 。
	};
};

// *************************************************************************
// 									Gold
// *************************************************************************
instance DIA_Addon_BL_BDT_13_Gold(C_INFO)
{
	nr				= 5;
	condition		= DIA_Addon_BL_BDT_13_Gold_Condition;
	information		= DIA_Addon_BL_BDT_13_Gold_Info;
	permanent		= TRUE;
	description		= "我 怎 么 才 能 迅 速 得 到 大 量 的 金 币 ？";
};

func int DIA_Addon_BL_BDT_13_Gold_Condition()
{
	if ((MIS_Send_Buddler != LOG_RUNNING)
	|| (MIS_Send_Buddler != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_BL_BDT_13_Gold_Info()
{
	BDT_13_Nerver = (BDT_13_Nerver + 1);

	AI_Output(other, self, "DIA_Addon_BL_BDT_13_Gold_15_00"); //我 怎 么 才 能 迅 速 得 到 大 量 的 金 币 ？

	if (BDT_13_Nerver <= 2)
	{
		AI_Output(self, other, "DIA_Addon_BL_BDT_13_Gold_13_01"); //问 得 好 。 我 们 不 是 因 为 那 个 才 来 这 里 的 吗 ？
		AI_Output(self, other, "DIA_Addon_BL_BDT_13_Gold_13_02"); //只 要 你 从 托 鲁 斯 那 里 拿 到 红 石 头 ， 你 就 能 进 入 矿 坑 。
	}
	else if (BDT_13_Kill == FALSE)
	{
		BDT_13_Nerver = 0;
		BDT_13_Kill = TRUE;
		AI_Output(self, other, "DIA_Addon_BL_BDT_13_Gold_13_03"); //嘿 ， 你 是 在 耍 我 吗 ？ 滚 开 ！
		AI_StopProcessInfos(self);
	}
	else
	{
		BDT_13_Nerver = 0;
		AI_Output(self, other, "DIA_Addon_BL_BDT_13_Gold_13_04"); //别 逗 乐 子 了 ！
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_NONE, 1);
	};
};

func void B_AssignAmbientInfos_Addon_BL_BDT_13(var C_Npc slf)
{
	DIA_Addon_BL_BDT_13_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_Chef.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_Lager.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_News.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_Gold.npc = Hlp_GetInstanceID(slf);
};
