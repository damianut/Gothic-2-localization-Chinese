///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_EXIT(C_INFO)
{
	npc				= VLK_444_Jack;
	nr				= 999;
	condition		= DIA_Jack_EXIT_Condition;
	information		= DIA_Jack_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Jack_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Jack_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Jack_PICKPOCKET(C_INFO)
{
	npc				= VLK_444_Jack;
	nr				= 900;
	condition		= DIA_Jack_PICKPOCKET_Condition;
	information		= DIA_Jack_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Jack_PICKPOCKET_Condition()
{
	C_Beklauen(50, 100);
};

func void DIA_Jack_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jack_PICKPOCKET);
	Info_AddChoice(DIA_Jack_PICKPOCKET, DIALOG_BACK, DIA_Jack_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jack_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Jack_PICKPOCKET_DoIt);
};

func void DIA_Jack_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Jack_PICKPOCKET);
};

func void DIA_Jack_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jack_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_GREET(C_INFO)
{
	npc				= VLK_444_Jack;
	nr				= 4;
	condition		= DIA_Jack_GREET_Condition;
	information		= DIA_Jack_GREET_Info;
	important		= TRUE;
};

func int DIA_Jack_GREET_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Jack_GREET_Info()
{
	AI_Output(self, other, "DIA_Jack_GREET_14_00"); //喂 ， 你 这 只 旱 鸭 子 ， 看 来 你 在 这 里 进 退 两 难 了？
	AI_Output(self, other, "DIA_Jack_GREET_14_01"); //你 看 起 来 脸 色 苍 白 。
	AI_Output(self, other, "DIA_Jack_GREET_14_02"); //没 关 系 ， 我 的 小 伙 子 。 你 需 要 的 是 一 阵 像 样 的 大 海 风 。
};

///////////////////////////////////////////////////////////////////////
//	Was machst Du hier
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_Job(C_INFO)
{
	npc				= VLK_444_Jack;
	nr				= 5;
	condition		= DIA_Jack_Job_Condition;
	information		= DIA_Jack_Job_Info;
	description		= "你 在 这 里 做 什 么 ？";
};

func int DIA_Jack_Job_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jack_GREET))
	{
		return TRUE;
	};
};

func void DIA_Jack_Job_Info()
{
	AI_Output(other, self, "DIA_Jack_Job_15_00"); //你 在 这 里 做 什 么 ？
	// AI_Output(self, other, "DIA_Jack_Job_14_01"); // Damals, als junger Mann, bin ich noch zur See gefahren und habe so manchen großen Sturm miterlebt.
	// AI_Output(self, other, "DIA_Jack_Job_14_02"); // Vor vielen Jahren hab ich mich dann hier nieder gelassen und war lange Zeit Leuchtturmwärter von Khorinis.
	// AI_Output(self, other, "DIA_Jack_Job_14_03"); // Keine aufregende Sache. Wirklich nicht. Aber dieser alte Turm kam dem, was man ein Zuhause nennt, am Nächsten.
	// AI_Output(self, other, "DIA_Jack_Job_14_04"); // Bin schon ziemlich lange nicht mehr oben gewesen.
	// AI_Output(other, self, "DIA_Jack_Job_15_05"); // Warum nicht?
	AI_Output(self, other, "DIA_Jack_Job_14_06"); //自 从 那 些 饭 桶 接 管 了 我 的 灯 塔 ， 我 一 直 没 敢 靠 近 过 它 二 十 英 尺 以 内 。 那 真 是 一 群 差 劲 的 乌 合 之 众 。
	AI_Output(self, other, "DIA_Jack_Job_14_07"); //你 知 道 他 们 是 从 矿 藏 山 谷 来 的 一 群 罪 犯 。
	AI_Output(self, other, "DIA_Jack_Job_14_08"); //以 前 ， 这 一 大 帮 人 在 山 的 另 一 边 ， 后 来 ， 他 们 像 苍 蝇 一 样 遍 布 了 整 个 地 区 。 现 在 ， 他 们 躲 藏 在 各 个 地 方 - 甚 至 在 我 的 灯 塔 里 。
	AI_Output(self, other, "DIA_Jack_Job_14_09"); //我 觉 得 他 们 是 在 了 望 塔 上 观 察 是 否 有 可 以 袭 击 的 船 只 。
	AI_Output(self, other, "DIA_Jack_Job_14_10"); //哈 ！ 让 他 们 去 吧 。 那 么 ， 至 少 他 们 会 离 开 我 的 塔 。

	Log_CreateTopic(TOPIC_KillLighthouseBandits, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillLighthouseBandits, LOG_RUNNING);
	B_LogEntry(TOPIC_KillLighthouseBandits, TOPIC_KillLighthouseBandits_1);

	MIS_Jack_KillLighthouseBandits = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Erzähl mir was über die Stadt
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_City(C_INFO)
{
	npc				= VLK_444_Jack;
	nr				= 6;
	condition		= DIA_Jack_City_Condition;
	information		= DIA_Jack_City_Info;
	description		= "你 常 来 镇 上 吗 ？";
};

func int DIA_Jack_City_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jack_Job))
	{
		return TRUE;
	};
};

