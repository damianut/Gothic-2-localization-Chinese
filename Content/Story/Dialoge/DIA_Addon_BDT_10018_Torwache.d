// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Addon_BDT_10018_Torwache_EXIT(C_INFO)
{
	npc				= BDT_10018_Addon_Torwache;
	nr				= 999;
	condition		= DIA_Addon_BDT_10018_Torwache_EXIT_Condition;
	information		= DIA_Addon_BDT_10018_Torwache_EXIT_Info;
	permanent		= TRUE;
	description		= "我 们 要 再 谈 谈 。 ( 结 束 )";
};

func int DIA_Addon_BDT_10018_Torwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_BDT_10018_Torwache_EXIT_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10018_Torwache_EXIT_15_00"); //我 们 要 再 谈 谈 。

	if (BDT_100018_Einmal == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_BDT_10018_Torwache_EXIT_04_01"); //那 你 已 经 知 道 我 会 告 诉 你 什 么 … …
		BDT_100018_Einmal = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_BDT_10018_Torwache_EXIT_04_02"); //走 开 。
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
const string BDT_10018_Checkpoint = "BL_RAVEN_CHECK";
// -----------------------------------------------------------
instance DIA_Addon_BDT_10018_Torwache_FirstWarn(C_INFO)
{
	npc				= BDT_10018_Addon_Torwache;
	nr				= 1;
	condition		= DIA_Addon_BDT_10018_Torwache_FirstWarn_Condition;
	information		= DIA_Addon_BDT_10018_Torwache_FirstWarn_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_BDT_10018_Torwache_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, BDT_10018_Checkpoint) <= 700) // NICHT von hinten!
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

func void DIA_Addon_BDT_10018_Torwache_FirstWarn_Info()
{
	if (BDT_100018_Tells == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_BDT_10018_Torwache_FirstWarn_04_00"); //嘿 ， 慢 点 ！ 你 不 能 进 那 里 - 所 以 走 开 ！
		AI_Output(other, self, "DIA_Addon_BDT_10018_Torwache_FirstWarn_15_01"); //别 挡 我 的 路 - 我 必 须 见 瑞 雯 。
		AI_Output(self, other, "DIA_Addon_BDT_10018_Torwache_FirstWarn_04_02"); //禁 止 任 何 人 进 入 这 些 房 间 。 瑞 雯 本 人 下 达 的 直 接 命 令 。
		BDT_100018_Tells = TRUE;

		Log_CreateTopic(Topic_Addon_Tempel, LOG_MISSION);
		Log_SetTopicStatus(Topic_Addon_Tempel, LOG_RUNNING);
		B_LogEntry(Topic_Addon_Tempel, Topic_Addon_Tempel_3);
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_BDT_10018_Torwache_FirstWarn_04_03"); //又 是 你 ？ 你 正 在 激 怒 我 ！
		// AI_StopProcessInfos(self);
	};

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other, BDT_10018_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************
instance DIA_Addon_BDT_10018_Torwache_SecondWarn(C_INFO)
{
	npc				= BDT_10018_Addon_Torwache;
	nr				= 2;
	condition		= DIA_Addon_BDT_10018_Torwache_SecondWarn_Condition;
	information		= DIA_Addon_BDT_10018_Torwache_SecondWarn_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_BDT_10018_Torwache_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE)
	&& (Npc_GetDistToWP(other, BDT_10018_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Addon_BDT_10018_Torwache_SecondWarn_Info()
{
	AI_Output(self, other, "DIA_Addon_BDT_10018_Torwache_SecondWarn_04_00"); //再 向 前 迈 一 步 的 话 ， 那 就 是 你 最 后 一 步 了 ！

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other, BDT_10018_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;

	AI_StopProcessInfos(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************
instance DIA_Addon_BDT_10018_Torwache_Attack(C_INFO)
{
	npc				= BDT_10018_Addon_Torwache;
	nr				= 3;
	condition		= DIA_Addon_BDT_10018_Torwache_Attack_Condition;
	information		= DIA_Addon_BDT_10018_Torwache_Attack_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_BDT_10018_Torwache_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE)
	&& (Npc_GetDistToWP(other, BDT_10018_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Addon_BDT_10018_Torwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE; // wird auch in ZS_Attack resettet

	AI_Output(self, other, "DIA_Addon_BDT_10018_Torwache_Attack_04_00"); //为 了 瑞 雯 ！

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_GuardStopsIntruder, 0);
};

// ----------------------------------------------------------------------
//	Info Wichtig
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10018_Torwache_Hi(C_INFO)
{
	npc				= BDT_10018_Addon_Torwache;
	nr				= 2;
	condition		= DIA_Addon_10018_Torwache_Hi_Condition;
	information		= DIA_Addon_10018_Torwache_Hi_Info;
	description		= "抓 住 他 对 我 来 说 非 常 重 要 。";
};

func int DIA_Addon_10018_Torwache_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10018_Torwache_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10018_Torwache_Hi_15_00"); //抓 住 他 对 我 来 说 非 常 重 要 。
	AI_Output(self, other, "DIA_Addon_BDT_10018_Torwache_Hi_04_01"); //不 。 不 是 。 只 有 布 拉 德 维 恩 有 权 在 那 里 停 留 。

	B_LogEntry(Topic_Addon_Tempel, Topic_Addon_Tempel_4);
};

// ----------------------------------------------------------------------
//	Info Bloodwyn
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10018_Torwache_Bloodwyn(C_INFO)
{
	npc				= BDT_10018_Addon_Torwache;
	nr				= 2;
	condition		= DIA_Addon_10018_Torwache_Bloodwyn_Condition;
	information		= DIA_Addon_10018_Torwache_Bloodwyn_Info;
	description		= "布 拉 德 维 恩 ？ 他 不 是 已 经 死 了 吗 ？";
};

func int DIA_Addon_10018_Torwache_Bloodwyn_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_BDT_10018_Torwache_Hi)
	&& !Npc_IsDead(Bloodwyn))
	{
		return TRUE;
	};
};

func void DIA_Addon_10018_Torwache_Bloodwyn_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10018_Torwache_Bloodwyn_15_00"); //布 拉 德 维 恩 ？ 他 不 是 已 经 死 了 吗 ？
	AI_Output(self, other, "DIA_Addon_BDT_10018_Torwache_Bloodwyn_04_01"); //他 比 以 前 更 强 壮 。 如 果 他 发 现 有 人 在 这 里 惹 麻 烦 ， 他 会 把 你 剁 成 碎 片 。
};

