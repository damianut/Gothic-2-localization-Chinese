// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_OCVLK_6_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_OCVLK_6_EXIT_Condition;
	information		= DIA_OCVLK_6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_OCVLK_6_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OCVLK_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
instance DIA_OCVLK_6_PEOPLE(C_INFO)
{
	nr				= 3;
	condition		= DIA_OCVLK_6_PEOPLE_Condition;
	information		= DIA_OCVLK_6_PEOPLE_Info;
	permanent		= TRUE;
	description		= "谁 主 管 这 里 ？";
};

func int DIA_OCVLK_6_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_OCVLK_6_PEOPLE_Info()
{
	AI_Output(other, self, "DIA_OCVLK_6_PEOPLE_15_00"); //谁 主 管 这 里 ？
	AI_Output(self, other, "DIA_OCVLK_6_PEOPLE_06_01"); //加 隆 德 负 责 指 挥 整 个 要 塞 - 或 者 说 只 是 剩 下 的 部 分 。
	AI_Output(self, other, "DIA_OCVLK_6_PEOPLE_06_02"); //但 是 他 自 己 什 么 都 不 在 乎 - 除 非 是 在 他 的 人 陷 入 麻 烦 的 时 候 。
	if (Npc_IsDead(Engor) == FALSE)
	{
		AI_Output(self, other, "DIA_OCVLK_6_PEOPLE_06_03"); //如 果 你 想 要 装 备 ， 你 最 好 去 找 恩 高 尔 。 你 可 以 在 加 隆 德 对 面 的 房 子 里 找 到 他 。
	};
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
instance DIA_OCVLK_6_LOCATION(C_INFO)
{
	nr				= 2;
	condition		= DIA_OCVLK_6_LOCATION_Condition;
	information		= DIA_OCVLK_6_LOCATION_Info;
	permanent		= TRUE;
	description		= "关 于 矿 藏 山 谷 的 情 况 你 能 告 诉 我 些 什 么 ？";
};

func int DIA_OCVLK_6_LOCATION_Condition()
{
	if ((Kapitel <= 4)
	&& (MIS_KilledDragons < 4))
	{
		return TRUE;
	};
};

func void DIA_OCVLK_6_LOCATION_Info()
{
	AI_Output(other, self, "DIA_OCVLK_6_LOCATION_15_00"); //关 于 矿 藏 山 谷 的 情 况 你 能 告 诉 我 些 什 么 ？
	AI_Output(self, other, "DIA_OCVLK_6_LOCATION_06_01"); //我 在 担 心 兽 人 的 防 护 墙 。 我 甚 至 不 敢 去 想 兽 人 在 那 后 面 藏 的 是 什 么 。
	AI_Output(self, other, "DIA_OCVLK_6_LOCATION_06_02"); //首 先 他 们 只 有 很 少 的 人 - 他 们 建 起 了 那 堵 墙 。 然 后 ， 一 夜 之 间 ， 他 们 的 攻 城 机 械 出 现 了 。
	AI_Output(self, other, "DIA_OCVLK_6_LOCATION_06_03"); //我 们 很 幸 运 能 够 挡 住 他 们 的 攻 击 。
	AI_Output(self, other, "DIA_OCVLK_6_LOCATION_06_04"); //围 墙 后 面 是 大 海 ， 如 果 有 更 多 的 船 带 来 更 多 的 兽 人 的 话 ， 我 们 就 没 有 一 丝 机 会 了 。
};

// *************************************************************************
// 									NEWS
// *************************************************************************
instance DIA_OCVLK_6_STANDARD(C_INFO)
{
	nr				= 1;
	condition		= DIA_OCVLK_6_STANDARD_Condition;
	information		= DIA_OCVLK_6_STANDARD_Info;
	permanent		= TRUE;
	description		= "你 还 好 吗 ？";
};

func int DIA_OCVLK_6_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_OCVLK_6_STANDARD_Info()
{
	AI_Output(other, self, "DIA_OCVLK_6_STANDARD_15_00"); //你 还 好 吗 ？

	if (Kapitel <= 3)
	{
		AI_Output(self, other, "DIA_OCVLK_6_STANDARD_06_01"); //加 入 军 队 过 美 好 的 生 活 ， 这 是 他 们 曾 经 说 的 。 但 是 现 在 看 看 这 里？
		AI_Output(self, other, "DIA_OCVLK_6_STANDARD_06_02"); //现 在 禁 止 接 近 食 物 仓 库 ， 否 则 最 严 重 的 甚 至 会 叛 死 刑 。 加 隆 德 似 乎 害 怕 我 们 抢 了 食 物 以 后 跑 路 。 （ 痛 苦 地 笑 ）
		AI_Output(self, other, "DIA_OCVLK_6_STANDARD_06_03"); //如 果 那 些 讨 厌 的 龙 没 有 先 杀 死 我 们 的 话 ， 我 们 也 一 定 会 在 这 里 被 饿 死 ！
	};

	if (Kapitel == 4)
	{
		if (MIS_KilledDragons < 4)
		{
			AI_Output(self, other, "DIA_OCVLK_6_STANDARD_06_04"); //龙 猎 手 。 别 让 我 发 笑 了 ！ 他 们 什 么 事 也 改 变 不 了 。
		}
		else
		{
			AI_Output(self, other, "DIA_OCVLK_6_STANDARD_06_05"); //他 们 说 龙 已 经 全 部 被 杀 死 ！ 现 在 我 们 有 机 会 了 ！
		};
	};

	if (Kapitel >= 5)
	{
		if (MIS_OCGateOpen == FALSE)
		{
			AI_Output(self, other, "DIA_OCVLK_6_STANDARD_06_06"); //这 些 该 死 的 矿 石 。 我 们 应 该 把 全 部 的 矿 石 都 从 城 墙 上 扔 下 去 。 也 许 那 样 兽 人 就 会 安 静 地 离 开 。
		}
		else
		{
			AI_Output(self, other, "DIA_OCVLK_6_STANDARD_06_07"); //他 们 堆 在 入 口 前 的 那 些 可 笑 箱 子 根 本 无 法 阻 挡 兽 人 ！
		};
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_OCVLK_6(var C_Npc slf)
{
	DIA_OCVLK_6_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_OCVLK_6_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_OCVLK_6_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_OCVLK_6_STANDARD.npc = Hlp_GetInstanceID(slf);
};
