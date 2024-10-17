// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Marcos_EXIT(C_INFO)
{
	npc				= PAL_217_Marcos;
	nr				= 999;
	condition		= DIA_Marcos_EXIT_Condition;
	information		= DIA_Marcos_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Marcos_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Marcos_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  Hallo
// ************************************************************
instance DIA_Marcos_Hallo(C_INFO)
{
	npc				= PAL_217_Marcos;
	nr				= 2;
	condition		= DIA_Marcos_Hallo_Condition;
	information		= DIA_Marcos_Hallo_Info;
	important		= TRUE;
};

func int DIA_Marcos_Hallo_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Marcos_Hallo_Info()
{
	AI_Output(self, other, "DIA_Marcos_Hallo_04_00"); //站 住 - 以 英 诺 斯 的 名 义 ！ 我 是 马 科 斯 ， 国 王 的 圣 骑 士 。 说 说 你 想 要 干 什 么 ， 讲 真 话 ！

	if (other.guild == GIL_KDF)
	{
		AI_Output(other, self, "DIA_Marcos_Hallo_15_01"); //英 诺 斯 的 特 选 子 民 说 的 都 是 真 话 。
		AI_Output(self, other, "DIA_Marcos_Hallo_04_02"); //原 谅 我 ， 尊 敬 的 魔 法 师 。 我 没 有 意 识 到 是 在 跟 谁 说 话 。
		AI_Output(other, self, "DIA_Marcos_Hallo_15_03"); //是 的 ， 好 吧 ， 没 关 系 。
		AI_Output(self, other, "DIA_Marcos_Hallo_04_04"); //是 否 允 许 我 问 一 下 - 你 为 什 么 会 来 这 个 地 方 ？
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output(other, self, "DIA_Marcos_Hallo_15_05"); //放 松 点 - 我 在 哈 根 勋 爵 手 下 服 役 。
		AI_Output(self, other, "DIA_Marcos_Hallo_04_06"); //你 是 部 队 成 员 。 你 到 这 里 执 行 什 么 命 令 ？
	}
	else // SLD
	{
		AI_Output(other, self, "DIA_Marcos_Hallo_15_07"); //放 松 点 ， 我 们 为 相 同 的 上 司 工 作 - 哈 根 勋 爵 。
		AI_Output(self, other, "DIA_Marcos_Hallo_04_08"); //哈 根 勋 爵 从 什 么 时 候 开 始 聘 请 雇 佣 兵 了 ？ 说 吧 - 你 想 在 这 里 干 什 么 ？
	};
};

// ************************************************************
// 			  Hagen
// ************************************************************
instance DIA_Marcos_Hagen(C_INFO)
{
	npc				= PAL_217_Marcos;
	nr				= 2;
	condition		= DIA_Marcos_Hagen_Condition;
	information		= DIA_Marcos_Hagen_Info;
	description		= "我 要 把 龙 存 在 的 证 据 带 给 哈 根 勋 爵 。";
};

func int DIA_Marcos_Hagen_Condition()
{
	if ((Kapitel == 2)
	&& (Garond.aivar [AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Marcos_Hagen_Info()
{
	AI_Output(other, self, "DIA_Marcos_Hagen_15_00"); //我 要 把 龙 存 在 的 证 据 带 给 哈 根 勋 爵 。
	AI_Output(self, other, "DIA_Marcos_Hagen_04_01"); //那 么 你 不 该 浪 费 任 何 时 间 ， 也 不 该 毫 无 必 要 地 搭 上 你 的 命 。
	AI_Output(self, other, "DIA_Marcos_Hagen_04_02"); //你 觉 得 能 在 这 里 找 到 一 个 龙 鳞 并 带 回 去 给 他 吗 ？
	AI_Output(self, other, "DIA_Marcos_Hagen_04_03"); //去 城 堡 找 指 挥 官 加 隆 德 谈 谈 吧 。
	AI_Output(self, other, "DIA_Marcos_Hagen_04_04"); //他 一 定 知 道 你 正 在 执 行 哈 根 勋 爵 交 给 你 使 命 ！ 而 且 他 还 将 会 帮 你 处 理 你 的 工 作 。
};

// ************************************************************
// 			  Garond
// ************************************************************
instance DIA_Marcos_Garond(C_INFO)
{
	npc				= PAL_217_Marcos;
	nr				= 2;
	condition		= DIA_Marcos_Garond_Condition;
	information		= DIA_Marcos_Garond_Info;
	description		= "我 从 加 隆 德 那 里 来 … …";
};

func int DIA_Marcos_Garond_Condition()
{
	if ((Kapitel == 2)
	&& (MIS_OLDWORLD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Marcos_Garond_Info()
{
	AI_Output(other, self, "DIA_Marcos_Garond_15_00"); //我 从 加 隆 德 那 里 来 - 他 想 知 道 有 多 少 矿 石 已 经 准 备 起 运 了 。
	AI_Output(self, other, "DIA_Marcos_Garond_04_01"); //告 诉 加 隆 德 ， 我 不 得 不 离 开 那 个 矿 场 ， 因 为 兽 人 的 袭 击 越 来 越 猛 烈 了 。
	AI_Output(self, other, "DIA_Marcos_Garond_04_02"); //我 想 尽 力 跟 几 个 人 一 起 到 达 城 堡 ， 但 我 却 是 唯 一 的 幸 存 者 。
	AI_Output(self, other, "DIA_Marcos_Garond_04_03"); //我 已 经 把 矿 石 安 全 地 存 放 好 了 。 有 四 箱 。 去 向 加 隆 德 报 告 这 件 事 吧 。
	AI_Output(self, other, "DIA_Marcos_Garond_04_04"); //告 诉 他 ， 我 会 用 我 的 生 命 来 保 卫 这 些 矿 石 。 不 过 我 不 知 道 兽 人 什 么 时 候 就 会 找 到 我 。
	AI_Output(self, other, "DIA_Marcos_Garond_04_05"); //要 他 给 我 派 来 一 些 支 持 。
	AI_Output(other, self, "DIA_Marcos_Garond_15_06"); //我 会 告 诉 他 的 。

	B_LogEntry(TOPIC_ScoutMine, TOPIC_ScoutMine_6);

	Log_CreateTopic(Topic_MarcosJungs, LOG_MISSION);
	Log_SetTopicStatus(Topic_MarcosJungs, LOG_RUNNING);
	B_LogEntry(Topic_MarcosJungs, Topic_MarcosJungs_1);

	MIS_Marcos_Jungs = LOG_RUNNING;
	Marcos_Ore = TRUE;
	self.flags = 0;
};

// ************************************************************
// 			Perm
// ************************************************************
instance DIA_Marcos_Perm(C_INFO)
{
	npc				= PAL_217_Marcos;
	nr				= 9;
	condition		= DIA_Marcos_Perm_Condition;
	information		= DIA_Marcos_Perm_Info;
	permanent		= TRUE;
	description		= "最 近 怎 么 样 ？";
};

func int DIA_Marcos_Perm_Condition()
{
	if ((Kapitel >= 2)
	&& (Npc_KnowsInfo(other, DIA_Marcos_Hagen)
	|| Npc_KnowsInfo(other, DIA_Marcos_Garond)))
	{
		return TRUE;
	};
};

func void DIA_Marcos_Perm_Info()
{
	AI_Output(other, self, "DIA_Marcos_Perm_15_00"); //状 况 怎 么 样 ？

	if ((self.attribute [ATR_HITPOINTS]) < (self.attribute [ATR_HITPOINTS_MAX] / 2))
	{
		AI_Output(self, other, "DIA_Marcos_Perm_04_01"); //我 需 要 一 剂 强 效 治 疗 药 剂 ！
		B_UseItem(self, ItPo_Health_03);
	}
	else if (MIS_Marcos_Jungs == LOG_RUNNING)
	{
		AI_Output(self, other, "DIA_Marcos_Perm_04_02"); //我 会 继 续 坚 守 - 希 望 加 隆 德 很 快 就 会 派 来 支 持 。
	}
	else if (MIS_Marcos_Jungs == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Marcos_Perm_04_03"); //谢 谢 你 的 帮 助 。 英 诺 斯 将 赐 予 我 们 坚 定 不 移 的 力 量 。

		if (Marcos_einmalig == FALSE)
		{
			B_GivePlayerXP(XP_Marcos_Jungs);
			Marcos_einmalig = TRUE;
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Marcos_Perm_04_04"); //我 将 坚 定 不 移 ， 因 为 英 诺 斯 与 我 同 在 ！
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Marcos_PICKPOCKET(C_INFO)
{
	npc				= PAL_217_Marcos;
	nr				= 900;
	condition		= DIA_Marcos_PICKPOCKET_Condition;
	information		= DIA_Marcos_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Marcos_PICKPOCKET_Condition()
{
	C_Beklauen(65, 380);
};

func void DIA_Marcos_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Marcos_PICKPOCKET);
	Info_AddChoice(DIA_Marcos_PICKPOCKET, DIALOG_BACK, DIA_Marcos_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Marcos_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Marcos_PICKPOCKET_DoIt);
};

func void DIA_Marcos_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Marcos_PICKPOCKET);
};

func void DIA_Marcos_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Marcos_PICKPOCKET);
};
