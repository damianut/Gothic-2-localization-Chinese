// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Sentenza_EXIT(C_INFO)
{
	npc				= Sld_814_Sentenza;
	nr				= 999;
	condition		= DIA_Sentenza_EXIT_Condition;
	information		= DIA_Sentenza_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Sentenza_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sentenza_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  			Hallo (Durchsuchen)
// ************************************************************
var int Sentenza_Wants50;
var int Sentenza_SearchDay;
// -------------------------------
instance DIA_Sentenza_Hello(C_INFO)
{
	npc				= Sld_814_Sentenza;
	nr				= 1;
	condition		= DIA_Sentenza_Hello_Condition;
	information		= DIA_Sentenza_Hello_Info;
	important		= TRUE;
};

func int DIA_Sentenza_Hello_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Sentenza_Hello_Info()
{
	AI_Output(self, other, "DIA_Sentenza_Hello_09_00"); //你 以 为 你 正 在 往 哪 里 去 ？ ！

	self.aivar[AIV_LastFightComment] = TRUE;
	Sentenza_SearchDay = B_GetDayPlus();

	Info_ClearChoices(DIA_Sentenza_Hello);
	Info_AddChoice(DIA_Sentenza_Hello, "那 和 你 有 什 么 关 系 。", DIA_Sentenza_Hello_NotYourBusiness);
	Info_AddChoice(DIA_Sentenza_Hello, "我 想 四 处 看 一 下 ， 就 是 这 样 。", DIA_Sentenza_Hello_JustLooking);
};

func void DIA_Sentenza_Hello_JustLooking()
{
	AI_Output(other, self, "DIA_Sentenza_Hello_JustLooking_15_00"); //我 想 四 处 看 一 下 ， 就 是 这 样 。
	AI_Output(self, other, "DIA_Sentenza_Hello_JustLooking_09_01"); //（ 大 笑 ）像 你 这 样 的 人 在 这 里 会 惹 一 大 堆 的 麻 烦 ！ 你 要 告 诉 我 说 你 只 想 到 处 看 看 吗 ？
	AI_Output(self, other, "DIA_Sentenza_Hello_JustLooking_09_02"); //哈 ！ 你 在 往 法 庭 里 走 ！ 你 怎 么 一 路 走 到 这 里 来 了 ， 嗯 ？
	AI_Output(self, other, "DIA_Sentenza_Hello_JustLooking_09_03"); //那 就 别 对 我 说 那 些 废 话 ， 让 我 搜 搜 你 ， 你 就 可 以 走 你 的 路 了 。

	Info_ClearChoices(DIA_Sentenza_Hello);
	Info_AddChoice(DIA_Sentenza_Hello, "看 好 你 的 手 指 头 就 行 ！", DIA_Sentenza_Hello_HandsOff);
	Info_AddChoice(DIA_Sentenza_Hello, "随 便 你 。 那 么 来 找 我 吧 ！", DIA_Sentenza_Hello_SearchMe);
};

func void DIA_Sentenza_Hello_NotYourBusiness()
{
	AI_Output(other, self, "DIA_Sentenza_Hello_NotYourBusiness_15_00"); //那 和 你 有 什 么 关 系 。
	AI_Output(self, other, "DIA_Sentenza_Hello_NotYourBusiness_09_01"); //（ 叹 息 ） 那 么 ， 我 必 须 对 你 仔 细 地 解 释 一 下 了 。

	AI_StopProcessInfos(self);

	B_Attack(self, other, AR_NONE, 1);
};

func void B_Sentenza_SearchMe()
{
	var int playerGold; playerGold = Npc_HasItems(other, ItMi_Gold);

	AI_Output(other, self, "DIA_Sentenza_Hello_SearchMe_15_00"); //随 便 你 。 那 么 来 找 我 吧 ！
	AI_Output(self, other, "DIA_Sentenza_Hello_SearchMe_09_01"); //现 在 ， 让 我 们 来 看 看 这 里 有 些 什 么 … …

	if (playerGold >= 50)
	{
		AI_Output(self, other, "DIA_Sentenza_Hello_SearchMe_09_02"); //啊 ！ 金 子 ！ 带 着 这 么 多 金 子 到 处 跑 一 定 会 很 危 险 。
		AI_Output(self, other, "DIA_Sentenza_Hello_SearchMe_09_03"); //很 多 雇 佣 兵 都 是 真 正 的 杀 手 。 不 是 什 么 正 直 的 人 ， 就 像 我 。
		B_GiveInvItems(other, self, ItMi_Gold, 50);
		Sentenza_GoldTaken = TRUE;
	}
	else if (playerGold > 0)
	{
		AI_Output(self, other, "DIA_Sentenza_Hello_SearchMe_09_04"); //嗯 ， 你 那 里 并 没 有 很 多 。
		AI_Output(self, other, "DIA_Sentenza_Hello_SearchMe_09_05"); //稍 后 我 会 回 到 你 这 里 来 。
	}
	else
	{
		AI_Output(self, other, "DIA_Sentenza_Hello_SearchMe_09_06"); //你 走 了 这 么 远 而 身 上 没 带 一 点 钱 ？
		AI_Output(self, other, "DIA_Sentenza_Hello_SearchMe_09_07"); //我 看 你 不 像 是 快 要 饿 死 的 样 子 。 你 一 定 把 钱 藏 在 哪 里 了 ， 对 吗 ？
		AI_Output(self, other, "DIA_Sentenza_Hello_SearchMe_09_08"); //不 管 怎 样 ， 你 并 不 傻 。 我 敢 肯 定 我 们 还 会 见 面 。 在 这 期 间 你 得 当 心 点 。
		AI_Output(self, other, "DIA_Sentenza_Hello_SearchMe_09_09"); //也 许 只 有 你 自 己 知 道 你 把 全 部 金 子 放 在 哪 里 ！
	};

	Sentenza_Wants50 = TRUE;

	AI_Output(self, other, "DIA_Sentenza_Hello_SearchMe_09_10"); //我 只 想 问 你 要50个 金 币 - 这 是 过 路 费 。 你 只 需 要 付 一 次 钱 。 这 很 不 错 ， 不 是 吗 ？
};

func void DIA_Sentenza_Hello_SearchMe()
{
	B_Sentenza_SearchMe();
	AI_StopProcessInfos(self);
};

func void DIA_Sentenza_Hello_HandsOff()
{
	AI_Output(other, self, "DIA_Sentenza_Hello_HandsOff_15_00"); //看 好 你 的 手 指 头 就 行 ！
	AI_Output(self, other, "DIA_Sentenza_Hello_HandsOff_09_01"); //（ 威 胁 ） 否 则 怎 么 样 ？

	Info_ClearChoices(DIA_Sentenza_Hello);
	Info_AddChoice(DIA_Sentenza_Hello, "随 便 你 。 那 么 来 找 我 吧 ！", DIA_Sentenza_Hello_SearchMe);
	Info_AddChoice(DIA_Sentenza_Hello, "否 则 你 在 很 长 时 间 里 不 能 搜 索 任 何 人 ！", DIA_Sentenza_Hello_OrElse);
};

func void DIA_Sentenza_Hello_OrElse()
{
	AI_Output(other, self, "DIA_Sentenza_Hello_OrElse_15_00"); //否 则 你 在 很 长 时 间 里 不 能 搜 索 任 何 人 ！
	AI_Output(self, other, "DIA_Sentenza_Hello_OrElse_09_01"); //我 们 可 以 看 看 会 怎 么 样 ！

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

// ************************************************************
// 			  		Zweiter Versuch (Gold)
// ************************************************************
instance DIA_Sentenza_Vzwei(C_INFO)
{
	npc				= Sld_814_Sentenza;
	nr				= 2;
	condition		= DIA_Sentenza_Vzwei_Condition;
	information		= DIA_Sentenza_Vzwei_Info;
	important		= TRUE;
};

func int DIA_Sentenza_Vzwei_Condition()
{
	if ((self.aivar[AIV_DefeatedByPlayer] == FALSE)
	&& (Sentenza_GoldTaken == FALSE)
	&& (Sentenza_SearchDay < Wld_GetDay()))
	{
		return TRUE;
	};
};

func void DIA_Sentenza_Vzwei_Info()
{
	AI_Output(self, other, "DIA_Sentenza_Vzwei_09_00"); //你 又 来 了 。 我 们 来 看 看 这 次 你 有 些 什 么 ！

	self.aivar[AIV_LastFightComment] = TRUE;
	Sentenza_SearchDay = B_GetDayPlus();

	Info_ClearChoices(DIA_Sentenza_Vzwei);
	Info_AddChoice(DIA_Sentenza_Vzwei, "把 你 肮 脏 的 爪 子 从 我 身 上 拿 开 ！", DIA_Sentenza_Vzwei_HandsOff);

	Info_AddChoice(DIA_Sentenza_Vzwei, "随 便 你 。 那 么 来 找 我 吧 ！", DIA_Sentenza_Vzwei_SearchMe);
};

func void DIA_Sentenza_Vzwei_SearchMe()
{
	B_Sentenza_SearchMe();

	AI_StopProcessInfos(self);
};

func void DIA_Sentenza_Vzwei_HandsOff()
{
	AI_Output(other, self, "DIA_Sentenza_Vzwei_HandsOff_15_00"); //把 你 肮 脏 的 爪 子 从 我 身 上 拿 开 ！
	AI_Output(self, other, "DIA_Sentenza_Vzwei_HandsOff_09_01"); //（ 恐 吓 ） 是 这 样 吗 ？ 这 一 次 你 的 东 西 显 然 更 多 ！

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

// ************************************************************
// 			  			WannaJoin
// ************************************************************
instance DIA_Sentenza_WannaJoin(C_INFO)
{
	npc				= Sld_814_Sentenza;
	nr				= 3;
	condition		= DIA_Sentenza_WannaJoin_Condition;
	information		= DIA_Sentenza_WannaJoin_Info;
	description		= "我 来 加 入 你 们 ！";
};

func int DIA_Sentenza_WannaJoin_Condition()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Sentenza_WannaJoin_Info()
{
	AI_Output(other, self, "DIA_Sentenza_WannaJoin_15_00"); //我 来 加 入 你 们 ！
	AI_Output(self, other, "DIA_Sentenza_WannaJoin_09_01"); //对 你 来 说 很 好 。
	AI_Output(self, other, "DIA_Sentenza_WannaJoin_09_02"); //（ 不 经 意 的 ） 你 知 不 知 道 那 些 雇 佣 兵 要 看 你 是 否 加 入 他 们 才 会 投 票 ？
};

// ************************************************************
// 			  				Vote
// ************************************************************
instance DIA_Sentenza_Vote(C_INFO)
{
	npc				= Sld_814_Sentenza;
	nr				= 4;
	condition		= DIA_Sentenza_Vote_Condition;
	information		= DIA_Sentenza_Vote_Info;
	permanent		= TRUE;
	description		= "你 愿 意 投 我 一 票 吗 ？";
};

func int DIA_Sentenza_Vote_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Sentenza_WannaJoin))
	&& (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Sentenza_Vote_Info()
{
	AI_Output(other, self, "DIA_Sentenza_Vote_15_00"); //你 愿 意 投 我 一 票 吗 ？

	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self, other, "DIA_Sentenza_Vote_09_01"); //就 因 为 你 打 我 ？ （ 大 笑 ） 不 。
	}
	else if ((Npc_HasItems(self, itmi_gold) >= 50)
	&& ((Sentenza_GoldTaken == TRUE) || (Sentenza_GoldGiven == TRUE)))
	{
		AI_Output(self, other, "DIA_Sentenza_Vote_09_02"); //但 是 话 又 说 回 来 ， 为 什 么 不 呢 ？50个 金 币 换 一 张 选 票 是 个 不 错 的 价 格 ， 你 不 这 么 想 吗 ？

		Sentenza_Stimme = TRUE;
		B_LogEntry(TOPIC_SLDRespekt, TOPIC_SLDRespekt_10);
	}
	else if ((Sentenza_Stimme == TRUE)
	&& (Npc_HasItems(self, itmi_gold) < 50))
	{
		AI_Output(self, other, "DIA_Sentenza_Vote_09_03"); //在 你 又 一 次 拿 走 我 的 金 子 之 后 ？ 我 不 这 么 想 ， 我 的 孩 子 。
	}
	else
	{
		AI_Output(self, other, "DIA_Sentenza_Vote_09_04"); //那 样 没 有 用 ， 小 子 ！ 如 果 要 我 给 你 投 票 ， 你 就 必 须 给 我 送 金 子 来 。
		AI_Output(other, self, "DIA_Sentenza_Vote_15_05"); //多 少 ？
		AI_Output(self, other, "DIA_Sentenza_Vote_09_06"); //5 0 个 金 币 。 总 之 ， 这 是 你 必 须 交 的 过 路 费 。
		Sentenza_Wants50 = TRUE;
	};
};