// ----------------------------------------------------------------------
//	Info Bribe
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10018_Torwache_Bribe(C_INFO)
{
	npc				= BDT_10018_Addon_Torwache;
	nr				= 9;
	condition		= DIA_Addon_10018_Torwache_Bribe_Condition;
	information		= DIA_Addon_10018_Torwache_Bribe_Info;
	description		= "如 果 你 让 我 进 去 的 话 ， 我 就 给 你 一 千 金 币 。";
};

func int DIA_Addon_10018_Torwache_Bribe_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_BDT_10018_Torwache_Hi)
	&& !Npc_IsDead(Bloodwyn))
	{
		return TRUE;
	};
};

func void DIA_Addon_10018_Torwache_Bribe_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10018_Torwache_Bribe_15_00"); //如 果 你 让 我 进 去 的 话 ， 我 就 给 你 一 千 金 币 。
	AI_Output(self, other, "DIA_Addon_BDT_10018_Torwache_Bribe_04_01"); //你 在 浪 费 你 的 时 间 ， 笨 蛋 。
};

// ----------------------------------------------------------------------
//	Info Drin
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10018_Torwache_Drin(C_INFO)
{
	npc				= BDT_10018_Addon_Torwache;
	nr				= 90;
	condition		= DIA_Addon_10018_Torwache_Drin_Condition;
	information		= DIA_Addon_10018_Torwache_Drin_Info;
	description		= "布 拉 德 维 恩 在 那 里 ？ 那 就 把 它 弄 出 来 。 ";
};

func int DIA_Addon_10018_Torwache_Drin_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_BDT_10018_Torwache_Hi)
	&& !Npc_IsDead(Bloodwyn))
	{
		return TRUE;
	};
};

func void DIA_Addon_10018_Torwache_Drin_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10018_Torwache_Drin_15_00"); //布 拉 德 维 恩 在 那 里 ？ 那 就 把 它 弄 出 来 。
	AI_Output(self, other, "DIA_Addon_BDT_10018_Torwache_Drin_04_01"); //哈 ！ 你 真 的 相 信 我 会 那 么 做 ？
	AI_Output(self, other, "DIA_Addon_BDT_10018_Torwache_Drin_04_02"); //也 许 你 现 在 是 营 地 里 一 个 重 要 人 物 。 但 是 你 的 特 权 到 此 为 止 。 明 白 吗 ？
	AI_Output(self, other, "DIA_Addon_BDT_10018_Torwache_Drin_04_03"); //要 么 去 矿 井 挖 金 子 ， 要 么 做 点 别 的 事 情 - 但 是 别 挡 在 路 上 ！

	MIS_BloodwynRaus = LOG_RUNNING;

	B_LogEntry(Topic_Addon_Tempel, Topic_Addon_Tempel_5);
};

// ----------------------------------------------------------------------
//	Info kopf
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10018_Torwache_kopf(C_INFO)
{
	npc				= BDT_10018_Addon_Torwache;
	nr				= 90;
	condition		= DIA_Addon_10018_Torwache_kopf_Condition;
	information		= DIA_Addon_10018_Torwache_kopf_Info;
	description		= "（ 出 示 布 拉 德 维 恩 的 头 ）";
};

func int DIA_Addon_10018_Torwache_kopf_Condition()
{
	if (Npc_HasItems(other, ItMi_Addon_Bloodwyn_Kopf) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Addon_10018_Torwache_kopf_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10018_Torwache_kopf_15_00"); //嘿 ！ 你 现 在 还 想 阻 止 我 吗 ！ ？
	AI_Output(self, other, "DIA_Addon_BDT_10018_Torwache_kopf_04_01"); //那 是 … … 那 是 … … 布 拉 德 维 恩 ？ … … 啊 ， 那 是 … …
	AI_Output(self, other, "DIA_Addon_BDT_10018_Torwache_kopf_04_02"); //呃 … … 对 ， 呃 ， 不 。 我 是 说 … … 呃 … … 你 可 以 进 去 … …

	MIS_BloodwynRaus = LOG_SUCCESS;

	self.aivar[AIV_PASSGATE] = TRUE;
	AI_StopProcessInfos(self);
};
