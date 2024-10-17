// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Addon_Bill_EXIT(C_INFO)
{
	npc				= PIR_1356_Addon_Bill;
	nr				= 999;
	condition		= DIA_Addon_Bill_EXIT_Condition;
	information		= DIA_Addon_Bill_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Bill_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Bill_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Bill_PICKPOCKET(C_INFO)
{
	npc				= PIR_1356_Addon_Bill;
	nr				= 900;
	condition		= DIA_Addon_Bill_PICKPOCKET_Condition;
	information		= DIA_Addon_Bill_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Addon_Bill_PICKPOCKET_Condition()
{
	C_Beklauen(80, 205);
};

func void DIA_Addon_Bill_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Bill_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Bill_PICKPOCKET, DIALOG_BACK, DIA_Addon_Bill_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Bill_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Bill_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bill_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Bill_PICKPOCKET);
};

func void DIA_Addon_Bill_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Bill_PICKPOCKET);
};

// ************************************************************
// 			  				   Hello
// ************************************************************
instance DIA_Addon_Bill_Hello(C_INFO)
{
	npc				= PIR_1356_Addon_Bill;
	nr				= 1;
	condition		= DIA_Addon_Bill_Hello_Condition;
	information		= DIA_Addon_Bill_Hello_Info;
	important		= TRUE;
};

func int DIA_Addon_Bill_Hello_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_Hello_Info()
{
	AI_Output(other, self, "DIA_Addon_Bill_Hello_15_00"); //你 那 里 的 事 情 进 展 如 何 ？
	AI_Output(self, other, "DIA_Addon_Bill_Hello_03_01"); //怎 么 回 事 ？ 亨 利 派 你 来 这 里 ？
	AI_Output(self, other, "DIA_Addon_Bill_Hello_03_02"); //告 诉 他 ， 只 要 我 这 里 一 完 成 ， 他 马 上 就 能 拿 到 他 的 木 板 。
	AI_Output(self, other, "DIA_Addon_Bill_Hello_03_03"); //如 果 他 等 不 了 那 么 久 的 话 ， 欢 迎 他 亲 自 来 锯 。

	Npc_ExchangeRoutine(self, "START");
};

// ************************************************************
// 			  				 Planks
// ************************************************************
instance DIA_Addon_Bill_Planks(C_INFO)
{
	npc				= PIR_1356_Addon_Bill;
	nr				= 2;
	condition		= DIA_Addon_Bill_Planks_Condition;
	information		= DIA_Addon_Bill_Planks_Info;
	description		= "所 有 这 些 木 板 是 做 什 么 用 的 ？";
};