// ************************************************************
// 			  				Pay50
// ************************************************************
var int Sentenza_GoldGiven;
// ------------------------
instance DIA_Sentenza_Pay50(C_INFO)
{
	npc				= Sld_814_Sentenza;
	nr				= 5;
	condition		= DIA_Sentenza_Pay50_Condition;
	information		= DIA_Sentenza_Pay50_Info;
	permanent		= TRUE;
	description		= "给 你 的 ５ ０ 枚 金 币 。";
};

func int DIA_Sentenza_Pay50_Condition()
{
	if ((Sentenza_Wants50 == TRUE)
	&& (Npc_HasItems(self, itmi_gold) < 50)
	&& (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Sentenza_Pay50_Info()
{
	AI_Output(other, self, "DIA_Sentenza_Pay50_15_00"); //给 你 的 ５ ０ 枚 金 币 。
	if (B_GiveInvItems(other, self, ItMi_Gold, 50))
	{
		AI_Output(self, other, "DIA_Sentenza_Pay50_09_01"); //好 吧 ， 谢 谢 ， 这 就 行 了 。
		Sentenza_GoldGiven = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Sentenza_Pay50_09_02"); //别 胡 搅 蛮 缠 了 。 5 0 就 5 0 ， 一 个 子 儿 都 不 能 少 ， 明 白 吗 ？
	};
};

// ************************************************************
// 			  				Gold zurückholen
// ************************************************************
var int Sentenza_Einmal;
// ---------------------
instance DIA_Sentenza_GoldBack(C_INFO)
{
	npc				= Sld_814_Sentenza;
	nr				= 6;
	condition		= DIA_Sentenza_GoldBack_Condition;
	information		= DIA_Sentenza_GoldBack_Info;
	permanent		= TRUE;
	description		= "把 我 的 金 币 还 给 我 ！";
};

func int DIA_Sentenza_GoldBack_Condition()
{
	if (Npc_HasItems(self, itmi_gold) >= 50)
	{
		if ((Sentenza_GoldGiven == FALSE)
		|| (other.guild == GIL_SLD))
		{
			return TRUE;
		};
	};
};

func void DIA_Sentenza_GoldBack_Info()
{
	AI_Output(other, self, "DIA_Sentenza_GoldBack_15_00"); //把 我 的 金 币 还 给 我 ！
	if ((other.guild == GIL_SLD)
	&& (Torlof_SentenzaCounted == TRUE)
	&& (Sentenza_Einmal == FALSE))
	{
		AI_Output(self, other, "DIA_Sentenza_GoldBack_09_01"); //现 在 ， 我 已 经 给 你 投 票 了 ？
		AI_Output(self, other, "DIA_Sentenza_GoldBack_09_02"); //你 这 个 臭 叫 花 子 ！

		Sentenza_Einmal = TRUE;
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_NONE, 1);
	}
	else
	{
		AI_Output(self, other, "DIA_Sentenza_GoldBack_09_03"); //放 松 点 ！ 我 只 会 照 看 它 一 会 儿 … …
	};
};

// ************************************************************
// 			  				AufsMaul
// ************************************************************
instance DIA_Sentenza_AufsMaul(C_INFO)
{
	npc				= Sld_814_Sentenza;
	nr				= 7;
	condition		= DIA_Sentenza_AufsMaul_Condition;
	information		= DIA_Sentenza_AufsMaul_Info;
	description		= "嘿 ， 你 脑 袋 前 面 那 是 你 的 脸 ， 还 是 屁 股 ？";
};

func int DIA_Sentenza_AufsMaul_Condition()
{
	if ((Npc_HasItems(self, itmi_gold) >= 50)
	|| (Npc_KnowsInfo(other, DIA_Jarvis_MissionKO)))
	{
		return TRUE;
	};
};

func void DIA_Sentenza_AufsMaul_Info()
{
	AI_Output(other, self, "DIA_Sentenza_AufsMaul_15_00"); //嘿 ， 你 脑 袋 前 面 那 是 你 的 脸 ， 还 是 屁 股 ？
	AI_Output(self, other, "DIA_Sentenza_AufsMaul_09_01"); //（ 愤 怒 地 笑 ） 好 吧 ， 这 是 你 自 找 的 … …

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

// ************************************************************
// 			  				AufsMaulAgain
// ************************************************************
instance DIA_Sentenza_AufsMaulAgain(C_INFO)
{
	npc				= Sld_814_Sentenza;
	nr				= 8;
	condition		= DIA_Sentenza_AufsMaulAgain_Condition;
	information		= DIA_Sentenza_AufsMaulAgain_Info;
	permanent		= TRUE;
	description		= "又 到 揍 人 的 时 间 了 ！";
};

func int DIA_Sentenza_AufsMaulAgain_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Sentenza_AufsMaul))
	{
		if ((Npc_HasItems(self, itmi_gold) >= 50)
		|| (Npc_KnowsInfo(other, DIA_Jarvis_MissionKO)))
		{
			return TRUE;
		};
	};
};

