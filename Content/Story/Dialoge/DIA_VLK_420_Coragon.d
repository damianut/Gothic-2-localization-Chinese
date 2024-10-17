///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Coragon_EXIT(C_INFO)
{
	npc				= VLK_420_Coragon;
	nr				= 999;
	condition		= DIA_Coragon_EXIT_Condition;
	information		= DIA_Coragon_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Coragon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Coragon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Coragon_PICKPOCKET(C_INFO)
{
	npc				= VLK_420_Coragon;
	nr				= 900;
	condition		= DIA_Coragon_PICKPOCKET_Condition;
	information		= DIA_Coragon_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Coragon_PICKPOCKET_Condition()
{
	C_Beklauen(40, 45);
};

func void DIA_Coragon_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Coragon_PICKPOCKET);
	Info_AddChoice(DIA_Coragon_PICKPOCKET, DIALOG_BACK, DIA_Coragon_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Coragon_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Coragon_PICKPOCKET_DoIt);
};

func void DIA_Coragon_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Coragon_PICKPOCKET);
};

func void DIA_Coragon_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Coragon_PICKPOCKET);
};

// *********************************************************
// 							Hallo
// *********************************************************
instance DIA_Coragon_HALLO(C_INFO)
{
	npc				= VLK_420_Coragon;
	nr				= 2;
	condition		= DIA_Coragon_HALLO_Condition;
	information		= DIA_Coragon_HALLO_Info;
	description		= "我 能 在 这 里 得 到 饮 料 吗 ？";
};

func int DIA_Coragon_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Coragon_HALLO_Info()
{
	AI_Output(other, self, "DIA_Coragon_HALLO_15_00"); //我 能 在 这 里 得 到 饮 料 吗 ？
	AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_00"); //如 果 你 有 钱 ， 只 要 你 喜 欢 ， 你 还 可 以 在 这 里 吃 饭 。

	Log_CreateTopic(Topic_CityTrader, LOG_NOTE);
	B_LogEntry(Topic_CityTrader, Topic_CityTrader_17);
};

// *********************************************************
// 							Trade
// *********************************************************
instance DIA_Coragon_Trade(C_INFO)
{
	npc				= VLK_420_Coragon;
	nr				= 2;
	condition		= DIA_Coragon_Trade_Condition;
	information		= DIA_Coragon_Trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "让 我 看 看 你 的 货 物 。";
};

func int DIA_Coragon_Trade_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Coragon_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Trade_Info() // FIXME_FILER NOCH ESSEN IN INV
{
	B_GiveTradeInv(self);
	AI_Output(other, self, "DIA_Coragon_Trade_15_00"); //让 我 看 看 你 的 货 物 。
};

// *********************************************************
// 							WhatsUp
// *********************************************************
instance DIA_Coragon_WhatsUp(C_INFO)
{
	npc				= VLK_420_Coragon;
	nr				= 3;
	condition		= DIA_Coragon_WhatsUp_Condition;
	information		= DIA_Coragon_WhatsUp_Info;
	description		= "那 么 ， 最 近 生 意 好 吗 ？ ";
};

