///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_EXIT(C_INFO)
{
	npc				= KDW_1400_Addon_Saturas_NW;
	nr				= 999;
	condition		= DIA_Addon_Saturas_EXIT_Condition;
	information		= DIA_Addon_Saturas_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Saturas_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_EXIT_Info()
{
	if (MIS_Addon_Saturas_BringRiordian2Me == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Saturas_auftrag_14_01"); //既 然 你 不 能 让 其 它 法 师 停 下 他 们 手 上 的 工 作 ， 你 也 许 可 以 给 他 们 中 的 某 个 人 送 去 我 的 口 信 。
		AI_Output(self, other, "DIA_Addon_Saturas_auftrag_14_02"); //告 诉 瑞 奥 淀 我 要 在 这 里 见 他 。
		AI_Output(self, other, "DIA_Addon_Saturas_auftrag_14_03"); //他 在 地 下 室 后 面 。 你 可 以 在 那 里 找 到 他 。
		MIS_Addon_Saturas_BringRiordian2Me = LOG_RUNNING;

		Log_CreateTopic(TOPIC_Addon_HolRiordian, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_HolRiordian, LOG_RUNNING);
		B_LogEntry(TOPIC_Addon_HolRiordian, TOPIC_Addon_HolRiordian_1);
	};

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Nefarius
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Nefarius(C_INFO)
{
	npc				= KDW_1400_Addon_Saturas_NW;
	nr				= 2;
	condition		= DIA_Addon_Saturas_Nefarius_Condition;
	information		= DIA_Addon_Saturas_Nefarius_Info;
	description		= "我 应 该 为 内 法 利 尔 斯 找 到 装 饰 物 失 踪 的 部 分 。";
};

func int DIA_Addon_Saturas_Nefarius_Condition()
{
	if (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_Nefarius_Info()
{
	AI_Output(other, self, "DIA_ADDON_Saturas_Nefarius_15_00"); //我 应 该 为 内 法 利 尔 斯 找 到 装 饰 物 失 踪 的 部 分 。
	AI_Output(self, other, "DIA_ADDON_Saturas_Nefarius_14_01"); //什 么 ？ 难 以 置 信 ！ 你 又 受 到 影 响 了 ？
	AI_Output(other, self, "DIA_ADDON_Saturas_Nefarius_15_02"); //不 用 担 心 ， 我 会 把 东 西 带 到 这 里 来 。

	if ((ORNAMENT_SWITCHED_FOREST == FALSE)
	&& (Npc_HasItems(other, ItWr_Map_NewWorld_Ornaments_Addon)))
	{
		AI_Output(self, other, "DIA_ADDON_Saturas_Nefarius_14_03"); //（ 叹 息 ） 你 至 少 知 道 正 在 找 什 么 吧 ？
		AI_Output(other, self, "DIA_ADDON_Saturas_Nefarius_15_04"); //内 法 利 尔 斯 给 了 我 这 张 地 图 … …
		AI_Output(self, other, "DIA_ADDON_Saturas_Nefarius_14_05"); //让 我 看 看 ！
		B_UseFakeScroll();
		AI_Output(self, other, "DIA_ADDON_Saturas_Nefarius_14_06"); //嗯 。 在 大 森 林 里 非 常 危 险 。 你 不 应 该 一 个 人 去 。
		AI_Output(self, other, "DIA_ADDON_Saturas_Nefarius_14_07"); //在 克 霍 里 尼 斯 找 个 人 陪 你 。
		AI_Output(self, other, "DIA_ADDON_Saturas_Nefarius_14_08"); //我 不 想 让 你 被 怪 物 吃 掉 - 还 有 你 身 上 的 装 饰 物 。
		AI_Output(self, other, "DIA_ADDON_Saturas_Nefarius_14_09"); //这 是 你 的 地 图 … …

		Log_CreateTopic(TOPIC_Addon_Ornament, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Ornament, LOG_RUNNING);
		B_LogEntry(TOPIC_Addon_Ornament, TOPIC_Addon_Ornament_6);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Hallo(C_INFO)
{
	npc				= KDW_1400_Addon_Saturas_NW;
	nr				= 2;
	condition		= DIA_Addon_Saturas_Hallo_Condition;
	information		= DIA_Addon_Saturas_Hallo_Info;
	important		= TRUE;
};

func int DIA_Addon_Saturas_Hallo_Condition()
{
	Npc_PerceiveAll(self);
	if (Wld_DetectNpc(self, Gobbo_Skeleton, ZS_MM_Attack, -1) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_Hallo_weisstdu()
{
	AI_Output(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_00"); //你 是 否 有 想 过 你 在 那 时 候 做 了 什 么 ？
	AI_Output(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_01"); //你 已 经 把 魔 法 结 构 弄 得 一 团 糟 ， 消 息 很 快 就 会 传 回 克 霍 里 尼 斯 。
	AI_Output(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_02"); //你 真 是 幸 运 ， 那 么 简 单 就 在 一 天 内 破 坏 了 屏 障 。
	AI_Output(other, self, "DIA_Addon_Saturas_Hallo_weißtdu_15_03"); //你 在 抱 怨 什 么 ？ 都 已 经 顺 利 解 决 了 。
	AI_Output(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_04"); //（ 怒 吼 ） 注 意 你 的 言 辞 ！
	AI_Output(self, other, "DIA_Addon_Saturas_Hallo_weißtdu_14_05"); //（ 激 昂 ） 你 到 底 想 要 从 这 里 得 到 什 么 ？
	Info_ClearChoices(DIA_Addon_Saturas_Hallo);
};

func void DIA_Addon_Saturas_Hallo_Info()
{
	AI_Output(self, other, "DIA_Addon_Saturas_Hallo_14_00"); //你 疯 了 吗 ？ 离 开 这 里 。
	AI_Output(self, other, "DIA_Addon_Saturas_Hallo_14_01"); //对 一 个 自 诩 的 冒 险 者 来 说 ， 这 些 地 下 室 太 危 险 了 。
	AI_Output(self, other, "DIA_Addon_Saturas_Hallo_14_02"); //（ 生 气 ） 不 过 说 起 来 ， 我 认 识 你 吗 ？ 当 然 。 你 这 个 混 蛋 … …
	AI_Output(self, other, "DIA_Addon_Saturas_Hallo_14_03"); //（ 生 气 ） 不 要 以 为 我 已 经 忘 记 了 你 如 何 在 新 营 地 背 叛 了 我 们 。

	Info_ClearChoices(DIA_Addon_Saturas_Hallo);
	Info_AddChoice(DIA_Addon_Saturas_Hallo, "（ 局 促 不 安 ） 我 … …", DIA_Addon_Saturas_Hallo_Video);
};

func void DIA_Addon_Saturas_Hallo_Video()
{
	PlayVideo("oreheap.bik");
	AI_Output(self, other, "DIA_Addon_Saturas_Video_14_00"); //（ 生 气 ） 你 把 我 们 堆 积 如 山 的 魔 法 矿 石 能 量 吸 尽 之 后 就 消 失 了 ！
	AI_Output(self, other, "DIA_Addon_Saturas_Video_14_01"); //（ 生 气 ） 你 究 竟 认 为 自 己 在 做 什 么 ？

	Info_ClearChoices(DIA_Addon_Saturas_Hallo);
	Info_AddChoice(DIA_Addon_Saturas_Hallo, "我 很 抱 歉 。 我 不 知 道 我 做 了 什 么 。", DIA_Addon_Saturas_Hallo_sorry);
	Info_AddChoice(DIA_Addon_Saturas_Hallo, "你 的 计 划 不 会 再 起 作 用 了 。", DIA_Addon_Saturas_Hallo_Spott);
	Info_AddChoice(DIA_Addon_Saturas_Hallo, "那 是 必 须 的 。", DIA_Addon_Saturas_Hallo_notwendig);
};

func void DIA_Addon_Saturas_Hallo_notwendig()
{
	AI_Output(other, self, "DIA_Addon_Saturas_Hallo_notwendig_15_00"); //那 是 必 然 的 。 没 有 了 矿 石 的 能 量 ， 我 永 远 无 法 击 败 沉 睡 者 。
	AI_Output(self, other, "DIA_Addon_Saturas_Hallo_notwendig_14_01"); //（ 生 气 ） 那 是 多 么 愚 蠢 的 话 啊 ？ 沉 睡 者 ？ 被 击 败 ？
	DIA_Addon_Saturas_Hallo_weisstdu();
};

func void DIA_Addon_Saturas_Hallo_Spott()
{
	AI_Output(other, self, "DIA_Addon_Saturas_Hallo_Spott_15_00"); //你 的 计 划 不 可 能 会 成 功 。 用 矿 石 山 粉 碎 屏 障 是 我 听 过 的 最 荒 谬 的 事 。
	AI_Output(other, self, "DIA_Addon_Saturas_Hallo_Spott_15_01"); //最 后 ， 你 只 会 把 你 自 己 炸 到 天 上 去 。
	AI_Output(self, other, "DIA_Addon_Saturas_Hallo_Spott_14_02"); //（ 生 气 ） 那 太 过 分 了 ！ 谁 给 你 权 力 来 审 判 我 们 和 我 们 的 意 图 ？
	AI_Output(self, other, "DIA_Addon_Saturas_Hallo_Spott_14_03"); //如 果 我 不 是 如 此 爱 好 和 平 的 人 ， 我 就 会 把 亚 达 诺 斯 的 愤 怒 倾 泻 到 你 身 上 ， 我 的 孩 子 。
	DIA_Addon_Saturas_Hallo_weisstdu();
};

func void DIA_Addon_Saturas_Hallo_sorry()
{
	AI_Output(other, self, "DIA_Addon_Saturas_Hallo_sorry_15_00"); //我 很 抱 歉 。 我 不 知 道 我 做 了 什 么 。
	AI_Output(self, other, "DIA_Addon_Saturas_Hallo_sorry_14_01"); //哦 ？ 你 以 为 那 样 能 够 解 决 问 题 ？
	DIA_Addon_Saturas_Hallo_weisstdu();
};

///////////////////////////////////////////////////////////////////////
//	Info keineAhnung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_keineAhnung(C_INFO)
{
	npc				= KDW_1400_Addon_Saturas_NW;
	nr				= 5;
	condition		= DIA_Addon_Saturas_keineAhnung_Condition;
	information		= DIA_Addon_Saturas_keineAhnung_Info;
	description		= "我 没 有 任 何 线 索 。";
};

func int DIA_Addon_Saturas_keineAhnung_Condition()
{
	if (MIS_Addon_Lares_Ornament2Saturas == 0)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_keineAhnung_Info()
{
	AI_Output(other, self, "DIA_Addon_Saturas_keineAhnung_15_00"); //我 不 知 道 。 我 想 我 就 是 应 该 顺 便 拜 访 一 下 。
	AI_Output(self, other, "DIA_Addon_Saturas_keineAhnung_14_01"); //你 在 浪 费 我 的 时 间 。 离 开 这 里 。
	AI_Output(self, other, "DIA_Addon_Saturas_keineAhnung_14_02"); //（ 自 言 自 语 ） 我 以 后 再 对 付 你 。

	Log_CreateTopic(TOPIC_Addon_KDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_KDW, TOPIC_Addon_KDW_8);

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info raus
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_raus(C_INFO)
{
	npc				= KDW_1400_Addon_Saturas_NW;
	nr				= 5;
	condition		= DIA_Addon_Saturas_raus_Condition;
	information		= DIA_Addon_Saturas_raus_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_Saturas_raus_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Saturas_keineAhnung))
	&& (MIS_Addon_Lares_Ornament2Saturas == 0)
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_raus_Info()
{
	AI_Output(self, other, "DIA_Addon_Saturas_raus_14_00"); //在 某 些 事 情 发 生 在 你 身 上 之 前 ， 离 开 这 里 。
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Lares
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Lares(C_INFO)
{
	npc				= KDW_1400_Addon_Saturas_NW;
	nr				= 5;
	condition		= DIA_Addon_Saturas_Lares_Condition;
	information		= DIA_Addon_Saturas_Lares_Info;
	description		= "我 和 莱 尔 瑞 兹 一 起 来 到 这 里 。";
};

func int DIA_Addon_Saturas_Lares_Condition()
{
	if (Lares_Angekommen == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_Lares_Info()
{
	AI_Output(other, self, "DIA_Addon_Saturas_Lares_15_00"); //我 和 莱 尔 瑞 兹 一 起 来 到 这 里 。
	AI_Output(self, other, "DIA_Addon_Saturas_Lares_14_01"); //（ 关 切 的 ） 莱 尔 瑞 兹 ？ 真 的 吗 ？ 他 在 哪 里 ？
	AI_Output(other, self, "DIA_Addon_Saturas_Lares_15_02"); //我 一 个 人 。 莱 尔 瑞 兹 回 到 城 市 去 了 。
	AI_Output(self, other, "DIA_Addon_Saturas_Lares_14_03"); //什 么 ？ 他 让 你 一 个 人 来 见 我 们 ？ 他 究 竟 是 怎 么 想 的 ？
};

///////////////////////////////////////////////////////////////////////
//	Info Ornament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Ornament(C_INFO)
{
	npc				= KDW_1400_Addon_Saturas_NW;
	nr				= 5;
	condition		= DIA_Addon_Saturas_Ornament_Condition;
	information		= DIA_Addon_Saturas_Ornament_Info;
	description		= "我 带 来 了 你 的 装 饰 物 。";
};

func int DIA_Addon_Saturas_Ornament_Condition()
{
	// if(Npc_KnowsInfo(other, DIA_Addon_Saturas_Lares))
	// && (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING)
	if ((Npc_HasItems(other, ItMi_Ornament_Addon_Vatras) && (Lares_Angekommen == FALSE))
	|| ((Lares_Angekommen == TRUE) && Npc_KnowsInfo(other, DIA_Addon_Saturas_Lares) && Npc_HasItems(other, ItMi_Ornament_Addon_Vatras)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_Ornament_Info()
{
	AI_Output(other, self, "DIA_Addon_Saturas_Ornament_15_00"); //我 带 来 了 你 的 装 饰 物 。
	B_GiveInvItems(other, self, ItMi_Ornament_Addon_Vatras, 1);
	AI_Output(self, other, "DIA_Addon_Saturas_Ornament_ADD_14_00"); //那 究 竟 是 什 么 意 思 ？

	if (Lares_Angekommen == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_Saturas_Ornament_14_01"); //那 是 谁 给 你 的 ？ 不 要 对 我 说 莱 尔 瑞 兹 就 那 么 随 便 把 它 交 给 了 你 。
	};

	AI_Output(other, self, "DIA_Addon_Saturas_Ornament_15_02"); //别 胡 闹 了 。 我 把 它 给 你 带 来 了 。 你 想 要 它 ， 不 是 吗 ？
	AI_Output(self, other, "DIA_Addon_Saturas_Ornament_14_03"); //当 然 。 但 是 ， 它 让 我 感 到 你 又 一 次 插 手 到 这 个 游 戏 中 来 。
	AI_Output(other, self, "DIA_Addon_Saturas_Ornament_15_04"); //你 为 什 么 要 为 矿 石 山 那 件 旧 事 小 题 大 做 呢 ？
	AI_Output(other, self, "DIA_Addon_Saturas_Ornament_15_05"); //毕 竟 ， 我 过 去 曾 经 为 你 工 作 过 ， 而 你 不 能 说 我 是 不 值 得 信 任 的 。？
	AI_Output(self, other, "DIA_Addon_Saturas_Ornament_14_06"); //（ 叹 息 ） 它 最 终 对 我 意 味 着 什 么 呢 ？ 哼 ， 不 要 以 为 我 相 信 你 … …
	MIS_Addon_Lares_Ornament2Saturas = LOG_SUCCESS;

	// Joly: Monster auffüllen, die bei Lares gestört haben
	Wld_InsertNpc(Bloodfly, "FP_ROAM_NW_TROLLAREA_RUINS_07");
	Wld_InsertNpc(Giant_Bug, "FP_ROAM_NW_TROLLAREA_RUINS_03");
	Wld_InsertNpc(Lurker, "NW_TROLLAREA_RIVERSIDE_01");
	Wld_InsertNpc(Scavenger, "NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger, "NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger, "NW_TAVERNE_TROLLAREA_MONSTER_01_01");

	Wld_InsertNpc(Scavenger, "NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger, "NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger, "NW_TAVERNE_BIGFARM_MONSTER_01");
	Wld_InsertNpc(Scavenger, "NW_TAVERNE_BIGFARM_MONSTER_01");
	Wld_InsertNpc(Scavenger, "NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc(Scavenger, "NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc(Gobbo_Green, "NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc(Gobbo_Green, "NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc(Gobbo_Green, "NW_CITY_TO_FARM2_02"); // auf Treppe
	Wld_InsertNpc(Giant_Rat, "NW_TROLLAREA_RATS_01");
	Wld_InsertNpc(Giant_Rat, "NW_TROLLAREA_RATS_01");
	Wld_InsertNpc(Giant_Rat, "NW_TROLLAREA_RATS_01");
};

///////////////////////////////////////////////////////////////////////
//	Info geheimbund
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_geheimbund(C_INFO)
{
	npc				= KDW_1400_Addon_Saturas_NW;
	nr				= 5;
	condition		= DIA_Addon_Saturas_geheimbund_Condition;
	information		= DIA_Addon_Saturas_geheimbund_Info;
	description		= "我 要 加 入 ‘ 水 之 环 ’ 。";
};

func int DIA_Addon_Saturas_geheimbund_Condition()
{
	if ((MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	&& (SC_KnowsRanger == TRUE)
	&& (SC_IsRanger == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_geheimbund_Info()
{
	AI_Output(other, self, "DIA_Addon_Saturas_geheimbund_15_00"); //我 要 加 入 ‘ 水 之 环 ’ 。

	if (Lares_Angekommen == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_Saturas_geheimbund_14_01"); //（ 狂 怒 ） 什 么 ？ 那 是 谁 告 诉 你 的 ？ 谁 … … ？ 莱 尔 瑞 兹 … … 我 要 杀 了 他 ！
		AI_Output(self, other, "DIA_Addon_Saturas_geheimbund_14_02"); //他 已 经 破 坏 了 我 们 的 第 一 条 规 定 。 不 要 对 任 何 人 提 起 ‘ 水 之 环 ’ 。
	};

	AI_Output(self, other, "DIA_Addon_Saturas_geheimbund_14_03"); //（ 累 坏 了 ） 我 不 知 道 该 说 什 么 。 我 只 有 在 能 够 监 视 着 你 的 时 候 才 会 相 信 你 。
	AI_Output(other, self, "DIA_Addon_Saturas_geheimbund_15_04"); //是 瓦 卓 斯 告 诉 我 关 于 ‘ 水 之 环 ’ 的 事 情 。
	AI_Output(self, other, "DIA_Addon_Saturas_geheimbund_14_05"); //（ 服 从 的 ） 什 么 ？ 瓦 卓 斯 ？ （ 讽 刺 的 ） 棒 极 了 ！ 岛 上 这 么 多 水 法 师 ， 你 竟 然 遇 上 一 个 不 了 解 你 的 人 。
	AI_Output(self, other, "DIA_Addon_Saturas_geheimbund_14_06"); //我 警 告 你 ， 这 次 不 要 做 任 何 傻 事 。！
	AI_Output(other, self, "DIA_Addon_Saturas_geheimbund_15_07"); //（ 冷 淡 的 ） 我 会 努 力 的 … …

	Log_CreateTopic(TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_RingOfWater, TOPIC_Addon_RingOfWater_10);
};

///////////////////////////////////////////////////////////////////////
//	Info wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_wasmachstdu(C_INFO)
{
	npc				= KDW_1400_Addon_Saturas_NW;
	nr				= 5;
	condition		= DIA_Addon_Saturas_wasmachstdu_Condition;
	information		= DIA_Addon_Saturas_wasmachstdu_Info;
	description		= "你 在 这 下 面 干 什 么 ？";
};

func int DIA_Addon_Saturas_wasmachstdu_Condition()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_wasmachstdu_Info()
{
	AI_Output(other, self, "DIA_Addon_Saturas_wasmachstdu_15_00"); //你 在 这 下 面 干 什 么 ？
	AI_Output(self, other, "DIA_Addon_Saturas_wasmachstdu_14_01"); //（ 虔 诚 的 ） 这 些 大 厅 隐 藏 着 远 古 的 秘 密 ， 未 解 开 的 秘 密 。
	AI_Output(self, other, "DIA_Addon_Saturas_wasmachstdu_14_02"); //这 些 铭 文 和 壁 画 描 述 了 一 个 非 常 古 老 的 文 明 。
	AI_Output(self, other, "DIA_Addon_Saturas_wasmachstdu_14_03"); //你 在 这 里 看 到 的 一 切 都 是 用 一 种 我 们 还 不 知 道 的 语 言 写 成 的 。
	AI_Output(self, other, "DIA_Addon_Saturas_wasmachstdu_14_04"); //我 们 只 是 刚 刚 开 始 学 习 并 领 会 它 的 含 义 。
};

///////////////////////////////////////////////////////////////////////
//	Info Erdbeben
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Erdbeben(C_INFO)
{
	npc				= KDW_1400_Addon_Saturas_NW;
	nr				= 6;
	condition		= DIA_Addon_Saturas_Erdbeben_Condition;
	information		= DIA_Addon_Saturas_Erdbeben_Info;
	description		= "那 是 多 么 奇 怪 的 地 震 啊 ？";
};

func int DIA_Addon_Saturas_Erdbeben_Condition()
{
	if ((MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	&& (Npc_KnowsInfo(other, DIA_Addon_Saturas_wasmachstdu))
	&& (Npc_KnowsInfo(other, DIA_Addon_Merdarion_Bedrohung)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_Erdbeben_Info()
{
	AI_Output(other, self, "DIA_Addon_Saturas_Erdbeben_15_00"); //那 是 多 么 奇 怪 的 地 震 啊 ？
	AI_Output(self, other, "DIA_Addon_Saturas_Erdbeben_14_01"); //那 是 一 个 我 正 试 图 解 决 的 难 题 。
	AI_Output(self, other, "DIA_Addon_Saturas_Erdbeben_14_02"); //在 这 些 山 脉 之 后 的 某 处 ， 魔 法 结 构 被 打 乱 了 。
	AI_Output(self, other, "DIA_Addon_Saturas_Erdbeben_14_03"); //很 显 然 ， 有 人 正 试 图 用 全 部 的 力 量 来 破 坏 一 种 强 大 的 魔 法 。
	AI_Output(self, other, "DIA_Addon_Saturas_Erdbeben_14_04"); //我 担 心 用 不 了 多 久 整 个 岛 屿 都 会 受 到 这 些 震 动 的 影 响 。
};

///////////////////////////////////////////////////////////////////////
//	Info WhatsOrnament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_WhatsOrnament(C_INFO)
{
	npc				= KDW_1400_Addon_Saturas_NW;
	nr				= 5;
	condition		= DIA_Addon_Saturas_WhatsOrnament_Condition;
	information		= DIA_Addon_Saturas_WhatsOrnament_Info;
	description		= "这 个 装 饰 物 为 什 么 对 你 如 此 重 要 ？";
};

func int DIA_Addon_Saturas_WhatsOrnament_Condition()
{
	if ((MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	&& (SC_KnowsOrnament == FALSE)
	&& (RitualRingRuns == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_WhatsOrnament_Info()
{
	AI_Output(other, self, "DIA_Addon_Saturas_WhatsOrnament_15_00"); //这 个 装 饰 物 为 什 么 对 你 如 此 重 要 ？
	AI_Output(self, other, "DIA_Addon_Saturas_WhatsOrnament_14_01"); //（ 生 气 ） 它 是 一 个 传 送 门 的 钥 匙 。
	AI_Output(self, other, "DIA_Addon_Saturas_WhatsOrnament_14_02"); //我 不 会 再 对 你 多 说 什 么 。
};

///////////////////////////////////////////////////////////////////////
//	Info ScRanger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ScRanger(C_INFO)
{
	npc				= KDW_1400_Addon_Saturas_NW;
	nr				= 5;
	condition		= DIA_Addon_Saturas_ScRanger_Condition;
	information		= DIA_Addon_Saturas_ScRanger_Info;
	permanent		= TRUE;
	description		= "我 现 在 属 于 ‘ 水 之 环 ’ 了 。";
};

func int DIA_Addon_Saturas_ScRanger_Condition()
{
	if ((SaturasKnows_SC_IsRanger == FALSE)
	&& (SC_IsRanger == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_ScRanger_Info()
{
	AI_Output(other, self, "DIA_Addon_Saturas_ScRanger_15_00"); //我 现 在 属 于 ‘ 水 之 环 ’ 了 。
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);

	if (
	((SCIsWearingRangerRing == TRUE) && (RangerRingIsLaresRing == FALSE)) // -> Der SC IST Ranger! SC trägt eigenen (nicht Lares') Ring
	|| (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE) // -> Der SC IST Ranger! Nur als Ranger hat er diese Rüstung bekommen.
	)
	{
		if (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)
		{
			AI_Output(self, other, "DIA_Addon_Saturas_ScRanger_14_01"); //如 我 所 见 ， 你 穿 着 我 们 追 随 者 的 盔 甲 。
		}
		else
		{
			AI_Output(self, other, "DIA_Addon_Saturas_ScRanger_14_02"); //如 我 所 见 ， 你 戴 着 我 们 的 秘 密 记 号 。 蓝 宝 石 戒 指 。
		};

		AI_Output(self, other, "DIA_Addon_Saturas_ScRanger_14_03"); //而 且 我 从 你 的 眼 中 看 出 ， 你 说 的 是 真 话 。
		AI_Output(self, other, "DIA_Addon_Saturas_ScRanger_14_04"); //（ 喃 喃 而 语 ） 非 常 好 。 我 允 许 你 加 入 我 们 的 行 列 。
		AI_Output(self, other, "DIA_Addon_Saturas_ScRanger_14_05"); //但 要 记 住 ， 随 之 而 来 的 将 是 重 大 的 责 任 。
		AI_Output(self, other, "DIA_Addon_Saturas_ScRanger_14_06"); //我 希 望 为 了 你 自 己 ， 你 将 会 作 出 正 义 的 举 动 。
		SaturasKnows_SC_IsRanger = TRUE;
		B_LogEntry(TOPIC_Addon_RingOfWater, TOPIC_Addon_RingOfWater_11);
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Saturas_ScRanger_14_07"); //现 在 我 怎 么 知 道 你 是 我 们 的 一 员 ？

		if (RangerRingIsLaresRing == TRUE)
		{
			AI_Output(self, other, "DIA_Addon_Saturas_ScRanger_14_08"); //你 拿 的 蓝 宝 石 戒 指 属 于 莱 尔 瑞 兹 。 我 能 看 出 来 。
		};

		AI_Output(self, other, "DIA_Addon_Saturas_ScRanger_14_09"); // 你 想 骗 我 ， 是 吗 ？ 我 想 不 出 还 有 其 它 理 由 。
		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info OpenPortal
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_OpenPortal(C_INFO)
{
	npc				= KDW_1400_Addon_Saturas_NW;
	nr				= 5;
	condition		= DIA_Addon_Saturas_OpenPortal_Condition;
	information		= DIA_Addon_Saturas_OpenPortal_Info;
	permanent		= TRUE;
	description		= "把 戒 指 给 我 。 我 将 要 打 开 传 送 门 。";
};

var int DIA_Addon_Saturas_OpenPortal_NoPerm;
func int DIA_Addon_Saturas_OpenPortal_Condition()
{
	if ((RitualRingRuns == LOG_SUCCESS)
	&& (DIA_Addon_Saturas_OpenPortal_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_OpenPortal_Info()
{
	AI_Output(other, self, "DIA_Addon_Saturas_OpenPortal_15_00"); //把 戒 指 给 我 。 我 将 要 打 开 传 送 门 。

	if (SaturasKnows_SC_IsRanger == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_Saturas_OpenPortal_14_01"); //（ 狡 诈 的 ） 好 ！ 作 为 我 们 新 的 追 随 者 ， 你 应 该 享 有 这 些 荣 耀 。
		AI_Output(self, other, "DIA_Addon_Saturas_OpenPortal_14_02"); //然 而 ， 我 还 需 要 等 待 来 自 瓦 卓 斯 的 消 息 。 在 我 收 到 它 之 前 ， 我 们 不 会 继 续 。

		if ((RangerMeetingRunning == LOG_SUCCESS)
		&& ((Npc_HasItems(other, ItWr_Vatras2Saturas_FindRaven)) || (Npc_HasItems(other, ItWr_Vatras2Saturas_FindRaven_opened))))
		{
			AI_Output(other, self, "DIA_Addon_Saturas_OpenPortal_15_03"); //我 有 一 封 瓦 卓 斯 的 信 交 给 你 。

			B_GiveInvItems(other, self, ItWr_Vatras2Saturas_FindRaven, (Npc_HasItems(other, ItWr_Vatras2Saturas_FindRaven)));
			B_GiveInvItems(other, self, ItWr_Vatras2Saturas_FindRaven_opened, (Npc_HasItems(other, ItWr_Vatras2Saturas_FindRaven_opened)));

			B_UseFakeScroll();
			if (Vatras2Saturas_FindRaven_Open == TRUE)
			{
				AI_Output(self, other, "DIA_Addon_Saturas_OpenPortal_14_04"); //（ 生 气 ） 我 知 道 。 你 当 然 无 法 控 制 你 自 己 ， 而 你 绝 对 把 它 打 开 过 了 ， 是 吗 ？
				AI_Output(other, self, "DIA_Addon_Saturas_OpenPortal_15_05"); //嗯 ， 呃 … …
				AI_Output(self, other, "DIA_Addon_Saturas_OpenPortal_14_06"); //（ 威 胁 ） 我 希 望 你 为 了 自 己 着 想 ， 不 要 动 摇 我 对 你 保 留 的 最 后 一 点 的 信 任 。
			}
			else
			{
				AI_Output(self, other, "DIA_Addon_Saturas_OpenPortal_14_07"); //（ 吃 惊 的 ） 非 常 有 趣 。 好 吧 。
				B_GivePlayerXP(XP_Ambient);
			};

			AI_Output(self, other, "DIA_Addon_Saturas_OpenPortal_14_08"); //给 ， 拿 上 这 个 戒 指 。 我 们 将 在 传 送 门 集 合 ， 并 等 着 你 。

			CreateInvItems(self, ItMi_PortalRing_Addon, 1);
			B_GiveInvItems(self, other, ItMi_PortalRing_Addon, 1);

			AI_Output(self, other, "DIA_Addon_Saturas_OpenPortal_14_09"); //如 果 内 法 利 尔 斯 是 正 确 的 ， 只 要 你 把 这 个 戒 指 放 进 去 ， 传 送 门 就 会 开 启 。

			DIA_Addon_Saturas_OpenPortal_NoPerm = TRUE;
			B_LogEntry(TOPIC_Addon_Ornament, TOPIC_Addon_Ornament_7);

			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self, "OpenPortal");
			B_StartOtherRoutine(KDW_1401_Addon_Cronos_NW, "OpenPortal");
			B_StartOtherRoutine(KDW_1402_Addon_Nefarius_NW, "OpenPortal");
			B_StartOtherRoutine(KDW_1403_Addon_Myxir_NW, "OpenPortal");
			B_StartOtherRoutine(KDW_1404_Addon_Riordian_NW, "OpenPortal");
			B_StartOtherRoutine(KDW_1405_Addon_Merdarion_NW, "OpenPortal");
		}
		else
		{
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Saturas_OpenPortal_14_10"); //只 要 瓦 卓 斯 还 没 有 明 确 地 告 诉 我 你 值 得 信 任 ， 我 就 将 亲 自 保 管 这 枚 戒 指 。
		Saturas_WillVertrauensBeweis = TRUE;
		B_LogEntry(TOPIC_Addon_Ornament, TOPIC_Addon_Ornament_8);
		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_PERM(C_INFO)
{
	npc				= KDW_1400_Addon_Saturas_NW;
	nr				= 99;
	condition		= DIA_Addon_Saturas_PERM_Condition;
	information		= DIA_Addon_Saturas_PERM_Info;
	permanent		= TRUE;
	description		= "你 能 教 我 些 魔 法 吗 ？";
};

func int DIA_Addon_Saturas_PERM_Condition()
{
	if (MIS_Addon_Saturas_BringRiordian2Me != 0)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_PERM_Info()
{
	AI_Output(other, self, "DIA_Addon_Saturas_PERM_15_00"); //你 能 教 我 些 魔 法 吗 ？
	AI_Output(self, other, "DIA_Addon_Saturas_PERM_14_01"); //那 样 你 就 能 再 一 次 干 扰 魔 法 结 构 ？
	AI_Output(self, other, "DIA_Addon_Saturas_PERM_14_02"); //不 。 我 没 时 间 玩 这 样 的 游 戏 。
};