func void DIA_Sentenza_AufsMaulAgain_Info()
{
	AI_Output(other, self, "DIA_Sentenza_AufsMaulAgain_15_00"); //又 到 揍 人 的 时 间 了 ！
	AI_Output(self, other, "DIA_Sentenza_AufsMaulAgain_09_01"); //如 果 你 这 么 说 … …
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

// ************************************************************
// 			  				PERM
// ************************************************************
instance DIA_Sentenza_PERM(C_INFO)
{
	npc				= Sld_814_Sentenza;
	nr				= 1;
	condition		= DIA_Sentenza_PERM_Condition;
	information		= DIA_Sentenza_PERM_Info;
	permanent		= TRUE;
	description		= "那 么 最 近 怎 么 样 ？";
};

func int DIA_Sentenza_PERM_Condition()
{
	return TRUE;
};

func void DIA_Sentenza_PERM_Info()
{
	AI_Output(other, self, "DIA_Sentenza_PERM_15_00"); //那 么 最 近 怎 么 样 ？

	AI_Output(self, other, "DIA_Sentenza_PERM_09_01"); //没 有 多 少 人 会 这 样 ， 不 过 ， 直 到 现 在 ， 每 一 个 人 都 付 了 过 路 费 给 我 。
	if (Npc_HasItems(self, itmi_gold) < 50)
	{
		AI_Output(self, other, "DIA_Sentenza_PERM_09_02"); //除 了 你 。 （ 咧 着 嘴 笑 ）
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Sentenza_PICKPOCKET(C_INFO)
{
	npc				= Sld_814_Sentenza;
	nr				= 900;
	condition		= DIA_Sentenza_PICKPOCKET_Condition;
	information		= DIA_Sentenza_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Sentenza_PICKPOCKET_Condition()
{
	C_Beklauen(56, 65);
};

func void DIA_Sentenza_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sentenza_PICKPOCKET);
	Info_AddChoice(DIA_Sentenza_PICKPOCKET, DIALOG_BACK, DIA_Sentenza_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sentenza_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Sentenza_PICKPOCKET_DoIt);
};

func void DIA_Sentenza_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sentenza_PICKPOCKET);
};

func void DIA_Sentenza_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sentenza_PICKPOCKET);
};