func int DIA_Coragon_WhatsUp_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Coragon_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Coragon_WhatsUp_Info()
{
	AI_Output(other, self, "DIA_Coragon_Gelaber_15_00"); //那 么 ， 最 近 生 意 好 吗 ？
	AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_01"); //哈 ， 不 用 提 醒 我 。 安 德 烈 勋 爵 正 在 绞 刑 广 场 分 发 免 费 的 啤 酒 。
	AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_02"); //现 在 几 乎 没 什 么 人 来 这 里 了 ， 除 了 那 些 富 人 区 的 有 钱 人 。
	AI_Output(other, self, "DIA_Coragon_Add_15_03"); //他 们 怎 么 了 ？
	AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_04"); //（ 大 笑 ） 某 些 有 权 有 势 的 人 真 的 能 让 你 感 到 头 痛 。
	AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_05"); //就 说 瓦 尔 地 诺 ， 举 个 例 子 - 我 受 不 了 他 的 眼 神 。
	AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_06"); //但 我 不 能 挑 选 客 人 。 我 需 要 每 一 个 能 挣 到 的 子 儿 。
	AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_07"); //我 好 不 容 易 存 的 一 点 儿 钱 都 被 偷 走 了 ， 还 有 我 所 有 的 银 器 。
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Coragon_MissingPeople(C_INFO)
{
	npc				= VLK_420_Coragon;
	nr				= 5;
	condition		= DIA_Addon_Coragon_MissingPeople_Condition;
	information		= DIA_Addon_Coragon_MissingPeople_Info;
	description		= "告 诉 我 关 于 失 踪 的 市 民 的 事 。";
};

func int DIA_Addon_Coragon_MissingPeople_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Coragon_HALLO)
	&& (SC_HearedAboutMissingPeople == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Coragon_MissingPeople_Info()
{
	AI_Output(other, self, "DIA_Addon_Coragon_MissingPeople_15_00"); //告 诉 我 关 于 失 踪 的 市 民 的 事 。
	AI_Output(self, other, "DIA_Addon_Coragon_MissingPeople_09_01"); //听 说 很 多 人 都 在 港 口 失 踪 了 。 不 过 ， 这 没 什 么 奇 怪 的 。
	AI_Output(self, other, "DIA_Addon_Coragon_MissingPeople_09_02"); //连 镇 上 的 木 匠 托 尔 本 的 学 徒 都 不 在 了 。
	AI_Output(self, other, "DIA_Addon_Coragon_MissingPeople_09_03"); //市 场 的 一 个 名 叫 哈 肯 的 商 人 知 道 一 件 非 常 奇 怪 的 事 情 。
	AI_Output(self, other, "DIA_Addon_Coragon_MissingPeople_09_04"); //据 他 说 ， 有 个 几 乎 天 天 碰 到 的 家 伙 ， 突 然 就 失 踪 了 。 他 为 此 还 专 门 去 找 过 民 兵 。
	AI_Output(self, other, "DIA_Addon_Coragon_MissingPeople_09_05"); //这 令 镇 上 居 民 惊 恐 万 分 。 不 过 ， 这 其 实 非 常 没 有 必 要 。
	AI_Output(self, other, "DIA_Addon_Coragon_MissingPeople_09_06"); //克 霍 里 尼 斯 是 个 贫 瘠 的 城 市 ， 城 外 危 机 四 伏 。
	AI_Output(self, other, "DIA_Addon_Coragon_MissingPeople_09_07"); //那 些 没 有 住 在 城 墙 里 面 的 人 会 被 强 盗 袭 击 ， 或 者 被 野 兽 吃 掉 。 就 这 么 简 单 。

	Log_CreateTopic(TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_WhoStolePeople, TOPIC_Addon_WhoStolePeople_12);
};

// *********************************************************
// 							Bestohlen
// *********************************************************
instance DIA_Coragon_Bestohlen(C_INFO)
{
	npc				= VLK_420_Coragon;
	nr				= 4;
	condition		= DIA_Coragon_Bestohlen_Condition;
	information		= DIA_Coragon_Bestohlen_Info;
	description		= "有 人 偷 了 你 的 东 西 ？";
};

func int DIA_Coragon_Bestohlen_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Bestohlen_Info()
{
	AI_Output(other, self, "DIA_Coragon_Add_15_08"); //你 被 抢 劫 过 ？
	AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_09"); //是 的 ， 前 些 日 子 。 那 天 晚 上 人 还 挺 多 ， 我 正 在 给 人 分 发 啤 酒 。
	AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_10"); //我 没 有 离 开 柜 台 后 面 多 久 - 但 是 那 对 那 些 混 蛋 已 经 够 久 了 。
	AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_11"); //我 为 此 去 见 过 民 兵 - 但 是 ， 当 然 他 们 什 么 也 没 找 到 。 他 们 更 愿 意 在 免 费 啤 酒 摊 上 喝 个 醉 醺 醺 的 。

	MIS_Coragon_Silber = LOG_RUNNING;
};

// **************
// B_Coragon_Bier
// **************

var int Coragon_Bier;
// ------------------

func void B_Coragon_Bier()
{
	Coragon_Bier = Coragon_Bier + 1;

	AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_14"); //给 - 拿 着 这 个 当 做 报 酬 。
	B_GiveInvItems(self, other, ItFo_CoragonsBeer, 1);

	if (Coragon_Bier < 2)
	{
		AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_21"); //非 常 特 别 的 啤 酒 。 这 是 我 的 最 后 一 小 桶 。
	}
	else
	{
		AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_22"); //这 是 真 正 的 最 后 一 滴 ！
	};
};

// *********************************************************
// 							Bestohlen
// *********************************************************
instance DIA_Coragon_BringSilber(C_INFO)
{
	npc				= VLK_420_Coragon;
	nr				= 5;
	condition		= DIA_Coragon_BringSilber_Condition;
	information		= DIA_Coragon_BringSilber_Info;
	description		= "我 找 到 了 你 的 银 器";
};

func int DIA_Coragon_BringSilber_Condition()
{
	if ((MIS_Coragon_Silber == LOG_RUNNING)
	&& (Npc_HasItems(other, ItMi_CoragonsSilber) >= 8))
	{
		return TRUE;
	};
};

func void DIA_Coragon_BringSilber_Info()
{
	AI_Output(other, self, "DIA_Coragon_Add_15_12"); //我 找 到 了 你 的 银 器

	if (B_GiveInvItems(other, self, ItMi_CoragonsSilber, 8))
	{
		Npc_RemoveInvItems(self, ItMi_CoragonsSilber, 8);
	};

	AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_13"); //真 的 ？ ！
	B_GivePlayerXP(XP_CoragonsSilber);
	B_Coragon_Bier();

	MIS_Coragon_Silber = LOG_SUCCESS;
};

// *********************************************************
// 					Lehmars Schuldenbuch
// *********************************************************
instance DIA_Coragon_Schuldenbuch(C_INFO)
{
	npc				= VLK_420_Coragon;
	nr				= 6;
	condition		= DIA_Coragon_Schuldenbuch_Condition;
	information		= DIA_Coragon_Schuldenbuch_Info;
	description		= "我 看 看 我 这 里 有 什 么 … …";
};

func int DIA_Coragon_Schuldenbuch_Condition()
{
	if (Npc_HasItems(other, ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};

func void DIA_Coragon_Schuldenbuch_Info()
{
	AI_Output(other, self, "DIA_Coragon_Add_15_15"); //我 看 看 我 这 里 有 什 么 … …
	AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_16"); //嗯 ？ （ 感 到 惊 讶 的 ） 但 这 是 雷 玛 尔 的 账 本 ！
	AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_17"); //你 准 备 拿 它 干 什 么 ？
};

// *********************************************************
// 					Schuldenbuch geben
// *********************************************************
instance DIA_Coragon_GiveBook(C_INFO)
{
	npc				= VLK_420_Coragon;
	nr				= 7;
	condition		= DIA_Coragon_GiveBook_Condition;
	information		= DIA_Coragon_GiveBook_Info;
	description		= "这 是 你 的 账 本 。";
};

func int DIA_Coragon_GiveBook_Condition()
{
	if (Npc_HasItems(other, ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};

func void DIA_Coragon_GiveBook_Info()
{
	AI_Output(other, self, "DIA_Coragon_Add_15_18"); //这 是 你 的 账 本 。
	B_GiveInvItems(other, self, ItWr_Schuldenbuch, 1);
	AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_19"); //谢 谢 ！ 你 挽 回 了 我 的 面 子 。 雷 玛 尔 会 很 难 看 的 。
	B_GivePlayerXP(XP_Schuldenbuch);
	B_Coragon_Bier();
};

// *********************************************************
// 							ToOV
// *********************************************************
instance DIA_Coragon_ToOV(C_INFO)
{
	npc				= VLK_420_Coragon;
	nr				= 9;
	condition		= DIA_Coragon_ToOV_Condition;
	information		= DIA_Coragon_ToOV_Info;
	description		= "要 想 进 富 人 区 ， 我 必 须 要 怎 么 做 ？";
};

func int DIA_Coragon_ToOV_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Coragon_WhatsUp))
	&& (other.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Coragon_ToOV_Info()
{
	AI_Output(other, self, "DIA_Coragon_Add_15_23"); //要 想 进 富 人 区 ， 我 必 须 要 怎 么 做 ？
	AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_24"); //你 必 须 成 为 城 里 的 市 民 。 去 找 一 些 工 作 。
	AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_25"); //最 好 去 城 里 的 贫 民 区 找 那 些 工 匠 。 那 会 让 你 成 为 一 个 市 民 。
	AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_26"); //好 吧 ， 如 果 那 样 还 不 够 ， 去 兵 营 跟 安 德 烈 勋 爵 谈 谈 。
	AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_27"); //也 许 他 会 让 你 加 入 城 市 卫 兵 的 行 列 。 他 们 也 能 进 入 城 市 的 富 人 区 。
};

// *********************************************************
// 							Valentino
// *********************************************************
instance DIA_Coragon_Valentino(C_INFO)
{
	npc				= VLK_420_Coragon;
	nr				= 8;
	condition		= DIA_Coragon_Valentino_Condition;
	information		= DIA_Coragon_Valentino_Info;
	description		= "这 个 瓦 尔 地 诺 是 怎 么 回 事 ？";
};

func int DIA_Coragon_Valentino_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Valentino_Info()
{
	AI_Output(other, self, "DIA_Coragon_Add_15_28"); //这 个 瓦 尔 地 诺 是 怎 么 回 事 ？
	AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_29"); //他 非 常 富 有 根 本 不 需 要 工 作 。 而 且 他 总 是 拿 这 个 事 向 大 家 吹 嘘 。
	AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_30"); //不 管 你 愿 不 愿 意 听 。
	AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_31"); //他 总 是 喝 得 很 多 ， 并 且 总 是 呆 到 最 后 - 然 后 ， 一 大 早 ， 他 跌 跌 撞 撞 地 回 到 富 人 区 去 。
	AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_32"); //每 天 都 是 如 此 。
};

// *********************************************************
// 						Zeche - Important
// *********************************************************
instance DIA_Coragon_News(C_INFO)
{
	npc				= VLK_420_Coragon;
	nr				= 1;
	condition		= DIA_Coragon_News_Condition;
	information		= DIA_Coragon_News_Info;
	important		= TRUE;
};

func int DIA_Coragon_News_Condition()
{
	if (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		if (Regis_Ring == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Coragon_News_Info()
{
	AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_33"); //昨 天 晚 上 ， 瓦 尔 地 诺 没 有 钱 付 酒 账 了 。
	if (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_34"); //他 喋 喋 不 休 地 唠 叨 说 什 么 被 人 偷 了 ， 以 后 给 我 钱 … … 真 的 ！。
	}
	else // Pickpocket OHNE Niederschlagen - AUSKOMMENTIERT
	{
		AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_35"); //而 且 就 在 那 之 前 ， 他 还 一 直 在 吹 嘘 他 有 多 少 钱 。
		AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_36"); //然 后 ， 他 把 手 伸 进 口 袋 露 出 了 一 个 滑 稽 的 表 情 。 他 说 他 被 偷 了 … …
	};

	AI_Output(other, self, "DIA_Coragon_Add_15_37"); //还 有 吗 ？ 你 怎 么 做 的 ？
	AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_38"); //嗯 ， 我 给 了 他 一 顿 好 打 ， 还 能 有 什 么 ？！
};

// *********************************************************
// 						Ring geben
// *********************************************************
instance DIA_Coragon_Ring(C_INFO)
{
	npc				= VLK_420_Coragon;
	nr				= 10;
	condition		= DIA_Coragon_Ring_Condition;
	information		= DIA_Coragon_Ring_Info;
	description		= "给 - 拿 上 这 个 戒 指 。";
};

func int DIA_Coragon_Ring_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Coragon_News))
	&& (Npc_HasItems(other, ItRi_ValentinosRing) > 0))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Ring_Info()
{
	AI_Output(other, self, "DIA_Coragon_Add_15_39"); //给 - 拿 上 这 个 戒 指 。
	B_GiveInvItems(other, self, ItRi_ValentinosRing, 1);
	AI_Output(self, other, "DIA_ADDON_NEW_Coragon_Add_09_40"); //什 么 ？ 我 不 明 白 … …
	AI_Output(other, self, "DIA_Coragon_Add_15_41"); //那 曾 经 是 瓦 尔 地 诺 的 。
	AI_Output(other, self, "DIA_Coragon_Add_15_42"); //欢 迎 你 把 它 传 给 下 一 位 鞭 打 他 的 人 … …

	B_GivePlayerXP(300);

	AI_StopProcessInfos(self);
};
