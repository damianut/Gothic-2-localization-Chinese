///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Rega_EXIT(C_INFO)
{
	npc				= BAU_933_Rega;
	nr				= 999;
	condition		= DIA_Rega_EXIT_Condition;
	information		= DIA_Rega_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Rega_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rega_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Rega_HALLO(C_INFO)
{
	npc				= BAU_933_Rega;
	nr				= 3;
	condition		= DIA_Rega_HALLO_Condition;
	information		= DIA_Rega_HALLO_Info;
	description		= "怎 么 样 了 ？";
};

func int DIA_Rega_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Rega_HALLO_Info()
{
	AI_Output(other, self, "DIA_Rega_HALLO_15_00"); //怎 么 样 了 ？

	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self, other, "DIA_Rega_HALLO_17_01"); //你 从 城 里 来 ， 不 是 吗 ？
	}
	else if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Rega_HALLO_17_02"); //你 是 欧 纳 尔 的 一 个 雇 佣 兵 ， 不 是 吗 ？
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Rega_HALLO_17_03"); //你 是 一 个 魔 法 师 ， 不 是 吗 ？
	}
	else
	{
		AI_Output(self, other, "DIA_Rega_HALLO_17_04"); //你 不 是 我 们 的 人 ， 嗯 ？
	};

	AI_Output(self, other, "DIA_Rega_HALLO_17_05"); //如 果 我 是 你 的 话 ， 我 就 离 开 这 里 。
	AI_Output(other, self, "DIA_Rega_HALLO_15_06"); //为 什 么 ？
	AI_Output(self, other, "DIA_Rega_HALLO_17_07"); //以 前 这 里 也 不 是 天 堂 ， 但 至 少 只 要 我 们 为 塞 柯 布 做 好 工 作 ， 就 相 安 无 事 。
	AI_Output(self, other, "DIA_Rega_HALLO_17_08"); //但 是 近 来 情 况 已 经 变 得 无 法 承 受 了 。
	if (Kapitel < 3)
	{
		AI_Output(self, other, "DIA_Rega_HALLO_17_09"); //强 盗 们 到 处 都 是 ， 旷 野 袭 击 者 破 坏 了 所 有 的 庄 稼 ， 而 且 地 主 变 得 十 分 不 讲 道 理 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info onar
///////////////////////////////////////////////////////////////////////
instance DIA_Rega_ONAR(C_INFO)
{
	npc				= BAU_933_Rega;
	nr				= 4;
	condition		= DIA_Rega_ONAR_Condition;
	information		= DIA_Rega_ONAR_Info;
	description		= "那 么 说 你 害 怕 地 主 ？";
};

func int DIA_Rega_ONAR_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Rega_HALLO))
	&& ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Rega_ONAR_Info()
{
	AI_Output(other, self, "DIA_Rega_ONAR_15_00"); //那 么 说 你 害 怕 地 主 ？
	AI_Output(self, other, "DIA_Rega_ONAR_17_01"); //真 的 。 如 果 地 主 不 想 再 看 到 某 些 人 ， 他 就 会 派 他 的 雇 佣 兵 去 找 他 们 ， 然 后 那 就 是 你 最 后 一 次 见 到 他 们 。
	AI_Output(self, other, "DIA_Rega_ONAR_17_02"); //所 以 我 们 宁 愿 闭 上 嘴 巴 。
};

///////////////////////////////////////////////////////////////////////
//	Info sld
///////////////////////////////////////////////////////////////////////
instance DIA_Rega_SLD(C_INFO)
{
	npc				= BAU_933_Rega;
	nr				= 5;
	condition		= DIA_Rega_SLD_Condition;
	information		= DIA_Rega_SLD_Info;
	description		= "雇 佣 兵 不 去 消 灭 那 些 旷 野 袭 击 者 ？";
};

func int DIA_Rega_SLD_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Rega_HALLO))
	&& ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Rega_SLD_Info()
{
	AI_Output(other, self, "DIA_Rega_SLD_15_00"); //雇 佣 兵 不 去 消 灭 那 些 旷 野 袭 击 者 ？
	AI_Output(self, other, "DIA_Rega_SLD_17_01"); //我 不 知 道 他 们 拿 钱 是 为 了 做 什 么 ， 但 显 然 不 是 为 了 帮 助 我 们 普 通 人 。
	AI_Output(self, other, "DIA_Rega_SLD_17_02"); //旷 野 袭 击 者 的 问 题 都 留 给 了 那 些 从 他 那 里 租 种 土 地 的 小 农 场 主 。
};

