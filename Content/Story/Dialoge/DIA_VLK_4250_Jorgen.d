// #####################################################################
// ##
// ##
// ## KAPITEL 3
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************
instance DIA_Jorgen_KAP3_EXIT(C_INFO)
{
	npc				= VLK_4250_Jorgen;
	nr				= 999;
	condition		= DIA_Jorgen_KAP3_EXIT_Condition;
	information		= DIA_Jorgen_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Jorgen_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Jorgen_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Jorgen_PICKPOCKET(C_INFO)
{
	npc				= VLK_4250_Jorgen;
	nr				= 900;
	condition		= DIA_Jorgen_PICKPOCKET_Condition;
	information		= DIA_Jorgen_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Jorgen_PICKPOCKET_Condition()
{
	C_Beklauen(59, 70);
};

func void DIA_Jorgen_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jorgen_PICKPOCKET);
	Info_AddChoice(DIA_Jorgen_PICKPOCKET, DIALOG_BACK, DIA_Jorgen_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jorgen_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Jorgen_PICKPOCKET_DoIt);
};

func void DIA_Jorgen_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Jorgen_PICKPOCKET);
};

func void DIA_Jorgen_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jorgen_PICKPOCKET);
};

//*********************************************************************
//	Info Hallo
//*********************************************************************
instance DIA_Jorgen_Hallo(C_INFO)
{
	npc				= VLK_4250_Jorgen;
	nr				= 4;
	condition		= DIA_Jorgen_Hallo_Condition;
	information		= DIA_Jorgen_Hallo_Info;
	important		= TRUE;
};

