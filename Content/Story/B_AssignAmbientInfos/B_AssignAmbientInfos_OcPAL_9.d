// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_OCPAL_9_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_OCPAL_9_EXIT_Condition;
	information		= DIA_OCPAL_9_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_OCPAL_9_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_9_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
instance DIA_OCPAL_9_PEOPLE(C_INFO)
{
	nr				= 3;
	condition		= DIA_OCPAL_9_PEOPLE_Condition;
	information		= DIA_OCPAL_9_PEOPLE_Info;
	permanent		= TRUE;
	description		= "谁 是 这 里 的 负 责 人 ？";
};

func int DIA_OCPAL_9_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_9_PEOPLE_Info()
{
	AI_Output(other, self, "DIA_OCPAL_9_PEOPLE_15_00"); //谁 是 这 里 的 负 责 人 ？
	AI_Output(self, other, "DIA_OCPAL_9_PEOPLE_09_01"); //加 隆 德 是 城 堡 的 指 挥 官 。 你 绝 不 会 羡 慕 他 的 工 作 的。
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
instance DIA_OCPAL_9_LOCATION(C_INFO)
{
	nr				= 2;
	condition		= DIA_OCPAL_9_LOCATION_Condition;
	information		= DIA_OCPAL_9_LOCATION_Info;
	permanent		= TRUE;
	description		= "关 于 这 个 山 谷 你 知 道 些 什 么 ？";
};

func int DIA_OCPAL_9_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_9_LOCATION_Info()
{
	AI_Output(other, self, "DIA_OCPAL_9_LOCATION_15_00"); //关 于 这 个 山 谷 你 知 道 些 什 么 ？
	AI_Output(self, other, "DIA_OCPAL_9_LOCATION_09_01"); //在 东 边 ， 兽 人 们 已 经 建 造 了 一 堵 巨 大 的 保 护 墙 - 我 想 是 保 护 他 们 的 补 给 。 在 墙 后 ， 有 某 个 地 方 可 以 停 靠 他 们 的 船 只 。
	AI_Output(self, other, "DIA_OCPAL_9_LOCATION_09_02"); //我 希 望 兽 人 们 不 会 很 快 得 到 他 们 的 补 给 。 我 们 正 在 对 付 的 那 些 兽 人 对 我 们 来 说 就 已 经 够 多 了 。
};

// *************************************************************************
// 									NEWS
// *************************************************************************
instance DIA_OCPAL_9_STANDARD(C_INFO)
{
	nr				= 1;
	condition		= DIA_OCPAL_9_STANDARD_Condition;
	information		= DIA_OCPAL_9_STANDARD_Info;
	permanent		= TRUE;
	description		= "最 近 怎 么 样 ？";
};

func int DIA_OCPAL_9_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_9_STANDARD_Info()
{
	AI_Output(other, self, "DIA_OCPAL_4_STANDARD_15_00"); //最 近 怎 么 样 ？

	if (Kapitel <= 3)
	{
		AI_Output(self, other, "DIA_OCPAL_4_STANDARD_09_01"); //龙 又 发 起 了 攻 击 ！ 但 是 英 诺 斯 会 在 战 斗 中 保 护 我 们 。 贝 利 尔 的 生 物 将 会 用 鲜 血 付 出 高 昂 的 代 价 ！
	};

	if (Kapitel == 4)
	{
		if (MIS_KilledDragons < 4)
		{
			AI_Output(self, other, "DIA_OCPAL_4_STANDARD_09_02"); //龙 猎 手 ！ 他 们 应 该 给 我 们 派 遣 圣 骑 士 ！
		}
		else
		{
			AI_Output(self, other, "DIA_OCPAL_4_STANDARD_09_03"); //既 然 我 们 已 经 解 决 了 那 些 龙 ， 现 在 可 以 对 付 兽 人 了 ！
		};
	};

	if (Kapitel >= 5)
	{
		if (MIS_OCGateOpen == FALSE)
		{
			AI_Output(self, other, "DIA_OCPAL_4_STANDARD_09_04"); //我 们 需 要 把 矿 石 运 到 船 上 ， 然 后 离 开 这 该 死 的 地 方 。
		}
		else
		{
			AI_Output(self, other, "DIA_OCPAL_4_STANDARD_09_05"); //叛 徒 ！ 永 远 也 不 应 该 打 开 大 门 。 所 有 的 叛 徒 都 该 死 ！
		};
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_OCPAL_9(var C_Npc slf)
{
	DIA_OCPAL_9_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_OCPAL_9_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_OCPAL_9_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_OCPAL_9_STANDARD.npc = Hlp_GetInstanceID(slf);
};
