// ***************************************************************
//								EXIT
// ***************************************************************

// ---------------------
var int Lothar_ImOV;
// ---------------------
instance DIA_Lothar_EXIT(C_INFO)
{
	npc				= Pal_203_Lothar;
	nr				= 999;
	condition		= DIA_Lothar_EXIT_Condition;
	information		= DIA_Lothar_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lothar_EXIT_Condition()
{
	if (Lothar_ImOV == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lothar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ***************************************************************
//							First EXIT
// ***************************************************************
instance DIA_Lothar_FirstEXIT(C_INFO)
{
	npc				= Pal_203_Lothar;
	nr				= 999;
	condition		= DIA_Lothar_FirstEXIT_Condition;
	information		= DIA_Lothar_FirstEXIT_Info;
	permanent		= TRUE;
	description		= "我 必 须 要 走 了 ！ （ 结 束 ）";
};

func int DIA_Lothar_FirstEXIT_Condition()
{
	if (Lothar_ImOV == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lothar_FirstEXIT_Info()
{
	AI_Output(other, self, "DIA_Lothar_FirstEXIT_15_00"); //我 必 须 走 了 ！
	if (Lothar_Regeln == FALSE)
	{
		AI_Output(self, other, "DIA_Lothar_FirstEXIT_01_01"); //等 一 下 ！ 你 还 不 知 道 城 市 的 新 法 律 ！
		AI_Output(other, self, "DIA_Lothar_FirstEXIT_15_02"); //以 后 再 说 。
	}
	else
	{
		if ((Player_TalkedAboutDragons == TRUE)
		&& ((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF)))
		{
			AI_Output(self, other, "DIA_Lothar_FirstEXIT_01_03"); //如 果 再 有 一 次 让 我 听 到 你 跟 这 里 的 人 提 起 龙 的 事 情 ， 你 将 会 有 大 麻 烦 ， 我 说 得 够 清 楚 了 吗 ？
		}
		else
		{
			AI_Output(self, other, "DIA_Lothar_FirstEXIT_01_04"); //只 要 你 在 克 霍 里 尼 斯 ， 你 就 会 感 到 很 安 全 。

			if (hero.guild != GIL_PAL)
			{
				AI_Output(self, other, "DIA_Lothar_FirstEXIT_01_05"); //国 王 的 圣 骑 士 现 在 在 保 卫 这 座 城 市 ！
			};
		};

		Lothar_ImOV = TRUE;
		Npc_ExchangeRoutine(self, "START");
	};

	// ------- Canthars TA auswechseln -------
	if (Canthar_InStadt == FALSE)
	{
		Npc_ExchangeRoutine(Canthar, "START");
		Canthar_InStadt = TRUE;
	};

	AI_StopProcessInfos(self);
};

// ***************************************************************
//							Hallo
// ***************************************************************
instance DIA_Lothar_Hallo(C_INFO)
{
	npc				= Pal_203_Lothar;
	nr				= 1;
	condition		= DIA_Lothar_Hallo_Condition;
	information		= DIA_Lothar_Hallo_Info;
	important		= TRUE;
};

func int DIA_Lothar_Hallo_Condition()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lothar_Hallo_Info()
{
	AI_Output(self, other, "DIA_Lothar_Hallo_01_00"); //站 住 ， 陌 生 人 ！

	if ((Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
	&& ((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF)))
	{
		AI_Output(self, other, "DIA_Lothar_Hallo_01_01"); //我 没 看 到 你 从 这 扇 大 门 里 进 来 。
		AI_Output(other, self, "DIA_Lothar_Hallo_15_02"); //还 有 吗 ?
		AI_Output(self, other, "DIA_Lothar_Hallo_01_03"); //而 且 守 卫 另 一 扇 大 门 的 卫 兵 得 到 命 令 ， 不 许 任 何 陌 生 人 进 入 这 座 城 市 。
		AI_Output(other, self, "DIA_Lothar_Hallo_15_04"); //好 … …
		AI_Output(self, other, "DIA_Lothar_Hallo_01_05"); //我 不 得 不 跟 那 两 个 人 商 量 一 下 ！
		AI_Output(self, other, "DIA_Lothar_Hallo_01_06"); //不 过 现 在 是 我 们 两 个 ：
	};

	AI_Output(self, other, "DIA_Lothar_Hallo_01_07"); //我 叫 洛 萨 。 是 国 王 的 圣 骑 士 ， 也 是 你 们 的 神 - 英 诺 斯 的 谦 卑 的 仆 人 。
	AI_Output(self, other, "DIA_Lothar_Hallo_01_08"); //我 们 的 指 挥 官 ， 哈 根 勋 爵 ， 委 托 我 负 责 这 项 工 作 - 向 所 有 的 新 移 民 解 释 新 法 律 ， 这 些 法 律 适 用 于 这 个 城 市 的 所 有 居 民 。

	// ADDON>
	AI_Output(self, other, "DIA_Addon_Lothar_Hallo_01_00"); //自 从 整 个 市 镇 里 开 始 到 处 有 人 失 踪 ， 每 个 人 都 必 须 非 常 小 心 ， 以 免 遭 受 同 样 的 命 运 。
	// ADDON<

	if (Npc_KnowsInfo(other, DIA_Lester_SEND_XARDAS))
	{
		B_StartOtherRoutine(Lester, "XARDAS");
	};
};

// ***************************************************************
//						Wichtige Nachricht E1
// ***************************************************************
instance DIA_Lothar_MESSAGE(C_INFO)
{
	npc				= Pal_203_Lothar;
	nr				= 1;
	condition		= DIA_Lothar_MESSAGE_Condition;
	information		= DIA_Lothar_MESSAGE_Info;
	description		= "我 有 一 条 重 要 的 信 息 告 诉 圣 骑 士 的 首 领 ！";
};

func int DIA_Lothar_MESSAGE_Condition()
{
	if ((Mil_305_schonmalreingelassen == FALSE)
	&& (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_MESSAGE_Info()
{
	AI_Output(other, self, "DIA_Lothar_MESSAGE_15_00"); //我 有 一 条 重 要 的 信 息 告 诉 圣 骑 士 的 首 领 ！
	AI_Output(self, other, "DIA_Lothar_MESSAGE_01_01"); //哈 根 勋 爵 阁 下 现 在 不 接 见 任 何 人 。
	AI_Output(self, other, "DIA_Lothar_MESSAGE_01_02"); //安 德 烈 勋 爵 ， 也 就 是 这 座 城 市 的 卫 兵 指 挥 官 ， 他 负 责 处 理 跟 普 通 民 众 相 关 的 所 有 事 件 。
};

// ***************************************************************
//							Auge Innos E2
// ***************************************************************
instance DIA_Lothar_EyeInnos(C_INFO)
{
	npc				= Pal_203_Lothar;
	nr				= 2;
	condition		= DIA_Lothar_EyeInnos_Condition;
	information		= DIA_Lothar_EyeInnos_Info;
	description		= "我 来 取 英 诺 斯 之 眼 ！";
};

func int DIA_Lothar_EyeInnos_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lothar_MESSAGE))
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_EyeInnos_Info()
{
	AI_Output(other, self, "DIA_Lothar_EyeInnos_15_00"); //我 来 取 英 诺 斯 之 眼 ！

	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self, other, "DIA_Lothar_EyeInnos_01_01"); //对 于 哈 根 勋 爵 来 说 ， ‘ 眼 睛 ’ 是 个 重 要 问 题 。 跟 他 谈 谈 这 件 事 。
	}
	else
	{
		AI_Output(self, other, "DIA_Lothar_EyeInnos_01_02"); //神 圣 的 英 诺 斯 之 眼 ！ 你 怎 么 知 道 这 件 事 情 的 ？ 你 不 是 修 道 会 的 成 员 ！
		AI_Output(other, self, "DIA_Lothar_EyeInnos_15_03"); //是 一 个 魔 法 师 告 诉 我 这 件 事 的 。
		AI_Output(self, other, "DIA_Lothar_EyeInnos_01_04"); //我 不 知 道 他 把 我 们 修 道 会 的 这 个 秘 密 告 诉 你 是 出 于 什 么 目 的 。
		AI_Output(self, other, "DIA_Lothar_EyeInnos_01_05"); //但 他 当 然 不 是 为 了 让 你 能 得 到 它 。
		AI_Output(other, self, "DIA_Lothar_EyeInnos_15_06"); //但 是 ...
		AI_Output(self, other, "DIA_Lothar_EyeInnos_01_07"); //我 不 想 再 听 到 这 件 事 情 ！
		if (Player_TalkedAboutDragons == TRUE)
		{
			AI_Output(self, other, "DIA_Lothar_EyeInnos_01_08"); //你 一 开 始 提 到 关 于 龙 的 谣 传 ， 然 后 又 说 出 这 件 事 情 - 难 以 置 信 ！
		};
	};
};

// ***************************************************************
//							Drachen E2
// ***************************************************************
instance DIA_Lothar_Dragons(C_INFO)
{
	npc				= Pal_203_Lothar;
	nr				= 1;
	condition		= DIA_Lothar_Dragons_Condition;
	information		= DIA_Lothar_Dragons_Info;
	description		= "听 着 - 这 座 城 市 正 受 到 龙 的 威 胁 ！";
};

func int DIA_Lothar_Dragons_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lothar_MESSAGE))
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_Dragons_Info()
{
	AI_Output(other, self, "DIA_Lothar_Dragons_15_00"); //听 着 - 这 座 城 市 正 受 到 龙 的 威 胁 ！
	if ((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self, other, "DIA_Lothar_Dragons_01_01"); //那 不 是 真 的 ！
		AI_Output(self, other, "DIA_Lothar_Dragons_01_02"); //又 是 个 疯 子 ！
		AI_Output(self, other, "DIA_Lothar_Dragons_01_03"); //我 们 城 里 出 的 乱 子 已 经 够 多 的 了 。 不 要 再 让 某 些 傻 瓜 用 龙 的 谣 传 来 恐 吓 民 众 ！
		AI_Output(self, other, "DIA_Lothar_Dragons_01_04"); //只 要 还 有 人 在 这 里 提 起 关 于 龙 的 谣 言 ， 我 马 上 把 他 关 起 来 ， 并 从 监 狱 里 流 放 到 矿 藏 山 谷 去 。 所 以 ， 注 意 你 的 嘴 巴 ！
		AI_Output(self, other, "DIA_Lothar_Dragons_01_05"); //我 们 不 需 要 任 何 会 在 人 群 中 散 播 恐 慌 的 人 ！
	}
	else
	{
		AI_Output(self, other, "DIA_Lothar_Dragons_01_06"); //我 经 常 听 到 那 件 事 。 不 过 它 太 难 以 让 人 相 信 了 。
		AI_Output(self, other, "DIA_Lothar_Dragons_01_07"); //你 最 好 把 这 件 事 吞 到 你 肚 子 里 去 。 我 们 必 须 避 免 给 民 众 造 成 恐 怖 和 惊 慌 。
	};

	Player_TalkedAboutDragons = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Ornament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lothar_Ornament(C_INFO)
{
	npc				= Pal_203_Lothar;
	nr				= 5;
	condition		= DIA_Addon_Lothar_Ornament_Condition;
	information		= DIA_Addon_Lothar_Ornament_Info;
	description		= "你 了 解 那 些 来 自 洛 拔 特 的 农 场 园 石 圈 的 石 头 怪 物 吗 ？";
};

func int DIA_Addon_Lothar_Ornament_Condition()
{
	if ((LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (MIS_Addon_Cavalorn_GetOrnamentFromPAL == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lothar_Ornament_Info()
{
	AI_Output(other, self, "DIA_Addon_Lothar_Ornament_15_00"); //你 了 解 那 些 来 自 洛 拔 特 的 农 场 园 石 圈 的 石 头 怪 物 吗 ？
	AI_Output(self, other, "DIA_Addon_Lothar_Ornament_01_01"); //当 然 。 我 们 把 它 摧 毁 了 。 对 于 周 围 的 农 场 来 说 ， 它 是 个 威 胁 。
	AI_Output(self, other, "DIA_Addon_Lothar_Ornament_01_02"); //你 为 什 么 这 么 问 ？

	Info_ClearChoices(DIA_Addon_Lothar_Ornament);
	Info_AddChoice(DIA_Addon_Lothar_Ornament, "我 在 寻 找 一 个 装 饰 物 戒 指 上 的 金 属 碎 片 。", DIA_Addon_Lothar_Ornament_suche);
	Info_AddChoice(DIA_Addon_Lothar_Ornament, "你 认 为 这 正 常 吗 ？", DIA_Addon_Lothar_Ornament_normal);
};

func void DIA_Addon_Lothar_Ornament_normal()
{
	AI_Output(other, self, "DIA_Addon_Lothar_Ornament_normal_15_00"); //你 认 为 这 正 常 吗 ？
	AI_Output(self, other, "DIA_Addon_Lothar_Ornament_normal_01_01"); //你 是 说 那 个 石 头 怪 ？
	AI_Output(self, other, "DIA_Addon_Lothar_Ornament_normal_01_02"); //据 我 所 知 ， 水 法 师 们 正 在 对 付 它 。
	AI_Output(self, other, "DIA_Addon_Lothar_Ornament_normal_01_03"); //我 没 怎 么 把 它 放 在 心 上 。 我 们 在 这 个 城 里 有 自 己 的 活 儿 要 干 ， 还 有 矿 藏 山 谷 的 那 些 事 。
	AI_Output(other, self, "DIA_Addon_Lothar_Ornament_normal_15_04"); //我 明 白 了 。
};

func void DIA_Addon_Lothar_Ornament_suche()
{
	AI_Output(other, self, "DIA_Addon_Lothar_Ornament_suche_15_00"); //我 在 寻 找 一 个 装 饰 物 戒 指 上 的 金 属 碎 片 。
	AI_Output(other, self, "DIA_Addon_Lothar_Ornament_suche_15_01"); //它 应 该 在 洛 拔 特 农 场 附 近 的 石 头 圈 那 里 。
	AI_Output(self, other, "DIA_Addon_Lothar_Ornament_suche_01_02"); //是 的 ， 是 有 这 么 回 事 。 那 个 石 头 怪 带 着 它 。 我 想 那 是 个 魔 法 咒 语 。
	AI_Output(self, other, "DIA_Addon_Lothar_Ornament_suche_01_03"); //我 把 它 给 了 哈 根 勋 爵 。 我 不 知 道 它 是 不 是 还 在 他 那 儿 。
};

// ***************************************************************
//							WerVonDrachen E3
// ***************************************************************
instance DIA_Lothar_WhoDragons(C_INFO)
{
	npc				= Pal_203_Lothar;
	nr				= 1;
	condition		= DIA_Lothar_WhoDragons_Condition;
	information		= DIA_Lothar_WhoDragons_Info;
	description		= "这 里 已 经 有 人 报 告 过 龙 的 事 情 了 ？";
};

func int DIA_Lothar_WhoDragons_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lothar_Dragons))
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_WhoDragons_Info()
{
	AI_Output(other, self, "DIA_Lothar_WhoDragons_15_00"); //这 里 已 经 有 人 报 告 过 龙 的 事 情 了 ？
	AI_Output(self, other, "DIA_Lothar_WhoDragons_01_01"); //是 的 。 那 个 家 伙 名 叫 迪 雅 戈 。 总 之 ， 我 想 是 这 样 的 。

	if ((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self, other, "DIA_Lothar_WhoDragons_01_02"); //（ 恐 吓 ） 我 警 告 过 他 - 就 象 你 一 样 ！ 但 那 个 疯 狂 的 家 伙 就 是 不 能 不 让 我 担 心 ！
	};
};

// ***************************************************************
//							Regeln E1
// ***************************************************************
instance DIA_Lothar_Regeln(C_INFO)
{
	npc				= Pal_203_Lothar;
	nr				= 3;
	condition		= DIA_Lothar_Regeln_Condition;
	information		= DIA_Lothar_Regeln_Info;
	description		= "好 吧 - 给 我 解 释 一 下 这 座 城 市 的 规 则 ！";
};

func int DIA_Lothar_Regeln_Condition()
{
	return TRUE;
};

func void DIA_Lothar_Regeln_Info()
{
	AI_Output(other, self, "DIA_Lothar_Regeln_15_00"); //（ 轻 轻 地 叹 气 ） 好 吧 - 给 我 解 说 一 下 这 个 城 市 的 规 章 吧 ！
	AI_Output(self, other, "DIA_Lothar_Regeln_01_01"); //第 一 点 ： 圣 骑 士 哈 根 勋 爵 阁 下 和 他 的 军 队 住 在 富 人 区 。
	AI_Output(self, other, "DIA_Lothar_Regeln_01_02"); //这 就 是 富 人 区 的 入 口 只 对 尊 贵 的 市 民 开 放 的 原 因 。
	AI_Output(self, other, "DIA_Lothar_Add_01_04"); //第 二 点 ： 位 于 富 人 区 的 市 镇 大 厅 现 在 是 圣 骑 士 的 战 地 指 挥 部 。 只 有 圣 骑 士 以 及 民 兵 团 的 成 员 可 以 通 行 。
	AI_Output(self, other, "DIA_Lothar_Add_01_05"); //还 有 第 三 点 是 ： 无 论 谁 被 控 告 犯 罪 都 必 须 得 到 民 兵 指 挥 官 的 赦 免 。
	AI_Output(self, other, "DIA_Lothar_Regeln_01_05"); //还 有 什 么 问 题 吗 ？

	Lothar_Regeln = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lothar_MissingPeople(C_INFO)
{
	npc				= Pal_203_Lothar;
	nr				= 2;
	condition		= DIA_Addon_Lothar_MissingPeople_Condition;
	information		= DIA_Addon_Lothar_MissingPeople_Info;
	description		= "这 个 镇 上 的 人 不 断 失 踪 ？";
};

func int DIA_Addon_Lothar_MissingPeople_Condition()
{
	if ((SC_HearedAboutMissingPeople == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Lothar_Hallo)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lothar_MissingPeople_Info()
{
	AI_Output(other, self, "DIA_Addon_Lothar_MissingPeople_15_00"); //还 有 市 民 继 续 失 踪 吗 ？
	AI_Output(self, other, "DIA_Addon_Lothar_MissingPeople_01_01"); //是 的 。 好 象 一 天 比 一 天 多 了 。
	AI_Output(self, other, "DIA_Addon_Lothar_MissingPeople_01_02"); //更 让 人 着 急 的 是 民 兵 到 现 在 还 没 有 办 法 搞 清 这 些 奇 怪 的 事 情 背 后 的 内 幕 。
	AI_Output(self, other, "DIA_Addon_Lothar_MissingPeople_01_03"); //目 前 ， 城 里 的 居 民 对 陌 生 人 都 很 警 觉 ， 这 不 足 为 怪 。
	AI_Output(self, other, "DIA_Addon_Lothar_MissingPeople_01_04"); //所 以 ， 在 城 里 不 要 惹 他 们 ， 明 白 了 吗 ？

	if (SC_HearedAboutMissingPeople == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
		B_LogEntry(TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl);
	};

	SC_HearedAboutMissingPeople = TRUE;
};

// ***************************************************************
//							HowCitizen E2
// ***************************************************************
instance DIA_Lothar_HowCitizen(C_INFO)
{
	npc				= Pal_203_Lothar;
	nr				= 4;
	condition		= DIA_Lothar_HowCitizen_Condition;
	information		= DIA_Lothar_HowCitizen_Info;
	description		= "我 怎 么 变 成 这 里 的 市 民 ？";
};

func int DIA_Lothar_HowCitizen_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lothar_Regeln))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_HowCitizen_Info()
{
	AI_Output(other, self, "DIA_Lothar_Add_15_06"); //我 怎 么 变 成 这 里 的 市 民 ？
	AI_Output(self, other, "DIA_Lothar_Add_01_07"); //只 有 有 正 式 工 作 的 人 会 被 当 作 这 个 城 市 的 市 民 对 待 ！
	AI_Output(self, other, "DIA_Lothar_Add_01_09"); //但 不 要 以 为 因 为 你 是 这 个 城 里 的 市 民 就 会 被 哈 根 勋 爵 所 接 纳 ！
	AI_Output(self, other, "DIA_Lothar_Add_01_10"); //作 为 一 名 市 民 ， 你 只 可 以 进 出 富 人 区 - 仅 此 而 已 ！
	AI_Output(self, other, "DIA_Lothar_Add_01_11"); //你 只 有 成 为 民 兵 的 一 员 才 有 进 出 市 镇 大 厅 的 权 力 ！
};

// ***************************************************************
//							WoArbeit E3
// ***************************************************************
instance DIA_Lothar_WoArbeit(C_INFO)
{
	npc				= Pal_203_Lothar;
	nr				= 5;
	condition		= DIA_Lothar_WoArbeit_Condition;
	information		= DIA_Lothar_WoArbeit_Info;
	description		= "我 在 哪 里 能 找 到 工 作 ？";
};

func int DIA_Lothar_WoArbeit_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lothar_HowCitizen))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_WoArbeit_Info()
{
	AI_Output(other, self, "DIA_Lothar_Add_15_14"); //我 在 哪 里 能 找 到 工 作 ？
	AI_Output(self, other, "DIA_Lothar_Add_01_15"); //你 必 须 申 请 成 为 城 里 的 贫 民 区 中 某 位 大 师 的 学 徒 。
	AI_Output(self, other, "DIA_Lothar_Add_01_16"); //当 有 一 位 大 师 接 收 你 后 ， 你 就 能 成 为 这 个 城 市 的 市 民 。
	AI_Output(self, other, "DIA_Lothar_Add_01_17"); //不 过 ， 还 要 取 得 其 它 的 大 师 的 同 意 ， 这 是 克 霍 里 尼 斯 的 惯 例 。
	AI_Output(self, other, "DIA_Lothar_Add_01_18"); //如 果 你 盘 算 着 到 港 口 区 去 找 份 工 作 的 话 - 还 是 算 了 吧 ！
	AI_Output(self, other, "DIA_Lothar_Add_01_19"); //城 里 的 人 渣 都 住 在 那 里 。 不 要 去 那 里 ， 你 会 后 悔 的 ！
};

// ***************************************************************
//							ToOV E2
// ***************************************************************
instance DIA_Lothar_ToOV(C_INFO)
{
	npc				= Pal_203_Lothar;
	nr				= 6;
	condition		= DIA_Lothar_ToOV_Condition;
	information		= DIA_Lothar_ToOV_Info;
	description		= "我 怎 么 进 入 富 人 区 ？";
};

func int DIA_Lothar_ToOV_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lothar_Regeln))
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_ToOV_Info()
{
	AI_Output(other, self, "DIA_Lothar_ToOV_15_00"); //我 怎 么 进 入 富 人 区 ？
	AI_Output(self, other, "DIA_Lothar_ToOV_01_01"); //喂 ， 你 究 竟 有 没 有 在 听 我 说 ？ ！
	AI_Output(self, other, "DIA_Lothar_ToOV_01_02"); //你 不 是 这 里 的 市 民 。 你 这 一 趟 可 以 省 了 - 卫 兵 不 让 你 进 去 。
	AI_Output(self, other, "DIA_Lothar_ToOV_01_03"); //你 不 能 进 入 内 部 大 门 里 的 区 域 ！
};

// ***************************************************************
//							ToMiliz E2
// ***************************************************************
instance DIA_Lothar_ToMiliz(C_INFO)
{
	npc				= Pal_203_Lothar;
	nr				= 7;
	condition		= DIA_Lothar_ToMiliz_Condition;
	information		= DIA_Lothar_ToMiliz_Info;
	description		= "我 怎 么 才 能 成 为 民 兵 ？。";
};

func int DIA_Lothar_ToMiliz_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lothar_Regeln))
	&& (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_ToMiliz_Info()
{
	AI_Output(other, self, "DIA_Lothar_Add_15_26"); //我 怎 么 才 能 成 为 民 兵 ？。
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output(self, other, "DIA_Lothar_Add_01_27"); //哈 根 勋 爵 下 达 了 紧 急 命 令 ， 只 有 城 里 的 市 民 才 能 加 入 民 兵 。
		AI_Output(other, self, "DIA_Lothar_Add_15_28"); //我 明 白 了 。
	};

	AI_Output(self, other, "DIA_Lothar_Add_01_29"); //如 果 你 还 想 知 道 更 多 事 情 ， 去 兵 营 里 跟 安 德 烈 勋 爵 谈 谈 吧 。
};

// ***************************************************************
//							ToPaladins E2
// ***************************************************************
instance DIA_Lothar_ToPaladins(C_INFO)
{
	npc				= Pal_203_Lothar;
	nr				= 7;
	condition		= DIA_Lothar_ToPaladins_Condition;
	information		= DIA_Lothar_ToPaladins_Info;
	description		= "我 要 怎 么 做 才 能 获 得 你 那 样 的 盔 甲 ？";
};

func int DIA_Lothar_ToPaladins_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lothar_ToMiliz))
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Lothar_ToPaladins_Info()
{
	AI_Output(other, self, "DIA_Lothar_Add_15_30"); //我 要 怎 么 做 才 能 获 得 你 那 样 的 盔 甲 ？
	if (other.guild != GIL_MIL)
	{
		AI_Output(self, other, "DIA_Lothar_Add_01_31"); //（ 大 声 嚷 嚷 ） 什 么 ？ 你 竟 然 连 民 兵 都 不 是 ！
	};

	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output(self, other, "DIA_Lothar_Add_01_32"); //你 连 市 民 都 不 是 ！
	};

	AI_Output(self, other, "DIA_Lothar_Add_01_33"); //你 竟 想 穿 上 圣 骑 士 的 盔 甲 ？
	AI_Output(self, other, "DIA_Lothar_Add_01_34"); //到 现 在 为 止 ， 只 有 少 数 几 个 有 着 非 凡 功 绩 的 民 兵 士 兵 被 授 予 这 个 荣 誉 。
	AI_Output(self, other, "DIA_Lothar_Add_01_35"); //（ 严 厉 地 ） 如 果 你 想 成 为 一 名 圣 骑 士 ， 那 你 接 下 来 要 走 的 路 还 很 长 ， 孩 子 ！
};

