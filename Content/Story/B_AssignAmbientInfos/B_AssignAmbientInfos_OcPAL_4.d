// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_OCPAL_4_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_OCPAL_4_EXIT_Condition;
	information		= DIA_OCPAL_4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_OCPAL_4_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
instance DIA_OCPAL_4_PEOPLE(C_INFO)
{
	nr				= 3;
	condition		= DIA_OCPAL_4_PEOPLE_Condition;
	information		= DIA_OCPAL_4_PEOPLE_Info;
	permanent		= TRUE;
	description		= "谁 是 这 里 的 负 责 人 ？";
};

func int DIA_OCPAL_4_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_4_PEOPLE_Info()
{
	AI_Output(other, self, "DIA_OCPAL_4_PEOPLE_15_00"); //谁 是 这 里 的 负 责 人 ？
	AI_Output(self, other, "DIA_OCPAL_4_PEOPLE_04_01"); //指 挥 官 加 隆 德 。 他 在 城 堡 这 里 最 大 的 建 筑 物 中 。
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
instance DIA_OCPAL_4_LOCATION(C_INFO)
{
	nr				= 2;
	condition		= DIA_OCPAL_4_LOCATION_Condition;
	information		= DIA_OCPAL_4_LOCATION_Info;
	permanent		= TRUE;
	description		= "关 于 矿 藏 山 谷 你 能 告 诉 我 些 什 么 ？";
};

func int DIA_OCPAL_4_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_4_LOCATION_Info()
{
	AI_Output(other, self, "DIA_OCPAL_4_LOCATION_15_00"); //关 于 矿 藏 山 谷 你 能 告 诉 我 些 什 么 ？
	AI_Output(self, other, "DIA_OCPAL_4_LOCATION_04_01"); //据 我 所 知 ， 那 里 还 有 几 个 矿 坑 - 如 果 它 们 还 没 有 被 兽 人 占 领 的 话 。
	AI_Output(self, other, "DIA_OCPAL_4_LOCATION_04_02"); //这 支 军 队 大 部 分 都 是 囚 犯 ， 不 过 其 中 也 有 一 些 圣 骑 士 。
};

// *************************************************************************
// 									NEWS
// *************************************************************************
instance DIA_OCPAL_4_STANDARD(C_INFO)
{
	nr				= 1;
	condition		= DIA_OCPAL_4_STANDARD_Condition;
	information		= DIA_OCPAL_4_STANDARD_Info;
	permanent		= TRUE;
	description		= "最 近 怎 么 样 ？";
};

func int DIA_OCPAL_4_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_4_STANDARD_Info()
{
	AI_Output(other, self, "DIA_OCPAL_4_STANDARD_15_00"); //最 近 怎 么 样 ？

	if (Kapitel <= 3)
	{
		AI_Output(self, other, "DIA_OCPAL_4_STANDARD_04_01"); //兽 人 已 经 把 我 们 包 围 了 ！ 但 是 我 们 会 战 至 最 后 一 人 ！ 英 诺 斯 会 帮 助 我 们 抵 抗 那 些 龙 的 ！
	};

	if (Kapitel == 4)
	{
		if (MIS_KilledDragons < 4)
		{
			AI_Output(self, other, "DIA_OCPAL_4_STANDARD_04_02"); //距 离 兽 人 发 起 攻 击 没 有 多 长 时 间 了 。 该 死 的 援 兵 在 哪 里 ？
			if (other.guild == GIL_DJG)
			{
				AI_Output(self, other, "DIA_OCPAL_4_STANDARD_04_03"); //你 不 是 真 的 相 信 你 们 龙 猎 手 真 有 机 会 战 胜 所 有 的 龙 吧 ？
			}
			else
			{
				AI_Output(self, other, "DIA_OCPAL_4_STANDARD_04_04"); //那 些 所 谓 的 龙 猎 手 不 可 能 成 功 ！
			};
		}
		else
		{
			AI_Output(self, other, "DIA_OCPAL_4_STANDARD_04_05"); //感 谢 英 诺 斯 ！ 那 些 该 死 的 野 兽 被 击 退 了 ！
		};
	};

	if (Kapitel >= 5)
	{
		if (MIS_OCGateOpen == FALSE)
		{
			AI_Output(self, other, "DIA_OCPAL_4_STANDARD_04_06"); //龙 的 死 亡 似 乎 并 没 有 给 兽 人 造 成 多 大 的 震 动 。 以 英 诺 斯 的 名 义 ， 他 们 为 什 么 还 不 离 开 ？ 这 里 有 什 么 暴 行 正 在 酝 酿 之 中 。
		}
		else
		{
			AI_Output(self, other, "DIA_OCPAL_4_STANDARD_04_07"); //该 死 的 门 卡 住 了 。 兽 人 们 潮 涌 进 城 堡 ， 没 有 什 么 能 阻 止 他 们 。
			AI_Output(self, other, "DIA_OCPAL_4_STANDARD_04_08"); //必 须 有 人 通 知 哈 根 勋 爵 。 我 们 现 在 需 要 他 来 这 里 。
		};
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_OCPAL_4(var C_Npc slf)
{
	DIA_OCPAL_4_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_OCPAL_4_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_OCPAL_4_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_OCPAL_4_STANDARD.npc = Hlp_GetInstanceID(slf);
};
