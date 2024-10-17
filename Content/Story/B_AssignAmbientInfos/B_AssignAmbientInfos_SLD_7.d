// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_SLD_7_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_SLD_7_EXIT_Condition;
	information		= DIA_SLD_7_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_SLD_7_EXIT_Condition()
{
	return TRUE;
};

func void DIA_SLD_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
instance DIA_SLD_7_JOIN(C_INFO)
{
	nr				= 4;
	condition		= DIA_SLD_7_JOIN_Condition;
	information		= DIA_SLD_7_JOIN_Info;
	permanent		= TRUE;
	description		= "我 要 加 入 你 们 ！";
};

func int DIA_SLD_7_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_SLD_7_JOIN_Info()
{
	AI_Output(other, self, "DIA_SLD_7_JOIN_15_00"); //我 要 加 入 你 们 ！
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_SLD_7_JOIN_07_01"); //我 听 说 你 结 结 实 实 地 教 训 了 民 兵 一 顿 。 我 们 这 里 需 要 你 这 样 的 人 ！
	}
	else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_SLD_7_JOIN_07_02"); //我 没 觉 得 从 几 个 农 民 那 里 收 租 是 有 多 么 困 难 ， 不 过 如 果 欧 纳 尔 要 付 钱 让 你 做 那 些 事 的 话 ， 我 也 无 所 谓 。
	}
	else
	{
		AI_Output(self, other, "DIA_SLD_7_JOIN_07_03"); //你 ？ 一 旦 托 尔 洛 夫 让 你 参 加 测 试 ， 你 就 完 蛋 了 ， 你 这 无 能 的 家 伙 ！
	};
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
instance DIA_SLD_7_PEOPLE(C_INFO)
{
	nr				= 3;
	condition		= DIA_SLD_7_PEOPLE_Condition;
	information		= DIA_SLD_7_PEOPLE_Info;
	permanent		= TRUE;
	description		= "谁 主 管 这 里 ？";
};