///////////////////////////////////////////////////////////////////////
//	Info banditen
///////////////////////////////////////////////////////////////////////
instance DIA_Rega_BANDITEN(C_INFO)
{
	npc				= BAU_933_Rega;
	nr				= 6;
	condition		= DIA_Rega_BANDITEN_Condition;
	information		= DIA_Rega_BANDITEN_Info;
	description		= "你 怎 么 保 护 自 己 抵 抗 强 盗 ？";
};

func int DIA_Rega_BANDITEN_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rega_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Rega_BANDITEN_Info()
{
	AI_Output(other, self, "DIA_Rega_BANDITEN_15_00"); //你 怎 么 保 护 自 己 抵 抗 强 盗 ？
	AI_Output(self, other, "DIA_Rega_BANDITEN_17_01"); //我 们 不 愿 意 。 我 们 就 逃 走 。 还 能 有 什 么 ？
};

///////////////////////////////////////////////////////////////////////
//	Info bronko
///////////////////////////////////////////////////////////////////////
instance DIA_Rega_BRONKO(C_INFO)
{
	npc				= BAU_933_Rega;
	nr				= 7;
	condition		= DIA_Rega_BRONKO_Condition;
	information		= DIA_Rega_BRONKO_Info;
	description		= "（ 询 问 有 关 布 隆 科 的 事 ）";
};

func int DIA_Rega_BRONKO_Condition()
{
	if (
	(Npc_KnowsInfo(other, DIA_Bronko_HALLO))
	&& (MIS_Sekob_Bronko_eingeschuechtert == LOG_RUNNING)
	)
	{
		return TRUE;
	};
};

func void DIA_Rega_BRONKO_Info()
{
	AI_Output(other, self, "DIA_Rega_BRONKO_15_00"); //那 么 谁 是 那 里 最 卑 鄙 的 人 ？
	AI_Output(self, other, "DIA_Rega_BRONKO_17_01"); //不 要 误 解 我 ， 但 是 我 不 想 卷 进 任 何 的 麻 烦 里 去 。 去 问 其 它 人 吧 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info permkap1
///////////////////////////////////////////////////////////////////////
instance DIA_Rega_PERMKAP1(C_INFO)
{
	npc				= BAU_933_Rega;
	nr				= 7;
	condition		= DIA_Rega_PERMKAP1_Condition;
	information		= DIA_Rega_PERMKAP1_Info;
	permanent		= TRUE;
	description		= "别 灰 心 。";
};

func int DIA_Rega_PERMKAP1_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rega_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Rega_PERMKAP1_Info()
{
	AI_Output(other, self, "DIA_Rega_PERMKAP1_15_00"); //别 灰 心 。

	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self, other, "DIA_Rega_PERMKAP1_17_01"); //你 说 起 来 非 常 简 单 。 毕 竟 你 住 在 城 里 。
	}
	else if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Rega_PERMKAP1_17_02"); //如 果 你 们 雇 佣 兵 不 是 这 么 让 人 难 以 忍 受 的 话 ， 其 它 一 切 事 情 不 会 都 这 样 糟 糕 。
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Rega_PERMKAP1_17_03"); //附 近 的 魔 法 师 越 来 越 少 ， 我 希 望 你 不 是 最 后 一 个 。 我 们 需 要 你 们 - 比 以 前 更 迫 切 。
	}
	else
	{
		AI_Output(self, other, "DIA_Rega_PERMKAP1_17_04"); //如 果 你 在 为 严 厉 的 监 工 塞 柯 布 工 作 的 话 ， 那 并 不 那 么 容 易 。
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Rega_PICKPOCKET(C_INFO)
{
	npc				= BAU_933_Rega;
	nr				= 900;
	condition		= DIA_Rega_PICKPOCKET_Condition;
	information		= DIA_Rega_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40_Female;
};

func int DIA_Rega_PICKPOCKET_Condition()
{
	C_Beklauen(25, 40);
};

func void DIA_Rega_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rega_PICKPOCKET);
	Info_AddChoice(DIA_Rega_PICKPOCKET, DIALOG_BACK, DIA_Rega_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rega_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Rega_PICKPOCKET_DoIt);
};

func void DIA_Rega_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Rega_PICKPOCKET);
};

func void DIA_Rega_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rega_PICKPOCKET);
};
