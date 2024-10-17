// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_DiegoOw_EXIT(C_INFO)
{
	npc				= PC_ThiefOw;
	nr				= 999;
	condition		= DIA_DiegoOw_EXIT_Condition;
	information		= DIA_DiegoOw_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_DiegoOw_EXIT_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//******************************************************************
//				Begrüssung
//******************************************************************
instance DIA_DiegoOw_Hallo(C_INFO)
{
	npc				= PC_ThiefOW;
	nr				= 1;
	condition		= DIA_DiegoOw_Hallo_Condition;
	information		= DIA_DiegoOw_Hallo_Info;
	important		= TRUE;
};

func int DIA_DiegoOw_Hallo_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_Hallo_Info()
{
	AI_Output(self, other, "DIA_DiegoOw_Hallo_11_00"); //嘿 ， 我 还 以 为 你 已 经 死 了。
	AI_Output(other, self, "DIA_DiegoOw_Hallo_15_01"); //是 的 … … 我 曾 经 是 的 。
	AI_Output(other, self, "DIA_DiegoOw_Hallo_15_02"); //但 现 在 我 回 来 了 ， 来 寻 找 龙 出 现 的 证 据 。
	AI_Output(self, other, "DIA_DiegoOw_Hallo_11_03"); //你 那 么 做 是 为 了 谁 ？
	AI_Output(other, self, "DIA_DiegoOw_Hallo_15_04"); //我 为 哈 根 勋 爵 工 作 。 有 了 圣 骑 士 的 帮 助 ， 就 能 阻 止 那 些 龙 了 。
	AI_Output(self, other, "DIA_DiegoOw_Hallo_11_05"); //那 些 圣 骑 士 ？ 让 我 告 诉 你 一 些 事 情 吧 。 我 设 法 从 这 里 逃 出 去 之 后 去 了 克 霍 里 尼 斯 。
	AI_Output(self, other, "DIA_DiegoOw_Hallo_11_06"); //我 希 望 能 警 告 那 些 圣 骑 士 关 于 龙 的 事 情 。 天 知 道 为 什 么 我 竟 然 会 真 的 去 做 了 。
	AI_Output(self, other, "DIA_DiegoOw_Hallo_11_07"); //那 个 趾 高 气 昂 的 洛 萨 甚 至 听 都 不 听 我 说 - 当 然 更 不 会 让 我 跟 哈 根 勋 爵 谈 。
	AI_Output(self, other, "DIA_DiegoOw_Hallo_11_08"); //相 反 ， 他 们 把 我 和 远 征 队 一 起 送 回 这 里 来 。 所 以 ， 别 跟 我 提 起 圣 骑 士 … …
	AI_Output(other, self, "DIA_DiegoOw_Hallo_15_09"); //重 要 的 是 ， 要 及 时 阻 止 那 些 龙 - 不 管 是 谁 帮 我 们 达 成 这 件 事 。
	AI_Output(self, other, "DIA_DiegoOw_Hallo_11_10"); //阻 止 它 们 ？ 我 们 应 该 趁 早 想 办 法 逃 出 这 个 山 谷 。

	AI_Output(self, other, "DIA_DiegoOw_Silvestro_11_03"); //说 说 看 - 你 是 用 什 么 法 子 穿 过 那 个 关 卡 的 ？ 我 想 那 里 一 定 挤 满 了 兽 人 。
	AI_Output(other, self, "DIA_DiegoOw_Silvestro_15_04"); //有 一 条 小 路 穿 过 废 弃 的 矿 坑 ， 那 里 没 被 兽 人 控 制 。
	AI_Output(self, other, "DIA_DiegoOw_Silvestro_11_05"); //能 知 道 这 件 事 情 真 好 。 那 我 马 上 就 往 克 霍 里 尼 斯 去 - 我 在 那 里 还 有 几 笔 旧 账 要 算 。
};

//******************************************************************
//				Beweise
//******************************************************************
instance DIA_DiegoOw_Beweise(C_INFO)
{
	npc				= PC_ThiefOW;
	nr				= 2;
	condition		= DIA_DiegoOw_Beweise_Condition;
	information		= DIA_DiegoOw_Beweise_Info;
	description		= "听 着 ， 我 需 要 这 个 证 明 。";
};

func int DIA_DiegoOw_Beweise_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_Beweise_Info()
{
	// AI_Output(other,self,"DIA_DiegoOw_Silvestro_15_00");// Was weißt du von Silvestros Erz?

	AI_Output(other, self, "DIA_DiegoOw_Hallo_15_11"); //听 着 ， 我 需 要 这 个 证 明 。

	if (MIS_ScoutMine == LOG_RUNNING)
	{
		AI_Output(self, other, "DIA_DiegoOw_Hallo_11_14"); //好 的 ， 我 将 尽 可 能 帮 助 你 。 但 我 不 会 为 任 何 人 去 冒 掉 脑 袋 的 危 险 。
	}
	else
	{
		AI_Output(self, other, "DIA_DiegoOw_Hallo_11_12"); //好 吧 ， 如 果 那 是 你 的 任 务 - 去 跟 加 隆 德 指 挥 官 谈 谈 。
		AI_Output(self, other, "DIA_DiegoOw_Hallo_11_13"); //如 果 有 谁 知 道 关 于 龙 袭 击 的 事 情 ， 那 肯 定 会 是 城 堡 里 的 那 些 小 伙 子 们 。
	};

	if (MIS_ScoutMine == LOG_RUNNING)
	{
		AI_Output(other, self, "DIA_DiegoOw_Garond_15_00"); //我 是 代 表 加 隆 德 来 的 。 他 想 知 道 至 今 已 经 采 了 多 少 矿 石 。
		AI_Output(self, other, "DIA_DiegoOw_Garond_11_01"); //然 后 ， 他 就 会 给 你 你 想 要 的 证 据 吗 ？
		AI_Output(other, self, "DIA_DiegoOw_Garond_15_02"); //是 这 样 的 。 那 么 - 你 能 告 诉 我 进 展 情 况 吗 ？
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_DiegoOw_Garond_11_01"); //当 你 到 城 堡 时 ， 你 可 以 告 诉 加 隆 德 一 些 他 会 非 常 感 兴 趣 的 事 ：
	};

	if (Npc_GetDistToWP(self, "LOCATION_02_05") <= 1000)
	{
		AI_Output(self, other, "DIA_DiegoOw_Silvestro_11_01"); //这 里 的 洞 穴 后 面 藏 着 四 箱 矿 石 ， 是 席 尔 维 斯 特 罗 的 人 开 采 的 。
		AI_Output(self, other, "DIA_DiegoOw_Silvestro_11_02"); //我 非 常 乐 意 让 加 隆 德 来 带 走 它 们 - 不 过 那 时 我 已 经 不 在 这 里 了 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_DiegoOw_Silvestro_11_01"); //在 我 躲 藏 的 地 方 ， 附 近 的 洞 穴 里 面 ， 他 可 以 找 到 那 四 箱 矿 石 。 是 席 尔 维 斯 特 罗 的 人 开 采 的 。
		AI_Output(self, other, "DIA_Addon_DiegoOw_Silvestro_11_02"); //我 非 常 乐 意 让 加 隆 德 来 带 走 它 们 。 总 之 ， 它 们 对 我 没 有 用 处 。
	};

	Silvestro_Ore = TRUE;

	B_LogEntry(TOPIC_ScoutMine, TOPIC_ScoutMine_5);
};

//******************************************************************
//			Mine
//******************************************************************
instance DIA_DiegoOw_Mine(C_INFO)
{
	npc				= PC_ThiefOW;
	nr				= 3;
	condition		= DIA_DiegoOw_Mine_Condition;
	information		= DIA_DiegoOw_Mine_Info;
	description		= "你 怎 么 得 到 矿 石 的 ？";
};

func int DIA_DiegoOw_Mine_Condition()
{
	if (Npc_KnowsInfo(other, DIA_DiegoOw_Beweise))
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Mine_Info()
{
	AI_Output(other, self, "DIA_DiegoOw_Mine_15_00"); //你 怎 么 得 到 矿 石 的 ？
	AI_Output(self, other, "DIA_DiegoOw_Mine_11_01"); //我 在 席 尔 维 斯 特 罗 的 小 组 里 。 我 们 挖 了 几 天 矿 石 后 ， 席 尔 维 斯 特 罗 突 然 担 心 起 来 。
	AI_Output(self, other, "DIA_DiegoOw_Mine_11_02"); //他 说 我 们 应 该 把 矿 石 放 到 一 个 安 全 的 地 方 。
	AI_Output(self, other, "DIA_DiegoOw_Mine_11_03"); //嗯 ， 因 为 我 那 时 正 在 计 划 逃 跑 ， 就 自 告 奋 勇 地 要 求 去 藏 矿 石 。
	AI_Output(self, other, "DIA_DiegoOw_Mine_11_04"); //那 次 真 是 走 运 。 因 为 那 些 矿 工 碰 上 了 几 个 矿 井 爬 行 者 。 后 来 他 们 没 有 一 个 幸 存 下 来 。
};

//******************************************************************
//			Ritter
//******************************************************************
instance DIA_DiegoOw_Ritter(C_INFO)
{
	npc				= PC_ThiefOW;
	nr				= 4;
	condition		= DIA_DiegoOw_Ritter_Condition;
	information		= DIA_DiegoOw_Ritter_Info;
	description		= "关 于 那 两 个 死 去 的 骑 士 呢 … …";
};

func int DIA_DiegoOw_Ritter_Condition()
{
	if ((Npc_HasItems(PAL_Leiche4, ItMI_OldCoin) == 0)
	|| (Npc_HasItems(PAL_Leiche5, ItMI_OldCoin) == 0))
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Ritter_Info()
{
	AI_Output(other, self, "DIA_DiegoOw_Ritter_15_00"); //那 两 个 在 你 的 藏 身 处 前 面 死 去 的 骑 士 是 怎 么 回 事 ？
	AI_Output(self, other, "DIA_DiegoOw_Ritter_11_01"); //他 们 跟 一 群 暴 龙 搏 斗 时 走 了 倒 霉 运 。
	AI_Output(self, other, "DIA_DiegoOw_Ritter_11_02"); //好 吧 ， 矿 藏 山 谷 也 有 它 的 规 矩 。 我 也 是 这 样 跟 他 们 说 的 ， 但 是 他 们 不 肯 听 我 的 。
};

//******************************************************************
//			Perm
//******************************************************************
instance DIA_DiegoOw_Perm(C_INFO)
{
	npc				= PC_ThiefOW;
	nr				= 5;
	condition		= DIA_DiegoOw_Perm_Condition;
	information		= DIA_DiegoOw_Perm_Info;
	description		= "关 于 山 谷 我 需 要 知 道 些 什 么 ？";
};

func int DIA_DiegoOw_Perm_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_Perm_Info()
{
	AI_Output(other, self, "DIA_DiegoOw_Perm_15_00"); //关 于 山 谷 我 需 要 知 道 些 什 么 ？
	AI_Output(self, other, "DIA_DiegoOw_Perm_11_01"); //自 从 屏 障 灭 亡 后 ， 这 周 围 有 几 件 事 情 发 生 了 变 化 。 现 在 ， 兽 人 统 治 了 这 里 。
	AI_Output(self, other, "DIA_DiegoOw_Perm_11_02"); //我 们 人 类 只 不 过 是 饲 料 ， 被 用 来 喂 这 个 山 谷 里 真 正 的 统 治 者 ： 那 些 龙 。
	AI_Output(self, other, "DIA_DiegoOw_Perm_11_03"); //跟 比 你 强 大 的 东 西 保 持 距 离 - 并 且 避 开 任 何 类 似 于 龙 的 东 西 。
};

//******************************************************************
//			Gorn Freikaufen
//******************************************************************
instance DIA_DiegoOw_Gorn(C_INFO)
{
	npc				= PC_ThiefOW;
	nr				= 6;
	condition		= DIA_DiegoOw_Gorn_Condition;
	information		= DIA_DiegoOw_Gorn_Info;
	description		= "我 想 用 钱 换 取 戈 恩 的 自 由 … …";
};

func int DIA_DiegoOw_Gorn_Condition()
{
	if (MIS_RescueGorn == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Gorn_Info()
{
	AI_Output(other, self, "DIA_DiegoOw_Gorn_15_00"); //我 想 买 戈 恩 的 自 由 ， 但 加 隆 德 开 价1000个 金 币 。
	AI_Output(self, other, "DIA_DiegoOw_Gorn_11_01"); //相 当 大 的 一 笔 钱 。 我 手 头 上 有300个 金 币 ， 你 可 以 拿 走 它 们 。 剩 下 的 就 要 靠 你 了 。

	B_GiveInvItems(self, other, ItmI_Gold, 300);

	B_LogEntry(TOPIC_RescueGorn, TOPIC_RescueGorn_7);
};

//******************************************************************
//		Kannst du mir was beibringen?
//******************************************************************
var int Diego_MerkeDEX;
var int Diego_MerkeSTR;
// -----------------------------------------------------------------
instance DIA_DiegoOw_Teach(C_INFO)
{
	npc				= PC_ThiefOW;
	nr				= 100;
	condition		= DIA_DiegoOw_Teach_Condition;
	information		= DIA_DiegoOw_Teach_Info;
	permanent		= TRUE;
	description		= "你 能 教 我 什 么 吗 ？";
};

func int DIA_DiegoOw_Teach_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_Teach_info()
{
	AI_Output(other, self, "DIA_DiegoOw_Teach_15_00"); //你 能 教 我 什 么 吗 ？
	AI_Output(self, other, "DIA_Addon_DiegoOw_Teach_11_01"); //当 然 ， 你 想 知 道 些 什 么 ？

	Diego_MerkeDEX = other.attribute[ATR_DEXTERITY];
	Diego_MerkeSTR = other.attribute[ATR_STRENGTH];

	Info_ClearChoices(DIA_DiegoOw_TEACH);
	Info_AddChoice(DIA_DiegoOw_Teach, DIALOG_BACK, DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice(DIA_DiegoOw_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice(DIA_DiegoOw_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice(DIA_DiegoOw_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice(DIA_DiegoOw_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_DiegoOw_TEACHSTR_5);
};

func void DIA_DiegoOw_TEACH_BACK()
{
	if (other.attribute[ATR_DEXTERITY] > Diego_MerkeDEX)
	{
		AI_Output(self, other, "DIA_Addon_DiegoOw_Teach_11_02"); //你 已 经 增 加 了 一 点 敏 捷 。
	};

	if (other.attribute[ATR_STRENGTH] > Diego_MerkeSTR)
	{
		AI_Output(self, other, "DIA_Addon_DiegoOw_Teach_11_03"); //（ 打 量 ） 很 好 。 你 的 力 量 增 加 了 。
	};

	Info_ClearChoices(DIA_DiegoOw_TEACH);
};

func void DIA_DiegoOw_TEACHDEX_1()
{
	B_TeachAttributePoints(self, other, ATR_DEXTERITY, 1, T_MAX);

	Info_ClearChoices(DIA_DiegoOw_TEACH);
	Info_AddChoice(DIA_DiegoOw_TEACH, DIALOG_BACK, DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_DiegoOw_TEACHSTR_5);
};

func void DIA_DiegoOw_TEACHDEX_5()
{
	B_TeachAttributePoints(self, other, ATR_DEXTERITY, 5, T_MAX);

	Info_ClearChoices(DIA_DiegoOw_TEACH);
	Info_AddChoice(DIA_DiegoOw_TEACH, DIALOG_BACK, DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_DiegoOw_TEACHSTR_5);
};

func void DIA_DiegoOw_TEACHSTR_1()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 1, T_MED);

	Info_ClearChoices(DIA_DiegoOw_TEACH);
	Info_AddChoice(DIA_DiegoOw_TEACH, DIALOG_BACK, DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_DiegoOw_TEACHSTR_5);
};

func void DIA_DiegoOw_TEACHSTR_5()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 5, T_MED);

	Info_ClearChoices(DIA_DiegoOw_TEACH);
	Info_AddChoice(DIA_DiegoOw_TEACH, DIALOG_BACK, DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice(DIA_DiegoOw_TEACH, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_DiegoOw_TEACHSTR_5);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_ThiefOW_PICKPOCKET(C_INFO)
{
	npc				= PC_ThiefOW;
	nr				= 900;
	condition		= DIA_ThiefOW_PICKPOCKET_Condition;
	information		= DIA_ThiefOW_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_120;
};

func int DIA_ThiefOW_PICKPOCKET_Condition()
{
	C_Beklauen(120, 600);
};

func void DIA_ThiefOW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_ThiefOW_PICKPOCKET);
	Info_AddChoice(DIA_ThiefOW_PICKPOCKET, DIALOG_BACK, DIA_ThiefOW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_ThiefOW_PICKPOCKET, DIALOG_PICKPOCKET, DIA_ThiefOW_PICKPOCKET_DoIt);
};

func void DIA_ThiefOW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_ThiefOW_PICKPOCKET);
};

func void DIA_ThiefOW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_ThiefOW_PICKPOCKET);
};

// ************************************************************
// *** ***
// 					Mit Diego Durch die Gegend
// *** ***
// ************************************************************
// ------------------------------------------------------------
// 					Lass uns zusammen gehen!
// ------------------------------------------------------------
instance DIA_Addon_ThiefOW_Together(C_INFO)
{
	npc				= PC_ThiefOW;
	nr				= 11;
	condition		= DIA_Addon_ThiefOW_Together_Condition;
	information		= DIA_Addon_ThiefOW_Together_Info;
	description		= "我 们 一 起 走 。";
};

func int DIA_Addon_ThiefOW_Together_Condition()
{
	return TRUE;
};

func void DIA_Addon_ThiefOW_Together_Info()
{
	AI_Output(other, self, "DIA_Addon_Diego_Together_15_00"); //我 们 一 起 走 。
	AI_Output(self, other, "DIA_Addon_Diego_Together_11_01"); //去 关 卡 ？ 为 什 么 不 呢 … …
	AI_Output(self, other, "DIA_Addon_Diego_Together_11_02"); //你 先 走 。 你 刚 刚 从 那 里 来 的 。
	AI_Output(self, other, "DIA_Addon_Diego_Together_11_03"); //不 过 ， 连 想 也 不 要 想 靠 城 堡 太 近 ， 还 有 兽 人 的 墙 。
	AI_Output(self, other, "DIA_Addon_Diego_Together_11_04"); //还 有 ， 我 们 必 须 避 开 所 有 圣 骑 士 的 驻 防 营 地 。
	AI_Output(self, other, "DIA_Addon_Diego_Together_11_05"); //我 刚 从 一 个 这 样 的 地 方 逃 出 来 的 ， 我 可 不 想 回 到 矿 井 里 去 做 苦 工 。
	AI_Output(self, other, "DIA_Addon_Diego_Together_11_06"); //不 用 说 ， 我 们 绝 对 不 要 靠 近 任 何 一 条 龙 。
	AI_Output(self, other, "DIA_Addon_Diego_Together_11_07"); //你 准 备 好 了 就 告 诉 我 一 声 。
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_ThiefOW_ComeOn(C_INFO)
{
	npc				= PC_ThiefOW;
	nr				= 12;
	condition		= DIA_Addon_ThiefOW_ComeOn_Condition;
	information		= DIA_Addon_ThiefOW_ComeOn_Info;
	permanent		= TRUE;
	description		= "跟 我 来 。";
};

func int DIA_Addon_ThiefOW_ComeOn_Condition()
{
	if ((self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Addon_ThiefOW_Together))
	&& (Diego_angekommen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_ComeOn_Info()
{
	AI_Output(other, self, "DIA_Addon_Diego_ComeOn_15_00"); //跟 我 来 。

	if (C_DiegoTooFar(0))
	{
		AI_Output(self, other, "DIA_Addon_Diego_ComeOn_11_01"); //方 向 错 了 ！

		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Diego_ComeOn_11_02"); //好 吧 。

		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self, "FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
instance DIA_Addon_ThiefOW_GoHome(C_INFO)
{
	npc				= PC_ThiefOW;
	nr				= 13;
	condition		= DIA_Addon_ThiefOW_GoHome_Condition;
	information		= DIA_Addon_ThiefOW_GoHome_Info;
	permanent		= TRUE;
	description		= "在 这 里 等 。";
};

func int DIA_Addon_ThiefOW_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_GoHome_Info()
{
	AI_Output(other, self, "DIA_Addon_Diego_WarteHier_15_00"); //在 这 里 等 ！

	if (Npc_GetDistToWP(self, "LOCATION_02_05") < 2000)
	{
		AI_Output(self, other, "DIA_Addon_Diego_GoHome_11_01"); //好 吧 。
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self, "START");
	}
	else if (Npc_GetDistToWP(self, "DT_E1_04") < (1500 + 1000)) // XARDAS
	{
		AI_Output(self, other, "DIA_Addon_Diego_GoHome_11_02"); //我 会 在 外 面 的 塔 边 等 着。
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self, "XARDAS");
	}
	else if (Npc_GetDistToWP(self, "OW_NEWMINE_11") < (4000 + 1000)) // FAJETHMINE
	{
		AI_Output(self, other, "DIA_Addon_Diego_GoHome_11_03"); //我 会 在 矿 井 附 近 等 着 。
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self, "FAJETH");
	}
	else if (Npc_GetDistToWP(self, "OW_MINE3_OUT") < (1200 + 1000)) // SILVESTROMINE
	{
		AI_Output(self, other, "DIA_Addon_Diego_GoHome_11_04"); //我 会 在 矿 井 附 近 等 着 。
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self, "SILVESTRO");
	}
	else if (Npc_GetDistToWP(self, "OW_PATH_266") < (3000 + 1000)) // GRIMESMINE
	{
		AI_Output(self, other, "DIA_Addon_Diego_GoHome_11_05"); //我 会 在 附 近 等 着 。
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self, "GRIMES");
	}
	else if (Npc_GetDistToWP(self, "LOCATION_02_05") < 15000) // Orcbarrier FIRE ANGAR LAKE
	{
		AI_Output(self, other, "DIA_Addon_Diego_GoHome_11_06"); //不 。 我 回 洞 穴 去 。
		AI_Output(self, other, "DIA_Addon_Diego_GoHome_11_07"); //你 完 事 了 就 来 这 里 找 我 。
		AI_Output(self, other, "DIA_Addon_Diego_GoHome_11_08"); //但 是 ， 别 等 太 久 了 ， 否 则 我 就 会 自 己 回 去 。
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self, "START");
	}
	else // zu weit weg
	{
		AI_Output(self, other, "DIA_Addon_Diego_GoHome_11_09"); //你 是 在 开 玩 笑 吧 。 我 们 要 分 开 吗 ？ 在 这 里 ？
		AI_Output(self, other, "DIA_Addon_Diego_GoHome_11_10"); //除 非 我 死 了 ！
		AI_Output(self, other, "DIA_Addon_Diego_GoHome_11_11"); //我 们 现 在 去 关 卡 - 一 起 走 。
	};
};

