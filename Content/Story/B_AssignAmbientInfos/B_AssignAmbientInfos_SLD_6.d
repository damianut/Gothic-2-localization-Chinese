// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_SLD_6_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_SLD_6_EXIT_Condition;
	information		= DIA_SLD_6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_SLD_6_EXIT_Condition()
{
	return TRUE;
};

func void DIA_SLD_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
instance DIA_SLD_6_JOIN(C_INFO)
{
	nr				= 4;
	condition		= DIA_SLD_6_JOIN_Condition;
	information		= DIA_SLD_6_JOIN_Info;
	permanent		= TRUE;
	description		= "我 要 加 入 你 们 ！";
};

func int DIA_SLD_6_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_SLD_6_JOIN_Info()
{
	AI_Output(other, self, "DIA_SLD_6_JOIN_15_00"); //我 要 加 入 你 们 ！

	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_SLD_6_JOIN_06_01"); //我 已 经 听 说 那 件 关 于 民 兵 的 事 了 。 托 尔 洛 夫 说 你 已 经 通 过 了 测 试 。 你 已 经 得 到 了 我 的 一 票 。
	}
	else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_SLD_6_JOIN_06_02"); //骗 取 农 民 的 钱 财 是 一 回 事 ， 不 过 挑 战 民 兵 是 另 一 件 事 。 但 是 如 果 欧 纳 尔 用 你 的 话 ， 我 就 无 所 谓 了 。
	}
	else
	{
		AI_Output(self, other, "DIA_SLD_6_JOIN_06_03"); //去 和 托 尔 洛 夫 谈 。 他 会 教 你 的 … … （ 大 笑 ）
	};
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
instance DIA_SLD_6_PEOPLE(C_INFO)
{
	nr				= 3;
	condition		= DIA_SLD_6_PEOPLE_Condition;
	information		= DIA_SLD_6_PEOPLE_Info;
	permanent		= TRUE;
	description		= "谁 主 管 这 里 ？";
};

