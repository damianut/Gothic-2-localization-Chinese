///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Jergan_EXIT(C_INFO)
{
	npc				= VLK_4110_Jergan;
	nr				= 999;
	condition		= DIA_Jergan_EXIT_Condition;
	information		= DIA_Jergan_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Jergan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jergan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Jergan_Hallo(C_INFO)
{
	npc				= VLK_4110_Jergan;
	nr				= 2;
	condition		= DIA_Jergan_Hallo_Condition;
	information		= DIA_Jergan_Hallo_Info;
	description		= "你 站 在 这 里 做 什 么 ？";
};

func int DIA_Jergan_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Jergan_Hallo_Info()
{
	AI_Output(other, self, "DIA_Jergan_Hallo_15_00"); //你 站 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Jergan_Hallo_13_01"); //我 从 城 堡 来 。 他 们 派 我 去 找 失 踪 的 人 ， 同 时 察 探 一 下 这 个 区 域 。
};

///////////////////////////////////////////////////////////////////////
//	Info Vermisste
///////////////////////////////////////////////////////////////////////
instance DIA_Jergan_Vermisste(C_INFO)
{
	npc				= VLK_4110_Jergan;
	nr				= 2;
	condition		= DIA_Jergan_Vermisste_Condition;
	information		= DIA_Jergan_Vermisste_Info;
	description		= "哪 些 失 踪 了 ？";
};

func int DIA_Jergan_Vermisste_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jergan_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Vermisste_Info()
{
	AI_Output(other, self, "DIA_Jergan_Vermisste_15_00"); //哪 些 失 踪 了 ？
	AI_Output(self, other, "DIA_Jergan_Vermisste_13_01"); //有 一 些 人 在 遭 到 龙 袭 击 的 时 候 逃 走 了 。 大 部 分 人 没 能 这 样 做 - 那 没 有 什 么 奇 怪 的 ！？
	AI_Output(self, other, "DIA_Jergan_Vermisste_13_02"); //不 过 ， 如 果 那 里 还 有 幸 存 者 的 话 ， 我 会 把 他 们 带 回 来 。
};

///////////////////////////////////////////////////////////////////////
//	Info Burg
///////////////////////////////////////////////////////////////////////
instance DIA_Jergan_Burg(C_INFO)
{
	npc				= VLK_4110_Jergan;
	nr				= 3;
	condition		= DIA_Jergan_Burg_Condition;
	information		= DIA_Jergan_Burg_Info;
	description		= "你 能 帮 我 进 入 城 堡 ？ ";
};

func int DIA_Jergan_Burg_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jergan_Hallo)
	&& (Npc_GetDistToWP(self, "OW_STAND_JERGAN") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Burg_Info()
{
	AI_Output(other, self, "DIA_Jergan_Burg_15_00"); //你 能 帮 我 进 入 城 堡 ？
	AI_Output(self, other, "DIA_Jergan_Burg_13_01"); //当 然 ，前 提 是 你 必 须 帮 我 一 个 忙 。
	AI_Output(self, other, "DIA_Jergan_Burg_13_02"); //如 果 你 能 到 达 城 堡 ， 就 去 跟 圣 骑 士 奥 里 克 谈 谈 。 告 诉 他 ， 他 的 兄 弟 在 关 卡 那 里 被 杀 了 。

	Log_CreateTopic(Topic_OricBruder, LOG_MISSION);
	Log_SetTopicStatus(Topic_OricBruder, LOG_RUNNING);
	B_LogEntry(Topic_OricBruder, Topic_OricBruder_1);
};

///////////////////////////////////////////////////////////////////////
//	Info Gegend
///////////////////////////////////////////////////////////////////////
instance DIA_Jergan_Gegend(C_INFO)
{
	npc				= VLK_4110_Jergan;
	nr				= 9;
	condition		= DIA_Jergan_Gegend_Condition;
	information		= DIA_Jergan_Gegend_Info;
	permanent		= TRUE;
	description		= "关 于 这 个 区 域 我 需 要 了 解 一 些 什 么 ？";
};

func int DIA_Jergan_Gegend_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jergan_Hallo))
	{
		return TRUE;
	};
};

