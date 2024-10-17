///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_EXIT(C_INFO)
{
	npc				= VLK_435_Nadja;
	nr				= 999;
	condition		= DIA_Nadja_EXIT_Condition;
	information		= DIA_Nadja_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Nadja_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Nadja_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Nadja_PICKPOCKET(C_INFO)
{
	npc				= VLK_435_Nadja;
	nr				= 900;
	condition		= DIA_Nadja_PICKPOCKET_Condition;
	information		= DIA_Nadja_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40_Female;
};

func int DIA_Nadja_PICKPOCKET_Condition()
{
	C_Beklauen(40, 40);
};

func void DIA_Nadja_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Nadja_PICKPOCKET);
	Info_AddChoice(DIA_Nadja_PICKPOCKET, DIALOG_BACK, DIA_Nadja_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Nadja_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Nadja_PICKPOCKET_DoIt);
};

func void DIA_Nadja_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Nadja_PICKPOCKET);
};

func void DIA_Nadja_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Nadja_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info STANDARD
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_STANDARD(C_INFO)
{
	npc				= VLK_435_Nadja;
	nr				= 3;
	condition		= DIA_Nadja_STANDARD_Condition;
	information		= DIA_Nadja_STANDARD_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Nadja_STANDARD_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (Bromor_Pay == FALSE))
	{
		return TRUE;
	};
};

