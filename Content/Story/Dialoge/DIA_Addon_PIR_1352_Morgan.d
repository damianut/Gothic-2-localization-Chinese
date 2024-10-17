// ************************************************************
// 			  				   EXIT
// ************************************************************
var int Morgan_Perm_Counter;
// ------------------------------------------------------------
instance DIA_Addon_Morgan_EXIT(C_INFO)
{
	npc				= PIR_1353_Addon_Morgan;
	nr				= 999;
	condition		= DIA_Addon_Morgan_EXIT_Condition;
	information		= DIA_Addon_Morgan_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Morgan_EXIT_Condition()
{
	return TRUE;
};

func int DIA_Addon_Morgan_EXIT_Info()
{
	if (GregIsBack == FALSE)
	{
		AI_Output(other, self, "DIA_Addon_Morgan_Perm_15_00"); //去 躺 下 。
		if (Morgan_Perm_Counter == 0)
		{
			AI_Output(self, other, "DIA_Addon_Morgan_Perm_07_01"); //（ 打 着 哈 欠 ） 好 主 意 。
			Morgan_Perm_Counter = 1;
		}
		else if (Morgan_Perm_Counter == 1)
		{
			AI_Output(self, other, "DIA_Addon_Morgan_Perm_07_02"); //（ 困 倦 的 ） 嗯 ， 那 么 晚 安 。
			Morgan_Perm_Counter = 2;
		}
		else if (Morgan_Perm_Counter == 2)
		{
			AI_Output(self, other, "DIA_Addon_Morgan_Perm_07_03"); //（ 疲 倦 的 ） 非 常 乐 意 。
			Morgan_Perm_Counter = 3;
		}
		else if (Morgan_Perm_Counter == 3)
		{
			AI_Output(self, other, "DIA_Addon_Morgan_Perm_07_04"); //如 果 发 生 了 任 何 事 情 的 话 ， 叫 醒 我 。
			Morgan_Perm_Counter = 0;
		};
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Morgan_PICKPOCKET(C_INFO)
{
	npc				= PIR_1353_Addon_Morgan;
	nr				= 900;
	condition		= DIA_Addon_Morgan_PICKPOCKET_Condition;
	information		= DIA_Addon_Morgan_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Addon_Morgan_PICKPOCKET_Condition()
{
	C_Beklauen(20, 43);
};

func void DIA_Addon_Morgan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Morgan_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Morgan_PICKPOCKET, DIALOG_BACK, DIA_Addon_Morgan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Morgan_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Morgan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Morgan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Morgan_PICKPOCKET);
};

func void DIA_Addon_Morgan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Morgan_PICKPOCKET);
};

// ************************************************************
// 		  				  NICHT Anheuern
// ************************************************************
instance DIA_Addon_Morgan_Anheuern(C_INFO)
{
	npc				= PIR_1353_Addon_Morgan;
	nr				= 1;
	condition		= DIA_Addon_Morgan_Anheuern_Condition;
	information		= DIA_Addon_Morgan_Anheuern_Info;
	important		= TRUE;
};

func int DIA_Addon_Morgan_Anheuern_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (GregIsBack == TRUE))
	{
		return TRUE;
	};
};

func int DIA_Addon_Morgan_Anheuern_Info()
{
	AI_Output(self, other, "DIA_Addon_Morgan_Anheuern_07_00"); //好 极 了 ， 现 在 格 雷 格 让 我 去 锯 木 板 ！
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		AI_Output(self, other, "DIA_Addon_Morgan_Anheuern_07_01"); //（ 讽 刺 的 ） 祝 你 屠 杀 怪 物 开 心 ！
	};
};