// ------------------------------------------------------------
// 			 			Zu weit gegangen
// ------------------------------------------------------------
func void B_Addon_Diego_WillWaitOutside()
{
	AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_00"); //往 前 走 ， 到 处 看 看 - 我 会 在 外 面 等 着 。
};

// ------------------------------------------------------------
func void B_Addon_Diego_PassOtherDirection()
{
	AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_01"); //要 去 关 卡 ， 我 们 就 必 须 往 另 外 一 个 方 向 走 。
};

// ------------------------------------------------------------
var int Diego_TooFarComment;
var int Diego_BurgVariation;
var int Diego_FajethVariation;
var int Diego_SilvestroVariation;
var int Diego_GrimesVariation;
var int Diego_XardasVariation;
var int Diego_IceVariation;
// ------------------------------------------------------------
instance DIA_Addon_ThiefOW_TooFar(C_INFO)
{
	npc				= PC_ThiefOW;
	nr				= 14;
	condition		= DIA_Addon_ThiefOW_TooFar_Condition;
	information		= DIA_Addon_ThiefOW_TooFar_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_ThiefOW_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if (C_DiegoTooFar(0))
		{
			if (Diego_TooFarComment == FALSE)
			{
				return TRUE;
			};
		}
		else
		{
			Diego_TooFarComment = FALSE;
		};
	};
};

