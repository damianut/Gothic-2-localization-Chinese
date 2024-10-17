// *************************************************************************
// 									Drachenfrage 1
// *************************************************************************
instance DIA_DragonTalk_Main_1(C_INFO)
{
	nr				= 10;
	condition		= DIA_DragonTalk_Main_1_Condition;
	information		= DIA_DragonTalk_Main_1_Info;
	description		= "你 到 这 里 来 做 什 么 ？";
};

func int DIA_DragonTalk_Main_1_Condition()
{
	if (MIS_KilledDragons == 0)
	{
		return 1;
	};
};

func void DIA_DragonTalk_Main_1_Info()
{
	AI_Output(other, self, "DIA_DragonTalk_Main_1_15_00"); //邪 恶 的 奴 仆 。 你 为 什 么 出 现 在 这 里 ？ 你 只 是 来 散 布 恐 惧 和 惊 慌 的 吗 ？
	AI_Output(self, other, "DIA_DragonTalk_Main_1_20_01"); //我 们 在 这 个 世 界 里 集 会 的 最 高 含 义 ， 渺 小 的 人 类 ， 是 不 会 让 你 知 道 的 。

	Info_AddChoice(DIA_DragonTalk_Main_1, "我 怎 么 找 到 其 它 龙 来 交 谈 ？", DIA_DragonTalk_Main_1_reden);
	Info_AddChoice(DIA_DragonTalk_Main_1, "要 想 再 次 驱 逐 你 的 话 ， 我 必 须 要 怎 么 做 ？", DIA_DragonTalk_Main_1_verbannen);

	DragonTalk_Exit_Free = TRUE;
};