func void DIA_Jack_City_Info()
{
	AI_Output(other, self, "DIA_Jack_City_15_00"); //你 常 来 镇 上 吗 ？
	AI_Output(self, other, "DIA_Jack_City_14_01"); //我 总 是 说 ， 一 个 城 市 只 会 像 它 的 港 口 一 样 。
	AI_Output(self, other, "DIA_Jack_City_14_02"); //港 口 是 通 往 世 界 的 大 门 。 人 们 在 那 里 相 遇 ， 一 切 从 那 里 开 始 。
	AI_Output(self, other, "DIA_Jack_City_14_03"); //一 旦 港 口 完 蛋 了 ， 城 市 剩 下 的 其 它 东 西 都 会 跟 着 完 蛋 。
};

///////////////////////////////////////////////////////////////////////
//	Erzähl mir was über den Hafen
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_Harbor(C_INFO)
{
	npc				= VLK_444_Jack;
	nr				= 70;
	condition		= DIA_Jack_Harbor_Condition;
	information		= DIA_Jack_Harbor_Info;
	permanent		= TRUE;
	description		= "告 诉 我 关 于 港 口 的 事 。";
};

func int DIA_Jack_Harbor_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jack_City)
	&& ((Npc_GetDistToWP(self, "LIGHTHOUSE") < 3000) == FALSE)
	&& (JackIsCaptain == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jack_Harbor_Info()
{
	AI_Output(other, self, "DIA_Jack_Harbor_15_00"); //告 诉 我 关 于 港 口 的 事 。
	AI_Output(self, other, "DIA_Jack_Harbor_14_01"); //克 霍 里 尼 斯 的 港 口 不 是 从 前 的 样 子 了 。
	AI_Output(self, other, "DIA_Jack_Harbor_14_02"); //那 里 只 有 流 氓 游 荡 ， 船 只 不 再 停 靠 在 这 里 ， 商 业 都 荒 废 了 。 这 个 港 口 就 要 覆 灭 了 。

	Info_ClearChoices(DIA_Jack_Harbor);
	Info_AddChoice(DIA_Jack_Harbor, DIALOG_BACK, DIA_Jack_Harbor_Back);
	Info_AddChoice(DIA_Jack_Harbor, "为 什 么 船 不 再 来 了 ？", DIA_Jack_Harbor_Ships);
	Info_AddChoice(DIA_Jack_Harbor, "你 说 的 暴 民 是 什 么 意 思 ？", DIA_Jack_Harbor_Rogue);
	Info_AddChoice(DIA_Jack_Harbor, "那 你 为 什 么 不 离 开 ？", DIA_Jack_Harbor_Leave);
};

func void DIA_Jack_Harbor_Back()
{
	Info_ClearChoices(DIA_Jack_Harbor);
};

func void DIA_Jack_Harbor_Ships()
{
	AI_Output(other, self, "DIA_Jack_Harbor_Ships_15_00"); //为 什 么 船 不 再 来 了 ？
	AI_Output(self, other, "DIA_Jack_Harbor_Ships_14_01"); //他 们 都 说 只 要 这 场 战 争 结 束 了 ， 一 切 都 会 跟 从 前 一 样 。 那 些 都 是 傻 话 。
	AI_Output(self, other, "DIA_Jack_Harbor_Ships_14_02"); //我 告 诉 你 ， 一 个 水 手 能 看 清 什 么 时 候 一 个 城 市 将 要 走 下 坡 路 。
	AI_Output(self, other, "DIA_Jack_Harbor_Ships_14_03"); //水 手 生 来 就 能 感 觉 到 这 些 。 我 还 告 诉 你 ， 忘 了 这 个 港 口 吧 ， 它 的 繁 荣 已 经 结 束 了 。
};

func void DIA_Jack_Harbor_Rogue()
{
	AI_Output(other, self, "DIA_Jack_Harbor_Rogue_15_00"); //你 说 的 暴 民 是 什 么 意 思 ？
	AI_Output(self, other, "DIA_Jack_Harbor_Rogue_14_01"); //看 看 他 们 ， 那 些 懒 惰 的 贱 民 。 他 们 大 部 分 人 连 工 作 是 什 么 都 不 知 道 。 他 们 只 会 整 天 喝 酒 ， 把 自 己 得 到 的 最 后 一 笔 钱 送 到 妓 院 里 去 。
	AI_Output(self, other, "DIA_Jack_Harbor_Rogue_14_02"); //我 告 诉 你 ， 跟 他 们 保 持 距 离 。
};

func void DIA_Jack_Harbor_Leave()
{
	AI_Output(other, self, "DIA_Jack_Harbor_Leave_15_00"); //那 你 为 什 么 不 离 开 ？
	AI_Output(self, other, "DIA_Jack_Harbor_Leave_14_01"); //现 在 ， 没 有 一 个 人 会 接 纳 一 个 像 我 这 样 的 老 水 手 上 他 的 船 。
	AI_Output(self, other, "DIA_Jack_Harbor_Leave_14_02"); //大 部 分 人 认 为 老 杰 克 那 没 用 的 老 骨 头 里 有 点 痛 风 。
	AI_Output(other, self, "DIA_Jack_Harbor_Leave_15_03"); //那 么 ？ 他 们 是 对 的 吗 ？
	AI_Output(self, other, "DIA_Jack_Harbor_Leave_14_04"); //胡 言 乱 语 。 只 要 我 重 新 站 到 那 些 甲 板 上 面 ， 我 会 感 觉 自 己 像 个 妄 自 尊 大 的 年 青 人 。
};

///////////////////////////////////////////////////////////////////////
//	Info BanditenWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BANDITENWEG(C_INFO)
{
	npc				= VLK_444_Jack;
	nr				= 7;
	condition		= DIA_Jack_BANDITENWEG_Condition;
	information		= DIA_Jack_BANDITENWEG_Info;
	description		= "占 据 你 灯 塔 的 那 些 强 盗 都 完 了 。";
};

func int DIA_Jack_BANDITENWEG_Condition()
{
	if ((Npc_IsDead(LeuchtturmBandit_1021))
	&& (Npc_IsDead(LeuchtturmBandit_1022))
	&& (Npc_IsDead(LeuchtturmBandit_1023))
	&& (MIS_Jack_KillLighthouseBandits == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Jack_BANDITENWEG_Info()
{
	AI_Output(other, self, "DIA_Jack_BANDITENWEG_15_00"); //那 些 在 你 灯 塔 里 游 荡 的 强 盗 都 死 了 。
	AI_Output(self, other, "DIA_Jack_BANDITENWEG_14_01"); //那 是 真 的 吗 ？ 我 终 于 可 以 回 去 工 作 了 。
	AI_Output(self, other, "DIA_Jack_BANDITENWEG_14_02"); //跟 我 一 起 去 灯 塔 。 你 在 那 上 面 可 以 看 到 一 副 难 以 置 信 的 大 海 的 景 像 。
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Lighthouse");
	MIS_Jack_KillLighthouseBandits = LOG_SUCCESS;
	B_GivePlayerXP(XP_KillLighthouseBandits);
};

///////////////////////////////////////////////////////////////////////
//	Info LighthouseFree
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_LIGHTHOUSEFREE(C_INFO)
{
	npc				= VLK_444_Jack;
	nr				= 8;
	condition		= DIA_Jack_LIGHTHOUSEFREE_Condition;
	information		= DIA_Jack_LIGHTHOUSEFREE_Info;
	permanent		= TRUE;
	description		= "你 这 个 灯 塔 很 好 。";
};

func int DIA_Jack_LIGHTHOUSEFREE_Condition()
{
	if ((MIS_Jack_KillLighthouseBandits == LOG_SUCCESS)
	&& (Npc_GetDistToWP(self, "LIGHTHOUSE") < 3000)
	&& (MIS_SCKnowsWayToIrdorath == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jack_LIGHTHOUSEFREE_Info()
{
	AI_Output(other, self, "DIA_Jack_LIGHTHOUSEFREE_15_00"); //你 这 个 灯 塔 很 好 。
	AI_Output(self, other, "DIA_Jack_LIGHTHOUSEFREE_14_01"); //谢 谢 你 。 一 直 走 上 楼 梯 ， 欣 赏 那 美 丽 的 景 色 吧 ， 我 的 小 伙 子 。 你 可 以 把 这 里 当 成 自 己 的 家 。
};

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
instance DIA_Jack_KAP3_EXIT(C_INFO)
{
	npc				= VLK_444_Jack;
	nr				= 999;
	condition		= DIA_Jack_KAP3_EXIT_Condition;
	information		= DIA_Jack_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Jack_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Jack_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
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
instance DIA_Jack_KAP4_EXIT(C_INFO)
{
	npc				= VLK_444_Jack;
	nr				= 999;
	condition		= DIA_Jack_KAP4_EXIT_Condition;
	information		= DIA_Jack_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Jack_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Jack_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
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
instance DIA_Jack_KAP5_EXIT(C_INFO)
{
	npc				= VLK_444_Jack;
	nr				= 999;
	condition		= DIA_Jack_KAP5_EXIT_Condition;
	information		= DIA_Jack_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Jack_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Jack_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BEMYCAPTAIN(C_INFO)
{
	npc				= VLK_444_Jack;
	nr				= 51;
	condition		= DIA_Jack_BEMYCAPTAIN_Condition;
	information		= DIA_Jack_BEMYCAPTAIN_Info;
	permanent		= TRUE;
	description		= "你 不 想 回 到 海 上 去 吗 ？";
};

func int DIA_Jack_BEMYCAPTAIN_Condition()
{
	if ((Kapitel == 5)
	&& (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (MIS_Jack_KillLighthouseBandits == LOG_SUCCESS)
	&& (MIS_Jack_NewLighthouseOfficer == 0))
	{
		return TRUE;
	};
};

func void DIA_Jack_BEMYCAPTAIN_Info()
{
	AI_Output(other, self, "DIA_Jack_BEMYCAPTAIN_15_00"); //你 不 想 回 到 海 上 去 吗 ？
	AI_Output(self, other, "DIA_Jack_BEMYCAPTAIN_14_01"); //哪 怕 只 要 他 们 再 雇 佣 我 一 次 ， 让 我 登 上 一 艘 大 帆 船 ， 我 都 愿 意 付 出 我 的 一 条 胳 膊 。
	AI_Output(self, other, "DIA_Jack_BEMYCAPTAIN_14_02"); //不 过 对 于 一 个 像 我 这 样 的 老 水 手 ， 那 不 是 件 容 易 的 事 ， 我 的 小 伙 子 。 再 说 ， 那 时 谁 会 来 管 理 这 座 灯 塔 呢 ？

	Info_ClearChoices(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice(DIA_Jack_BEMYCAPTAIN, "别 在 意 。 那 只 是 一 个 想 法 。", DIA_Jack_BEMYCAPTAIN_no);
	Info_AddChoice(DIA_Jack_BEMYCAPTAIN, "我 需 要 你 做 为 水 手 的 经 验 。", DIA_Jack_BEMYCAPTAIN_seaman);
};

func void DIA_Jack_BEMYCAPTAIN_seaman()
{
	AI_Output(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_15_00"); //我 需 要 你 做 为 水 手 的 经 验 。
	AI_Output(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_14_01"); //天 。 你 打 算 做 些 什 么 ， 朋 友 ？ 你 该 不 会 想 要 登 上 国 王 的 战 舰 ， 是 吗 ？
	AI_Output(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_15_02"); //谁 知 道 呢 ？
	AI_Output(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_14_03"); //（ 大 笑 ） 那 会 很 了 不 起 。 哦 ， 好 吧 。 但 是 ， 我 不 能 因 为 那 样 就 放 弃 我 的 灯 塔 。 嗯 。 我 们 要 做 些 什 么 呢 ？

	Log_CreateTopic(TOPIC_Captain, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);
	B_LogEntry(TOPIC_Captain, TOPIC_Captain_5);

	Info_ClearChoices(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice(DIA_Jack_BEMYCAPTAIN, "别 在 意 。 那 只 是 一 个 想 法 。", DIA_Jack_BEMYCAPTAIN_no);
	Info_AddChoice(DIA_Jack_BEMYCAPTAIN, "如 果 我 能 给 你 找 到 一 个 人 … … ？", DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer);
};

func void DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer()
{
	AI_Output(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_15_00"); //如 果 那 时 我 能 带 一 个 人 来 看 管 你 的 灯 塔 又 怎 么 样 呢 ？
	AI_Output(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_01"); //一 个 不 错 的 主 意 ， 朋 友 。 而 且 ， 我 知 道 那 个 人 。
	AI_Output(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_02"); //铁 匠 哈 莱 德 有 个 学 徒 叫 布 赖 恩 。 我 前 一 段 时 间 已 经 跟 他 谈 过 。
	AI_Output(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_03"); //我 愿 意 把 我 的 灯 塔 委 托 给 他 。 我 想 他 就 是 那 个 人 。
	AI_Output(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_04"); //去 跟 他 谈 谈 。 也 许 我 们 走 运 ， 那 个 小 子 会 帮 助 我 们 离 开 。

	Info_ClearChoices(DIA_Jack_BEMYCAPTAIN);
	MIS_Jack_NewLighthouseOfficer = LOG_RUNNING;
};

func void DIA_Jack_BEMYCAPTAIN_no()
{
	AI_Output(other, self, "DIA_Jack_BEMYCAPTAIN_no_15_00"); //别 在 意 。 那 只 是 一 个 想 法 。
	Info_ClearChoices(DIA_Jack_BEMYCAPTAIN);
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain2
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BEMYCAPTAIN2(C_INFO)
{
	npc				= VLK_444_Jack;
	nr				= 52;
	condition		= DIA_Jack_BEMYCAPTAIN2_Condition;
	information		= DIA_Jack_BEMYCAPTAIN2_Info;
	description		= "关 于 布 赖 恩 … …";
};

func int DIA_Jack_BEMYCAPTAIN2_Condition()
{
	if ((MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS)
	|| ((MIS_Jack_NewLighthouseOfficer == LOG_RUNNING) && (Npc_IsDead(Brian))))
	{
		return TRUE;
	};
};

func void DIA_Jack_BEMYCAPTAIN2_Info()
{
	if (Npc_IsDead(Brian))
	{
		AI_Output(other, self, "DIA_Jack_BEMYCAPTAIN2_15_00"); //布 赖 恩 死 了 。
		AI_Output(self, other, "DIA_Jack_BEMYCAPTAIN2_14_01"); //天 。 这 个 世 道 太 可 怕 了 。 他 是 个 多 么 好 的 家 伙 啊 。
		MIS_Jack_NewLighthouseOfficer = LOG_OBSOLETE;
	}
	else
	{
		AI_Output(other, self, "DIA_Jack_BEMYCAPTAIN2_15_02"); //布 赖 恩 从 现 在 起 会 管 理 你 的 灯 塔 。
		AI_Output(self, other, "DIA_Jack_BEMYCAPTAIN2_14_03"); //我 曾 希 望 你 这 么 说 。
		B_GivePlayerXP(XP_Jack_NewLighthouseOfficer);

		if (SCGotCaptain == FALSE)
		{
			AI_Output(self, other, "DIA_Jack_BEMYCAPTAIN2_14_04"); //你 仍 然 需 要 我 吗 ？
		}
		else
		{
			AI_Output(self, other, "DIA_Jack_BEMYCAPTAIN2_14_05"); //我 们 来 看 看 这 个 小 子 是 不 是 真 的 不 错 。
			AI_StopProcessInfos(self);
		};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain3
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BEMYCAPTAIN3(C_INFO)
{
	npc				= VLK_444_Jack;
	nr				= 53;
	condition		= DIA_Jack_BEMYCAPTAIN3_Condition;
	information		= DIA_Jack_BEMYCAPTAIN3_Info;
	description		= "当 我 的 船 长 。";
};

func int DIA_Jack_BEMYCAPTAIN3_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Jack_BEMYCAPTAIN2))
	&& (SCGotCaptain == FALSE)
	&& (MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Jack_BEMYCAPTAIN3_Info()
{
	AI_Output(other, self, "DIA_Jack_BEMYCAPTAIN3_15_00"); //当 我 的 船 长 。
	AI_Output(self, other, "DIA_Jack_BEMYCAPTAIN3_14_01"); //我 已 经 驾 驶 帆 船 周 游 过 全 世 界 了 ， 我 的 小 伙 子 ， 不 过 我 以 前 从 来 没 在 一 艘 船 上 当 过 船 长 。
	AI_Output(other, self, "DIA_Jack_BEMYCAPTAIN3_15_02"); //我 对 航 海 一 窍 不 通 。你 必 须 得 接 手 。
	AI_Output(self, other, "DIA_Jack_BEMYCAPTAIN3_14_03"); //我 会 全 力 以 赴 。
	AI_Output(self, other, "DIA_Jack_BEMYCAPTAIN3_14_04"); //那 么 ， 让 我 看 看 你 的 船 和 你 的 水 手 队 伍 。 而 且 你 知 不 知 道 自 己 要 往 哪 里 去 ？ 我 的 意 思 是 ， 你 有 没 有 一 张 航 海 图 ？
	AI_Output(other, self, "DIA_Jack_BEMYCAPTAIN3_15_05"); //到 港 口 等 我 。 不 用 担 心 其 它 的 事 情 。
	AI_Output(self, other, "DIA_Jack_BEMYCAPTAIN3_14_06"); //如 果 你 这 么 说 的 话 。
	AI_StopProcessInfos(self);
	SCGotCaptain = TRUE;
	JackIsCaptain = TRUE;
	self.flags = NPC_FLAG_IMMORTAL;
	Npc_ExchangeRoutine(self, "WaitForShipCaptain");

	B_GivePlayerXP(XP_Captain_Success);
};

///////////////////////////////////////////////////////////////////////
//	Info Losfahren
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_LOSFAHREN(C_INFO)
{
	npc				= VLK_444_Jack;
	nr				= 59;
	condition		= DIA_Jack_LOSFAHREN_Condition;
	information		= DIA_Jack_LOSFAHREN_Info;
	permanent		= TRUE;
	description		= "好 ， 老 人 家 。 我 们 出 海 吧 。";
};

func int DIA_Jack_LOSFAHREN_Condition()
{
	if ((JackIsCaptain == TRUE)
	&& (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jack_LOSFAHREN_Info()
{
	AI_Output(other, self, "DIA_Jack_LOSFAHREN_15_00"); //好 ， 老 人 家 。 我 们 出 海 吧 。

	if ((B_CaptainConditions(self)) == TRUE)
	{
		AI_Output(self, other, "DIA_Jack_LOSFAHREN_14_01"); //一 切 都 井 井 有 条 。 那 么 ， 给 我 看 看 你 的 航 海 图 。
		AI_Output(self, other, "DIA_Jack_LOSFAHREN_14_02"); //这 将 是 一 次 远 航 。 我 希 望 我 们 能 安 然 无 恙 地 到 达 那 里 。
		AI_Output(self, other, "DIA_Jack_LOSFAHREN_14_03"); //你 真 的 带 齐 一 切 所 需 的 东 西 吗 ？ 我 们 不 会 因 为 你 缺 少 某 些 东 西 就 返 航 。
		AI_Output(self, other, "DIA_Jack_LOSFAHREN_14_04"); //如 果 你 确 定 所 有 的 东 西 都 齐 了 的 话 ， 去 船 长 的 船 舱 睡 一 觉 。 你 会 需 要 它 的 。
		AI_StopProcessInfos(self);
		B_CaptainCallsAllOnBoard(self);
	}
	else
	{
		AI_Output(self, other, "DIA_Jack_LOSFAHREN_14_05"); //放 轻 松 ， 我 的 小 伙 子 。 我 还 没 有 看 到 船 。 它 不 是 这 样 工 作 的 。
		AI_Output(self, other, "DIA_Jack_LOSFAHREN_14_06"); //首 先 ， 你 需 要 一 个 至 少 5 个 人 的 完 整 的 水 手 队 伍 、 自 由 进 出 的 船 只 、 以 及 一 张 航 海 图 。 否 则 就 算 了 吧 。
		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info perm5_NotCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_PERM5_NOTCAPTAIN(C_INFO)
{
	npc				= VLK_444_Jack;
	nr				= 59;
	condition		= DIA_Jack_PERM5_NOTCAPTAIN_Condition;
	information		= DIA_Jack_PERM5_NOTCAPTAIN_Info;
	permanent		= TRUE;
	description		= "那 下 面 发 生 了 什 么 ？";
};

func int DIA_Jack_PERM5_NOTCAPTAIN_Condition()
{
	if (((Npc_KnowsInfo(other, DIA_Jack_BEMYCAPTAIN2))
	&& (SCGotCaptain == TRUE)
	&& (JackIsCaptain == FALSE))
	|| (MIS_Jack_NewLighthouseOfficer == LOG_OBSOLETE))
	{
		return TRUE;
	};
};

func void DIA_Jack_PERM5_NOTCAPTAIN_Info()
{
	AI_Output(other, self, "DIA_Jack_PERM5_NOTCAPTAIN_15_00"); //那 下 面 发 生 了 什 么 ？
	AI_Output(self, other, "DIA_Jack_PERM5_NOTCAPTAIN_14_01"); //我 仔 细 考 虑 过 了 。 最 终 我 准 备 留 在 这 里 看 守 我 的 灯 塔 。

	AI_StopProcessInfos(self);
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
instance DIA_Jack_KAP6_EXIT(C_INFO)
{
	npc				= VLK_444_Jack;
	nr				= 999;
	condition		= DIA_Jack_KAP6_EXIT_Condition;
	information		= DIA_Jack_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Jack_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Jack_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};
