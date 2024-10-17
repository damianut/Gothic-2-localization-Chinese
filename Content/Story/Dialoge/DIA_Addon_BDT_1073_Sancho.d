///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Sancho_EXIT(C_INFO)
{
	npc				= BDT_1073_Addon_Sancho;
	nr				= 999;
	condition		= DIA_Addon_Sancho_EXIT_Condition;
	information		= DIA_Addon_Sancho_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Sancho_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Sancho_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Sancho_PICKPOCKET(C_INFO)
{
	npc				= BDT_1073_Addon_Sancho;
	nr				= 900;
	condition		= DIA_Addon_Sancho_PICKPOCKET_Condition;
	information		= DIA_Addon_Sancho_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Addon_Sancho_PICKPOCKET_Condition()
{
	C_Beklauen(50, 40);
};

func void DIA_Addon_Sancho_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Sancho_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Sancho_PICKPOCKET, DIALOG_BACK, DIA_Addon_Sancho_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Sancho_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Sancho_PICKPOCKET_DoIt);
};

func void DIA_Addon_Sancho_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Sancho_PICKPOCKET);
};

func void DIA_Addon_Sancho_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Sancho_PICKPOCKET);
};

// ---------------------------------------------------------------------
//	Info HI
// ---------------------------------------------------------------------
instance DIA_Addon_Sancho_HI(C_INFO)
{
	npc				= BDT_1073_Addon_Sancho;
	nr				= 2;
	condition		= DIA_Addon_Sancho_HI_Condition;
	information		= DIA_Addon_Sancho_HI_Info;
	important		= TRUE;
};

func int DIA_Addon_Sancho_HI_Condition()
{
	return TRUE;
};

func void DIA_Addon_Sancho_HI_Info()
{
	AI_Output(self, other, "DIA_Addon_Sancho_HI_06_00"); //靠 ， 又 一 个 新 来 的 小 子 。 （ 大 笑 ） 也 是 为 了 金 子 来 的 ， 是 吗 ？
	AI_Output(other, self, "DIA_Addon_Sancho_HI_15_01"); //金 子？
	AI_Output(self, other, "DIA_Addon_Sancho_HI_06_02"); //（ 笑 ） 不 要 再 逗 我 了 ！
	AI_Output(self, other, "DIA_Addon_Sancho_HI_06_03"); //所 有 到 这 里 来 的 小 子 都 想 进 入 矿 井 。
	AI_Output(self, other, "DIA_Addon_Sancho_HI_06_04"); //但 是 不 要 认 为 那 有 多 么 简 单 ！

	if (SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry(TOPIC_Addon_RavenKDW, LogText_Addon_RavensGoldmine);
		Log_AddEntry(TOPIC_Addon_Sklaven, LogText_Addon_RavensGoldmine);
		Log_AddEntry(TOPIC_Addon_ScoutBandits, Log_Text_Addon_ScoutBandits);
	};

	SC_KnowsRavensGoldmine = TRUE;
};

// ---------------------------------------------------------------------
//	Lager
// ---------------------------------------------------------------------
instance DIA_Addon_Sancho_Lager(C_INFO)
{
	npc				= BDT_1073_Addon_Sancho;
	nr				= 2;
	condition		= DIA_Addon_Sancho_Lager_Condition;
	information		= DIA_Addon_Sancho_Lager_Info;
	description		= "我 怎 么 去 营 地 ？";
};

func int DIA_Addon_Sancho_Lager_Condition()
{
	return TRUE;
};

func void DIA_Addon_Sancho_Lager_Info()
{
	AI_Output(other, self, "DIA_Addon_Sancho_Lager_15_00"); //我 怎 么 去 营 地 ？
	AI_Output(self, other, "DIA_Addon_Sancho_Lager_06_01"); //只 要 沿 着 木 板 路 走 ！
	if (!Npc_IsDead(Franco))
	{
		AI_Output(self, other, "DIA_Addon_Sancho_Lager_06_02"); //但 是 如 果 你 想 要 进 入 矿 井 ， 你 就 必 须 要 通 过 佛 朗 哥 那 一 关 。
		AI_Output(self, other, "DIA_Addon_Sancho_Lager_06_03"); //他 希 望 所 有 新 来 的 小 子 都 能 首 先 在 这 里 卖 力 工 作 一 阵 ！
	};

	Log_CreateTopic(Topic_Addon_Franco, LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Franco, LOG_RUNNING);
	B_LogEntry(Topic_Addon_Franco, Topic_Addon_Franco_1);
};

// ---------------------------------------------------------------------
//	Mine
// ---------------------------------------------------------------------
instance DIA_Addon_Sancho_Mine(C_INFO)
{
	npc				= BDT_1073_Addon_Sancho;
	nr				= 3;
	condition		= DIA_Addon_Sancho_Mine_Condition;
	information		= DIA_Addon_Sancho_Mine_Info;
	description		= "多 告 诉 我 一 些 矿 井 的 事 … …";
};

func int DIA_Addon_Sancho_Mine_Condition()
{
	if (!Npc_IsDead(Franco))
	{
		return TRUE;
	};
};

func void DIA_Addon_Sancho_Mine_Info()
{
	AI_Output(other, self, "DIA_Addon_Sancho_Mine_15_00"); //多 告 诉 我 一 些 矿 井 的 事 … …
	AI_Output(self, other, "DIA_Addon_Sancho_Mine_06_01"); //我 给 你 几 个 好 建 议 ： 如 果 你 想 要 进 那 里 的 话 ， 就 得 和 佛 朗 哥 多 套 套 近 乎 。 他 是 这 里 的 头 。
	AI_Output(self, other, "DIA_Addon_Sancho_Mine_06_02"); //他 决 定 下 一 个 进 去 的 人 是 谁 。
	AI_Output(self, other, "DIA_Addon_Sancho_Mine_06_03"); //只 有 你 不 在 这 里 游 手 好 闲 ， 他 才 会 让 你 进 去 。
	AI_Output(self, other, "DIA_Addon_Sancho_Mine_06_04"); //所 以 去 他 那 里 ， 让 他 给 你 一 份 工 作 ！

	B_LogEntry(Topic_Addon_Franco, Topic_Addon_Franco_2);
};