func int DIA_Jorgen_Hallo_Condition()
{
	if ((Kapitel == 3)
	&& (MIS_SCKnowsInnosEyeIsBroken == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_Hallo_Info()
{
	AI_Output(self, other, "DIA_Jorgen_Hallo_07_00"); //嘿 ， 你 ！

	if ((hero.guild == GIL_NOV) || (hero.guild == GIL_KDF))
	{
		AI_Output(self, other, "DIA_Jorgen_Hallo_07_01"); //我 看 你 是 从 魔 法 师 的 修 道 院 来 的 。
		AI_Output(other, self, "DIA_Jorgen_Hallo_15_02"); //是 的 ， 怎 么 ？
		AI_Output(self, other, "DIA_Jorgen_Hallo_07_03"); //你 们 那 里 还 要 工 人 吗 ？
	}
	else
	{
		AI_Output(self, other, "DIA_Jorgen_Hallo_07_04"); //嘿 ， 你 去 过 修 道 院 了 吗 ？
		AI_Output(other, self, "DIA_Jorgen_Hallo_15_05"); //也 许 ， 怎 么 ？
		AI_Output(self, other, "DIA_Jorgen_Hallo_07_06"); //他 们 还 收 人 吗 ？
	};

	AI_Output(self, other, "DIA_Jorgen_Hallo_07_07"); //我 不 知 道 还 能 去 其 它 什 么 地 方 。
};

//*********************************************************************
//	Hast du einen Novizen hier vorbeirennen gesehen?
//*********************************************************************
instance DIA_Jorgen_Novice(C_INFO)
{
	npc				= VLK_4250_Jorgen;
	nr				= 6;
	condition		= DIA_Jorgen_Novice_Condition;
	information		= DIA_Jorgen_Novice_Info;
	description		= "你 看 到 有 一 个 新 信 徒 路 过 吗 ？";
};

func int DIA_Jorgen_Novice_Condition()
{
	if ((MIS_NOVIZENCHASE == LOG_RUNNING)
	&& (Kapitel == 3)
	&& (MIS_SCKnowsInnosEyeIsBroken == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_Novice_Info()
{
	AI_Output(other, self, "DIA_Jorgen_Novice_15_00"); //你 看 到 有 一 个 新 信 徒 路 过 吗 ？
	AI_Output(self, other, "DIA_Jorgen_Novice_07_01"); //是 的 ， 当 然 ， 他 朝 那 个 方 向 去 了 。
	AI_PointAt(self, "NW_TROLLAREA_NOVCHASE_01");
	AI_Output(self, other, "DIA_Jorgen_Novice_07_02"); //他 从 桥 上 跳 进 了 水 里 ， 就 像 有 只 鲨 鱼 在 追 他 一 样 游 走 了 。
	AI_StopPointAt(self);
};

//*********************************************************************
//	Wenn du ins Kloster willst, solltest du mir Milten reden.
//*********************************************************************
instance DIA_Jorgen_Milten(C_INFO)
{
	npc				= VLK_4250_Jorgen;
	nr				= 5;
	condition		= DIA_Jorgen_Milten_Condition;
	information		= DIA_Jorgen_Milten_Info;
	description		= "如 果 你 要 去 修 道 院 ， 你 应 该 和 米 尔 腾 谈 谈 … …";
};

func int DIA_Jorgen_Milten_Condition()
{
	if ((Kapitel == 3)
	&& (MIS_SCKnowsInnosEyeIsBroken == FALSE)
	&& (MIS_OLDWORLD == LOG_SUCCESS)
	&& (MiltenNW.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_Milten_Info()
{
	AI_Output(other, self, "DIA_Jorgen_Milten_15_00"); //如 果 你 要 去 修 道 院 的 话 ， 你 应 该 跟 米 尔 腾 谈 谈 。 他 肯 定 能 帮 你 。
	AI_Output(self, other, "DIA_Jorgen_Milten_07_01"); //你 怎 么 想 ， 他 们 会 让 我 进 那 里 去 吗 ？
	AI_Output(other, self, "DIA_Jorgen_Milten_15_02"); //也 许 吧 。 不 过 ， 你 这 个 样 子 ， 我 不 敢 想 像 你 穿 上 新 信 徒 长 袍 会 是 什 么 样 子 。
	AI_Output(self, other, "DIA_Jorgen_Milten_07_03"); //够 了 ， 别 说 废 话 了 - 什 么 新 信 徒 长 袍 。 我 想 要 的 是 食 物 ， 否 则 我 接 下 来 就 只 能 吃 树 皮 了 。
};

//*********************************************************************
//	DIA_Jorgen_Home
//*********************************************************************
instance DIA_Jorgen_Home(C_INFO)
{
	npc				= VLK_4250_Jorgen;
	nr				= 7;
	condition		= DIA_Jorgen_Home_Condition;
	information		= DIA_Jorgen_Home_Info;
	description		= "你 从 哪 里 来 ？";
};

func int DIA_Jorgen_Home_Condition()
{
	if (Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Jorgen_Home_Info()
{
	AI_Output(other, self, "DIA_Jorgen_Home_15_00"); //你 从 哪 里 来 ？
	AI_Output(self, other, "DIA_Jorgen_Home_07_01"); //我 曾 经 在 一 艘 捕 鲸 船 上 当 过 船 长 ， 小 伙 子 。 大 海 就 是 我 的 家 。
	AI_Output(self, other, "DIA_Jorgen_Home_07_02"); //我 的 船 ， 漂 亮 的 老 麦 格 德 利 娜 ， 几 个 月 前 被 海 盗 打 沉 了 ， 现 在 ， 我 被 困 在 这 里 进 退 两 难 。
	AI_Output(self, other, "DIA_Jorgen_Home_07_03"); //我 全 部 的 愿 望 就 是 要 回 到 海 上 去 ， 但 是 自 从 我 来 到 这 里 后 ， 没 有 一 艘 帆 船 靠 近 过 这 该 死 的 港 口 。
	AI_Output(self, other, "DIA_Jorgen_Home_07_04"); //唯 一 在 克 霍 里 尼 斯 停 靠 过 的 就 是 国 王 那 艘 该 死 的 战 舰 ， 他 们 不 让 任 何 人 上 船 。
	AI_Output(self, other, "DIA_Jorgen_Home_07_05"); //既 然 如 此 ， 我 还 有 什 么 可 做 的 呢 ？ 城 里 没 有 我 能 做 的 事 。 我 什 么 都 试 过 了 。
};

//*********************************************************************
//	DIA_Jorgen_BeCarefull
//*********************************************************************
instance DIA_Jorgen_BeCarefull(C_INFO)
{
	npc				= VLK_4250_Jorgen;
	nr				= 8;
	condition		= DIA_Jorgen_BeCarefull_Condition;
	information		= DIA_Jorgen_BeCarefull_Info;
	permanent		= TRUE;
	description		= "你 最 好 不 要 离 开 大 路 。 ";
};

func int DIA_Jorgen_BeCarefull_Condition()
{
	if ((Kapitel == 3)
	&& (Npc_KnowsInfo(other, DIA_Jorgen_Home)))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_BeCarefull_Info()
{
	AI_Output(other, self, "DIA_Jorgen_BeCarefull_15_00"); //你 最 好 不 要 离 开 大 路 。
	AI_Output(self, other, "DIA_Jorgen_BeCarefull_07_01"); //别 担 心 。 我 已 经 注 意 到 了 ， 最 近 两 天 这 外 面 的 荒 野 里 变 得 极 其 危 险 了 。
};

// #####################################################################
// ##
// ##
// ## KAPITEL 4
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************
instance DIA_Jorgen_KAP4_EXIT(C_INFO)
{
	npc				= VLK_4250_Jorgen;
	nr				= 999;
	condition		= DIA_Jorgen_KAP4_EXIT_Condition;
	information		= DIA_Jorgen_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Jorgen_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Jorgen_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info NeuHier
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_NEUHIER(C_INFO)
{
	npc				= VLK_4250_Jorgen;
	nr				= 41;
	condition		= DIA_Jorgen_NEUHIER_Condition;
	information		= DIA_Jorgen_NEUHIER_Info;
	description		= "修 道 院 的 生 活 是 怎 么 样 的 ？";
};

func int DIA_Jorgen_NEUHIER_Condition()
{
	if (Kapitel >= 4)
	{
		return TRUE;
	};
};

func void DIA_Jorgen_NEUHIER_Info()
{
	AI_Output(other, self, "DIA_Jorgen_NEUHIER_15_00"); //修 道 院 的 生 活 是 怎 么 样 的 ？

	AI_Output(self, other, "DIA_Jorgen_NEUHIER_07_01"); //我 在 这 里 就 快 要 疯 了 ！

	if (Npc_KnowsInfo(other, DIA_Jorgen_Milten))
	{
		AI_Output(self, other, "DIA_Jorgen_NEUHIER_07_02"); //不 过 ， 不 管 怎 样 ， 谢 谢 你 的 提 醒 。 米 尔 腾 真 的 帮 我 在 这 里 找 了 个 位 置 。
		B_GivePlayerXP(XP_Ambient);
	};

	if (hero.guild != GIL_KDF)
	{
		AI_Output(self, other, "DIA_Jorgen_NEUHIER_07_03"); //我 在 那 些 唠 叨 个 没 完 的 空 想 家 中 间 ， 感 觉 真 是 傻 透 了 。
	};

	AI_Output(self, other, "DIA_Jorgen_NEUHIER_07_04"); //好 吧 。 一 个 死 尸 能 做 什 么 ？ 在 我 饿 死 在 城 里 之 前 ， 我 更 愿 意 去 做 那 些 新 信 徒 们 告 诉 我 的 事 情 。
};

///////////////////////////////////////////////////////////////////////
//	Info perm4
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_PERM4(C_INFO)
{
	npc				= VLK_4250_Jorgen;
	nr				= 400;
	condition		= DIA_Jorgen_PERM4_Condition;
	information		= DIA_Jorgen_PERM4_Info;
	permanent		= TRUE;
	description		= "我 想 你 会 没 事 的 。";
};

func int DIA_Jorgen_PERM4_Condition()
{
	if ((Kapitel >= 4)
	&& (Npc_KnowsInfo(other, DIA_Jorgen_Home))
	&& (Npc_KnowsInfo(other, DIA_Jorgen_NEUHIER))
	&& (JorgenIsCaptain == FALSE))
	{
		return TRUE;
	};
};

var int DIA_Jorgen_PERM4_OneTime;
func void DIA_Jorgen_PERM4_Info()
{
	AI_Output(other, self, "DIA_Jorgen_PERM4_15_00"); //我 想 你 会 没 事 的 。
	if ((DIA_Jorgen_PERM4_OneTime == FALSE)
	&& (hero.guild != GIL_KDF))
	{
		AI_Output(self, other, "DIA_Jorgen_PERM4_07_01"); //想 像 一 下 - 我 必 须 去 他 们 的 花 园 里 除 野 草 。 如 果 再 这 么 下 去 ， 我 就 要 疯 了 。
		DIA_Jorgen_PERM4_OneTime = TRUE;
	};

	AI_Output(self, other, "DIA_Jorgen_PERM4_07_02"); //我 想 要 的 是 站 在 那 些 结 实 的 旧 甲 板 上 面 。
};

// #####################################################################
// ##
// ##
// ## KAPITEL 5
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************
instance DIA_Jorgen_KAP5_EXIT(C_INFO)
{
	npc				= VLK_4250_Jorgen;
	nr				= 999;
	condition		= DIA_Jorgen_KAP5_EXIT_Condition;
	information		= DIA_Jorgen_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Jorgen_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Jorgen_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_BEMYCAPTAIN(C_INFO)
{
	npc				= VLK_4250_Jorgen;
	nr				= 51;
	condition		= DIA_Jorgen_BEMYCAPTAIN_Condition;
	information		= DIA_Jorgen_BEMYCAPTAIN_Info;
	permanent		= TRUE;
	description		= "也 许 我 能 给 你 一 个 船 长 的 工 作 。";
};

func int DIA_Jorgen_BEMYCAPTAIN_Condition()
{
	if ((Kapitel == 5)
	&& (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (MIS_PyrokarClearDemonTower != LOG_SUCCESS)
	&& (Npc_KnowsInfo(other, DIA_Jorgen_Home)))
	{
		return TRUE;
	};
};

var int DIA_Jorgen_BEMYCAPTAIN_OneTime;
func void DIA_Jorgen_BEMYCAPTAIN_Info()
{
	AI_Output(other, self, "DIA_Jorgen_BEMYCAPTAIN_15_00"); //也 许 我 能 给 你 一 个 船 长 的 工 作 。
	if (DIA_Jorgen_BEMYCAPTAIN_OneTime == FALSE)
	{
		AI_Output(self, other, "DIA_Jorgen_BEMYCAPTAIN_07_01"); //你 不 是 在 作 弄 我 吧 ， 伙 计 ？ 如 果 你 说 的 那 些 都 是 真 的 话 ， 我 一 定 会 参 加 的 。
		AI_Output(self, other, "DIA_Jorgen_BEMYCAPTAIN_07_02"); //嗯 … … 只 有 一 个 小 问 题 。 我 吃 掉 了 那 些 新 信 徒 一 半 的 粮 食 。
		AI_Output(self, other, "DIA_Jorgen_BEMYCAPTAIN_07_03"); //他 们 十 分 生 气 ， 那 些 家 伙 。 我 觉 得 魔 法 师 首 领 不 会 就 这 样 让 我 离 开 这 里 。
		DIA_Jorgen_BEMYCAPTAIN_OneTime = TRUE;
	};

	AI_Output(self, other, "DIA_Jorgen_BEMYCAPTAIN_07_04"); //首 先 ， 我 得 努 力 工 作 来 清 偿 皮 罗 卡 的 债 务 。 对 不 起 。

	Log_CreateTopic(TOPIC_Captain, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);
	B_LogEntry(TOPIC_Captain, TOPIC_Captain_2);
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain2
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_BEMYCAPTAIN2(C_INFO)
{
	npc				= VLK_4250_Jorgen;
	nr				= 52;
	condition		= DIA_Jorgen_BEMYCAPTAIN2_Condition;
	information		= DIA_Jorgen_BEMYCAPTAIN2_Info;
	description		= "我 帮 你 解 决 了 帐 单 。";
};

func int DIA_Jorgen_BEMYCAPTAIN2_Condition()
{
	if (MIS_PyrokarClearDemonTower == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Jorgen_BEMYCAPTAIN2_Info()
{
	AI_Output(other, self, "DIA_Jorgen_BEMYCAPTAIN2_15_00"); //我 解 决 了 你 的 账 单 。 你 自 由 了 。
	AI_Output(self, other, "DIA_Jorgen_BEMYCAPTAIN2_07_01"); //真 的 吗 ？ 你 怎 么 做 到 的 ？
	AI_Output(other, self, "DIA_Jorgen_BEMYCAPTAIN2_15_02"); //你 一 定 不 想 知 道 的 。
	AI_Output(self, other, "DIA_Jorgen_BEMYCAPTAIN2_07_03"); //哦 ， 好 吧 。 我 倒 不 是 不 真 的 关 心 这 个 。 再 次 万 分 的 感 谢 。

	if (SCGotCaptain == FALSE)
	{
		AI_Output(self, other, "DIA_Jorgen_BEMYCAPTAIN2_07_04"); //那 么 ， 你 的 提 议 是 什 么 ？ 我 还 能 跟 你 签 约 吗 ？
	}
	else
	{
		AI_Output(self, other, "DIA_Jorgen_BEMYCAPTAIN2_07_05"); //太 棒 了 。 那 么 现 在 我 们 就 要 离 开 这 里 了 。
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self, "RausAusKloster");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain3
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_BEMYCAPTAIN3(C_INFO)
{
	npc				= VLK_4250_Jorgen;
	nr				= 53;
	condition		= DIA_Jorgen_BEMYCAPTAIN3_Condition;
	information		= DIA_Jorgen_BEMYCAPTAIN3_Info;
	description		= "当 我 的 船 长 。";
};

func int DIA_Jorgen_BEMYCAPTAIN3_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Jorgen_BEMYCAPTAIN2))
	&& (SCGotCaptain == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_BEMYCAPTAIN3_Info()
{
	AI_Output(other, self, "DIA_Jorgen_BEMYCAPTAIN3_15_00"); //当 我 的 船 长 。
	AI_Output(self, other, "DIA_Jorgen_BEMYCAPTAIN3_07_01"); //我 感 觉 很 光 荣 ， 不 过 ， 你 是 不 是 有 一 艘 船 和 一 支 水 手 队 伍 呢 ？
	AI_Output(self, other, "DIA_Jorgen_BEMYCAPTAIN3_07_02"); //我 得 说 ， 我 们 至 少 需 要 五 个 人 。
	AI_Output(other, self, "DIA_Jorgen_BEMYCAPTAIN3_15_03"); //很 好 。 我 要 看 看 自 己 能 做 些 什 么 。 到 港 口 等 我 吧 。
	AI_Output(self, other, "DIA_Jorgen_BEMYCAPTAIN3_07_04"); //是 ， 是 ， 先 生 。
	AI_StopProcessInfos(self);
	SCGotCaptain = TRUE;
	JorgenIsCaptain = TRUE;
	Npc_ExchangeRoutine(self, "WaitForShipCaptain");

	B_GivePlayerXP(XP_Captain_Success);
};

///////////////////////////////////////////////////////////////////////
//	Info Losfahren
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_LOSFAHREN(C_INFO)
{
	npc				= VLK_4250_Jorgen;
	nr				= 59;
	condition		= DIA_Jorgen_LOSFAHREN_Condition;
	information		= DIA_Jorgen_LOSFAHREN_Info;
	permanent		= TRUE;
	description		= "你 准 备 好 带 我 去 岛 屿 吗 ？";
};

func int DIA_Jorgen_LOSFAHREN_Condition()
{
	if ((JorgenIsCaptain == TRUE)
	&& (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_LOSFAHREN_Info()
{
	AI_Output(other, self, "DIA_Jorgen_LOSFAHREN_15_00"); //你 准 备 好 带 我 去 岛 屿 吗 ？

	if ((B_CaptainConditions(self)) == TRUE)
	{
		AI_Output(self, other, "DIA_Jorgen_LOSFAHREN_07_01"); //不 过 ， 当 然 。 给 我 那 张 航 海 图 。
		AI_Output(self, other, "DIA_Jorgen_LOSFAHREN_07_02"); //太 棒 了 。 现 在 升 起 船 帆 ， 我 们 离 开 这 里 。
		AI_Output(self, other, "DIA_Jorgen_LOSFAHREN_07_03"); //你 最 好 先 检 查 一 下 装 备 。 一 旦 我 们 到 了 海 里 就 没 有 回 头 路 了 。
		AI_Output(self, other, "DIA_Jorgen_LOSFAHREN_07_04"); //做 完 后 ， 你 应 该 睡 一 会 儿 。 你 的 床 铺 好 了 ， 就 在 船 长 的 船 舱 里 。 晚 安 。
		AI_StopProcessInfos(self);
		B_CaptainCallsAllOnBoard(self);
	}
	else
	{
		AI_Output(self, other, "DIA_Jorgen_LOSFAHREN_07_05"); //你 需 要 一 艘 船 ， 一 支 至 少 五 个 人 的 水 手 队 伍 ， 和 一 张 航 海 图 ， 我 要 用 它 们 才 能 航 行。
		AI_Output(self, other, "DIA_Jorgen_LOSFAHREN_07_06"); //在 我 看 到 你 找 到 所 有 必 须 的 东 西 之 前 ， 我 们 不 能 启 航 。
		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info perm5_NotCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_PERM5_NOTCAPTAIN(C_INFO)
{
	npc				= VLK_4250_Jorgen;
	nr				= 59;
	condition		= DIA_Jorgen_PERM5_NOTCAPTAIN_Condition;
	information		= DIA_Jorgen_PERM5_NOTCAPTAIN_Info;
	permanent		= TRUE;
	description		= "你 好 吗 ？";
};

func int DIA_Jorgen_PERM5_NOTCAPTAIN_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Jorgen_BEMYCAPTAIN2))
	&& (SCGotCaptain == TRUE)
	&& (JorgenIsCaptain == FALSE))
	{
		return TRUE;
	};
};

var int DIA_Jorgen_PERM5_NOTCAPTAIN_XPGiven;
func void DIA_Jorgen_PERM5_NOTCAPTAIN_Info()
{
	AI_Output(other, self, "DIA_Jorgen_PERM5_NOTCAPTAIN_15_00"); //你 好 吗 ？

	if (Npc_GetDistToWP(self, "NW_BIGFARM_KITCHEN_OUT_06") < 1000)
	{
		AI_Output(self, other, "DIA_Jorgen_PERM5_NOTCAPTAIN_07_01"); //好 的 。 这 里 不 是 个 很 差 的 地 方 。
		AI_Output(self, other, "DIA_Jorgen_PERM5_NOTCAPTAIN_07_02"); //他 们 还 在 让 我 干 白 痴 一 样 的 活 ， 像 放 羊 什 么 的 ， 不 过 ， 他 们 没 有 像 在 修 道 院 时 那 么 小 心 眼 了 。

		if (DIA_Jorgen_PERM5_NOTCAPTAIN_XPGiven == FALSE)
		{
			B_GivePlayerXP(XP_Ambient);
			DIA_Jorgen_PERM5_NOTCAPTAIN_XPGiven = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, other, "DIA_Jorgen_PERM5_NOTCAPTAIN_07_03"); //我 不 得 不 找 另 一 个 地 方 呆 着 。 我 们 来 看 看 下 一 阵 风 会 把 我 们 刮 到 那 里 去 。

		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self, "RausAusKloster");
	};
};

// #####################################################################
// ##
// ##
// ## KAPITEL 6
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************
instance DIA_Jorgen_KAP6_EXIT(C_INFO)
{
	npc				= VLK_4250_Jorgen;
	nr				= 999;
	condition		= DIA_Jorgen_KAP6_EXIT_Condition;
	information		= DIA_Jorgen_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Jorgen_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Jorgen_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};