var int Nadja_LuciaInfo;
func void DIA_Nadja_STANDARD_Info()
{
	if (Nadja_LuciaInfo == TRUE)
	{
		AI_Output(self, other, "DIA_ADDON_Nadja_STANDARD_16_00"); //只 有 你 先 跟 布 洛 摩 尔 谈 一 下 ， 然 后 我 才 能 跟 你 谈 。
	}
	else
	{
		AI_Output(self, other, "DIA_Nadja_STANDARD_16_00"); //嘿 ， 我 现 在 不 能 照 顾 你 了 ， 宝 贝 。 如 果 你 想 找 些 乐 子 ， 去 跟 布 洛 摩 尔 谈 谈 。
	};

	if ((SC_HearedAboutMissingPeople == TRUE)
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
	&& (Nadja_LuciaInfo == FALSE))
	{
		AI_Output(other, self, "DIA_ADDON_Nadja_STANDARD_15_01"); //我 只 想 问 一 下 你 关 于 那 些 失 踪 的 人 的 几 个 问 题 。
		AI_Output(self, other, "DIA_ADDON_Nadja_STANDARD_16_02"); //我 可 以 告 诉 你 一 两 件 事 情 ， 但 是 这 里 不 行 ， 亲 爱 的 。
		AI_Output(other, self, "DIA_ADDON_Nadja_STANDARD_15_03"); //那 么 我 们 上 楼 吧 。
		AI_Output(self, other, "DIA_ADDON_Nadja_STANDARD_16_04"); //好 的 。 但 是 ， 你 必 须 先 跟 布 洛 摩 尔 商 量 好 。 我 不 想 惹 任 何 麻 烦 。
		Nadja_LuciaInfo = TRUE;
	};

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Danach
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_Danach(C_INFO)
{
	npc				= VLK_435_Nadja;
	nr				= 2;
	condition		= DIA_Nadja_Danach_Condition;
	information		= DIA_Nadja_Danach_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Nadja_Danach_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (Bromor_Pay == FALSE)
	&& (Nadja_Nacht == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Nadja_Danach_Info()
{
	AI_Output(self, other, "DIA_Nadja_Danach_16_00"); //下 次 再 来 找 我 。
	Nadja_Nacht = FALSE;
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info STANDARD
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_hochgehen(C_INFO)
{
	npc				= VLK_435_Nadja;
	nr				= 3;
	condition		= DIA_Nadja_hochgehen_Condition;
	information		= DIA_Nadja_hochgehen_Info;
	permanent		= TRUE;
	description		= "我 们 上 楼 吧 。";
};

func int DIA_Nadja_hochgehen_Condition()
{
	if (Bromor_Pay == 1)
	{
		return TRUE;
	};
};

func void DIA_Nadja_hochgehen_Info()
{
	AI_Output(other, self, "DIA_Nadja_hochgehen_15_00"); //我 们 上 楼 吧 。
	AI_Output(self, other, "DIA_Nadja_hochgehen_16_01"); //今 天 是 你 的 幸 运 日 ， 宝 贝 。 我 们 走 吧 。

	Bromor_Pay = 2;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "DANCE");
};

///////////////////////////////////////////////////////////////////////
//	Info LuciaInfo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nadja_LuciaInfo(C_INFO)
{
	npc				= VLK_435_Nadja;
	nr				= 5;
	condition		= DIA_Addon_Nadja_LuciaInfo_Condition;
	information		= DIA_Addon_Nadja_LuciaInfo_Info;
	description		= "我 们 现 在 可 以 说 了 ？";
};

func int DIA_Addon_Nadja_LuciaInfo_Condition()
{
	if ((Bromor_Pay == 2)
	&& (Npc_GetDistToWP(self, "NW_CITY_HABOUR_PUFF_NADJA") < 200)
	&& (Nadja_LuciaInfo == TRUE))
	{
		return TRUE;
	};
};

var int Nadja_GaveLuciaInfo;
func void DIA_Addon_Nadja_LuciaInfo_Info()
{
	AI_Output(other, self, "DIA_Addon_Nadja_LuciaInfo_15_00"); //那 么 我 们 现 在 可 以 说 了 ？
	AI_Output(self, other, "DIA_Addon_Nadja_LuciaInfo_16_01"); //我 们 在 这 里 谈 话 够 隐 秘 的 了 。
	AI_Output(self, other, "DIA_Addon_Nadja_LuciaInfo_16_02"); //布 洛 摩 尔 不 喜 欢 看 到 我 们 在 工 作 的 时 候 跟 客 人 谈 话 ， 如 果 那 没 有 他 什 么 好 处 的 话 。
	AI_Output(self, other, "DIA_Addon_Nadja_LuciaInfo_16_03"); //那 么 ， 你 想 知 道 更 多 关 于 在 港 口 失 踪 的 人 的 事 情 ， 是 吗 ？
	AI_Output(self, other, "DIA_Addon_Nadja_LuciaInfo_16_04"); //我 不 知 道 我 是 否 可 以 帮 你 很 多 ， 但 是 至 少 我 可 以 告 诉 你 露 西 亚 发 生 了 什 么 事。

	Nadja_GaveLuciaInfo = TRUE;

	Info_ClearChoices(DIA_Addon_Nadja_LuciaInfo);
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo, "她 在 哪 里 消 失 的 ？", DIA_Addon_Nadja_LuciaInfo_wo);
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo, "跟 我 说 说 露 西 亚 。", DIA_Addon_Nadja_LuciaInfo_lucia);
};

func void DIA_Addon_Nadja_LuciaInfo_lucia()
{
	AI_Output(other, self, "DIA_Addon_Nadja_LuciaInfo_lucia_15_00"); //跟 我 说 说 露 西 亚 。
	AI_Output(self, other, "DIA_Addon_Nadja_LuciaInfo_lucia_16_01"); //这 里 没 有 一 个 人 为 她 的 离 开 感 到 难 过 。
	AI_Output(other, self, "DIA_Addon_Nadja_LuciaInfo_lucia_15_02"); //为 什 么 ？
	AI_Output(self, other, "DIA_Addon_Nadja_LuciaInfo_lucia_16_03"); //我 觉 得 这 里 没 有 一 个 人 不 是 她 试 图 利 用 的 对 像 。
	AI_Output(self, other, "DIA_Addon_Nadja_LuciaInfo_lucia_16_04"); //她 是 个 真 正 的 婊 子 ！
};

func void DIA_Addon_Nadja_LuciaInfo_wo()
{
	AI_Output(other, self, "DIA_Addon_Nadja_LuciaInfo_wo_15_00"); //她 在 哪 里 消 失 的 ？
	AI_Output(self, other, "DIA_Addon_Nadja_LuciaInfo_wo_16_01"); //她 以 前 经 常 去 见 艾 尔 弗 里 奇 - 城 里 贫 民 区 的 木 匠 托 尔 本 的 学 徒 。
	AI_Output(self, other, "DIA_Addon_Nadja_LuciaInfo_wo_16_02"); //我 打 赌 她 一 定 是 跟 着 那 个 年 青 人 跑 了 。

	Log_CreateTopic(TOPIC_Addon_Lucia, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Lucia, TOPIC_Addon_Lucia_4);

	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo, "他 们 两 个 可 能 会 去 哪 里 ？", DIA_Addon_Nadja_LuciaInfo_Elvrich);
};