func void DIA_DragonTalk_Main_1_verbannen()
{
	AI_Output(other, self, "DIA_DragonTalk_MAIN_1_verbannen_15_00"); //以 英 诺 斯 之 名 ， 我 要 怎 么 做 才 能 再 次 将 你 驱 逐 到 人 类 领 域 之 外 呢 ？
	AI_Output(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_01"); //（ 大 笑 ） 在 你 能 行 动 之 前 ， 你 必 须 首 先 要 明 白 我 们 的 集 会 的 意 义 。
	AI_Output(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_02"); //然 而 ， 是 不 会 有 人 自 愿 向 你 透 露 的 。
	AI_Output(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_03"); //‘ 眼 睛 ’ 可 能 会 让 我 们 放 松 喉 舌 ， 并 告 诉 你 我 们 真 正 的 目 标 。
	AI_Output(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_04"); //无 论 如 何 ， 当 你 死 去 的 时 候 ， 这 些 对 你 将 不 再 有 任 何 意 义 。

	if (hero.guild == GIL_DJG)
	{
		AI_Output(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_05"); //已 经 有 人 向 我 们 报 告 ， 你 已 经 选 择 了 龙 猎 手 之 路 。
		AI_Output(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_06"); //因 此 ， 我 们 已 经 向 你 们 的 世 界 派 遣 了 我 们 的 后 代 ， 以 确 保 我 们 的 祖 先 血 统 的 延 续 。
		AI_Output(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_07"); //你 已 经 失 败 了 ， 渺 小 的 人 类 。

		Log_CreateTopic(TOPIC_DRACHENEIER, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DRACHENEIER, LOG_RUNNING);
		B_LogEntry(TOPIC_DRACHENEIER, TOPIC_DRACHENEIER_1);
	}
	else
	{
		AI_Output(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_08"); //眼 睛 赋 予 了 你 进 入 的 权 力 。 然 而 ， 一 场 单 打 独 斗 将 会 决 定 你 是 否 配 做 我 的 对 手 。
	};
};

func void DIA_DragonTalk_Main_1_reden()
{
	AI_Output(other, self, "DIA_DragonTalk_MAIN_1_reden_15_00"); //我 怎 么 找 到 其 它 龙 来 交 谈 ？
	AI_Output(self, other, "DIA_DragonTalk_MAIN_1_reden_20_01"); //只 有 我 的 心 脏 能 帮 助 你 恢 复 眼 睛 的 力 量 。
	AI_Output(self, other, "DIA_DragonTalk_MAIN_1_reden_20_02"); //但 你 是 无 法 成 功 取 走 我 的 心 脏 的 。
};

// *************************************************************************
// 									Drachenfrage 2
// *************************************************************************
instance DIA_DragonTalk_Main_2(C_INFO)
{
	nr				= 10;
	condition		= DIA_DragonTalk_Main_2_Condition;
	information		= DIA_DragonTalk_Main_2_Info;
	description		= "谁 派 你 来 这 里 的 ？";
};

func int DIA_DragonTalk_Main_2_Condition()
{
	if (MIS_KilledDragons == 1)
	{
		return 1;
	};
};

func void DIA_DragonTalk_Main_2_Info()
{
	AI_Output(other, self, "DIA_DragonTalk_Main_2_15_00"); //你 听 从 谁 的 命 令 ？ 谁 派 你 来 这 里 的 ？
	AI_Output(self, other, "DIA_DragonTalk_Main_2_20_01"); //我 们 的 未 来 和 幸 福 由 主 人 的 ‘ 力 量 之 语 ’ 所 控 制 。 很 快 将 没 有 人 能 反 抗 他 。
	AI_Output(self, other, "DIA_DragonTalk_Main_2_20_02"); //他 的 臂 膀 早 已 远 远 地 从 死 亡 国 度 伸 出 。 夜 晚 的 灵 魂 们 欢 聚 在 一 起 等 候 他 的 到 来 。
	AI_Output(self, other, "DIA_DragonTalk_Main_2_20_03"); //他 将 会 战 胜 你 们 人 类 ， 并 统 治 世 界 。
	AI_Output(self, other, "DIA_DragonTalk_Main_2_20_04"); //在 他 的 阴 影 之 下 ， 我 们 不 过 是 他 创 造 性 的 力 量 中 的 附 属 品 。
	AI_Output(self, other, "DIA_DragonTalk_Main_2_20_05"); //主 人 将 会 把 你 们 饱 受 折 磨 的 尸 体 从 灰 烬 中 复 苏 ， 并 利 用 他 们 改 造 这 个 世 界 的 命 运 。

	B_LogEntry(TOPIC_DRACHENJAGD, TOPIC_DRACHENJAGD_1);

	DragonTalk_Exit_Free = TRUE;
};

// *************************************************************************
// 									Drachenfrage 3
// *************************************************************************
instance DIA_DragonTalk_Main_3(C_INFO)
{
	nr				= 10;
	condition		= DIA_DragonTalk_Main_3_Condition;
	information		= DIA_DragonTalk_Main_3_Info;
	description		= "我 怎 么 击 败 你 的 主 人 ？";
};

func int DIA_DragonTalk_Main_3_Condition()
{
	if (MIS_KilledDragons == 2)
	{
		return 1;
	};
};

func void DIA_DragonTalk_Main_3_Info()
{
	AI_Output(other, self, "DIA_DragonTalk_Main_3_15_00"); //我 怎 么 击 败 你 的 主 人 ？
	AI_Output(self, other, "DIA_DragonTalk_Main_3_20_01"); //他 是 万 能 的 ， 近 乎 无 敌 。 然 而 你 如 此 愚 蠢 地 想 去 见 他 ， 你 将 经 受 一 个 缓 慢 而 痛 苦 的 死 亡 。
	AI_Output(other, self, "DIA_DragonTalk_Main_3_15_02"); //这 不 是 我 第 一 次 听 到 。 近 乎 无 敌 不 代 表 我 不 能 杀 死 他 。
	AI_Output(other, self, "DIA_DragonTalk_Main_3_15_03"); //那 么 ， 说 说 看 ： 我 必 须 要 怎 么 做 ？
	AI_Output(self, other, "DIA_DragonTalk_Main_3_20_04"); //要 想 对 抗 我 的 主 人 ， 你 需 要 他 永 远 也 无 法 得 到 的 东 西 。
	AI_Output(other, self, "DIA_DragonTalk_Main_3_15_05"); //那 是 什 么 ？
	AI_Output(self, other, "DIA_DragonTalk_Main_3_20_06"); //你 必 须 穿 上 在 你 们 世 俗 国 度 中 最 好 的 盔 甲 ， 并 让 它 覆 盖 住 你 的 皮 肤 。

	if ((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self, other, "DIA_Dragons_Add_20_01"); //你 需 要 一 把 受 过 你 的 神 祝 福 的 剑 。
	}
	else if ((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self, other, "DIA_Dragons_Add_20_02"); //你 需 要 一 个 只 为 你 而 做 的 咒 语 。
	}
	else // Sld - Djg
	{
		AI_Output(self, other, "DIA_Dragons_Add_20_00"); //你 需 要 一 件 只 为 你 而 铸 的 武 器 。
	};

	AI_Output(self, other, "DIA_DragonTalk_Main_3_20_08"); //但 是 这 一 切 中 最 难 的 条 件 是 ， 你 必 须 找 到 五 名 甘 愿 随 你 而 死 的 同 伴 。
	AI_Output(self, other, "DIA_DragonTalk_Main_3_20_09"); //然 后 ， 只 有 那 时 你 才 能 面 对 主 人 。

	DragonTalk_Exit_Free = TRUE;
};

// *************************************************************************
// 									Drachenfrage 4
// *************************************************************************
instance DIA_DragonTalk_Main_4(C_INFO)
{
	nr				= 10;
	condition		= DIA_DragonTalk_Main_4_Condition;
	information		= DIA_DragonTalk_Main_4_Info;
	description		= "我 怎 么 才 能 找 到 你 的 主 人 ？";
};

func int DIA_DragonTalk_Main_4_Condition()
{
	if (MIS_KilledDragons == 3)
	{
		return 1;
	};
};

func void DIA_DragonTalk_Main_4_Info()
{
	AI_Output(other, self, "DIA_DragonTalk_Main_4_15_00"); //我 怎 么 才 能 找 到 你 的 主 人 ？
	AI_Output(self, other, "DIA_DragonTalk_Main_4_20_01"); //他 已 经 藏 身 在 伊 尔 多 拉 斯 大 厅 坚 固 的 岩 石 之 中 ， 并 在 那 里 等 候 他 的 命 运 。
	AI_Output(self, other, "DIA_DragonTalk_Main_4_20_02"); //在 他 能 把 这 个 世 界 变 成 它 所 预 期 的 世 界 之 前 ， 他 会 一 直 在 那 里 沉 入 深 深 地 冥 思 ， 还 有 … …
	AI_Output(other, self, "DIA_DragonTalk_Main_4_15_03"); //不 要 向 我 说 细 节 了 。 就 告 诉 我 在 哪 里 能 找 到 这 些 神 圣 的 伊 尔 多 拉 斯 大 厅 。
	AI_Output(self, other, "DIA_DragonTalk_Main_4_20_04"); //哈 哈 哈 。 你 让 我 失 望 了 ， 小 东 西 。 似 乎 你 已 经 抵 抗 住 所 有 的 危 险 ， 并 几 乎 打 败 了 我 们 所 有 人 ， 现 在 你 却 无 法 利 用 那 些 无 上 的 知 识 而 失 败 。
	AI_Output(self, other, "DIA_DragonTalk_Main_4_20_05"); //如 果 伊 尔 多 拉 斯 对 你 没 有 任 何 意 义 的 话 ， 那 么 你 最 好 去 找 你 们 的 魔 法 师 ， 并 请 求 他 们 的 许 可 来 解 决 他 们 世 俗 的 要 求 。
	AI_Output(self, other, "DIA_DragonTalk_Main_4_20_06"); //显 而 易 见 ， 你 还 没 有 准 备 好 担 负 他 们 的 无 上 知 识 的 重 担 。

	Log_CreateTopic(TOPIC_BuchHallenVonIrdorath, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BuchHallenVonIrdorath, LOG_RUNNING);
	B_LogEntry(TOPIC_BuchHallenVonIrdorath, TOPIC_BuchHallenVonIrdorath_1);

	B_NPC_IsAliveCheck(OLDWORLD_ZEN); // Joly: bringt Angar und Gorn in die NW.
	DragonTalk_Exit_Free = TRUE;
};

//**********************************************************************************
//		B_AssignDragonTalk_Main
//**********************************************************************************

func void B_AssignDragonTalk_Main(var C_Npc slf)
{
	DIA_DragonTalk_Main_1.npc = Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_2.npc = Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_3.npc = Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_4.npc = Hlp_GetInstanceID(slf);
};
