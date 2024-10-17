// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_PAL_12_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_PAL_12_EXIT_Condition;
	information		= DIA_PAL_12_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_PAL_12_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_12_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
instance DIA_PAL_12_JOIN(C_INFO)
{
	nr				= 4;
	condition		= DIA_PAL_12_JOIN_Condition;
	information		= DIA_PAL_12_JOIN_Info;
	permanent		= TRUE;
	description		= "我 要 成 为 一 个 圣 骑 士 ！";
};

func int DIA_PAL_12_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_PAL_12_JOIN_Info()
{
	AI_Output(other, self, "DIA_PAL_12_JOIN_15_00"); //我 要 成 为 一 个 圣 骑 士 ！
	AI_Output(self, other, "DIA_PAL_12_JOIN_12_01"); //你 ？ 别 逗 我 笑 ！ 你 甚 至 连 城 市 卫 兵 的 成 员 都 不 是 。
	AI_Output(self, other, "DIA_PAL_12_JOIN_12_02"); //如 果 我 没 有 清 楚 地 看 清 你 是 这 样 的 乡 巴 佬 的 话 ， 我 一 定 会 以 为 你 是 在 侮 辱 我 。
	AI_Output(self, other, "DIA_PAL_12_JOIN_12_03"); //只 有 我 们 这 些 国 王 和 神 英 诺 斯 虔 诚 的 追 随 者 之 中 最 出 色 的 人 才 能 成 为 圣 骑 士 。
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
instance DIA_PAL_12_PEOPLE(C_INFO)
{
	nr				= 3;
	condition		= DIA_PAL_12_PEOPLE_Condition;
	information		= DIA_PAL_12_PEOPLE_Info;
	permanent		= TRUE;
	description		= "谁 是 这 里 的 负 责 人？";
};

func int DIA_PAL_12_PEOPLE_Condition()
{
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_PAL_12_PEOPLE_Info()
{
	AI_Output(other, self, "DIA_PAL_12_PEOPLE_15_00"); //谁 是 这 里 的 负 责 人？
	AI_Output(self, other, "DIA_PAL_12_PEOPLE_12_01"); //尊 敬 的 哈 根 勋 爵 。 安 德 烈 勋 爵 负 责 所 有 那 些 出 身 低 微 的 家 伙 相 关 的 事 宜 。
	AI_Output(self, other, "DIA_PAL_12_PEOPLE_12_02"); //你 可 以 在 兵 营 找 到 他 。 也 许 你 足 够 幸 运 ， 他 可 能 会 在 你 身 上 花 费 一 些 宝 贵 的 时 间 。
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
instance DIA_PAL_12_LOCATION(C_INFO)
{
	nr				= 2;
	condition		= DIA_PAL_12_LOCATION_Condition;
	information		= DIA_PAL_12_LOCATION_Info;
	permanent		= TRUE;
	description		= "你 们 圣 骑 士 在 克 霍 里 尼 斯 这 里 做 什 么 ？";
};

func int DIA_PAL_12_LOCATION_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_PAL_12_LOCATION_Info()
{
	AI_Output(other, self, "DIA_PAL_12_LOCATION_15_00"); //你 们 圣 骑 士 在 克 霍 里 尼 斯 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_PAL_12_LOCATION_12_01"); //问 那 样 的 问 题 的 人 ， 会 在 他 们 弄 明 白 之 前 被 挂 在 绞 架 上 绞 死 。
	AI_Output(self, other, "DIA_PAL_12_LOCATION_12_02"); //如 果 有 一 件 事 安 德 烈 勋 爵 无 法 承 受 的 话 ， 就 是 让 我 们 的 任 务 的 相 关 信 息 落 到 间 谍 的 手 里 。
	AI_Output(self, other, "DIA_PAL_12_LOCATION_12_03"); //所 以 ， 你 最 好 留 神 你 问 的 问 题 。
};

// *************************************************************************
// 									NEWS
// *************************************************************************
instance DIA_PAL_12_STANDARD(C_INFO)
{
	nr				= 1;
	condition		= DIA_PAL_12_STANDARD_Condition;
	information		= DIA_PAL_12_STANDARD_Info;
	permanent		= TRUE;
	description		= "最 近 怎 么 样 ？";
};

func int DIA_PAL_12_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_PAL_12_STANDARD_Info()
{
	AI_Output(other, self, "DIA_PAL_12_STANDARD_15_00"); //最 近 怎 么 样 ？

	if ((other.guild == GIL_PAL)
	|| (other.guild == GIL_KDF))
	{
		if (Kapitel <= 4)
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self, other, "DIA_PAL_12_STANDARD_12_01"); //既 然 我 们 知 道 要 对 付 的 是 龙 ， 我 们 的 指 挥 官 当 然 会 很 快 做 些 什 么 的 。
			}
			else
			{
				AI_Output(self, other, "DIA_PAL_12_STANDARD_12_02"); //我 们 还 没 收 到 任 何 矿 藏 山 谷 特 遣 队 的 消 息 。 这 太 令 人 担 忧 了 。
			};
		};

		if (Kapitel >= 5)
		{
			AI_Output(self, other, "DIA_PAL_12_STANDARD_12_03"); //感 谢 英 诺 斯 ！ 龙 的 威 胁 已 经 消 除 了 。 现 在 我 们 只 要 解 决 那 些 兽 人 并 拿 到 矿 石 。
		};
	}
	else // KEIN Paladin
	{
		AI_Output(self, other, "DIA_PAL_12_STANDARD_12_04"); //你 不 是 真 的 想 要 我 回 答 那 个 问 题 吧 ， 小 子 ！
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_PAL_12(var C_Npc slf)
{
	DIA_PAL_12_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_PAL_12_JOIN.npc = Hlp_GetInstanceID(slf);
	DIA_PAL_12_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_PAL_12_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_PAL_12_STANDARD.npc = Hlp_GetInstanceID(slf);
};
