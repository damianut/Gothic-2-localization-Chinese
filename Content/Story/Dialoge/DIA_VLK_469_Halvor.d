///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Halvor_EXIT(C_INFO)
{
	npc				= VLK_469_Halvor;
	nr				= 999;
	condition		= DIA_Halvor_EXIT_Condition;
	information		= DIA_Halvor_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Halvor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Halvor_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Halvor_PICKPOCKET(C_INFO)
{
	npc				= VLK_469_Halvor;
	nr				= 900;
	condition		= DIA_Halvor_PICKPOCKET_Condition;
	information		= DIA_Halvor_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Halvor_PICKPOCKET_Condition()
{
	C_Beklauen(78, 150);
};

func void DIA_Halvor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Halvor_PICKPOCKET);
	Info_AddChoice(DIA_Halvor_PICKPOCKET, DIALOG_BACK, DIA_Halvor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Halvor_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Halvor_PICKPOCKET_DoIt);
};

func void DIA_Halvor_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Halvor_PICKPOCKET);
};

func void DIA_Halvor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Halvor_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info MESSAGE
///////////////////////////////////////////////////////////////////////
instance DIA_Halvor_Hallo(C_INFO)
{
	npc				= VLK_469_Halvor;
	nr				= 2;
	condition		= DIA_Halvor_Hallo_Condition;
	information		= DIA_Halvor_Hallo_Info;
	important		= TRUE;
};

func int DIA_Halvor_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (Wld_IsTime(05, 00, 20, 00)))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Hallo_Info()
{
	AI_Output(self, other, "DIA_Halvor_Hallo_06_00"); //嘿 ， 你 需 要 鱼 吗 ？ 到 这 里 来 拿 你 的 鱼 ， 从 深 海 里 来 的 鱼 ！

	Log_CreateTopic(Topic_CityTrader, LOG_NOTE);
	B_LogEntry(Topic_CityTrader, Topic_CityTrader_12);
};

///////////////////////////////////////////////////////////////////////
//	Info TRADE
///////////////////////////////////////////////////////////////////////
instance DIA_Halvor_TRADE(C_INFO)
{
	npc				= VLK_469_Halvor;
	nr				= 2;
	condition		= DIA_Halvor_TRADE_Condition;
	information		= DIA_Halvor_TRADE_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "让 我 看 看 你 的 鱼";
};

func int DIA_Halvor_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Halvor_Hallo)
	&& (Wld_IsTime(05, 00, 20, 00))
	&& (Halvor_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_TRADE_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other, self, "DIA_Halvor_TRADE_15_00"); //让 我 看 看 你 的 鱼 。
};

