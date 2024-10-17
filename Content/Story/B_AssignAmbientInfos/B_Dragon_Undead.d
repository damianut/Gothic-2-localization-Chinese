// -------------------------------------------------------------------------
// Nicos Satz
// -------------------------------------------------------------------------
func void B_Dragon_Undead_Bla()
{
	AI_Output(self, other, "DIA_Addon_UndeadDragon_Add_20_00"); //嗯 ， 小 子 ？ 那 你 找 到 原 始 抄 本 了 ？
};

// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Dragon_Undead_Exit(C_INFO)
{
	npc				= Dragon_Undead;
	nr				= 999;
	condition		= DIA_Dragon_Undead_Exit_Condition;
	information		= DIA_Dragon_Undead_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Dragon_Undead_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Undead_Exit_Info()
{
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
};

// *************************************************************************
// 									Hello
// *************************************************************************
instance DIA_Dragon_Undead_Hello(C_INFO)
{
	npc				= Dragon_Undead;
	nr				= 5;
	condition		= DIA_Dragon_Undead_Hello_Condition;
	information		= DIA_Dragon_Undead_Hello_Info;
	important		= TRUE;
};

func int DIA_Dragon_Undead_Hello_Condition()
{
	if (Npc_HasItems(other, ItMi_InnosEye_MIS) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Undead_Hello_Info()
{
	AI_Output(self, other, "DIA_Dragon_Undead_Hello_20_00"); //现 在 你 已 经 想 办 法 找 到 了 我 。 我 等 你 的 到 来 已 经 很 久 了 。
	AI_Output(other, self, "DIA_Dragon_Undead_Hello_15_01"); //别 再 装 了 。 不 要 假 装 你 已 经 那 样 计 划 了 很 久 的 样 子 。
	AI_Output(self, other, "DIA_Dragon_Undead_Hello_20_02"); //（ 大 笑 ） 你 知 道 我 的 目 的 是 什 么 ？
	AI_Output(self, other, "DIA_Dragon_Undead_Hello_20_03"); //难 道 我 没 有 派 出 搜 索 者 引 诱 你 追 查 我 的 踪 迹 吗 ？
	AI_Output(self, other, "DIA_Dragon_Undead_Hello_20_04"); //难 道 我 没 有 留 下 清 晰 的 、 证 明 我 存 在 的 迹 象 让 你 绝 对 不 会 忘 记 我 吗 ？

	if ((hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7))
	{
		AI_Output(self, other, "DIA_Dragon_Undead_Hello_20_05"); //难 道 你 不 是 因 为 穿 着 龙 蛋 铸 造 成 的 盔 甲 的 帮 助 才 来 到 我 这 里 的 吗 ？
	};

	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_Dragon_Undead_Hello_20_06"); //难 道 那 个 被 转 变 的 圣 骑 士 不 是 驱 使 你 追 查 那 个 神 秘 控 制 力 量 的 原 因 吗 ？
	};

	if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Dragon_Undead_Hello_20_07"); //难 道 被 附 体 的 你 们 的 同 类 不 是 驱 使 你 追 查 那 个 神 秘 控 制 力 量 的 原 因 吗 ？
	};

	AI_Output(self, other, "DIA_Dragon_Undead_Hello_20_08"); //如 同 你 辗 转 反 侧 一 样 ， 你 无 法 怀 疑 所 有 那 一 切 。

	// ADDON
	AI_Output(self, other, "DIA_Addon_UndeadDragon_Add_20_01"); //只 有 一 件 事 没 有 预 先 决 定 ！
	AI_Output(self, other, "DIA_Addon_UndeadDragon_Add_20_02"); //你 杀 死 了 我 的 一 个 仆 人 ！ 他 被 选 中 持 有 爪 子 。
	AI_Output(self, other, "DIA_Addon_UndeadDragon_Add_20_03"); //如 我 所 见 ， 你 现 在 正 拿 着 它 。 因 为 这 种 侮 辱 ， 你 将 会 死 ！

	Info_AddChoice(DIA_Dragon_Undead_Hello, "别 说 了 。", DIA_Dragon_Undead_Hello_attack);
	Info_AddChoice(DIA_Dragon_Undead_Hello, "你 是 为 了 谁 的 利 益 率 领 你 的 奴 才 与 人 类 作 战 ？", DIA_Dragon_Undead_Hello_Auftraggeber);
	Info_AddChoice(DIA_Dragon_Undead_Hello, "那 么 你 为 什 么 在 这 里 ？", DIA_Dragon_Undead_Hello_warum);
	Info_AddChoice(DIA_Dragon_Undead_Hello, "站 住 - 你 是 谁 ？", DIA_Dragon_Undead_Hello_wer);

	B_LogEntry(TOPIC_HallenVonIrdorath, TOPIC_HallenVonIrdorath_7);
};

func void DIA_Dragon_Undead_Hello_wer()
{
	AI_Output(other, self, "DIA_Dragon_Undead_Hello_wer_15_00"); //你 是 谁 ？
	AI_Output(self, other, "DIA_Dragon_Undead_Hello_wer_20_01"); //（ 大 笑 ） 你 还 要 问 那 个 ？ 在 你 自 己 脑 子 里 去 找 吧 ， 你 这 个 傻 瓜 。 你 知 道 我 是 谁 。
	AI_Output(self, other, "DIA_Dragon_Undead_Hello_wer_20_02"); //我 没 有 名 字 。 正 如 你 没 有 名 字 一 样 。
	AI_Output(self, other, "DIA_Dragon_Undead_Hello_wer_20_03"); //我 的 神 力 来 自 我 的 创 造 者 。 如 同 你 的 力 量 来 自 你 心 中 的 神 一 样 。

	AI_Output(self, other, "DIA_Dragon_Undead_Hello_wer_20_04"); //我 的 命 运 是 破 坏 世 界 。

	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self, other, "DIA_Dragon_Undead_Hello_wer_20_05"); //正 如 你 的 命 运 由 圣 骑 士 的 公 正 和 德 行 决 定 一 样 。
	};

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Dragon_Undead_Hello_wer_20_06"); //正 如 你 的 手 所 带 来 的 死 亡 一 样 ， 龙 猎 手 。
	};

	if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Dragon_Undead_Hello_wer_20_07"); //正 如 你 的 目 的 是 说 教 英 诺 斯 的 信 仰 一 样 ， 火 魔 法 师 。
	};

	AI_Output(self, other, "DIA_Dragon_Undead_Hello_wer_20_08"); //你 没 有 感 觉 到 把 我 们 系 在 一 起 的 那 条 线 吗 ？ 是 的 。 你 知 道 我 是 谁 。
	AI_Output(other, self, "DIA_Dragon_Undead_Hello_wer_15_09"); //（ 混 乱 的 ） 不 。 那 不 可 能 。 艾 克 萨 达 斯 一 直 说 … …
	AI_Output(self, other, "DIA_Dragon_Undead_Hello_wer_20_10"); //艾 克 萨 达 斯 太 软 弱 ， 对 我 没 有 威 胁 。 你 才 值 得 来 面 对 我 。
	AI_Output(self, other, "DIA_Dragon_Undead_Hello_wer_20_11"); //命 运 已 经 注 定 。 接 受 你 的 命 运 的 时 间 到 了 。
};

