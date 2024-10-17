var int URSHAK_SUCKED;
//*********************************************************************
//	Info EXIT
//*********************************************************************
instance DIA_Urshak_EXIT(C_INFO)
{
	npc				= NONE_110_Urshak;
	nr				= 999;
	condition		= DIA_Urshak_EXIT_Condition;
	information		= DIA_Urshak_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Urshak_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Urshak_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_HALLO(C_INFO)
{
	npc				= NONE_110_Urshak;
	nr				= 5;
	condition		= DIA_Urshak_HALLO_Condition;
	information		= DIA_Urshak_HALLO_Info;
	important		= TRUE;
};

func int DIA_Urshak_HALLO_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_HALLO_Info()
{
	AI_Output(self, other, "DIA_Urshak_HALLO_18_00"); //（ 挑 衅 的 ）KHROTOK JABARTH！ ！ ！
	AI_Output(self, other, "DIA_Urshak_HALLO_18_01"); //等 一 下 ！ 我 认 识 你 。 你 这 个 声 音 温 和 的 人 类 朋 友 。
	AI_Output(self, other, "DIA_Urshak_HALLO_18_02"); //朋 友 杀 死 邪 恶 魔 鬼 克 鲁 沙 克 。

	B_GivePlayerXP(XP_UrshakFound);

	Log_CreateTopic(TOPIC_Urshak, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Urshak, LOG_RUNNING);
	B_LogEntry(TOPIC_Urshak, TOPIC_Urshak_1);

	Info_ClearChoices(DIA_Urshak_HALLO);
	Info_AddChoice(DIA_Urshak_HALLO, "你 在 这 里 做 什 么 ？", DIA_Urshak_HALLO_freund);
	Info_AddChoice(DIA_Urshak_HALLO, "一 个 会 讲 话 的 兽 人 ？", DIA_Urshak_HALLO_wer);
};

func void DIA_Urshak_HALLO_wer()
{
	AI_Output(other, self, "DIA_Urshak_HALLO_wer_15_00"); //一 个 会 讲 话 的 兽 人 ？
	AI_Output(self, other, "DIA_Urshak_HALLO_wer_18_01"); //你 忘 记 了 尤 尔 沙 克 ？ 那 让 我 悲 伤 。
	AI_Output(self, other, "DIA_Urshak_HALLO_wer_18_02"); //尤 尔 沙 克 帮 助 朋 友 很 多 天 ， 在 尤 鲁-穆 鲁 到 我 的 村 庄 前 。 所 有 兽 人 重 视 朋 友 ， 然 后 朋 友 不 死 在 兽 人 手 上 。
	AI_Output(self, other, "DIA_Urshak_HALLO_wer_18_03"); //然 后 朋 友 进 入 兽 人 神 殿 深 处 ， 并 消 灭 邪 恶 魔 鬼 。 许 多 天 前 。 你 不 记 得 吗 ？
};

func void DIA_Urshak_HALLO_freund()
{
	AI_Output(other, self, "DIA_Urshak_HALLO_freund_15_00"); //你 选 了 一 个 好 笑 的 时 候 来 和 我 见 面 。 我 差 点 杀 了 你 。 你 在 这 里 干 什 么 ？
	AI_Output(self, other, "DIA_Urshak_HALLO_freund_18_01"); //尤 尔 沙 克 调 查 土 地 ， 看 土 地 和 我 的 人 变 成 什 么 样 。
	Info_ClearChoices(DIA_Urshak_HALLO);
};

///////////////////////////////////////////////////////////////////////
//	Info WasmachenOrks
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_WASMACHENORKS(C_INFO)
{
	npc				= NONE_110_Urshak;
	nr				= 6;
	condition		= DIA_Urshak_WASMACHENORKS_Condition;
	information		= DIA_Urshak_WASMACHENORKS_Info;
	description		= "为 什 么 兽 人 要 攻 击 人 类 ？";
};

func int DIA_Urshak_WASMACHENORKS_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Urshak_HALLO))
	&& (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_WASMACHENORKS_Info()
{
	AI_Output(other, self, "DIA_Urshak_WASMACHENORKS_15_00"); //为 什 么 兽 人 要 攻 击 人 类 ？
	AI_Output(self, other, "DIA_Urshak_WASMACHENORKS_18_01"); //尤 尔 沙 克 总 是 告 诉 兽 人 人 民 ， 人 类 不 邪 恶 ， 很 多 好 朋 友 那 里 。
	AI_Output(self, other, "DIA_Urshak_WASMACHENORKS_18_02"); //但 是 萨 满 不 听 尤 尔 沙 克 。 尤 尔 沙 克 不 被 人 们 喜 欢 。
	AI_Output(self, other, "DIA_Urshak_WASMACHENORKS_18_03"); //所 以 尤 尔 沙 克 不 知 道 对 抗 人 类 的 重 大 计 划 。
	B_LogEntry(TOPIC_Urshak, TOPIC_Urshak_2);
};

///////////////////////////////////////////////////////////////////////
//	Info soviele
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_SOVIELE(C_INFO)
{
	npc				= NONE_110_Urshak;
	nr				= 7;
	condition		= DIA_Urshak_SOVIELE_Condition;
	information		= DIA_Urshak_SOVIELE_Info;
	description		= "你 们 为 什 么 会 突 然 出 现 这 么 多 ？";
};

func int DIA_Urshak_SOVIELE_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Urshak_HALLO))
	&& (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_SOVIELE_Info()
{
	AI_Output(other, self, "DIA_Urshak_SOVIELE_15_00"); //你 们 为 什 么 会 突 然 出 现 这 么 多 ？
	AI_Output(self, other, "DIA_Urshak_SOVIELE_18_01"); //兽 人 来 自 山 区 ， 但 是 其 它 人 是 乘 船 来 的 ， 并 且 建 造 了 大 围 墙 。
};

///////////////////////////////////////////////////////////////////////
//	Info Zaun
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_ZAUN(C_INFO)
{
	npc				= NONE_110_Urshak;
	nr				= 8;
	condition		= DIA_Urshak_ZAUN_Condition;
	information		= DIA_Urshak_ZAUN_Info;
	description		= "在 东 边 的 兽 人 长 围 墙 后 面 隐 藏 着 什 么 ？";
};

func int DIA_Urshak_ZAUN_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Urshak_HALLO))
	&& (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_ZAUN_Info()
{
	AI_Output(other, self, "DIA_Urshak_ZAUN_15_00"); //在 东 边 的 兽 人 长 围 墙 后 面 隐 藏 着 什 么 ？
	AI_Output(self, other, "DIA_Urshak_ZAUN_18_01"); //兽 人 总 是 为 战 争 修 建 大 围 墙 和 帐 篷 。
	AI_Output(self, other, "DIA_Urshak_ZAUN_18_02"); //围 墙 对 战 争 有 好 处 。 隐 蔽 军 队 实 力 ， 并 保 护 兽 人 。
};

///////////////////////////////////////////////////////////////////////
//	Info washastduvor
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_WASHASTDUVOR(C_INFO)
{
	npc				= NONE_110_Urshak;
	nr				= 9;
	condition		= DIA_Urshak_WASHASTDUVOR_Condition;
	information		= DIA_Urshak_WASHASTDUVOR_Info;
	description		= "你 现 在 打 算 做 什 么 ？";
};

func int DIA_Urshak_WASHASTDUVOR_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Urshak_HALLO))
	&& (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_WASHASTDUVOR_Info()
{
	AI_Output(other, self, "DIA_Urshak_WASHASTDUVOR_15_00"); //你 现 在 打 算 做 什 么 ？
	AI_Output(self, other, "DIA_Urshak_WASHASTDUVOR_18_01"); //尤 尔 沙 克 等 候 兽 人 侦 察 兵 带 尤 尔 沙 克 去 见 霍 什 帕 克 。
	AI_Output(other, self, "DIA_Urshak_WASHASTDUVOR_15_02"); //谁 是 霍 什 帕 克 ？
	AI_Output(self, other, "DIA_Urshak_WASHASTDUVOR_18_03"); //非 常 伟 大 的 萨 满 。 在 战 士 中 有 很 大 影 响 力 ， 并 为 兽 人 制 订 重 大 计 划 。

	B_LogEntry(TOPIC_Urshak, TOPIC_Urshak_3);

	Info_ClearChoices(DIA_Urshak_WASHASTDUVOR);

	Info_AddChoice(DIA_Urshak_WASHASTDUVOR, DIALOG_BACK, DIA_Urshak_WASHASTDUVOR_weiter);
	Info_AddChoice(DIA_Urshak_WASHASTDUVOR, "我 在 哪 里 能 找 到 这 个 霍 什 帕 克 ？", DIA_Urshak_WASHASTDUVOR_);
	Info_AddChoice(DIA_Urshak_WASHASTDUVOR, "那 你 为 什 么 不 去 找 他 ？", DIA_Urshak_WASHASTDUVOR_hoshpak);
};

func void DIA_Urshak_WASHASTDUVOR_hoshpak()
{
	AI_Output(other, self, "DIA_Urshak_WASHASTDUVOR_hoshpak_15_00"); //那 你 为 什 么 不 去 找 他 ？
	AI_Output(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_01"); //尤 尔 沙 克 试 了 又 试 ， 恢 复 荣 誉 和 萨 满 议 会 里 的 位 置 。
	AI_Output(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_02"); //但 是 直 到 现 在 ， 霍 什 帕 克 不 听 尤 尔 沙 克 。 兽 人 杀 死 尤 尔 沙 克 ， 如 果 看 到 他 没 有 侦 察 兵 。 尤 尔 沙 克 必 须 和 霍 什 帕 克 谈 。
	AI_Output(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_03"); //今 天 也 许 很 幸 运 。
};

func void DIA_Urshak_WASHASTDUVOR_()
{
	AI_Output(other, self, "DIA_Urshak_WASHASTDUVOR_Urshak_15_00"); //我 在 哪 里 能 找 到 这 个 霍 什 帕 克 ？
	AI_Output(self, other, "DIA_Urshak_WASHASTDUVOR_Urshak_18_01"); //霍 什 帕 克 待 在 能 够 从 森 林 上 方 看 到 兽 人 战 士 的 大 火 山 顶 上 ， 那 样 他 能 够 控 制 战 士 们 。
};

func void DIA_Urshak_WASHASTDUVOR_weiter()
{
	Info_ClearChoices(DIA_Urshak_WASHASTDUVOR);
};

///////////////////////////////////////////////////////////////////////
//	Info hoshpakDead
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_HOSHPAKDEAD(C_INFO)
{
	npc				= NONE_110_Urshak;
	nr				= 9;
	condition		= DIA_Urshak_HOSHPAKDEAD_Condition;
	information		= DIA_Urshak_HOSHPAKDEAD_Info;
	description		= "霍 什 帕 克 死 了 。";
};

func int DIA_Urshak_HOSHPAKDEAD_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Urshak_WASHASTDUVOR))
	&& (Npc_IsDead(Hosh_pak))
	&& (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_HOSHPAKDEAD_Info()
{
	AI_Output(other, self, "DIA_Urshak_HOSHPAKDEAD_15_00"); //霍 什 帕 克 死 了 。
	AI_Output(self, other, "DIA_Urshak_HOSHPAKDEAD_18_01"); //霍 什 帕 克 死 了 ？RUSHTASOK！
	AI_Output(self, other, "DIA_Urshak_HOSHPAKDEAD_18_02"); //我 的 心 带 着 沉 重 的 负 担 。 尤 尔 沙 克 永 远 不 会 忘 记 伟 大 的 兽 人 培 养 萨 满 霍 什 帕 克 。
	AI_Output(other, self, "DIA_Urshak_HOSHPAKDEAD_15_03"); //我 明 白 。 霍 什 帕 克 是 你 的 老 师 。
	AI_Output(self, other, "DIA_Urshak_HOSHPAKDEAD_18_04"); //尤 尔 沙 克 现 在 必 须 带 着 悲 痛 的 负 担 ， 必 须 给 霍 什 帕 克 最 后 的 仪 式 。 尤 尔 沙 克 必 须 走 。
	AI_Output(self, other, "DIA_Urshak_HOSHPAKDEAD_18_05"); //朋 友 最 好 穿 过 关 卡 。 这 里 太 危 险 。
	AI_Output(self, other, "DIA_Urshak_HOSHPAKDEAD_18_06"); //如 果 人 类 朋 友 也 死 ， 尤 尔 沙 克 悲 伤 。

	B_LogEntry(TOPIC_Urshak, TOPIC_Urshak_4);

	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self, 20);
	Npc_ExchangeRoutine(self, "Start");
	Wld_InsertNpc(OrcWarrior_Rest, "FP_CAMPFIRE_HOSHPAK_01");
	Wld_InsertNpc(OrcWarrior_Rest, "FP_CAMPFIRE_HOSHPAK_02");
};

///////////////////////////////////////////////////////////////////////
//	Info geh
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_GEH(C_INFO)
{
	npc				= NONE_110_Urshak;
	condition		= DIA_Urshak_GEH_Condition;
	information		= DIA_Urshak_GEH_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Urshak_GEH_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Urshak_HOSHPAKDEAD))
	&& ((Npc_GetDistToWP(self, "OW_HOSHPAK_04") < 1000) == FALSE)
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_GEH_Info()
{
	AI_Output(self, other, "DIA_Urshak_GEH_18_00"); //朋 友 最 好 立 刻 穿 过 关 卡 。
	Npc_SetRefuseTalk(self, 10);
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HoshpakRache
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_HOSHPAKRACHE(C_INFO)
{
	npc				= NONE_110_Urshak;
	condition		= DIA_Urshak_HOSHPAKRACHE_Condition;
	information		= DIA_Urshak_HOSHPAKRACHE_Info;
	important		= TRUE;
};

func int DIA_Urshak_HOSHPAKRACHE_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Urshak_HOSHPAKDEAD))
	&& ((Npc_GetDistToWP(self, "OW_HOSHPAK_04") <= 1000))
	&& (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_HOSHPAKRACHE_Info()
{
	AI_Output(self, other, "DIA_Urshak_HOSHPAKRACHE_18_00"); //（ 挑 衅 的 ）KHROTOK！ 我 知 道 当 霍 什 帕 克 被 杀 的 时 候 你 在 那 里 。 你 犯 了 一 个 大 错 误 ， 陌 生 人 。
	AI_Output(other, self, "DIA_Urshak_HOSHPAKRACHE_15_01"); //你 知 道 你 取 代 了 他 的 位 置 。 你 欺 骗 了 我 。
	AI_Output(other, self, "DIA_Urshak_HOSHPAKRACHE_15_02"); //你 在 你 的 人 民 中 的 地 位 比 你 想 要 接 受 的 更 高 。 现 在 你 只 不 过 是 一 个 邪 恶 的 工 具 。
	AI_Output(self, other, "DIA_Urshak_HOSHPAKRACHE_18_03"); //陌 生 人 正 确 。 尤 尔 沙 克 现 在 只 有 恨 和 复 仇 。
	AI_Output(self, other, "DIA_Urshak_HOSHPAKRACHE_18_04"); //尤 尔 沙 克 发 现 大 错 误 相 信 邪 恶 人 类 。 尤 尔 沙 克 后 悔 叫 人 类 朋 友 和 帮 助 他 们 不 被 杀 死 。
	AI_Output(self, other, "DIA_Urshak_HOSHPAKRACHE_18_05"); //陌 生 人 最 后 离 开 山 谷 ， 穿 过 关 卡 。 尤 尔 沙 克 现 在 不 能 杀 死 陌 生 人 。 萨 满 的 荣 誉 命 令 尤 尔 沙 克 不 杀 。
	AI_Output(self, other, "DIA_Urshak_HOSHPAKRACHE_18_06"); //下 次 我 们 见 面 ， 我 们 是 敌 人 。 你 现 在 最 好 走 。
	AI_StopProcessInfos(self);
	URSHAK_SUCKED = TRUE;
	B_LogEntry(TOPIC_Urshak, TOPIC_Urshak_5);
	B_GivePlayerXP(XP_UrshakBecomesShaman);
};

///////////////////////////////////////////////////////////////////////
//	Info keineWahl
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_KEINEWAHL(C_INFO)
{
	npc				= NONE_110_Urshak;
	condition		= DIA_Urshak_KEINEWAHL_Condition;
	information		= DIA_Urshak_KEINEWAHL_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Urshak_KEINEWAHL_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Urshak_HOSHPAKRACHE))
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Urshak_KEINEWAHL_Info()
{
	AI_Output(self, other, "DIA_Urshak_KEINEWAHL_18_00"); //你 走 。 我 不 跟 陌 生 人 说 话 。
	AI_StopProcessInfos(self);
	URSHAK_SUCKED = TRUE;
};