// ************************************************************
// 			  				  Hallo
// ************************************************************
instance DIA_Addon_Morgan_Hello(C_INFO)
{
	npc				= PIR_1353_Addon_Morgan;
	nr				= 1;
	condition		= DIA_Addon_Morgan_Hello_Condition;
	information		= DIA_Addon_Morgan_Hello_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_Morgan_Hello_Condition()
{
	if ((MIS_AlligatorJack_BringMeat == FALSE)
	&& (Npc_IsInState(self, ZS_Talk))
	&& ((Npc_IsDead(AlligatorJack)) == FALSE)
	&& (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_Hello_Info()
{
	AI_Output(other, self, "DIA_Addon_Morgan_Hello_15_00"); //嘿 ， 你 ！
	AI_Output(self, other, "DIA_Addon_Morgan_Hello_07_01"); //（ 困 倦 的 ） 嗯 ？ 你 想 要 什 么 ？
	AI_Output(self, other, "DIA_Addon_Morgan_Hello_07_02"); //（ 困 倦 的 ） 鳄 鱼 杰 克 回 来 了 ？
	AI_Output(self, other, "DIA_Addon_Morgan_Hello_07_03"); //（ 困 倦 的 ） 没 有 ？ 那 么 他 一 定 很 快 回 来 。 晚 安 。
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  		 Fleisch von Alli-Jack
// ************************************************************
instance DIA_Addon_Morgan_Meat(C_INFO)
{
	npc				= PIR_1353_Addon_Morgan;
	nr				= 2;
	condition		= DIA_Addon_Morgan_Meat_Condition;
	information		= DIA_Addon_Morgan_Meat_Info;
	description		= "我 来 这 里 送 一 些 肉 。";
};

func int DIA_Addon_Morgan_Meat_Condition()
{
	if ((MIS_AlligatorJack_BringMeat == LOG_RUNNING)
	&& (Npc_HasItems(other, ItFoMuttonRaw) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_Meat_Info()
{
	AI_Output(other, self, "DIA_Addon_Morgan_Meat_15_00"); //我 来 这 里 送 一 些 肉 。

	if (GregIsBack == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Morgan_Meat_07_01"); //（ 醒 过 来 ） 啊 。 我 要 喝 一 杯 起 床 酒 。

		CreateInvItems(self, ItFo_Booze, 3);
		B_UseItem(self, ItFo_Booze);

		AI_Output(self, other, "DIA_Addon_Morgan_Meat_07_02"); //那 样 好 多 了 。 再 说 一 次 ， 你 想 要 什 么 ？
		AI_Output(other, self, "DIA_Addon_Morgan_Meat_15_03"); //我 来 送 一 些 肉 ， 从 鳄 鱼 杰 克 那 来 。
	};

	AI_Output(self, other, "DIA_Addon_Morgan_Meat_07_04"); //我 记 得 。 好 ！ 肉 ！ 给 我 !

	var int GivenMeat; GivenMeat = Npc_HasItems(other, ItFoMuttonRaw);

	if (GivenMeat > 10)
	{
		GivenMeat = 10;
	};

	B_GiveInvItems(other, self, ItFoMuttonRaw, GivenMeat);

	if (GivenMeat < 10)
	{
		AI_Output(self, other, "DIA_Addon_Morgan_Meat_07_05"); //什 么 ， 就 那 么 多 ？ 你 把 其 它 的 都 吃 了 吧 ， 嗯 ？ 哦 好 吧 ， 别 介 意 … …
	};

	B_LogEntry(TOPIC_Addon_BringMeat, TOPIC_Addon_BringMeat_2);

	MIS_AlligatorJack_BringMeat = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_ALLIGatORJACK_BringMeat);
};

// ************************************************************
// 			 				Hallo 2 (Job)
// ************************************************************
instance DIA_Addon_Morgan_Job(C_INFO)
{
	npc				= PIR_1353_Addon_Morgan;
	nr				= 3;
	condition		= DIA_Addon_Morgan_Job_Condition;
	information		= DIA_Addon_Morgan_Job_Info;
	description		= "你 在 这 里 做 什 么 ？";
};

func int DIA_Addon_Morgan_Job_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Morgan_Meat))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_Job_Info()
{
	AI_Output(other, self, "DIA_Addon_Morgan_Job_15_01"); //你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Addon_Morgan_Job_07_01"); //格 雷 格 让 我 指 挥 两 支 突 袭 部 队 其 中 的 一 支 。
	AI_Output(self, other, "DIA_Addon_Morgan_Job_07_02"); //我 负 责 维 持 营 地 的 补 给 - 鳄 鱼 杰 克 负 责 那 个 。
	AI_Output(self, other, "DIA_Addon_Morgan_Job_07_03"); //我 还 负 责 让 你 在 外 面 见 到 的 那 些 野 兽 远 离 这 个 营 地 。
	AI_Output(self, other, "DIA_Addon_Morgan_Job_07_04"); //那 就 是 这 些 小 伙 子 们 要 做 的 事 。
	if (GregIsBack == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Morgan_Job_07_05"); //我 告 诉 他 们 ， 在 格 雷 格 回 来 的 时 候 ， （ 打 哈 欠 ） 这 里 不 能 剩 下 一 头 野 兽 。
	};
};

// ************************************************************
// 			 			Faule Sau --> Lehrer
// ************************************************************
instance DIA_Addon_Morgan_Sleep(C_INFO)
{
	npc				= PIR_1353_Addon_Morgan;
	nr				= 4;
	condition		= DIA_Addon_Morgan_Sleep_Condition;
	information		= DIA_Addon_Morgan_Sleep_Info;
	description		= "你 以 前 亲 自 做 过 事 吗 ？";
};

func int DIA_Addon_Morgan_Sleep_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Morgan_Job))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_Sleep_Info()
{
	AI_Output(other, self, "DIA_Addon_Morgan_Sleep_15_00"); //你 以 前 亲 自 做 过 事 吗 ？
	AI_Output(self, other, "DIA_Addon_Morgan_Sleep_07_01"); //嘿 ， 说 话 不 许 放 肆 ！
	AI_Output(self, other, "DIA_Addon_Morgan_Sleep_07_02"); //我 的 任 务 是 所 有 任 务 中 最 重 要 的 。
	AI_Output(self, other, "DIA_Addon_Morgan_Sleep_07_03"); //我 训 练 我 的 人 。
	AI_Output(self, other, "DIA_Addon_Morgan_Sleep_07_04"); //我 让 他 们 变 成 在 这 片 水 域 航 行 中 最 棒 、 最 无 畏 的 战 士 。
	AI_Output(self, other, "DIA_Addon_Morgan_Sleep_07_05"); //这 和 那 些 整 天 无 所 事 事 的 家 伙 不 同 。
	AI_Output(self, other, "DIA_Addon_Morgan_Sleep_07_06"); //他 们 因 为 努 力 而 得 到 大 袋 的 钱 。
};

// ************************************************************
// *** ***
// 							Entertrupp
// *** ***
// ************************************************************
// ------------------------------------------------------------
// 						Ich will mitmachen!
// ------------------------------------------------------------
instance DIA_Addon_Morgan_JoinMorgan(C_INFO)
{
	npc				= PIR_1353_Addon_Morgan;
	nr				= 5;
	condition		= DIA_Addon_Morgan_JoinMorgan_Condition;
	information		= DIA_Addon_Morgan_JoinMorgan_Info;
	description		= "我 要 加 入 你 的 部 队 。";
};

func int DIA_Addon_Morgan_JoinMorgan_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Morgan_Sleep))
	&& (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_JoinMorgan_Info()
{
	AI_Output(other, self, "DIA_Addon_Morgan_JoinMorgan_15_00"); //我 要 加 入 你 的 部 队 。
	AI_Output(self, other, "DIA_Addon_Morgan_JoinMorgan_07_01"); //（ 大 笑 ） 我 的 部 队 ？ 我 的 部 队 正 在 海 滩 上 。
	AI_Output(self, other, "DIA_Addon_Morgan_JoinMorgan_07_03"); //你 尽 管 放 心 好 了 ， 在 船 长 回 来 之 前 ， 那 些 小 子 们 不 会 动 一 根 手 指 。
	AI_Output(self, other, "DIA_Addon_Morgan_JoinMorgan_07_04"); //不 过 如 果 你 想 让 所 有 人 都 知 道 你 是 最 出 色 的 话 ， 那 么 你 可 以 随 意 去 北 边 的 海 滩 。
	AI_Output(self, other, "DIA_Addon_Morgan_JoinMorgan_07_05"); //那 里 布 满 了 潜 伏 者 和 其 它 一 些 鬼 才 知 道 是 什 么 的 东 西 。
	AI_Output(self, other, "DIA_Addon_Morgan_JoinMorgan_07_06"); //自 己 去 解 决 他 们 ， 然 后 你 就 会 赢 得 （ 打 哈 欠 ） 所 有 人 的 尊 敬 … …
	AI_Output(self, other, "DIA_Addon_Morgan_JoinMorgan_07_07"); //欢 迎 加 入 我 的 部 队 。 哈 ！ 我 要 躺 回 去 了 … …

	Log_CreateTopic(TOPIC_Addon_MorganBeach, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MorganBeach, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_MorganBeach, TOPIC_Addon_MorganBeach_3);

	MIS_Addon_MorganLurker = LOG_RUNNING;
	AI_StopProcessInfos(self);
};

// ------------------------------------------------------------
// 							LurkerPlatt
// ------------------------------------------------------------
instance DIA_Addon_Morgan_LurkerPlatt(C_INFO)
{
	npc				= PIR_1353_Addon_Morgan;
	nr				= 6;
	condition		= DIA_Addon_Morgan_LurkerPlatt_Condition;
	information		= DIA_Addon_Morgan_LurkerPlatt_Info;
	permanent		= TRUE;
	description		= "北 部 海 滩 全 部 清 理 干 净 了 。";
};

func int DIA_Addon_Morgan_LurkerPlatt_Condition()
{
	if ((Npc_IsDead(BeachLurker1))
	&& (Npc_IsDead(BeachLurker2))
	&& (Npc_IsDead(BeachLurker3))
	&& (Npc_IsDead(BeachWaran1))
	&& (Npc_IsDead(BeachWaran2))
	&& (MIS_Addon_MorganLurker == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_LurkerPlatt_Info()
{
	AI_Output(other, self, "DIA_Addon_Morgan_LurkerPlatt_15_00"); //北 部 海 滩 全 部 清 理 干 净 了 。
	AI_Output(self, other, "DIA_Addon_Morgan_LurkerPlatt_07_01"); //那 么 洞 穴 呢 ？ 你 也 去 过 那 里 了 ？

	if (Npc_IsDead(BeachShadowbeast1))
	{
		AI_Output(other, self, "DIA_Addon_Morgan_LurkerPlatt_15_02"); //当 然 了 。
		AI_Output(self, other, "DIA_Addon_Morgan_LurkerPlatt_07_03"); //棒 极 了 。 你 是 一 个 出 色 的 家 伙 。
		AI_Output(self, other, "DIA_Addon_Morgan_LurkerPlatt_07_04"); //这 是 你 的 报 酬 。
		CreateInvItems(self, ItMi_Gold, 150);
		B_GiveInvItems(self, other, ItMi_Gold, 150);

		B_LogEntry(TOPIC_Addon_MorganBeach, TOPIC_Addon_MorganBeach_4);

		MIS_Addon_MorganLurker = LOG_SUCCESS;

		B_GivePlayerXP(XP_Addon_Morgan_LurkerPlatt);
	}
	else
	{
		AI_Output(other, self, "DIA_Addon_Morgan_LurkerPlatt_15_05"); //嗯 … …
		AI_Output(self, other, "DIA_Addon_Morgan_LurkerPlatt_07_06"); //恩 ， 那 也 是 其 中 的 一 部 分 。 等 你 完 成 的 时 候 再 回 来 。

		B_LogEntry(TOPIC_Addon_MorganBeach, TOPIC_Addon_MorganBeach_5);

		AI_StopProcessInfos(self);
	};
};

// ------------------------------------------------------------
//						Sonst noch Auftrag?
// ------------------------------------------------------------
instance DIA_Addon_Morgan_Auftrag2(C_INFO)
{
	npc				= PIR_1353_Addon_Morgan;
	nr				= 99;
	condition		= DIA_Addon_Morgan_Auftrag2_Condition;
	information		= DIA_Addon_Morgan_Auftrag2_Info;
	permanent		= TRUE;
	description		= "还 有 什 么 事 要 我 做 吗 ？";
};

func int DIA_Addon_Morgan_Auftrag2_Condition()
{
	if (MIS_Addon_MorganLurker == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_Auftrag2_Info()
{
	AI_Output(other, self, "DIA_Addon_Morgan_Auftrag2_15_00"); //还 有 什 么 事 要 我 做 吗 ？

	if (GregIsBack == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Morgan_Auftrag2_07_01"); //现 在 不 行 。
		AI_Output(self, other, "DIA_Addon_Morgan_Auftrag2_07_02"); //去 找 个 床 位 ， 然 后 弄 一 瓶 象 样 的 朗 姆 酒 !
		CreateInvItems(self, ItFo_Booze, 3);
		B_UseItem(self, ItFo_Booze);
		AI_Output(self, other, "DIA_Addon_Morgan_Auftrag2_07_03"); //啊 。 这 东 西 不 错 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Morgan_Auftrag2_07_04"); //你 最 好 去 问 船 长 。
	};

	AI_StopProcessInfos(self);
};

//**************************************************
//				Angus und Hank (Ring)
//**************************************************
var int Morgan_AngusStory;
// --------------------------------------------------
instance DIA_Addon_Morgan_FOUNDTHEM(C_INFO)
{
	npc				= PIR_1353_Addon_Morgan;
	nr				= 7;
	condition		= DIA_Addon_Morgan_FOUNDTHEM_Condition;
	information		= DIA_Addon_Morgan_FOUNDTHEM_Info;
	permanent		= TRUE;
	description		= "关 于 安 格 斯 与 汉 克 … …";
};

func int DIA_Addon_Morgan_FOUNDTHEM_Condition()
{
	if ((MIS_Addon_Morgan_SeekTraitor != LOG_SUCCESS)
	&& (Npc_KnowsInfo(other, DIA_Addon_Skip_AngusHank)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_FOUNDTHEM_Info()
{
	AI_Output(other, self, "DIA_Addon_Morgan_FOUNDTHEM_15_00"); //关 于 安 格 斯 与 汉 克 … …

	if (Morgan_AngusStory == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Morgan_FOUNDTHEM_07_01"); //不 要 跟 我 提 起 他 们 。
		AI_Output(self, other, "DIA_Addon_Morgan_FOUNDTHEM_07_02"); //他 们 可 能 已 经 被 海 盗 杀 了 。
		AI_Output(self, other, "DIA_Addon_Morgan_FOUNDTHEM_07_03"); //安 格 斯 还 拿 着 我 的 戒 指 呢 。
		AI_Output(self, other, "DIA_Addon_Morgan_FOUNDTHEM_07_04"); //嗯 ， 当 然 ， 从 某 一 方 面 来 看 ， 那 是 他 的 戒 指 。 他 在 骰 子 游 戏 里 从 我 这 里 赢 走 了 它 。
		AI_Output(self, other, "DIA_Addon_Morgan_FOUNDTHEM_07_05"); //我 本 可 以 把 它 弄 回 来 ， 但 是 现 在 它 彻 底 消 失 了 ！
		Morgan_AngusStory = TRUE;
	};

	Info_ClearChoices(DIA_Addon_Morgan_FOUNDTHEM);
	if (Npc_HasItems(other, ItRi_Addon_MorgansRing_Mission) > 0)
	{
		Info_AddChoice(DIA_Addon_Morgan_FOUNDTHEM, "我 找 到 了 他 们 。", DIA_Addon_Morgan_FOUNDTHEM_Now);
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Morgan_FOUNDTHEM_07_06"); //如 果 你 找 到 我 的 戒 指 ， 把 它 还 给 我 。 我 一 定 会 酬 谢 你 的 ！
	};
};

func void DIA_Addon_Morgan_FOUNDTHEM_Now()
{
	AI_Output(other, self, "DIA_Addon_Morgan_FOUNDTHEM_15_01"); //我 找 到 了 他 们 。
	AI_Output(self, other, "DIA_Addon_Morgan_FOUNDTHEM_07_07"); //那 么 马 上 告 诉 我 。 他 们 在 哪 里 ？
	AI_Output(other, self, "DIA_Addon_Morgan_FOUNDTHEM_15_03"); //他 们 死 了 。
	AI_Output(self, other, "DIA_Addon_Morgan_FOUNDTHEM_07_08"); //戒 指 呢 ， 戒 指 怎 么 样 了 ？
	Info_ClearChoices(DIA_Addon_Morgan_FOUNDTHEM);
	Info_AddChoice(DIA_Addon_Morgan_FOUNDTHEM, "它 在 这 里 。", DIA_Addon_Morgan_FOUNDTHEM_GiveRing);
	Info_AddChoice(DIA_Addon_Morgan_FOUNDTHEM, "他 们 没 有 拿 到 它 。", DIA_Addon_Morgan_FOUNDTHEM_NoRing);
};

func void DIA_Addon_Morgan_FOUNDTHEM_NoRing()
{
	AI_Output(other, self, "DIA_Addon_Morgan_FOUNDTHEM_NoRing_15_00"); //他 们 没 有 拿 到 它 。
	AI_Output(self, other, "DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_01"); //（ 惊 骇 的 ） 什 么 ？ 再 回 去 看 看 。 他 们 一 定 得 到 它 了 。
	AI_Output(self, other, "DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_02"); //那 是 一 个 带 有 很 多 装 饰 物 的 小 戒 指 。
	AI_Output(self, other, "DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_03"); //你 一 定 要 找 到 他 。 你 一 定 要 ！
	Info_ClearChoices(DIA_Addon_Morgan_FOUNDTHEM);
};

func void DIA_Addon_Morgan_FOUNDTHEM_GiveRing()
{
	AI_Output(other, self, "DIA_Addon_Morgan_FOUNDTHEM_GiveRing_15_00"); //它 在 这 里 。
	B_GiveInvItems(other, self, ItRi_Addon_MorgansRing_Mission, 1);
	AI_Output(self, other, "DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_01"); //（ 象 孩 子 一 样 快 乐 ） 是 的 ， 就 是 它 。 好 人 ！
	AI_Output(self, other, "DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_02"); //给 ， 拿 上 这 个 石 片 。 它 看 起 来 好 像 一 文 不 值 ， 但 是 加 略 特 会 出 大 价 钱 买 它 。

	MIS_Addon_Morgan_SeekTraitor = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_MorgansRing);
	Info_ClearChoices(DIA_Addon_Morgan_FOUNDTHEM);

	// PATCH M.F.
	B_GiveInvItems(self, other, ItWr_StonePlateCommon_Addon, 1);
};

//**************************************************
//			Francis
//**************************************************
instance DIA_Addon_Morgan_Francis(C_INFO)
{
	npc				= PIR_1353_Addon_Morgan;
	nr				= 5;
	condition		= DIA_Addon_Morgan_Francis_Condition;
	information		= DIA_Addon_Morgan_Francis_Info;
	description		= "你 怎 么 看 弗 朗 西 斯 ？";
};

func int DIA_Addon_Morgan_Francis_Condition()
{
	if (Francis_ausgeschissen == FALSE)
	{
		if ((Npc_KnowsInfo(other, DIA_Addon_Skip_GregsHut))
		|| (Francis.aivar[AIV_TalkedToPlayer] == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Morgan_Francis_Info()
{
	AI_Output(other, self, "DIA_Addon_Morgan_Francis_15_00"); //你 怎 么 看 弗 朗 西 斯 ？
	AI_Output(self, other, "DIA_Addon_Morgan_Francis_07_01"); //只 要 他 不 来 惹 我 ， （ 威 胁 的 ） 我 就 不 会 提 他 ！
	AI_Output(other, self, "DIA_Addon_Morgan_Francis_15_02"); //他 不 是 这 里 的 头 吗 ？
	AI_Output(self, other, "DIA_Addon_Morgan_Francis_07_03"); //（ 讨 厌 的 大 笑 ） 他 自 以 为 他 是 头 。
	AI_Output(self, other, "DIA_Addon_Morgan_Francis_07_04"); //（ 心 满 意 足 ） 但 是 等 到 格 雷 格 回 来 的 时 候 ， 弗 朗 西 斯 就 要 回 去 锯 木 板 。
};

// ************************************************************
// *** ***
//							TEACH
// *** ***
// ************************************************************

// ------------------------------------------------------------
// 							Wanna Learn
// ------------------------------------------------------------
instance DIA_Addon_Morgan_TRAIN(C_INFO)
{
	npc				= PIR_1353_Addon_Morgan;
	nr				= 5;
	condition		= DIA_Addon_Morgan_TRAIN_Condition;
	information		= DIA_Addon_Morgan_TRAIN_Info;
	description		= "你 也 能 训 练 我 吗 ？";
};

func int DIA_Addon_Morgan_TRAIN_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Morgan_Sleep))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_TRAIN_Info()
{
	AI_Output(other, self, "DIA_Addon_Morgan_TRAIN_15_00"); //你 也 能 训 练 我 吗 ？
	AI_Output(self, other, "DIA_Addon_Morgan_TRAIN_07_01"); //当 然 ， 我 可 以 教 你 如 何 使 用 单 手 武 器 战 斗 。

	Log_CreateTopic(Topic_Addon_PIR_Teacher, LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Teacher, Log_Text_Addon_MorganTeach);

	Morgan_Addon_TeachPlayer = TRUE;
};

// ------------------------------------------------------------
// 		  		Unterrichte mich!
// ------------------------------------------------------------
var int Morgan_merke1h;
var int Morgan_Labercount;
// ------------------------------------------------------------
instance DIA_Addon_Morgan_Teach(C_INFO)
{
	npc				= PIR_1353_Addon_Morgan;
	nr				= 99;
	condition		= DIA_Addon_Morgan_Teach_Condition;
	information		= DIA_Addon_Morgan_Teach_Info;
	permanent		= TRUE;
	description		= "教 给 我 ！";
};

func int DIA_Addon_Morgan_Teach_Condition()
{
	if (Morgan_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_Teach_Info()
{
	AI_Output(other, self, "DIA_Addon_Morgan_Teach_15_00"); //教 给 我 ！

	Morgan_merke1h = other.HitChance[NPC_TALENT_1H];

	Info_ClearChoices(DIA_Addon_Morgan_Teach);
	Info_AddChoice(DIA_Addon_Morgan_Teach, DIALOG_BACK, DIA_Addon_Morgan_Teach_Back);
	Info_AddChoice(DIA_Addon_Morgan_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Addon_Morgan_Teach_1H_1);
	Info_AddChoice(DIA_Addon_Morgan_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1) * 5), DIA_Addon_Morgan_Teach_1H_5);
};

func void DIA_Addon_Morgan_Teach_Back()
{
	if (other.HitChance[NPC_TALENT_1H] > Morgan_Merke1h)
	{
		if (Morgan_Labercount == 0)
		{
			AI_Output(self, other, "DIA_Addon_Morgan_CommentFightSkill_07_00"); //忘 了 所 有 那 些 狗 屁 不 通 的 荣 誉 和 诸 如 此 类 的 东 西 吧 。 要 么 你 杀 了 他 ， 要 么 他 杀 了 你 。
			Morgan_Labercount = 1;
		}
		else if (Morgan_Labercount == 1)
		{
			AI_Output(self, other, "DIA_Addon_Morgan_CommentFightSkill_07_01"); //将 来 ， 你 必 须 学 习 如 何 在 你 的 攻 击 中 使 出 更 大 的 力 量 。
			Morgan_Labercount = 2;
		}
		else if (Morgan_Labercount == 2)
		{
			AI_Output(self, other, "DIA_Addon_Morgan_CommentFightSkill_07_02"); //哈 哈 哈 ， 至 少 现 在 你 知 道 如 何 握 住 长 剑 了 。
			Morgan_Labercount = 0;
		};
	}
	else if (other.HitChance[NPC_TALENT_1H] >= 75)
	{
		AI_Output(self, other, "DIA_Addon_Morgan_Teach_Back_07_00"); //如 果 你 想 继 续 深 造 的 话 ， 你 就 必 须 向 其 它 人 学 习 。
	};

	Info_ClearChoices(DIA_Addon_Morgan_Teach);
};

func void DIA_Addon_Morgan_Teach_1H_1()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_1H, 1, 75);

	Info_ClearChoices(DIA_Addon_Morgan_Teach);
	Info_AddChoice(DIA_Addon_Morgan_Teach, DIALOG_BACK, DIA_Addon_Morgan_Teach_Back);
	Info_AddChoice(DIA_Addon_Morgan_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Addon_Morgan_Teach_1H_1);
	Info_AddChoice(DIA_Addon_Morgan_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1) * 5), DIA_Addon_Morgan_Teach_1H_5);
};

func void DIA_Addon_Morgan_Teach_1H_5()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_1H, 5, 75);

	Info_ClearChoices(DIA_Addon_Morgan_Teach);
	Info_AddChoice(DIA_Addon_Morgan_Teach, DIALOG_BACK, DIA_Addon_Morgan_Teach_Back);
	Info_AddChoice(DIA_Addon_Morgan_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Addon_Morgan_Teach_1H_1);
	Info_AddChoice(DIA_Addon_Morgan_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1) * 5), DIA_Addon_Morgan_Teach_1H_5);
};