// ***************************************************************
//							WoAndre E2
// ***************************************************************
instance DIA_Lothar_WoAndre(C_INFO)
{
	npc				= Pal_203_Lothar;
	nr				= 8;
	condition		= DIA_Lothar_WoAndre_Condition;
	information		= DIA_Lothar_WoAndre_Info;
	description		= "我 在 哪 里 能 找 到 城 市 守 卫 的 指 挥 官 ？";
};

func int DIA_Lothar_WoAndre_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lothar_Regeln) || Npc_KnowsInfo(other, DIA_Lothar_MESSAGE))
	&& (Andre.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_WoAndre_Info()
{
	AI_Output(other, self, "DIA_Lothar_WoAndre_15_00"); //我 在 哪 里 能 找 到 城 市 守 卫 的 指 挥 官 ？
	AI_Output(self, other, "DIA_Lothar_WoAndre_01_01"); //在 城 市 另 一 头 的 兵 营 里 可 以 找 到 安 德 烈 勋 爵 。
};

// ***************************************************************
//							Schlafen E2
// ***************************************************************
instance DIA_Lothar_Schlafen(C_INFO)
{
	npc				= Pal_203_Lothar;
	nr				= 9;
	condition		= DIA_Lothar_Schlafen_Condition;
	information		= DIA_Lothar_Schlafen_Info;
	description		= "我 能 在 这 里 的 哪 个 地 方 过 夜 ？";
};

func int DIA_Lothar_Schlafen_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Lothar_Schlafen_Info()
{
	AI_Output(other, self, "DIA_Lothar_Add_15_22"); //我 能 在 这 里 的 哪 个 地 方 过 夜 ？
	AI_Output(self, other, "DIA_Lothar_Add_01_23"); //如 果 你 正 在 找 地 方 睡 觉 ， 直 接 到 兵 营 对 面 的 旅 馆 去 吧 。
	AI_Output(self, other, "DIA_Lothar_Add_01_24"); //圣 骑 士 们 为 所 有 路 过 这 个 城 市 的 人 支 付 住 宿 费 。
	AI_Output(self, other, "DIA_Lothar_Add_01_25"); //从 市 场 里 过 来 的 商 旅 们 也 都 住 在 那 里 。
};

// ***************************************************************
//							PERM - VOR OV
// ***************************************************************
instance DIA_Lothar_PermB4OV(C_INFO)
{
	npc				= Pal_203_Lothar;
	nr				= 3;
	condition		= DIA_Lothar_PermB4OV_Condition;
	information		= DIA_Lothar_PermB4OV_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Lothar_PermB4OV_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (Lothar_Regeln == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_PermB4OV_Info()
{
	AI_Output(self, other, "DIA_Lothar_PermB4OV_01_00"); //你 可 以 跟 安 德 烈 勋 爵 说 其 它 任 何 事 情 ！
	AI_StopProcessInfos(self);
};

// ***************
// 		Blubb
// ***************

func void B_Lothar_Blubb() // überflüsige Outputs
{
	AI_Output(other, self, "DIA_Lothar_Add_15_00"); //但 我 必 须 见 哈 根 勋 爵 ！

	AI_Output(self, other, "DIA_Lothar_Add_01_45"); //而 且 据 我 所 知 ， 他 已 经 同 意 你 加 入 民 兵 了 。
	AI_Output(self, other, "DIA_Lothar_Add_01_46"); //嗯 - 他 一 定 知 道 自 己 在 干 什 么 。

	AI_Output(other, self, "DIA_Lothar_Add_15_20"); //总 共 有 多 少 位 大 师 ？
	AI_Output(self, other, "DIA_Lothar_Add_01_21"); //我 想 总 共 有 五 个 。

	AI_Output(self, other, "DIA_Lothar_Add_01_62"); //告 诉 我 ， 我 是 不 是 说 得 不 够 清 楚 ？ 不 许 再 提 龙 的 传 言 ！
	AI_Output(other, self, "DIA_Lothar_Add_15_63"); //你 怎 么 知 道 … … ？
	AI_Output(self, other, "DIA_Lothar_Add_01_64"); //不 关 你 的 事 ！
	AI_Output(self, other, "DIA_Lothar_Add_01_65"); //这 是 最 后 一 次 ， 明 白 吗 ？ ！

	AI_Output(other, self, "DIA_Lothar_Add_15_66"); //哪 里 能 找 到 民 兵 指 挥 官 ？
	AI_Output(other, self, "DIA_Lothar_Add_15_08"); //我 现 在 是 某 位 大 师 的 学 徒 了 ！

	// ------ NEWS_Modul für Unterstadt ------
	AI_Output(self, other, "DIA_Lothar_Add_01_47"); //又 是 你 。

	AI_Output(self, other, "DIA_Lothar_Add_01_43"); //我 听 说 你 见 到 安 德 烈 勋 爵 了 ？
	AI_Output(self, other, "DIA_Lothar_Add_01_44"); //我 跟 你 说 过 你 必 须 是 这 里 的 市 民 才 能 加 入 民 兵 。

	AI_Output(self, other, "DIA_Lothar_Add_01_48"); //我 向 哈 根 勋 爵 报 告 过 你 想 跟 他 谈 谈 … …
	AI_Output(other, self, "DIA_Lothar_Add_15_49"); //是 吗 ？ 他 说 了 什 么 ？
	AI_Output(self, other, "DIA_Lothar_Add_01_50"); //他 从 来 没 听 说 过 你 。
	AI_Output(other, self, "DIA_Lothar_Add_15_51"); //当 然 没 有 。 你 告 诉 他 关 于 龙 的 事 情 了 吗 ？
	AI_Output(self, other, "DIA_Lothar_Add_01_52"); //难 道 我 没 跟 你 说 过 要 停 止 这 些 谣 传 吗 ？ ！

	AI_Output(self, other, "DIA_Lothar_Add_01_12"); //我 听 说 你 已 经 得 到 一 些 大 师 的 认 可 了 。
	AI_Output(self, other, "DIA_Lothar_Add_01_13"); //你 是 真 的 严 肃 对 待 这 件 事 ， 是 不 是 ？

	AI_Output(self, other, "DIA_Lothar_Add_01_01"); //你 必 须 遵 守 法 规 ， 跟 其 它 所 有 人 一 样 ！
	AI_Output(self, other, "DIA_Lothar_Add_01_02"); //哈 根 勋 爵 不 接 受 探 访 。
	AI_Output(self, other, "DIA_Lothar_Add_01_03"); //如 果 你 有 很 重 要 的 事 情 要 说 ， 去 找 安 德 烈 勋 爵 。 他 会 帮 助 你 的 ！
};

// #########################################
// #########################################

// 				Im Oberen Viertel

// #########################################
// #########################################

// ***************************************************************
//								OV Regeln
// ***************************************************************
instance DIA_Lothar_HelloAgain(C_INFO)
{
	npc				= Pal_203_Lothar;
	nr				= 1;
	condition		= DIA_Lothar_HelloAgain_Condition;
	information		= DIA_Lothar_HelloAgain_Info;
	important		= TRUE;
};

func int DIA_Lothar_HelloAgain_Condition()
{
	if (Mil_305_schonmalreingelassen == TRUE) // Torwache zu oberem Viertel.
	{
		return TRUE;
	};
};

func void DIA_Lothar_HelloAgain_Info()
{
	AI_Output(self, other, "DIA_Lothar_HelloAgain_01_00"); //啊 ！ 又 是 你 ！
	AI_Output(self, other, "DIA_Lothar_HelloAgain_01_01"); //那 么 你 真 的 想 法 子 去 了 富 人 区 ！

	if (other.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Lothar_Add_01_36"); //你 在 哪 里 弄 到 了 那 件 长 袍 ？
		AI_Output(other, self, "DIA_Lothar_Add_15_37"); //我 已 经 通 过 了 火 焰 测 试 。
		AI_Output(self, other, "DIA_Lothar_Add_01_38"); //不 可 思 议 。 接 下 来 正 在 发 生 的 事 情 一 定 是 英 诺 斯 的 旨 意 … …
	};

	if (other.guild == GIL_SLD)
	{
		AI_Output(self, other, "DIA_Lothar_Add_01_39"); //你 还 没 有 加 入 欧 纳 尔 的 雇 佣 兵 ， 是 吗 ？
		AI_Output(self, other, "DIA_Lothar_Add_01_40"); //你 怎 么 进 到 这 里 的 ？
		AI_Output(other, self, "DIA_Lothar_Add_15_41"); //我 从 李 那 里 带 来 了 和 平 提 议 … …
		AI_Output(self, other, "DIA_Lothar_Add_01_42"); //呸 ！ 哈 根 勋 爵 永 远 都 不 会 同 意 那 样 。
	};

	AI_Output(self, other, "DIA_Lothar_HelloAgain_01_02"); //在 这 里 有 一 些 事 情 你 必 须 留 意 ， 否 则 你 马 上 会 被 轰 出 去 ， 就 象 你 进 入 这 里 时 那 样 快 。
	AI_Output(self, other, "DIA_Lothar_HelloAgain_01_03"); //你 只 能 进 入 商 人 的 房 屋 。 你 可 以 通 过 门 上 面 的 标 记 识 别 它 们 - 这 样 就 不 会 有 误 会 了 。
	AI_Output(self, other, "DIA_Lothar_HelloAgain_01_04"); //其 它 的 房 屋 都 是 那 些 有 权 势 的 市 民 的 - 那 里 没 有 任 何 东 西 是 你 的 ！
	if ((other.guild == GIL_KDF)
	|| (other.guild == GIL_NOV))
	{
		AI_Output(self, other, "DIA_Lothar_HelloAgain_01_05"); //即 使 你 现 在 是 英 诺 斯 的 修 道 会 的 成 员 。
	};

	if (other.guild == GIL_MIL)
	{
		AI_Output(self, other, "DIA_Lothar_HelloAgain_01_06"); //作 为 一 名 民 兵 ， 你 可 以 进 出 圣 骑 士 的 房 间 。
		AI_Output(self, other, "DIA_Lothar_HelloAgain_01_07"); //不 过 ， 你 的 居 住 地 仍 然 是 在 兵 营 。
	};

	AI_Output(self, other, "DIA_Lothar_HelloAgain_01_08"); //这 个 城 市 的 上 等 公 民 都 住 在 这 个 区 。 所 以 你 要 尊 敬 地 对 待 他 们 。
	AI_Output(self, other, "DIA_Lothar_HelloAgain_01_09"); //我 说 明 白 了 吗 ？
	AI_Output(other, self, "DIA_Lothar_HelloAgain_15_10"); //好 的 。
};

// ***************************************************************
//								Hagen
// ***************************************************************
instance DIA_Lothar_Hagen(C_INFO)
{
	npc				= Pal_203_Lothar;
	nr				= 2;
	condition		= DIA_Lothar_Hagen_Condition;
	information		= DIA_Lothar_Hagen_Info;
	permanent		= TRUE;
	description		= "我 在 哪 里 能 找 到 哈 根 勋 爵 ？";
};

func int DIA_Lothar_Hagen_Condition()
{
	if ((Mil_305_schonmalreingelassen == TRUE) // Torwache zu oberem Viertel.
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_Hagen_Info()
{
	AI_Output(other, self, "DIA_Lothar_Hagen_15_00"); //我 在 哪 里 能 找 到 哈 根 勋 爵 ？
	AI_Output(self, other, "DIA_Lothar_Hagen_01_01"); //他 在 市 镇 大 厅 ， 在 富 人 区 的 尽 头 。
	AI_Output(self, other, "DIA_Lothar_Hagen_01_02"); //但 是 如 果 你 没 有 一 个 充 分 的 理 由 的 话 ， 就 不 能 进 入 那 里 。
};

// ***************************************************************
//							Oldworld Running
// ***************************************************************
instance DIA_Lothar_OWRunning(C_INFO)
{
	npc				= Pal_203_Lothar;
	nr				= 2;
	condition		= DIA_Lothar_OWRunning_Condition;
	information		= DIA_Lothar_OWRunning_Info;
	description		= "我 来 找 哈 根 勋 爵 … …";
};

func int DIA_Lothar_OWRunning_Condition()
{
	if ((MIS_OLDWORLD == LOG_RUNNING)
	&& (Npc_HasItems(hero, ItWr_PaladinLetter_MIS) == 0))
	{
		return TRUE;
	};
};

func void DIA_Lothar_OWRunning_Info()
{
	AI_Output(other, self, "DIA_Lothar_Add_15_53"); //我 来 找 哈 根 勋 爵 … …
	AI_Output(self, other, "DIA_Lothar_Add_01_54"); //还 有 吗 ？ 你 没 有 用 那 些 所 谓 的 龙 的 谣 言 去 打 扰 他 吧 ， 是 吗 ？
	AI_Output(other, self, "DIA_Lothar_Add_15_55"); //是 的 ， 我 是 这 么 做 的 … …
	AI_Output(self, other, "DIA_Lothar_Add_01_56"); //告 诉 我 ， 这 不 是 真 的 … …
	AI_Output(other, self, "DIA_Lothar_Add_15_57"); //他 派 我 去 给 他 找 一 些 证 据 … …
	AI_Output(self, other, "DIA_Lothar_Add_01_58"); //那 好 吧 ， 祝 你 好 运 。 （ 自 言 自 语 ） 真 是 个 疯 子 … …

	AI_StopProcessInfos(self);
};

// ***************************************************************
//							Oldworld Running UND Brief
// ***************************************************************
instance DIA_Lothar_OWRunningBrief(C_INFO)
{
	npc				= Pal_203_Lothar;
	nr				= 2;
	condition		= DIA_Lothar_OWRunningBrief_Condition;
	information		= DIA_Lothar_OWRunningBrief_Info;
	description		= "我 有 证 据 ！ 这 是 指 挥 官 加 隆 德 写 的 信 ！";
};

func int DIA_Lothar_OWRunningBrief_Condition()
{
	if ((MIS_OLDWORLD == LOG_RUNNING)
	&& (Npc_HasItems(hero, ItWr_PaladinLetter_MIS) > 0))
	{
		return TRUE;
	};
};

func void DIA_Lothar_OWRunningBrief_Info()
{
	AI_Output(other, self, "DIA_Lothar_Add_15_59"); //我 有 证 据 ！ 这 是 指 挥 官 加 隆 德 写 的 信 ！
	AI_Output(self, other, "DIA_Lothar_Add_01_60"); //那 么 ， 那 里 真 的 有 龙 ？！
	AI_Output(self, other, "DIA_Lothar_Add_01_61"); //我 冤 枉 了 你 。 我 应 该 为 我 的 行 为 向 英 诺 斯 祈 求 原 谅 。

	AI_StopProcessInfos(self);
};

// ***************************************************************
//								PERM
// ***************************************************************
instance DIA_Lothar_PERM(C_INFO)
{
	npc				= Pal_203_Lothar;
	nr				= 3;
	condition		= DIA_Lothar_PERM_Condition;
	information		= DIA_Lothar_PERM_Info;
	permanent		= TRUE;
	description		= "最 近 发 生 什 么 刺 激 的 事 情 没 有 ？";
};

func int DIA_Lothar_PERM_Condition()
{
	if ((Mil_305_schonmalreingelassen == TRUE) // Torwache zu oberem Viertel.
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_PERM_Info()
{
	AI_Output(other, self, "DIA_Lothar_PERM_15_00"); //最 近 发 生 什 么 刺 激 的 事 情 没 有 ？
	if ((other.guild == GIL_NONE)
	|| (other.guild == GIL_SLD))
	{
		AI_Output(self, other, "DIA_Lothar_PERM_01_01"); //是 的 ， 他 们 让 你 这 样 的 人 进 来 。 这 种 事 情 多 少 年 来 都 没 发 生 过
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output(self, other, "DIA_Lothar_PERM_01_02"); //你 应 该 好 好 弄 明 白 这 个 。 作 为 这 个 城 市 的 一 名 守 卫 ， 你 的 职 责 是 遵 守 法 律 和 命 令 ！
	}
	else // KdF oder NOV
	{
		AI_Output(self, other, "DIA_Lothar_PERM_01_03"); //不 .
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Lothar_PICKPOCKET(C_INFO)
{
	npc				= Pal_203_Lothar;
	nr				= 900;
	condition		= DIA_Lothar_PICKPOCKET_Condition;
	information		= DIA_Lothar_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Lothar_PICKPOCKET_Condition()
{
	C_Beklauen(56, 95);
};

func void DIA_Lothar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lothar_PICKPOCKET);
	Info_AddChoice(DIA_Lothar_PICKPOCKET, DIALOG_BACK, DIA_Lothar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lothar_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Lothar_PICKPOCKET_DoIt);
};

func void DIA_Lothar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Lothar_PICKPOCKET);
};

func void DIA_Lothar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lothar_PICKPOCKET);
};
