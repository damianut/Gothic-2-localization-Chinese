///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_EXIT(C_INFO)
{
	npc				= PIR_1301_Addon_Skip_NW;
	nr				= 999;
	condition		= DIA_Addon_Skip_NW_EXIT_Condition;
	information		= DIA_Addon_Skip_NW_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Skip_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);

	PlayerTalkedToSkipNW = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Hallo(C_INFO)
{
	npc				= PIR_1301_Addon_Skip_NW;
	nr				= 1;
	condition		= DIA_Addon_Skip_NW_Hallo_Condition;
	information		= DIA_Addon_Skip_NW_Hallo_Info;
	important		= TRUE;
};

func int DIA_Addon_Skip_NW_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_Hallo_Info()
{
	AI_Output(self, other, "DIA_Addon_Skip_NW_Hallo_08_00"); //(生 气 地)你 终 于 回 来 了 ， 我 等 了 你 好 几 个 小 时 了 。
	AI_Output(self, other, "DIA_Addon_Skip_NW_Hallo_08_01"); //(迷 惘 地)不 过 就 一 会 儿 。 你 不 是 镇 上 来 的 商 人 ？
	AI_Output(self, other, "DIA_Addon_Skip_NW_Hallo_08_02"); //(生 气 地)贝 尔 卓 姆 去 哪 里 了 ？
};

///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_WerBistDu(C_INFO)
{
	npc				= PIR_1301_Addon_Skip_NW;
	nr				= 5;
	condition		= DIA_Addon_Skip_NW_WerBistDu_Condition;
	information		= DIA_Addon_Skip_NW_WerBistDu_Info;
	description		= "你 是 谁 ？";
};