func void DIA_Addon_ThiefOW_TooFar_Info()
{
	if (C_DiegoTooFar(1000) == LOC_ANGAR)
	{
		AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_02"); //这 个 古 老 的 墓 地 有 点 怪 异 。
		AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_03"); //我 们 围 着 它 随 便 走 走 吧 。
	}
	else if (C_DiegoTooFar(1000) == LOC_ICE)
	{
		if (Diego_IceVariation == 0)
		{
			AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_04"); //这 是 通 往 从 前 的 新 营 地 的 入 口 。
			AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_05"); //我 敢 肯 定 有 一 条 龙 把 那 里 当 成 了 自 己 的 家 。
			B_Addon_Diego_PassOtherDirection();
			Diego_IceVariation = 1;
		}
		else // 1
		{
			B_Addon_Diego_PassOtherDirection();
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_SWAMP)
	{
		AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_06"); //这 个 沼 泽 是 个 死 胡 同 。
		AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_07"); //就 算 有 一 条 龙 潜 藏 在 里 面 等 着 我 们 ， 我 也 一 点 都 不 奇 怪 。
		AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_08"); //我 们 不 要 进 那 里 面 去 。
	}
	else if (C_DiegoTooFar(1000) == LOC_FIRE)
	{
		AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_09"); //如 果 我 们 继 续 往 山 上 走 ， 肯 定 会 碰 到 一 条 龙 。
		AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_10"); //我 还 想 活 着 回 到 克 霍 里 尼 斯 呢 。
		AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_11"); //我 们 走 另 一 条 路 吧 。
	}
	else if (C_DiegoTooFar(1000) == LOC_LAKE)
	{
		AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_12"); //这 个 湖 不 会 通 往 任 何 地 方 。
		AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_13"); //要 去 关 卡 ， 我 们 就 必 须 往 另 外 一 个 方 向 走 ！
	}
	else if (C_DiegoTooFar(1000) == LOC_XARDAS)
	{
		if (Diego_XardasVariation == 0)
		{
			AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_14"); //这 是 艾 克 萨 达 斯 以 前 的 塔 。 当 然 ， 他 已 经 离 开 很 久 了 。
			AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_15"); //我 敢 肯 定 那 里 面 一 定 有 一 些 惊 险 。
			B_Addon_Diego_WillWaitOutside();
			Diego_XardasVariation = 1;
		}
		else // 1
		{
			B_Addon_Diego_WillWaitOutside();
			AI_StopProcessInfos(self);
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			Npc_ExchangeRoutine(self, "XARDAS");
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_FAJETHMINE)
	{
		if (Diego_FajethVariation == 0)
		{
			AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_16"); //那 后 面 是 法 捷 斯 的 矿 井 。
			AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_17"); //如 果 你 想 去 那 里 的 话 ， 不 要 把 我 算 在 里 面 ！
			Diego_FajethVariation = 1;
		}
		else // 1
		{
			AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_18"); //我 会 离 那 个 矿 井 远 远 的 ！
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_SILVESTROMINE)
	{
		if (Diego_SilvestroVariation == 0)
		{
			AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_19"); //就 是 那 个 矿 井 ， 我 跟 着 囚 犯 护 卫 队 回 来 时 ， 在 那 里 被 他 们 抓 住 了 。
			AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_20"); //我 敢 肯 定 那 里 面 已 经 没 有 一 个 活 人 了 。
			B_Addon_Diego_WillWaitOutside();
			AI_Output(self, other, "DIA_Addon_Diego_TooFar_Add_11_20"); //不 过 ， 如 果 你 呆 得 太 久 ， 我 就 会 直 接 回 营 地 去 。
			AI_Output(self, other, "DIA_Addon_Diego_TooFar_Add_11_21"); //除 非 你 希 望 我 在 这 里 等 着 你 。
			Diego_SilvestroVariation = 1;
		}
		else // 1
		{
			B_Addon_Diego_WillWaitOutside();
			AI_StopProcessInfos(self);
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			Npc_ExchangeRoutine(self, "SILVESTRO");
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_GRIMESMINE)
	{
		if (Diego_GrimesVariation == 0)
		{
			AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_21"); //这 是 圣 骑 士 的 一 个 新 矿 井 。
			AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_22"); //我 还 没 有 去 过 那 里 - 而 且 ， 我 也 不 打 算 去 那 里 。
			Diego_GrimesVariation = 1;
		}
		else // 1
		{
			AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_23"); //我 们 还 是 离 那 个 矿 井 远 远 的 吧 。
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_BURG)
	{
		if (Diego_BurgVariation == 0)
		{
			AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_24"); //要 找 死 ， 是 吗 ？ 离 那 座 城 堡 远 一 点 !
			Diego_BurgVariation = 1;
		}
		else if (Diego_BurgVariation == 1)
		{
			AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_25"); //嘿 ， 你 究 竟 在 听 我 说 吗 ？ ！ 别 靠 近 那 座 城 堡 ！
			Diego_BurgVariation = 2;
		}
		else // 2
		{
			AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_26"); //‘ 别 靠 近 那 座 城 堡 。 ’ 哪 个 字 讲 的 不 清 楚 ？
			Diego_BurgVariation = 1;
		};
	}
	else if (C_DiegoTooFar(1000) == LOC_ORCBARRIER)
	{
		AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_27"); //我 们 不 能 再 继 续 了 。 兽 人 的 栅 栏 太 危 险 了 。
		AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_28"); //我 想 这 样 会 更 好 ： 我 们 接 着 往 西 走 ， 然 后 绕 到 另 一 边 去 。
	}
	else if (C_DiegoTooFar(1000) == LOC_ORCBARRIER_FAR)
	{
		AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_29"); //如 果 我 们 继 续 向 这 个 方 向 走 ， 我 们 只 会 又 被 兽 人 的 栅 栏 挡 住 。
		AI_Output(self, other, "DIA_Addon_Diego_TooFar_11_30"); //我 们 去 关 卡 吧 ！
	};

	Diego_TooFarComment = TRUE;
};

// ------------------------------------------------------------
// 						Angekommen
// ------------------------------------------------------------
func void B_Diego_WirSindDa()
{
	AI_Output(self, other, "DIA_Addon_Diego_Angekommen_11_02"); //我 会 自 己 走 完 剩 下 的 路 。
	AI_Output(self, other, "DIA_Addon_Diego_Angekommen_11_03"); //我 要 办 完 几 件 事 情 后 ， 才 能 回 克 霍 里 尼 斯 。
	AI_Output(self, other, "DIA_Addon_Diego_Angekommen_11_04"); //谢 谢 你 ， 我 的 朋 友 。 我 们 在 城 里 见 。

	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self, "PASS");

	Diego_angekommen = TRUE;
};

// ------------------------------------------------------------
instance DIA_Addon_ThiefOW_Angekommen(C_INFO)
{
	npc				= PC_ThiefOW;
	nr				= 1;
	condition		= DIA_Addon_ThiefOW_Angekommen_Condition;
	information		= DIA_Addon_ThiefOW_Angekommen_Info;
	important		= TRUE;
};

func int DIA_Addon_ThiefOW_Angekommen_Condition()
{
	if (Npc_GetDistToWP(self, "OW_VM_ENTRANCE") < 800)
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_Angekommen_Info()
{
	AI_Output(self, other, "DIA_Addon_Diego_Angekommen_11_01"); //好 ， 我 们 到 了 。
	B_GivePlayerXP(500);
	B_Diego_WirSindDa();
};

// ------------------------------------------------------------
// 							Nostalgie
// ------------------------------------------------------------
instance DIA_Addon_ThiefOW_Nostalgie(C_INFO)
{
	npc				= PC_ThiefOW;
	nr				= 1;
	condition		= DIA_Addon_ThiefOW_Nostalgie_Condition;
	information		= DIA_Addon_ThiefOW_Nostalgie_Info;
	important		= TRUE;
};

func int DIA_Addon_ThiefOW_Nostalgie_Condition()
{
	if (Npc_GetDistToWP(self, "WP_INTRO14") < 2000)
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_Nostalgie_Info()
{
	AI_Output(self, other, "DIA_Addon_Diego_Nostalgie_11_01"); //记 的 吗 ， 那 个 时 候 ？
	AI_Output(self, other, "DIA_Addon_Diego_Nostalgie_11_02"); //我 们 第 一 次 在 这 里 见 面 ？
	AI_Output(self, other, "DIA_Addon_Diego_Nostalgie_11_03"); //好 久 了 … …
	AI_Output(self, other, "DIA_Addon_Diego_Nostalgie_11_04"); //这 里 还 发 生 了 一 些 其 它 的 事 情 - 嗯 - 该 死 ！ 我 就 是 记 不 起 来 了 。
	AI_Output(self, other, "DIA_Addon_Diego_Nostalgie_11_05"); //无 论 怎 样 … …
	B_GivePlayerXP(500);
	hero.exp = hero.exp + 500;
	PrintScreen(ConcatStrings(NAME_Addon_NostalgieBonus, IntToString(500)), -1, 60, FONT_Screen, 2);

	B_Diego_WirSindDa();
};

// ------------------------------------------------------------
// 							PERM
// ------------------------------------------------------------
instance DIA_Addon_ThiefOW_PERM(C_INFO)
{
	npc				= PC_ThiefOW;
	nr				= 10;
	condition		= DIA_Addon_ThiefOW_PERM_Condition;
	information		= DIA_Addon_ThiefOW_PERM_Info;
	permanent		= TRUE;
	description		= "一 切 都 好 吗 ？";
};

func int DIA_Addon_ThiefOW_PERM_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_DiegoOw_Perm))
	&& (Npc_KnowsInfo(other, DIA_Addon_ThiefOW_Together)))
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_PERM_Info()
{
	AI_Output(other, self, "DIA_Addon_Diego_PERM_15_00"); //你 还 好 吗 ？
	if (self.attribute[ATR_HITPOINTS] <= (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_Output(self, other, "DIA_Addon_Diego_PERM_11_01"); //我 需 要 一 个 治 疗 药 剂 。 你 不 会 正 好 有 一 个 可 以 给 我 吧 ？
	}
	else if ((DiegoOW.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (Diego_angekommen == FALSE))
	{
		AI_Output(self, other, "DIA_Addon_Diego_PERM_11_02"); //如 果 你 想 开 始 就 跟 我 说 一 声 。
	}
	else if (Diego_angekommen == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_Diego_PERM_11_03"); //好 的 。 我 只 是 稍 微 休 息 一 下 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Diego_PERM_11_04"); //好 的 。
	};
};