func int DIA_SLD_7_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_SLD_7_PEOPLE_Info()
{
	AI_Output(other, self, "DIA_SLD_7_PEOPLE_15_00"); //谁 主 管 这 里 ？
	AI_Output(self, other, "DIA_SLD_7_PEOPLE_07_01"); //李 是 我 们 的 头 。 托 尔 洛 夫 是 他 的 左 右 手 。 大 部 分 人 跟 随 他 是 因 为 ， 以 前 在 流 放 地 的 时 候 他 就 是 他 们 的 首 领 。
	AI_Output(self, other, "DIA_SLD_7_PEOPLE_07_02"); //然 后 来 的 是 席 尔 维 欧 。 他 和 他 的 人 在 李 之 后 来 到 了 山 区 。
	AI_Output(self, other, "DIA_SLD_7_PEOPLE_07_03"); //他 和 他 的 人 只 是 雇 佣 兵 的 一 小 部 分 - 但 是 他 们 惹 了 很 多 的 麻 烦 。 那 些 家 伙 只 顾 自 己 。
	AI_Output(self, other, "DIA_SLD_7_PEOPLE_07_04"); //席 尔 维 欧 是 个 卑 劣 的 混 蛋 - 所 以 当 你 遇 到 他 的 时 候 要 当 心 。
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
instance DIA_SLD_7_LOCATION(C_INFO)
{
	nr				= 2;
	condition		= DIA_SLD_7_LOCATION_Condition;
	information		= DIA_SLD_7_LOCATION_Info;
	permanent		= TRUE;
	description		= "告 诉 关 于 农 场 的 事 。";
};

func int DIA_SLD_7_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_SLD_7_LOCATION_Info()
{
	AI_Output(other, self, "DIA_SLD_7_LOCATION_15_00"); //告 诉 关 于 农 场 的 事 。
	AI_Output(self, other, "DIA_SLD_7_LOCATION_07_01"); //欧 纳 尔 雇 佣 我 们 保 护 他 的 财 产 。
	if ((other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG))
	{
		AI_Output(self, other, "DIA_SLD_7_LOCATION_07_02"); //所 以 别 想 偷 任 何 东 西 或 者 殴 打 这 些 农 民 ， 否 则 你 就 惹 上 我 们 了 ， 明 白 吗 ？
	};
};

// *************************************************************************
// 									NEWS
// *************************************************************************
instance DIA_SLD_7_STANDARD(C_INFO)
{
	nr				= 1;
	condition		= DIA_SLD_7_STANDARD_Condition;
	information		= DIA_SLD_7_STANDARD_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 消 息 ？";
};

func int DIA_SLD_7_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_SLD_7_STANDARD_Info()
{
	AI_Output(other, self, "DIA_SLD_7_STANDARD_15_00"); //有 什 么 新 消 息 ？

	if (Kapitel <= 2)
	{
		if (EnterOW_Kapitel2 == FALSE)
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output(self, other, "DIA_SLD_7_STANDARD_07_01"); //自 从 你 加 入 我 们 之 后 ， 农 场 一 直 很 安 静 - 没 有 民 兵 。
			}
			else
			{
				AI_Output(self, other, "DIA_SLD_7_STANDARD_07_02"); //我 们 这 里 也 不 多 。 不 过 说 起 城 市 里 的 话 ， 我 想 他 们 连 蛆 都 吃 光 了 。 （ 大 笑 ）
			};
		}
		else
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output(self, other, "DIA_SLD_7_STANDARD_07_03"); //龙 在 矿 藏 山 谷 里 ！ 我 不 想 马 上 重 蹈 圣 骑 士 的 后 撤 。
				AI_Output(self, other, "DIA_SLD_7_STANDARD_07_04"); //我 想 国 王 如 果 知 道 哈 根 勋 爵 因 为 龙 的 问 题 而 空 手 而 归 的 话 ， 一 定 会 一 脚 踢 在 他 的 屁 股 上 。
			}
			else
			{
				AI_Output(self, other, "DIA_SLD_7_STANDARD_07_05"); //你 们 的 圣 骑 士 对 付 不 了 龙 ？ 那 说 明 - 战 斗 毕 竟 是 真 正 的 男 人 的 工 作 。
			};
		};
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			if ((hero.guild == GIL_SLD)
			|| (hero.guild == GIL_DJG))
			{
				AI_Output(self, other, "DIA_SLD_7_STANDARD_07_06"); //贝 尼 特 的 事 情 对 你 来 说 处 理 得 相 当 好 。 席 尔 维 欧 怒 气 激 昂 ， 他 很 想 袭 击 城 市 并 把 一 切 粉 碎 成 碎 片 。
				AI_Output(self, other, "DIA_SLD_7_STANDARD_07_07"); //他 总 想 强 迫 李 开 始 防 御 ， 而 贝 尼 特 正 好 提 供 了 一 个 借 口 。
			}
			else
			{
				AI_Output(self, other, "DIA_SLD_7_STANDARD_07_08"); //我 不 知 道 你 为 什 么 要 帮 助 贝 尼 特 ， 但 是 我 相 信 ， 这 样 做 对 城 市 是 有 好 处 的 。
			};
		}
		else
		{
			if ((hero.guild == GIL_SLD)
			|| (hero.guild == GIL_DJG))
			{
				AI_Output(self, other, "DIA_SLD_7_STANDARD_07_09"); //贝 尼 特 的 事 情 处 理 得 很 糟 糕 。 也 许 我 们 应 该 听 席 尔 维 欧 的 ， 进 攻 城 市 。
			}
			else
			{
				AI_Output(self, other, "DIA_SLD_7_STANDARD_07_10"); //你 打 算 怎 么 解 决 贝 尼 特 的 事 ？ 哦 ， 我 真 的 不 想 知 道 ， 你 很 快 就 能 发 现 事 态 是 如 何 发 展 的 。
			};
		};
	};

	if (Kapitel == 4)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output(self, other, "DIA_SLD_7_STANDARD_07_11"); //我 以 为 你 也 和 席 尔 维 欧 一 起 去 山 谷 了 。
			AI_Output(self, other, "DIA_SLD_7_STANDARD_07_12"); //如 果 席 尔 维 欧 留 在 山 谷 里 的 话 ， 我 们 没 人 会 在 意 。 永 远 ！
		}
		else
		{
			AI_Output(self, other, "DIA_SLD_7_STANDARD_07_13"); //你 相 当 勇 敢 ， 竟 然 独 自 一 人 到 达 这 里 。
			AI_Output(self, other, "DIA_SLD_7_STANDARD_07_14"); //但 是 我 不 在 乎 ， 只 要 你 不 再 收 取 任 何 的 税 金 。
		};
	};

	if (Kapitel >= 5)
	{
		AI_Output(self, other, "DIA_SLD_7_STANDARD_07_15"); //小 子 ， 我 再 也 忍 受 不 了 了 - 绵 羊 ， 牧 场 和 树 木 。 我 决 定 要 离 开 这 里 。
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_SLD_7(var C_Npc slf)
{
	DIA_SLD_7_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_SLD_7_JOIN.npc = Hlp_GetInstanceID(slf);
	DIA_SLD_7_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_SLD_7_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_SLD_7_STANDARD.npc = Hlp_GetInstanceID(slf);
};