///////////////////////////////////////////////////////////////////////
//	Info Night
///////////////////////////////////////////////////////////////////////
instance DIA_Halvor_Night(C_INFO)
{
	npc				= VLK_469_Halvor;
	nr				= 2;
	condition		= DIA_Halvor_Night_Condition;
	information		= DIA_Halvor_Night_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Halvor_Night_Condition()
{
	if ((Wld_IsTime(20, 00, 00, 00))
	&& Npc_IsInState(self, ZS_Talk)
	&& (Halvor_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Night_Info()
{
	AI_Output(self, other, "DIA_Halvor_Night_06_00"); //嘿 ， 如 果 你 想 买 鱼 ， 明 天 再 到 我 的 货 摊 来 ， 好 吗 ？
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Halvor_MissingPeople(C_INFO)
{
	npc				= VLK_469_Halvor;
	nr				= 5;
	condition		= DIA_Addon_Halvor_MissingPeople_Condition;
	information		= DIA_Addon_Halvor_MissingPeople_Info;
	description		= "你 能 告 诉 我 一 些 关 于 那 些 失 踪 的 人 的 事 情 吗 ？";
};

func int DIA_Addon_Halvor_MissingPeople_Condition()
{
	if ((SC_HearedAboutMissingPeople == TRUE)
	&& (MissingPeopleReturnedHome == FALSE)
	&& (Halvor_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Halvor_MissingPeople_Info()
{
	AI_Output(other, self, "DIA_Addon_Halvor_MissingPeople_15_00"); //你 能 告 诉 我 一 些 关 于 那 些 失 踪 的 人 的 事 情 吗 ？
	AI_Output(self, other, "DIA_Addon_Halvor_MissingPeople_06_01"); //失 踪 人 口 ？ 这 是 一 个 港 口 ， 伙 计 。 像 那 样 的 事 肯 定 有 。
	AI_Output(self, other, "DIA_Addon_Halvor_MissingPeople_06_02"); //大 海 是 变 幻 莫 测 的 ， 总 会 偶 尔 索 要 一 条 生 命 。
	AI_Output(self, other, "DIA_Addon_Halvor_MissingPeople_06_03"); //一 些 巨 轮 的 船 长 经 常 会 在 一 个 像 克 霍 里 尼 斯 这 样 的 大 海 港 跟 新 水 手 们 签 约 来 补 充 他 们 的 水 手 队 伍 。
	AI_Output(self, other, "DIA_Addon_Halvor_MissingPeople_06_04"); //而 如 果 他 们 找 不 到 志 愿 者 ， 有 些 人 就 会 被 迫 违 背 自 己 的 意 愿 。 然 后 ， 他 们 就 离 开 了 。

	Info_ClearChoices(DIA_Addon_Halvor_MissingPeople);
	Info_AddChoice(DIA_Addon_Halvor_MissingPeople, DIALOG_BACK, DIA_Addon_Halvor_MissingPeople_Back);
	Info_AddChoice(DIA_Addon_Halvor_MissingPeople, "那 会 是 什 么 船 ？", DIA_Addon_Halvor_MissingPeople_schiff);
	Info_AddChoice(DIA_Addon_Halvor_MissingPeople, "你 认 识 某 个 失 踪 的 人 吗 ？", DIA_Addon_Halvor_MissingPeople_wer);
	Info_AddChoice(DIA_Addon_Halvor_MissingPeople, "你 在 想 什 么 人 吗 ？", DIA_Addon_Halvor_MissingPeople_you);
};

func void DIA_Addon_Halvor_MissingPeople_Back()
{
	Info_ClearChoices(DIA_Addon_Halvor_MissingPeople);
};

func void DIA_Addon_Halvor_MissingPeople_wer()
{
	AI_Output(other, self, "DIA_Addon_Halvor_MissingPeople_wer_15_00"); //你 认 识 某 个 失 踪 的 人 吗 ？
	AI_Output(self, other, "DIA_Addon_Halvor_MissingPeople_wer_06_01"); //不 知 道 。 问 问 那 些 造 船 的 人 。

	Log_CreateTopic(TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_WhoStolePeople, TOPIC_Addon_WhoStolePeople_5);
};

func void DIA_Addon_Halvor_MissingPeople_schiff()
{
	AI_Output(other, self, "DIA_Addon_Halvor_MissingPeople_schiff_15_00"); //那 会 是 什 么 船 ？
	AI_Output(self, other, "DIA_Addon_Halvor_MissingPeople_schiff_06_01"); //不 错 的 问 题 。 近 来 没 有 多 少 船 只 来 过 克 霍 里 尼 斯 ， 是 真 的 。
};

func void DIA_Addon_Halvor_MissingPeople_you()
{
	AI_Output(other, self, "DIA_Addon_Halvor_MissingPeople_you_15_00"); //你 在 想 什 么 人 吗 ？
	AI_Output(self, other, "DIA_Addon_Halvor_MissingPeople_you_06_01"); //我 ？ 不 。
};

///////////////////////////////////////////////////////////////////////
//	Info MESSAGE
///////////////////////////////////////////////////////////////////////
instance DIA_Halvor_MESSAGE(C_INFO)
{
	npc				= VLK_469_Halvor;
	nr				= 2;
	condition		= DIA_Halvor_MESSAGE_Condition;
	information		= DIA_Halvor_MESSAGE_Info;
	trade			= FALSE;
	description		= "我 想 这 份 文 件 是 你 的 … …";
};

func int DIA_Halvor_MESSAGE_Condition()
{
	if (Knows_Halvor == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Halvor_MESSAGE_Info()
{
	AI_Output(other, self, "DIA_Halvor_MESSAGE_15_00"); //我 想 这 份 文 件 是 你 的 … …
	AI_Output(self, other, "DIA_Halvor_MESSAGE_06_01"); //什 么 … … ？ 让 我 看 看 。
	B_UseFakeScroll();
	AI_Output(self, other, "DIA_Halvor_MESSAGE_06_02"); //（ 冒 汗 ） 嗯 … … 好 ， 我 们 冷 静 对 待 这 件 事 - 嗯 … … 听 着 。 我 把 从 强 盗 那 里 得 来 的 货 物 转 卖 掉 了 。
	AI_Output(self, other, "DIA_Halvor_MESSAGE_06_03"); //（ 匆 忙 地 ） 不 过 ， 没 有 什 么 理 由 把 这 些 事 直 接 去 报 告 给 民 兵 ， 对 吧 ？ 我 敢 肯 定 我 们 能 达 成 谅 解 ， 不 是 吗 ？

	Info_ClearChoices(DIA_Halvor_MESSAGE);
	Info_AddChoice(DIA_Halvor_MESSAGE, "那 帮 我 一 个 忙", DIA_Halvor_MESSAGE_OFFER);
	Info_AddChoice(DIA_Halvor_MESSAGE, "看 来 等 你 的 是 监 狱 ！", DIA_Halvor_MESSAGE_PRISON);
};

func void DIA_Halvor_MESSAGE_OFFER()
{
	AI_Output(other, self, "DIA_Halvor_MESSAGE_OFFER_15_00"); //那 帮 我 一 个 忙 。
	AI_Output(self, other, "DIA_Halvor_MESSAGE_OFFER_06_01"); //好 吧 。 我 可 以 告 诉 你 一 些 事 。 除 了 鱼 ， 我 还 可 以 卖 点 别 的 东 西 给 你 。
	AI_Output(self, other, "DIA_Halvor_MESSAGE_OFFER_06_03"); //如 果 你 给 我 这 么 可 笑 的 一 张 纸 ， 而 且 ， 嗯 … … 忘 了 这 件 事 ， 你 和 我 可 以 成 为 最 好 的 生 意 伙 伴 。

	Info_ClearChoices(DIA_Halvor_MESSAGE);
	Info_AddChoice(DIA_Halvor_MESSAGE, "好 吧 ， 成 交 。", DIA_Halvor_MESSAGE_Okay);
	Info_AddChoice(DIA_Halvor_MESSAGE, "看 来 等 你 的 是 监 狱 ！", DIA_Halvor_MESSAGE_PRISON);
	Info_AddChoice(DIA_Halvor_MESSAGE, "哦 ，真 的 ？ 那 会 是 什 么 货 物 ？ ", DIA_Halvor_MESSAGE_DEAL);
};

func void DIA_Halvor_MESSAGE_PRISON()
{
	AI_Output(other, self, "DIA_Halvor_MESSAGE_PRISON_15_00"); //看 来 等 你 的 是 监 狱 !
	AI_Output(self, other, "DIA_Halvor_MESSAGE_PRISON_06_01"); //不 ， 等 一 下 ， 你 不 能 那 么 做 ！ 总 之 ， 我 什 么 也 不 是 ， 只 是 一 个 … … 你 知 道 … … 小 人 物 。
	AI_Output(other, self, "DIA_Halvor_MESSAGE_PRISON_15_02"); //你 应 该 早 一 点 就 这 么 想 。 现 在 ， 我 准 备 去 把 你 的 事 报 告 给 安 德 烈 勋 爵 。
	AI_Output(self, other, "DIA_Halvor_MESSAGE_PRISON_06_03"); //你 会 后 悔 这 么 做 的 。

	Betrayal_Halvor = TRUE;

	AI_StopProcessInfos(self);
};

func void DIA_Halvor_MESSAGE_DEAL()
{
	AI_Output(other, self, "DIA_Halvor_MESSAGE_DEAL_15_00"); //哦 真 的 ？ 那 会 是 什 么 货 物 ？
	AI_Output(self, other, "DIA_Halvor_MESSAGE_DEAL_06_01"); //好 吧 ， 我 可 以 给 你 提 供 … … 非 常 特 别 的 鱼 ， 你 知 道 。 不 是 那 种 普 通 的 用 来 吃 的 鱼 。
	AI_Output(other, self, "DIA_Halvor_MESSAGE_DEAL_15_02"); //你 是 说 ， 像 那 种 装 了 你 藏 进 去 的 消 息 的 ？
	AI_Output(self, other, "DIA_Halvor_MESSAGE_DEAL_06_03"); //你 明 白 了 。 我 有 好 几 条 那 样 的 … … 鱼 。
};

func void DIA_Halvor_MESSAGE_Okay()
{
	AI_Output(other, self, "DIA_Halvor_MESSAGE_Okay_15_00"); //好 的 ， 成 交 了 。 我 想 这 件 小 事 就 只 有 两 个 人 知 道 。
	AI_Output(self, other, "DIA_Halvor_MESSAGE_Okay_06_01"); //谢 谢 你 。 下 次 你 要 是 到 了 这 附 近 就 来 随 便 坐 坐 吧 。 我 肯 定 会 有 一 些 你 感 兴 趣 的 事 。

	B_GiveInvItems(other, self, ItWr_HalvorMessage, 1);
	Npc_RemoveInvItems(self, ItWr_HalvorMessage, 1);

	Halvor_Deal = TRUE;
	Diebesgilde_Okay = (Diebesgilde_Okay + 1);
	// ------------------------------------------------------
	CreateInvItems(self, ItSe_ErzFisch, 1);
	CreateInvItems(self, ItSe_GoldFisch, 1);
	CreateInvItems(self, ItSe_Ringfisch, 1);
	CreateInvItems(self, ItSe_LockpickFisch, 1);
	// ------------------------------------------------------
	Info_ClearChoices(DIA_Halvor_MESSAGE);
};

///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
///////////////////////////////////////////////////////////////////////
instance DIA_Halvor_Zeichen(C_INFO)
{
	npc				= VLK_469_Halvor;
	nr				= 2;
	condition		= DIA_Halvor_Zeichen_Condition;
	information		= DIA_Halvor_Zeichen_Info;
	description		= "（ 发 出 盗 贼 信 号 ）";
};

func int DIA_Halvor_Zeichen_Condition()
{
	if ((Knows_SecretSign == TRUE)
	&& (Betrayal_Halvor == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Zeichen_Info()
{
	AI_PlayAni(other, "T_YES");
	AI_Output(self, other, "DIA_Halvor_Zeichen_06_00"); //我 知 道 。 你 不 是 光 为 了 来 买 鱼 。
	AI_Output(self, other, "DIA_Halvor_Zeichen_06_01"); //（ 平 静 地 ） 我 会 给 你 一 个 提 议 。 如 果 你 有 一 些 银 盘 子 或 者 圣 杯 - 我 会 给 它 们 出 一 个 好 价 钱 。

	CreateInvItems(self, ItKe_Lockpick, 20);

	Log_CreateTopic(Topic_Diebesgilde, LOG_NOTE);
	B_LogEntry(Topic_Diebesgilde, Topic_Diebesgilde_3);
};

///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
///////////////////////////////////////////////////////////////////////
instance DIA_Halvor_Hehlerei(C_INFO)
{
	npc				= VLK_469_Halvor;
	nr				= 2;
	condition		= DIA_Halvor_Hehlerei_Condition;
	information		= DIA_Halvor_Hehlerei_Info;
	permanent		= TRUE;
	description		= "（ 卖 掉 所 有 的 盘 子 和 酒 杯 ）";
};

func int DIA_Halvor_Hehlerei_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Halvor_Zeichen)
	&& (Betrayal_Halvor == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Hehlerei_Info()
{
	Halvor_Score = 0; // resetten

	if (Halvor_Day != Wld_GetDay())
	{
		if ((Npc_HasItems(other, ItMi_SilverPlate) >= 1)
		|| (Npc_HasItems(other, ItMi_SilverCup) >= 1))
		{
			Halvor_Score = (Npc_HasItems(other, ItMi_SilverPlate) *(Value_SilverPlate / 2)) + (Npc_HasItems(other, ItMi_SilverCup) *(Value_SilverCup / 2));

			if (Halvor_Score <= 1000) // weil sonst kein B_Say_Gold mehr...
			{
				AI_Output(self, other, "DIA_Halvor_Zeichen_06_05"); //为 了 交 换 你 所 有 的 东 西 ， 我 会 给 你 … …
				B_Say_Gold(self, other, Halvor_Score);

				Info_ClearChoices(DIA_Halvor_Hehlerei);
				Info_AddChoice(DIA_Halvor_Hehlerei, "好 吧 ， 卖 出 去 了", DIA_Halvor_Hehlerei_Annehmen);
				Info_AddChoice(DIA_Halvor_Hehlerei, "我 会 考 虑 的", DIA_Halvor_Hehlerei_Ablehnen);
			}
			else
			{
				AI_Output(self, other, "DIA_Halvor_Zeichen_06_06"); //你 带 来 的 东 西 太 多 了 。 我 一 时 之 间 没 有 那 么 多 金 币 可 以 给 你 。
				Info_ClearChoices(DIA_Halvor_Hehlerei);
			};
		}
		else
		{
			AI_Output(self, other, "DIA_Halvor_Zeichen_06_02"); //当 你 有 一 些 银 盘 子 或 者 圣 杯 的 时 候 再 来 。
			Info_ClearChoices(DIA_Halvor_Hehlerei);
		};
	}
	else if (Wld_GetDay() == 0)
	{
		AI_Output(self, other, "DIA_Halvor_Zeichen_06_03"); //你 可 以 明 天 再 来 把 你 的 银 器 卖 到 这 里 。 今 天 太 早 了 。
	}
	else
	{
		AI_Output(self, other, "DIA_Halvor_Zeichen_06_04"); //对 不 起 ， 今 天 不 做 生 意 了 。 明 天 再 来 ， 好 吗 ？
	};
};

func void DIA_Halvor_Hehlerei_Annehmen()
{
	/*
	CreateInvItems(other, ItRW_Arrow, (Npc_HasItems(other, ItMi_SilverPlate) + Npc_HasItems(other, ItMi_SilverCup))); // Für Textausgabe -> ist ziemlich dreckig, aber wie sonst?
	B_GiveInvItems(other, self, ItRW_Arrow, (Npc_HasItems(other, ItMi_SilverPlate) + Npc_HasItems(other, ItMi_SilverCup)));
 	*/

	// --------- Patch 2.5a-----------------------------------------
	var int amount;
	var string concatText;
	amount = (Npc_HasItems(other, ItMi_SilverPlate) + Npc_HasItems(other, ItMi_SilverCup));

	concatText = ConcatStrings(IntToString(amount), PRINT_ItemsGegeben);
	AI_PrintScreen(concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

	// ------------------------------------------------------------

	Npc_RemoveInvItems(other, ItMi_SilverCup, Npc_HasItems(other, ItMi_SilverCup));
	Npc_RemoveInvItems(other, ItMi_SilverPlate, Npc_HasItems(other, ItmI_SilverPlate));

	B_GiveInvItems(self, other, ItMi_Gold, Halvor_Score);

	AI_Output(other, self, "DIA_Halvor_Zeichen_Annehmen_15_00"); //好 吧 ， 卖 出 去 了 。
	AI_Output(self, other, "DIA_Halvor_Zeichen_Annehmen_06_01"); //我 们 今 天 已 经 做 了 几 笔 好 买 卖 。 最 好 在 明 天 之 前 不 要 再 来 ， 要 不 可 能 会 引 起 别 人 的 怀 疑 ， 你 明 白 吗 ？

	Halvor_Day = Wld_GetDay();
	Info_ClearChoices(DIA_Halvor_Hehlerei);
};

func void DIA_Halvor_Hehlerei_Ablehnen()
{
	Info_ClearChoices(DIA_Halvor_Hehlerei);
};

// #############################################
// ##
// ## Kapitel 5
// ##
// #############################################

///////////////////////////////////////////////////////////////////////
//	Info MESSAGE
///////////////////////////////////////////////////////////////////////
instance DIA_Halvor_Crew(C_INFO)
{
	npc				= VLK_469_Halvor;
	nr				= 51;
	condition		= DIA_Halvor_Crew_Condition;
	information		= DIA_Halvor_Crew_Info;
	description		= "我 在 找 船 员 。";
};

func int DIA_Halvor_Crew_Condition()
{
	if ((MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Halvor_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Crew_Info()
{
	AI_Output(other, self, "DIA_Halvor_Crew_15_00"); //我 在 找 船 员 。
	AI_Output(self, other, "DIA_Halvor_Crew_06_01"); //但 是 你 打 算 怎 么 离 开 这 里 ？

	Info_ClearChoices(DIA_Halvor_Crew);
	Info_AddChoice(DIA_Halvor_Crew, "那 是 我 自 己 的 事 。", DIA_Halvor_Crew_MyThing);
	Info_AddChoice(DIA_Halvor_Crew, "我 要 征 用 一 艘 船 。", DIA_Halvor_Crew_StealShip);
};

func void DIA_Halvor_Crew_MyThing()
{
	AI_Output(other, self, "DIA_Halvor_Crew_MyThing_15_00"); //那 是 我 自 己 的 事 。
	AI_Output(self, other, "DIA_Halvor_Crew_MyThing_06_01"); //随 你 的 便 。 不 关 我 的 事 ， 真 的 。

	Info_ClearChoices(DIA_Halvor_Crew);
	Info_AddChoice(DIA_Halvor_Crew, DIALOG_BACK, DIA_Halvor_Crew_BACK);
	Info_AddChoice(DIA_Halvor_Crew, "想 要 一 起 来 吗 ？", DIA_Halvor_Crew_JoinMe);
	Info_AddChoice(DIA_Halvor_Crew, "你 能 帮 助 我 吗 ？", DIA_Halvor_Crew_HelpMe);
};

func void DIA_Halvor_Crew_StealShip()
{
	AI_Output(other, self, "DIA_Halvor_Crew_StealShip_15_00"); //我 要 征 用 一 艘 船 。
	AI_Output(self, other, "DIA_Halvor_Crew_StealShip_06_01"); //是 ， 对 了 。 你 是 认 真 的 吗 ？ 那 些 圣 骑 士 抓 到 你 后 会 把 你 除 掉 。
	AI_Output(self, other, "DIA_Halvor_Crew_StealShip_06_02"); //随 你 的 便 - 你 赔 的 又 不 是 我 的 命 。

	Info_ClearChoices(DIA_Halvor_Crew);
	Info_AddChoice(DIA_Halvor_Crew, DIALOG_BACK, DIA_Halvor_Crew_BACK);
	Info_AddChoice(DIA_Halvor_Crew, "想 要 一 起 来 吗 ？", DIA_Halvor_Crew_JoinMe);
	if (Npc_IsDead(JACK) == FALSE)
	{
		Info_AddChoice(DIA_Halvor_Crew, "你 能 帮 助 我 吗 ？", DIA_Halvor_Crew_HelpMe);
	};
};

func void DIA_Halvor_Crew_JoinMe()
{
	AI_Output(other, self, "DIA_Halvor_Crew_JoinMe_15_00"); //想 要 一 起 来 吗 ？
	AI_Output(self, other, "DIA_Halvor_Crew_JoinMe_06_01"); //不 ， 我 想 不 是 。 我 这 里 还 有 好 多 事 情 要 做 ， 老 实 说 ， 我 可 一 点 也 不 喜 欢 遇 到 一 艘 装 满 了 兽 人 的 奴 隶 船 。
	AI_Output(self, other, "DIA_Halvor_Crew_JoinMe_06_02"); //不 过 ， 我 祝 你 好 运 不 断 。
};

func void DIA_Halvor_Crew_HelpMe()
{
	AI_Output(other, self, "DIA_Halvor_Crew_HelpMe_15_00"); //你 能 帮 助 我 吗 ？
	AI_Output(self, other, "DIA_Halvor_Crew_HelpMe_06_01"); //我 不 是 合 适 人 选 。 不 过 ， 可 以 去 跟 杰 克 谈 谈 ， 他 应 该 在 港 口 这 附 近 闲 逛 。 他 会 最 清 楚 这 次 旅 行 需 要 什 么 东 西 。
};

func void DIA_Halvor_Crew_Back()
{
	Info_ClearChoices(DIA_Halvor_Crew);
};