func void DIA_Dragon_Undead_Hello_warum()
{
	AI_Output(other, self, "DIA_Dragon_Undead_Hello_warum_15_00"); //那 么 你 为 什 么 在 这 里 ？
	AI_Output(self, other, "DIA_Dragon_Undead_Hello_warum_20_01"); //我 的 神 力 将 会 以 暴 力 之 河 将 整 个 世 界 淹 没 。
	AI_Output(self, other, "DIA_Dragon_Undead_Hello_warum_20_02"); //只 有 当 最 后 一 座 公 正 的 城 堡 倒 下 时 ， 我 才 会 休 息 。
};

func void DIA_Dragon_Undead_Hello_Auftraggeber()
{
	AI_Output(other, self, "DIA_Dragon_Undead_Hello_Auftraggeber_15_00"); //你 是 为 了 谁 的 利 益 率 领 你 的 奴 才 与 人 类 作 战 ？
	AI_Output(self, other, "DIA_Dragon_Undead_Hello_Auftraggeber_20_01"); //我 的 主 人 是 黑 夜 之 神 。 你 知 道 他 。 你 可 以 听 到 他 的 呼 唤 。
	AI_Output(self, other, "DIA_Dragon_Undead_Hello_Auftraggeber_20_03"); //我 的 军 队 将 会 以 他 的 名 义 从 地 下 崛 起 ， 并 用 黑 暗 包 裹 世 界 。
};

func void DIA_Dragon_Undead_Hello_attack()
{
	AI_Output(other, self, "DIA_Dragon_Undead_Hello_attack_15_00"); //够 了 ！ 我 要 追 你 到 天 涯 海 角 ！。
	AI_Output(self, other, "DIA_Dragon_Undead_Hello_attack_20_01"); //（ 大 笑 ） 你 还 没 有 准 备 好 来 打 败 我 。 只 要 短 暂 的 一 刻 我 就 能 达 到 我 的 目 的 。
	// ADDON
	if ((C_ScHasEquippedBeliarsWeapon())
	|| (C_ScHasReadiedBeliarsWeapon())
	|| (C_ScHasBeliarsRune()))
	{
		AI_Output(self, other, "DIA_Addon_UndeadDragon_Add_20_04"); //你 真 的 以 为 你 能 用 爪 子 伤 到 我 吗 ？ （ 大 笑 ）
	};

	// ADDON ENDE
	AI_Output(self, other, "DIA_Dragon_Undead_Hello_attack_20_02"); //你 的 尸 体 将 帮 助 我 把 死 亡 的 灾 难 之 风 吹 遍 世 界 。

	Npc_RemoveInvItems(other, ItMi_InnosEye_MIS, 1);
	CreateInvItems(other, ItMi_InnosEye_Discharged_MIS, 1);
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
};