func int DIA_Addon_Bill_Planks_Condition()
{
	if (GregIsBAck == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_Planks_Info()
{
	AI_Output(other, self, "DIA_Addon_Bill_Planks_15_00"); //所 有 这 些 木 板 是 做 什 么 用 的 ？
	AI_Output(self, other, "DIA_Addon_Bill_Planks_03_01"); //我 们 用 它 们 来 建 栅 栏 ， 你 这 个 傻 瓜 ！
	AI_Output(self, other, "DIA_Addon_Bill_Planks_03_02"); //格 雷 格 认 为 用 这 样 的 方 法 来 保 护 我 们 的 营 地 是 个 好 主 意 。
	AI_Output(self, other, "DIA_Addon_Bill_Planks_03_03"); //我 认 为 ， 我 们 可 以 减 少 我 们 的 工 作 量 。
	AI_Output(self, other, "DIA_Addon_Bill_Planks_03_04"); //如 果 强 盗 真 的 计 划 进 攻 我 们 ， 这 个 可 笑 的 栅 栏 根 本 挡 不 住 他 们 。
	AI_Output(self, other, "DIA_Addon_Bill_Planks_03_05"); //首 先 ， 我 们 决 不 会 容 忍 他 们 呆 在 我 们 的 山 谷 里 。
	AI_Output(self, other, "DIA_Addon_Bill_Planks_03_06"); //如 果 我 事 先 知 道 会 这 样 的 话 ， 我 会 留 在 克 霍 里 尼 斯 。
};

// ************************************************************
// 							PERM
// ************************************************************
var int Bill_Perm_Once;
instance DIA_Addon_Bill_Perm(C_INFO)
{
	npc				= PIR_1356_Addon_Bill;
	nr				= 4;
	condition		= DIA_Addon_Bill_Perm_Condition;
	information		= DIA_Addon_Bill_Perm_Info;
	permanent		= TRUE;
	description		= "我 能 帮 你 拉 锯 吗 ？";
};

func int DIA_Addon_Bill_Perm_Condition()
{
	if ((GregIsBack == FALSE)
	&& (Npc_WasInState(self, ZS_Saw)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_Perm_Info()
{
	AI_Output(other, self, "DIA_Addon_Bill_Perm_15_00"); //我 能 帮 你 拉 锯 吗 ？
	AI_Output(self, other, "DIA_Addon_Bill_Perm_03_01"); //不 ， 我 可 以 自 己 处 理 。
	if (Bill_Perm_Once == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Bill_Perm_03_02"); //我 不 久 前 才 加 入 这 里 ， 如 果 你 听 我 说 的 话 ， 就 算 让 别 人 来 做 我 的 工 作 ， 我 也 去 不 了 别 的 地 方 ？
		Bill_Perm_Once = TRUE;
	};
};

// ************************************************************
//							PERM 2
// ************************************************************
instance DIA_Addon_Bill_Perm2(C_INFO)
{
	npc				= PIR_1356_Addon_Bill;
	nr				= 5;
	condition		= DIA_Addon_Bill_Perm2_Condition;
	information		= DIA_Addon_Bill_Perm2_Info;
	permanent		= TRUE;
	description		= "你 现 在 在 做 什 么 ？";
};

func int DIA_Addon_Bill_Perm2_Condition()
{
	if (GregIsBack == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_Perm2_Info()
{
	AI_Output(other, self, "DIA_Addon_Bill_Perm2_15_00"); //你 现 在 在 做 什 么 ？
	AI_Output(self, other, "DIA_Addon_Bill_Perm2_03_01"); //我 在 深 呼 吸 。
	if (!Npc_IsDead(Francis))
	{
		AI_Output(self, other, "DIA_Addon_Bill_Perm2_03_02"); //（ 心 满 意 足 ） 弗 朗 西 斯 接 管 了 我 以 前 的 工 作 。
		AI_Output(self, other, "DIA_Addon_Bill_Perm2_03_03"); //让 他 去 锯 木 板 ， 直 到 他 的 胳 膊 抬 不 起 来 。
	};
};

// ************************************************************
// *** ***
// 					Die Angus und Hank Show
// *** ***
// ************************************************************
// ------------------------------------------------------------
// 					Ich suche Angus und Hank.
// ------------------------------------------------------------
instance DIA_Addon_Bill_AngusnHank(C_INFO)
{
	npc				= PIR_1356_Addon_Bill;
	nr				= 11;
	condition		= DIA_Addon_Bill_AngusnHank_Condition;
	information		= DIA_Addon_Bill_AngusnHank_Info;
	description		= "我 正 在 找 安 格 斯 与 汉 克 。";
};

func int DIA_Addon_Bill_AngusnHank_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Skip_AngusHank))
	&& Npc_HasItems(Angus, ItRi_Addon_MorgansRing_Mission))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_AngusnHank_Info()
{
	AI_Output(other, self, "DIA_Addon_Bill_AngusnHank_15_00"); //我 正 在 找 安 格 斯 与 汉 克 。
	AI_Output(self, other, "DIA_Addon_Bill_AngusnHank_03_01"); //（ 叹 息 ） 我 不 知 道 他 们 在 哪 里 - 强 盗 一 定 抓 住 他 们 了 。
	AI_Output(other, self, "DIA_Addon_Bill_AngusnHank_15_02"); //你 是 他 们 的 朋 友 ， 不 是 吗 ？
	AI_Output(self, other, "DIA_Addon_Bill_AngusnHank_03_03"); //我 只 知 道 他 们 是 去 离 这 里 不 远 的 一 个 山 洞 里 和 强 盗 见 面 。
	AI_Output(self, other, "DIA_Addon_Bill_AngusnHank_03_04"); //一 定 在 我 们 营 地 的 外 面 ， 东 边 的 某 个 地 方 。
	AI_Output(self, other, "DIA_Addon_Bill_AngusnHank_03_05"); //我 不 知 道 确 切 的 位 置 。 我 从 来 没 有 亲 自 到 过 那 里 。
	AI_Output(self, other, "DIA_Addon_Bill_AngusnHank_03_06"); //也 许 你 应 该 向 鳄 鱼 杰 克 询 问 一 下 ， 他 总 是 在 营 地 外 面 转 。

	B_LogEntry(TOPIC_Addon_SkipsGrog, TOPIC_Addon_SkipsGrog_6);
};

// ------------------------------------------------------------
// 							Sie sind tot.
// ------------------------------------------------------------
instance DIA_Addon_Bill_FoundFriends(C_INFO)
{
	npc				= PIR_1356_Addon_Bill;
	nr				= 12;
	condition		= DIA_Addon_Bill_FoundFriends_Condition;
	information		= DIA_Addon_Bill_FoundFriends_Info;
	description		= "我 找 到 了 你 的 朋 友 。";
};

func int DIA_Addon_Bill_FoundFriends_Condition()
{
	if (!Npc_HasItems(Angus, ItRi_Addon_MorgansRing_Mission))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_FoundFriends_Info()
{
	AI_Output(other, self, "DIA_Addon_Bill_FoundFriends_15_00"); //我 找 到 了 你 的 朋 友 。
	AI_Output(self, other, "DIA_Addon_Bill_FoundFriends_03_01"); //然 后 呢 ？ 他 们 在 哪 里 ？
	AI_Output(other, self, "DIA_Addon_Bill_FoundFriends_15_02"); //他 们 死 了 。
	AI_Output(self, other, "DIA_Addon_Bill_FoundFriends_03_03"); //（ 憎 恨 的 ） 这 是 那 些 该 死 的 强 盗 们 干 的 ！
	if (SC_Knows_JuanMurderedAngus == FALSE)
	{
		AI_Output(other, self, "DIA_Addon_Bill_FoundFriends_15_06"); //有 可 能 。
	};

	AI_Output(self, other, "DIA_Addon_Bill_FoundFriends_03_04"); //那 些 该 死 的 畜 牲 。 希 望 他 们 在 地 狱 里 受 煎 熬 。
	AI_Output(self, other, "DIA_Addon_Bill_FoundFriends_03_05"); //（ 对 他 自 己 ， 憎 恨 的 ） 一 旦 让 我 知 道 那 个 做 这 事 的 罪 犯 的 名 字 … …

	MIS_Addon_Bill_SearchAngusMurder = LOG_RUNNING;

	Log_CreateTopic(TOPIC_Addon_KillJuan, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KillJuan, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_KillJuan, TOPIC_Addon_KillJuan_3);
};

// ------------------------------------------------------------
// 						Ich kenne den Mörder
// ------------------------------------------------------------
instance DIA_Addon_Bill_JuanMurder(C_INFO)
{
	npc				= PIR_1356_Addon_Bill;
	nr				= 13;
	condition		= DIA_Addon_Bill_JuanMurder_Condition;
	information		= DIA_Addon_Bill_JuanMurder_Info;
	description		= "我 知 道 是 谁 谋 杀 了 安 格 斯 与 汉 克 。";
};

func int DIA_Addon_Bill_JuanMurder_Condition()
{
	if ((MIS_Addon_Bill_SearchAngusMurder == LOG_RUNNING)
	&& (SC_Knows_JuanMurderedAngus == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_JuanMurder_Info()
{
	AI_Output(other, self, "DIA_Addon_Bill_JuanMurder_15_00"); //我 知 道 是 谁 谋 杀 了 安 格 斯 与 汉 克 。
	AI_Output(self, other, "DIA_Addon_Bill_JuanMurder_03_01"); //（ 兴 奋 的 ） 谁 ？ 谁 干 的 ？
	AI_Output(other, self, "DIA_Addon_Bill_JuanMurder_15_02"); //他 的 名 字 叫 胡 安 ， 他 是 一 个 强 盗 。
	AI_Output(self, other, "DIA_Addon_Bill_JuanMurder_03_03"); //你 必 须 要 去 干 掉 那 个 混 蛋 ， 你 听 到 了 吗 ？
	AI_Output(self, other, "DIA_Addon_Bill_JuanMurder_03_04"); //一 定 不 能 让 他 逃 脱 惩 罚 ！

	B_LogEntry(TOPIC_Addon_KillJuan, TOPIC_Addon_KillJuan_4);
};

// ------------------------------------------------------------
// 						Juan ist erledigt.
// ------------------------------------------------------------
instance DIA_Addon_Bill_KilledEsteban(C_INFO)
{
	npc				= PIR_1356_Addon_Bill;
	nr				= 14;
	condition		= DIA_Addon_Bill_KilledEsteban_Condition;
	information		= DIA_Addon_Bill_KilledEsteban_Info;
	description		= "胡 安 已 经 成 为 历 史 了 。";
};

func int DIA_Addon_Bill_KilledEsteban_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Bill_JuanMurder))
	&& (Npc_IsDead(Juan)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_KilledEsteban_Info()
{
	AI_Output(other, self, "DIA_Addon_Bill_KilledEsteban_15_00"); //胡 安 已 经 成 为 历 史 了 。
	AI_Output(self, other, "DIA_Addon_Bill_KilledEsteban_03_01"); //（ 热 切 的 ） 还 有 吗 ？ 他 痛 苦 吗 ？
	AI_Output(other, self, "DIA_Addon_Bill_KilledEsteban_15_02"); //别 吹 牛 了 ， 小 子 。
	AI_Output(self, other, "DIA_Addon_Bill_KilledEsteban_03_03"); //（ 叹 息 ） 哦 好 吧 。 只 要 你 杀 了 那 个 畜 牲 。

	B_LogEntry(TOPIC_Addon_KillJuan, TOPIC_Addon_KillJuan_5);
	MIS_Addon_Bill_SearchAngusMurder = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Bill_KillAngusMurder);
};

// ************************************************************
// *** ***
//							Pick Pocket
// *** ***
// ************************************************************
// ------------------------------------------------------------
// 							Khorinis?
// ------------------------------------------------------------
instance DIA_Addon_Bill_Khorinis(C_INFO)
{
	npc				= PIR_1356_Addon_Bill;
	nr				= 21;
	condition		= DIA_Addon_Bill_Khorinis_Condition;
	information		= DIA_Addon_Bill_Khorinis_Info;
	description		= "你 去 过 克 霍 里 尼 斯 ？";
};

func int DIA_Addon_Bill_Khorinis_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Bill_Planks))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_Khorinis_Info()
{
	AI_Output(other, self, "DIA_Addon_Bill_Khorinis_15_00"); //你 去 过 克 霍 里 尼 斯 ？
	AI_Output(self, other, "DIA_Addon_Bill_Khorinis_03_01"); //是 的 。 我 漂 流 到 那 里 ， 偷 偷 钱 包 ， 偶 尔 骗 点 东 西 。
	AI_Output(self, other, "DIA_Addon_Bill_Khorinis_03_02"); //不 过 当 很 少 有 船 进 来 的 时 候 ， 生 意 越 来 越 差 。
	AI_Output(self, other, "DIA_Addon_Bill_Khorinis_03_03"); //有 时 候 ， 为 了 一 点 硬 面 包 而 躲 着 那 些 民 兵 ， 让 我 感 到 疲 倦 。
	AI_Output(self, other, "DIA_Addon_Bill_Khorinis_03_04"); //我 就 在 那 时 加 入 了 格 雷 格 。 现 在 我 呆 在 这 里 。

	if (GregIsBAck == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Bill_Khorinis_03_05"); //（ 叹 息 ） 一 天 到 晚 锯 木 头 ， 修 建 那 个 对 任 何 人 来 说 都 没 有 用 处 的 栅 栏 。
	};
};

// ------------------------------------------------------------
// 							Wanna Learn
// ------------------------------------------------------------
instance DIA_Addon_Bill_TeachPlayer(C_INFO)
{
	npc				= PIR_1356_Addon_Bill;
	nr				= 22;
	condition		= DIA_Addon_Bill_TeachPlayer_Condition;
	information		= DIA_Addon_Bill_TeachPlayer_Info;
	description		= "你 能 教 我 一 些 东 西 吗 ？";
};

func int DIA_Addon_Bill_TeachPlayer_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Bill_Khorinis))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_TeachPlayer_Info()
{
	AI_Output(other, self, "DIA_Addon_Bill_TeachPlayer_15_00"); //你 能 教 我 一 些 东 西 吗 ？
	AI_Output(self, other, "DIA_Addon_Bill_TeachPlayer_03_01"); //嗯 ， 我 可 以 教 你 如 何 偷 窃 其 它 人 的 钱 包 而 不 被 发 现 。
	AI_Output(self, other, "DIA_Addon_Bill_TeachPlayer_03_02"); //但 是 你 一 定 要 手 脚 灵 活 ， 不 然 你 就 会 后 悔 了 。

	Bill_Addon_TeachPickPocket = TRUE;
};

// ------------------------------------------------------------
// 						Teach Pickpocket
// ------------------------------------------------------------
instance DIA_Addon_Bill_LearnTalent(C_INFO)
{
	npc				= PIR_1356_Addon_Bill;
	nr				= 23;
	condition		= DIA_Addon_Bill_LearnTalent_Condition;
	information		= DIA_Addon_Bill_LearnTalent_Info;
	permanent		= TRUE;
	description		= "教 我 怎 么 扒 窃 。 （ １ ０ L P）";
};

func int DIA_Addon_Bill_LearnTalent_Condition()
{
	if ((Bill_Addon_TeachPickPocket == TRUE)
	&& (Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_LearnTalent_Info()
{
	AI_Output(other, self, "DIA_Addon_Bill_LearnTalent_15_00"); //教 我 怎 么 扒 窃 。

	if (other.attribute[ATR_DEXTERITY] >= 40) // braucht man für Francis
	{
		if (B_TeachThiefTalent(self, other, NPC_TALENT_PICKPOCKET))
		{
			AI_Output(self, other, "DIA_Addon_Bill_LearnTalent_03_01"); //首 先 ， 你 需 要 让 你 的 目 标 感 到 十 分 安 全 。
			AI_Output(self, other, "DIA_Addon_Bill_LearnTalent_03_02"); //我 通 常 走 到 人 们 身 旁 同 他 们 交 谈 。 那 就 像 一 个 咒 语 。
			AI_Output(self, other, "DIA_Addon_Bill_LearnTalent_03_03"); //然 后 你 就 可 以 下 手 了 ， 不 过 要 确 保 他 们 没 有 发 现 。

			AI_Output(other, self, "DIA_Addon_Bill_LearnTalent_15_05"); //还 有 吗 ？
			AI_Output(self, other, "DIA_Addon_Bill_LearnTalent_03_06"); //对 ， 继 续 训 练 你 的 敏 捷 。 你 越 敏 捷 ， 你 被 发 现 的 机 会 就 越 小 。
			AI_Output(self, other, "DIA_Addon_Bill_LearnTalent_03_07"); //而 你 也 能 越 快 地 把 你 的 目 标 的 东 西 拿 走 而 不 被 抓 住 ！
			AI_Output(self, other, "DIA_Addon_Bill_LearnTalent_03_08"); //就 是 那 样 - 至 少 理 论 上 是 。
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Bill_LearnTalent_03_09"); //算 了 吧 ！ 你 还 不 够 灵 活 ！
		AI_Output(self, other, "DIA_Addon_Bill_LearnTalent_03_10"); //你 必 须 首 先 要 变 得 更 加 敏 捷 ， 或 者 找 个 更 好 的 老 师 。
	};
};