// ---------------------------------------------------------------------
// Wo Franco
// ---------------------------------------------------------------------
instance DIA_Addon_Sancho_Franco(C_INFO)
{
	npc				= BDT_1073_Addon_Sancho;
	nr				= 4;
	condition		= DIA_Addon_Sancho_Franco_Condition;
	information		= DIA_Addon_Sancho_Franco_Info;
	description		= "我 在 哪 里 能 找 到 佛 朗 哥 ？";
};

func int DIA_Addon_Sancho_Franco_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Sancho_Mine))
	&& (!Npc_IsDead(Franco)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Sancho_Franco_Info()
{
	AI_Output(other, self, "DIA_Addon_Sancho_Franco_15_00"); //我 在 哪 里 能 找 到 佛 朗 哥 ？
	AI_Output(self, other, "DIA_Addon_Sancho_Franco_06_01"); //他 通 常 呆 在 营 地 前 面 的 空 地 上 。
	AI_Output(self, other, "DIA_Addon_Sancho_Franco_06_02"); //和 他 关 系 搞 好 ， 不 然 你 就 只 能 向 我 这 样 做 些 蹩 脚 的 工 作 了 ！

	B_LogEntry(Topic_Addon_Franco, Topic_Addon_Franco_3);
};

// ---------------------------------------------------------------------
//	Spitzel
// ---------------------------------------------------------------------
instance DIA_Addon_Sancho_Spitzel(C_INFO)
{
	npc				= BDT_1073_Addon_Sancho;
	nr				= 5;
	condition		= DIA_Addon_Sancho_Spitzel_Condition;
	information		= DIA_Addon_Sancho_Spitzel_Info;
	description		= "你 必 须 整 天 在 这 里 闲 逛 吗 ？";
};

func int DIA_Addon_Sancho_Spitzel_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Sancho_Franco))
	|| (Npc_IsDead(Franco)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Sancho_Spitzel_Info()
{
	AI_Output(other, self, "DIA_Addon_Sancho_Spitzel_15_00"); //你 必 须 整 天 在 这 里 闲 逛 吗 ？
	AI_Output(self, other, "DIA_Addon_Sancho_Spitzel_06_01"); //我 要 检 查 所 有 新 来 的 人 员 ， 确 保 他 们 之 中 没 有 间 谍 。
	AI_Output(self, other, "DIA_Addon_Sancho_Spitzel_06_02"); //不 过 你 不 用 考 虑 这 些 吧 。 我 是 说 ， 我 们 这 里 是 世 界 的 尽 头 - 在 沼 泽 的 中 央 。
	AI_Output(self, other, "DIA_Addon_Sancho_Spitzel_06_03"); //没 有 人 能 找 到 我 们 ， 没 人 愿 意 找 到 我 们 - 为 什 么 会 有 人 想 要 费 那 么 大 劲 往 我 们 这 里 派 间 谍 呢 ？
};

// ---------------------------------------------------------------------
//	Info Perm
// ---------------------------------------------------------------------
instance DIA_Addon_Sancho_Perm(C_INFO)
{
	npc				= BDT_1073_Addon_Sancho;
	nr				= 99;
	condition		= DIA_Addon_Sancho_Perm_Condition;
	information		= DIA_Addon_Sancho_Perm_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 消 息 ？";
};

func int DIA_Addon_Sancho_Perm_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Sancho_Spitzel))
	{
		return TRUE;
	};
};

var int Comment_Franco;
var int Comment_Esteban;
func void DIA_Addon_Sancho_Perm_Info()
{
	AI_Output(other, self, "DIA_Addon_Sancho_Perm_15_00"); //有 什 么 新 消 息 ？

	if (Npc_IsDead(Franco)
	&& (Comment_Franco == FALSE))
	{
		AI_Output(self, other, "DIA_Addon_Sancho_Perm_06_01"); //我 听 说 你 杀 了 佛 朗 哥 。 干 得 不 错 … …

		if (!Npc_IsDead(Carlos))
		{
			AI_Output(self, other, "DIA_Addon_Sancho_Perm_06_02"); //… … 不 过 现 在 我 们 不 能 让 那 个 卡 洛 斯 给 我 们 惹 麻 烦 。 他 不 允 许 任 何 人 胡 来 … …
		}
		else
		{
			AI_Output(self, other, "DIA_Addon_Sancho_Perm_06_03"); //你 也 解 决 了 卡 洛 斯 ？ 朋 友 ， 你 是 一 名 真 正 险 恶 的 杀 手 ， 不 是 吗 ？ 马 上 走 开 。
		};

		Comment_Franco = TRUE;
	}
	else if (Npc_IsDead(Esteban)
	&& (Comment_Esteban == FALSE))
	{
		AI_Output(self, other, "DIA_Addon_Sancho_Perm_06_04"); //我 听 说 你 杀 了 伊 斯 特 班 。 嘿 ， 老 兄 ， 你 在 计 划 什 么 东 西 ， 不 是 吗 ？

		Comment_Esteban = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Sancho_Perm_06_05"); //不 ， 现 在 没 有 什 么 新 鲜 事 。
	};
};
