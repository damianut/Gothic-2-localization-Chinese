///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ADW_EXIT(C_INFO)
{
	npc				= KDW_14000_Addon_Saturas_ADW;
	nr				= 999;
	condition		= DIA_Addon_Saturas_ADW_EXIT_Condition;
	information		= DIA_Addon_Saturas_ADW_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Saturas_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
	AI_Output(self, other, "DIA_Addon_Saturas_ADW_EXIT_14_00"); //愿 亚 达 诺 斯 保 护 你。
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
instance DIA_Addon_Saturas_ADW_PICKPOCKET(C_INFO)
{
	npc				= KDW_14000_Addon_Saturas_ADW;
	nr				= 900;
	condition		= DIA_Addon_Saturas_ADW_PICKPOCKET_Condition;
	information		= DIA_Addon_Saturas_ADW_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "(Es wäre einfach seine Spruchrolle zu stehlen)";
};

func int DIA_Addon_Saturas_ADW_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Saturas_NW.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (31 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_ADW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Saturas_ADW_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Saturas_ADW_PICKPOCKET, DIALOG_BACK, DIA_Addon_Saturas_ADW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Saturas_ADW_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Saturas_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Saturas_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 31)
	{
		B_GiveInvItems(self, other, ItSc_Water01, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Addon_Saturas_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Addon_Saturas_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Saturas_ADW_PICKPOCKET);
};

*/
///////////////////////////////////////////////////////////////////////
//	Info ADWStart
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ADWStart(C_INFO)
{
	npc				= KDW_14000_Addon_Saturas_ADW;
	nr				= 1;
	condition		= DIA_Addon_Saturas_ADWStart_Condition;
	information		= DIA_Addon_Saturas_ADWStart_Info;
	important		= TRUE;
};

func int DIA_Addon_Saturas_ADWStart_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_ADWStart_Info()
{
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_14_00"); //感 谢 亚 达 诺 斯 。 你 终 于 来 这 里 了 。 我 们 以 为 你 不 会 再 露 面 了 。
	AI_Output(other, self, "DIA_Addon_Saturas_ADWStart_15_01"); //（ 困 惑 的 ） 什 么 ？ 你 怎 么 已 经 在 这 里 了 ？
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_14_02"); //你 穿 过 传 送 门 ， 而 我 们 跟 着 你 。 到 这 里 没 用 多 久 时 间 。
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_14_03"); //然 而 ， 你 不 在 那 里 。 我 们 已 经 到 这 里 几 天 了 。
	AI_Output(other, self, "DIA_Addon_Saturas_ADWStart_15_04"); //（ 感 到 惊 讶 ） 几 天 ？ 怎 么 可 能 ？
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_14_05"); //当 我 们 在 哪 里 都 找 不 到 你 的 时 候 ， 内 法 利 尔 斯 想 查 明 究 竟 哪 里 出 了 问 题 。 从 现 在 来 看 ， 他 是 彻 底 瞎 折 腾 了 。
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_14_06"); //嗯 。 现 在 你 到 了 这 里 ， 可 以 开 始 你 的 工 作 了 。

	Wld_InsertNpc(Giant_Rat, "ADW_PORTALTEMPEL_11");
	Wld_InsertNpc(Giant_Rat, "ADW_PORTALTEMPEL_11");

	Info_ClearChoices(DIA_Addon_Saturas_ADWStart);
	Info_AddChoice(DIA_Addon_Saturas_ADWStart, "其 间 发 生 了 什 么 ？", DIA_Addon_Saturas_ADWStart_was);
};

func void DIA_Addon_Saturas_ADWStart_was()
{
	AI_Output(other, self, "DIA_Addon_Saturas_ADWStart_was_15_00"); //其 间 发 生 了 什 么 ？
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_was_14_01"); //我 们 已 经 收 集 了 很 多 新 见 识 。
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_was_14_02"); //这 里 的 地 震 的 确 非 常 强 。 我 们 离 它 的 中 心 不 远 了 。
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_was_14_03"); //在 他 们 那 个 年 代 ， 这 些 古 老 建 筑 的 建 造 者 在 这 里 修 建 了 一 座 城 市 ， 就 象 我 们 说 过 的 那 样 。
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_was_14_04"); //然 而 ， 出 于 某 种 原 因 ， 他 们 的 文 明 结 束 了 。
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_was_14_05"); //但 是 到 现 在 为 止 ， 我 们 还 无 法 推 测 出 原 因 。

	Info_AddChoice(DIA_Addon_Saturas_ADWStart, "你 找 到 那 些 失 踪 的 人 的 踪 迹 了 吗 ？", DIA_Addon_Saturas_ADWStart_missingPeople);
	Info_AddChoice(DIA_Addon_Saturas_ADWStart, "瑞 雯 怎 么 样 ？", DIA_Addon_Saturas_ADWStart_Raven);
};

func void DIA_Addon_Saturas_ADWStart_Raven()
{
	AI_Output(other, self, "DIA_Addon_Saturas_ADWStart_Raven_15_00"); //瑞 雯 怎 么 样 ？
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_01"); //在 他 的 信 里 ， 瑞 雯 提 到 一 座 他 试 图 进 入 的 神 殿 。
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_02"); //我 们 的 观 点 一 致 认 为 ， 瑞 雯 试 图 亵 渎 的 神 殿 是 一 座 亚 达 诺 斯 神 殿 。
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_03"); //那 地 震 显 然 是 某 种 邪 恶 的 咒 语 碰 到 一 种 强 大 的 魔 法 后 产 生 的 。
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_04"); //神 殿 大 门 被 魔 法 封 印 ， 就 是 这 种 魔 法 制 造 了 那 些 石 头 哨 兵 。
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_05"); //神 殿 正 在 自 我 保 护 。 我 们 必 须 在 瑞 雯 打 破 神 殿 的 圣 洁 之 前 阻 止 他 。

	Info_AddChoice(DIA_Addon_Saturas_ADWStart, "下 面 将 发 生 什 么？", DIA_Addon_Saturas_ADWStart_wastun);
	Info_AddChoice(DIA_Addon_Saturas_ADWStart, "瑞 雯 只 是 以 前 的 矿 石 大 亨 ， 而 不 是 魔 法 师 。", DIA_Addon_Saturas_ADWStart_RavenOnlyBaron);
	Info_AddChoice(DIA_Addon_Saturas_ADWStart, "瑞 雯 想 从 神 殿 里 面 得 到 什 么 ？", DIA_Addon_Saturas_ADWStart_RavenAim);
};

func void DIA_Addon_Saturas_ADWStart_RavenAim()
{
	AI_Output(other, self, "DIA_Addon_Saturas_ADWStart_RavenAim_15_00"); //瑞 雯 想 从 神 殿 里 面 得 到 什 么 ？
	// AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_RavenAim_14_01"); // Wir wissen es nicht. Es muss etwas sehr Wertvolles oder Mächtiges in dem Tempel sein.
	// AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_RavenAim_14_02"); // Aber wir können davon ausgehen, dass er nichts Gutes im Schilde führt.
	AI_Output(self, other, "DIA_Addon_Bodo_14_01"); //我 们 只 知 道 ， 只 能 使 用 某 种 连 接 着 亚 达 诺 斯 和 贝 利 尔 的 东 西 来 实 现 。
	AI_Output(self, other, "DIA_Addon_Bodo_14_02"); //（ 冷 酷 的 ） 我 们 能 确 定 他 不 是 在 做 什 么 好 事 … …
};

func void DIA_Addon_Saturas_ADWStart_RavenOnlyBaron()
{
	AI_Output(other, self, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_15_00"); //瑞 雯 只 是 一 个 以 前 的 矿 石 大 亨 ， 而 不 是 一 名 魔 法 师 。 他 怎 么 能 施 展 出 那 样 的 魔 法 ？
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_01"); //也 许 那 并 不 是 他 ， 而 是 一 名 收 了 钱 的 魔 法 师 叛 徒 。
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_02"); //无 论 怎 么 样 ， 我 们 必 须 阻 止 邪 恶 。
};

func void DIA_Addon_Saturas_ADWStart_missingPeople()
{
	AI_Output(other, self, "DIA_Addon_Saturas_ADWStart_missingPeople_15_00"); //你 找 到 那 些 失 踪 的 人 的 踪 迹 了 吗 ？
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_missingPeople_14_01"); //就 在 昨 天 ， 我 们 发 现 了 一 名 渔 夫 的 尸 体 。 他 躺 在 东 边 的 一 个 废 墟 下 。
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_missingPeople_14_02"); //看 起 来 那 个 渔 夫 是 来 自 克 霍 里 尼 斯 。 你 应 该 看 看 这 个 。
	Saturas_AboutWilliam = TRUE;

	B_LogEntry(TOPIC_Addon_MissingPeople, LogText_Addon_WilliamLeiche);
};

func void DIA_Addon_Saturas_ADWStart_wastun()
{
	AI_Output(other, self, "DIA_Addon_Saturas_ADWStart_wastun_15_00"); //下 面 发 生 了 什 么 ？
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_01"); //我 们 要 在 这 里 停 留 ， 并 继 续 研 究 远 古 的 文 明 。
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_02"); //建 造 者 的 古 老 铭 文 中 隐 藏 着 大 量 的 秘 密 ， 我 们 必 须 解 开 它 - 如 果 我 们 想 要 弄 清 这 里 以 前 发 生 了 什 么 事 的 话 。
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_03"); //同 时 ， 你 必 须 帮 我 们 做 一 些 事 情 … …

	Info_AddChoice(DIA_Addon_Saturas_ADWStart, "那 么 我 应 该 怎 么 做 ？", DIA_Addon_Saturas_ADWStart_wastun2);
};

func void DIA_Addon_Saturas_ADWStart_wastun2()
{
	AI_Output(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_00"); //那 么 我 应 该 怎 么 做 ？
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_01"); //你 必 须 找 到 瑞 雯 ， 并 阻 止 他 亵 渎 亚 达 诺 斯 神 殿 。
	AI_Output(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_02"); //你 是 说 我 应 该 杀 掉 他 。
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_03"); //如 果 那 是 唯 一 阻 止 他 的 方 法 ， 那 么 以 亚 达 诺 斯 之 名 … … 是 的 ！
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_04"); //在 你 的 路 上 ， 收 集 所 有 远 古 遗 物 和 你 能 找 到 的 建 造 者 的 铭 文 ， 并 把 它 们 带 给 我 们 。
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_05"); //我 们 必 须 多 多 了 解 这 些 人 民 和 他 们 的 灭 亡 。
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_06"); //只 有 当 我 们 看 穿 了 瑞 雯 的 计 划 ， 我 们 才 能 挫 败 它 们 。
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_07"); //此 外 ， 你 必 须 找 到 一 个 方 法 释 放 那 些 奴 隶 。
	AI_Output(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_08"); //（ 玩 世 不 恭 的 ） 就 那 些 吗 ？ 我 只 用 左 手 就 能 办 到 。
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_09"); //（ 生 气 ） 我 知 道 我 的 要 求 很 多 。 就 把 它 看 成 重 新 获 得 我 信 任 的 机 会 吧 。

	MIS_ADDON_Saturas_GoToRaven = LOG_RUNNING;

	Log_CreateTopic(TOPIC_Addon_RavenKDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_RavenKDW, TOPIC_Addon_RavenKDW_7);

	Log_CreateTopic(TOPIC_Addon_Sklaven, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Sklaven, TOPIC_Addon_Sklaven_8);

	Log_CreateTopic(TOPIC_Addon_Relicts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Relicts, TOPIC_Addon_Relicts_1);

	Info_AddChoice(DIA_Addon_Saturas_ADWStart, "我 想 我 要 走 了 。", DIA_Addon_Saturas_ADWStart_back);
};

func void DIA_Addon_Saturas_ADWStart_back()
{
	AI_Output(other, self, "DIA_Addon_Saturas_ADWStart_back_15_00"); //我 想 我 要 走 了 。
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_back_14_01"); //还 有 一 件 事 … … 瑞 雯 已 经 集 合 了 一 大 批 强 盗 。
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_back_14_02"); //在 你 不 在 的 时 候 ， 我 们 带 来 了 另 一 个 水 之 环 的 成 员 。
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_back_14_03"); //我 们 派 他 去 了 沼 泽 。 他 还 没 有 回 来 。
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_back_14_04"); //我 们 怀 疑 强 盗 会 攻 击 任 何 看 起 来 不 象 他 们 的 人 。
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_back_14_05"); //所 以 ， 先 弄 一 套 强 盗 盔 甲 。
	AI_Output(self, other, "DIA_Addon_Saturas_ADWStart_back_14_06"); //那 是 你 唯 一 可 以 接 近 他 们 而 不 被 立 刻 攻 击 的 方 法 。

	Log_CreateTopic(TOPIC_Addon_BDTRuestung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BDTRuestung, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_BDTRuestung, TOPIC_Addon_BDTRuestung_10);

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Start");
};

///////////////////////////////////////////////////////////////////////
//	Info PoorRanger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_PoorRanger(C_INFO)
{
	npc				= KDW_14000_Addon_Saturas_ADW;
	nr				= 2;
	condition		= DIA_Addon_Saturas_PoorRanger_Condition;
	information		= DIA_Addon_Saturas_PoorRanger_Info;
	description		= "你 安 排 进 入 沼 泽 人 叫 什 么 ？";
};

func int DIA_Addon_Saturas_PoorRanger_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_PoorRanger_Info()
{
	AI_Output(other, self, "DIA_Addon_Saturas_PoorRanger_15_00"); //你 安 排 进 入 沼 泽 人 叫 什 么 ？
	AI_Output(self, other, "DIA_Addon_Saturas_PoorRanger_14_01"); //他 的 名 字 叫 兰 斯 。
	AI_Output(self, other, "DIA_Addon_Saturas_PoorRanger_14_02"); //恐 怕 他 没 有 走 多 远 。

	Log_CreateTopic(TOPIC_Addon_Lance, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lance, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Lance, TOPIC_Addon_Lance_1);
};

///////////////////////////////////////////////////////////////////////
//	Info Piraten
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Piraten(C_INFO)
{
	npc				= KDW_14000_Addon_Saturas_ADW;
	nr				= 5;
	condition		= DIA_Addon_Saturas_Piraten_Condition;
	information		= DIA_Addon_Saturas_Piraten_Info;
	description		= "我 在 哪 里 能 找 到 适 合 我 的 强 盗 盔 甲 ？";
};

func int DIA_Addon_Saturas_Piraten_Condition()
{
	if ((AlligatorJack.aivar [AIV_TalkedToPlayer] == FALSE)
	&& (Greg.aivar [AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_Piraten_Info()
{
	AI_Output(other, self, "DIA_Addon_Saturas_Piraten_15_00"); //我 在 哪 里 能 找 到 适 合 我 的 强 盗 盔 甲 ？
	AI_Output(self, other, "DIA_Addon_Saturas_Piraten_14_01"); //似 乎 在 西 边 有 一 个 海 盗 营 地 。
	AI_Output(self, other, "DIA_Addon_Saturas_Piraten_14_02"); //据 我 所 知 ， 他 们 和 强 盗 有 联 系 。
	AI_Output(self, other, "DIA_Addon_Saturas_Piraten_14_03"); //我 不 认 为 他 们 会 在 你 接 近 时 发 起 攻 击 。
	AI_Output(self, other, "DIA_Addon_Saturas_Piraten_14_04"); //也 许 你 能 从 他 们 那 里 得 到 一 些 帮 助 … …

	B_LogEntry(TOPIC_Addon_BDTRuestung, TOPIC_Addon_BDTRuestung_11);
};

///////////////////////////////////////////////////////////////////////
//	Info LanceLeiche
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_LanceLeiche(C_INFO)
{
	npc				= KDW_14000_Addon_Saturas_ADW;
	nr				= 2;
	condition		= DIA_Addon_Saturas_LanceLeiche_Condition;
	information		= DIA_Addon_Saturas_LanceLeiche_Info;
	description		= "我 找 到 了 兰 斯 的 尸 体 。";
};

func int DIA_Addon_Saturas_LanceLeiche_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Saturas_PoorRanger))
	&& (Npc_HasItems(NONE_Addon_114_Lance_ADW, ItRi_LanceRing) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_LanceLeiche_Info()
{
	AI_Output(other, self, "DIA_Addon_Saturas_LanceLeiche_15_00"); //我 找 到 了 兰 斯 的 尸 体 。
	AI_Output(self, other, "DIA_Addon_Saturas_LanceLeiche_14_01"); //愿 他 的 灵 魂 进 入 亚 达 诺 斯 的 王 国 。
	AI_Output(self, other, "DIA_Addon_Saturas_LanceLeiche_14_02"); //要 小 心 ， 孩 子 。 我 不 想 再 为 另 一 次 这 样 的 失 败 默 哀 。

	TOPIC_End_Lance = TRUE;
	B_GivePlayerXP(XP_Addon_LanceLeiche);
};

///////////////////////////////////////////////////////////////////////
//	Info LanceRing
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_LanceRing(C_INFO)
{
	npc				= KDW_14000_Addon_Saturas_ADW;
	nr				= 5;
	condition		= DIA_Addon_Saturas_LanceRing_Condition;
	information		= DIA_Addon_Saturas_LanceRing_Info;
	description		= "我 这 里 有 兰 斯 的 蓝 宝 石 戒 指 。";
};

func int DIA_Addon_Saturas_LanceRing_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Saturas_LanceLeiche))
	&& (Npc_HasItems(other, ItRi_LanceRing)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_LanceRing_Info()
{
	AI_Output(other, self, "DIA_Addon_Saturas_LanceRing_15_00"); //我 这 里 有 兰 斯 的 蓝 宝 石 戒 指 。
	AI_Output(self, other, "DIA_Addon_Saturas_LanceRing_14_01"); //你 最 好 把 它 交 给 我 ， 以 免 它 落 入 坏 人 的 手 里 。
	B_GiveInvItems(other, self, ItRi_LanceRing, 1);
	B_GivePlayerXP(XP_Addon_LanceRing);
};

///////////////////////////////////////////////////////////////////////
//	Info Tokens
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Tokens(C_INFO)
{
	npc				= KDW_14000_Addon_Saturas_ADW;
	nr				= 10;
	condition		= DIA_Addon_Saturas_Tokens_Condition;
	information		= DIA_Addon_Saturas_Tokens_Info;
	permanent		= TRUE;
	description		= "关 于 圣 物 … …";
};

func int DIA_Addon_Saturas_Tokens_Condition()
{
	if (Saturas_SCBroughtAllToken == FALSE)
	{
		return TRUE;
	};
};

var int DIA_Addon_Saturas_Tokens_OneTime;
var int Saturas_SCBroughtAllToken;
var int Saturas_BroughtTokenAmount;
var int ScBroughtToken;
var int Saturas_SCFound_ItMi_Addon_Stone_01;
var int Saturas_SCFound_ItMi_Addon_Stone_02;
var int Saturas_SCFound_ItMi_Addon_Stone_03;
var int Saturas_SCFound_ItMi_Addon_Stone_04;
var int Saturas_SCFound_ItMi_Addon_Stone_05;

func void DIA_Addon_Saturas_Tokens_Info()
{
	AI_Output(other, self, "DIA_Addon_Saturas_Tokens_15_00"); //关 于 圣 物 … …

	if ((DIA_Addon_Saturas_Tokens_OneTime == FALSE)
	&& ((C_ScHasMagicStonePlate())
	|| (Npc_HasItems(other, ItWr_StonePlateCommon_Addon))))
	{
		AI_Output(other, self, "DIA_Addon_Saturas_Tokens_15_01"); //我 想 我 这 有 些 东 西 给 你 。
		AI_Output(self, other, "DIA_Addon_Saturas_Tokens_14_02"); //我 们 已 经 了 解 了 这 种 石 片 。 它 们 不 会 再 给 带 来 我 们 任 何 帮 助 。
		AI_Output(self, other, "DIA_Addon_Saturas_Tokens_14_03"); //一 定 还 有 更 多 。
		DIA_Addon_Saturas_Tokens_OneTime = TRUE;
	};

	var int BroughtToken;BroughtToken = 0;
	var int XP_BroughtTokens;XP_BroughtTokens = 0;

	if (((Npc_HasItems(other, ItMi_Addon_Stone_01)) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
	|| ((Npc_HasItems(other, ItMi_Addon_Stone_02)) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE))
	|| ((Npc_HasItems(other, ItMi_Addon_Stone_03)) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE))
	|| ((Npc_HasItems(other, ItMi_Addon_Stone_04)) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE))
	|| ((Npc_HasItems(other, ItMi_Addon_Stone_05)) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE)))
	{
		AI_Output(other, self, "DIA_Addon_Saturas_Tokens_15_04"); //这 个 怎 么 样 ？
		AI_Output(self, other, "DIA_Addon_Saturas_Tokens_14_05"); //那 看 起 来 不 错 。 你 从 哪 里 找 到 的 ？

		B_LogEntry(TOPIC_Addon_Relicts, TOPIC_Addon_Relicts_2);

		if ((Npc_HasItems(other, ItMi_Addon_Stone_01)) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
		{
			B_GiveInvItems(other, self, ItMi_Addon_Stone_01, 1);
			Saturas_SCFound_ItMi_Addon_Stone_01 = TRUE;
			BroughtToken = (BroughtToken + 1);
			AI_Output(other, self, "DIA_Addon_Saturas_Tokens_15_06"); //强 盗 们 把 这 些 石 片 作 为 一 种 货 币 。
			AI_Output(self, other, "DIA_Addon_Saturas_Tokens_14_07"); //这 石 片 上 刻 着 夸 霍 德 隆 的 记 号 ， 他 是 伟 大 的 战 士 。
			AI_Output(self, other, "DIA_Addon_Saturas_Tokens_14_08"); //他 是 指 挥 官 ， 他 的 儿 子 拉 德 梅 斯 引 起 了 整 个 城 市 的 崩 溃 。
			AI_Output(self, other, "DIA_Addon_Saturas_Tokens_14_09"); //（ 轻 蔑 的 ） 嘁 。 我 打 赌 那 些 强 盗 一 定 不 知 道 他 们 在 那 里 交 易 究 竟 的 是 什 么。
			B_LogEntry(TOPIC_Addon_Relicts, TOPIC_Addon_Relicts_3);
		};

		if ((Npc_HasItems(other, ItMi_Addon_Stone_02)) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE))
		{
			B_GiveInvItems(other, self, ItMi_Addon_Stone_02, 1);
			Saturas_SCFound_ItMi_Addon_Stone_02 = TRUE;
			BroughtToken = (BroughtToken + 1);
			AI_Output(other, self, "DIA_Addon_Saturas_Tokens_15_10"); //我 在 南 边 的 一 座 建 筑 里 发 现 了 这 些 石 片 。
			AI_Output(self, other, "DIA_Addon_Saturas_Tokens_14_11"); //啊 ！ 死 亡 守 护 者 的 石 片 。 就 是 他 们 召 唤 他 们 死 去 的 灵 魂 。
			AI_Output(self, other, "DIA_Addon_Saturas_Tokens_14_12"); //建 造 者 和 他 们 祖 先 之 间 的 联 系 非 常 强 大 。
			B_LogEntry(TOPIC_Addon_Relicts, TOPIC_Addon_Relicts_4);
		};

		if ((Npc_HasItems(other, ItMi_Addon_Stone_03)) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE))
		{
			B_GiveInvItems(other, self, ItMi_Addon_Stone_03, 1);
			Saturas_SCFound_ItMi_Addon_Stone_03 = TRUE;
			BroughtToken = (BroughtToken + 1);
			AI_Output(other, self, "DIA_Addon_Saturas_Tokens_15_13"); //我 在 西 南 的 一 座 建 筑 里 发 现 了 这 些 石 片 。
			AI_Output(self, other, "DIA_Addon_Saturas_Tokens_14_14"); //从 石 片 来 判 断 ， 它 和 城 市 中 牧 师 的 住 宅 有 关 。
			AI_Output(self, other, "DIA_Addon_Saturas_Tokens_14_15"); //最 高 级 的 牧 师 名 叫 克 哈 迪 蒙 。 我 们 对 他 的 了 解 不 多 。
			B_LogEntry(TOPIC_Addon_Relicts, TOPIC_Addon_Relicts_5);
		};

		if ((Npc_HasItems(other, ItMi_Addon_Stone_04)) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE))
		{
			B_GiveInvItems(other, self, ItMi_Addon_Stone_04, 1);
			Saturas_SCFound_ItMi_Addon_Stone_04 = TRUE;
			BroughtToken = (BroughtToken + 1);
			AI_Output(other, self, "DIA_Addon_Saturas_Tokens_15_15"); //这 个 东 西 是 在 大 沼 泽 里 的 一 个 建 筑 里 面 发 现 的 。
			AI_Output(self, other, "DIA_Addon_Saturas_Tokens_14_16"); //那 应 该 是 治 疗 者 的 房 子 。
			AI_Output(self, other, "DIA_Addon_Saturas_Tokens_14_17"); //我 们 对 他 们 的 了 解 不 多 。 他 们 似 乎 是 第 一 批 消 失 的 。
			B_LogEntry(TOPIC_Addon_Relicts, TOPIC_Addon_Relicts_6);
		};

		if ((Npc_HasItems(other, ItMi_Addon_Stone_05)) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE))
		{
			B_GiveInvItems(other, self, ItMi_Addon_Stone_05, 1);
			Saturas_SCFound_ItMi_Addon_Stone_05 = TRUE;
			BroughtToken = (BroughtToken + 1);
			AI_Output(other, self, "DIA_Addon_Saturas_Tokens_15_18"); //这 一 片 放 在 峡 谷 中 的 一 座 巨 大 建 筑 里 。
			AI_Output(self, other, "DIA_Addon_Saturas_Tokens_14_19"); //那 是 远 古 民 族 的 图 书 馆 。
			AI_Output(self, other, "DIA_Addon_Saturas_Tokens_14_20"); //显 然 是 学 者 们 的 石 片 。
			AI_Output(self, other, "DIA_Addon_Saturas_Tokens_14_80"); //我 们 找 到 的 大 部 分 铭 文 都 和 ‘ 学 者 城 堡 ’ 的 首 领 有 联 系 。
			AI_Output(self, other, "DIA_Addon_Saturas_Tokens_14_81"); //非 常 难 以 理 解 ， 无 论 哪 里 都 没 有 留 下 他 的 名 字 … …
			B_LogEntry(TOPIC_Addon_Relicts, TOPIC_Addon_Relicts_7);
		};

		if (SC_Knows_WeaponInAdanosTempel == TRUE)
		{
		};

		XP_BroughtTokens = (XP_Addon_ForOneToken * BroughtToken);

		B_GivePlayerXP(XP_BroughtTokens);
		Saturas_BroughtTokenAmount = (Saturas_BroughtTokenAmount + BroughtToken);

		if (Saturas_BroughtTokenAmount < 5)
		{
			if (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
			{
				AI_Output(self, other, "DIA_Addon_Saturas_Tokens_14_21"); //非 常 好 。 这 座 城 市 的 印 象 已 经 变 得 明 晰 了 ， 但 是 我 们 知 道 得 还 不 够 。
			};

			AI_Output(self, other, "DIA_Addon_Saturas_Tokens_14_22"); //总 的 说 来 ， 应 该 有 五 个 这 样 的 石 片 藏 在 附 近 。
			AI_Output(self, other, "DIA_Addon_Saturas_Tokens_14_23"); //找 到 它 们 ， 并 把 它 们 交 给 我 。
		};

		AI_Output(self, other, "DIA_Addon_Saturas_Tokens_14_24"); //这 是 作 为 报 酬 的 金 币 。

		var int Kohle;
		Kohle = (200 * BroughtToken);

		CreateInvItems(self, ItMi_Gold, Kohle);
		B_GiveInvItems(self, other, ItMi_Gold, Kohle);

		ScBroughtToken = TRUE; // mindestens einen gebracht
	};

	if (Saturas_BroughtTokenAmount == 5)
	{
		AI_Output(self, other, "DIA_Addon_Saturas_Tokens_14_25"); //现 在 我 们 已 经 收 集 到 了 所 有 需 要 的 圣 物 。

		if (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			AI_Output(self, other, "DIA_Addon_Saturas_Tokens_14_26"); //你 帮 了 我 们 很 大 的 忙 。 我 非 常 感 谢 你 。
			AI_Output(self, other, "DIA_Addon_Saturas_Tokens_14_27"); //这 将 使 我 们 的 研 究 向 前 迈 出 决 定 性 的 一 步 。
		};

		MIS_Saturas_LookingForHousesOfRulers = LOG_SUCCESS;
		Saturas_SCBroughtAllToken = TRUE;
	}
	else
	{
		AI_Output(other, self, "DIA_Addon_Saturas_Tokens_15_28"); //我 要 看 看 是 否 能 找 到 任 何 东 西 。
		AI_Output(self, other, "DIA_Addon_Saturas_Tokens_14_29"); //好 。 但 要 快 。 时 间 并 非 我 们 的 伙 伴 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info StonePlateHint
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_StonePlateHint(C_INFO)
{
	npc				= KDW_14000_Addon_Saturas_ADW;
	nr				= 5;
	condition		= DIA_Addon_Saturas_StonePlateHint_Condition;
	information		= DIA_Addon_Saturas_StonePlateHint_Info;
	important		= TRUE;
};

func int DIA_Addon_Saturas_StonePlateHint_Condition()
{
	if (((Merdarion_GotFocusCount >= 2) || (RavenIsInTempel == TRUE))
	&& (Saturas_SCBroughtAllToken == FALSE)
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
	&& (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_StonePlateHint_Info()
{
	AI_Output(self, other, "DIA_Addon_Saturas_StonePlateHint_14_00"); //你 来 了 很 好 。 我 们 有 了 新 的 发 现 ， 必 须 要 告 诉 你 。
	AI_Output(other, self, "DIA_Addon_Saturas_StonePlateHint_15_01"); //让 我 们 听 一 下 。
	AI_Output(self, other, "DIA_Addon_Saturas_StonePlateHint_14_02"); //这 座 沉 没 的 城 市 曾 经 叫 作 加 肯 达 。 城 市 里 有 五 个 统 治 者 ， 分 享 着 统 治 他 们 的 人 民 权 力 。
	AI_Output(self, other, "DIA_Addon_Saturas_StonePlateHint_14_03"); //每 个 统 治 者 都 有 一 座 大 房 子 供 他 居 住 和 保 管 财 务 。
	AI_Output(self, other, "DIA_Addon_Saturas_StonePlateHint_14_04"); //因 此 ， 在 你 搜 索 远 古 文 明 圣 物 的 时 候 ， 最 重 要 的 就 是 搜 索 这 些 大 房 子 。

	MIS_Saturas_LookingForHousesOfRulers = LOG_RUNNING;

	Info_ClearChoices(DIA_Addon_Saturas_StonePlateHint);
	Info_AddChoice(DIA_Addon_Saturas_StonePlateHint, "如 果 这 些 房 子 已 经 不 存 在 了 呢 ？", DIA_Addon_Saturas_StonePlateHint_unter);
	Info_AddChoice(DIA_Addon_Saturas_StonePlateHint, "我 应 该 在 哪 里 寻 找 这 些 房 子 ？", DIA_Addon_Saturas_StonePlateHint_wo);
};

func void DIA_Addon_Saturas_StonePlateHint_wo()
{
	AI_Output(other, self, "DIA_Addon_Saturas_StonePlateHint_wo_15_00"); //我 应 该 在 哪 里 寻 找 这 些 房 子 ？
	AI_Output(self, other, "DIA_Addon_Saturas_StonePlateHint_wo_14_01"); //瑞 奥 淀 已 经 研 究 了 加 肯 达 的 建 筑 结 构 。
	AI_Output(self, other, "DIA_Addon_Saturas_StonePlateHint_wo_14_02"); //他 会 告 诉 你 应 该 去 哪 里 寻 找 这 些 大 房 子 。

	Log_CreateTopic(TOPIC_Addon_HousesOfRulers, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_HousesOfRulers, TOPIC_Addon_HousesOfRulers_5);
};

func void DIA_Addon_Saturas_StonePlateHint_unter()
{
	AI_Output(other, self, "DIA_Addon_Saturas_StonePlateHint_unter_15_00"); //如 果 这 些 房 子 已 经 不 存 在 了 呢 ？
	AI_Output(self, other, "DIA_Addon_Saturas_StonePlateHint_unter_14_01"); //如 果 你 找 不 到 这 些 房 子 ， 那 么 他 们 也 许 和 城 市 一 起 沉 下 去 了 。
	AI_Output(self, other, "DIA_Addon_Saturas_StonePlateHint_unter_14_02"); //然 而 ， 它 们 应 该 仍 旧 存 在 ， 它 们 对 我 们 的 研 究 来 说 是 无 价 之 宝 。
};

///////////////////////////////////////////////////////////////////////
//	Info SCBroughtAllToken
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_SCBroughtAllToken(C_INFO)
{
	npc				= KDW_14000_Addon_Saturas_ADW;
	nr				= 5;
	condition		= DIA_Addon_Saturas_SCBroughtAllToken_Condition;
	information		= DIA_Addon_Saturas_SCBroughtAllToken_Info;
	description		= "你 为 什 么 需 要 这 五 块 石 片 ？";
};

func int DIA_Addon_Saturas_SCBroughtAllToken_Condition()
{
	if ((ScBroughtToken == TRUE)
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
	&& (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_SCBroughtAllToken_Info()
{
	AI_Output(other, self, "DIA_Addon_Saturas_SCBroughtAllToken_15_00"); //你 为 什 么 需 要 这 五 块 石 片 ？
	AI_Output(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_01"); //我 们 在 这 些 废 墟 中 找 到 记 录 还 不 完 整 。
	AI_Output(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_02"); //不 过 建 造 者 的 文 章 说 有 五 个 统 治 者 在 统 治 这 座 城 市 。
	AI_Output(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_03"); //个 统 治 者 都 用 一 种 这 样 的 石 片 作 为 他 们 权 力 的 象 征 。
	AI_Output(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_04"); //我 认 为 这 些 石 片 就 是 我 们 的 问 题 的 关 键 。
};

///////////////////////////////////////////////////////////////////////
//	Info Flut
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Flut(C_INFO)
{
	npc				= KDW_14000_Addon_Saturas_ADW;
	nr				= 5;
	condition		= DIA_Addon_Saturas_Flut_Condition;
	information		= DIA_Addon_Saturas_Flut_Info;
	description		= "内 法 利 尔 斯 告 诉 我 关 于 洪 水 的 事 … …";
};

func int DIA_Addon_Saturas_Flut_Condition()
{
	if ((NefariusADW_Talk2Saturas == TRUE)
	&& (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_Flut_Info()
{
	AI_Output(other, self, "DIA_Addon_Saturas_Flut_15_00"); //内 法 利 尔 斯 告 诉 我 关 于 洪 水 的 事 … …
	AI_Output(self, other, "DIA_Addon_Saturas_Flut_14_02"); //记 录 上 说 ， 亚 达 诺 斯 从 天 堂 降 下 ， 亲 自 惩 罚 那 些 异 教 徒 ， 并 惩 罚 他 们 进 入 死 亡 国 度 。
	AI_Output(self, other, "DIA_Addon_Saturas_Flut_14_03"); //在 他 神 圣 的 愤 怒 激 励 下 ， 大 海 袭 击 了 这 座 城 市 的 建 造 者 ， 并 把 他 们 消 灭 。
	AI_Output(self, other, "DIA_Addon_Saturas_Flut_14_04"); //东 边 的 沼 泽 仍 旧 记 录 着 过 去 的 这 些 事 件 。

	TOPIC_END_Flut = TRUE;
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info AdanosZorn
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_AdanosZorn(C_INFO)
{
	npc				= KDW_14000_Addon_Saturas_ADW;
	nr				= 5;
	condition		= DIA_Addon_Saturas_AdanosZorn_Condition;
	information		= DIA_Addon_Saturas_AdanosZorn_Info;
	description		= "什 么 事 让 亚 达 诺 斯 如 此 愤 怒 ？";
};

func int DIA_Addon_Saturas_AdanosZorn_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Saturas_Flut))
	&& (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_AdanosZorn_Info()
{
	AI_Output(other, self, "DIA_Addon_Saturas_AdanosZorn_15_00"); //什 么 事 让 亚 达 诺 斯 如 此 愤 怒 ？
	AI_Output(self, other, "DIA_Addon_Saturas_AdanosZorn_14_01"); //这 座 城 市 的 神 殿 曾 经 是 一 座 伟 大 、 光 荣 的 建 筑 。
	AI_Output(self, other, "DIA_Addon_Saturas_AdanosZorn_14_02"); //所 有 人 以 它 为 荣 ， 并 向 我 们 的 神 亚 达 诺 斯 祷 告 。
	AI_Output(self, other, "DIA_Addon_Saturas_AdanosZorn_14_03"); //拉 德 梅 斯 ， 指 挥 者 夸 霍 德 隆 的 儿 子 ， 亵 渎 了 神 殿 。
	AI_Output(self, other, "DIA_Addon_Saturas_AdanosZorn_14_04"); //结 果 ， 相 继 沦 为 邪 恶 的 牺 牲 品 。
	AI_Output(self, other, "DIA_Addon_Saturas_AdanosZorn_14_05"); //我 怀 疑 亚 达 诺 斯 无 法 原 谅 此 事 ， 所 以 他 的 报 复 进 攻 了 大 地 。
	AI_Output(self, other, "DIA_Addon_Saturas_AdanosZorn_14_06"); //这 就 更 显 出 我 们 阻 止 瑞 雯 的 重 要 性 。 他 正 在 做 出 完 全 相 同 的 事 … …
};

///////////////////////////////////////////////////////////////////////
//	Info RavenInfos
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_RavenInfos(C_INFO)
{
	npc				= KDW_14000_Addon_Saturas_ADW;
	nr				= 9;
	condition		= DIA_Addon_Saturas_RavenInfos_Condition;
	information		= DIA_Addon_Saturas_RavenInfos_Info;
	permanent		= TRUE;
	description		= "关 于 瑞 雯 … …";
};

var int DIA_Addon_Saturas_RavenInfos_OneTime1;
var int DIA_Addon_Saturas_RavenInfos_OneTime2;
var int DIA_Addon_Saturas_RavenInfos_OneTime3;
var int DIA_Addon_Saturas_RavenInfos_OneTime4;
var int DIA_Addon_Saturas_RavenInfos_OneTime5;

var int Addon_Saturas_Fortuno;

func int DIA_Addon_Saturas_RavenInfos_Condition()
{
	if ((MIS_ADDON_Saturas_GoToRaven == LOG_RUNNING)
	&& (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_RavenInfos_Info()
{
	AI_Output(other, self, "DIA_Addon_Saturas_RavenInfos_15_00"); //关 于 瑞 雯 … …

	var int RavenNeuigkeit;
	RavenNeuigkeit = 0;

	if ((Thorus.aivar[AIV_TalkedToPlayer] == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime1 == FALSE)
	&& (RavenIsInTempel == FALSE))
	{
		AI_Output(other, self, "DIA_Addon_Saturas_RavenInfos_15_01"); //我 去 了 东 边 的 强 盗 营 地 。 瑞 雯 是 他 们 的 领 导 者 。
		AI_Output(other, self, "DIA_Addon_Saturas_RavenInfos_15_02"); //但 是 要 想 接 触 到 瑞 雯 ， 我 必 须 首 先 解 决 一 些 强 盗 。
		AI_Output(self, other, "DIA_Addon_Saturas_RavenInfos_14_03"); //好 。 那 祝 你 好 运 。 但 是 不 要 忘 记 ， 事 态 可 能 随 时 会 变 化 。
		AI_Output(self, other, "DIA_Addon_Saturas_RavenInfos_14_04"); //无 论 如 何 ， 不 能 让 瑞 雯 实 现 他 的 目 标 。
		DIA_Addon_Saturas_RavenInfos_OneTime1 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};

	if ((SC_KnowsRavensGoldmine == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime2 == FALSE))
	{
		AI_Output(other, self, "DIA_Addon_Saturas_RavenInfos_15_05"); //他 有 一 座 金 矿 ， 并 让 囚 犯 挖 掘 黄 金 。
		AI_Output(self, other, "DIA_Addon_Saturas_RavenInfos_14_06"); //听 起 来 像 是 他 。 你 必 须 把 囚 犯 从 那 里 放 出 来 。
		AI_Output(other, self, "DIA_Addon_Saturas_RavenInfos_15_07"); //（ 叹 息 ） 当 然 是 的 。 我 正 在 努 力 。
		DIA_Addon_Saturas_RavenInfos_OneTime2 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};

	if ((SC_KnowsFortunoInfos == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime3 == FALSE))
	{
		AI_Output(other, self, "DIA_Addon_Saturas_RavenInfos_15_08"); //强 盗 之 中 甚 至 有 个 家 伙 宣 称 他 了 解 瑞 雯 的 计 划 。
		AI_Output(other, self, "DIA_Addon_Saturas_RavenInfos_15_09"); //他 叫 佛 图 诺 。 他 说 瑞 雯 想 进 入 神 殿 获 取 一 件 威 力 巨 大 的 宝 物 。
		AI_Output(self, other, "DIA_Addon_Bodo_14_03"); //真 的 ？ 他 还 知 道 更 多 关 于 这 件 宝 物 的 事 吗 ？
		AI_Output(other, self, "DIA_Addon_Saturas_RavenInfos_15_11"); //他 只 能 告 诉 我 ， 瑞 雯 已 经 挖 开 了 一 座 亚 达 诺 斯 的 牧 师 的 坟 墓 。
		AI_Output(self, other, "DIA_Addon_Saturas_RavenInfos_14_12"); //这 座 坟 墓 也 许 有 神 殿 的 关 键 。 你 应 该 去 那 里 查 看 一 下 。
		AI_Output(other, self, "DIA_Addon_Saturas_RavenInfos_15_13"); //瑞 雯 强 迫 囚 犯 们 挖 掘 牧 师 的 坟 墓 。
		AI_Output(self, other, "DIA_Addon_Saturas_RavenInfos_14_14"); //那 不 太 妙 。 你 必 须 尽 快 阻 止 瑞 雯 。
		Addon_Saturas_Fortuno = TRUE;

		DIA_Addon_Saturas_RavenInfos_OneTime3 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};

	if ((RavenIsInTempel == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime4 == FALSE))
	{
		AI_Output(other, self, "DIA_Addon_Saturas_RavenInfos_15_15"); //我 设 法 进 入 了 瑞 雯 住 所 。
		AI_Output(self, other, "DIA_Addon_Saturas_RavenInfos_14_16"); //然 后 ？ 瑞 雯 怎 么 样 ？
		AI_Output(other, self, "DIA_Addon_Saturas_RavenInfos_15_17"); //我 来 的 晚 了 。 他 就 在 我 眼 前 消 失 在 亚 达 诺 斯 神 殿 中 。
		AI_Output(self, other, "DIA_Addon_Saturas_RavenInfos_14_18"); //（ 激 动 的 ） 什 么 ？ ！ 那 是 一 个 大 灾 难 ！ 你 为 什 么 不 跟 上 他 ？ ！

		DIA_Addon_Saturas_RavenInfos_OneTime4 = TRUE;
		MIS_ADDON_Saturas_GoToRaven = LOG_SUCCESS;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};

	if (RavenNeuigkeit != 0)
	{
		var int XP_RavenNeuigkeit;
		XP_RavenNeuigkeit = (RavenNeuigkeit * XP_Ambient);
		B_GivePlayerXP(XP_RavenNeuigkeit);
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Saturas_RavenInfos_14_19"); //你 有 什 么 新 的 报 告 吗 ？
		AI_Output(other, self, "DIA_Addon_Saturas_RavenInfos_15_20"); //还 没 有 。
		AI_Output(self, other, "DIA_Addon_Saturas_RavenInfos_14_21"); //我 建 议 你 不 要 小 看 这 个 瑞 雯 ， 听 到 我 说 的 了 吗 ？
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TuerZu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_TuerZu(C_INFO)
{
	npc				= KDW_14000_Addon_Saturas_ADW;
	nr				= 5;
	condition		= DIA_Addon_Saturas_TuerZu_Condition;
	information		= DIA_Addon_Saturas_TuerZu_Info;
	description		= "我 无 法 跟 随 瑞 雯 ！";
};

func int DIA_Addon_Saturas_TuerZu_Condition()
{
	if ((MIS_ADDON_Saturas_GoToRaven == LOG_SUCCESS)
	&& (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_TuerZu_Info()
{
	AI_Output(other, self, "DIA_Addon_Saturas_TuerZu_15_00"); //我 无 法 跟 踪 瑞 雯 。 他 从 里 面 把 入 口 封 住 了 。
	AI_Output(self, other, "DIA_Addon_Saturas_TuerZu_14_02"); //（ 慌 忙 的 ） 我 必 须 想 一 下 … …
	AI_Output(self, other, "DIA_Addon_Saturas_TuerZu_14_03"); //问 题 是 瑞 雯 怎 么 进 入 的 神 殿 … …
	AI_Output(self, other, "DIA_Addon_Saturas_TuerZu_14_04"); //在 他 通 过 传 送 门 前 做 了 什 么 ？
	AI_Output(other, self, "DIA_Addon_Saturas_TuerZu_15_05"); //他 在 门 前 念 了 一 个 咒 语 。
	AI_Output(self, other, "DIA_Addon_Saturas_TuerZu_14_06"); //那 之 前 呢 ？
	AI_Output(other, self, "DIA_Addon_Saturas_TuerZu_15_07"); //他 打 开 了 一 座 墓 室 。

	if (Addon_Saturas_Fortuno == TRUE)
	{
		AI_Output(other, self, "DIA_Addon_Saturas_TuerZu_15_09"); //我 已 经 向 你 说 过 那 个 … …
		AI_Output(self, other, "DIA_Addon_Saturas_TuerZu_14_10"); //好 ！
	}
	else
	{
		AI_Output(other, self, "DIA_Addon_Saturas_TuerZu_15_08"); //我 只 知 道 ， 我 们 必 须 在 那 里 举 行 同 样 的 仪 式 … …
	};

	AI_Output(self, other, "DIA_Addon_Saturas_TuerZu_14_11"); //（ 考 虑 ） 一 个 仪 式 … …
	AI_Output(self, other, "DIA_Addon_Saturas_TuerZu_14_12"); //（ 领 悟 到 ） 是 的 ！ 一 定 是 那 样 ！
	AI_Output(self, other, "DIA_Addon_Saturas_TuerZu_14_13"); //恐 怕 瑞 雯 自 己 拥 有 了 死 亡 守 护 者 的 力 量 。
	AI_Output(self, other, "DIA_Addon_Saturas_TuerZu_14_14"); //他 是 从 一 个 灵 魂 那 里 获 得 神 殿 的 相 关 知 识 的 ！
	AI_Output(self, other, "DIA_Addon_Saturas_TuerZu_14_15"); //你 必 须 去 米 克 塞 尔 那 里 ， 并 把 这 些 告 诉 他 ！

	Log_CreateTopic(TOPIC_Addon_Quarhodron, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Quarhodron, TOPIC_Addon_Quarhodron_12);

	Saturas_RiesenPlan = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info GhostQuestions
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_GhostQuestions(C_INFO)
{
	npc				= KDW_14000_Addon_Saturas_ADW;
	nr				= 5;
	condition		= DIA_Addon_Saturas_GhostQuestions_Condition;
	information		= DIA_Addon_Saturas_GhostQuestions_Info;
	description		= "我 同 夸 霍 德 隆 交 谈 过 了 。";
};

func int DIA_Addon_Saturas_GhostQuestions_Condition()
{
	if (((Npc_IsDead(Quarhodron)) == FALSE)
	&& (SC_TalkedToGhost == TRUE)
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_GhostQuestions_Info()
{
	AI_Output(other, self, "DIA_Addon_Saturas_GhostQuestions_15_00"); //我 同 夸 霍 德 隆 交 谈 过 了 。
	AI_Output(self, other, "DIA_Addon_Saturas_GhostQuestions_14_01"); //是 吗 ？ 他 说 了 什 么 ？
	AI_Output(other, self, "DIA_Addon_Saturas_GhostQuestions_15_02"); //只 有 我 回 答 几 个 问 题 后 ， 他 才 会 帮 助 我 。
	AI_Output(self, other, "DIA_Addon_Saturas_GhostQuestions_14_03"); //什 么 问 题 ？
	AI_Output(other, self, "DIA_Addon_Saturas_GhostQuestions_15_04"); //我 不 知 道 应 该 怎 么 回 答 。
	AI_Output(self, other, "DIA_Addon_Saturas_GhostQuestions_14_05"); //嗯 … … 我 们 知 道 这 座 城 市 的 学 者 们 在 北 边 修 建 了 一 座 图 书 馆 。
	AI_Output(self, other, "DIA_Addon_Saturas_GhostQuestions_14_06"); //他 们 记 录 了 大 量 过 去 的 事 件 。
	AI_Output(self, other, "DIA_Addon_Saturas_GhostQuestions_14_07"); //也 许 你 可 以 在 那 里 找 到 夸 霍 德 隆 需 要 的 答 案 。

	B_LogEntry(TOPIC_Addon_Quarhodron, TOPIC_Addon_Quarhodron_13);
};

///////////////////////////////////////////////////////////////////////
//	Info TalkedToGhost
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_TalkedToGhost(C_INFO)
{
	npc				= KDW_14000_Addon_Saturas_ADW;
	nr				= 5;
	condition		= DIA_Addon_Saturas_TalkedToGhost_Condition;
	information		= DIA_Addon_Saturas_TalkedToGhost_Info;
	description		= "神 殿 大 门 的 难 题 解 决 了 。";
};

func int DIA_Addon_Saturas_TalkedToGhost_Condition()
{
	if ((Ghost_SCKnowsHow2GetInAdanosTempel == TRUE)
	&& (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_TalkedToGhost_Info()
{
	AI_Output(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_00"); //神 殿 大 门 的 难 题 解 决 了 。
	AI_Output(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_01"); //灵 魂 说 话 了 ？
	AI_Output(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_02"); //是 的 ， 他 说 了 。
	AI_Output(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_03"); //那 么 你 知 道 如 何 进 入 神 殿 了 。？
	AI_Output(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_04"); //正 确 。 他 也 告 诉 了 我 神 殿 中 有 什 么 。
	AI_Output(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_05"); //他 提 到 一 把 非 凡 的 剑 和 亚 达 诺 斯 的 房 间 。
	AI_Output(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_06"); //（ 绝 望 的 ） 亚 达 诺 斯 。 我 们 多 蠢 啊 。 我 们 怎 么 会 如 此 无 知 。？
	AI_Output(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_07"); //（ 震 惊 ） 记 录 中 的 提 示 … …
	AI_Output(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_08"); //（ 兴 奋 的 ） 这 把 剑 只 能 是 ‘ 贝 利 尔 之 爪 ’ 。
	AI_Output(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_09"); //我 们 必 须 尽 快 通 过 那 些 房 间 ， 并 得 到 那 件 武 器 。

	Info_ClearChoices(DIA_Addon_Saturas_TalkedToGhost);
	Info_AddChoice(DIA_Addon_Saturas_TalkedToGhost, "什 么 是 ‘ 贝 利 尔 之 爪 ’ ？", DIA_Addon_Saturas_TalkedToGhost_wasistdas);
	Info_AddChoice(DIA_Addon_Saturas_TalkedToGhost, "什 么 是 亚 达 诺 斯 的 房 间 ？", DIA_Addon_Saturas_TalkedToGhost_kammern);
};

func void DIA_Addon_Saturas_TalkedToGhost_wasistdas()
{
	AI_Output(other, self, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_15_00"); //什 么 是 ‘ 贝 利 尔 之 爪 ’ ？
	AI_Output(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_01"); //它 是 邪 恶 的 化 身 。 贝 利 尔 亲 自 制 造 了 它 。
	AI_Output(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_02"); //任 何 人 拿 上 它 就 拥 有 了 恐 怖 的 破 坏 工 具 。
	AI_Output(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_03"); //持 有 者 越 强 大 ， ‘ 爪 ’ 的 力 量 就 越 强 。
	AI_Output(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_04"); //只 有 拥 有 强 大 精 神 和 坚 定 信 仰 的 人 才 能 抗 拒 它 的 魔 法 。
	AI_Output(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_05"); //现 在 我 完 全 清 楚 了 ， 为 什 么 建 造 者 要 封 印 这 座 山 谷 。
	AI_Output(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_06"); //他 们 把 这 件 邪 恶 的 武 器 带 进 他 们 的 城 市 ， 并 被 它 的 力 量 消 灭 。
	AI_Output(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_07"); //那 些 愚 蠢 的 傻 瓜 在 贪 婪 的 驱 使 下 互 相 毁 灭 。
	AI_Output(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_08"); //残 酷 的 行 为 没 有 止 境 ， 直 到 亚 达 诺 斯 的 愤 怒 扫 平 陆 地 ， 并 将 一 切 沉 入 海 底 。
	AI_Output(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_09"); //实 际 上 ， 传 送 门 的 制 造 者 非 常 完 美 地 把 这 些 东 西 隐 藏 起 来 ， 不 被 其 余 的 世 界 发 现 。
	AI_Output(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_10"); //对 于 这 样 完 美 的 文 明 来 说 ， 这 是 多 么 悲 惨 的 结 局 。
	AI_Output(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_11"); //你 认 识 到 我 们 现 在 任 务 的 紧 迫 性 吗 ？
	AI_Output(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_12"); //瑞 雯 是 一 名 强 壮 的 战 士 ， 并 因 为 他 对 力 量 的 贪 婪 而 盲 目 。
	AI_Output(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_13"); //在 他 的 手 中 ， ‘ 爪 ’ 将 是 一 件 破 坏 的 工 具 。
	AI_Output(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_14"); //一 定 不 能 让 他 拿 到 那 件 武 器 ， 否 则 我 们 都 完 了 。

	Log_CreateTopic(TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Klaue, TOPIC_Addon_Klaue_1);
};

func void DIA_Addon_Saturas_TalkedToGhost_kammern()
{
	AI_Output(other, self, "DIA_Addon_Saturas_TalkedToGhost_kammern_15_00"); //什 么 是 亚 达 诺 斯 的 房 间 ？
	AI_Output(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_01"); //我 们 现 在 知 道 ， 入 口 不 是 唯 一 阻 止 我 们 进 入 神 殿 深 处 的 障 碍 。
	AI_Output(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_02"); //在 神 殿 之 中 ， 有 三 个 房 间 用 来 阻 挡 所 有 的 入 侵 者 。
	AI_Output(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_03"); //建 造 者 的 彩 色 圣 物 是 钥 匙 。
	AI_Output(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_04"); //只 有 我 们 收 集 到 所 有 的 圣 物 ， 并 解 开 他 们 的 谜 语 ， 我 们 才 能 进 入 神 殿 的 内 部 秘 室 。
	AI_Output(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_05"); //我 不 知 道 为 什 么 瑞 雯 能 解 开 神 殿 的 谜 语 ， 但 如 果 是 那 样 的 话 ， 我 们 正 面 临 着 一 个 很 大 的 难 题 。

	Log_CreateTopic(TOPIC_Addon_Kammern, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kammern, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Kammern, LogText_Addon_Relicts);

	Log_CreateTopic(TOPIC_Addon_Relicts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Relicts, LogText_Addon_Relicts);

	Saturas_KnowsHow2GetInTempel = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info RelictsBack
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_RelictsBack(C_INFO)
{
	npc				= KDW_14000_Addon_Saturas_ADW;
	nr				= 5;
	condition		= DIA_Addon_Saturas_RelictsBack_Condition;
	information		= DIA_Addon_Saturas_RelictsBack_Info;
	description		= "我 究 竟 要 怎 么 处 理 神 殿 里 面 的 圣 物 ？";
};

func int DIA_Addon_Saturas_RelictsBack_Condition()
{
	if ((Saturas_SCBroughtAllToken == TRUE)
	&& (Saturas_KnowsHow2GetInTempel == TRUE)
	&& (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_RelictsBack_Info()
{
	AI_Output(other, self, "DIA_Addon_Saturas_RelictsBack_15_00"); //我 究 竟 要 怎 么 处 理 神 殿 里 面 的 圣 物 ？
	AI_Output(self, other, "DIA_Addon_Saturas_RelictsBack_14_03"); //我 们 知 道 的 太 少 了 。 然 而 ， 当 你 进 入 神 殿 之 后 ， 你 还 有 希 望 能 辨 识 出 它 们 的 含 义 。
	AI_Output(self, other, "DIA_Addon_Saturas_RelictsBack_14_05"); //现 在 告 诉 你 我 知 道 的 全 部 ， 我 很 抱 歉 无 法 告 诉 你 更 多 。
	AI_Output(self, other, "DIA_Addon_Saturas_RelictsBack_14_06"); //带 上 圣 物 ， 并 立 刻 进 入 神 殿 。

	CreateInvItems(hero, ItMi_Addon_Stone_01, 1);
	CreateInvItems(hero, ItMi_Addon_Stone_02, 1);
	CreateInvItems(hero, ItMi_Addon_Stone_03, 1);
	CreateInvItems(hero, ItMi_Addon_Stone_04, 1);
	CreateInvItems(hero, ItMi_Addon_Stone_05, 1);
	AI_PrintScreen(PRINT_ItemsErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);

	B_LogEntry(TOPIC_Addon_Kammern, TOPIC_Addon_Kammern_2);

	AI_Output(self, other, "DIA_Addon_Saturas_RelictsBack_14_07"); //愿 亚 达 诺 斯 的 仁 慈 保 佑 我 们 所 有 人 。
	AI_Output(self, other, "DIA_Addon_Saturas_RelictsBack_14_08"); //也 许 还 不 太 迟 。
};

///////////////////////////////////////////////////////////////////////
//	Info RavensDead
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_RavensDead(C_INFO)
{
	npc				= KDW_14000_Addon_Saturas_ADW;
	nr				= 2;
	condition		= DIA_Addon_Saturas_RavensDead_Condition;
	information		= DIA_Addon_Saturas_RavensDead_Info;
	important		= TRUE;
};

func int DIA_Addon_Saturas_RavensDead_Condition()
{
	if (RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_RavensDead_Info()
{
	AI_Output(self, other, "DIA_Addon_Saturas_RavensDead_14_00"); //地 震 已 经 停 止 了 ， 而 且 ， 正 如 我 所 见 ， 你 还 活 着 。
	AI_Output(self, other, "DIA_Addon_Saturas_RavensDead_14_01"); //这 是 说 你 的 任 务 已 经 成 功 了 ？
	AI_Output(other, self, "DIA_Addon_Saturas_RavensDead_15_02"); //是 的 。 瑞 雯 死 了 。
	AI_Output(self, other, "DIA_Addon_Saturas_RavensDead_14_03"); //那 么 都 结 束 了 。 感 谢 亚 达 诺 斯 。
	AI_Output(self, other, "DIA_Addon_Saturas_RavensDead_14_04"); //你 做 得 很 好 ， 我 的 孩 子 。 我 们 都 欠 你 的 情 。
	AI_Output(self, other, "DIA_Addon_Saturas_RavensDead_14_05"); //你 已 经 让 那 强 大 的 武 器 远 离 了 邪 恶 ， 并 恢 复 了 这 里 的 平 衡 。
	AI_Output(self, other, "DIA_Addon_Saturas_RavensDead_14_06"); //当 地 震 结 束 后 ， 我 们 讨 论 了 现 在 可 能 会 发 生 什 么 事 ， 然 后 我 们 得 出 一 个 结 论 。
	AI_Output(self, other, "DIA_Addon_Saturas_RavensDead_14_07"); //去 拿 上 ‘ 贝 利 尔 之 爪 ’ 。 从 现 在 起 ， 它 应 该 由 你 佩 带 。
	AI_Output(self, other, "DIA_Addon_Saturas_RavensDead_14_08"); //在 你 的 手 中 ， 它 也 许 会 成 为 我 们 强 大 的 盟 友 。
	AI_Output(self, other, "DIA_Addon_Saturas_RavensDead_14_09"); //明 智 地 使 用 它 ， 我 的 孩 子 。 愿 亚 达 诺 斯 帮 助 你 。
	AI_Output(self, other, "DIA_Addon_Saturas_RavensDead_14_11"); //我 们 要 留 在 这 里 ， 并 等 候 神 殿 重 新 恢 复 到 它 昔 日 的 辉 煌 。
	AI_Output(self, other, "DIA_Addon_Saturas_RavensDead_14_12"); //只 有 米 克 塞 尔 已 经 去 了 克 霍 里 尼 斯 ， 去 支 持 瓦 卓 斯 。
	AI_Output(self, other, "DIA_Addon_Saturas_RavensDead_14_13"); //瓦 卓 斯 已 经 在 城 里 待 的 太 久 了 。

	Log_CreateTopic(TOPIC_Addon_VatrasAbloesung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_VatrasAbloesung, TOPIC_Addon_VatrasAbloesung_2);

	B_GivePlayerXP(XP_Addon_Saturas_RavensDead);
};

///////////////////////////////////////////////////////////////////////
//	Info FreedMissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_FreedMissingPeople(C_INFO)
{
	npc				= KDW_14000_Addon_Saturas_ADW;
	nr				= 2;
	condition		= DIA_Addon_Saturas_FreedMissingPeople_Condition;
	information		= DIA_Addon_Saturas_FreedMissingPeople_Info;
	description		= "我 已 经 释 放 了 囚 犯。";
};

func int DIA_Addon_Saturas_FreedMissingPeople_Condition()
{
	if (MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_FreedMissingPeople_Info()
{
	AI_Output(other, self, "DIA_Addon_Saturas_FreedMissingPeople_15_00"); //我 已 经 释 放 了 囚 犯 。
	AI_Output(self, other, "DIA_Addon_Saturas_FreedMissingPeople_14_01"); //非 常 好 。 愿 他 们 安 全 返 回 ， 并 听 到 故 土 的 声 音 。
	B_GivePlayerXP(XP_Addon_Saturas_FreedMissingPeople);
};

///////////////////////////////////////////////////////////////////////
//	Info BeliarsWeapon
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_BeliarsWeapon(C_INFO)
{
	npc				= KDW_14000_Addon_Saturas_ADW;
	nr				= 5;
	condition		= DIA_Addon_Saturas_BeliarsWeapon_Condition;
	information		= DIA_Addon_Saturas_BeliarsWeapon_Info;
	description		= "我 已 经 拿 到 了 ‘ 贝 利 尔 之 爪 ’ 。";
};

func int DIA_Addon_Saturas_BeliarsWeapon_Condition()
{
	if ((C_ScHasBeliarsWeapon())
	&& (RavenIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_BeliarsWeapon_Info()
{
	AI_UnequipWeapons(hero);
	AI_Output(other, self, "DIA_Addon_Saturas_BeliarsWeapon_15_00"); //我 已 经 拿 到 了 ‘ 贝 利 尔 之 爪 ’ 。

	if ((Npc_HasItems(hero, ItMw_BeliarWeapon_Raven))
	&& (SC_FailedToEquipBeliarsWeapon == TRUE))
	{
		AI_Output(other, self, "DIA_Addon_Saturas_BeliarsWeapon_15_01"); //但 是 我 无 法 再 带 着 它 。
	};

	AI_Output(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_02"); //‘ 贝 利 尔 之 爪 ’ 是 一 件 非 常 特 殊 的 武 器 。
	AI_Output(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_03"); //它 有 自 己 的 思 想 和 意 志 。
	AI_Output(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_04"); //你 ， 现 在 持 有 这 件 强 大 武 器 的 人 ， 就 是 他 的 统 治 者 和 主 人 。
	AI_Output(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_05"); //它 是 你 的 一 部 分 ， 并 适 应 你 的 能 力 。
	AI_Output(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_06"); //然 而 ， 它 将 无 法 按 照 它 自 己 的 意 志 行 事 。
	AI_Output(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_07"); //只 有 贝 利 尔 自 己 才 能 强 迫 它 服 从 你 。

	Info_ClearChoices(DIA_Addon_Saturas_BeliarsWeapon);
	Info_AddChoice(DIA_Addon_Saturas_BeliarsWeapon, "为 什 么 贝 利 尔 要 帮 助 我 ？", DIA_Addon_Saturas_BeliarsWeapon_besser);
	Info_AddChoice(DIA_Addon_Saturas_BeliarsWeapon, "我 要 怎 么 使 用 这 件 武 器 ？", DIA_Addon_Saturas_BeliarsWeapon_wastun);
};

func void DIA_Addon_Saturas_BeliarsWeapon_wastun()
{
	AI_Output(other, self, "DIA_Addon_Saturas_BeliarsWeapon_wastun_15_00"); //我 要 怎 么 使 用 这 件 武 器 ？
	AI_Output(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_01"); //他 在 你 的 手 上 。 你 已 经 征 服 了 这 件 武 器 ， 现 在 你 是 它 的 主 人。
	AI_Output(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_02"); //我 只 能 向 你 建 议 你 可 以 利 用 它 做 什 么 。
	AI_Output(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_03"); //要 么 你 把 它 给 我 ， 然 后 我 来 负 责 不 让 它 造 成 更 大 的 伤 害 … …
	AI_Output(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_04"); //… … 或 者 你 在 战 斗 中 强 行 装 备 并 使 用 它 。
	Info_AddChoice(DIA_Addon_Saturas_BeliarsWeapon, "你 不 能 把 武 器 放 在 安 全 的 地 方 吗 ？", DIA_Addon_Saturas_BeliarsWeapon_geben);
};

func void DIA_Addon_Saturas_BeliarsWeapon_geben()
{
	AI_Output(other, self, "DIA_Addon_Saturas_BeliarsWeapon_geben_15_00"); //你 不 能 把 武 器 放 在 安 全 的 地 方 吗 ？
	// AI_Output(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_01"); // Du bist der Bezwinger des Bösen. Deine Entscheidungen bestimmen das Geschick dieser Welt.
	// AI_Output(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_02"); // Wenn du dich dazu entschließt, die Klaue aus der Hand zu geben, ist dein Schicksal nicht mehr an sie gebunden.
	AI_Output(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_03"); //如 果 你 把 它 给 我 ， 那 我 会 确 保 它 不 会 造 成 任 何 伤 害 ， 那 样 它 就 不 会 再 被 滥 用 。
	AI_Output(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_04"); //那 么 仔 细 考 虑 一 下 你 要 怎 么 做 。

	Log_CreateTopic(TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Klaue, TOPIC_Addon_Klaue_2);
};

func void DIA_Addon_Saturas_BeliarsWeapon_besser()
{
	AI_Output(other, self, "DIA_Addon_Saturas_BeliarsWeapon_besser_15_00"); //为 什 么 贝 利 尔 要 帮 助 我 ？
	AI_Output(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_01"); //只 有 贝 利 尔 的 祈 祷 者 能 如 愿 以 偿 。
	AI_Output(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_02"); //但 是 要 小 心 ， 贝 利 尔 非 常 恶 毒 。
	AI_Output(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_03"); //如 果 你 引 起 了 他 的 愤 怒 ， 那 他 就 会 让 你 感 觉 到 它 。

	Log_CreateTopic(TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Klaue, TOPIC_Addon_Klaue_3);

	B_Say(other, self, "$VERSTEHE");
};

///////////////////////////////////////////////////////////////////////
//	Info PermENDE_ADDON
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_PermENDE_ADDON(C_INFO)
{
	npc				= KDW_14000_Addon_Saturas_ADW;
	nr				= 5;
	condition		= DIA_Addon_Saturas_PermENDE_ADDON_Condition;
	information		= DIA_Addon_Saturas_PermENDE_ADDON_Info;
	permanent		= TRUE;
	description		= "你 现 在 要 做 什 么 ？";
};

func int DIA_Addon_Saturas_PermENDE_ADDON_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Saturas_RavensDead))
	{
		return TRUE;
	};
};

var int DIA_Addon_Saturas_PermENDE_ADDON_OneTime;
func void DIA_Addon_Saturas_PermENDE_ADDON_Info()
{
	AI_Output(other, self, "DIA_Addon_Saturas_PermENDE_ADDON_15_00"); //你 现 在 要 做 什 么 ？
	AI_Output(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_01"); //我 们 会 留 在 这 里 ， 帮 助 神 殿 恢 复 它 往 昔 的 光 辉 。
	AI_Output(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_02"); //它 的 城 墙 已 经 在 这 样 可 悲 的 环 境 中 耸 立 了 很 久 了 。
	if (DIA_Addon_Saturas_PermENDE_ADDON_OneTime == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_03"); //我 们 一 直 关 注 着 你 ， 我 的 孩 子 … …
		AI_Output(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_04"); //我 很 高 兴 我 没 有 看 错 你 。 你 是 平 衡 的 保 护 者 ， 不 用 再 怀 疑 了 。
		AI_Output(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_05"); //没 有 你 的 勇 气 和 力 量 ， 这 座 克 霍 里 尼 斯 岛 一 定 会 被 淹 没 。 我 们 感 谢 你 ， 并 在 我 们 的 思 想 中 尊 敬 你 。
		AI_Output(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_06"); //去 完 成 你 的 其 它 任 务 吧 ， 并 给 这 个 世 界 带 来 平 衡 和 平 和 。
		AI_Output(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_07"); //现 在 去 完 成 你 的 使 命 ， 保 护 者 。 我 们 的 祈 祷 会 伴 随 着 你 。
		DIA_Addon_Saturas_PermENDE_ADDON_OneTime = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BeliarWeapGeben
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_BeliarWeapGeben(C_INFO)
{
	npc				= KDW_14000_Addon_Saturas_ADW;
	nr				= 5;
	condition		= DIA_Addon_Saturas_BeliarWeapGeben_Condition;
	information		= DIA_Addon_Saturas_BeliarWeapGeben_Info;
	description		= "拿 起 ‘ 贝 利 尔 之 爪 ’ 并 毁 掉 它 。";
};

func int DIA_Addon_Saturas_BeliarWeapGeben_Condition()
{
	if ((C_ScHasBeliarsWeapon())
	&& (RavenIsDead == TRUE)
	&& (Npc_KnowsInfo(other, DIA_Addon_Saturas_BeliarsWeapon)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_BeliarWeapGeben_Info()
{
	AI_Output(other, self, "DIA_Addon_Saturas_BeliarWeapGeben_15_00"); //拿 起 ‘ 贝 利 尔 之 爪 ’ 并 毁 掉 它 。
	AI_Output(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_01"); //如 你 所 愿 ， 我 的 孩 子 。 把 它 给 我 。
	B_ClearBeliarsWeapon();
	AI_PrintScreen(PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2); // "1 Gegenstand gegeben"
	AI_Output(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_02"); //那 样 它 就 不 会 再 造 成 任 何 伤 害 ， 我 会 把 它 沉 到 深 海 之 中 。
	AI_Output(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_03"); //亚 达 诺 斯 的 智 慧 将 会 监 视 着 它 。
	TOPIC_END_Klaue = TRUE;
	B_GivePlayerXP(XP_Addon_BeliarsWeaponAbgegeben);
	Saturas_KlaueInsMeer = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info PreTeachCircle
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ADW_PreTeachCircle(C_INFO)
{
	npc				= KDW_14000_Addon_Saturas_ADW;
	nr				= 10;
	condition		= DIA_Addon_Saturas_ADW_PreTeachCircle_Condition;
	information		= DIA_Addon_Saturas_ADW_PreTeachCircle_Info;
	description		= "你 能 教 我 魔 法 之 环 吗？";
};

func int DIA_Addon_Saturas_ADW_PreTeachCircle_Condition()
{
	if ((hero.guild == GIL_KDF)
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_ADW_PreTeachCircle_Info()
{
	AI_Output(other, self, "DIA_Addon_Saturas_ADW_PreTeachCircle_15_00"); //你 能 教 我 魔 法 之 环 吗？
	AI_Output(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_01"); //你 是 一 名 火 魔 法 师 。 皮 罗 卡 对 此 会 怎 么 说 ？
	AI_Output(other, self, "DIA_Addon_Saturas_ADW_PreTeachCircle_15_02"); //没 人 需 要 知 道 。
	AI_Output(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_03"); //（ 叹 息 ） 我 看 得 出 你 是 认 真 的 ， 那 么 我 会 遵 从 你 的 要 求 。

	if ((RavenIsDead == FALSE))
	{
		AI_Output(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_04"); //然 而 ， 我 感 觉 我 们 的 知 识 落 入 了 错 误 之 人 的 手 中 ， 你 将 不 会 再 得 到 我 的 帮 助 。
		AI_Output(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_05"); //那 么 你 最 好 不 要 让 我 失 望 。
	};

	Saturas_Addon_TeachCircle = TRUE;

	Log_CreateTopic(TOPIC_Addon_KDWTeacher, LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher, LogText_Addon_SaturasTeach);
};

///////////////////////////////////////////////////////////////////////
//	Info TEACHCIRCLE
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ADW_CIRCLE(C_INFO)
{
	npc				= KDW_14000_Addon_Saturas_ADW;
	nr				= 99;
	condition		= DIA_Addon_Saturas_ADW_CIRCLE_Condition;
	information		= DIA_Addon_Saturas_ADW_CIRCLE_Info;
	permanent		= TRUE;
	description		= "我 想 要 学 习 更 高 级 的 魔 法 。";
};

var int DIA_Addon_Saturas_ADW_CIRCLE_NoPerm;
func int DIA_Addon_Saturas_ADW_CIRCLE_Condition()
{
	if ((Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) >= 1)
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) < 6)
	&& (Saturas_Addon_TeachCircle == TRUE)
	&& (DIA_Addon_Saturas_ADW_CIRCLE_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_ADW_CIRCLE_Info()
{
	AI_Output(other, self, "DIA_Addon_Saturas_ADW_CIRCLE_15_00"); //我 想 要 学 习 更 高 级 的 魔 法 。

	if ((Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 1)
	&& (Kapitel >= 2))
	{
		if (B_TeachMagicCircle(self, other, 2))
		{
			AI_Output(self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_01"); //是 的 ， 你 已 经 做 好 准 备 增 加 你 的 知 识 。
			AI_Output(self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_02"); //现 在 开 始 第 二 个 魔 法 之 环 。 愿 亚 达 诺 斯 赐 予 你 力 量 ， 让 你 明 智 地 使 用 你 已 经 掌 握 的 能 力 。
		};
	}
	else if ((Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 2)
	&& (Kapitel >= 3))
	{
		if (B_TeachMagicCircle(self, other, 3))
		{
			AI_Output(self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_03"); //是 的 ， 时 机 恰 好 。 现 在 开 始 第 三 个 魔 法 之 环 。
			AI_Output(self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_04"); //你 的 知 识 现 在 可 以 让 你 施 展 全 新 的 、 更 加 强 大 的 魔 法 。 小 心 使 用 它 。
		};
	}
	else if ((Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 3)
	&& (MIS_ReadyforChapter4 == TRUE))
	{
		if (B_TeachMagicCircle(self, other, 4))
		{
			AI_Output(self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_05"); //时 机 已 经 到 来 。 你 已 经 准 备 好 开 始 学 习 第 四 个 魔 法 之 环 了 。
			AI_Output(self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_06"); //你 的 话 语 和 行 动 现 在 代 表 着 强 大 。 永 远 要 慎 重 并 理 智 地 选 择 你 的 新 魔 法 。
		};
	}
	else if ((Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 4)
	&& (Kapitel >= 5))
	{
		if (B_TeachMagicCircle(self, other, 5))
		{
			AI_Output(self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_07"); //你 现 在 将 获 得 特 权 开 始 学 习 第 五 个 魔 法 之 环 。
			AI_Output(self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_08"); //你 现 在 即 将 学 习 的 魔 法 是 真 正 具 有 毁 灭 性 的 。
			AI_Output(self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_09"); //要 小 心 你 的 力 量 ， 不 要 屈 从 华 丽 的 妄 想 。
		};
	}
	else if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 5)
	{
		AI_Output(self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_10"); //从 现 在 起 ， 那 不 再 是 我 的 任 务 了。
		AI_Output(self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_11"); //要 想 学 习 最 后 一 个 魔 法 之 环 ， 你 必 须 去 火 魔 法 师 的 修 道 院 。
		DIA_Addon_Saturas_ADW_CIRCLE_NoPerm = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_12"); //对 你 来 说 还 是 太 快 了 。 以 后 再 来 。
	};
};
