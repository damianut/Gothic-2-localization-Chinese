// ************************************************************
// 			  				FIRST EXIT
// ************************************************************
instance DIA_Xardas_FirstEXIT(C_INFO)
{
	npc				= NONE_100_Xardas;
	nr				= 999;
	condition		= DIA_Xardas_FirstEXIT_Condition;
	information		= DIA_Xardas_FirstEXIT_Info;
	description		= "我 会 尽 快 上 路 ！ （ 结 束 ）";
};

func int DIA_Xardas_FirstEXIT_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Xardas_TODO))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_FirstEXIT_Info()
{
	AI_Output(other, self, "DIA_Xardas_FirstEXIT_15_00"); //我 会 尽 快 上 路 ！
	AI_Output(self, other, "DIA_Xardas_FirstEXIT_14_01"); //好 ！ 还 有 一 件 事 ： 不 要 告 诉 任 何 人 你 与 我 说 过 话 。 最 重 要 的 是 ， 不 要 告 诉 任 何 魔 法 师 。
	AI_Output(self, other, "DIA_Xardas_FirstEXIT_14_02"); //因 为 我 已 经 被 驱 逐 了 ， 火 之 环 也 以 为 我 死 了 - 那 是 一 件 好 事 。

	AI_StopProcessInfos(self);

	B_Kapitelwechsel(1, NEWWORLD_ZEN); // Joly: muß auf jeden Fall hier kommen. Allein schon wegen XP_AMBIENT!

	Npc_ExchangeRoutine(self, "START");
};

// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Xardas_EXIT(C_INFO)
{
	npc				= NONE_100_Xardas;
	nr				= 999;
	condition		= DIA_Xardas_EXIT_Condition;
	information		= DIA_Xardas_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Xardas_EXIT_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				   Hallo
// ************************************************************
var int Addon_zuerst;
// ------------------------------------------------------------
instance DIA_Xardas_Hello(C_INFO)
{
	npc				= NONE_100_Xardas;
	nr				= 1;
	condition		= DIA_Xardas_Hello_Condition;
	information		= DIA_Xardas_Hello_Info;
	important		= TRUE;
};

func int DIA_Xardas_Hello_Condition()
{
	return TRUE;
};

func void DIA_Xardas_Hello_Info()
{
	AI_Output(self, other, "DIA_Addon_Xardas_Hello_14_00"); //又 是 你 ！ （ 微 笑 ） 我 从 来 没 想 过 我 们 还 能 再 见 面 。
	AI_Output(other, self, "DIA_Addon_Xardas_Hello_15_01"); //我 感 觉 好 像 在 一 堆 石 头 下 面 趟 了 三 个 星 期 。
	AI_Output(self, other, "DIA_Addon_Xardas_Hello_14_02"); //嗯 ， 你 的 确 是 的 。 只 有 你 盔 甲 中 的 魔 法 才 能 让 你 活 下 来 。
	AI_Output(self, other, "DIA_Addon_Xardas_Hello_14_03"); //我 还 担 心 我 不 能 把 你 从 神 殿 的 废 墟 里 救 出 来 。
	AI_Output(self, other, "DIA_Addon_Xardas_Hello_14_04"); //但 是 不 用 再 提 那 些 事 了 ， 现 在 你 到 这 里 了 。
	AI_Output(self, other, "DIA_Addon_Xardas_Hello_14_05"); //有 一 个 新 的 威 胁 需 要 我 们 来 处 理 。

	Info_ClearChoices(DIA_Xardas_Hello);
	Info_AddChoice(DIA_Xardas_Hello, "我 们 现 在 有 充 分 的 时 间 。 沉 睡 者 已 经 被 击 败 了 。", DIA_Addon_Xardas_Hello_Dragons);
	Info_AddChoice(DIA_Xardas_Hello, "你 说 的 新 威 胁 指 的 是 什 么 ？", DIA_Addon_Xardas_Hello_Man);
};

func void DIA_Addon_Xardas_Hello_Man()
{
	PlayVideo("Intro_ADDON");
	AI_Output(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_10"); //你 必 须 先 变 成 他 们 的 同 盟 ！ 那 是 唯 一 可 以 阻 止 贝 利 尔 的 方 式 。

	Addon_zuerst = TRUE;
};

func void DIA_Addon_Xardas_Hello_Dragons()
{
	AI_Output(other, self, "DIA_Xardas_Hello_15_03"); //至 少 现 在 我 们 还 有 足 够 的 时 间 。 我 成 功 了 。 沉 睡 者 … …
	AI_Output(self, other, "DIA_Xardas_Hello_14_04"); //… … 已 经 被 封 印 了 。 你 消 灭 了 他 ， 这 都 是 真 的 - 但 是 我 们 现 在 无 力 阻 止 即 将 发 生 的 战 争 。
	// AI_Output(other,self,"DIA_Xardas_Hello_15_05"); // Du redest von den Orks?
	// AI_Output(self,other,"DIA_Xardas_Hello_14_06"); // Ich rede von weitaus schlimmeren Kreaturen.
	AI_Output(self, other, "DIA_Xardas_Hello_14_07"); //在 他 的 最 后 一 刻 ， 沉 睡 者 狂 怒 的 尖 叫 ， 已 经 调 动 了 黑 暗 军 团 。
	AI_Output(self, other, "DIA_Xardas_Hello_14_08"); //那 是 对 所 有 邪 恶 生 物 的 命 令 ， 那 是 他 们 都 必 须 服 从 的 ‘ 力 量 之 语 ’ 。
	AI_Output(self, other, "DIA_Xardas_Hello_14_09"); //他 最 后 的 命 令 是 ： 来 ！ 现 在 他 们 来 了 ， 他 们 所 有 人 ， 甚 至 还 有 龙 。
	AI_Output(other, self, "DIA_Xardas_Hello_15_10"); //（ 吃 惊 的 ） … … 龙 ！
	AI_Output(self, other, "DIA_Xardas_Hello_14_11"); //他 们 是 远 古 力 量 的 生 物 。 我 能 感 觉 到 他 们 的 存 在 - 即 使 在 这 里 。
	AI_Output(self, other, "DIA_Xardas_Hello_14_12"); //而 且 他 们 还 在 身 边 集 合 了 一 整 支 由 低 等 奴 仆 组 成 的 军 队 。
	AI_Output(other, self, "DIA_Xardas_Hello_15_13"); //这 支 军 队 现 在 在 哪 里 ？
	AI_Output(self, other, "DIA_Xardas_Hello_14_14"); //这 支 军 队 的 营 地 离 这 里 不 远 ， 在 克 霍 里 尼 斯 附 近 的 矿 藏 山 谷 里 ， 他 们 做 好 了 进 攻 的 准 备 。

	if (Addon_zuerst == TRUE)
	{
		AI_Output(self, other, "DIA_Xardas_Hello_14_15"); //（ 焦 虑 的 ） 我 们 剩 下 的 时 间 不 多 了 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Xardas_Hello_Dragons_14_06"); //但 那 还 不 是 全 部 。 最 近 我 还 察 觉 了 另 外 一 个 威 胁 。
		Info_ClearChoices(DIA_Xardas_Hello);
		Info_AddChoice(DIA_Xardas_Hello, "你 说 的 新 威 胁 指 的 是 什 么 ？", DIA_Addon_Xardas_Hello_Man);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info AWAY
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_AWAY(C_INFO) // E1
{
	npc				= NONE_100_Xardas;
	nr				= 2;
	condition		= DIA_Xardas_AWAY_Condition;
	information		= DIA_Xardas_AWAY_Info;
	description		= "嗯 ， 那 我 们 快 点 离 开 这 里 ！";
};

func int DIA_Xardas_AWAY_Condition()
{
	if ((!Npc_KnowsInfo(other, DIA_Xardas_TODO))
	&& (!Npc_KnowsInfo(other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_AWAY_Info()
{
	AI_Output(other, self, "DIA_Xardas_AWAY_15_00"); //那 我 们 赶 快 离 开 这 里 ！
	AI_Output(self, other, "DIA_Xardas_AWAY_14_01"); //如 果 我 们 现 在 逃 走 的 话 ， 那 么 以 后 就 只 需 面 对 龙 了 。
	AI_Output(self, other, "DIA_Xardas_AWAY_14_02"); //在 附 近 驻 扎 的 战 士 和 魔 法 师 的 帮 助 下 ， 我 们 可 以 在 他 们 的 军 队 整 编 完 成 前 阻 止 他 们 。
	AI_Output(self, other, "DIA_Xardas_AWAY_14_03"); //我 们 不 会 再 有 更 好 的 机 会 了 。
};

///////////////////////////////////////////////////////////////////////
//	Info TODO
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_TODO(C_INFO) // E1
{
	npc				= NONE_100_Xardas;
	nr				= 1;
	condition		= DIA_Xardas_TODO_Condition;
	information		= DIA_Xardas_TODO_Info;
	description		= "我 们 现 在 能 做 什 么 ？";
};

func int DIA_Xardas_TODO_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Xardas_TODO_Info()
{
	AI_Output(other, self, "DIA_Xardas_TODO_15_00"); //我 们 能 够 做 什 么 ？
	AI_Output(self, other, "DIA_Xardas_TODO_14_01"); //这 一 次 我 们 不 能 只 靠 自 己 来 解 决 问 题 。 只 有 英 诺 斯 的 力 量 能 帮 助 我 们 抵 抗 那 些 龙 。
	AI_Output(self, other, "DIA_Xardas_TODO_14_02"); //一 队 圣 骑 士 正 驻 扎 在 克 霍 里 尼 斯 的 城 市 里 ， 离 这 里 不 远 。
	AI_Output(self, other, "DIA_Xardas_TODO_14_03"); //他 们 拥 有 一 个 强 大 的 宝 物 可 以 帮 助 我 们 打 败 龙 。
	AI_Output(self, other, "DIA_Xardas_TODO_14_04"); //他 们 叫 它 ‘ 英 诺 斯 之 眼 ’ 。 你 需 要 拿 到 这 个 宝 物 。
	AI_Output(self, other, "DIA_Xardas_TODO_14_05"); //告 诉 圣 骑 士 有 关 这 个 威 胁 的 情 况 。 你 必 须 说 服 他 们 的 首 领 支 持 我 们 ！
	AI_Output(self, other, "DIA_Addon_Xardas_Add_14_07"); //而 且 在 你 同 他 谈 过 之 后 ， 你 还 需 要 找 到 贝 利 尔 的 宝 物 。
	AI_Output(self, other, "DIA_Addon_Xardas_Add_14_08"); //它 是 英 诺 斯 之 眼 的 对 立 物 ， 一 定 不 能 让 它 落 入 邪 恶 之 手 。
	Log_CreateTopic(TOPIC_INNOSEYE, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_INNOSEYE, LOG_RUNNING);
	B_LogEntry(TOPIC_INNOSEYE, TOPIC_INNOSEYE_5);
};

///////////////////////////////////////////////////////////////////////
//	Info StonePlate
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Xardas_StonePlate(C_INFO)
{
	npc				= NONE_100_Xardas;
	nr				= 5;
	condition		= DIA_Addon_Xardas_StonePlate_Condition;
	information		= DIA_Addon_Xardas_StonePlate_Info;
	description		= "关 于 这 块 石 片 你 能 告 诉 什 么 事 吗 ？";
};

func int DIA_Addon_Xardas_StonePlate_Condition()
{
	if (Npc_HasItems(other, ItWr_StonePlateCommon_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_StonePlate_Info()
{
	AI_Output(other, self, "DIA_Addon_Xardas_StonePlate_15_00"); //关 于 这 块 石 片 你 能 告 诉 什 么 事 吗 ？
	// AI_Output(self, other, "DIA_Addon_Xardas_StonePlate_14_01"); // Ich habe so eine unten in der Höhlen vor meinem Turm gefunden.
	// AI_Output(self, other, "DIA_Addon_Xardas_StonePlate_14_02"); // Sie sind in einer seltsam alten Sprache geschrieben, die ich in dieser Form noch nirgendwo gesehen habe.
	AI_Output(self, other, "DIA_Addon_Xardas_StonePlate_14_03"); //首 先 我 以 为 它 是 一 种 魔 法 宝 物 ， 但 是 我 最 后 判 断 它 并 没 有 什 么 重 要 的 意 义 。
	AI_Output(self, other, "DIA_Addon_Xardas_StonePlate_14_04"); //我 还 无 法 完 全 解 密 这 些 文 字 的 含 义 ， 但 是 它 看 来 和 一 个 非 常 古 老 的 文 明 有 关 。
	AI_Output(self, other, "DIA_Addon_Xardas_StonePlate_14_05"); //如 果 你 想 要 这 个 石 板 ， 送 给 你 ， 我 拿 它 没 有 用 了 。

	B_GivePlayerXP(XP_Ambient);
};

// ************************************************************
// *** ***
// 						Addon Report
// *** ***
// ************************************************************
// ------------------------------------------------------------
// 						Portal entdeckt
// ------------------------------------------------------------
instance DIA_Addon_Xardas_Portal(C_INFO)
{
	npc				= NONE_100_Xardas;
	nr				= 1;
	condition		= DIA_Addon_Xardas_Portal_Condition;
	information		= DIA_Addon_Xardas_Portal_Info;
	description		= "水 法 师 发 现 了 一 座 通 向 岛 上 某 个 未 知 区 域 的 传 送 门 … …";
};

func int DIA_Addon_Xardas_Portal_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Saturas_WhatsOrnament))
	&& (!C_SCHasBeliarsWeapon())
	&& (Saturas_KlaueInsMeer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_Portal_Info()
{
	AI_Output(other, self, "DIA_Addon_Xardas_AddonSuccess_15_00"); //水 法 师 发 现 了 一 座 通 向 岛 上 某 个 未 知 区 域 的 传 送 门 … …
	AI_Output(self, other, "DIA_Addon_Xardas_AddonSuccess_14_01"); //有 意 思 … …
	AI_Output(self, other, "DIA_Addon_Xardas_AddonSuccess_14_02"); //只 要 你 发 现 了 什 么 真 正 有 用 的 东 西 ， 一 定 要 告 诉 我 ！
	AI_Output(self, other, "DIA_Addon_Xardas_AddonSuccess_14_03"); //这 个 贝 利 尔 的 宝 物 应 该 藏 在 那 里 的 某 个 地 方 。 找 到 它 ！
};

// ------------------------------------------------------------
// 						Nochmal wegen Portal
// ------------------------------------------------------------
instance DIA_Addon_Xardas_PortalAgain(C_INFO)
{
	npc				= NONE_100_Xardas;
	nr				= 1;
	condition		= DIA_Addon_Xardas_PortalAgain_Condition;
	information		= DIA_Addon_Xardas_PortalAgain_Info;
	permanent		= TRUE;
	description		= "关 于 那 岛 上 那 个 未 知 的 区 域 … …";
};

func int DIA_Addon_Xardas_PortalAgain_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Xardas_Portal))
	&& (!C_SCHasBeliarsWeapon())
	&& (Saturas_KlaueInsMeer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_PortalAgain_Info()
{
	AI_Output(other, self, "DIA_Addon_Xardas_AddonSuccess_15_17"); //关 于 那 岛 上 那 个 未 知 的 区 域 … …
	AI_Output(self, other, "DIA_Addon_Xardas_AddonSuccess_14_18"); //不 要 因 为 琐 事 来 打 扰 我 。 如 果 你 发 现 任 何 有 用 的 东 西 的 话 ， 马 上 回 来 。
};

// ------------------------------------------------------------
// 						Addon Success
// ------------------------------------------------------------
instance DIA_Addon_Xardas_AddonSuccess(C_INFO)
{
	npc				= NONE_100_Xardas;
	nr				= 1;
	condition		= DIA_Addon_Xardas_AddonSuccess_Condition;
	information		= DIA_Addon_Xardas_AddonSuccess_Info;
	description		= "我 已 经 探 索 了 岛 上 的 那 个 未 知 区 域 … …";
};

func int DIA_Addon_Xardas_AddonSuccess_Condition()
{
	if ((C_SCHasBeliarsWeapon())
	|| (Saturas_KlaueInsMeer == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_AddonSuccess_Info()
{
	AI_Output(other, self, "DIA_Addon_Xardas_AddonSuccess_15_03"); //我探索了岛上未知的区域...
	AI_Output(self, other, "DIA_Addon_Xardas_AddonSuccess_14_04"); //那 么 你 发 现 了 什 么 ？
	AI_Output(other, self, "DIA_Addon_Xardas_AddonSuccess_15_05"); //全 都 是 关 于 一 件 强 大 的 宝 物 ， 贝 利 尔 之 爪 。
	AI_Output(self, other, "DIA_Addon_Xardas_AddonSuccess_14_06"); //贝 利 尔 之 爪 ？ ！ 它 现 在 哪 里 ？ 你 带 在 身 上 了 吗 ？

	if (C_SCHasBeliarsWeapon())
	{
		AI_Output(other, self, "DIA_Addon_Xardas_AddonSuccess_15_07"); //是 的 ， 它 在 这 里 。
		AI_Output(self, other, "DIA_Addon_Xardas_AddonSuccess_14_08"); //（ 贪 婪 的 ） 太 有 趣 了 。
		AI_Output(self, other, "DIA_Addon_Xardas_AddonSuccess_14_09"); //这 件 武 器 对 我 们 来 说 有 极 大 的 用 处 ， 但 是 它 也 是 极 其 危 险 的 。
		AI_Output(self, other, "DIA_Addon_Xardas_AddonSuccess_14_10"); //你 要 多 加 保 重 ！ 而 且 ， 最 重 要 的 是 ： 不 要 丢 了 它 ！
		B_GivePlayerXP(XP_Ambient * 3);
	}
	else
	{
		AI_Output(other, self, "DIA_Addon_Xardas_AddonSuccess_15_11"); //它 不 在 我 这 里 了 … …
		AI_Output(other, self, "DIA_Addon_Xardas_AddonSuccess_15_12"); //我 把 它 交 给 了 水 法 师 ， 好 让 他 们 把 它 扔 进 大 海 … …
		AI_Output(self, other, "DIA_Addon_Xardas_AddonSuccess_14_13"); //（ 怒 吼 ） 你 疯 了 吗 ？ 你 知 道 你 究 竟 葬 送 了 什 么 吗 ？
		AI_Output(self, other, "DIA_Addon_Xardas_AddonSuccess_14_14"); //这 件 武 器 对 我 们 有 很 大 的 帮 助 ！
		AI_Output(other, self, "DIA_Addon_Xardas_AddonSuccess_15_15"); //我 想 这 样 是 最 好 的 。
		AI_Output(self, other, "DIA_Addon_Xardas_AddonSuccess_14_16"); //（ 叹 息 ） 神 的 行 事 是 莫 测 高 深 的 … …
	};
};

// --------------------------------------------------------------------

///////////////////////////////////////////////////////////////////////
//	Info WEAPON
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_WEAPON(C_INFO) // E1
{
	npc				= NONE_100_Xardas;
	nr				= 5;
	condition		= DIA_Xardas_WEAPON_Condition;
	information		= DIA_Xardas_WEAPON_Info;
	description		= "我 需 要 武 器 。";
};

func int DIA_Xardas_WEAPON_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Xardas_WEAPON_Info()
{
	AI_Output(other, self, "DIA_Xardas_WEAPON_15_00"); //我 需 要 武 器 。
	AI_Output(self, other, "DIA_Xardas_WEAPON_14_01"); //我 只 能 把 我 这 里 的 那 些 小 东 西 给 你 。
	AI_Output(self, other, "DIA_Xardas_WEAPON_14_02"); //在 我 的 塔 里 四 处 找 找 看 。 任 何 你 觉 得 有 用 的 东 西 ， 都 可 以 拿 走 。
};

///////////////////////////////////////////////////////////////////////
//	Info ARTEFAKT
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_ARTEFAKT(C_INFO) // E2 nach TODO
{
	npc				= NONE_100_Xardas;
	nr				= 2;
	condition		= DIA_Xardas_ARTEFAKT_Condition;
	information		= DIA_Xardas_ARTEFAKT_Info;
	description		= "‘ 英 诺 斯 之 眼 ’ 是 什 么 ？";
};

func int DIA_Xardas_ARTEFAKT_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Xardas_TODO))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_ARTEFAKT_Info()
{
	AI_Output(other, self, "DIA_Xardas_ARTEFAKT_15_00"); //‘ 英 诺 斯 之 眼 ’ 是 什 么 ？
	AI_Output(self, other, "DIA_Xardas_ARTEFAKT_14_01"); //它 是 一 个 护 身 符 。 传 说 英 诺 斯 亲 自 把 他 的 一 部 分 神 力 注 入 了 这 个 护 身 符 。
	AI_Output(self, other, "DIA_Xardas_ARTEFAKT_14_02"); //它 将 会 恢 复 你 的 一 部 分 力 量 ， 并 帮 助 我 们 打 败 龙 。
	AI_Output(self, other, "DIA_Xardas_ARTEFAKT_14_03"); //它 还 有 其 它 一 些 隐 藏 的 力 量 。 当 你 拿 到 这 个 护 身 符 的 时 候 ， 我 就 会 告 诉 你 更 多 的 。
};

///////////////////////////////////////////////////////////////////////
//	Info PALADIN
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_PALADIN(C_INFO) // E2 nach TODO
{
	npc				= NONE_100_Xardas;
	nr				= 3;
	condition		= DIA_Xardas_PALADIN_Condition;
	information		= DIA_Xardas_PALADIN_Info;
	description		= "圣 骑 士 为 什 么 要 给 我 英 诺 斯 之 眼 ？";
};

func int DIA_Xardas_PALADIN_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Xardas_TODO))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_PALADIN_Info()
{
	AI_Output(other, self, "DIA_Xardas_PALADIN_15_00"); //圣 骑 士 为 什 么 要 给 我 英 诺 斯 之 眼 ？
	AI_Output(self, other, "DIA_Xardas_PALADIN_14_01"); //因 为 注 定 将 由 你 配 戴 它 。
	AI_Output(other, self, "DIA_Xardas_PALADIN_15_02"); //你 怎 么 会 知 道 的 ？
	AI_Output(self, other, "DIA_Xardas_PALADIN_14_03"); //有 很 多 理 由 ， 最 重 要 的 是 ： 你 已 经 击 败 了 沉 睡 者 。 如 果 你 不 是 神 的 宠 儿 ， 你 现 在 就 已 经 死 了 。
	AI_Output(other, self, "DIA_Xardas_PALADIN_15_04"); //我 想 你 是 对 的 ， 我 也 是 注 定 要 配 戴 英 诺 斯 之 眼 的 人 。 但 是 圣 骑 士 怎 么 会 知 道 那 是 真 的 ？
	AI_Output(self, other, "DIA_Xardas_PALADIN_14_05"); //‘ 眼 睛 ’ 本 身 会 选 择 配 戴 它 的 人 。 一 旦 你 拿 到 并 配 戴 上 它 ， 那 么 圣 骑 士 就 不 会 再 怀 疑 你 的 话 。
};

///////////////////////////////////////////////////////////////////////
//	Info Khorinis
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_Khorinis(C_INFO) // E2 nach TODO
{
	npc				= NONE_100_Xardas;
	nr				= 4;
	condition		= DIA_Xardas_Khorinis_Condition;
	information		= DIA_Xardas_Khorinis_Info;
	description		= "我 怎 么 进 入 城 市 ？";
};

func int DIA_Xardas_Khorinis_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Xardas_TODO))
	&& (Lothar.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_Khorinis_Info()
{
	AI_Output(other, self, "DIA_Xardas_Khorinis_15_00"); //我 怎 么 进 入 城 市 ？
	AI_Output(self, other, "DIA_Xardas_Khorinis_14_01"); //只 要 沿 着 这 里 的 路 穿 过 山 区 ， 那 座 城 市 很 大 ， 你 不 会 走 错 路 的 。
	AI_Output(self, other, "DIA_Xardas_Khorinis_14_02"); //但 是 留 神 ！ 去 镇 上 的 路 并 非 没 有 危 险 ， 而 且 你 也 不 像 以 前 那 样 强 壮 。
};

// ************************************************************
// 			  		Zum zweiten Mal bei Xardas
// ************************************************************
instance DIA_Xardas_WhereEx(C_INFO) // BACK AGAIN
{
	npc				= NONE_100_Xardas;
	nr				= 6;
	condition		= DIA_Xardas_WhereEx_Condition;
	information		= DIA_Xardas_WhereEx_Info;
	description		= "我 们 究 竟 在 哪 里 ？";
};

func int DIA_Xardas_WhereEx_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_WhereEx_Info()
{
	AI_Output(other, self, "DIA_Xardas_Add_15_00"); //我 们 究 竟 在 哪 里 ？
	AI_Output(self, other, "DIA_Xardas_Add_14_01"); //我 已 经 说 了 ， 在 克 霍 里 尼 斯 城 的 附 近 。
	AI_Output(self, other, "DIA_Xardas_Add_14_02"); //我 在 这 里 重 建 了 我 的 塔 。
	AI_Output(other, self, "DIA_Xardas_Add_15_03"); //但 是 自 从 我 们 上 次 在 矿 藏 山 谷 见 面 只 过 了 几 天 … …
	AI_Output(self, other, "DIA_Xardas_Add_14_04"); //我 召 唤 的 仆 人 已 经 完 成 了 全 部 工 作 … …
	AI_Output(other, self, "DIA_Xardas_Add_15_05"); //我 同 意 。
};
instance DIA_Xardas_EQUIPMENT(C_INFO) // BACK AGAIN
{
	npc				= NONE_100_Xardas;
	nr				= 7;
	condition		= DIA_Xardas_EQUIPMENT_Condition;
	information		= DIA_Xardas_EQUIPMENT_Info;
	description		= "我 从 哪 里 能 找 到 更 好 的 装 备 ？";
};

func int DIA_Xardas_EQUIPMENT_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Xardas_WEAPON))
	&& (Npc_KnowsInfo(other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_EQUIPMENT_Info()
{
	AI_Output(other, self, "DIA_Xardas_EQUIPMENT_15_00"); //我 从 哪 里 能 找 到 更 好 的 装 备 ？
	AI_Output(self, other, "DIA_Xardas_EQUIPMENT_14_01"); //你 能 找 到 更 好 的 武 器 和 盔 甲 的 最 近 的 地 方 是 克 霍 里 尼 斯 的 城 市 。
	AI_Output(self, other, "DIA_Xardas_EQUIPMENT_14_02"); //如 果 你 在 战 斗 中 受 伤 的 话 ， 你 可 以 在 山 谷 里 找 到 一 些 有 治 疗 效 果 的 药 草 。
	AI_Output(self, other, "DIA_Xardas_EQUIPMENT_14_03"); //找 到 在 我 的 塔 前 面 的 湖 。 那 里 有 一 条 秘 密 的 通 道 通 向 山 谷 。
};

///////////////////////////////////////////////////////////////////////
//	Info ABOUTLESTER
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_ABOUTLESTER(C_INFO)
{
	npc				= NONE_100_Xardas;
	nr				= 5;
	condition		= DIA_Xardas_ABOUTLESTER_Condition;
	information		= DIA_Xardas_ABOUTLESTER_Info;
	description		= "你 同 莱 斯 特 谈 过 了 吗 ？";
};

func int DIA_Xardas_ABOUTLESTER_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lester_SEND_XARDAS)
	&& (Npc_GetDistToWP(Lester, "NW_XARDAS_TOWER_IN1_31") <= 500))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_ABOUTLESTER_Info()
{
	AI_Output(other, self, "DIA_Xardas_ABOUTLESTER_15_00"); //你 同 莱 斯 特 谈 过 了 吗 ？
	AI_Output(self, other, "DIA_Xardas_ABOUTLESTER_14_01"); //是 的 ， 我 已 经 准 备 好 问 题 了 。 他 能 告 诉 我 很 多 事 ， 但 是 他 已 经 筋 疲 力 竭 。
	AI_Output(self, other, "DIA_Xardas_ABOUTLESTER_14_02"); //他 能 从 这 次 逃 亡 中 活 下 来 根 本 是 个 奇 迹 。 我 现 在 已 经 让 他 上 床 休 息 了 。
	AI_Output(other, self, "DIA_Xardas_ABOUTLESTER_15_03"); //他 告 诉 了 你 什 么 ？
	AI_Output(self, other, "DIA_Xardas_ABOUTLESTER_14_04"); //恐 怕 没 什 么 好 事 。 他 不 仅 看 到 了 龙 ， 而 且 还 有 一 些 穿 着 带 黑 色 罩 帽 的 斗 篷 的 人 。
	AI_Output(other, self, "DIA_Xardas_ABOUTLESTER_15_05"); //然后呢?
	AI_Output(self, other, "DIA_Xardas_ABOUTLESTER_14_06"); //如 果 那 些 人 真 的 存 在 的 话 ， 那 他 们 的 出 现 就 代 表 着 一 种 威 胁 。
	AI_Output(self, other, "DIA_Xardas_ABOUTLESTER_14_07"); //我 不 喜 欢 那 样 。 给 ， 拿 上 我 的 戒 指 。 它 将 会 保 护 你 抵 抗 魔 法 。

	B_GiveInvItems(self, other, ItRi_Prot_Mage_01, 1);
	B_GivePlayerXP(XP_Ambient);
};

// *************************************************************
// -------------------------------------------------------------
//						NACH erstem Exit !!!
// -------------------------------------------------------------
// ************************************************************ // x

///////////////////////////////////////////////////////////////////////
//	Bei Paladinen gewesen
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_FirstPal(C_INFO)
{
	npc				= NONE_100_Xardas;
	nr				= 10;
	condition		= DIA_Xardas_FirstPal_Condition;
	information		= DIA_Xardas_FirstPal_Info;
	description		= "我 已 经 去 了 镇 上 … …";
};

func int DIA_Xardas_FirstPal_Condition()
{
	if ((Lothar.aivar[AIV_TalkedToPlayer] == TRUE)
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_FirstPal_Info()
{
	AI_Output(other, self, "DIA_Xardas_FirstPal_15_00"); //我 已 经 去 了 镇 上 … …
	AI_Output(self, other, "DIA_Xardas_FirstPal_14_01"); //后 来 呢 ？ 你 和 圣 骑 士 首 领 谈 过 了 吗 ？
	AI_Output(other, self, "DIA_Xardas_FirstPal_15_02"); //他 们 不 让 我 见 他 … …
	AI_Output(self, other, "DIA_Xardas_FirstPal_14_03"); //可 笑 ！ 一 定 有 什 么 办 法 让 你 见 到 他 。
	AI_Output(self, other, "DIA_Xardas_FirstPal_14_04"); //如 果 其 它 方 法 都 失 败 了 的 话 ， 那 就 进 入 修 道 院 ， 并 成 为 一 名 魔 法 师 。
	AI_Output(self, other, "DIA_Xardas_FirstPal_14_05"); //那 样 做 也 许 会 有 些 道 德 上 的 问 题 ， 但 是 它 可 能 会 让 你 达 成 你 需 要 的 目 标 。
	AI_Output(self, other, "DIA_Xardas_FirstPal_14_06"); //如 果 你 成 为 魔 法 师 ， 他 当 然 会 见 你 。
};

///////////////////////////////////////////////////////////////////////
//	Info Weiter (Perm)
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_Weiter(C_INFO)
{
	npc				= NONE_100_Xardas;
	nr				= 99;
	condition		= DIA_Xardas_Weiter_Condition;
	information		= DIA_Xardas_Weiter_Info;
	permanent		= TRUE;
	description		= "那 么 我 们 下 一 步 该 做 什 么 ？ ";
};

func int DIA_Xardas_Weiter_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_Weiter_Info()
{
	AI_Output(other, self, "DIA_Xardas_Weiter_15_00"); //那 么 我 们 下 一 步 该 做 什 么 ？
	AI_Output(self, other, "DIA_Xardas_Weiter_14_01"); //我 们 要 按 照 计 划 进 行 。 没 有 其 它 的 途 径 。
	AI_Output(self, other, "DIA_Xardas_Weiter_14_02"); //你 去 拿 你 的 英 诺 斯 之 眼 ， 我 将 继 续 寻 找 我 的 答 案 。
};
instance DIA_Xardas_KdfSecret(C_INFO)
{
	npc				= NONE_100_Xardas;
	nr				= 9;
	condition		= DIA_Xardas_KdfSecret_Condition;
	information		= DIA_Xardas_KdfSecret_Info;
	description		= "为 什 么 火 之 环 不 知 道 你 ？";
};

func int DIA_Xardas_KdfSecret_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Xardas_FirstEXIT))
	{
		return TRUE;
	};
};

func void DIA_Xardas_KdfSecret_Info()
{
	AI_Output(other, self, "DIA_Xardas_KdfSecret_15_00"); //为 什 么 火 之 环 不 知 道 你 ？
	AI_Output(self, other, "DIA_Xardas_KdfSecret_14_01"); //我 以 前 是 ‘ 环 ’ 中 的 高 级 成 员 。 即 使 在 那 时 ， 我 都 在 猜 想 恶 魔 魔 法 可 能 是 魔 法 屏 障 的 关 键 。
	AI_Output(self, other, "DIA_Xardas_KdfSecret_14_02"); //但 是 我 一 直 没 能 劝 服 其 它 ‘ 环 ’ 中 的 成 员 走 这 条 路 。
	AI_Output(self, other, "DIA_Xardas_KdfSecret_14_03"); //所 以 我 离 开 了 ‘ 环 ’ ， 为 了 继 续 研 究 黑 色 艺 术 。
	AI_Output(self, other, "DIA_Xardas_KdfSecret_14_04"); //那 对 于 火 魔 法 师 来 说 是 一 种 罪 恶 ， （ 嘲 弄 的 ） ‘ 英 诺 斯 的 规 定 ’ 、 曾 经 的 ‘ 善 良 ’ 和 ‘ 公 正 ’ 不 会 接 受 任 何 借 口 。
	AI_Output(self, other, "DIA_Xardas_KdfSecret_14_05"); //他 们 知 道 我 还 活 着 ， 但 是 他 们 不 知 道 去 哪 里 找 我 - 那 也 是 一 件 好 事 。
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
instance DIA_Xardas_KAP3_EXIT(C_INFO)
{
	npc				= NONE_100_Xardas;
	nr				= 999;
	condition		= DIA_Xardas_KAP3_EXIT_Condition;
	information		= DIA_Xardas_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Xardas_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Xardas_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BackFromOW
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_BACKFROMOW(C_INFO)
{
	npc				= NONE_100_Xardas;
	nr				= 31;
	condition		= DIA_Xardas_BACKFROMOW_Condition;
	information		= DIA_Xardas_BACKFROMOW_Info;
	description		= "我 从 矿 藏 山 谷 回 来 了 。";
};

func int DIA_Xardas_BACKFROMOW_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Xardas_BACKFROMOW_Info()
{
	AI_Output(other, self, "DIA_Xardas_BACKFROMOW_15_00"); //我 从 矿 藏 山 谷 回 来 了 。
	AI_Output(self, other, "DIA_Xardas_BACKFROMOW_14_01"); //正 是 时 候 。 你 看 到 了 什 么 ？
	AI_Output(other, self, "DIA_Xardas_BACKFROMOW_15_02"); //你 是 对 的 。 那 里 已 经 被 敌 人 的 军 队 侵 占 了 。
	AI_Output(other, self, "DIA_Xardas_BACKFROMOW_15_03"); //兽 人 正 在 围 攻 城 堡 ， 而 龙 已 经 把 整 个 地 区 变 成 了 废 墟 。
	AI_Output(other, self, "DIA_Xardas_BACKFROMOW_15_04"); //如 果 我 没 弄 错 的 话 ， 他 们 用 不 了 多 久 就 会 攻 击 克 霍 里 尼 斯 。
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info DmtSindDa
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_DMTSINDDA(C_INFO)
{
	npc				= NONE_100_Xardas;
	nr				= 32;
	condition		= DIA_Xardas_DMTSINDDA_Condition;
	information		= DIA_Xardas_DMTSINDDA_Info;
	description		= "这 里 究 竟 同 时 发 生 了 什 么 事 ？";
};

func int DIA_Xardas_DMTSINDDA_Condition()
{
	if ((Kapitel == 3)
	&& (Npc_KnowsInfo(other, DIA_Xardas_BACKFROMOW)))
	{
		return TRUE;
	};
};

func void DIA_Xardas_DMTSINDDA_Info()
{
	if (Npc_KnowsInfo(other, DIA_Lester_BACKINTOWN))
	{
		AI_Output(other, self, "DIA_Xardas_DMTSINDDA_15_00"); //莱 斯 特 说 你 要 立 即 见 我 。
	};

	AI_Output(other, self, "DIA_Xardas_DMTSINDDA_15_01"); //这 里 究 竟 同 时 发 生 了 什 么 事 ？
	AI_Output(self, other, "DIA_Xardas_DMTSINDDA_14_02"); //敌 人 已 经 发 现 了 你 的 真 实 身 份 ， 还 知 道 你 正 设 法 去 拿 英 诺 斯 之 眼 。
	AI_Output(self, other, "DIA_Xardas_DMTSINDDA_14_03"); //他 已 经 察 觉 了 这 个 威 胁 。 它 已 经 迫 使 他 离 开 了 藏 身 之 所 ， 并 公 然 发 起 进 攻 。
	AI_Output(self, other, "DIA_Xardas_DMTSINDDA_14_04"); //捉 迷 藏 的 游 戏 已 经 结 束 了 。 昨 天 还 没 人 知 道 敌 人 会 怎 样 进 攻 。 现 在 这 已 经 十 分 清 楚 了 。

	B_LogEntry(TOPIC_INNOSEYE, TOPIC_INNOSEYE_6);

	Info_ClearChoices(DIA_Xardas_DMTSINDDA);
	Info_AddChoice(DIA_Xardas_DMTSINDDA, "我 被 穿 着 黑 袍 的 魔 法 师 袭 击 了 。", DIA_Xardas_DMTSINDDA_DMT);
	Info_AddChoice(DIA_Xardas_DMTSINDDA, "我 终 于 得 到 了 给 哈 根 勋 爵 的 证 明 。", DIA_Xardas_DMTSINDDA_Beweis);
};

func void DIA_Xardas_DMTSINDDA_DMT()
{
	AI_Output(other, self, "DIA_Xardas_DMTSINDDA_DMT_15_00"); //我 被 穿 着 黑 袍 的 魔 法 师 袭 击 了 。
	AI_Output(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_01"); //敌 人 有 很 多 伪 装 。 搜 索 者 只 是 其 中 之 一 ， 他 们 实 际 上 是 为 敌 人 预 备 战 场 的 人 。
	AI_Output(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_02"); //他 们 已 经 占 据 了 战 略 位 置 ， 现 在 只 是 在 等 待 触 发 陷 阱 的 时 机 。
	AI_Output(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_03"); //避 开 他 们 。 他 们 是 非 常 强 大 的 魔 法 生 物 ， 而 且 他 们 会 不 惜 一 切 代 价 阻 止 你 。

	if (hero.guild == GIL_KDF)
	{
		Log_CreateTopic(TOPIC_DEMENTOREN, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DEMENTOREN, LOG_RUNNING);
		B_LogEntry(TOPIC_DEMENTOREN, TOPIC_DEMENTOREN_1);
	};
};

func void DIA_Xardas_DMTSINDDA_Beweis()
{
	AI_Output(other, self, "DIA_Xardas_DMTSINDDA_Beweis_15_00"); //我 终 于 得 到 了 哈 根 勋 爵 我 要 寻 找 的 证 据 。
	AI_Output(self, other, "DIA_Xardas_DMTSINDDA_Beweis_14_01"); //是 什 么 证 据 ？
	AI_Output(other, self, "DIA_Xardas_DMTSINDDA_Beweis_15_02"); //我 从 加 隆 德 - 矿 藏 山 谷 的 圣 骑 士 指 挥 官 - 那 里 拿 到 了 一 封 信 。 在 信 中 ， 他 请 求 援 兵 。
	AI_Output(self, other, "DIA_Xardas_DMTSINDDA_Beweis_14_03"); //那 应 该 足 以 说 服 那 个 好 战 的 老 兵 。 干 得 好 。

	Info_AddChoice(DIA_Xardas_DMTSINDDA, "现 在 下 一 步 要 怎 么 做 ？", DIA_Xardas_DMTSINDDA_DMT_WhatToDo);
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Xardas_DMTSINDDA_DMT_WhatToDo()
{
	AI_Output(other, self, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_15_00"); //现 在 下 一 步 要 怎 么 做 ？
	AI_Output(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_01"); //去 把 加 隆 德 的 信 交 给 哈 根 勋 爵 ， 那 样 他 就 会 把 英 诺 斯 之 眼 交 给 你 。
	AI_Output(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_02"); //那 么 去 修 道 院 和 皮 罗 卡 谈 一 下 。 他 一 定 会 把 ‘ 眼 睛 ’ 交 给 你 。
	AI_Output(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_03"); //没 有 比 把 这 件 宝 物 送 到 安 全 地 方 更 重 要 的 事 了 。
	AI_Output(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_04"); //趁 还 来 得 及 ， 马 上 出 发 。 敌 人 同 样 试 图 染 指 它 。
	B_LogEntry(TOPIC_INNOSEYE, TOPIC_INNOSEYE_7);
};

///////////////////////////////////////////////////////////////////////
//	Info InnosEyeBroken
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_INNOSEYEBROKEN(C_INFO)
{
	npc				= NONE_100_Xardas;
	nr				= 33;
	condition		= DIA_Xardas_INNOSEYEBROKEN_Condition;
	information		= DIA_Xardas_INNOSEYEBROKEN_Info;
	description		= "英 诺 斯 之 眼 已 经 被 破 坏 了 。";
};

func int DIA_Xardas_INNOSEYEBROKEN_Condition()
{
	if ((Kapitel == 3)
	&& (Npc_KnowsInfo(other, DIA_Xardas_DMTSINDDA))
	&& ((Npc_HasItems(other, ItMi_InnosEye_Broken_MIS)) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Xardas_INNOSEYEBROKEN_Info()
{
	AI_Output(other, self, "DIA_Xardas_INNOSEYEBROKEN_15_00"); //英 诺 斯 之 眼 已 经 被 破 坏 了 。
	AI_Output(self, other, "DIA_Xardas_INNOSEYEBROKEN_14_01"); //你 在 说 什 么 ？ 被 破 坏 了 ！
	AI_Output(other, self, "DIA_Xardas_INNOSEYEBROKEN_15_02"); //我 在 北 边 的 树 林 里 找 到 了 它 - 不 幸 的 是 ， 我 只 能 拿 回 它 的 碎 片 。
	AI_Output(self, other, "DIA_Xardas_INNOSEYEBROKEN_14_03"); //那 是 我 们 对 抗 那 些 龙 的 唯 一 机 会 ， 现 在 它 消 失 了 。 我 们 已 经 失 败 了 。

	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	B_GivePlayerXP(XP_Ambient);

	Info_ClearChoices(DIA_Xardas_INNOSEYEBROKEN);
	Info_AddChoice(DIA_Xardas_INNOSEYEBROKEN, "现 在 怎 么 办 ？", DIA_Xardas_INNOSEYEBROKEN_wasnun);
};

func void DIA_Xardas_INNOSEYEBROKEN_wasnun()
{
	AI_Output(other, self, "DIA_Xardas_INNOSEYEBROKEN_wasnun_15_00"); //现 在 怎 么 办 ？
	AI_Output(self, other, "DIA_Xardas_INNOSEYEBROKEN_wasnun_14_01"); //这 是 一 个 痛 苦 的 打 击 。 我 们 必 须 重 新 调 整 自 己 。 我 需 要 静 修 ， 并 考 虑 一 下 这 件 事 。
	AI_Output(self, other, "DIA_Xardas_INNOSEYEBROKEN_wasnun_14_02"); //同 时 ， 你 要 去 镇 上 找 水 法 师 瓦 卓 斯 谈 谈 。 我 想 他 也 许 知 道 如 何 去 做 。

	B_LogEntry(TOPIC_INNOSEYE, TOPIC_INNOSEYE_8);

	MIS_Xardas_GoToVatrasInnoseye = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info RitualRequest
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_RITUALREQUEST(C_INFO)
{
	npc				= NONE_100_Xardas;
	nr				= 34;
	condition		= DIA_Xardas_RITUALREQUEST_Condition;
	information		= DIA_Xardas_RITUALREQUEST_Info;
	description		= "瓦 卓 斯 让 我 来 找 你 。";
};

func int DIA_Xardas_RITUALREQUEST_Condition()
{
	if ((MIS_RitualInnosEyeRepair == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Xardas_INNOSEYEBROKEN))
	&& (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_RITUALREQUEST_Info()
{
	AI_Output(other, self, "DIA_Xardas_RITUALREQUEST_15_00"); //瓦 卓 斯 让 我 来 找 你 。
	AI_Output(self, other, "DIA_Xardas_RITUALREQUEST_14_01"); //那 很 好 。 他 说 什 么 ？
	AI_Output(other, self, "DIA_Xardas_RITUALREQUEST_15_02"); //他 说 到 一 些 关 于 在 太 阳 之 环 举 行 逆 转 仪 式 的 事 情 。
	AI_Output(self, other, "DIA_Xardas_RITUALREQUEST_14_03"); //（ 大 笑 ） 那 个 老 家 伙 。 我 想 我 知 道 他 要 做 什 么 。 你 来 请 我 去 他 那 里 。
	AI_Output(other, self, "DIA_Xardas_RITUALREQUEST_15_04"); //看 起 来 是 那 样 。 你 什 么 时 候 动 身 ？

	if ((hero.guild == GIL_KDF)
	|| (hero.guild == GIL_DJG)
	|| (hero.guild == GIL_PAL))
	{
		AI_Output(self, other, "DIA_Xardas_RITUALREQUEST_14_05"); //我 不 能 让 瓦 卓 斯 久 等 ， 我 会 立 即 启 程 。 你 一 定 要 完 成 你 的 任 务 ， 然 后 再 与 我 会 和 。
		AI_StopProcessInfos(self);
		B_LogEntry(TOPIC_INNOSEYE, TOPIC_INNOSEYE_9);
		B_GivePlayerXP(XP_Ambient);
		Npc_ExchangeRoutine(self, "RitualInnosEyeRepair");
		Xardas_GoesToRitualInnosEye = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Xardas_RITUALREQUEST_14_06"); //只 有 当 你 确 定 可 以 应 付 龙 的 时 候 ， 我 才 会 协 助 完 成 这 个 仪 式 。
	};

	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info warumnichtjetzt
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_WARUMNICHTJETZT(C_INFO)
{
	npc				= NONE_100_Xardas;
	nr				= 34;
	condition		= DIA_Xardas_WARUMNICHTJETZT_Condition;
	information		= DIA_Xardas_WARUMNICHTJETZT_Info;
	description		= "你 为 什 么 不 立 刻 去 找 瓦 卓 斯 ？";
};

func int DIA_Xardas_WARUMNICHTJETZT_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Xardas_RITUALREQUEST))
	&& (Xardas_GoesToRitualInnosEye == FALSE)
	&& ((hero.guild == GIL_MIL)
	|| (hero.guild == GIL_SLD)))
	{
		return TRUE;
	};
};

func void DIA_Xardas_WARUMNICHTJETZT_Info()
{
	AI_Output(other, self, "DIA_Xardas_WARUMNICHTJETZT_15_00"); //你 为 什 么 不 立 刻 去 找 瓦 卓 斯 ？
	AI_Output(other, self, "DIA_Xardas_WARUMNICHTJETZT_15_01"); //有 时 候 我 真 的 不 明 白 你 。
	AI_Output(self, other, "DIA_Xardas_WARUMNICHTJETZT_14_02"); //（ 恼 怒 的 ） 不 要 用 那 种 口 吻 和 我 说 话 。 如 果 不 是 我 ， 你 可 怜 的 身 躯 可 能 还 正 在 那 个 神 殿 里 腐 烂 。

	Info_AddChoice(DIA_Xardas_WARUMNICHTJETZT, "不 要 急 。 只 要 告 诉 我 需 要 我 做 什 么 。", DIA_Xardas_WARUMNICHTJETZT_wastun);
	Info_AddChoice(DIA_Xardas_WARUMNICHTJETZT, "那 么 ， 至 少 向 我 解 释 一 下 你 为 什 么 要 犹 豫 。", DIA_Xardas_WARUMNICHTJETZT_grund);
};

func void DIA_Xardas_WARUMNICHTJETZT_grund()
{
	AI_Output(other, self, "DIA_Xardas_WARUMNICHTJETZT_grund_15_00"); //那 么 ， 至 少 向 我 解 释 一 下 你 为 什 么 要 犹 豫 。
	AI_Output(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_01"); //自 从 我 放 弃 火 魔 法 师 的 身 份 后 ， 我 就 一 直 在 避 开 他 们 。
	AI_Output(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_02"); //而 我 不 想 出 现 其 它 变 化 ， 除 非 我 别 无 选 择 。
	AI_Output(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_03"); //但 是 在 我 暴 露 在 魔 法 师 的 斥 责 的 目 光 中 之 前 ， 我 首 先 要 确 定 你 真 有 那 么 一 丝 的 机 会 与 龙 对 抗 。
	AI_Output(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_04"); //然 而 以 你 那 一 身 破 旧 的 装 备 来 讲 ， 你 走 不 了 多 远 。 只 有 等 你 足 够 强 壮 的 时 候 再 回 来 。
	AI_StopProcessInfos(self);
};

func void DIA_Xardas_WARUMNICHTJETZT_wastun()
{
	AI_Output(other, self, "DIA_Xardas_WARUMNICHTJETZT_wastun_15_00"); //不 要 急 。 只 要 告 诉 我 需 要 我 做 什 么 。
	AI_Output(self, other, "DIA_Xardas_WARUMNICHTJETZT_wastun_14_01"); //你 还 很 弱 小 ， 不 足 以 与 龙 作 战 。 以 现 在 这 样 的 装 备 来 看 ， 你 根 本 没 有 一 点 机 会 。
	AI_Output(self, other, "DIA_Xardas_WARUMNICHTJETZT_wastun_14_02"); //在 你 准 备 得 更 充 分 之 前 不 要 回 来 。 那 时 我 才 会 去 见 瓦 卓 斯 。
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info bereit
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_BEREIT(C_INFO)
{
	npc				= NONE_100_Xardas;
	nr				= 0;
	condition		= DIA_Xardas_BEREIT_Condition;
	information		= DIA_Xardas_BEREIT_Info;
	description		= "我 已 经 准 备 好 与 龙 作 战 。";
};

func int DIA_Xardas_BEREIT_Condition()
{
	if ((Xardas_GoesToRitualInnosEye == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Xardas_RITUALREQUEST))
	&& ((hero.guild == GIL_DJG)
	|| (hero.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Xardas_BEREIT_Info()
{
	AI_Output(other, self, "DIA_Xardas_BEREIT_15_00"); //我 已 经 准 备 好 与 龙 作 战 。
	AI_Output(self, other, "DIA_Xardas_BEREIT_14_01"); //那 么 我 们 不 能 浪 费 一 点 时 间 ， 我 立 即 动 身 去 太 阳 之 环 。 完 成 你 的 任 务 ， 我 会 在 那 里 等 你 。
	AI_StopProcessInfos(self);
	B_LogEntry(TOPIC_INNOSEYE, TOPIC_INNOSEYE_9);
	B_GivePlayerXP(XP_Ambient);
	Npc_ExchangeRoutine(self, "RitualInnosEyeRepair");
	Xardas_GoesToRitualInnosEye = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info bingespannt
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_BINGESPANNT(C_INFO)
{
	npc				= NONE_100_Xardas;
	nr				= 35;
	condition		= DIA_Xardas_BINGESPANNT_Condition;
	information		= DIA_Xardas_BINGESPANNT_Info;
	permanent		= TRUE;
	description		= "翻 转 仪 式 已 经 开 始 运 行 了 ？";
};

func int DIA_Xardas_BINGESPANNT_Condition()
{
	if ((MIS_RitualInnosEyeRepair == LOG_RUNNING)
	&& (Kapitel == 3)
	&& (Xardas_GoesToRitualInnosEye == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_BINGESPANNT_Info()
{
	AI_Output(other, self, "DIA_Xardas_BINGESPANNT_15_00"); //翻 转 仪 式 已 经 开 始 运 行 了 ？
	AI_Output(self, other, "DIA_Xardas_BINGESPANNT_14_01"); //我 不 能 肯 定 。 那 要 看 瓦 卓 斯 究 竟 要 做 什 么 。
};

///////////////////////////////////////////////////////////////////////
//	Info PyroWillNicht
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_PYROWILLNICHT(C_INFO)
{
	npc				= NONE_100_Xardas;
	nr				= 37;
	condition		= DIA_Xardas_PYROWILLNICHT_Condition;
	information		= DIA_Xardas_PYROWILLNICHT_Info;
	description		= "皮 罗 卡 拒 绝 出 席 仪 式 。";
};

func int DIA_Xardas_PYROWILLNICHT_Condition()
{
	if ((Pyrokar_DeniesInnosEyeRitual == TRUE)
	&& (Npc_KnowsInfo(other, DIA_Xardas_RITUALREQUEST))
	&& (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_PYROWILLNICHT_Info()
{
	AI_Output(other, self, "DIA_Xardas_PYROWILLNICHT_15_00"); //皮 罗 卡 拒 绝 出 席 仪 式 。
	AI_Output(other, self, "DIA_Xardas_PYROWILLNICHT_15_01"); //首 先 ， 他 要 证 明 你 值 得 信 任 。
	AI_Output(self, other, "DIA_Xardas_PYROWILLNICHT_14_02"); //啊 ， 真 的 。 皮 罗 卡 。 多 有 意 思 啊 。
	AI_Output(self, other, "DIA_Xardas_PYROWILLNICHT_14_03"); //那 个 老 头 子 变 得 越 发 讨 厌 了 。 不 过 我 想 有 一 些 有 用 的 东 西 给 你 。
	AI_Output(self, other, "DIA_Xardas_PYROWILLNICHT_14_04"); //那 时 候 我 离 开 了 火 魔 法 师 修 道 会 ， 我 还 从 修 道 院 带 走 了 一 些 东 西 。
	// AI_Output(self, other, "DIA_Xardas_PYROWILLNICHT_14_05"); // Jetzt, da ich meinen Turm so nahe der Stadt errichtet habe, muss ich ständig damit rechnen, dass jemand hierher kommt, um danach zu suchen.
	// "hier" passt nicht, weil Xardas am Steinkreis stehen könnte - Satz ist eh überflüssig
	AI_Output(self, other, "DIA_Xardas_PYROWILLNICHT_14_06"); //我 不 想 让 一 队 圣 骑 士 或 者 火 魔 法 师 在 某 个 时 候 把 我 的 塔 翻 个 底 朝 天 ， 然 后 找 到 那 些 东 西 。
	AI_Output(self, other, "DIA_Xardas_PYROWILLNICHT_14_07"); //所 以 我 把 它 们 藏 在 一 个 安 全 的 地 方 ， 魔 法 师 们 永 远 也 不 到 它 们 。
	AI_Output(other, self, "DIA_Xardas_PYROWILLNICHT_15_08"); //在 哪 里 ？
	AI_Output(self, other, "DIA_Xardas_PYROWILLNICHT_14_09"); //他 们 中 有 一 些 被 锁 在 塞 柯 布 的 农 场 里 的 一 个 箱 子 里 。
	Sekob_RoomFree = TRUE;
	AI_Output(other, self, "DIA_Xardas_PYROWILLNICHT_15_10"); //你 相 信 那 个 塞 柯 布 ？
	AI_Output(self, other, "DIA_Xardas_PYROWILLNICHT_14_11"); //不 。 但 是 他 可 以 被 收 买 ， 而 且 没 有 任 何 棘 手 的 问 题 。 同 时 ， 那 个 箱 子 有 锁 。 这 是 钥 匙 。

	CreateInvItems(self, ItKe_CHEST_SEKOB_XARDASBOOK_MIS, 1);
	B_GiveInvItems(self, other, ItKe_CHEST_SEKOB_XARDASBOOK_MIS, 1);

	AI_Output(self, other, "DIA_Xardas_PYROWILLNICHT_14_12"); //在 那 些 东 西 里 有 一 个 非 常 古 老 的 书 。 当 皮 罗 卡 看 到 那 本 书 的 时 候 ， 他 就 会 知 道 它 是 从 这 里 来 的 。
	AI_Output(self, other, "DIA_Xardas_PYROWILLNICHT_14_13"); //它 对 我 已 经 没 用 了 。 所 以 我 想 ， 它 至 少 还 能 起 到 这 个 作 用 。
	B_LogEntry(TOPIC_INNOSEYE, TOPIC_INNOSEYE_11);
};

///////////////////////////////////////////////////////////////////////
//	Info RitualInnosEyeRepairImportant
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_RitualInnosEyeRepairImportant(C_INFO)
{
	npc				= NONE_100_Xardas;
	nr				= 36;
	condition		= DIA_Xardas_RitualInnosEyeRepairImportant_Condition;
	information		= DIA_Xardas_RitualInnosEyeRepairImportant_Info;
	important		= TRUE;
};

func int DIA_Xardas_RitualInnosEyeRepairImportant_Condition()
{
	if ((MIS_RitualInnosEyeRepair == LOG_SUCCESS)
	&& (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_RitualInnosEyeRepairImportant_Info()
{
	AI_Output(self, other, "DIA_Xardas_Add_14_06"); //既 然 英 诺 斯 之 眼 已 经 复 原 ， 那 你 必 须 去 对 付 龙 ！
	AI_Output(self, other, "DIA_Xardas_Add_14_07"); //他 们 都 为 黑 暗 的 神 贝 利 尔 服 务 。
	AI_Output(self, other, "DIA_Xardas_Add_14_08"); //但 是 一 定 有 某 种 尘 世 间 的 力 量 在 控 制 他 们 。 那 种 力 量 对 我 来 说 已 经 变 得 日 益 清 晰 。
	AI_Output(self, other, "DIA_Xardas_Add_14_09"); //查 出 他 们 的 力 量 之 源 是 什 么 。
	AI_Output(self, other, "DIA_Xardas_Add_14_10"); //一 旦 你 查 明 情 况 ， 马 上 回 我 这 里 ！

	Info_ClearChoices(DIA_Xardas_RitualInnosEyeRepairImportant);
	Info_AddChoice(DIA_Xardas_RitualInnosEyeRepairImportant, DIALOG_ENDE, DIA_Xardas_RitualInnosEyeRepairImportant_weiter);
};

func void DIA_Xardas_RitualInnosEyeRepairImportant_weiter()
{
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(Xardas, "Start");
	B_StartOtherRoutine(Vatras, "Start");
};

///////////////////////////////////////////////////////////////////////
//	Info wasnun
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_WASNUN(C_INFO)
{
	npc				= NONE_100_Xardas;
	nr				= 36;
	condition		= DIA_Xardas_WASNUN_Condition;
	information		= DIA_Xardas_WASNUN_Info;
	permanent		= TRUE;
	description		= "英 诺 斯 之 眼 已 经 修 好 了 。 下 面 怎 么 做 ？";
};

func int DIA_Xardas_WASNUN_Condition()
{
	if ((MIS_RitualInnosEyeRepair == LOG_SUCCESS)
	&& (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_WASNUN_Info()
{
	AI_Output(other, self, "DIA_Xardas_WASNUN_15_00"); //英 诺 斯 之 眼 已 经 修 好 了 。 下 面 怎 么 做 ？
	AI_Output(self, other, "DIA_Xardas_WASNUN_14_01"); //当 你 最 后 对 付 龙 的 时 候 ， 一 定 不 要 忘 记 配 戴 上 它 。

	if (MIS_ReadyforChapter4 == TRUE)
	{
		AI_Output(self, other, "DIA_Xardas_WASNUN_14_02"); //不 要 浪 费 任 何 时 间 。 现 在 去 矿 藏 山 谷 ， 并 杀 死 那 些 龙 。
	}
	else
	{
		AI_Output(self, other, "DIA_Xardas_WASNUN_14_03"); //去 找 皮 罗 卡 ， 让 他 告 诉 你 如 何 使 用 ‘ 眼 睛 ’ 。
	};
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
instance DIA_Xardas_KAP4_EXIT(C_INFO)
{
	npc				= NONE_100_Xardas;
	nr				= 999;
	condition		= DIA_Xardas_KAP4_EXIT_Condition;
	information		= DIA_Xardas_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Xardas_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Xardas_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info perm4
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_PERM4(C_INFO)
{
	npc				= NONE_100_Xardas;
	nr				= 40;
	condition		= DIA_Xardas_PERM4_Condition;
	information		= DIA_Xardas_PERM4_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 消 息 ？";
};

func int DIA_Xardas_PERM4_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Xardas_PERM4_Info()
{
	AI_Output(other, self, "DIA_Xardas_PERM4_15_00"); //有 什 么 新 消 息 ？
	AI_Output(self, other, "DIA_Xardas_PERM4_14_01"); //搜 索 者 还 没 有 离 开 。 他 们 在 杀 死 你 之 前 不 会 停 息 。
	AI_Output(self, other, "DIA_Xardas_PERM4_14_02"); //杀 死 矿 藏 山 谷 里 的 龙 ， 并 弄 清 楚 是 谁 在 幕 后 指 挥 这 些 攻 击 。 否 则 ， 他 们 的 力 量 只 会 不 断 增 强 。
};

// #####################################################################
// ##
// ##
// ## KAPITEL 5 // Xardas ist weg!!
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************
instance DIA_Xardas_KAP5_EXIT(C_INFO)
{
	npc				= NONE_100_Xardas;
	nr				= 999;
	condition		= DIA_Xardas_KAP5_EXIT_Condition;
	information		= DIA_Xardas_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Xardas_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Xardas_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 6 // Xardas ist auf der Dracheninsel ->neue Instanz!!!
// ##
// ##
// #####################################################################
instance DIA_Xardas_KAP6_EXIT(C_INFO)
{
	npc				= NONE_100_Xardas;
	nr				= 999;
	condition		= DIA_Xardas_KAP6_EXIT_Condition;
	information		= DIA_Xardas_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Xardas_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Xardas_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};
