///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_EXIT(C_INFO)
{
	npc				= VLK_407_Hakon;
	nr				= 999;
	condition		= DIA_Hakon_EXIT_Condition;
	information		= DIA_Hakon_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Hakon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Hakon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Sperre
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Sperre(C_INFO)
{
	npc				= VLK_407_Hakon;
	nr				= 2;
	condition		= DIA_Hakon_Sperre_Condition;
	information		= DIA_Hakon_Sperre_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Hakon_Sperre_Condition()
{
	if ((Canthar_Sperre == TRUE)
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};

	// return FALSE;
};

func void DIA_Hakon_Sperre_Info()
{
	AI_Output(self, other, "DIA_Hakon_Sperre_12_00"); //走 开 ， 罪 犯 ！ 坎 萨 已 经 告 诉 了 我 你 是 个 多 么 下 流 的 混 蛋 ！
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Hallo(C_INFO)
{
	npc				= VLK_407_Hakon;
	nr				= 3;
	condition		= DIA_Hakon_Hallo_Condition;
	information		= DIA_Hakon_Hallo_Info;
	important		= TRUE;
};

func int DIA_Hakon_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (Canthar_Sperre == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Hallo_Info()
{
	AI_Output(self, other, "DIA_Hakon_Add_12_00"); //我 是 哈 肯 ， 武 器 商 人 。？
	AI_Output(self, other, "DIA_Hakon_Add_12_01"); //当 今 形 势 ， 每 一 个 人 都 应 该 带 上 一 件 武 器 。 尤 其 是 在 城 外 冒 险 的 时 候 。

	Log_CreateTopic(Topic_CityTrader, LOG_NOTE);
	B_LogEntry(Topic_CityTrader, Topic_CityTrader_15);
};

///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Trade(C_INFO)
{
	npc				= VLK_407_Hakon;
	nr				= 99;
	condition		= DIA_Hakon_Trade_Condition;
	information		= DIA_Hakon_Trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "让 我 看 看 你 的 货 物";
};

func int DIA_Hakon_Trade_Condition()
{
	return TRUE;
};

func void DIA_Hakon_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other, self, "DIA_Hakon_Trade_15_00"); //让 我 看 看 你 的 货 物 。

	if ((hero.guild == GIL_PAL)
	|| (hero.guild == GIL_KDF))
	{
		AI_Output(self, other, "DIA_Hakon_Trade_12_01"); //我 们 神 圣 的 教 会 代 表 能 对 我 的 物 品 感 兴 趣 ， 这 是 我 的 荣 誉 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Hakon_MissingPeople(C_INFO)
{
	npc				= VLK_407_Hakon;
	nr				= 5;
	condition		= DIA_Addon_Hakon_MissingPeople_Condition;
	information		= DIA_Addon_Hakon_MissingPeople_Info;
	description		= "你 知 道 克 霍 里 尼 斯 市 民 失 踪 的 事 吗 ？";
};

func int DIA_Addon_Hakon_MissingPeople_Condition()
{
	if (SC_HearedAboutMissingPeople == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Hakon_MissingPeople_Info()
{
	AI_Output(other, self, "DIA_Addon_Hakon_MissingPeople_15_00"); //你 知 道 克 霍 里 尼 斯 市 民 失 踪 的 事 吗 ？
	AI_Output(self, other, "DIA_Addon_Hakon_MissingPeople_12_01"); //我 看 到 了 很 多 人 通 过 城 市 的 东 门 。
	AI_Output(self, other, "DIA_Addon_Hakon_MissingPeople_12_02"); //他 们 其 中 一 些 人 ， 我 从 来 没 见 过 ， 很 多 从 这 里 出 去 的 人 永 远 都 没 回 来 。
	AI_Output(self, other, "DIA_Addon_Hakon_MissingPeople_12_03"); //但 有 一 天 发 生 的 事 情 却 真 的 太 奇 怪 了 。
	AI_Output(self, other, "DIA_Addon_Hakon_MissingPeople_12_04"); //有 一 个 家 伙 来 了 这 里 - 我 想 他 叫 做 乔 。 他 吹 牛 说 他 就 要 挣 到 相 当 大 的 一 笔 钱 。
	AI_Output(self, other, "DIA_Addon_Hakon_MissingPeople_12_05"); //他 声 称 自 己 知 道 怎 样 进 到 一 个 城 市 的 塔 楼 里 去 ， 那 里 是 民 兵 存 放 武 器 的 地 方 。
	AI_Output(self, other, "DIA_Addon_Hakon_MissingPeople_12_06"); //此 后 ， 我 再 也 没 见 过 他 ， 尽 管 我 原 先 每 天 那 个 时 候 都 能 碰 到 他 。
	AI_Output(self, other, "DIA_Addon_Hakon_MissingPeople_12_07"); //我 把 这 件 事 情 报 告 了 民 兵 。 我 想 也 许 他 已 经 被 抓 住 并 被 扔 进 了 地 牢 。
	AI_Output(self, other, "DIA_Addon_Hakon_MissingPeople_12_08"); //但 是 ， 安 德 烈 勋 爵 不 知 道 我 在 说 些 什 么 。 他 甚 至 不 知 道 这 个 家 伙 。

	Log_CreateTopic(TOPIC_Addon_Joe, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Joe, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Joe, TOPIC_Addon_Joe_1);

	B_GivePlayerXP(XP_Ambient);
};

// ********************************************************
// 						OutOfTown
// ********************************************************
instance DIA_Hakon_OutOfTown(C_INFO)
{
	npc				= VLK_407_Hakon;
	nr				= 2;
	condition		= DIA_Hakon_OutOfTown_Condition;
	information		= DIA_Hakon_OutOfTown_Info;
	description		= "告 诉 我 更 多 一 些 城 市 周 围 区 域 的 情 况 。";
};

func int DIA_Hakon_OutOfTown_Condition()
{
	return TRUE;
};

func void DIA_Hakon_OutOfTown_Info()
{
	AI_Output(other, self, "DIA_Hakon_Add_15_02"); //告 诉 我 更 多 一 些 城 市 周 围 区 域 的 情 况 。
	AI_Output(self, other, "DIA_Hakon_Add_12_03"); //那 外 面 非 常 危 险 。
	AI_Output(self, other, "DIA_Hakon_Add_12_04"); //因 为 有 强 盗 ， 这 是 其 一 ， 还 有 野 兽 。
	AI_Output(self, other, "DIA_Hakon_Add_12_05"); //在 这 样 倒 霉 的 时 候 ， 好 象 就 连 野 兽 也 没 有 足 够 吃 的 东 西 。
	AI_Output(self, other, "DIA_Hakon_Add_12_06"); //它 们 始 终 在 冒 险 接 近 城 市 。
};

// ********************************************************
// 						Paladine
// ********************************************************
instance DIA_Hakon_Paladine(C_INFO)
{
	npc				= VLK_407_Hakon;
	nr				= 3;
	condition		= DIA_Hakon_Paladine_Condition;
	information		= DIA_Hakon_Paladine_Info;
	description		= "你 知 道 一 些 关 于 圣 骑 士 的 事 吗 ？";
};

func int DIA_Hakon_Paladine_Condition()
{
	return TRUE;
};

func void DIA_Hakon_Paladine_Info()
{
	AI_Output(other, self, "DIA_Hakon_Add_15_07"); //你 知 道 一 些 关 于 圣 骑 士 的 事 吗 ？
	AI_Output(self, other, "DIA_Hakon_Add_12_08"); //是 的 ！ 那 些 家 伙 毁 了 我 的 生 意 ！
	AI_Output(self, other, "DIA_Hakon_Add_12_09"); //在 整 个 城 里 ， 你 最 多 只 能 买 到 一 把 短 剑 。
	AI_Output(self, other, "DIA_Hakon_Add_12_10"); //他 们 已 经 把 所 有 长 过 一 尺 半 的 东 西 都 给 了 自 己 。
	AI_Output(self, other, "DIA_Hakon_Add_12_11"); //（ 讽 刺 地 ） 作 为 回 报 ， 我 现 在 免 费 住 在 酒 馆 里 - 哈 ！
};

// ********************************************************
// 						WoWaffen
// ********************************************************
instance DIA_Hakon_WoWaffen(C_INFO)
{
	npc				= VLK_407_Hakon;
	nr				= 4;
	condition		= DIA_Hakon_WoWaffen_Condition;
	information		= DIA_Hakon_WoWaffen_Info;
	description		= "你 的 武 器 从 哪 里 来 ？";
};

func int DIA_Hakon_WoWaffen_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Hakon_Paladine))
	{
		return TRUE;
	};
};

func void DIA_Hakon_WoWaffen_Info()
{
	AI_Output(other, self, "DIA_Hakon_Add_15_12"); //你 的 武 器 从 哪 里 来 ？
	if (Npc_KnowsInfo(other, DIA_Hakon_HaradBandits))
	{
		AI_Output(self, other, "DIA_Hakon_Add_12_13"); //到 处 都 没 有 ！ 到 目 前 为 止 ， 哈 莱 德 一 直 是 我 的 供 货 商 。
	}
	else
	{
		AI_Output(self, other, "DIA_Hakon_Add_12_14"); //到 目 前 为 止 ， 铁 匠 哈 莱 德 一 直 是 我 的 供 货 商 。
	};

	AI_Output(self, other, "DIA_Hakon_Add_12_15"); //现 在 ， 他 所 有 的 工 作 就 是 给 那 些 圣 骑 士 制 造 东 西 。
	AI_Output(self, other, "DIA_Hakon_Add_12_16"); //他 像 个 疯 子 一 样 没 日 没 夜 地 为 那 些 家 伙 工 作 ， 没 有 报 酬 。 他 认 为 那 是 他 的 责 任 。
	AI_Output(self, other, "DIA_Hakon_Add_12_17"); //现 在 ， 我 能 给 你 的 全 部 东 西 就 是 我 的 剩 余 库 存 … …
};

// ********************************************************
// 						HaradBandits
// ********************************************************
instance DIA_Hakon_HaradBandits(C_INFO)
{
	npc				= VLK_407_Hakon;
	nr				= 5;
	condition		= DIA_Hakon_HaradBandits_Condition;
	information		= DIA_Hakon_HaradBandits_Info;
	description		= "哈 莱 德 告 诉 了 我 关 于 强 盗 的 袭 击 … …";
};

func int DIA_Hakon_HaradBandits_Condition()
{
	if (Harad_HakonMission == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Hakon_HaradBandits_Info()
{
	AI_Output(other, self, "DIA_Hakon_Add_15_18"); //哈 莱 德 告 诉 了 我 关 于 强 盗 的 袭 击 … …
	AI_Output(self, other, "DIA_Hakon_Add_12_19"); //哦 ？ 还 有 吗 ？
	AI_Output(other, self, "DIA_Hakon_Add_15_20"); //如 果 我 抓 到 了 那 些 强 盗 ， 他 就 会 答 应 收 我 做 学 徒 。
	AI_Output(self, other, "DIA_Hakon_Add_12_21"); //（ 大 笑 ） 好 样 的 老 哈 莱 德 。 那 也 许 是 他 用 他 的 方 式 在 说 ： 他 很 遗 憾 ， 因 为 现 在 不 能 为 我 生 产 任 何 武 器 。
};

///////////////////////////////////////////////////////////////////////
//	Info Banditen
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Banditen(C_INFO)
{
	npc				= VLK_407_Hakon;
	nr				= 6;
	condition		= DIA_Hakon_Banditen_Condition;
	information		= DIA_Hakon_Banditen_Info;
	description		= "关 于 强 盗 你 知 道 些 什 么 ？";
};

func int DIA_Hakon_Banditen_Condition()
{
	if ((Npc_KnowsInfo(hero, DIA_Hakon_HaradBandits))
	|| (Npc_KnowsInfo(hero, DIA_Hakon_OutOfTown)))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Banditen_Info()
{
	AI_Output(other, self, "DIA_Hakon_Banditen_15_00"); //关 于 强 盗 你 知 道 些 什 么 ？
	AI_Output(self, other, "DIA_Hakon_Banditen_12_01"); //我 知 道 他 们 的 一 些 事 情 ？ 他 们 在 我 去 城 里 的 路 上 抢 劫 了 我 ！
	AI_Output(self, other, "DIA_Hakon_Banditen_12_02"); //而 且 我 不 是 唯 一 的 一 个 。 他 们 从 事 抢 劫 已 经 很 长 一 段 时 间 了 。
	AI_Output(self, other, "DIA_Hakon_Banditen_12_03"); //民 兵 试 图 捕 获 他 们 ， 但 没 有 一 次 成 功 。

	MIS_HakonBandits = LOG_RUNNING;

	Log_CreateTopic(TOPIC_HakonBanditen, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HakonBanditen, LOG_RUNNING);
	B_LogEntry(TOPIC_HakonBanditen, TOPIC_HakonBanditen_3);
};

///////////////////////////////////////////////////////////////////////
//	WIEVIEL
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Wieviel(C_INFO)
{
	npc				= VLK_407_Hakon;
	nr				= 6;
	condition		= DIA_Hakon_Wieviel_Condition;
	information		= DIA_Hakon_Wieviel_Info;
	description		= "我 会 处 理 … …";
};

func int DIA_Hakon_Wieviel_Condition()
{
	if (MIS_HakonBandits == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Hakon_Wieviel_Info()
{
	AI_Output(other, self, "DIA_Hakon_Banditen_Ehre_15_00"); //我 会 处 理 … …
	AI_Output(self, other, "DIA_Hakon_Banditen_Kohle_12_01"); //什 么 ， 你 想 去 对 付 那 些 强 盗 ？ 就 你 自 己 ？ 你 真 的 是 一 个 不 错 的 战 士 ， 是 吗 ？
	AI_Output(other, self, "DIA_Hakon_Banditen_Kohle_15_00"); //这 件 事 对 你 有 多 大 的 价 值 ？

	if (Npc_KnowsInfo(other, DIA_Hakon_HaradBandits))
	{
		AI_Output(self, other, "DIA_Hakon_Add_12_25"); //（ 奸 诈 地 ） 你 想 讨 哈 莱 德 的 欢 心 ， 是 吗 ？
		AI_Output(self, other, "DIA_Hakon_Add_12_26"); //我 想 我 不 必 为 此 付 钱 给 你 … …
	}
	else
	{
		AI_Output(self, other, "DIA_Hakon_Banditen_Ehre_12_01"); //这 是 个 危 险 的 活 儿 。
		AI_Output(self, other, "DIA_Hakon_Banditen_Kohle_12_02"); //嗯 ， 这 对 我 来 说 没 什 么 。 我 会 付 给 你100个 金 币 ， 如 果 你 打 败 了 那 些 强 盗 的 话 。
		MIS_HakonBanditsPay = TRUE;
	};

	Info_ClearChoices(DIA_Hakon_Banditen);
};

///////////////////////////////////////////////////////////////////////
//	Info Miliz
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Miliz(C_INFO)
{
	npc				= VLK_407_Hakon;
	nr				= 4;
	condition		= DIA_Hakon_Miliz_Condition;
	information		= DIA_Hakon_Miliz_Info;
	description		= "你 知 道 民 兵 里 有 谁 参 加 了 搜 索 吗 ？ ";
};

func int DIA_Hakon_Miliz_Condition()
{
	if (MIS_HakonBandits == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Hakon_Miliz_Info()
{
	AI_Output(other, self, "DIA_Hakon_Miliz_15_00"); //你 知 道 民 兵 里 面 谁 参 加 了 搜 索 吗 ？
	AI_Output(self, other, "DIA_Hakon_Miliz_12_01"); //那 个 家 伙 叫 做 派 布 洛 。 他 和 其 它 两 个 人 一 起 去 找 的 强 盗 。 但 他 们 没 找 到 他 们 。
	AI_Output(other, self, "DIA_Hakon_Miliz_15_02"); //你 知 道 我 能 去 哪 里 找 派 布 洛 吗 ？
	AI_Output(self, other, "DIA_Hakon_Miliz_12_03"); //他 绕 着 城 巡 逻 。 你 可 以 到 神 殿 区 或 者 城 里 的 贫 民 区 去 找 他 。

	B_LogEntry(TOPIC_HakonBanditen, TOPIC_HakonBanditen_4);
};

///////////////////////////////////////////////////////////////////////
//	Info Wo
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Wo(C_INFO)
{
	npc				= VLK_407_Hakon;
	nr				= 5;
	condition		= DIA_Hakon_Wo_Condition;
	information		= DIA_Hakon_Wo_Info;
	description		= "他 们 把 你 关 在 哪 里 ？ ";
};

func int DIA_Hakon_Wo_Condition()
{
	if (MIS_HakonBandits == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Hakon_Wo_Info()
{
	AI_Output(other, self, "DIA_Hakon_Wo_15_00"); //他 们 把 你 关 在 哪 里 ？
	AI_Output(self, other, "DIA_Hakon_Wo_12_01"); //靠 近 阿 基 尔 的 农 场 。 就 是 从 这 里 到 城 门 外 面 ， 然 后 沿 着 路 向 右 边 走 。
	AI_Output(self, other, "DIA_Hakon_Wo_12_02"); //不 久 ， 你 就 会 走 到 几 节 台 阶 那 里 。 那 些 混 蛋 是 从 那 里 来 的 。 我 敢 打 赌 ， 他 们 的 老 巢 就 在 那 些 树 林 子 里 头 。
};

///////////////////////////////////////////////////////////////////////
//	Info Miliz
///////////////////////////////////////////////////////////////////////
instance DIA_Hakon_Success(C_INFO)
{
	npc				= VLK_407_Hakon;
	nr				= 2;
	condition		= DIA_Hakon_Success_Condition;
	information		= DIA_Hakon_Success_Info;
	description		= "我 解 决 了 强 盗";
};

func int DIA_Hakon_Success_Condition()
{
	if ((MIS_HakonBandits == LOG_RUNNING)
	&& (Npc_IsDead(Bandit_1))
	&& (Npc_IsDead(Bandit_2))
	&& (Npc_IsDead(Bandit_3)))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Success_Info()
{
	AI_Output(other, self, "DIA_Hakon_Success_15_00"); //我 解 决 了 强 盗 。
	AI_Output(self, other, "DIA_Hakon_Add_12_27"); //真 的 吗 ？ 谁 都 可 以 那 么 说 。 你 有 证 据 吗 ？
	AI_Output(other, self, "DIA_Hakon_Add_15_28"); //（ 叹 息 ） 我 是 不 是 该 回 去 把 他 们 的 头 拧 下 来 ？
	AI_Output(self, other, "DIA_Hakon_Add_12_29"); //（ 匆 忙 地 ） 不 - 我 不 认 为 有 那 个 必 要 。 我 相 信 你 。
	AI_Output(self, other, "DIA_Hakon_Success_12_01"); //你 为 商 人 们 和 这 座 城 市 作 出 了 很 大 的 贡 献 。

	if (Npc_KnowsInfo(other, DIA_Hakon_HaradBandits))
	{
		AI_Output(self, other, "DIA_Hakon_Add_12_30"); //哈 莱 德 会 满 意 的 - 我 想 。
	};

	if (MIS_HakonBanditsPay == TRUE)
	{
		AI_Output(self, other, "DIA_Hakon_Success_12_02"); //这 是 答 应 给 你 的 钱 。
		B_GiveInvItems(self, other, ItMi_Gold, 100);
	};

	MIS_HakonBandits = LOG_SUCCESS;
	B_GivePlayerXP(XP_Hakon_Bandits);
};

// ************************************************************
// 		Minenanteil
// ************************************************************
instance DIA_Hakon_Minenanteil(C_INFO)
{
	npc				= VLK_407_Hakon;
	nr				= 3;
	condition		= DIA_Hakon_Minenanteil_Condition;
	information		= DIA_Hakon_Minenanteil_Info;
	description		= "你 正 在 出 售 的 矿 坑 股 票 是 从 哪 里 弄 到 的 ？";
};

func int DIA_Hakon_Minenanteil_Condition()
{
	if ((hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Minenanteil_Info()
{
	AI_Output(other, self, "DIA_Hakon_Minenanteil_15_00"); //你 正 在 出 售 的 矿 坑 股 票 是 从 哪 里 弄 到 的 ？
	AI_Output(self, other, "DIA_Hakon_Minenanteil_12_01"); //对 不 起 ， 但 是 ， 我 不 会 告 诉 你 。 那 对 我 来 说 太 危 险 了 。
	B_GivePlayerXP(XP_Ambient);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Hakon_PICKPOCKET(C_INFO)
{
	npc				= VLK_407_Hakon;
	nr				= 900;
	condition		= DIA_Hakon_PICKPOCKET_Condition;
	information		= DIA_Hakon_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Hakon_PICKPOCKET_Condition()
{
	C_Beklauen(45, 65);
};

func void DIA_Hakon_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hakon_PICKPOCKET);
	Info_AddChoice(DIA_Hakon_PICKPOCKET, DIALOG_BACK, DIA_Hakon_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hakon_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Hakon_PICKPOCKET_DoIt);
};

func void DIA_Hakon_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hakon_PICKPOCKET);
};

func void DIA_Hakon_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hakon_PICKPOCKET);
};

// ************************************************************
// 			  				Kapitel2
// ************************************************************
instance DIA_Hakon_Kapitel2(C_INFO)
{
	npc				= VLK_407_Hakon;
	nr				= 5;
	condition		= DIA_Hakon_Kapitel2_Condition;
	information		= DIA_Hakon_Kapitel2_Info;
	important		= TRUE;
};

func int DIA_Hakon_Kapitel2_Condition()
{
	if ((Kapitel >= 2)
	&& (Canthar_Sperre == FALSE)
	&& (self.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Kapitel2_Info()
{
	AI_Output(self, other, "DIA_Hakon_Add_12_22"); //又 是 你 ！
	AI_Output(self, other, "DIA_Hakon_Add_12_23"); //哈 莱 德 终 于 为 圣 骑 士 完 成 了 那 些 该 死 的 活 。
	AI_Output(self, other, "DIA_Hakon_Add_12_24"); //这 就 是 说 ， 我 现 在 可 以 为 你 提 供 一 些 新 武 器 了 。 你 感 兴 趣 吗 ？
};