func int DIA_SLD_6_PEOPLE_Condition()
{
	if ((other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_SLD_6_PEOPLE_Info()
{
	AI_Output(other, self, "DIA_SLD_6_PEOPLE_15_00"); //谁 主 管 这 里 ？
	AI_Output(self, other, "DIA_SLD_6_PEOPLE_06_01"); //这 个 农 场 属 于 欧 纳 尔 ， 如 果 你 是 要 问 这 个 的 话 。 不 过 李 是 我 们 的 首 领 。
	AI_Output(self, other, "DIA_SLD_6_PEOPLE_06_02"); //他 曾 经 是 皇 家 军 队 的 一 名 将 军 ， 但 是 他 和 国 王 的 关 系 已 经 不 那 么 好 了 。 （ 大 笑 ）。
	AI_Output(self, other, "DIA_SLD_6_PEOPLE_06_03"); //记 住 他 的 名 字 。 如 果 你 在 这 里 卷 入 麻 烦 之 中 的 话 ， 他 也 许 是 唯 一 一 个 能 解 决 问 题 的 人 。 其 它 的 人 只 会 剥 下 你 的 皮 。
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
instance DIA_SLD_6_LOCATION(C_INFO)
{
	nr				= 2;
	condition		= DIA_SLD_6_LOCATION_Condition;
	information		= DIA_SLD_6_LOCATION_Info;
	permanent		= TRUE;
	description		= "你 在 保 护 那 些 农 民 ？";
};

func int DIA_SLD_6_LOCATION_Condition()
{
	if ((other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_SLD_6_LOCATION_Info()
{
	AI_Output(other, self, "DIA_SLD_6_LOCATION_15_00"); //你 在 保 护 那 些 农 民 ？
	AI_Output(self, other, "DIA_SLD_6_LOCATION_06_01"); //我 们 保 护 的 不 仅 仅 是 欧 纳 尔 的 农 场 ， 而 是 这 里 的 整 个 山 谷 。
	AI_Output(self, other, "DIA_SLD_6_LOCATION_06_02"); //欧 纳 尔 要 我 们 严 惩 任 何 在 这 里 惹 麻 烦 的 人 。 所 以 你 要 表 现 好 点 。
};

// *************************************************************************
// 									NEWS
// *************************************************************************
instance DIA_SLD_6_STANDARD(C_INFO)
{
	nr				= 1;
	condition		= DIA_SLD_6_STANDARD_Condition;
	information		= DIA_SLD_6_STANDARD_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 鲜 事 吗 ？";
};

func int DIA_SLD_6_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_SLD_6_STANDARD_Info()
{
	AI_Output(other, self, "DIA_SLD_6_STANDARD_15_00"); //什么事 ?

	if (Kapitel <= 2)
	{
		if (EnterOW_Kapitel2 == FALSE)
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output(self, other, "DIA_SLD_6_STANDARD_06_01"); //你 现 在 是 我 们 一 员 了 ， 小 子 ！
			}
			else
			{
				AI_Output(self, other, "DIA_SLD_6_STANDARD_06_02"); //你 想 要 什 么 ？
			};
		}
		else
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output(self, other, "DIA_SLD_6_STANDARD_06_03"); //当 我 听 说 龙 的 时 候 ， 起 初 我 简 直 无 法 相 信 。
				AI_Output(self, other, "DIA_SLD_6_STANDARD_06_04"); //一 条 龙 - 那 是 我 应 该 去 挑 战 的 家 伙 。 不 再 是 绵 羊 或 者 愚 蠢 的 民 兵 ， 这 次 是 一 个 真 正 的 对 手 。
			}
			else
			{
				AI_Output(self, other, "DIA_SLD_6_STANDARD_06_05"); //嗯 ， 你 的 哈 根 勋 爵 在 听 说 龙 的 事 情 之 后 有 没 有 吓 得 尿 裤 子 吧 ？
				AI_Output(self, other, "DIA_SLD_6_STANDARD_06_06"); //看 来 现 在 他 必 须 要 把 他 高 贵 的 身 影 从 城 市 挪 开 了 。
			};
		};
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output(self, other, "DIA_SLD_6_STANDARD_06_07"); //算 哈 根 勋 爵 走 运 。 再 过 几 天 ， 我 们 会 自 己 把 贝 尼 特 从 那 里 救 出 来 。
		}
		else
		{
			AI_Output(self, other, "DIA_SLD_6_STANDARD_06_08"); //如 果 他 们 不 尽 快 把 贝 尼 特 释 放 的 话 ， 我 们 就 会 进 去 救 他 。
		};
	};

	if (Kapitel == 4)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output(self, other, "DIA_SLD_6_STANDARD_06_09"); //你 还 在 这 里 做 什 么 ？ 你 没 有 和 其 它 人 一 起 去 山 谷 ？。
			AI_Output(self, other, "DIA_SLD_6_STANDARD_06_10"); //我 不 管 你 回 来 的 理 由 。
		}
		else
		{
			AI_Output(self, other, "DIA_SLD_6_STANDARD_06_11"); //你 应 该 去 矿 藏 山 谷 ， 我 听 说 那 些 可 怜 的 混 蛋 需 要 一 切 能 用 上 的 人 。
		};
	};

	if (Kapitel >= 5)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output(self, other, "DIA_SLD_6_STANDARD_06_12"); //当 你 出 现 在 这 里 的 时 候 ， 我 就 知 道 你 会 把 这 里 弄 得 一 团 糟 。
			AI_Output(self, other, "DIA_SLD_6_STANDARD_06_13"); //但 是 龙 ？ 那 真 不 简 单 。 很 快 就 不 会 有 人 再 向 你 挑 战 了 。
		}
		else
		{
			AI_Output(self, other, "DIA_SLD_6_STANDARD_06_14"); //我 非 常 震 惊 。 你 站 到 了 错 误 的 一 边 ， 但 是 杀 龙 仍 旧 是 无 比 的 壮 举 。
		};
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_SLD_6(var C_Npc slf)
{
	DIA_SLD_6_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_SLD_6_JOIN.npc = Hlp_GetInstanceID(slf);
	DIA_SLD_6_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_SLD_6_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_SLD_6_STANDARD.npc = Hlp_GetInstanceID(slf);
};