var int Jergan_Tell;
func void DIA_Jergan_Gegend_Info()
{
	if (Jergan_Tell == FALSE)
	{
		AI_Output(other, self, "DIA_Jergan_Gegend_15_00"); //关 于 这 个 区 域 我 需 要 了 解 一 些 什 么 ？
		AI_Output(self, other, "DIA_Jergan_Gegend_13_01"); //如 果 你 想 活 命 的 话 ， 从 哪 里 来 的 就 回 哪 里 去 。
		AI_Output(self, other, "DIA_Jergan_Gegend_13_02"); //现 在 ， 那 些 绿 皮 怪 已 经 包 围 城 堡 几 个 星 期 了 - 加 之 那 些 龙 还 藏 在 某 个 地 方 。
	};

	AI_Output(self, other, "DIA_Jergan_Gegend_13_03"); //整 个 矿 藏 山 谷 到 处 都 是 兽 人 - 无 论 你 往 那 个 方 向 走 ， 那 都 不 是 好 玩 的 。
	Jergan_Tell = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Hilfe
///////////////////////////////////////////////////////////////////////
instance DIA_Jergan_Hilfe(C_INFO)
{
	npc				= VLK_4110_Jergan;
	nr				= 3;
	condition		= DIA_Jergan_Hilfe_Condition;
	information		= DIA_Jergan_Hilfe_Info;
	description		= "我 怎 么 才 能 进 入 城 堡 ？";
};

func int DIA_Jergan_Hilfe_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jergan_Burg)
	&& (Npc_GetDistToWP(self, "OW_STAND_JERGAN") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Hilfe_Info()
{
	AI_Output(other, self, "DIA_Jergan_Hilfe_15_00"); //我 怎 么 才 能 进 入 城 堡 ？
	AI_Output(self, other, "DIA_Jergan_Hilfe_13_01"); //首 先 ， 你 可 以 忽 略 直 接 的 路 。 不 过 ， 如 果 你 绕 着 城 堡 走 的 话 ， 你 可 能 会 在 后 面 找 到 机 会 。
	AI_Output(self, other, "DIA_Jergan_Hilfe_13_02"); //你 应 该 远 离 道 路 而 多 利 用 河 流 。 如 果 你 能 顺 流 而 下 游 过 一 段 路 程 的 话 应 该 是 最 好 的 选 择 。 那 样 走 会 更 容 易 一 些 。
	AI_Output(self, other, "DIA_Jergan_Hilfe_13_03"); //兽 人 在 城 堡 后 面 设 置 了 一 个 破 城 锤 。 你 可 以 从 那 里 进 去 - 先 尽 可 能 接 近 兽 人 ， 然 后 开 始 跑 。
	AI_Output(self, other, "DIA_Jergan_Hilfe_13_04"); //如 果 你 足 够 快 的 话 ， 你 可 能 会 成 功 。
};

// 2. Begegnung
///////////////////////////////////////////////////////////////////////
//	Info
///////////////////////////////////////////////////////////////////////
instance DIA_Jergan_Mine(C_INFO)
{
	npc				= VLK_4110_Jergan;
	nr				= 3;
	condition		= DIA_Jergan_Mine_Condition;
	information		= DIA_Jergan_Mine_Info;
	description		= "你 在 这 里 干 什 么 ？";
};

func int DIA_Jergan_Mine_Condition()
{
	if (Npc_GetDistToWP(self, "OW_NEWMINE_04") < 1000)
	{
		return TRUE;
	};
};

func void DIA_Jergan_Mine_Info()
{
	AI_Output(other, self, "DIA_Jergan_Mine_15_00"); //你 在 这 里 干 什 么 ？
	AI_Output(self, other, "DIA_Jergan_Mine_13_01"); //我 是 一 个 侦 察 兵 。 我 在 农 村 附 近 到 处 走 动 。 但 是 那 些 暴 龙 让 我 遇 上 了 难 题 。
	AI_Output(self, other, "DIA_Jergan_Mine_13_02"); //这 是 一 次 很 好 的 获 取 战 利 品 的 机 会 - 如 果 你 知 道 怎 么 做 的 话 。
};

///////////////////////////////////////////////////////////////////////
//	Klauen reissen
///////////////////////////////////////////////////////////////////////
instance DIA_Jergan_Claw(C_INFO)
{
	npc				= VLK_4110_Jergan;
	nr				= 3;
	condition		= DIA_Jergan_Claw_Condition;
	information		= DIA_Jergan_Claw_Info;
	description		= "你 能 教 我 怎 么 做 吗 ？";
};

func int DIA_Jergan_Claw_Condition()
{
	if ((Npc_GetDistToWP(self, "OW_NEWMINE_04") < 1000)
	&& Npc_KnowsInfo(other, DIA_Jergan_Mine)
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Claw_Info()
{
	AI_Output(other, self, "DIA_Jergan_Claw_15_00"); //你 能 教 我 怎 么 做 吗 ？
	AI_Output(self, other, "DIA_Jergan_Claw_13_01"); //我 可 以 告 诉 你 怎 样 从 那 些 家 伙 的 爪 子 从 它 们 的 尸 体 上 取 下 来 。
};

///////////////////////////////////////////////////////////////////////
//	Klauen reissen lernen
///////////////////////////////////////////////////////////////////////
instance DIA_Jergan_Teach(C_INFO)
{
	npc				= VLK_4110_Jergan;
	nr				= 9;
	condition		= DIA_Jergan_Teach_Condition;
	information		= DIA_Jergan_Teach_Info;
	permanent		= TRUE;
	description		= "（ 学 习 取 得 爪 子 ）";
};

func int DIA_Jergan_Teach_Condition()
{
	if ((Npc_GetDistToWP(self, "OW_NEWMINE_04") < 1000)
	&& Npc_KnowsInfo(other, DIA_Jergan_Claw)
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Teach_Info()
{
	AI_Output(other, self, "DIA_Jergan_Teach_15_00"); //告 诉 我 怎 样 取 下 爪 子 。

	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_Claws))
	{
		AI_Output(self, other, "DIA_Jergan_Teach_13_01"); //最 重 要 的 是 猛 地 一 下 把 爪 子 砍 下 来 。 不 要 慢 腾 腾 地 ， 也 不 要 用 刀 子 去 捅 。
		AI_Output(self, other, "DIA_Jergan_Teach_13_02"); //用 这 个 方 法 不 光 能 取 下 暴 龙 的 爪 子 ， 还 有 蜥 蜴 和 影 兽 的 爪 子 也 是 一 样 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Diego
///////////////////////////////////////////////////////////////////////
instance DIA_Jergan_Diego(C_INFO)
{
	npc				= VLK_4110_Jergan;
	nr				= 9;
	condition		= DIA_Jergan_Diego_Condition;
	information		= DIA_Jergan_Diego_Info;
	description		= "你 知 道 迪 雅 戈 去 哪 里 了 吗 ？";
};

func int DIA_Jergan_Diego_Condition()
{
	if ((Npc_GetDistToWP(self, "OW_NEWMINE_04") < 1000)
	&& (Npc_KnowsInfo(other, DIA_DiegoOw_Hallo) == FALSE)
	&& Npc_KnowsInfo(other, DIA_Parcival_Diego))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Diego_Info()
{
	AI_Output(other, self, "DIA_Jergan_Diego_15_00"); //你 知 道 迪 雅 戈 去 哪 里 了 吗 ？
	AI_Output(self, other, "DIA_Jergan_Diego_13_01"); //迪 雅 戈 ？ 他 曾 是 席 尔 维 斯 特 罗 的 一 个 矿 工 。 但 是 他 溜 走 了 。
	AI_Output(self, other, "DIA_Jergan_Diego_13_02"); //我 看 见 他 带 着 一 个 箱 子 跟 两 个 骑 士 在 一 起 ， 离 这 里 不 远 。
	AI_Output(self, other, "DIA_Jergan_Diego_13_03"); //你 从 这 里 可 以 看 到 那 个 旧 的 瞭 望 塔 对 吧 ? 到 那 边 去 ，然 后 朝 城 堡 走 去 。
	AI_Output(self, other, "DIA_Jergan_Diego_13_04"); //有 一 条 向 右 边 的 路 穿 过 那 些 岩 石 。 他 们 就 是 往 那 里 去 了 。
};

///////////////////////////////////////////////////////////////////////
//	Rudelführer getötet
///////////////////////////////////////////////////////////////////////
instance DIA_Jergan_Leader(C_INFO)
{
	npc				= VLK_4110_Jergan;
	nr				= 3;
	condition		= DIA_Jergan_Leader_Condition;
	information		= DIA_Jergan_Leader_Info;
	important		= TRUE;
};

func int DIA_Jergan_Leader_Condition()
{
	if ((Npc_GetDistToWP(self, "OW_NEWMINE_04") < 1000)
	&& Npc_IsDead(NewMine_LeadSnapper)
	&& Npc_KnowsInfo(other, DIA_Bilgot_KNOWSLEADSNAPPER))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Leader_Info()
{
	AI_Output(self, other, "DIA_Jergan_Leader_13_00"); //这 么 说 ， 你 已 经 杀 掉 了 那 群 野 兽 的 首 领 。 那 你 从 那 个 畜 生 身 上 把 爪 子 取 下 来 了 吗 ？

	if (Npc_HasItems(other, ItAt_ClawLeader) >= 1)
	{
		AI_Output(other, self, "DIA_Jergan_Leader_15_01"); //是 的 。
		AI_Output(self, other, "DIA_Jergan_Leader_13_02"); //它 们 肯 定 很 值 钱 。 有 一 些 家 伙 专 门 收 购 这 种 东 西 。
		AI_Output(self, other, "DIA_Jergan_Leader_13_03"); //如 果 你 找 对 了 买 家 ， 可 以 用 它 们 换 到 一 大 笔 钱 。
	}
	else
	{
		AI_Output(other, self, "DIA_Jergan_Leader_15_04"); //不 。
		AI_Output(self, other, "DIA_Jergan_Leader_13_05"); //你 应 该 这 么 做 。 我 敢 肯 定 它 们 值 很 多 钱 。
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Jergan_PICKPOCKET(C_INFO)
{
	npc				= VLK_4110_Jergan;
	nr				= 900;
	condition		= DIA_Jergan_PICKPOCKET_Condition;
	information		= DIA_Jergan_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_100;
};

func int DIA_Jergan_PICKPOCKET_Condition()
{
	C_Beklauen(84, 110);
};

func void DIA_Jergan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jergan_PICKPOCKET);
	Info_AddChoice(DIA_Jergan_PICKPOCKET, DIALOG_BACK, DIA_Jergan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jergan_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Jergan_PICKPOCKET_DoIt);
};

func void DIA_Jergan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Jergan_PICKPOCKET);
};

func void DIA_Jergan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jergan_PICKPOCKET);
};