func void DIA_Addon_Nadja_LuciaInfo_Elvrich()
{
	AI_Output(other, self, "DIA_Addon_Nadja_LuciaInfo_Elvrich_15_00"); //他 们 两 个 可 能 会 去 哪 里 ？
	AI_Output(self, other, "DIA_Addon_Nadja_LuciaInfo_Elvrich_16_01"); //如 果 狼 群 没 有 吃 掉 他 们 的 话 ， 我 估 计 他 们 现 在 正 跟 那 些 农 民 呆 在 一 起 。
	AI_Output(self, other, "DIA_Addon_Nadja_LuciaInfo_Elvrich_16_02"); //他 们 还 会 去 别 的 地 方 吗 ？

	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo, "跟 我 说 说 露 西 亚 ?", DIA_Addon_Nadja_LuciaInfo_sonst);
};

func void DIA_Addon_Nadja_LuciaInfo_sonst()
{
	AI_Output(other, self, "DIA_Addon_Nadja_LuciaInfo_sonst_15_00"); //你 还 知 道 什 么 ？
	AI_Output(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_01"); //我 听 说 过 很 多 关 于 在 港 口 失 踪 的 人 的 传 言 。
	AI_Output(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_02"); //不 过 我 不 是 很 肯 定 是 否 该 相 信 这 些 事 情 。
	AI_Output(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_03"); //你 应 该 跟 这 里 的 商 人 聊 聊 。
	AI_Output(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_04"); //这 是 我 能 告 诉 你 的 一 切 了 ， 唉 。
	AI_Output(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_05"); //现 在 ， 关 于 我 们 俩 的 事 怎 么 办 ， 爱 人 ？ 不 管 怎 样 ， 你 已 经 付 了 钱。
	AI_Output(self, other, "DIA_Addon_Nadja_LuciaInfo_sonst_16_06"); //你 不 想 在 离 开 之 前 享 受 一 下 吗 ？

	Info_ClearChoices(DIA_Addon_Nadja_LuciaInfo);

	// Zusatz
	if ((MIS_Andre_REDLIGHT == LOG_RUNNING)
	&& (Knows_Borka_Dealer == FALSE))
	{
		Info_AddChoice(DIA_Addon_Nadja_LuciaInfo, PRINT_Addon_NadjaWait, DIA_Addon_Nadja_WAIT);
	};

	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo, "谢 谢 。 但 是 我 必 须 走 了 。", DIA_Addon_Nadja_LuciaInfo_weiter);
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo, "为 什 么 不 ？ … …", DIA_Nadja_Poppen_Start);
};

func void DIA_Addon_Nadja_LuciaInfo_weiter()
{
	AI_Output(other, self, "DIA_Addon_Nadja_LuciaInfo_weiter_15_00"); //谢 谢 你 ， 但 是 ， 我 现 在 必 须 走 了 。
	AI_Output(self, other, "DIA_Addon_Nadja_LuciaInfo_weiter_16_01"); //太 糟 了 。 好 吧 ， 也 许 下 次 吧 。

	Bromor_Pay = FALSE;
	Nadja_Nacht = (Nadja_Nacht + 1);

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "START");
};

func void DIA_Addon_Nadja_WAIT()
{
	Info_ClearChoices(DIA_Addon_Nadja_LuciaInfo);
};

///////////////////////////////////////////////////////////////////////
//	Info STANDARD
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_Poppen(C_INFO)
{
	npc				= VLK_435_Nadja;
	nr				= 3;
	condition		= DIA_Nadja_Poppen_Condition;
	information		= DIA_Nadja_Poppen_Info;
	permanent		= TRUE;
	description		= "（ 玩 得 开 心 ）";
};

func int DIA_Nadja_Poppen_Condition()
{
	if ((Bromor_Pay == 2)
	&& (Npc_GetDistToWP(self, "NW_CITY_HABOUR_PUFF_NADJA") < 300)
	/* Das ist böse - wenn ich direkt mit Bromor spreche passiert nix mehr. M.F.
	&& (
	((Nadja_LuciaInfo != 0) && (Nadja_GaveLuciaInfo == 0))
	|| (Nadja_GaveLuciaInfo == TRUE)
	)
	*/)
	{
		return TRUE;
	};
};

func void DIA_Nadja_Poppen_Info()
{
	AI_Output(self, other, "DIA_Nadja_Poppen_16_00"); //接 下 来 的 两 个 小 时 属 于 我 们 。
	AI_Output(self, other, "DIA_Nadja_Poppen_16_01"); //这 是 你 放 松 的 时 候 。 往 后 躺 ， 享 受 一 下 。

	Info_ClearChoices(DIA_Nadja_Poppen);
	Info_AddChoice(DIA_Nadja_Poppen, "好 … …", DIA_Nadja_Poppen_Start);
};

func void DIA_Nadja_Poppen_Start()
{
	Bromor_Pay = FALSE;
	Nadja_Nacht = (Nadja_Nacht + 1);

	PlayVideo("LOVESCENE.BIK");

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "START");
	/*
	if (Wld_IsTime(00, 00, 06, 00))
	{
		Wld_SetTime(09, 00);
	}
	else if (Wld_IsTime(06, 00, 12, 00))
	{
		Wld_SetTime(15, 00);
	}
	else if (Wld_IsTime(12, 00, 18, 00))
	{
		Wld_SetTime(21, 00);
	}
	else
	{
		Wld_SetTime(03, 00);
	};

	*/
};

func void DIA_Addon_Nadja_LuciaInfo_Pop()
{
	DIA_Nadja_Poppen_Start();
};

///////////////////////////////////////////////////////////////////////
//	Info BUYHERB
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_BUYHERB(C_INFO)
{
	npc				= VLK_435_Nadja;
	nr				= 2;
	condition		= DIA_Nadja_BUYHERB_Condition;
	information		= DIA_Nadja_BUYHERB_Info;
	permanent		= TRUE;
	description		= "我 在 这 边 哪 里 能 买 到 烟 草 ？";
};

func int DIA_Nadja_BUYHERB_Condition()
{
	if ((MIS_Andre_REDLIGHT == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Nadja_WANT_HERB) == FALSE)
	&& (Nadja_Money == FALSE)
	&& (Undercover_Failed == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Nadja_BUYHERB_Info()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);

	AI_Output(other, self, "DIA_Nadja_BUYHERB_15_00"); //这 周 围 哪 里 能 买 到 烟 草 ？

	if (Npc_GetDistToWP(self, "NW_CITY_HABOUR_PUFF_NADJA") < 500)
	{
		if (Hlp_IsItem(heroArmor, ItAR_MIl_L) == TRUE)
		{
			AI_Output(self, other, "DIA_Nadja_BUYHERB_16_01"); //我 怎 么 知 道 ？ 就 算 我 知 道 ， 我 肯 定 也 不 会 告 诉 城 市 守 卫 。
			Undercover_Failed = TRUE;
		}
		else
		{
			AI_Output(self, other, "DIA_Nadja_BUYHERB_16_02"); //如 果 你 想 要 我 告 诉 你 一 些 事 情 ， 你 最 好 拿 出 几 个 金 币 。
			AI_Output(other, self, "DIA_Nadja_BUYHERB_15_03"); //你 想 要 多 少 ？
			AI_Output(self, other, "DIA_Nadja_BUYHERB_16_04"); //5 0 个 金 币 就 行 了 。
			Nadja_Money = TRUE;
		};
	}
	else
	{
		B_Say(self, other, "$NOTNOW");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info WANT_HERB
///////////////////////////////////////////////////////////////////////
instance DIA_Nadja_WANT_HERB(C_INFO)
{
	npc				= VLK_435_Nadja;
	nr				= 2;
	condition		= DIA_Nadja_WANT_HERB_Condition;
	information		= DIA_Nadja_WANT_HERB_Info;
	description		= "现 在 告 诉 我 哪 里 能 买 到 烟 草 （ 付 ５ ０ 金 币 ）";
};

func int DIA_Nadja_WANT_HERB_Condition()
{
	if ((Npc_HasItems(other, ITmi_Gold) >= 50)
	&& (Nadja_Money == TRUE)
	&& (MIS_Andre_REDLIGHT == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Nadja_WANT_HERB_Info()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	AI_Output(other, self, "DIA_Nadja_WANT_HERB_15_00"); //现 在 告 诉 我 去 哪 里 买 烟 草 。

	if (Hlp_IsItem(heroArmor, ItAR_MIl_L) == TRUE)
	{
		AI_Output(self, other, "DIA_Nadja_WANT_HERB_16_01"); //对 不 起 ， 我 真 的 记 不 起 来 了 。
	}
	else
	{
		B_GiveInvItems(other, self, ItMi_Gold, 50);
		AI_Output(self, other, "DIA_Nadja_WANT_HERB_16_02"); //去 跟 博 卡 谈 谈 ， 宝 贝 。 他 也 许 可 以 给 你 一 些 烟 草 。
		Knows_Borka_Dealer = TRUE;
	};
};