func int DIA_Addon_Skip_NW_WerBistDu_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_WerBistDu_Info()
{
	AI_Output(other, self, "DIA_Addon_Skip_NW_WerBistDu_15_00"); //你 是 谁 ？
	AI_Output(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_01"); //关 你 什 么 事 ？ ！ 告 诉 你 ， 我 叫 斯 奇 普 ， 想 死 吗 ？
	AI_Output(other, self, "DIA_Addon_Skip_NW_WerBistDu_15_02"); //(装 作 不 知)谁 ？
	AI_Output(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_03"); //没 听 说 过 斯 奇 普 ？ 该 死 ， 你 在 哪 里 混 ？
	AI_Output(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_04"); //我 是 克 霍 里 尼 斯 通 缉 要 犯 ， 这 个 岛 附 近 的 水 面 ， 这 些 年 来 一 直 是 我 们 说 了 算 。
	AI_Output(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_05"); //(愤 怒 地)算 了 吧 ， 你 肯 定 听 说 过 我 。

	Info_ClearChoices(DIA_Addon_Skip_NW_WerBistDu);
	Info_AddChoice(DIA_Addon_Skip_NW_WerBistDu, "你 是 一 个 海 盗 。", DIA_Addon_Skip_NW_WerBistDu_pirat);
	Info_AddChoice(DIA_Addon_Skip_NW_WerBistDu, "我 应 该 认 识 你 吗 ？", DIA_Addon_Skip_NW_WerBistDu_keineAhnung);
	Info_AddChoice(DIA_Addon_Skip_NW_WerBistDu, "当 然 。现 在 我 都 想 起 来 了 。", DIA_Addon_Skip_NW_WerBistDu_ja);
};

func void DIA_Addon_Skip_NW_WerBistDu_ja()
{
	AI_Output(other, self, "DIA_Addon_Skip_NW_WerBistDu_ja_15_00"); //当 然 。现 在 我 都 想 起 来 了 。
	AI_Output(self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_01"); //(困 惑 地)真 的 ？ 真 的 听 说 过 我 。
	AI_Output(self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_02"); //哦 ， 该 死 ！ 我 还 想 去 镇 里 逛 逛 呢 。
	AI_Output(self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_03"); //幸 好 我 没 这 么 做 。

	if ((hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL))
	{
		AI_Output(self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_04"); //否 则 民 兵 早 就 把 我 投 入 大 牢 了 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_05"); //你 没 想 过 把 我 抓 走 吗 ？
		AI_Output(other, self, "DIA_Addon_Skip_NW_WerBistDu_ja_15_06"); //好 … …
		AI_Output(self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_07"); //很 好 。 和 老 斯 奇 普 过 过 招 ， 你 就 出 名 了 。
	};

	Info_ClearChoices(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_keineAhnung()
{
	AI_Output(other, self, "DIA_Addon_Skip_NW_WerBistDu_keineAhnung_15_00"); //我 应 该 认 识 你 吗 ？
	AI_Output(self, other, "DIA_Addon_Skip_NW_WerBistDu_keineAhnung_08_01"); //闭 嘴 ， 老 斯 奇 普 要 杀 了 你 。
	Info_ClearChoices(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_pirat()
{
	AI_Output(other, self, "DIA_Addon_Skip_NW_WerBistDu_pirat_15_00"); //你 是 一 个 海 盗 。
	AI_Output(self, other, "DIA_Addon_Skip_NW_WerBistDu_pirat_08_01"); //(生 气 地)好 吧 ， 该 死 的 ， 准 备 去 死 吧 。
	AI_Output(self, other, "DIA_Addon_Skip_NW_WerBistDu_pirat_08_02"); //我 烦 透 了 。
	Info_ClearChoices(DIA_Addon_Skip_NW_WerBistDu);
};

///////////////////////////////////////////////////////////////////////
//	Info Baltram
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Baltram(C_INFO)
{
	npc				= PIR_1301_Addon_Skip_NW;
	nr				= 5;
	condition		= DIA_Addon_Skip_NW_Baltram_Condition;
	information		= DIA_Addon_Skip_NW_Baltram_Info;
	description		= "贝 尔 卓 姆 ？ 你 在 等 一 个 商 人 ？";
};

func int DIA_Addon_Skip_NW_Baltram_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Skip_NW_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Baltram_Info()
{
	AI_Output(other, self, "DIA_Addon_Skip_NW_Baltram_15_00"); //贝 尔 卓 姆 ？ 你 在 等 一 个 商 人 ？
	AI_Output(self, other, "DIA_Addon_Skip_NW_Baltram_08_01"); //你 是 个 聪 明 人 ？
	if (C_BodyStateContains(self, BS_SIT))
	{
		AI_StandUp(self);
		B_TurnToNpc(self, other);
	};

	AI_Output(self, other, "DIA_Addon_Skip_NW_Baltram_08_02"); //我 刚 就 是 这 么 说 的 ，对 吧 ?
	AI_Output(self, other, "DIA_Addon_Skip_NW_Baltram_08_03"); //那 个 一 无 是 处 的 旧 货 商 人 似 乎 把 我 忘 了 。
	AI_Output(self, other, "DIA_Addon_Skip_NW_Baltram_08_04"); //要 是 让 我 抓 到 他...

	Log_CreateTopic(TOPIC_Addon_BaltramSkipTrade, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BaltramSkipTrade, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_BaltramSkipTrade, TOPIC_Addon_BaltramSkipTrade_1);

	SCKnowsBaltramAsPirateTrader = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info BaltramPaket
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_BaltramPaket(C_INFO)
{
	npc				= PIR_1301_Addon_Skip_NW;
	nr				= 5;
	condition		= DIA_Addon_Skip_BaltramPaket_Condition;
	information		= DIA_Addon_Skip_BaltramPaket_Info;
	description		= "我 有 一 个 包 裹 给 你 - 贝 尔 卓 姆 的 。";
};

func int DIA_Addon_Skip_BaltramPaket_Condition()
{
	if ((MIS_Addon_Baltram_Paket4Skip == LOG_RUNNING)
	&& (Npc_HasItems(other, ItMi_Packet_Baltram4Skip_Addon)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_BaltramPaket_Info()
{
	AI_Output(other, self, "DIA_Addon_Skip_BaltramPaket_15_00"); //我 有 一 个 包 裹 给 你 - 贝 尔 卓 姆 的 。
	AI_Output(self, other, "DIA_Addon_Skip_BaltramPaket_08_01"); //什 么 ？他 给 我 派 了 个 跑 腿 的 。
	AI_Output(self, other, "DIA_Addon_Skip_BaltramPaket_08_02"); //胆 小 鬼 ！ 你 能 指 望 这 家 伙 做 什 么 ？
	B_GiveInvItems(other, self, ItMi_Packet_Baltram4Skip_Addon, 1);
	AI_Output(other, self, "DIA_Addon_Skip_BaltramPaket_15_03"); //他 想 要 3 瓶 朗 姆 酒 作 为 交 换 。
	AI_Output(self, other, "DIA_Addon_Skip_BaltramPaket_08_04"); //(大 笑)他 想 什 么 呢 ？ ！ 先 让 我 等 了 那 么 久 ， 也 不 露 面 ， 还 想 要 东 西 。
	AI_Output(self, other, "DIA_Addon_Skip_BaltramPaket_08_05"); //给 ， 给 他 两 瓶 。 对 他 来 说 足 够 了 。
	CreateInvItems(self, ItFo_Addon_Rum, 2);
	B_GiveInvItems(self, other, ItFo_Addon_Rum, 2);
	B_GivePlayerXP(XP_Addon_Skip_BaltramPaket);

	B_LogEntry(TOPIC_Addon_BaltramSkipTrade, LogText_Addon_SkipsRumToBaltram);
	Skip_Rum4Baltram = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Woher
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Woher(C_INFO)
{
	npc				= PIR_1301_Addon_Skip_NW;
	nr				= 5;
	condition		= DIA_Addon_Skip_NW_Woher_Condition;
	information		= DIA_Addon_Skip_NW_Woher_Info;
	description		= "你 从 哪 里 来 ？";
};

func int DIA_Addon_Skip_NW_Woher_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Skip_NW_WerBistDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Woher_Info()
{
	AI_Output(other, self, "DIA_Addon_Skip_NW_Woher_15_00"); //你 从 哪 里 来 ？
	AI_Output(self, other, "DIA_Addon_Skip_NW_Woher_08_01"); //你 想 知 道 我 们 的 藏 身 处 在 哪 里 ？

	if (hero.guild == GIL_MIL)
	{
		AI_Output(self, other, "DIA_Addon_Skip_NW_Woher_08_02"); //如 果 我 告 诉 了 一 个 民 兵 成 员 的 话 ， 那 将 是 我 做 的 最 后 一 件 事 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Skip_NW_Woher_08_03"); //如 果 要 我 告 诉 你 的 话 ， 还 不 如 让 民 兵 来 逮 捕 我 。
	};

	AI_Output(self, other, "DIA_Addon_Skip_NW_Woher_08_04"); //而 且 ， 万 一 你 想 要 拜 访 我 们 的 话 ， 那 对 你 也 不 会 有 丝 毫 帮 助 。
	AI_Output(self, other, "DIA_Addon_Skip_NW_Woher_08_05"); //克 霍 里 尼 斯 的 岛 很 大 ， 总 之 ， 从 来 没 有 人 到 过 我 们 那 里 。 除 非 他 们 有 一 条 小 船 或 者 其 它 的 船 。
	AI_Output(self, other, "DIA_Addon_Skip_NW_Woher_08_06"); //然 后 你 要 找 到 穿 过 悬 崖 的 路 。 没 人 能 穿 过 那 里 ， 除 非 他 知 道 秘 密 通 道 。
	AI_Output(self, other, "DIA_Addon_Skip_NW_Woher_08_07"); //只 有 两 个 人 知 道 那 条 路 ， 而 你 不 是 其 中 之 一 。
};

///////////////////////////////////////////////////////////////////////
//	Info SCSawGreg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_SCSawGreg(C_INFO)
{
	npc				= PIR_1301_Addon_Skip_NW;
	nr				= 5;
	condition		= DIA_Addon_Skip_SCSawGreg_Condition;
	information		= DIA_Addon_Skip_SCSawGreg_Info;
	description		= "你 认 识 一 个 带 着 眼 罩 的 人 吗 ？";
};

func int DIA_Addon_Skip_SCSawGreg_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Skip_NW_Woher))
	&& (SC_KnowsConnectionSkipGreg == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_SCSawGreg_Info()
{
	AI_Output(other, self, "DIA_Addon_Skip_SCSawGreg_15_00"); //你 认 识 一 个 带 着 眼 罩 的 人 吗 ？
	AI_Output(self, other, "DIA_Addon_Skip_SCSawGreg_08_01"); //我 认 识 许 多 戴 眼 罩 的 人 。
	AI_Output(other, self, "DIA_Addon_Skip_SCSawGreg_15_02"); //有 人 在 克 霍 里 尼 斯 大 陆 上 徘 徊 ， 而 且 他 似 乎 非 常 了 解 你 。
	AI_Output(self, other, "DIA_Addon_Skip_SCSawGreg_08_03"); //想 不 出 是 谁 。 我 不 和 旱 鸭 子 打 交 道 。
	AI_Output(other, self, "DIA_Addon_Skip_SCSawGreg_15_04"); //但 是 … …
	AI_Output(self, other, "DIA_Addon_Skip_SCSawGreg_08_05"); //算 了 吧 ， 我 真 的 不 感 兴 趣 。
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_MissingPeople(C_INFO)
{
	npc				= PIR_1301_Addon_Skip_NW;
	nr				= 2;
	condition		= DIA_Addon_Skip_NW_MissingPeople_Condition;
	information		= DIA_Addon_Skip_NW_MissingPeople_Info;
	description		= "很 多 市 民 失 踪 了 。";
};

func int DIA_Addon_Skip_NW_MissingPeople_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Skip_NW_Woher))
	&& (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_MissingPeople_Info()
{
	AI_Output(other, self, "DIA_Addon_Skip_NW_MissingPeople_15_00"); //有 很 多 市 民 失 踪 。 而 许 多 迹 象 表 明 ， 你 并 非 与 此 事 完 全 无 关 。
	AI_Output(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_01"); //（ 好 像 突 然 被 抓 住 ） 呃 … … 该 死 ， 不 是 你 想 象 的 那 样 。
	AI_Output(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_02"); //你 看 我 像 个 奴 隶 贩 子 吗 ？ 不 ， 我 只 运 送 货 物 。 他 们 是 什 么 以 及 他 们 是 从 哪 里 来 的 ， 都 和 我 无 关 。
	AI_Output(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_03"); //我 们 给 那 些 卑 鄙 的 家 伙 运 送 各 种 类 型 的 东 西 。
	AI_Output(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_04"); //最 初 只 是 常 规 的 物 品 。 嗯 ， 有 时 也 会 是 违 禁 品 。
	AI_Output(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_05"); //但 是 后 来 他 们 开 始 绑 架 城 市 里 的 居 民 ， 不 知 道 他 们 打 算 让 他 们 做 什 么 。
	AI_Output(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_06"); //我 们 所 做 的 就 是 把 他 们 运 走 。
};

///////////////////////////////////////////////////////////////////////
//	Info Dexter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Dexter(C_INFO)
{
	npc				= PIR_1301_Addon_Skip_NW;
	nr				= 2;
	condition		= DIA_Addon_Skip_NW_Dexter_Condition;
	information		= DIA_Addon_Skip_NW_Dexter_Info;
	description		= "你 说 的 是 谁 ？";
};

func int DIA_Addon_Skip_NW_Dexter_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Skip_NW_MissingPeople))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Dexter_Info()
{
	AI_Output(other, self, "DIA_Addon_Skip_NW_Dexter_15_00"); //你 说 的 是 谁 ？
	AI_Output(self, other, "DIA_Addon_Skip_NW_Dexter_08_01"); //当 然 是 强 盗 。 还 有 谁 ？ 那 些 卑 鄙 的 垃 圾 在 岛 上 任 何 地 方 都 象 在 自 己 家 一 样 。
	AI_Output(self, other, "DIA_Addon_Skip_NW_Dexter_08_02"); //只 有 这 里 不 同 ， 在 克 霍 里 尼 斯 附 近 。
};

func void B_Skip_SaysDextersName()
{
	AI_Output(self, other, "DIA_Addon_Skip_SaysDextersName_08_00"); //我 现 在 想 起 他 的 名 字 了 ， 德 克 斯 特 。 对 ， 我 记 得 他 们 管 叫 他 德 克 斯 特 。

	Log_CreateTopic(TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_WhoStolePeople, TOPIC_Addon_WhoStolePeople_13);

	SC_KnowsDexterAsKidnapper = TRUE;
	Ranger_SCKnowsDexter = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Name
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Name(C_INFO)
{
	npc				= PIR_1301_Addon_Skip_NW;
	nr				= 2;
	condition		= DIA_Addon_Skip_NW_Name_Condition;
	information		= DIA_Addon_Skip_NW_Name_Info;
	description		= "仅 仅 说 ‘ 强 盗 ’ 对 我 来 说 还 不 够 。 我 要 名 字 … …";
};

func int DIA_Addon_Skip_NW_Name_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Skip_NW_Dexter))
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Name_Info()
{
	AI_Output(other, self, "DIA_Addon_Skip_NW_Name_15_00"); //仅 仅 说 ‘ 强 盗 ’ 对 我 来 说 还 不 够 。 我 要 名 字 … …
	AI_Output(self, other, "DIA_Addon_Skip_NW_Name_08_01"); //名 字 ？ 你 想 要 知 道 谁 在 指 挥 那 些 强 盗 ？ 该 死 ， 那 个 混 蛋 的 名 字 叫 什 么 来 着 … …
	AI_Output(self, other, "DIA_Addon_Skip_NW_Name_08_02"); //嗯 。 我 只 是 想 不 起 他 的 名 字 。 虽 然 那 个 名 字 并 不 复 杂 。
	AI_Output(self, other, "DIA_Addon_Skip_NW_Name_08_03"); //但 是 我 能 告 诉 你 在 克 霍 里 尼 斯 的 哪 个 部 分 能 找 到 那 个 团 伙 头 子 。
	AI_Output(self, other, "DIA_Addon_Skip_NW_Name_08_04"); //你 有 像 样 的 地 图 吗 ？

	if (Npc_HasItems(other, ItWr_Map_NewWorld) == FALSE)
	{
		if ((Npc_HasItems(other, ItWr_Map_NewWorld_Ornaments_Addon) == TRUE)
		|| (Npc_HasItems(other, ItWr_Map_Shrine_MIS) == TRUE)
		|| (Npc_HasItems(other, ItWr_Map_Caves_MIS) == TRUE))
		{
			AI_Output(other, self, "DIA_Addon_Skip_NW_Name_15_05"); //这 里 有 一 张 。
			AI_Output(self, other, "DIA_Addon_Skip_NW_Name_08_06"); //但 是 已 经 有 人 把 上 面 写 满 了 字 。 那 么 我 把 这 有 趣 的 东 西 给 你 写 在 哪 里 。
		}
		else
		{
			AI_Output(other, self, "DIA_Addon_Skip_NW_Name_15_07"); //不 。
		};

		AI_Output(self, other, "DIA_Addon_Skip_NW_Name_08_08"); //我 给 你 描 述 一 下 ？
		AI_Output(self, other, "DIA_Addon_Skip_NW_Name_08_09"); //在 东 边 有 一 个 非 常 大 的 农 场 。 农 场 主 的 名 字 叫 欧 纳 尔 ， 我 想 是 。
		AI_Output(self, other, "DIA_Addon_Skip_NW_Name_08_10"); //他 拥 有 的 土 地 非 常 多 。 从 那 些 田 地 向 南 ， 在 高 高 的 悬 崖 上 有 一 座 小 堡 垒 。
		AI_Output(self, other, "DIA_Addon_Skip_NW_Name_08_11"); //在 那 里 ， 你 就 能 找 到 你 要 找 的 人 。
		B_Skip_SaysDextersName();
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Landkarte
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Landkarte(C_INFO)
{
	npc				= PIR_1301_Addon_Skip_NW;
	nr				= 5;
	condition		= DIA_Addon_Skip_NW_Landkarte_Condition;
	information		= DIA_Addon_Skip_NW_Landkarte_Info;
	description		= "给 。 我 已 经 拿 到 了 克 霍 里 尼 斯 的 地 图 。";
};

func int DIA_Addon_Skip_NW_Landkarte_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Skip_NW_Name))
	&& (Npc_HasItems(other, ItWr_Map_NewWorld))
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Landkarte_Info()
{
	AI_Output(other, self, "DIA_Addon_Skip_NW_Landkarte_15_00"); //给 。 我 已 经 拿 到 了 克 霍 里 尼 斯 的 地 图 。
	AI_Output(self, other, "DIA_Addon_Skip_NW_Landkarte_08_01"); //那 样 很 好 。 让 我 找 出 这 个 家 伙 的 藏 身 处 。
	B_GiveInvItems(other, self, ItWr_Map_NewWorld, 1);
	B_Skip_SaysDextersName();
	AI_Output(self, other, "DIA_Addon_Skip_NW_Landkarte_08_02"); //这 是 你 要 的 地 图 。

	Npc_RemoveInvItems(self, ItWr_Map_NewWorld, 1);
	CreateInvItems(self, ItWr_Map_NewWorld_Dexter, 1);
	B_GiveInvItems(self, other, ItWr_Map_NewWorld_Dexter, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info Wohin
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Wohin(C_INFO)
{
	npc				= PIR_1301_Addon_Skip_NW;
	nr				= 99;
	condition		= DIA_Addon_Skip_NW_Wohin_Condition;
	information		= DIA_Addon_Skip_NW_Wohin_Info;
	permanent		= TRUE;
	description		= "你 从 哪 里 抓 到 那 些 人 ？";
};

func int DIA_Addon_Skip_NW_Wohin_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Skip_NW_Woher))
	&& (Npc_KnowsInfo(other, DIA_Addon_Skip_NW_MissingPeople)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Wohin_Info()
{
	AI_Output(other, self, "DIA_Addon_Skip_NW_Wohin_15_00"); //你 从 哪 里 抓 到 那 些 人 ？
	AI_Output(self, other, "DIA_Addon_Skip_NW_Wohin_08_01"); //我 已 经 告 诉 你 了 - 我 不 会 告 诉 你 我 们 的 海 湾 在 哪 里 。
};
