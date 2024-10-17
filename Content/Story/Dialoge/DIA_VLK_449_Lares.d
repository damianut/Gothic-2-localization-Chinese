// ************************************************************
// 			Lares Patch
// ************************************************************
instance DIA_Addon_Lares_Patch(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 99;
	condition		= DIA_Addon_Lares_Patch_Condition;
	information		= DIA_Addon_Lares_Patch_Info;
	description		= "（加 油 ）";
};

func int DIA_Addon_Lares_Patch_Condition()
{
	if ((Npc_HasItems(self, ItMi_Ornament_Addon_Vatras))
	&& (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Patch_Info()
{
	B_GiveInvItems(self, other, ItMi_Ornament_Addon_Vatras, 1);
};

// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Lares_Kap1_EXIT(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 999;
	condition		= DIA_Lares_Kap1_EXIT_Condition;
	information		= DIA_Lares_Kap1_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lares_Kap1_EXIT_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HaltsMaul
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_HaltsMaul(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 5;
	condition		= DIA_Addon_Lares_HaltsMaul_Condition;
	information		= DIA_Addon_Lares_HaltsMaul_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_Lares_HaltsMaul_Condition()
{
	if ((Lares_HaltsMaul == TRUE)
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_HaltsMaul_Info()
{
	AI_Output(self, other, "DIA_Addon_Lares_HaltsMaul_09_01"); //我 们 再 见 吧 ， 在 港 口 那 里 。
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Lares_PICKPOCKET(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 900;
	condition		= DIA_Lares_PICKPOCKET_Condition;
	information		= DIA_Lares_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_100;
};

func int DIA_Lares_PICKPOCKET_Condition()
{
	C_Beklauen(95, 350);
};

func void DIA_Lares_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lares_PICKPOCKET);
	Info_AddChoice(DIA_Lares_PICKPOCKET, DIALOG_BACK, DIA_Lares_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lares_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Lares_PICKPOCKET_DoIt);
};

func void DIA_Lares_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Lares_PICKPOCKET);
};

func void DIA_Lares_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lares_PICKPOCKET);
};

// ************************************************************
// 			  				   Hallo
// ************************************************************
instance DIA_Lares_HALLO(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 2;
	condition		= DIA_Lares_HALLO_Condition;
	information		= DIA_Lares_HALLO_Info;
	important		= TRUE;
};

func int DIA_Lares_HALLO_Condition()
{
	if (RangerMeetingRunning == 0) // ADDON
	{
		return TRUE;
	};
};

func void DIA_Lares_HALLO_Info()
{
	AI_Output(self, other, "DIA_Lares_HALLO_09_00"); //我 一 定 是 疯 了 ， 你 在 这 里 干 什 么 ？

	if ((Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE))
	{
		AI_Output(self, other, "DIA_Lares_HALLO_09_01"); //你 是 游 到 这 里 来 的 吗 ？
		AI_Output(self, other, "DIA_Lares_HALLO_09_02"); //（ 大 笑 ） 这 是 通 过 城 门 守 卫 的 一 个 方 法 。
		B_GivePlayerXP(500); // wer's schafft...
	};

	Info_ClearChoices(DIA_Lares_HALLO);

	Info_AddChoice(DIA_Lares_HALLO, "我 们 以 前 见 过 吗 ？", DIA_Lares_HALLO_NO);
	Info_AddChoice(DIA_Lares_HALLO, "嘿 ， 莱 尔 瑞 兹 ， 你 这 个 老 流 氓 … …", DIA_Lares_HALLO_YES);
};

func void DIA_Lares_HALLO_NO()
{
	AI_Output(other, self, "DIA_Lares_HALLO_NO_15_00"); //我 们 以 前 见 过 吗 ？
	AI_Output(self, other, "DIA_Lares_HALLO_NO_09_01"); //伙 计 ， 你 不 记 得 我 了 吗 ？ 我 以 前 经 常 在 新 营 地 那 里 转 悠 。
	AI_Output(self, other, "DIA_Lares_HALLO_NO_09_02"); //这 张 名 单 是 矿 … … 伙 计 ， 我 们 有 过 很 多 的 趣 事 。 你 还 记 得 李 吗 ？

	Info_ClearChoices(DIA_Lares_HALLO);

	Info_AddChoice(DIA_Lares_HALLO, "我 当 然 记 得 李 ！", DIA_Lares_HALLO_LEE);
	Info_AddChoice(DIA_Lares_HALLO, "李 … … ？", DIA_Lares_HALLO_NOIDEA);
};

func void DIA_Lares_HALLO_YES()
{
	AI_Output(other, self, "DIA_Lares_HALLO_YES_15_00"); //嘿 ， 莱 尔 瑞 兹 ， 你 这 个 老 混 蛋 ， 你 是 怎 么 到 这 里 来 的 ？
	AI_Output(self, other, "DIA_Lares_HALLO_YES_09_01"); //我 想 办 法 及 时 离 开 了 矿 藏 山 谷 ， 跟 李 一 起 ， 还 有 一 些 其 它 的 人 。
	AI_Output(self, other, "DIA_Lares_HALLO_YES_09_02"); //你 还 记 得 李 ， 是 吗 ？

	Info_ClearChoices(DIA_Lares_HALLO);

	Info_AddChoice(DIA_Lares_HALLO, "我 当 然 记 得 李 ！", DIA_Lares_HALLO_LEE);
	Info_AddChoice(DIA_Lares_HALLO, "李 … … ？", DIA_Lares_HALLO_NOIDEA);
};

// ------------------------------
func void B_Lares_AboutLee()
{
	AI_Output(self, other, "B_Lares_AboutLee_09_00"); //后 来 ， 我 和 他 一 起 设 法 离 开 了 流 放 地 。 就 在 屏 障 被 摧 毁 之 后 。
	AI_Output(self, other, "B_Lares_AboutLee_09_01"); //他 和 他 的 人 现 在 在 地 主 欧 纳 尔 的 农 场 里 。
	AI_Output(self, other, "B_Lares_AboutLee_09_02"); //他 和 那 个 农 场 主 达 成 了 一 项 协 定 。 他 和 他 的 人 保 护 农 场 ， 作 为 回 报 ， 欧 纳 尔 供 养 他 们 。
};

// ------------------------------

func void DIA_Lares_HALLO_LEE()
{
	AI_Output(other, self, "DIA_Lares_HALLO_LEE_15_00"); //我 当 然 记 得 李 ！
	B_Lares_AboutLee();

	Info_ClearChoices(DIA_Lares_HALLO);
};

func void DIA_Lares_HALLO_NOIDEA()
{
	AI_Output(other, self, "DIA_Lares_HALLO_NOIDEA_15_00"); //李 … … ？
	AI_Output(self, other, "DIA_Lares_HALLO_NOIDEA_09_01"); //你 经 历 了 很 多 事 ， 是 吗 ？ 在 新 营 地 的 时 候 ， 李 是 那 些 雇 佣 兵 的 头 儿 。
	B_Lares_AboutLee();

	Info_ClearChoices(DIA_Lares_HALLO);
};

// ************************************************************
// *** ***
// 								ADDON
// *** ***
// ************************************************************

// ------------------------------------------------------------
// Vatras schickt mich
// ------------------------------------------------------------
instance DIA_Addon_Lares_Vatras(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 1;
	condition		= DIA_Addon_Lares_Vatras_Condition;
	information		= DIA_Addon_Lares_Vatras_Info;
	description		= "瓦 卓 斯 让 我 来 的 。";
};

func int DIA_Addon_Lares_Vatras_Condition()
{
	if (Vatras_GehZuLares == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Vatras_Info()
{
	AI_Output(other, self, "DIA_Addon_Lares_Vatras_15_00"); //瓦 卓 斯 派 我 来 的 。 他 告 诉 过 我 在 需 要 帮 助 的 时 候 来 找 你 。
	AI_Output(self, other, "DIA_Addon_Lares_Vatras_09_01"); //（ 惊 讶 的 ） 那 么 ， 你 已 经 去 见 过 瓦 卓 斯 了 。 你 一 定 已 经 给 他 留 下 了 一 个 深 刻 的 好 印 像 。
	AI_Output(self, other, "DIA_Addon_Lares_Vatras_09_02"); //否 则 他 肯 定 不 会 主 动 提 到 我 的 名 字 。 尤 其 是 在 还 没 有 解 决 失 踪 人 口 的 问 题 的 时 候 。
	AI_Output(self, other, "DIA_Addon_Lares_Vatras_09_03"); //告 诉 我 你 需 要 什 么 。
	Lares_RangerHelp = TRUE;

	if (GregLocation == Greg_Farm1)
	{
		B_StartOtherRoutine(Bau_974_Bauer, "GregInTaverne");
		GregLocation = Greg_Taverne;
		B_StartOtherRoutine(Greg_NW, "Taverne");
	};
};

// ************************************************************
// 						Ring des Wassers
// ************************************************************
// ------------------------------------------------------------
// WhatAreYouGuys
// ------------------------------------------------------------
instance DIA_Addon_Lares_WhatAreYouGuys(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 6;
	condition		= DIA_Addon_Lares_WhatAreYouGuys_Condition;
	information		= DIA_Addon_Lares_WhatAreYouGuys_Info;
	description		= "你 和 瓦 卓 斯 的 交 易 是 什 么 ？";
};

func int DIA_Addon_Lares_WhatAreYouGuys_Condition()
{
	if ((Lares_RangerHelp == TRUE)
	&& (SC_IsRanger == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_WhatAreYouGuys_Info()
{
	AI_Output(other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_00"); //你 和 瓦 卓 斯 的 交 易 是 什 么 ？
	AI_Output(self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_01"); //你 知 道 ， 我 已 经 跟 水 法 师 达 成 了 这 个 小 小 的 协 定 。？
	AI_Output(other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_02"); //关 于 什 么 的 协 议 ？
	AI_Output(self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_03"); //我 们 为 他 们 工 作 ， 而 他 们 保 证 让 我 们 在 罪 犯 流 放 地 的 经 历 不 会 给 我 们 造 成 麻 烦 。
	AI_Output(other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_04"); //你 在 说 ‘ 水 之 环 ’ ？
	AI_Output(self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_05"); //你 已 经 听 说 它 了 吗 ？
	AI_Output(other, self, "DIA_Addon_Lares_WhatAreYouGuys_15_06"); //瓦 卓 斯 告 诉 过 我 这 件 事 。
	AI_Output(self, other, "DIA_Addon_Lares_WhatAreYouGuys_09_07"); //你 可 能 已 经 提 到 那 件 事 了 。

	Log_CreateTopic(TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_RingOfWater, TOPIC_Addon_RingOfWater_3);
};

// ------------------------------------------------------------
// Ranger
// ------------------------------------------------------------
instance DIA_Addon_Lares_Ranger(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 5;
	condition		= DIA_Addon_Lares_Ranger_Condition;
	information		= DIA_Addon_Lares_Ranger_Info;
	description		= "告 诉 我 更 多 关 于 ‘ 水 之 环 ’ 的 事 。";
};

func int DIA_Addon_Lares_Ranger_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Lares_WhatAreYouGuys))
	&& (SC_IsRanger == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Ranger_Info()
{
	AI_Output(other, self, "DIA_Addon_Lares_Ranger_15_00"); //告 诉 我 更 多 关 于 ‘ 水 之 环 ’ 的 事 。
	AI_Output(self, other, "DIA_Addon_Lares_Ranger_09_01"); //‘ 环 ’ 对 于 水 法 师 来 说 ， 就 像 圣 骑 士 与 火 魔 法 师 那 样 的 关 系 。
	AI_Output(self, other, "DIA_Addon_Lares_Ranger_09_02"); //然 而 ， 跟 圣 骑 士 不 同 ， 我 们 在 幕 后 行 动 。
	AI_Output(self, other, "DIA_Addon_Lares_Ranger_09_03"); //‘ 环 ’ 在 战 争 中 是 一 件 强 大 的 武 器 ， 用 来 抵 御 威 胁 到 克 霍 里 尼 斯 的 人 民 的 危 险 。
	AI_Output(self, other, "DIA_Addon_Lares_Ranger_09_04"); //但 是 ， 我 们 只 有 保 守 所 有 属 于 ‘ 水 之 环 ’ 的 人 的 身 份 的 秘 密 ， 才 能 使 它 起 到 作 用 。
	AI_Output(self, other, "DIA_Addon_Lares_Ranger_09_05"); //所 以 ， 把 这 件 事 放 在 你 的 心 里 ！
	AI_Output(other, self, "DIA_Addon_Lares_Ranger_15_06"); //当 然 。
	B_LogEntry(TOPIC_Addon_RingOfWater, TOPIC_Addon_RingOfWater_4);
};

// ------------------------------------------------------------
// Info WannaBeRanger
// ------------------------------------------------------------
instance DIA_Addon_Lares_WannaBeRanger(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 2;
	condition		= DIA_Addon_Lares_WannaBeRanger_Condition;
	information		= DIA_Addon_Lares_WannaBeRanger_Info;
	description		= "我 想 加 入 ‘ 水 之 环 ’ … …";
};

func int DIA_Addon_Lares_WannaBeRanger_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Lares_Ranger))
	&& (SC_IsRanger == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_WannaBeRanger_Info()
{
	AI_Output(other, self, "DIA_Addon_Lares_WannaBeRanger_15_00"); //我 想 加 入 ‘ 水 之 环 ’ … …
	AI_Output(self, other, "DIA_Addon_Lares_WannaBeRanger_09_01"); //我 没 意 见 。 但 是 关 于 你 是 否 会 被 接 受 ， 这 只 能 靠 水 法 师 独 自 来 决 定 。

	B_LogEntry(TOPIC_Addon_RingOfWater, LogText_Addon_KDWRight);

	Info_ClearChoices(DIA_Addon_Lares_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Lares_WannaBeRanger, "我 明 白 了 。", DIA_Addon_Lares_WannaBeRanger_BACK);
	Info_AddChoice(DIA_Addon_Lares_WannaBeRanger, "属 于 ‘ 环 ’ 的 人 是 什 么 样 子 ？", DIA_Addon_Lares_WannaBeRanger_HowIsIt);
	Info_AddChoice(DIA_Addon_Lares_WannaBeRanger, "你 做 了 什 么 让 水 法 师 印 像 深 刻 的 事 ？", DIA_Addon_Lares_WannaBeRanger_AboutYou);
};

func void DIA_Addon_Lares_WannaBeRanger_BACK()
{
	AI_Output(other, self, "DIA_Addon_Lares_WannaBeRanger_BACK_15_00"); //我 明 白 了 。
	Info_ClearChoices(DIA_Addon_Lares_WannaBeRanger);
};

func void DIA_Addon_Lares_WannaBeRanger_AboutYou()
{
	AI_Output(other, self, "DIA_Addon_Lares_WannaBeRanger_AboutYou_15_00"); //你 做 了 什 么 让 水 法 师 印 像 深 刻 的 事 ？
	AI_Output(self, other, "DIA_Addon_Lares_WannaBeRanger_AboutYou_09_01"); //在 屏 障 还 存 在 的 时 候 ， 我 保 护 过 他 们 很 久 。
	AI_Output(self, other, "DIA_Addon_Lares_WannaBeRanger_AboutYou_09_02"); //（ 微 笑 ） 所 以 ， 他 们 有 很 多 理 由 对 我 心 存 感 激 。
};

func void DIA_Addon_Lares_WannaBeRanger_HowIsIt()
{
	AI_Output(other, self, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_15_00"); //属 于 ‘ 环 ’ 的 人 是 什 么 样 子 ？
	AI_Output(self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_01"); //我 们 跟 你 在 克 霍 里 尼 斯 能 加 入 的 普 通 组 织 非 常 不 同 。
	AI_Output(self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_02"); //一 旦 你 成 为 我 们 的 人 ， 我 们 不 会 要 求 你 做 任 何 你 还 没 有 准 备 好 去 做 的 事 情 。
	AI_Output(self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_03"); //我 们 真 正 要 求 你 做 到 的 就 是 保 持 沉 默 。
	AI_Output(self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_04"); //我 们 是 秘 密 行 事 ， 不 希 望 外 界 的 人 知 道 我 们 的 成 员 都 是 谁 。
	AI_Output(self, other, "DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_05"); //我 会 注 意 你 的 。 一 切 事 情 都 会 看 得 到 的 。
};

// ------------------------------------------------------------
// Info RingBack (Bin jetzt dabei)
// ------------------------------------------------------------
func void B_Lares_Geheimtreffen()
{
	AI_Output(self, other, "DIA_Addon_Lares_RingBack_09_07"); //我 们 准 备 不 久 在 奥 兰 的 客 栈 里 面 举 行 一 次 秘 密 会 议 。
	AI_Output(self, other, "DIA_Addon_Lares_RingBack_09_08"); //一 旦 你 可 以 就 去 那 里 跟 我 们 碰 头 。 在 那 里 我 们 会 把 你 的 装 备 给 你 。
};

// ------------------------------------------------------------
instance DIA_Addon_Lares_RingBack(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 5;
	condition		= DIA_Addon_Lares_RingBack_Condition;
	information		= DIA_Addon_Lares_RingBack_Info;
	description		= "我 现 在 属 于 ‘ 水 之 环 ’ 。";
};

func int DIA_Addon_Lares_RingBack_Condition()
{
	if ((SC_IsRanger == TRUE)
	&& (MIS_Addon_Lares_ComeToRangerMeeting != LOG_SUCCESS)
	&& (((Npc_GetDistToWP(self, "NW_CITY_HABOUR_02_B") < 1000)) || ((Npc_GetDistToWP(self, "NW_CITY_HABOUR_TAVERN01_08") < 1000))))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_RingBack_Info()
{
	AI_Output(other, self, "DIA_Addon_Lares_RingBack_15_00"); //我 现 在 属 于 ‘ 水 之 环 ’ 。

	if ((Lares_GotRingBack == FALSE)
	&& (SC_GotLaresRing == TRUE))
	{
		AI_Output(self, other, "DIA_Addon_Lares_RingBack_09_01"); //太 棒 了 。 那 么 ， 我 能 拿 回 我 的 蓝 宝 石 戒 指 吗 ？

		if (B_GiveInvItems(other, self, ItRi_Ranger_Lares_Addon, 1))
		{
			AI_Output(other, self, "DIA_Addon_Lares_RingBack_15_02"); //当 然 。 它 在 这 里 。
			AI_Output(self, other, "DIA_Addon_Lares_RingBack_09_03"); //我 希 望 它 对 你 有 过 用 处 。 我 很 高 兴 看 到 你 现 在 成 为 了 我 们 的 人 。
			Lares_GotRingBack = TRUE;
			B_GivePlayerXP(XP_Ambient);
		}
		else
		{
			AI_Output(other, self, "DIA_Addon_Lares_RingBack_15_04"); //嗯 。 我 现 在 没 把 它 带 在 身 上 。
			AI_Output(self, other, "DIA_Addon_Lares_RingBack_09_05"); //别 把 它 弄 丢 了 ！ 我 还 需 要 它 。
		};
	};

	AI_Output(self, other, "DIA_Addon_Lares_RingBack_09_06"); //我 猜 你 现 在 想 要 你 的 装 备 。 所 以 要 注 意 了 。
	B_Lares_Geheimtreffen();

	B_LogEntry(TOPIC_Addon_RingOfWater, TOPIC_Addon_RingOfWater_5);

	MIS_Addon_Lares_ComeToRangerMeeting = LOG_RUNNING;
};

// ------------------------------------------------------------
// Info RingBack2
// ------------------------------------------------------------
instance DIA_Addon_Lares_RingBack2(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 5;
	condition		= DIA_Addon_Lares_RingBack2_Condition;
	information		= DIA_Addon_Lares_RingBack2_Info;
	description		= "这 是 你 的 蓝 宝 石 戒 指 。";
};

func int DIA_Addon_Lares_RingBack2_Condition()
{
	if ((Npc_HasItems(other, ItRi_Ranger_Lares_Addon))
	&& (Lares_GotRingBack == FALSE)
	&& (MIS_Addon_Lares_ComeToRangerMeeting != 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_RingBack2_Info()
{
	AI_Output(other, self, "DIA_Addon_Lares_RingBack2_15_00"); //这 是 你 的 蓝 宝 石 戒 指 。
	B_GiveInvItems(other, self, ItRi_Ranger_Lares_Addon, 1);
	AI_Output(self, other, "DIA_Addon_Lares_RingBack2_09_01"); //你 真 不 错 。 我 以 为 你 把 它 弄 丢 了 。
	B_GivePlayerXP(XP_Ambient);
	Lares_GotRingBack = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Geduld
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_Geduld(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 2;
	condition		= DIA_Addon_Lares_Geduld_Condition;
	information		= DIA_Addon_Lares_Geduld_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_Lares_Geduld_Condition()
{
	if ((RangerMeetingRunning == LOG_RUNNING)
	&& (Npc_GetDistToWP(self, "NW_TAVERNE_IN_RANGERMEETING_LARES") > 200)
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Geduld_Info()
{
	AI_Output(self, other, "DIA_Addon_Lares_Geduld_09_01"); //你 必 须 稍 微 再 等 一 会 儿 。 人 还 没 有 到 齐 。
	AI_StopProcessInfos(self);
};

// ************************************************************
// 						RANGER MEETING
// ************************************************************
instance DIA_Addon_Lares_GetRangerArmor(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 5;
	condition		= DIA_Addon_Lares_GetRangerArmor_Condition;
	information		= DIA_Addon_Lares_GetRangerArmor_Info;
	important		= TRUE;
};

func int DIA_Addon_Lares_GetRangerArmor_Condition()
{
	if ((MIS_Addon_Lares_ComeToRangerMeeting == LOG_RUNNING)
	&& ((Npc_GetDistToWP(self, "NW_TAVERNE_IN_RANGERMEETING_LARES") < 200))
	&& (RangerMeetingRunning == LOG_RUNNING)
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_GetRangerArmor_Info()
{
	AI_Output(self, other, "DIA_Addon_Lares_GetRangerArmor_09_00"); //好 的 ， 年 青 的 朋 友 。 我 们 一 起 来 到 这 里 为 你 加 入 ‘ 水 之 环 ’ 而 庆 祝 。
	AI_Output(self, other, "DIA_Addon_Lares_GetRangerArmor_09_01"); //这 里 出 席 的 人 将 从 今 天 开 始 关 注 你 。
	AI_Output(self, other, "DIA_Addon_Lares_GetRangerArmor_09_02"); //当 然 ， 还 有 其 它 也 属 于 ‘ 水 之 环 ’ 的 人 ， 所 以 ， 要 小 心 。
	AI_Output(self, other, "DIA_Addon_Lares_GetRangerArmor_09_03"); //无 论 你 是 帮 了 我 们 的 忙 还 是 把 事 情 搞 砸 了 - 我 们 都 会 知 道 。
	AI_Output(self, other, "DIA_Addon_Lares_GetRangerArmor_09_04"); //给 ， 拿 着 我 们 组 织 的 盔 甲 。
	CreateInvItem(hero, ITAR_RANGER_Addon);
	AI_EquipArmor(hero, ITAR_RANGER_Addon);
	AI_Output(self, other, "DIA_Addon_Lares_GetRangerArmor_09_05"); //满 怀 自 豪 地 穿 上 它 ， 但 永 远 不 要 在 城 里 或 者 其 它 有 人 烟 的 地 方 穿 它 。
	AI_Output(self, other, "DIA_Addon_Lares_GetRangerArmor_09_06"); //记 住 ， 我 们 必 须 不 暴 露 身 份 。 不 能 告 诉 任 何 人 哪 些 人 是 ‘ 水 之 环 ’ 的 成 员 。
	AI_Output(self, other, "DIA_Addon_Lares_GetRangerArmor_09_07"); //谁 也 不 能 提 及 ‘ 水 之 环 ’ 。 这 是 我 们 的 首 要 规 则 。 遵 守 它 。
	AI_Output(self, other, "DIA_Addon_Lares_GetRangerArmor_09_08"); //还 有 问 题 吗 ？

	MIS_Addon_Lares_ComeToRangerMeeting = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);

	Info_ClearChoices(DIA_Addon_Lares_GetRangerArmor);
	Info_AddChoice(DIA_Addon_Lares_GetRangerArmor, "我 必 须 走 了 。", DIA_Addon_Lares_GetRangerArmor_end);
	Info_AddChoice(DIA_Addon_Lares_GetRangerArmor, "我 能 从 你 那 里 得 到 什 么 帮 助 ？", DIA_Addon_Lares_GetRangerArmor_Learn);
	Info_AddChoice(DIA_Addon_Lares_GetRangerArmor, "那 么 武 器 呢 ？", DIA_Addon_Lares_GetRangerArmor_weapons);
};

func void DIA_Addon_Lares_GetRangerArmor_weapons()
{
	AI_Output(other, self, "DIA_Addon_Lares_GetRangerArmor_weapons_15_00"); //那 么 武 器 呢 ？
	AI_Output(self, other, "DIA_Addon_Lares_GetRangerArmor_weapons_09_01"); //‘ 环 ’ 的 武 器 是 铁 头 木 棒 ， 但 是 每 个 人 都 使 用 自 己 最 惯 用 的 武 器 。
	AI_Output(self, other, "DIA_Addon_Lares_GetRangerArmor_weapons_09_02"); //这 是 我 们 的 武 器 。 我 从 没 有 真 正 弄 明 白 怎 样 用 它 ， 不 过 ， 也 许 你 可 以 运 用 这 个 东 西 。
	CreateInvItems(self, ItMw_RangerStaff_Addon, 1);
	B_GiveInvItems(self, other, ItMw_RangerStaff_Addon, 1);
};

func void DIA_Addon_Lares_GetRangerArmor_end()
{
	B_MakeRangerReadyToLeaveMeetingALL();
	AI_Output(other, self, "DIA_Addon_Lares_GetRangerArmor_end_15_00"); //我 必 须 走 了 。
	AI_Output(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_01"); //好 了 ， 那 么 我 们 不 留 你 了 。
	AI_Output(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_02"); //现 在 ， 直 接 去 找 瓦 卓 斯 ， 让 他 给 你 第 一 个 任 务 。
	AI_Output(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_03"); //‘ 环 ’ 里 的 兄 弟 们 。 现 在 ， 我 们 回 到 自 己 的 岗 位 上 去 。
	AI_Output(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_04"); //强 盗 的 攻 击 仍 然 持 续 着 。 我 们 必 须 保 证 阻 止 这 种 威 胁 。
	AI_Output(self, other, "DIA_Addon_Lares_GetRangerArmor_end_09_05"); //亚 达 诺 斯 ， 维 护 世 界 的 平 衡 。
	Lares_TakeFirstMissionFromVatras = TRUE;

	Info_ClearChoices(DIA_Addon_Lares_GetRangerArmor);
	Info_AddChoice(DIA_Addon_Lares_GetRangerArmor, DIALOG_ENDE, DIA_Addon_Lares_GetRangerArmor_weiter);
};

func void DIA_Addon_Lares_GetRangerArmor_weiter()
{
	AI_StopProcessInfos(self);
	B_RangerMeetingParking();
	B_LogEntry(TOPIC_Addon_RingOfWater, TOPIC_Addon_RingOfWater_6);
};

func void DIA_Addon_Lares_GetRangerArmor_Learn()
{
	AI_Output(other, self, "DIA_Addon_Lares_GetRangerArmor_Learn_15_00"); //我 能 从 你 那 里 得 到 什 么 帮 助 ？
	AI_Output(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_01"); //我 可 以 告 诉 你 怎 样 变 得 更 敏 捷 。

	if ((Npc_IsDead(SLD_805_Cord)) == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_02"); //如 果 你 需 要 运 用 近 战 武 器 方 面 的 帮 助 。 去 跟 考 德 谈 谈 。 他 是 一 位 剑 术 大 师 。
	};

	if ((Npc_IsDead(BAU_961_Gaan)) == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_03"); //加 安 会 很 乐 意 教 你 正 确 地 取 出 动 物 的 内 脏 。
	};

	if ((Npc_IsDead(Mil_350_Addon_Martin)) == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_04"); //马 丁 能 告 诉 你 很 多 关 于 圣 骑 士 的 事 情 。
	};

	if ((Npc_IsDead(Bau_4300_Addon_Cavalorn)) == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_05"); //卡 瓦 隆 会 教 你 潜 行 、 单 手 格 斗 和 弓 箭 术 。
	};

	if ((Npc_IsDead(BAU_970_Orlan)) == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_06"); //奥 兰 总 是 会 为 你 准 备 一 间 温 暖 的 房 间 和 床 。
	};

	AI_Output(self, other, "DIA_Addon_Lares_GetRangerArmor_Learn_09_07"); //而 关 于 魔 法 的 事 情 ， 去 跟 瓦 卓 斯 谈 谈 。
};

// ************************************************************
// 							Teleporter
// ************************************************************
instance DIA_Addon_Lares_Teleportstation(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 5;
	condition		= DIA_Addon_Lares_Teleportstation_Condition;
	information		= DIA_Addon_Lares_Teleportstation_Info;
	description		= "你 曾 经 使 用 过 传 送 石 吗 ？";
};

func int DIA_Addon_Lares_Teleportstation_Condition()
{
	if ((MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS) // SC war schon bei den Wassermagiern
	&& (SCUsed_TELEPORTER == TRUE) // SC hat schon mal einen Teleporter benutzt
	&& (MIS_Lares_BringRangerToMe != 0)) // hat Aquamarinring von Lares bekommen. -> für Orlan
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Teleportstation_Info()
{
	AI_Output(other, self, "DIA_Addon_Lares_Teleportstation_15_00"); //你 曾 经 使 用 过 传 送 石 吗 ？
	AI_Output(self, other, "DIA_Addon_Lares_Teleportstation_09_01"); //不 ， 但 是 ， 我 已 经 听 说 了 他 们 。 水 法 师 们 都 还 不 太 确 定 那 些 事 。
	AI_Output(other, self, "DIA_Addon_Lares_Teleportstation_15_02"); //我 已 经 试 过 一 次 了 。
	AI_Output(self, other, "DIA_Addon_Lares_Teleportstation_09_03"); //（ 大 笑 ） 你 当 然 试 过 。 你 什 么 都 不 怕 ， 是 吗 ？
	AI_Output(self, other, "DIA_Addon_Lares_Teleportstation_09_04"); //好 吧 。 如 果 你 想 使 用 那 些 东 西 ， 去 问 问 酒 馆 老 板 奥 兰 他 是 否 会 让 你 进 入 他 的 山 洞 。
	AI_Output(self, other, "DIA_Addon_Lares_Teleportstation_09_05"); //我 想 他 帮 助 水 法 师 把 他 客 栈 附 近 的 一 个 传 送 石 隐 蔽 起 来 了 。
	AI_Output(self, other, "DIA_Addon_Lares_Teleportstation_09_06"); //从 东 边 的 城 门 出 去 ， 沿 着 路 走 。 你 不 会 错 过 它 的 。

	B_LogEntry(TOPIC_Addon_TeleportsNW, TOPIC_Addon_TeleportsNW_3);
	Orlan_Hint_Lares = TRUE;
};

// ************************************************************
// 							Ornament
// ************************************************************
// ------------------------------------------------------------
// Ornament von Vatras
// ------------------------------------------------------------
instance DIA_Addon_Lares_Ornament(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 2;
	condition		= DIA_Addon_Lares_Ornament_Condition;
	information		= DIA_Addon_Lares_Ornament_Info;
	description		= "瓦 卓 斯 让 我 把 这 个 装 饰 性 戒 指 给 你。";
};

func int DIA_Addon_Lares_Ornament_Condition()
{
	if ((Npc_HasItems(other, ItMi_Ornament_Addon_Vatras))
	&& (Npc_KnowsInfo(other, DIA_Addon_Lares_Vatras)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Ornament_Info()
{
	AI_Output(other, self, "DIA_Addon_Lares_Ornament_15_00"); //瓦 卓 斯 给 了 我 这 个 装 饰 性 戒 指 要 我 把 它 交 给 你 。 他 说 它 应 该 被 送 回 去 。
	B_GiveInvItems(other, self, ItMi_Ornament_Addon_Vatras, 1);
	AI_Output(self, other, "DIA_Addon_Lares_Ornament_09_01"); //（ 叹 息 ） 当 然 。 这 要 看 我 了 ， 像 往 常 一 样 。 我 可 能 已 经 知 道 了 。
	AI_Output(self, other, "DIA_Addon_Lares_Ornament_09_02"); //我 不 得 不 走 过 半 个 岛 把 它 送 到 水 法 师 那 里 去 。
};

// ------------------------------------------------------------
// Ornament BringJob
// ------------------------------------------------------------
instance DIA_Addon_Lares_OrnamentBringJob(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 2;
	condition		= DIA_Addon_Lares_OrnamentBringJob_Condition;
	information		= DIA_Addon_Lares_OrnamentBringJob_Info;
	description		= "我 可 以 帮 你 把 装 饰 物 送 到 那 里 去 ！";
};

func int DIA_Addon_Lares_OrnamentBringJob_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Lares_Ornament))
	&& (MIS_Addon_Lares_Ornament2Saturas == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_OrnamentBringJob_Info()
{
	AI_Output(other, self, "DIA_Addon_Lares_OrnamentBringJob_15_00"); //我 可 以 帮 你 把 装 饰 物 送 到 那 里 去 ！
	AI_Output(self, other, "DIA_Addon_Lares_OrnamentBringJob_09_01"); //（ 沉 思 地 ） 嗯 。 我 想 我 最 好 还 是 亲 自 把 它 送 到 那 里 去 。 但 是 ， 你 可 以 跟 我 一 起 走 。
	AI_Output(self, other, "DIA_Addon_Lares_OrnamentBringJob_09_02"); //可 是 ， 我 目 前 不 能 离 开 这 里 。 我 必 须 严 密 观 察 港 口 。

	B_LogEntry(TOPIC_Addon_KDW, TOPIC_Addon_KDW_4);

	MIS_Addon_Lares_Ornament2Saturas = LOG_RUNNING;
};

// ------------------------------------------------------------
// Hol Ablösung
// ------------------------------------------------------------
instance DIA_Addon_Lares_YourMission(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 2;
	condition		= DIA_Addon_Lares_YourMission_Condition;
	information		= DIA_Addon_Lares_YourMission_Info;
	permanent		= TRUE;
	description		= "你 究 竟 在 港 口 这 里 做 什 么 ？";
};

func int DIA_Addon_Lares_YourMission_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Lares_Ornament))
	&& (MIS_Lares_BringRangerToMe == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_YourMission_Info()
{
	AI_Output(other, self, "DIA_Addon_Lares_YourMission_15_00"); //你 究 竟 在 港 口 这 里 做 什 么 ？

	if (!Npc_KnowsInfo(other, DIA_Addon_Lares_WhatAreYouGuys))
	{
		AI_Output(self, other, "DIA_Addon_Lares_YourMission_09_01"); //我 不 能 提 起 这 件 事 。
		AI_Output(self, other, "DIA_Addon_Lares_YourMission_09_02"); //瓦 卓 斯 会 要 我 的 脑 袋 … …
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Lares_YourMission_09_03"); //我 在 做 我 们 都 在 做 的 事 情 。 我 履 行 水 法 师 交 给 我 的 任 务 。
		AI_Output(self, other, "DIA_Addon_Lares_YourMission_09_04"); //失 踪 的 人 里 有 一 些 是 渔 夫 。 他 们 和 自 己 的 船 一 起 失 踪 了 。
		AI_Output(self, other, "DIA_Addon_Lares_YourMission_09_05"); //这 就 是 为 什 么 我 站 在 这 里 ， 盯 着 港 口 。 也 许 会 发 生 某 些 事 情 。
		AI_Output(self, other, "DIA_Addon_Lares_YourMission_09_06"); //但 是 ， 你 可 以 帮 助 我 。
		AI_Output(self, other, "DIA_Addon_Lares_YourMission_09_07"); //听 着 。 我 会 给 你 我 的 蓝 宝 石 戒 指 。 它 表 示 着 佩 戴 它 的 人 属 于 ‘ 水 之 环 ’ 。

		CreateInvItems(self, ItRi_Ranger_Lares_Addon, 1);
		B_GiveInvItems(self, other, ItRi_Ranger_Lares_Addon, 1);
		SC_GotLaresRing = TRUE;
		AI_Output(self, other, "DIA_Addon_Lares_YourMission_09_08"); //如 果 你 戴 上 了 我 的 戒 指 ， 我 们 的 其 它 人 会 知 道 你 是 代 表 我 行 事 的 。
		AI_Output(self, other, "DIA_Addon_Lares_YourMission_09_09"); //去 找 一 个 人 来 接 替 我 的 职 责 ， 那 么 我 就 能 把 装 饰 性 戒 指 送 回 去 了 。
		AI_Output(self, other, "DIA_Addon_Lares_YourMission_09_10"); //我 们 总 有 一 个 人 密 切 注 意 着 市 场 里 的 情 况 。 但 是 ， 我 不 知 道 现 在 是 轮 到 谁 了 。
		AI_Output(self, other, "DIA_Addon_Lares_YourMission_09_11"); //你 最 好 去 跟 所 有 站 在 那 里 的 人 谈 谈 。 一 旦 那 个 人 看 到 你 戴 着 我 的 蓝 宝 石 戒 指 ， 他 就 会 让 你 知 道 。
		AI_Output(self, other, "DIA_Addon_Lares_YourMission_09_12"); //告 诉 他 找 个 人 来 接 管 港 口 这 里 的 事 。

		B_LogEntry(TOPIC_Addon_RingOfWater, TOPIC_Addon_RingOfWater_7);

		Log_CreateTopic(TOPIC_Addon_BringRangerToLares, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_BringRangerToLares, LOG_RUNNING);
		B_LogEntry(TOPIC_Addon_BringRangerToLares, TOPIC_Addon_BringRangerToLares_1);

		MIS_Lares_BringRangerToMe = LOG_RUNNING;
	};
};

// ------------------------------------------------------------
// Baltram Abloese
// ------------------------------------------------------------
instance DIA_Addon_Lares_BaltramAbloese(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 5;
	condition		= DIA_Addon_Lares_BaltramAbloese_Condition;
	information		= DIA_Addon_Lares_BaltramAbloese_Info;
	description		= "我 已 经 同 贝 尔 卓 姆 谈 过 了 。";
};

func int DIA_Addon_Lares_BaltramAbloese_Condition()
{
	if ((MIS_Lares_BringRangerToMe == LOG_RUNNING)
	&& (Baltram_Exchange4Lares == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_BaltramAbloese_Info()
{
	AI_Output(other, self, "DIA_Addon_Lares_BaltramAbloese_15_00"); //我 已 经 跟 贝 尔 卓 姆 谈 过 了 。 他 会 找 个 人 来 接 替 你 。
	AI_Output(self, other, "DIA_Addon_Lares_BaltramAbloese_09_01"); //啊 。 很 好 。 那 么 ， 我 们 终 于 可 以 离 开 这 里 了 。
	if (SC_IsRanger == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Lares_BaltramAbloese_09_02"); //你 现 在 最 好 保 管 好 我 的 蓝 宝 石 戒 指 。

		if (Npc_KnowsInfo(other, DIA_Addon_Lares_WannaBeRanger))
		{
			AI_Output(self, other, "DIA_Addon_Lares_BaltramAbloese_09_03"); //（ 微 笑 ） 我 想 你 迟 早 能 用 得 上 它 。
		}
		else
		{
			AI_Output(self, other, "DIA_Addon_Lares_BaltramAbloese_09_04"); //（ 微 笑 ） 我 想 你 迟 早 能 用 得 上 它 。
		};
	};

	MIS_Lares_BringRangerToMe = LOG_SUCCESS;
	Lares_CanBringScToPlaces = TRUE;
};

// ************************************************************
// 						Missing People
// ************************************************************
// ------------------------------------------------------------
// About Missing People
// ------------------------------------------------------------
var int Lares_PeopleMissing_PERM;
// ------------------------------------------------------------
instance DIA_Addon_Lares_PeopleMissing(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 3;
	condition		= DIA_Addon_Lares_PeopleMissing_Condition;
	information		= DIA_Addon_Lares_PeopleMissing_Info;
	permanent		= TRUE;
	description		= "关 于 那 些 失 踪 的 人 … …";
};

func int DIA_Addon_Lares_PeopleMissing_Condition()
{
	if ((Lares_RangerHelp == TRUE)
	&& (Lares_PeopleMissing_PERM == FALSE)
	&& ((SC_IsRanger == FALSE) || (MissingPeopleReturnedHome == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_PeopleMissing_Info()
{
	AI_Output(other, self, "DIA_Addon_Lares_PeopleMissing_15_00"); //关 于 那 些 失 踪 的 人 … …
	Info_ClearChoices(DIA_Addon_Lares_PeopleMissing);
	Info_AddChoice(DIA_Addon_Lares_PeopleMissing, DIALOG_BACK, DIA_Addon_Lares_PeopleMissing_BACK);
	if (MissingPeopleReturnedHome == TRUE)
	{
		Info_AddChoice(DIA_Addon_Lares_PeopleMissing, "我 已 经 救 了 一 些 失 踪 的 人 。", DIA_Addon_Lares_PeopleMissing_SAVED);
	}
	else if ((MIS_Lares_BringRangerToMe != 0)
	&& (SCKnowsMissingPeopleAreInAddonWorld == TRUE)
	&& (MissingPeopleReturnedHome == FALSE))
	{
		Info_AddChoice(DIA_Addon_Lares_PeopleMissing, "我 知 道 那 些 失 踪 的 人 发 生 了 什 么 事 。", DIA_Addon_Lares_PeopleMissing_Success);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Lares_PeopleMissing, "这 不 是 民 兵 的 事 吗 ？", DIA_Addon_Lares_PeopleMissing_MIL);
		Info_AddChoice(DIA_Addon_Lares_PeopleMissing, "告 诉 我 你 知 道 些 什 么 。", DIA_Addon_Lares_PeopleMissing_TellMe);
	};
};

func void DIA_Addon_Lares_PeopleMissing_BACK()
{
	Info_ClearChoices(DIA_Addon_Lares_PeopleMissing);
};

func void DIA_Addon_Lares_PeopleMissing_TellMe()
{
	AI_Output(other, self, "DIA_Addon_Lares_PeopleMissing_TellMe_15_00"); //告 诉 我 你 知 道 些 什 么 。
	AI_Output(self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_01"); //首 先 是 威 廉 ， 他 是 克 霍 里 尼 斯 这 里 的 一 个 渔 夫 。 有 一 天 ， 他 没 回 来 。
	AI_Output(self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_02"); //开 始 ， 我 们 以 为 是 一 只 海 怪 把 他 和 他 的 船 当 作 早 餐 吃 掉 了 。
	AI_Output(self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_03"); //但 是 没 过 多 久 ， 其 它 的 人 开 始 在 城 里 和 这 附 近 失 踪 了 。 真 是 非 常 没 有 规 律 的 事 。
	AI_Output(self, other, "DIA_Addon_Lares_PeopleMissing_TellMe_09_04"); //到 目 前 为 止 ， 每 个 人 都 迷 惑 不 解 。 看 来 ， 我 们 只 能 是 等 着 偶 然 发 现 一 条 线 索 。

	if (SC_HearedAboutMissingPeople == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
		B_LogEntry(TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl);
	};

	Log_CreateTopic(TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_MissingPeople, LogText_Addon_WilliamMissing);

	SC_HearedAboutMissingPeople = TRUE;
};

func void DIA_Addon_Lares_PeopleMissing_MIL()
{
	AI_Output(other, self, "DIA_Addon_Lares_PeopleMissing_MIL_15_00"); //这 不 是 民 兵 的 事 吗 ？
	AI_Output(self, other, "DIA_Addon_Lares_PeopleMissing_MIL_09_01"); //那 些 民 兵 完 全 没 有 作 用 ， 如 果 要 我 说 的 话 。
	AI_Output(self, other, "DIA_Addon_Lares_PeopleMissing_MIL_09_02"); //他 们 永 远 弄 不 清 这 件 事 情 。 那 些 失 踪 的 人 就 那 样 消 失 在 空 气 中 了 。
};

func void DIA_Addon_Lares_PeopleMissing_Success()
{
	AI_Output(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_00"); //我 知 道 那 些 失 踪 的 人 发 生 了 什 么 事 ！
	AI_Output(self, other, "DIA_Addon_Lares_PeopleMissing_Success_09_01"); //（ 感 到 惊 讶 的 ） 真 的 。
	AI_Output(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_02"); //以 前 的 矿 石 大 亨 瑞 雯 绑 架 了 他 们 。
	AI_Output(self, other, "DIA_Addon_Lares_PeopleMissing_Success_09_03"); //你 确 定 吗 ？ 那 么 ， 我 们 必 须 设 法 把 他 们 从 那 里 救 出 来 。
	AI_Output(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_04"); //我 正 在 调 查。
	AI_Output(self, other, "DIA_Addon_Lares_PeopleMissing_Success_09_05"); //好 吧 。 但 是 ， 你 知 道 ， 无 论 何 时 你 想 要 我 帮 忙 … …
	AI_Output(other, self, "DIA_Addon_Lares_PeopleMissing_Success_15_06"); //… … 那 么 ， 我 会 知 道 去 哪 里 找 你 。 明 白 了 。
	Lares_CanBringScToPlaces = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_PeopleMissing);
};

func void DIA_Addon_Lares_PeopleMissing_SAVED()
{
	AI_Output(other, self, "DIA_Addon_Lares_PeopleMissing_SAVED_15_00"); //我 已 经 救 了 一 些 失 踪 的 人 。
	AI_Output(self, other, "DIA_Addon_Lares_PeopleMissing_SAVED_09_01"); //我 就 知 道 你 会 成 功 的 。 那 么 现 在 我 终 于 能 去 干 我 自 己 的 事 情 了 。
	B_GivePlayerXP(XP_Ambient);
	Lares_PeopleMissing_PERM = TRUE;
	Lares_CanBringScToPlaces = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_PeopleMissing);
};

// ************************************************************
// 								Hilfe
// ************************************************************
var int DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe;
var int DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld;
var int DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung;
// ------------------------------------------------------------
instance DIA_Addon_Lares_RangerHelp(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 2;
	condition		= DIA_Addon_Lares_RangerHelp_Condition;
	information		= DIA_Addon_Lares_RangerHelp_Info;
	permanent		= TRUE;
	description		= "我 需 要 你 的 帮 助。";
};

func int DIA_Addon_Lares_RangerHelp_Condition()
{
	if (
	(
	(Lares_RangerHelp == TRUE)
	&& (DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe == FALSE)
	&& (DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld == FALSE)
	&& (DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung == FALSE)
	)
	|| (Npc_IsInState(Moe, ZS_Attack)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_RangerHelp_Info()
{
	AI_Output(other, self, "DIA_Addon_Lares_RangerHelp_15_00"); //我 需 要 你 的 帮 助 。
	AI_Output(self, other, "DIA_Addon_Lares_RangerHelp_09_01"); //你 真 正 在 想 些 什 么 ？

	Info_ClearChoices(DIA_Addon_Lares_RangerHelp);
	Info_AddChoice(DIA_Addon_Lares_RangerHelp, DIALOG_BACK, DIA_Addon_Lares_RangerHelp_nix);

	if (Npc_IsInState(Moe, ZS_Attack))
	{
		Info_AddChoice(DIA_Addon_Lares_RangerHelp, "那 个 家 伙 在 纠 缠 我 ！", DIA_Addon_Lares_RangerHelp_Moe);
	};

	if ((DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe == FALSE)
	&& (Lares_RangerHelp == TRUE))
	{
		Info_AddChoice(DIA_Addon_Lares_RangerHelp, "我 需 要 一 件 更 好 的 武 器 。", DIA_Addon_Lares_RangerHelp_waffe);
	};

	if ((DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung == FALSE)
	&& (Lares_RangerHelp == TRUE))
	{
		Info_AddChoice(DIA_Addon_Lares_RangerHelp, "一 些 更 好 的 盔 甲 怎 么 样 ？", DIA_Addon_Lares_RangerHelp_ruestung);
	};

	if ((DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld == FALSE)
	&& (Lares_RangerHelp == TRUE))
	{
		Info_AddChoice(DIA_Addon_Lares_RangerHelp, "我 需 要 一 些 钱 。", DIA_Addon_Lares_RangerHelp_geld);
	};
};

func void DIA_Addon_Lares_RangerHelp_ruestung()
{
	AI_Output(other, self, "DIA_Addon_Lares_RangerHelp_ruestung_15_00"); //一 些 更 好 的 盔 甲 怎 么 样 ？
	AI_Output(self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_01"); //嗯 。 麦 迪 欧 出 售 盔 甲 。 但 是 ， 他 也 许 会 向 你 要 非 常 高 昂 的 价 格 。
	AI_Output(self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_02"); //然 而 ， 有 一 个 方 法 会 让 它 便 宜 点 ， 如 果 你 不 介 意 骗 骗 那 些 民 兵 的 话 … …
	AI_Output(other, self, "DIA_Addon_Lares_RangerHelp_ruestung_15_03"); //你 是 什 么 意 思 ？
	AI_Output(self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_04"); //在 麦 迪 欧 的 房 子 边 上 有 一 个 仓 库 区 。 不 过 ， 所 有 商 品 都 被 民 兵 充 了 公 。
	AI_Output(self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_05"); //去 市 场 里 找 祖 里 斯 ， 给 自 己 弄 个 睡 眠 魔 法 。 然 后 ， 把 那 些 守 卫 送 到 梦 乡 里 去 。
	AI_Output(self, other, "DIA_Addon_Lares_RangerHelp_ruestung_09_06"); //我 敢 肯 定 你 会 在 麦 迪 欧 的 存 货 里 发 现 一 些 像 样 的 盔 甲 … …
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung = TRUE;
};

func void DIA_Addon_Lares_RangerHelp_waffe()
{
	AI_Output(other, self, "DIA_Addon_Lares_RangerHelp_waffe_15_00"); //我 需 要 一 件 更 好 的 武 器 。
	AI_Output(self, other, "DIA_Addon_Lares_RangerHelp_waffe_09_01"); //我 恐 怕 这 件 事 我 做 不 来 。 你 去 市 场 试 过 吗 ？
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe = TRUE;
};

func void DIA_Addon_Lares_RangerHelp_geld()
{
	AI_Output(other, self, "DIA_Addon_Lares_RangerHelp_geld_15_00"); //我 需 要 一 些 钱 。
	AI_Output(self, other, "DIA_Addon_Lares_RangerHelp_geld_09_01"); //我 们 都 没 有 ？ 对 不 起 ， 但 是 ， 我 没 有 什 么 东 西 能 给 你 。 不 过 ， 放 高 利 贷 的 雷 玛 尔 还 欠 我 一 个 人 情 。
	AI_Output(self, other, "DIA_Addon_Lares_RangerHelp_geld_09_02"); //去 找 他 借 你 想 要 的 数 目 。 我 会 处 理 其 余 的 事 情 。 你 会 发 现 雷 玛 尔 在 港 口 区 ， 那 里 跟 城 里 的 贫 民 区 很 近 。
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld = TRUE;
	RangerHelp_LehmarKohle = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_RangerHelp);
};

func void DIA_Addon_Lares_RangerHelp_nix()
{
	Info_ClearChoices(DIA_Addon_Lares_RangerHelp);
};

// ------------------------------------------------------------
// Moe
// ------------------------------------------------------------
func void DIA_Addon_Lares_RangerHelp_Moe()
{
	AI_Output(other, self, "DIA_Addon_Lares_Moe_15_00"); //那 个 家 伙 正 在 纠 缠 我 … …
	AI_Output(self, other, "DIA_Addon_Lares_Moe_09_01"); //不 会 太 久 的 … …
	Info_ClearChoices(DIA_Addon_Lares_RangerHelp);
	AI_StopProcessInfos(self);
	other.aivar[AIV_INVINCIBLE] = FALSE;
	B_Attack(self, Moe, AR_GuardStopsFight, 0);
};

// ************************************************************
// *** ***
// 							Gothic II
// *** ***
// ************************************************************

// ************************************************************
// 			  			Paladine und GILDE
// ************************************************************
// ------------------------------------------------------------
// Paladine
// ------------------------------------------------------------
instance DIA_Lares_Paladine(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 4;
	condition		= DIA_Lares_Paladine_Condition;
	information		= DIA_Lares_Paladine_Info;
	description		= "无 论 如 何 我 必 须 同 圣 骑 士 谈 谈 ！";
};

func int DIA_Lares_Paladine_Condition()
{
	if ((other.guild == GIL_NONE)
	&& (RangerHelp_gildeMIL == FALSE)
	&& (RangerHelp_gildeSLD == FALSE)
	&& (RangerHelp_gildeKDF == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_Paladine_Info()
{
	AI_Output(other, self, "DIA_Lares_Paladine_15_00"); //我 必 须 跟 那 些 圣 骑 士 谈 谈 ， 尽 一 切 可 能 ！
	AI_Output(self, other, "DIA_Lares_Paladine_09_01"); //你 想 跟 他 们 要 什 么 ？
	AI_Output(other, self, "DIA_Lares_Paladine_15_02"); //他 们 有 一 个 威 力 巨 大 的 护 身 符 ， 就 是 英 诺 斯 之 眼 。 我 必 须 得 到 它 。
	AI_Output(self, other, "DIA_Lares_Paladine_09_03"); //那 么 ， 你 认 为 他 们 会 把 它 给 你 ？ 你 进 不 了 城 里 的 富 人 区 。
	if (!Npc_KnowsInfo(other, DIA_Addon_Lares_Vatras))
	{
		AI_Output(other, self, "DIA_Lares_Paladine_15_04"); //反 正 我 会 找 到 一 个 方 法。
		AI_Output(self, other, "DIA_Lares_Paladine_09_05"); //当 然 ， 如 果 你 想 迎 合 那 些 市 民 或 者 给 民 兵 当 跑 腿 的 … …
	};

	// AI_Output(other, self, "DIA_Lares_Alternative_15_00"); // Hab' ich eine Alternative?
	// AI_Output(self, other, "DIA_Lares_Alternative_09_01"); // Wenn ich du wäre, würde ich zu Onars Hof gehen und mit Lee reden.
	// AI_Output(self, other, "DIA_Lares_Alternative_09_02"); // Ich bin mir sicher, wir finden einem Weg, dich ins obere Viertel zu bringen.
};

// ------------------------------------------------------------
// 			  			Warum Paladine hier?
// ------------------------------------------------------------
instance DIA_Lares_WhyPalHere(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 4;
	condition		= DIA_Lares_WhyPalHere_Condition;
	information		= DIA_Lares_WhyPalHere_Info;
	description		= "你 知 道 为 什 么 圣 骑 士 在 这 里 吗 ？";
};

func int DIA_Lares_WhyPalHere_Condition()
{
	if (other.guild == GIL_NONE)
	{
		if ((Npc_KnowsInfo(other, DIA_Lares_Paladine))
		|| (RangerHelp_gildeMIL == TRUE)
		|| (RangerHelp_gildeSLD == TRUE)
		|| (RangerHelp_gildeKDF == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Lares_WhyPalHere_Info()
{
	AI_Output(other, self, "DIA_Lares_WhyPalHere_15_00"); //你 知 道 为 什 么 圣 骑 士 在 这 里 吗 ？
	AI_Output(self, other, "DIA_Lares_WhyPalHere_09_01"); //没 有 人 能 确 定 … … 很 多 人 认 为 那 是 因 为 兽 人 ， 但 是 ， 我 想 还 有 别 的 原 因 。
	AI_Output(self, other, "DIA_Lares_WhyPalHere_09_02"); //也 许 有 些 事 情 跟 以 前 那 个 罪 犯 流 放 地 有 关 。
};

// ------------------------------------------------------------
// 			  			Guild Bypass
// ------------------------------------------------------------
instance DIA_Addon_Lares_Gilde(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 5;
	condition		= DIA_Addon_Lares_Gilde_Condition;
	information		= DIA_Addon_Lares_Gilde_Info;
	permanent		= TRUE;
	description		= "瓦 卓 斯 说 你 能 帮 助 我 加 入 一 个 组 织 。";
};

func int DIA_Addon_Lares_Gilde_Condition()
{
	if ((Lares_RangerHelp == TRUE)
	&& (other.guild == GIL_NONE)
	&& (RangerHelp_gildeMIL == FALSE)
	&& (RangerHelp_gildeSLD == FALSE)
	&& (RangerHelp_gildeKDF == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Gilde_Info()
{
	AI_Output(other, self, "DIA_Addon_Lares_Gilde_15_00"); //瓦 卓 斯 说 你 能 帮 助 我 加 入 一 个 组 织 。
	AI_Output(self, other, "DIA_Addon_Lares_Gilde_09_01"); //（ 大 笑 ） 厌 倦 了 做 个 下 等 人 ， 是 吗 ？
	AI_Output(self, other, "DIA_Addon_Lares_Gilde_09_02"); //好 吧 。 我 知 道 你 的 观 点 。
	AI_Output(self, other, "DIA_Addon_Lares_Gilde_09_03"); //如 果 你 想 投 奔 李 ， 我 可 以 对 那 些 雇 佣 兵 发 挥 我 的 影 响 力 。
	AI_Output(self, other, "DIA_Addon_Lares_Gilde_09_04"); //而 且 ， 我 敢 肯 定 我 们 能 找 到 一 个 方 法 ， 让 你 很 快 就 进 入 修 道 院 。
	AI_Output(self, other, "DIA_Addon_Lares_Gilde_09_05"); //不 过 ， 对 你 来 说 最 简 单 的 事 肯 定 是 加 入 民 兵 。
	AI_Output(self, other, "DIA_Addon_Lares_Gilde_09_06"); //你 更 喜 欢 那 个 组 织 ？

	Info_ClearChoices(DIA_Addon_Lares_Gilde);
	Info_AddChoice(DIA_Addon_Lares_Gilde, "我 会 再 考 虑 一 下..", DIA_Addon_Lares_Gilde_BACK);
	Info_AddChoice(DIA_Addon_Lares_Gilde, "火 魔 法 师 的 组 织 。", DIA_Addon_Lares_Gilde_KDF);
	Info_AddChoice(DIA_Addon_Lares_Gilde, "雇 佣 兵 的 组 织 。", DIA_Addon_Lares_Gilde_SLD);
	Info_AddChoice(DIA_Addon_Lares_Gilde, "民 兵 的 组 织 。", DIA_Addon_Lares_Gilde_MIL);
};

func void DIA_Addon_Lares_Gilde_BACK()
{
	AI_Output(other, self, "DIA_Addon_Lares_Gilde_BACK_15_00"); //我 必 须 考 虑 一 下 这 件 事 … …
	Info_ClearChoices(DIA_Addon_Lares_Gilde);
};

func void DIA_Addon_Lares_Gilde_SLD()
{
	AI_Output(other, self, "DIA_Addon_Lares_Gilde_SLD_15_00"); //雇 佣 兵 组 织 。
	AI_Output(self, other, "DIA_Addon_Lares_Gilde_SLD_09_01"); //我 敢 肯 定 李 会 接 纳 你 。
	AI_Output(self, other, "DIA_Addon_Lares_Gilde_SLD_Add_09_01"); //但 是 首 先 你 将 必 须 通 过 一 个 测 试 。
	AI_Output(self, other, "DIA_Addon_Lares_Gilde_SLD_09_02"); //去 欧 纳 尔 的 农 场 跟 考 德 谈 谈 。
	AI_Output(self, other, "DIA_Addon_Lares_Gilde_SLD_Add_09_02"); //他 能 帮 你 通 过 测 试 。
	AI_Output(self, other, "DIA_Addon_Lares_Gilde_SLD_09_03"); //告 诉 他 你 ‘ 住 在 我 的 翅 膀 下 面 ’ 。 他 就 会 明 白 了 。
	RangerHelp_gildeSLD = TRUE;

	Log_CreateTopic(TOPIC_Addon_RangerHelpSLD, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpSLD, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_RangerHelpSLD, TOPIC_Addon_RangerHelpSLD_3);

	SC_KnowsCordAsRangerFromLares = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_Gilde);
};

func void DIA_Addon_Lares_Gilde_MIL()
{
	AI_Output(other, self, "DIA_Addon_Lares_Gilde_MIL_15_00"); //民 兵 组 织 。
	AI_Output(self, other, "DIA_Addon_Lares_Gilde_MIL_09_01"); //（ 开 心 的 ） 是 的 。 我 可 以 想 像 你 喜 欢 那 样 ， 是 吗 ？ 在 你 扒 窃 人 们 的 钱 包 时 对 他 们 念 诵 法 律 。
	AI_Output(self, other, "DIA_Addon_Lares_Gilde_MIL_09_02"); //那 些 圣 骑 士 把 他 们 的 供 应 品 储 备 堆 放 在 港 口 上 。 他 们 的 供 应 品 主 管 是 我 的 一 位 好 朋 友 。
	AI_Output(self, other, "DIA_Addon_Lares_Gilde_MIL_09_03"); //也 许 他 能 为 你 做 些 事 情 。 他 叫 马 丁 。

	Log_CreateTopic(TOPIC_Addon_RangerHelpMIL, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpMIL, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_RangerHelpMIL, TOPIC_Addon_RangerHelpMIL_1);

	RangerHelp_gildeMIL = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_Gilde);
};

func void DIA_Addon_Lares_Gilde_KDF()
{
	AI_Output(other, self, "DIA_Addon_Lares_Gilde_KDF_15_00"); //火 魔 法 师 组 织。
	AI_Output(self, other, "DIA_Addon_Lares_Gilde_KDF_09_01"); //（ 大 笑 ） 我 打 赌 瓦 卓 斯 没 有 预 见 到 ， 否 则 他 不 会 把 你 派 到 我 这 里 来 。
	AI_Output(self, other, "DIA_Addon_Lares_Gilde_KDF_09_02"); //加 入 修 道 院 太 贵 了 。
	AI_Output(self, other, "DIA_Addon_Lares_Gilde_KDF_09_03"); //除 非 你 送 给 他 们 一 份 礼 物 ， 否 则 那 些 家 伙 甚 至 不 会 让 你 进 门 。
	AI_Output(self, other, "DIA_Addon_Lares_Gilde_KDF_09_04"); //唯 一 能 帮 上 一 些 忙 的 人 是 瓦 卓 斯 本 人 。 你 最 好 再 跟 他 谈 谈 这 件 事 。

	Log_CreateTopic(TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_RangerHelpKDF, TOPIC_Addon_RangerHelpKDF_1);

	RangerHelp_gildeKDF = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_Gilde);
};

// ------------------------------------------------------------
// 			  					About Sld
// ------------------------------------------------------------
var int Lares_WorkForLee;
var int Lares_WayToOnar;
// ------------------------------------------------------------
instance DIA_Lares_AboutSld(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 10;
	condition		= DIA_Lares_AboutSld_Condition;
	information		= DIA_Lares_AboutSld_Info;
	permanent		= TRUE;
	description		= "多 告 诉 我 一 些 关 于 李 和 他 的 雇 佣 兵 的 事 … …";
};

func int DIA_Lares_AboutSld_Condition()
{
	if ((other.guild == GIL_NONE)
	&& (Lares_WayToOnar == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_AboutSld_Info()
{
	AI_Output(other, self, "DIA_ADDON_Lares_AboutSld_15_00"); //多 告 诉 我 一 些 关 于 李 和 他 的 雇 佣 兵 的 事 … …
	AI_Output(self, other, "DIA_ADDON_Lares_AboutSld_09_01"); //你 想 知 道 什 么 ？

	Info_ClearChoices(DIA_Lares_AboutSld);
	Info_AddChoice(DIA_Lares_AboutSld, DIALOG_BACK, DIA_Lares_AboutSld_BACK);
	Info_AddChoice(DIA_Lares_AboutSld, "你 为 什 么 没 有 和 李 以 及 他 的 雇 佣 兵 们 在 一 起 ？", DIA_Lares_AboutSld_WhyNotYou);
	Info_AddChoice(DIA_Lares_AboutSld, "再 告 诉 我 一 些 关 于 雇 佣 兵 的 事 … …", DIA_Lares_AboutSld_Sld);
	Info_AddChoice(DIA_Lares_AboutSld, "我 怎 么 找 到 地 主 的 农 场 ？", DIA_Lares_AboutSld_WayToOnar);
};

func void DIA_Lares_AboutSld_BACK()
{
	Info_ClearChoices(DIA_Lares_AboutSld);
};

func void DIA_Lares_AboutSld_Sld()
{
	AI_Output(other, self, "DIA_Lares_AboutSld_15_00"); //再 告 诉 我 一 些 关 于 雇 佣 兵 的 事 。
	AI_Output(self, other, "DIA_Lares_AboutSld_09_01"); //好 吧 ， 如 果 你 还 跟 以 前 那 样 强 悍 的 话 ， 你 跟 他 们 之 间 就 不 会 有 任 何 问 题 。
	AI_Output(self, other, "DIA_Lares_AboutSld_09_02"); //他 们 大 部 分 都 是 流 氓 出 身 ， 如 果 你 顶 不 住 他 们 ， 你 就 坚 持 不 了 多 久 。
	AI_Output(self, other, "DIA_Lares_AboutSld_09_03"); //（ 大 笑 ） 如 果 你 过 分 拘 谨 ， 你 就 没 有 机 会 加 入 他 们 … …
};

func void DIA_Lares_AboutSld_WhyNotYou()
{
	AI_Output(other, self, "DIA_Lares_WhyInCity_15_00"); //为 什 么 你 不 和 李 以 及 他 的 雇 佣 兵 在 一 起 ？
	AI_Output(self, other, "DIA_Lares_WhyInCity_09_01"); //我 在 ！但 不 是 待 在 农 场 。
	AI_Output(self, other, "DIA_Lares_WhyInCity_09_02"); //你 可 以 说 我 是 我 们 在 城 里 的 前 哨 。 我 们 不 希 望 那 艘 船 没 装 上 我 们 就 启 航 了 。
	// AI_Output(self, other, "DIA_Lares_WhyInCity_09_03"); // Warum bist DU in die Stadt gekommen?
	Lares_WorkForLee = TRUE;

	Info_AddChoice(DIA_Lares_AboutSld, "你 说 的 是 什 么 船 ？", DIA_Lares_AboutSld_Schiff);
};

func void DIA_Lares_AboutSld_Schiff()
{
	AI_Output(other, self, "DIA_Lares_Schiff_15_00"); //你 说 的 是 什 么 船 ？
	AI_Output(self, other, "DIA_Lares_Schiff_09_01"); //它 停 在 一 个 开 放 的 海 港 上 ， 悬 崖 的 后 面 。 李 和 他 的 几 个 人 非 常 想 离 开 这 里 。
	AI_Output(self, other, "DIA_Lares_Schiff_09_02"); //但 那 需 要 一 些 时 间 … …
	AI_Output(other, self, "DIA_Lares_Schiff_15_03"); //为 什 么 ？
	AI_Output(self, other, "DIA_Lares_Schiff_09_04"); //你 最 好 去 问 问 李 这 件 事 ， 如 果 你 见 到 他 … … 他 有 一 些 计 划 。
};

func void DIA_Lares_AboutSld_WayToOnar()
{
	AI_Output(other, self, "DIA_Lares_WegZumHof_15_00"); //我 怎 么 找 到 地 主 的 农 场 ？
	AI_Output(self, other, "DIA_Addon_Lares_WegZumHof_09_00"); //这 非 常 简 单 。 你 从 东 门 离 开 城 市 ， 然 后 沿 着 路 往 东 走 。
	AI_Output(self, other, "DIA_Addon_Lares_WegZumHof_09_01"); //如 果 你 想 要 的 话 ， 我 能 带 你 到 那 里 去 。
	// AI_Output(self, other, "DIA_Lares_WegZumHof_09_01"); // Ich kann dich hinbringen, wenn du willst. Hab sowieso schon zu lange hier rumgehangen.
	// AI_Output(self, other, "DIA_Lares_WegZumHof_09_02"); // Hier im Hafen gibt es zwar für gewöhnlich keine Miliz, aber ich muss ja nicht riskieren, dass einer von ihnen Verdacht schöpft ...
	Lares_WayToOnar = TRUE;
};

// ************************************************************
// 			  			GuildOfThieves
// ************************************************************
// ------------------------------------------------------------
// About Thieves
// ------------------------------------------------------------
instance DIA_Lares_GuildOfThieves(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 14;
	condition		= DIA_Lares_GuildOfThieves_Condition;
	information		= DIA_Lares_GuildOfThieves_Info;
	description		= "你 知 道 什 么 关 于 镇 上 的 盗 贼 公 会 的 事 情 吗 ？";
};

func int DIA_Lares_GuildOfThieves_Condition()
{
	if (MIS_Andre_GuildOfThieves == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Lares_GuildOfThieves_Info()
{
	AI_Output(other, self, "DIA_Lares_GuildOfThieves_15_00"); //你 知 道 什 么 关 于 镇 上 的 盗 贼 公 会 的 事 情 吗 ？
	AI_Output(self, other, "DIA_Lares_GuildOfThieves_09_01"); //你 问 的 这 个 问 题 … …
	AI_Output(self, other, "DIA_Lares_GuildOfThieves_09_02"); //当 然 ， 这 里 有 一 个 盗 贼 公 会 。 就 像 任 何 一 个 大 城 市 一 样 。
	AI_Output(self, other, "DIA_Lares_GuildOfThieves_09_03"); //不 知 怎 么 每 一 个 小 扒 手 或 是 销 赃 者 都 有 可 能 跟 它 有 联 系 。
};

// ------------------------------------------------------------
// Wo finden?
// ------------------------------------------------------------
instance DIA_Lares_WhereGuildOfThieves(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 15;
	condition		= DIA_Lares_WhereGuildOfThieves_Condition;
	information		= DIA_Lares_WhereGuildOfThieves_Info;
	description		= "你 知 道 我 在 哪 里 能 找 到 这 个 盗 贼 公 会 ？ ";
};

func int DIA_Lares_WhereGuildOfThieves_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lares_GuildOfThieves))
	&& (DG_gefunden == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_WhereGuildOfThieves_Info()
{
	AI_Output(other, self, "DIA_Lares_WhereGuildOfThieves_15_00"); //你 知 道 我 在 哪 里 能 找 到 这 个 盗 贼 公 会 ？
	AI_Output(self, other, "DIA_Lares_WhereGuildOfThieves_09_01"); //（ 大 笑 ） 别 见 怪 ， 不 过 即 使 我 知 道 ， 我 也 不 会 告 诉 你 任 何 事 。
	AI_Output(self, other, "DIA_Lares_WhereGuildOfThieves_09_02"); //这 些 人 通 常 对 这 样 的 事 反 映 太 过 敏 感 。
	AI_Output(self, other, "DIA_Lares_WhereGuildOfThieves_09_03"); //如 果 你 想 结 交 他 们 ， 你 得 特 别 小 心 。
};

// ------------------------------------------------------------
// Meersalz Schlüssel
// ------------------------------------------------------------
instance DIA_Lares_GotKey(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 16;
	condition		= DIA_Lares_GotKey_Condition;
	information		= DIA_Lares_GotKey_Info;
	description		= "我 得 到 了 这 把 钥 匙 。 它 已 经 被 海 盐 腐 蚀 了 … …";
};

func int DIA_Lares_GotKey_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lares_WhereGuildOfThieves))
	&& (Npc_HasItems(other, ItKe_ThiefGuildKey_MIS))
	&& (DG_gefunden == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_GotKey_Info()
{
	AI_Output(other, self, "DIA_Lares_GotKey_15_00"); //我 得 到 了 这 把 钥 匙 。 它 已 经 被 海 盐 腐 蚀 了 … …
	AI_Output(self, other, "DIA_Lares_GotKey_09_01"); //所 以 ？
	AI_Output(other, self, "DIA_Lares_GotKey_15_02"); //我 想 那 会 指 引 我 找 到 盗 贼 公 会 的 落 脚 点 … …
	AI_Output(self, other, "DIA_Lares_GotKey_09_03"); //嗯 ， 那 应 该 是 通 往 下 水 道 的 钥 匙 。
};

// ------------------------------------------------------------
// Kanalisation
// ------------------------------------------------------------
instance DIA_Lares_Kanalisation(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 17;
	condition		= DIA_Lares_Kanalisation_Condition;
	information		= DIA_Lares_Kanalisation_Info;
	description		= "我 在 哪 里 能 找 到 下 水 道 ？";
};

func int DIA_Lares_Kanalisation_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lares_GotKey))
	&& (DG_gefunden == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_Kanalisation_Info()
{
	AI_Output(other, self, "DIA_Lares_Kanalisation_15_00"); //我 在 哪 里 能 找 到 下 水 道 ？
	AI_Output(self, other, "DIA_Lares_Kanalisation_09_01"); //据 我 所 知 … … 它 们 一 直 通 到 大 海 。
};

// ************************************************************
// 		  			Important für andere Gilden
// ************************************************************
instance DIA_Lares_OtherGuild(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 1;
	condition		= DIA_Lares_OtherGuild_Condition;
	information		= DIA_Lares_OtherGuild_Info;
	important		= TRUE;
};

func int DIA_Lares_OtherGuild_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (other.guild != GIL_NONE)
	&& (SC_IsRanger == FALSE)) // ADDON
	{
		return TRUE;
	};
};

func void DIA_Lares_OtherGuild_Info()
{
	if ((other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL))
	{
		if (other.guild == GIL_MIL)
		{
			AI_Output(self, other, "DIA_Lares_OtherGuild_09_00"); //你 现 在 加 入 了 民 兵 ！
			AI_Output(self, other, "DIA_Lares_OtherGuild_09_01"); //（ 大 笑 ） 我 快 把 自 己 笑 晕 了 - 一 个 从 前 的 囚 犯 加 入 了 民 兵 … …
		}
		else // GIL_PAL
		{
			AI_Output(self, other, "DIA_Lares_OtherGuild_09_02"); //那 么 ， 现 在 你 是 一 位 国 王 的 圣 骑 士 了 ！
		};

		AI_Output(self, other, "DIA_Lares_OtherGuild_09_03"); //（ 顽 皮 地 ） 只 有 你 能 实 现 那 样 的 事 情 … …

		if (Lares_WorkForLee == TRUE)
		{
			AI_Output(self, other, "DIA_Lares_OtherGuild_09_04"); //（ 关 心 的 ） 你 不 会 揭 发 我 是 为 李 工 作 的 吧 ， 是 吗 ？
			AI_Output(other, self, "DIA_Lares_OtherGuild_15_05"); //但 是 ， 你 知 道 我 … …
		};
	};

	if ((other.guild == GIL_KDF)
	|| (other.guild == GIL_NOV))
	{
		AI_Output(self, other, "DIA_Lares_OtherGuild_09_06"); //我 没 明 白 。 你 进 入 了 修 道 院 。 那 里 是 什 么 样 子 ？
		AI_Output(other, self, "DIA_Lares_OtherGuild_15_07"); //不 一 样 。
		AI_Output(self, other, "DIA_Lares_OtherGuild_09_08"); //我 能 想 像 的 到 。
	};

	if ((other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG))
	{
		// AI_Output(self, other, "DIA_Lares_OtherGuild_09_09"); // Ich hab gehört, du bist aufgenommen worden.
		AI_Output(self, other, "DIA_Addon_Lares_OtherGuild_09_00"); //我 听 说 你 已 经 得 到 许 可 加 入 李 的 雇 佣 兵 了 。
		AI_Output(self, other, "DIA_Lares_OtherGuild_09_10"); //恭 喜 你 。
	};
};

// ************************************************************
// *** ***
// 							Die Latscherei
// *** ***
// ************************************************************
instance DIA_Addon_Lares_Forest(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 9;
	condition		= DIA_Addon_Lares_Forest_Condition;
	information		= DIA_Addon_Lares_Forest_Info;
	description		= "你 能 帮 我 设 法 穿 过 东 边 那 片 茂 密 的 树 林 吗 ？";
};

func int DIA_Addon_Lares_Forest_Condition()
{
	if (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Forest_info()
{
	AI_Output(other, self, "DIA_Addon_Lares_RangerHelp_Forest_15_00"); //你 能 帮 我 设 法 穿 过 东 边 那 片 茂 密 的 树 林 吗 ？
	AI_Output(self, other, "DIA_Addon_Lares_RangerHelp_Forest_09_01"); //好 啊 。 不 过 ， 你 想 要 去 那 里 干 什 么 ？
	AI_Output(other, self, "DIA_Addon_Lares_RangerHelp_Forest_15_02"); //内 法 利 尔 斯 命 令 我 去 找 更 多 的 装 饰 物 。
	AI_Output(other, self, "DIA_Addon_Lares_RangerHelp_Forest_15_03"); //其 中 有 一 个 地 方 我 必 须 去 看 一 看 ， 它 在 那 片 树 林 中 间 。
	AI_Output(self, other, "DIA_Addon_Lares_RangerHelp_Forest_09_04"); //我 明 白 了 。 而 且 ， 那 里 对 你 一 个 人 来 说 还 是 太 危 险 了 ， 对 吗 ？
	AI_Output(self, other, "DIA_Addon_Lares_RangerHelp_Forest_09_05"); //没 问 题 。 当 你 想 要 离 开 的 时 候 就 告 诉 我 一 声 。

	RangerHelp_OrnamentForest = TRUE;
};

// ------------------------------------------------------------
// Lass uns gehen...
// ------------------------------------------------------------
instance DIA_Lares_GoNow(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 10;
	condition		= DIA_Lares_GoNow_Condition;
	information		= DIA_Lares_GoNow_Info;
	permanent		= TRUE;
	description		= "好 吧 ， 我 们 出 发 。";
};

func int DIA_Lares_GoNow_Condition()
{
	if ((
	(Lares_WayToOnar == TRUE)
	|| (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING)
	|| (RangerHelp_OrnamentForest == TRUE)
	)
	&& ((LaresGuide_ZumPortal == 0) || (LaresGuide_ZumPortal == 8))
	&& ((LaresGuide_ZuOnar == FALSE) || (LaresGuide_ZuOnar == LOG_SUCCESS))
	&& ((LaresGuide_OrnamentForest == 0) || (LaresGuide_OrnamentForest == 3))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lares_GoNow_GoingConditions()
{
	AI_Output(self, other, "DIA_Lares_GoNow_09_01"); //那 么 我 们 走 吧 … … 跟 着 我 。
	AI_StopProcessInfos(self);

	Lares_Guide = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;

	if (Npc_KnowsInfo(other, DIA_Moe_Hallo) == FALSE)
	{
		Npc_SetRefuseTalk(Moe, 30);
	};
};

func void DIA_Lares_GoNow_Info()
{
	AI_Output(other, self, "DIA_Lares_GoNow_15_00"); //好 吧 。 我 们 走 吧 。

	if (Lares_CanBringScToPlaces == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Lares_GoNow_09_03"); //在 我 们 了 解 到 更 多 关 于 失 踪 人 口 的 事 情 ， 或 者 有 其 它 人 来 接 替 我 之 前 ， 我 不 能 离 开 这 里 。
	}
	else if (MIS_Addon_Lares_ComeToRangerMeeting == LOG_RUNNING) // bleibt am Hafen während RangerMeeting
	{
		B_Lares_Geheimtreffen();
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Lares_GoNow_09_04"); //去 哪 里 ？

		Info_ClearChoices(DIA_Lares_GoNow);
		Info_AddChoice(DIA_Lares_GoNow, DIALOG_BACK, DIA_Lares_GoNow_warte);

		if ((Lares_WayToOnar == TRUE) && (LaresGuide_ZuOnar != LOG_SUCCESS))
		{
			Info_AddChoice(DIA_Lares_GoNow, "欧 纳 尔 的 农 场 。", DIA_Lares_GoNow_Onar);
		};

		if ((MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING) && (Lares_Angekommen == FALSE))
		{
			Info_AddChoice(DIA_Lares_GoNow, "让 我 们 把 瓦 卓 斯 的 装 饰 性 戒 指 送 去 遗 迹 。", DIA_Lares_GoNow_Maya);
		};

		if ((ORNAMENT_SWITCHED_FOREST == FALSE) && (LaresGuide_OrnamentForest == 0) && (RangerHelp_OrnamentForest == TRUE))
		{
			Info_AddChoice(DIA_Lares_GoNow, "去 东 边 浓 密 的 树 林 。", DIA_Lares_GoNow_Forest);
		};
	};
};

func void DIA_Lares_GoNow_Maya()
{
	AI_Output(other, self, "DIA_Addon_Lares_GoNow_Maya_15_00"); //让 我 们 把 瓦 卓 斯 的 装 饰 性 戒 指 送 去 遗 迹 。
	LaresGuide_ZumPortal = 1;
	Npc_ExchangeRoutine(self, "GUIDEPORTALTEMPEL1");
	DIA_Lares_GoNow_GoingConditions();
};

func void DIA_Lares_GoNow_Onar()
{
	AI_Output(other, self, "DIA_Addon_Lares_GoNow_Onar_15_00"); //去 欧 纳 尔 的 农 场 。
	LaresGuide_ZuOnar = TRUE;
	Npc_ExchangeRoutine(self, "GUIDE");
	DIA_Lares_GoNow_GoingConditions();
};

func void DIA_Lares_GoNow_Forest()
{
	AI_Output(other, self, "DIA_Addon_Lares_GoNow_Forest_15_00"); //去 东 边 浓 密 的 树 林 。
	LaresGuide_OrnamentForest = 1;
	Npc_ExchangeRoutine(self, "GUIDEMEDIUMWALD1");
	DIA_Lares_GoNow_GoingConditions();
};

func void DIA_Lares_GoNow_warte()
{
	Info_ClearChoices(DIA_Lares_GoNow);
};

// ************************************************************
// 			  					Angekommen
// ************************************************************
instance DIA_Lares_GUIDE(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 1;
	condition		= DIA_Lares_GUIDE_Condition;
	information		= DIA_Lares_GUIDE_Info;
	important		= TRUE;
};

func int DIA_Lares_GUIDE_Condition()
{
	if ((LaresGuide_ZuOnar == TRUE)
	&& Hlp_StrCmp(Npc_GetNearestWP(self), "NW_TAVERNE_BIGFARM_05"))
	{
		return TRUE;
	};
};

func void DIA_Lares_GUIDE_Info()
{
	if (Lares_Guide > (Wld_GetDay() - 2))
	{
		AI_Output(self, other, "DIA_Lares_GUIDE_09_00"); //那 么 ， 我 们 走 。
	}
	else
	{
		AI_Output(self, other, "DIA_Lares_GUIDE_09_01"); //那 么 给 你 。 我 已 经 开 始 担 心 你 被 狼 群 吃 掉 了 。
	};

	AI_Output(self, other, "DIA_Lares_GUIDE_09_02"); //那 么 ， 剩 下 的 路 你 自 己 可 以 对 付 了 。 我 必 须 回 城 里 去 ， 我 有 几 件 事 要 去 办 … …
	AI_Output(self, other, "DIA_Lares_GUIDE_09_03"); //只 要 沿 着 这 条 路 走 ， 而 且 要 记 住 - 坚 持 下 去 ， 别 拿 没 用 的 东 西 ， 那 么 就 会 一 帆 风 顺 。

	AI_StopProcessInfos(self);

	self.aivar[AIV_PARTYMEMBER] = FALSE;

	Npc_ExchangeRoutine(self, "START");
	LaresGuide_ZuOnar = LOG_SUCCESS; // Joly: schluss mit Onar guide
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInter1
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInter1(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 1;
	condition		= DIA_Addon_Lares_ArrivedPortalInter1_Condition;
	information		= DIA_Addon_Lares_ArrivedPortalInter1_Info;
	important		= TRUE;
};

func int DIA_Addon_Lares_ArrivedPortalInter1_Condition()
{
	if ((MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING)
	&& Hlp_StrCmp(Npc_GetNearestWP(self), "NW_CITY_TO_FOREST_11")
	&& (LaresGuide_ZumPortal == 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInter1_Info()
{
	AI_Output(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_09_00"); //现 在 我 们 不 在 城 里 了 ， 没 人 会 来 偷 听 ， 我 再 告 诉 你 一 些 事 情 。
	AI_Output(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_09_01"); //我 们 现 在 准 备 去 把 你 带 给 我 的 这 枚 装 饰 性 戒 指 还 给 萨 图 拉 斯 。 你 还 记 得 萨 图 拉 斯 ， 是 吗 ？

	Info_ClearChoices(DIA_Addon_Lares_ArrivedPortalInter1);
	Info_AddChoice(DIA_Addon_Lares_ArrivedPortalInter1, "当 然 。", DIA_Addon_Lares_ArrivedPortalInter1_ja);
	Info_AddChoice(DIA_Addon_Lares_ArrivedPortalInter1, "萨 图 拉 斯 ？ 那 是 谁 ？", DIA_Addon_Lares_ArrivedPortalInter1_wer);

	LaresGuide_ZumPortal = 2;
};

func void DIA_Addon_Lares_ArrivedPortalInter1_teil2()
{
	AI_Output(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_00"); //从 我 们 新 营 地 里 出 来 的 人 仍 然 跟 水 法 师 保 持 着 良 好 的 关 系 。
	AI_Output(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_01"); //现 在 ， 就 连 李 也 仍 然 会 在 他 的 能 力 范 围 内 保 护 水 法 师 脱 离 任 何 危 险 。
	AI_Output(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_02"); //为 了 保 持 跟 水 法 师 的 联 系 ， 我 大 部 分 时 候 都 在 城 里 ， 跟 瓦 卓 斯 一 起 工 作 。
	B_MakeRangerReadyForMeeting(self);
	AI_Output(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_03"); //这 是 水 法 师 发 给 我 们 每 个 人 的 盔 甲 。 水 之 环 的 所 有 成 员 自 从 兽 人 战 争 开 始 之 前 就 一 直 穿 着 它 。

	if (Cavalorn_RangerHint == TRUE)
	{
		AI_Output(other, self, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_15_04"); //卡 瓦 隆 在 这 里 面 的 角 色 是 什 么 ？ 据 我 所 知 ， 他 不 是 新 营 地 的 追 随 者 。
		AI_Output(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_05"); //你 说 对 了 。 我 们 的 组 织 壮 大 了 。 就 连 我 也 不 知 道 现 在 到 底 有 多 少 人 。
	};

	AI_Output(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_06"); //不 过 ， 我 们 继 续 走 吧 。 我 想 要 离 城 更 远 一 点 。 我 们 可 以 以 后 再 谈 这 件 事 。
	Info_ClearChoices(DIA_Addon_Lares_ArrivedPortalInter1);
};

func void DIA_Addon_Lares_ArrivedPortalInter1_wer()
{
	AI_Output(other, self, "DIA_Addon_Lares_ArrivedPortalInter1_wer_15_00"); //萨 图 拉 斯 ？ 那 是 谁 ？
	AI_Output(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_wer_09_01"); //他 是 新 营 地 里 面 的 水 法 师 的 头 儿 ， 那 时 还 在 矿 藏 山 谷 里 ， 屏 障 还 在 我 们 周 围 。
	AI_Output(self, other, "DIA_Addon_Lares_ArrivedPortalInter1_wer_09_02"); //那 时 ， 李 和 我 跟 水 法 师 达 成 了 一 个 约 定 。 我 们 联 合 在 一 起 就 足 够 强 大 来 对 付 旧 营 地 。
	DIA_Addon_Lares_ArrivedPortalInter1_teil2();
};

func void DIA_Addon_Lares_ArrivedPortalInter1_ja()
{
	AI_Output(other, self, "DIA_Addon_Lares_ArrivedPortalInter1_ja_15_00"); //的 确 。 他 在 新 营 地 时 是 水 法 师 的 领 导 。
	DIA_Addon_Lares_ArrivedPortalInter1_teil2();
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInterWeiter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInterWeiter(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 5;
	condition		= DIA_Addon_Lares_ArrivedPortalInterWeiter_Condition;
	information		= DIA_Addon_Lares_ArrivedPortalInterWeiter_Info;
	important		= TRUE;
};

func int DIA_Addon_Lares_ArrivedPortalInterWeiter_Condition()
{
	if ((MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING)
	&& Hlp_StrCmp(Npc_GetNearestWP(self), "NW_TAVERN_TO_FOREST_02")
	&& (LaresGuide_ZumPortal == 2))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter_Info()
{
	AI_Output(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter_09_00"); //怎 么 了 ？ 你 还 在 继 续 吗 ？

	if ((MIS_Addon_Erol_BanditStuff == LOG_RUNNING)
	&& ((Npc_GetDistToWP(Erol, "NW_TAVERN_TO_FOREST_03") < 1000))
	&& ((Npc_IsDead(Erol)) == FALSE))
	{
		AI_Output(other, self, "DIA_Addon_Lares_ArrivedPortalInterWeiter_15_01"); //那 边 那 个 家 伙 遭 到 强 盗 袭 击 了 。
		AI_Output(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter_09_02"); //（ 假 惺 惺 地 ） 那 对 他 太 糟 了 ， 但 我 们 现 在 没 有 时 间 管 那 个 。
	};

	LaresGuide_ZumPortal = 3;
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInterWeiter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInterWeiter2(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 5;
	condition		= DIA_Addon_Lares_ArrivedPortalInterWeiter2_Condition;
	information		= DIA_Addon_Lares_ArrivedPortalInterWeiter2_Info;
	important		= TRUE;
};

func int DIA_Addon_Lares_ArrivedPortalInterWeiter2_Condition()
{
	if ((MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING)
	&& Hlp_StrCmp(Npc_GetNearestWP(self), "NW_TAVERNE_TROLLAREA_14")
	&& (LaresGuide_ZumPortal == 3))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter2_Info()
{
	AI_Output(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter2_09_00"); //现 在 不 要 打 断 我 。
	LaresGuide_ZumPortal = 4;
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInter2(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 1;
	condition		= DIA_Addon_Lares_ArrivedPortalInter2_Condition;
	information		= DIA_Addon_Lares_ArrivedPortalInter2_Info;
	important		= TRUE;
};

func int DIA_Addon_Lares_ArrivedPortalInter2_Condition()
{
	if ((MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING)
	&& Hlp_StrCmp(Npc_GetNearestWP(self), "NW_TROLLAREA_PATH_58")
	&& (LaresGuide_ZumPortal == 4))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInter2_Info()
{
	AI_Output(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_00"); //那 些 水 法 师 都 精 神 错 乱 了 。 他 们 已 经 在 东 北 方 的 一 个 文 物 出 土 地 点 挖 掘 了 几 个 星 期 了 。 大 家 都 在 猜 想 他 们 究 竟 想 在 那 里 找 到 什 么 东 西 。
	AI_Output(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_01"); //都 是 从 地 面 开 始 震 动 的 时 候 开 始 的 ， 就 像 屏 障 最 糟 糕 的 时 候 所 发 生 的 情 况 一 样 。
	AI_Output(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_02"); //可 怕 的 石 头 怪 从 地 上 冒 出 来 ， 屠 杀 距 离 它 们 1 0 0 英 尺 距 离 以 内 的 所 有 人 。
	AI_Output(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_03"); //那 些 水 法 师 控 制 了 这 件 事 ， 消 灭 了 那 些 侵 略 者 。 而 现 在 ， 他 们 在 那 里 往 下 挖 ， 想 为 这 些 奇 怪 的 事 情 找 出 一 个 解 释 。
	AI_Output(self, other, "DIA_Addon_Lares_ArrivedPortalInter2_09_04"); //但 是 ， 你 很 快 就 能 亲 眼 看 到 了 。

	LaresGuide_ZumPortal = 5;
	B_LogEntry(TOPIC_Addon_KDW, TOPIC_Addon_KDW_5);
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInterWeiter3
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInterWeiter3(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 5;
	condition		= DIA_Addon_Lares_ArrivedPortalInterWeiter3_Condition;
	information		= DIA_Addon_Lares_ArrivedPortalInterWeiter3_Info;
	important		= TRUE;
};

func int DIA_Addon_Lares_ArrivedPortalInterWeiter3_Condition()
{
	if ((MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING)
	&& (Npc_GetDistToWP(self, "NW_TROLLAREA_PATH_47") < 200)
	&& (LaresGuide_ZumPortal == 5))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter3_Info()
{
	AI_Output(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter3_09_00"); //你 还 能 继 续 吗 ？
	LaresGuide_ZumPortal = 6;
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortalInterWeiter4
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortalInterWeiter4(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 5;
	condition		= DIA_Addon_Lares_ArrivedPortalInterWeiter4_Condition;
	information		= DIA_Addon_Lares_ArrivedPortalInterWeiter4_Info;
	important		= TRUE;
};

func int DIA_Addon_Lares_ArrivedPortalInterWeiter4_Condition()
{
	if ((MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING)
	&& Hlp_StrCmp(Npc_GetNearestWP(self), "NW_TROLLAREA_RUINS_02")
	&& (LaresGuide_ZumPortal == 6))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter4_Info()
{
	AI_Output(self, other, "DIA_Addon_Lares_ArrivedPortalInterWeiter4_09_00"); //好 吧 。 这 里 会 很 危 险 。
	LaresGuide_ZumPortal = 7;
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedPortal
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_ArrivedPortal(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 1;
	condition		= DIA_Addon_Lares_ArrivedPortal_Condition;
	information		= DIA_Addon_Lares_ArrivedPortal_Info;
	important		= TRUE;
};

func int DIA_Addon_Lares_ArrivedPortal_Condition()
{
	if ((MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING)
	&& Hlp_StrCmp(Npc_GetNearestWP(self), "NW_TROLLAREA_RUINS_41")
	&& (LaresGuide_ZumPortal == 7))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortal_Info()
{
	B_MakeRangerReadyToLeaveMeeting(self);
	AI_Output(self, other, "DIA_Addon_Lares_ArrivedPortal_09_00"); //我 们 到 了 。
	AI_Output(self, other, "DIA_Addon_Lares_ArrivedPortal_09_01"); //给 ， 拿 着 这 枚 装 饰 性 戒 指 。 那 些 水 法 师 一 定 在 那 边 某 个 地 方 。 把 它 交 给 他 们 。
	B_GiveInvItems(self, other, ItMi_Ornament_Addon_Vatras, 1);
	AI_Output(self, other, "DIA_Addon_Lares_ArrivedPortal_09_02"); //如 果 你 在 那 个 洞 底 下 遇 到 一 些 野 兽 ， 而 且 看 来 数 量 太 多 的 话 ， 就 往 前 逃 到 萨 图 拉 斯 那 里 去 。
	AI_Output(self, other, "DIA_Addon_Lares_ArrivedPortal_09_03"); //他 会 帮 你 解 决 那 些 野 兽 的 。 我 必 须 回 去 了 。
	AI_Output(self, other, "DIA_Addon_Lares_ArrivedPortal_09_04"); //而 且 ， 还 有 一 件 事 ： 千 万 别 考 虑 拿 着 这 枚 装 饰 性 戒 指 到 处 跑 太 久 。 直 接 去 找 萨 图 拉 斯 。
	AI_Output(self, other, "DIA_Addon_Lares_ArrivedPortal_09_05"); //再 见 。

	B_LogEntry(TOPIC_Addon_KDW, TOPIC_Addon_KDW_6);
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self, "START");
	LaresGuide_ZumPortal = 8; // Joly: schluss mit guide Portal

	Lares_Angekommen = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	ALBERN
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_Albern(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 1;
	condition		= DIA_Addon_Lares_Albern_Condition;
	information		= DIA_Addon_Lares_Albern_Info;
	important		= TRUE;
};

func int DIA_Addon_Lares_Albern_Condition()
{
	if ((Lares_Angekommen == TRUE)
	&& (Npc_GetDistToWP(self, "NW_TROLLAREA_RUINS_41") > 1000)
	&& (MIS_Addon_Lares_Ornament2Saturas != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Albern_Info()
{
	AI_Output(self, other, "DIA_Addon_Lares_Albern_09_00"); //（ 严 厉 地 ） 别 吊 儿 郎 当 了 ！ 马 上 把 装 饰 性 戒 指 交 给 萨 图 拉 斯 ！
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info GOFORESTPRE
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_GOFORESTPRE(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 1;
	condition		= DIA_Addon_Lares_GOFORESTPRE_Condition;
	information		= DIA_Addon_Lares_GOFORESTPRE_Info;
	important		= TRUE;
};

func int DIA_Addon_Lares_GOFORESTPRE_Condition()
{
	if (Hlp_StrCmp(Npc_GetNearestWP(self), "NW_CITY_TO_FARM2_04")
	&& (LaresGuide_OrnamentForest == 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_GOFORESTPRE_ja()
{
	B_MakeRangerReadyForMeeting(self);
	AI_Output(other, self, "DIA_Addon_Lares_GOFORESTPRE_ja_15_00"); //好 的 。
	AI_Output(self, other, "DIA_Addon_Lares_GOFORESTPRE_ja_09_01"); //好 的 ， 我 的 朋 友 。 那 么 ， 跟 我 来 。 前 面 的 树 木 越 来 越 茂 密 了 。
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "GUIDEMEDIUMWALD2");
	LaresGuide_OrnamentForest = 2;
};

func void DIA_Addon_Lares_GOFORESTPRE_nein()
{
	AI_Output(other, self, "DIA_Addon_Lares_GOFORESTPRE_nein_15_00"); //不 。 你 可 以 走 了 。
	AI_Output(self, other, "DIA_Addon_Lares_GOFORESTPRE_nein_09_01"); //我 猜 事 情 已 经 自 然 而 然 解 决 了 吧 ？ 好 吧 。 再 见 。
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Start");
	LaresGuide_OrnamentForest = 3; // Joly: Schluss mit Guide
};

func void DIA_Addon_Lares_GOFORESTPRE_Info()
{
	if (ORNAMENT_SWITCHED_FOREST == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_Lares_GOFORESTPRE_09_00"); //你 仍 然 想 跟 我 一 起 去 树 林 里 吗 ？
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Lares_GOFORESTPRE_09_01"); //你 有 没 有 想 过 去 树 林 里 ？ 你 真 的 想 那 么 做 吗 ？
	};

	Info_ClearChoices(DIA_Addon_Lares_GOFORESTPRE);
	Info_AddChoice(DIA_Addon_Lares_GOFORESTPRE, "不 。 你 可 以 走 了 。", DIA_Addon_Lares_GOFORESTPRE_nein);
	Info_AddChoice(DIA_Addon_Lares_GOFORESTPRE, "是 的 。", DIA_Addon_Lares_GOFORESTPRE_ja);
};

///////////////////////////////////////////////////////////////////////
//	Info GOFOREST
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_GOFOREST(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 1;
	condition		= DIA_Addon_Lares_GOFOREST_Condition;
	information		= DIA_Addon_Lares_GOFOREST_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_Lares_GOFOREST_Condition()
{
	if (Hlp_StrCmp(Npc_GetNearestWP(self), "NW_FOREST_PATH_62")
	&& (LaresGuide_OrnamentForest == 2)
	&& (Npc_IsDead(Stoneguardian_Ornament)))
	{
		if ((ORNAMENT_SWITCHED_FOREST == FALSE)
		&& (Npc_IsInState(self, ZS_Talk)))
		{
			return TRUE;
		};

		if (ORNAMENT_SWITCHED_FOREST == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Lares_GOFOREST_Info()
{
	if (ORNAMENT_SWITCHED_FOREST == TRUE)
	{
		B_MakeRangerReadyToLeaveMeeting(self);
		AI_Output(self, other, "DIA_Addon_Lares_GOFOREST_09_00"); //到 了 。 你 应 该 能 自 己 完 成 剩 下 的 事 情 。 那 么 ， 我 往 回 走 了 。
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self, "START");
		LaresGuide_OrnamentForest = 3; // Joly: Schluss mit guide Forest!
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Lares_GOFOREST_09_01"); //快 点 。 我 不 想 再 呆 在 这 里 。
		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PortalInterWEITER
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lares_PortalInterWEITER(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 1;
	condition		= DIA_Addon_Lares_PortalInterWEITER_Condition;
	information		= DIA_Addon_Lares_PortalInterWEITER_Info;
	permanent		= TRUE;
	description		= "我 们 继 续 前 进 。";
};

func int DIA_Addon_Lares_PortalInterWEITER_Condition()
{
	if ((LaresGuide_ZumPortal != 0)
	&& (LaresGuide_ZumPortal != 8)) // Joly: schluss mit guide Portal
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_PortalInterWEITER_Info()
{
	if (LaresGuide_ZumPortal == 4)
	{
		AI_Output(other, self, "DIA_Addon_Lares_PortalInterWEITER_15_00"); //别 瞎 扯 了 。
	}
	else if (LaresGuide_ZumPortal == 6)
	{
		AI_Output(other, self, "DIA_Addon_Lares_PortalInterWEITER_15_01"); //（ 生 气 的 ） 是 的 ， 是 的 。
	};

	AI_Output(other, self, "DIA_Addon_Lares_PortalInterWEITER_15_02"); //我 们 继 续 前 进 。

	if (LaresGuide_ZumPortal == 7)
	{
		AI_Output(self, other, "DIA_Addon_Lares_PortalInterWEITER_09_03"); //呆 在 后 面 一 点 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Lares_PortalInterWEITER_09_04"); //跟 紧 我 一 点 。
	};

	AI_StopProcessInfos(self);

	if (LaresGuide_ZumPortal == 2)
	{
		Npc_ExchangeRoutine(self, "GUIDEPORTALTEMPEL2");
	}
	else if (LaresGuide_ZumPortal == 3)
	{
		Npc_ExchangeRoutine(self, "GUIDEPORTALTEMPEL3");
	}
	else if (LaresGuide_ZumPortal == 4)
	{
		Npc_ExchangeRoutine(self, "GUIDEPORTALTEMPEL4");
	}
	else if (LaresGuide_ZumPortal == 5)
	{
		Npc_ExchangeRoutine(self, "GUIDEPORTALTEMPEL5");
	}
	else if (LaresGuide_ZumPortal == 6)
	{
		Npc_ExchangeRoutine(self, "GUIDEPORTALTEMPEL6");
	}
	else if (LaresGuide_ZumPortal == 7)
	{
		Npc_ExchangeRoutine(self, "GUIDEPORTALTEMPELEND");
	};
};

// ************************************************************
// 			  				  LEHRER
// ************************************************************
// ------------------------------------------------------------
// Wanna Learn
// ------------------------------------------------------------
instance DIA_Lares_DEX(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 20;
	condition		= DIA_Lares_DEX_Condition;
	information		= DIA_Lares_DEX_Info;
	description		= "你 能 教 我 什 么 吗 ？";
};

func int DIA_Lares_DEX_Condition()
{
	return TRUE;
};

func void DIA_Lares_DEX_Info()
{
	AI_Output(other, self, "DIA_Lares_DEX_15_00"); //你 能 教 我 什 么 吗 ？
	AI_Output(self, other, "DIA_Addon_Lares_DEX_Add_09_01"); //当 然 。 如 果 你 喜 欢 的 话 ， 我 可 以 帮 你 变 得 更 强 壮 、 更 敏 捷 。

	Lares_TeachDEX = TRUE;

	Log_CreateTopic(Topic_CityTeacher, LOG_NOTE);
	B_LogEntry(Topic_CityTeacher, Topic_CityTeacher_10);
};

// ------------------------------------------------------------
// 			  				   TEACH
// ------------------------------------------------------------
var int Lares_MerkeDEX;
var int Lares_MerkeSTR;
// -----------------------------------
instance DIA_Lares_TEACH(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 20;
	condition		= DIA_Lares_TEACH_Condition;
	information		= DIA_Lares_TEACH_Info;
	permanent		= TRUE;
	description		= "教 我 一 些 技 能 。";
};

func int DIA_Lares_TEACH_Condition()
{
	if (Lares_TeachDEX == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lares_TEACH_Info()
{
	// AI_Output(other, self, "DIA_Lares_TEACH_15_00"); // Ich will geschickter werden!
	AI_Output(other, self, "DIA_Addon_Lares_Teach_15_00"); //教 我 一 些 技 能 。

	Lares_MerkeDEX = other.attribute[ATR_DEXTERITY];
	Lares_MerkeSTR = other.attribute[ATR_STRENGTH];

	Info_ClearChoices(DIA_Lares_TEACH);
	Info_AddChoice(DIA_Lares_TEACH, DIALOG_BACK, DIA_Lares_TEACH_BACK);
	Info_AddChoice(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Lares_TEACH_1);
	Info_AddChoice(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Lares_TEACH_5);
	Info_AddChoice(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Lares_TEACHSTR_1);
	Info_AddChoice(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Lares_TEACHSTR_5);
};

func void DIA_Lares_TEACH_BACK()
{
	if (other.attribute[ATR_DEXTERITY] > Lares_MerkeDEX)
	{
		AI_Output(self, other, "DIA_Lares_TEACH_BACK_09_00"); //你 已 经 变 得 更 敏 捷 了 。
	};

	if (other.attribute[ATR_STRENGTH] > Lares_MerkeSTR)
	{
		AI_Output(self, other, "DIA_Addon_Lares_TEACH_BACK_Add_09_00"); //（ 打 量 ） 很 好 。 你 的 力 量 已 经 增 加 了 。
	};

	Info_ClearChoices(DIA_Lares_TEACH);
};

func void DIA_Lares_TEACH_1()
{
	B_TeachAttributePoints(self, other, ATR_DEXTERITY, 1, T_MED);

	Info_ClearChoices(DIA_Lares_TEACH);
	Info_AddChoice(DIA_Lares_TEACH, DIALOG_BACK, DIA_Lares_TEACH_BACK);
	Info_AddChoice(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Lares_TEACH_1);
	Info_AddChoice(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Lares_TEACH_5);
	Info_AddChoice(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Lares_TEACHSTR_1);
	Info_AddChoice(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Lares_TEACHSTR_5);
};

func void DIA_Lares_TEACH_5()
{
	B_TeachAttributePoints(self, other, ATR_DEXTERITY, 5, T_MED);

	Info_ClearChoices(DIA_Lares_TEACH);
	Info_AddChoice(DIA_Lares_TEACH, DIALOG_BACK, DIA_Lares_TEACH_BACK);
	Info_AddChoice(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Lares_TEACH_1);
	Info_AddChoice(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Lares_TEACH_5);
	Info_AddChoice(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Lares_TEACHSTR_1);
	Info_AddChoice(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Lares_TEACHSTR_5);
};

func void DIA_Lares_TEACHSTR_1()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 1, T_LOW);

	Info_ClearChoices(DIA_Lares_TEACH);
	Info_AddChoice(DIA_Lares_TEACH, DIALOG_BACK, DIA_Lares_TEACH_BACK);
	Info_AddChoice(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Lares_TEACH_1);
	Info_AddChoice(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Lares_TEACH_5);
	Info_AddChoice(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Lares_TEACHSTR_1);
	Info_AddChoice(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Lares_TEACHSTR_5);
};

func void DIA_Lares_TEACHSTR_5()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 5, T_LOW);

	Info_ClearChoices(DIA_Lares_TEACH);
	Info_AddChoice(DIA_Lares_TEACH, DIALOG_BACK, DIA_Lares_TEACH_BACK);
	Info_AddChoice(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Lares_TEACH_1);
	Info_AddChoice(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Lares_TEACH_5);
	Info_AddChoice(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Lares_TEACHSTR_1);
	Info_AddChoice(DIA_Lares_TEACH, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Lares_TEACHSTR_5);
};

// #################################
// ##
// ## Kapitel 2
// ##
// #################################

// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Lares_Kap2_EXIT(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 999;
	condition		= DIA_Lares_Kap2_EXIT_Condition;
	information		= DIA_Lares_Kap2_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lares_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// #################################
// ##
// ## Kapitel 3
// ##
// #################################

// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Lares_Kap3_EXIT(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 999;
	condition		= DIA_Lares_Kap3_EXIT_Condition;
	information		= DIA_Lares_Kap3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lares_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 		Gibt's was Neues?
// ************************************************************
instance DIA_Lares_AnyNews(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 5;
	condition		= DIA_Lares_AnyNews_Condition;
	information		= DIA_Lares_AnyNews_Info;
	permanent		= TRUE;
	description		= "有 新 闻 吗 ？";
};

func int DIA_Lares_AnyNews_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Lares_AnyNews_Info()
{
	AI_Output(other, self, "DIA_Lares_AnyNews_15_00"); //有 新 闻 吗 ？
	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Lares_AnyNews_09_01"); //这 个 好 消 息 是 你 自 己 带 来 的 。 他 们 已 经 让 贝 尼 特 走 了 ， 他 现 在 回 到 农 场 里 去 了 。
		AI_Output(self, other, "DIA_Lares_AnyNews_09_02"); //去 找 他 ， 我 想 他 一 定 想 亲 自 感 谢 你 。
	}
	else
	{
		AI_Output(self, other, "DIA_Lares_AnyNews_09_03"); //你 可 以 这 么 说 。 那 些 圣 骑 士 逮 捕 了 贝 尼 特 ， 我 们 的 铁 匠 。

		if (MIS_RescueBennet == LOG_RUNNING)
		{
			AI_Output(other, self, "DIA_Lares_AnyNews_15_04"); //是 的 ， 我 们 听 说 了 。 那 是 件 糟 糕 的 事 。
			AI_Output(self, other, "DIA_Lares_AnyNews_09_05"); //我 同 意 。
		}
		else
		{
			AI_Output(other, self, "DIA_Lares_AnyNews_15_06"); //那 是 怎 么 发 生 的 ？
			AI_Output(self, other, "DIA_Lares_AnyNews_09_07"); //贝 尼 特 去 了 城 里 采 购 供 应 品 。 就 这 样 ， 他 再 没 有 回 来 。
			AI_Output(self, other, "DIA_Lares_AnyNews_09_08"); //如 果 你 想 知 道 更 多 ， 你 应 该 去 问 问 霍 奇 斯 ， 他 那 时 跟 贝 尼 特 一 起 在 城 里 。

			MIS_RescueBennet = LOG_RUNNING;
		};
	};
};

// ************************************************************
// 		Hast du was von Bennet gehört?
// ************************************************************
instance DIA_Lares_NewsAboutBennet(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 6;
	condition		= DIA_Lares_NewsAboutBennet_Condition;
	information		= DIA_Lares_NewsAboutBennet_Info;
	description		= "有 什 么 关 于 贝 尼 特 的 新 闻 吗 ？";
};

func int DIA_Lares_NewsAboutBennet_Condition()
{
	if (MIS_RescueBennet == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Lares_NewsAboutBennet_Info()
{
	AI_Output(other, self, "DIA_Lares_NewsAboutBennet_15_00"); //有 什 么 关 于 贝 尼 特 的 新 闻 吗 ？
	AI_Output(self, other, "DIA_Lares_NewsAboutBennet_09_01"); //看 来 他 们 已 经 把 他 带 到 兵 营 ， 并 关 进 了 牢 房 里 。
	AI_Output(other, self, "DIA_Lares_NewsAboutBennet_15_02"); //我 们 怎 么 才 能 把 他 从 那 里 救 出 来 ？
	AI_Output(self, other, "DIA_Lares_NewsAboutBennet_09_03"); //到 目 前 为 止,我 没 有 任 何 办 法 。 我 没 法 子 去 他 的 牢 里 跟 他 谈 话 。
	AI_Output(self, other, "DIA_Lares_NewsAboutBennet_09_04"); //我 能 做 的 只 有 竖 起 耳 朵 打 探 消 息 了 ， 不 过 ， 这 周 围 打 听 不 到 太 多 东 西 。
};

// #################################
// ##
// ## Kapitel 4
// ##
// #################################

// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Lares_Kap4_EXIT(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 999;
	condition		= DIA_Lares_Kap4_EXIT_Condition;
	information		= DIA_Lares_Kap4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lares_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//****************************************
//	Wieso bist du nicht auf Drachenjagd?
//****************************************
instance DIA_Lares_Kap4_PERM(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 6;
	condition		= DIA_Lares_Kap4_PERM_Condition;
	information		= DIA_Lares_Kap4_PERM_Info;
	permanent		= TRUE;
	description		= "你 为 什 么 不 出 去 寻 找 龙 ？ ";
};

func int DIA_Lares_Kap4_PERM_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap4_PERM_Info()
{
	AI_Output(other, self, "DIA_Lares_Kap4_PERM_15_00"); //你 为 什 么 不 出 去 寻 找 龙 ？
	AI_Output(self, other, "DIA_Lares_Kap4_PERM_09_01"); //那 不 是 我 要 做 的 事 ， 我 会 让 其 它 人 去 做 。
	AI_Output(self, other, "DIA_Lares_Kap4_PERM_09_02"); //不 ， 不 。 新 鲜 的 海 风 - 那 是 我 现 在 最 需 要 的 。
};

// #################################
// ##
// ## Kapitel 5
// ##
// #################################

// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Lares_Kap5_EXIT(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 999;
	condition		= DIA_Lares_Kap5_EXIT_Condition;
	information		= DIA_Lares_Kap5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lares_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//****************************************************************
//	Lares anheuern
//****************************************************************

///////////////////////////////////////////////////////////////////////
//	Hast du Lust diese Insel zu verlassen?
///////////////////////////////////////////////////////////////////////
instance DIA_Lares_KnowWhereEnemy(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 5;
	condition		= DIA_Lares_KnowWhereEnemy_Condition;
	information		= DIA_Lares_KnowWhereEnemy_Info;
	permanent		= TRUE;
	description		= "你 想 要 离 开 这 个 岛 吗 ？";
};

func int DIA_Lares_KnowWhereEnemy_Condition()
{
	if ((MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Lares_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_KnowWhereEnemy_Info()
{
	AI_Output(other, self, "DIA_Lares_KnowWhereEnemy_15_00"); //你 想 要 离 开 这 个 岛 吗 ？
	AI_Output(self, other, "DIA_Lares_KnowWhereEnemy_09_01"); //超 过 一 切 。 你 脑 子 里 在 想 什 么 ？
	AI_Output(other, self, "DIA_Lares_KnowWhereEnemy_15_02"); //我 查 清 了 那 些 龙 的 首 领 藏 在 哪 里 。 他 在 一 座 岛 上 ， 离 这 里 不 远 。
	AI_Output(other, self, "DIA_Lares_KnowWhereEnemy_15_03"); //我 打 算 为 了 正 义 去 杀 掉 他 。
	AI_Output(self, other, "DIA_Lares_KnowWhereEnemy_09_04"); //听 起 来 像 在 吹 牛 。 如 果 你 能 用 到 我 ， 我 加 入 。
	AI_Output(self, other, "DIA_Lares_KnowWhereEnemy_09_05"); //你 的 旅 程 中 不 需 要 一 个 能 教 授 敏 捷 和 单 手 武 器 格 斗 的 老 师 吗 ？

	if (crewmember_count >= Max_Crew)
	{
		AI_Output(other, self, "DIA_Lares_KnowWhereEnemy_15_06"); //船 已 经 满 了 ， 但 是 ， 如 果 有 机 会 ， 我 会 回 来 找 你 的 。
	}
	else
	{
		Info_ClearChoices(DIA_Lares_KnowWhereEnemy);
		Info_AddChoice(DIA_Lares_KnowWhereEnemy, "我 用 不 上 你 。", DIA_Lares_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Lares_KnowWhereEnemy, "我 知 道 我 可 以 信 赖 你 。", DIA_Lares_KnowWhereEnemy_Yes);
	};
};

func void DIA_Lares_KnowWhereEnemy_Yes()
{
	AI_Output(other, self, "DIA_Lares_KnowWhereEnemy_Yes_15_00"); //我 知 道 我 可 以 信 赖 你 。
	AI_Output(other, self, "DIA_Lares_KnowWhereEnemy_Yes_15_01"); //我 们 都 去 船 上 集 合 。
	AI_Output(self, other, "DIA_Lares_KnowWhereEnemy_Yes_09_02"); //用 行 动 说 话 ， 我 喜 欢 那 样 的 人 。 再 见 。

	Lares_IsOnBoard = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count + 1);

	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self, "SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self, "WAITFORSHIP");
	};

	Info_ClearChoices(DIA_Lares_KnowWhereEnemy);
};

func void DIA_Lares_KnowWhereEnemy_No()
{
	AI_Output(other, self, "DIA_Lares_KnowWhereEnemy_No_15_00"); //我 很 感 激 你 的 提 议 ， 但 是 ， 我 用 不 上 你 。
	AI_Output(self, other, "DIA_Lares_KnowWhereEnemy_No_09_01"); //你 肯 定 知 道 自 己 想 要 什 么 。 如 果 你 想 以 后 再 谈 这 件 事 的 话 ， 你 知 道 能 在 哪 里 找 到 我 。

	if (hero.guild == GIL_DJG)
	{
		Lares_IsOnBoard = LOG_OBSOLETE;
	}
	else
	{
		Lares_IsOnBoard = LOG_FAILED;
	};

	Info_ClearChoices(DIA_Lares_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Lares_LeaveMyShip(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 5;
	condition		= DIA_Lares_LeaveMyShip_Condition;
	information		= DIA_Lares_LeaveMyShip_Info;
	permanent		= TRUE;
	description		= "如 果 你 不 跟 着 我 那 样 会 更 好 。";
};

func int DIA_Lares_LeaveMyShip_Condition()
{
	if ((Lares_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_LeaveMyShip_Info()
{
	AI_Output(other, self, "DIA_Lares_LeaveMyShip_15_00"); //如 果 你 不 跟 着 我 那 样 会 更 好 。
	AI_Output(self, other, "DIA_Lares_LeaveMyShip_09_01"); //随 你 的 便 ， 不 过 ， 将 来 你 要 想 想 你 对 某 人 作 过 的 承 诺 。

	if (hero.guild == GIL_DJG)
	{
		Lares_IsOnBoard = LOG_OBSOLETE;
	}
	else
	{
		Lares_IsOnBoard = LOG_FAILED;
	}; // Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit!
	crewmember_Count = (Crewmember_Count - 1);

	Npc_ExchangeRoutine(self, "ShipOff");
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Lares_StillNeedYou(C_INFO)
{
	npc				= VLK_449_Lares;
	nr				= 5;
	condition		= DIA_Lares_StillNeedYou_Condition;
	information		= DIA_Lares_StillNeedYou_Info;
	permanent		= TRUE;
	description		= "你 还 对 航 海 感 兴 趣 吗 ？";
};

func int DIA_Lares_StillNeedYou_Condition()
{
	if (((Lares_IsOnBOard == LOG_OBSOLETE)
	|| (Lares_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_Lares_StillNeedYou_Info()
{
	AI_Output(other, self, "DIA_Lares_StillNeedYou_15_00"); //你 还 对 航 海 感 兴 趣 吗 ？

	if (Lares_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output(self, other, "DIA_Lares_StillNeedYou_09_01"); //通 常 ， 我 不 会 让 人 那 样 对 待 我 ， 不 过 ， 因 为 你 是 自 己 人 ， 这 一 次 就 算 了 。
		AI_Output(self, other, "DIA_Lares_StillNeedYou_09_02"); //我 们 到 船 上 见 面 。

		Lares_IsOnBoard = LOG_SUCCESS;
		crewmember_Count = (Crewmember_Count + 1);

		if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine(self, "SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self, "WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Lares_StillNeedYou_09_03"); //不 要 一 个 人 承 受 ， 但 是 ， 我 认 为 你 是 对 的 。
		AI_Output(self, other, "DIA_Lares_StillNeedYou_09_04"); //如 果 我 留 在 这 里 会 更 好 。

		AI_StopProcessInfos(self);
	};
};
