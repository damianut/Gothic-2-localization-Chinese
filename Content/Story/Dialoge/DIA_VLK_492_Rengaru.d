///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Rengaru_EXIT(C_INFO)
{
	npc				= VLK_492_Rengaru;
	nr				= 999;
	condition		= DIA_Rengaru_EXIT_Condition;
	information		= DIA_Rengaru_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Rengaru_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rengaru_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Rengaru_PICKPOCKET(C_INFO)
{
	npc				= VLK_492_Rengaru;
	nr				= 900;
	condition		= DIA_Rengaru_PICKPOCKET_Condition;
	information		= DIA_Rengaru_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Rengaru_PICKPOCKET_Condition()
{
	C_Beklauen(20, 5);
};

func void DIA_Rengaru_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rengaru_PICKPOCKET);
	Info_AddChoice(DIA_Rengaru_PICKPOCKET, DIALOG_BACK, DIA_Rengaru_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rengaru_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Rengaru_PICKPOCKET_DoIt);
};

func void DIA_Rengaru_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Rengaru_PICKPOCKET);
};

func void DIA_Rengaru_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rengaru_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info Hauab
///////////////////////////////////////////////////////////////////////
instance DIA_Rengaru_Hauab(C_INFO)
{
	npc				= VLK_492_Rengaru;
	nr				= 2;
	condition		= DIA_Rengaru_Hauab_Condition;
	information		= DIA_Rengaru_Hauab_Info;
	permanent		= TRUE;
	description		= "你 在 这 里 做 什 么 ？";
};

func int DIA_Rengaru_Hauab_Condition()
{
	if ((Jora_Dieb != LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Rengaru_GOTYOU) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_Hauab_Info()
{
	AI_Output(other, self, "DIA_Rengaru_Hauab_15_00"); //你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Rengaru_Hauab_07_01"); //我 不 知 道 那 怎 么 会 跟 你 有 什 么 关 系 。 滚 蛋 吧 ！
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HalloDieb
///////////////////////////////////////////////////////////////////////
instance DIA_Rengaru_HALLODIEB(C_INFO)
{
	npc				= VLK_492_Rengaru;
	nr				= 2;
	condition		= DIA_Rengaru_HALLODIEB_Condition;
	information		= DIA_Rengaru_HALLODIEB_Info;
	description		= "佐 拉 说 你 拿 了 他 的 钱 … …";
};

func int DIA_Rengaru_HALLODIEB_Condition()
{
	if (Jora_Dieb == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Rengaru_HALLODIEB_Info()
{
	AI_Output(other, self, "DIA_Rengaru_HALLODIEB_15_00"); //佐 拉 说 你 拿 了 他 的 钱 … …
	AI_Output(self, other, "DIA_Rengaru_HALLODIEB_07_01"); //该 死 ！ 我 离 开 这 里 了 ！

	AI_StopProcessInfos(self);

	Npc_ExchangeRoutine(self, "RunAway");
};

///////////////////////////////////////////////////////////////////////
//	Info GotYou
///////////////////////////////////////////////////////////////////////
instance DIA_Rengaru_GOTYOU(C_INFO)
{
	npc				= VLK_492_Rengaru;
	nr				= 3;
	condition		= DIA_Rengaru_GOTYOU_Condition;
	information		= DIA_Rengaru_GOTYOU_Info;
	description		= "抓 到 你 了 ！";
};

func int DIA_Rengaru_GOTYOU_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rengaru_HALLODIEB))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_GOTYOU_Info()
{
	B_GivePlayerXP(XP_RengaruGotThief);

	AI_Output(other, self, "DIA_Rengaru_GOTYOU_15_00"); //抓 到 你 了 ！
	AI_Output(self, other, "DIA_Rengaru_GOTYOU_07_01"); //你 想 从 我 这 里 得 到 什 么 ？
	AI_Output(other, self, "DIA_Rengaru_GOTYOU_15_02"); //你 在 光 天 化 日 之 下 偷 佐 拉 的 东 西 ， 他 甚 至 都 看 到 你 在 偷 了 。
	AI_Output(other, self, "DIA_Rengaru_GOTYOU_15_03"); //所 以 我 来 告 诉 你 ， 你 是 一 个 恶 心 的 贼 ， 还 有 … …

	Info_ClearChoices(DIA_Rengaru_GOTYOU);
	Info_AddChoice(DIA_Rengaru_GOTYOU, "… … 我 应 该 得 到 一 份 战 利 品 。", DIA_Rengaru_GOTYOU_Anteil);
	Info_AddChoice(DIA_Rengaru_GOTYOU, "… … 你 最 好 马 上 把 佐 拉 的 钱 交 出 来 。", DIA_Rengaru_GOTYOU_YouThief);
	Info_AddChoice(DIA_Rengaru_GOTYOU, "… … 现 在 告 诉 我 你 是 谁 。 ", DIA_Rengaru_GOTYOU_WhoAreYou);
};

func void DIA_Rengaru_GOTYOU_YouThief()
{
	AI_Output(other, self, "DIA_Rengaru_GOTYOU_YouThief_15_00"); //… … 你 最 好 马 上 把 佐 拉 的 钱 交 出 来 。

	if (Npc_HasItems(self, Itmi_Gold) >= 1)
	{
		AI_Output(self, other, "DIA_Rengaru_GOTYOU_YouThief_07_01"); //这 是 钱 ， 老 兄 ！ 但 是 让 我 走 吧 ， 我 再 也 不 敢 那 么 干 了 。
		B_GiveInvItems(self, other, ItMi_Gold, Npc_HasItems(self, ItMi_Gold));
	}
	else
	{
		AI_Output(self, other, "DIA_Rengaru_GOTYOU_YouThief_07_02"); //我 现 在 还 没 弄 到 钱 。

		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self, other, "DIA_Rengaru_GOTYOU_YouThief_07_03"); //但 是 ， 我 为 什 么 要 告 诉 你 ？ 你 已 经 抢 劫 了 我 ！
		};
	};

	Info_ClearChoices(DIA_Rengaru_GOTYOU);
};

func void DIA_Rengaru_GOTYOU_Anteil()
{
	AI_Output(other, self, "DIA_Rengaru_GOTYOU_Anteil_15_00"); //… … 我 应 该 得 到 一 份 战 利 品 。

	if ((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	&& (Npc_HasItems(self, ItMi_Gold) < 1))
	{
		AI_Output(self, other, "DIA_Rengaru_GOTYOU_Anteil_07_01"); //你 在 把 我 打 到 以 后 ， 已 经 拿 走 了 我 所 有 的 东 西 ！ 所 以 让 我 走 吧 ！
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
	}
	else
	{ // HACK MF. self/other - falsch gesprochen, kein Ersatz...
		AI_Output(self, other, "DIA_Rengaru_GOTYOU_Anteil_15_02"); //好 的 ， 看 来 我 别 无 选 择 。 我 和 你 分 一 半 。

		Info_ClearChoices(DIA_Rengaru_GOTYOU);
		Info_AddChoice(DIA_Rengaru_GOTYOU, "不 - 你 把 所 有 东 西 都 给 我 ！", DIA_Rengaru_GOTYOU_Anteil_alles);
		Info_AddChoice(DIA_Rengaru_GOTYOU, "好 吧 ， 那 给 我 一 半 。", DIA_Rengaru_GOTYOU_Anteil_GehtKlar);
	};
};

func void DIA_Rengaru_GOTYOU_Anteil_alles()
{
	AI_Output(other, self, "DIA_Rengaru_GOTYOU_Anteil_alles_15_00"); //不 - 你 把 所 有 东 西 都 给 我 ！

	if (Npc_HasItems(self, Itmi_Gold) >= 2)
	{
		AI_Output(self, other, "DIA_Rengaru_GOTYOU_Anteil_alles_07_02"); //你 正 在 抢 劫 我 。那 把 钱 拿 走 。 现 在 不 要 再 打 扰 我 。
		B_GiveInvItems(self, other, ItMi_Gold, Npc_HasItems(self, ItMi_Gold));
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
	}
	else
	{
		AI_Output(self, other, "DIA_Rengaru_GOTYOU_Anteil_alles_07_03"); //我 很 想 把 钱 给 你 ， 但 是 ， 我 现 在 没 钱 。
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
	};
};

func void DIA_Rengaru_GOTYOU_Anteil_GehtKlar()
{
	AI_Output(other, self, "DIA_Rengaru_GOTYOU_Anteil_GehtKlar_15_00"); //好 吧 ， 那 给 我 一 半 。

	if (B_GiveInvItems(self, other, ItMi_Gold,(Npc_HasItems(self, ItMi_Gold)) / 2))
	{
		AI_Output(self, other, "DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_01"); //这 是 你 的 一 半 ！ 现 在 让 我 走 ！
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
	}
	else
	{
		AI_Output(self, other, "DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_02"); //我 不 介 意 让 你 分 一 半 金 币 ， 但 是 现 在 我 还 没 弄 到 它 。
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
	};
};

func void DIA_Rengaru_GOTYOU_WhoAreYou()
{
	AI_Output(other, self, "DIA_Rengaru_GOTYOU_WhoAreYou_15_00"); //… … 现 在 告 诉 我 你 是 谁 。
	AI_Output(self, other, "DIA_Rengaru_GOTYOU_WhoAreYou_07_01"); //我 只 是 一 个 可 怜 的 家 伙 ， 正 在 想 办 法 把 收 支 弄 平 衡 。
	AI_Output(self, other, "DIA_Rengaru_GOTYOU_WhoAreYou_07_02"); //我 还 能 做 什 么 ？ 我 在 镇 上 找 不 到 工 作 … …
	AI_Output(other, self, "DIA_Rengaru_GOTYOU_WhoAreYou_15_03"); //… … 好 的 ， 我 知 道 。 不 要 再 发 牢 骚 了 ！
};

///////////////////////////////////////////////////////////////////////
//	Info InKnast
///////////////////////////////////////////////////////////////////////
instance DIA_Rengaru_INKNAST(C_INFO)
{
	npc				= VLK_492_Rengaru;
	nr				= 4;
	condition		= DIA_Rengaru_INKNAST_Condition;
	information		= DIA_Rengaru_INKNAST_Info;
	description		= "我 要 向 民 兵 检 举 你 。";
};

func int DIA_Rengaru_INKNAST_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rengaru_GOTYOU))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_INKNAST_Info()
{
	AI_Output(other, self, "DIA_Rengaru_INKNAST_15_00"); //我 要 向 民 兵 检 举 你 。
	AI_Output(self, other, "DIA_Rengaru_INKNAST_07_01"); //你 还 想 要 什 么 ？ 我 什 么 都 没 有 剩 下 ！ 让 我 走 ， 老 兄 ！

	Info_AddChoice(DIA_Rengaru_INKNAST, "我 为 什 么 要 那 么 做 ？", DIA_Rengaru_INKNAST_keinKnast);
	Info_AddChoice(DIA_Rengaru_INKNAST, "我 要 看 着 你 被 关 起 来 。", DIA_Rengaru_INKNAST_Knast);
	Info_AddChoice(DIA_Rengaru_INKNAST, "滚 ！ 不 要 再 出 现 在 这 里 ！", DIA_Rengaru_INKNAST_HauAb);
};

func void DIA_Rengaru_INKNAST_HauAb()
{
	AI_Output(other, self, "DIA_Rengaru_INKNAST_HauAb_15_00"); //滚 ！ 不 要 再 出 现 在 这 里 ！
	AI_Output(self, other, "DIA_Rengaru_INKNAST_HauAb_07_01"); //你 不 会 感 到 后 悔 的 ！ 谢 谢 你 ， 老 兄 ！

	Npc_ExchangeRoutine(self, "Start");
	AI_StopProcessInfos(self);

	Diebesgilde_Okay = (Diebesgilde_Okay + 1);
};

func void DIA_Rengaru_INKNAST_Knast()
{
	AI_Output(other, self, "DIA_Rengaru_INKNAST_Knast_15_00"); //我 要 看 着 你 被 关 起 来 。
	AI_Output(self, other, "DIA_Rengaru_INKNAST_Knast_07_01"); //（ 疲 乏 的 ） 我 不 想 要 任 何 麻 烦 。 如 果 你 认 为 你 必 须 要 那 么 做 的 话 ， 想 怎 么 着 就 怎 么 着 吧 。
	AI_Output(self, other, "DIA_Rengaru_INKNAST_Knast_07_02"); //（ 警 告 ） 小 心 ， 可 是 - 我 的 朋 友 不 喜 欢 你 在 这 里 的 行 为 … …

	Rengaru_InKnast = TRUE;

	AI_StopProcessInfos(self);
};

func void DIA_Rengaru_INKNAST_keinKnast()
{
	AI_Output(other, self, "DIA_Rengaru_INKNAST_keinKnast_15_00"); //我 为 什 么 要 那 么 做 ？
	AI_Output(self, other, "DIA_Rengaru_INKNAST_keinKnast_07_01"); //在 城 市 里 ， 很 容 易 知 道 谁 是 正 直 的 人 - 站 在 好 的 那 一 边 。
	AI_Output(self, other, "DIA_Rengaru_INKNAST_keinKnast_07_02"); //我 可 以 帮 你 说 好 话 。 但 是 我 不 能 、 也 不 会 说 太 多 。 剩 下 的 就 要 靠 你 了 。
};

///////////////////////////////////////////////////////////////////////
//	Info LastInfoKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Rengaru_LastInfoKap1(C_INFO)
{
	npc				= VLK_492_Rengaru;
	nr				= 6;
	condition		= DIA_Rengaru_LastInfoKap1_Condition;
	information		= DIA_Rengaru_LastInfoKap1_Info;
	permanent		= TRUE;
	description		= "真 的 ？ 工 作 顺 利 吗 ？";
};

func int DIA_Rengaru_LastInfoKap1_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rengaru_INKNAST))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_LastInfoKap1_Info()
{
	AI_Output(other, self, "DIA_Rengaru_LastInfoKap1_15_00"); //真 的 ？ 工 作 顺 利 吗 ？

	if (Rengaru_InKnast == TRUE)
	{
		AI_Output(self, other, "DIA_Rengaru_LastInfoKap1_07_01"); //说 吧 ， 嘲 弄 我 。 最 后 你 会 得 到 你 应 得 的 结 果 ， 我 发 誓 ！
	}
	else
	{
		AI_Output(self, other, "DIA_Rengaru_LastInfoKap1_07_02"); //你 还 想 要 什 么 ？ 我 没 偷 任 何 别 的 东 西 ， 真 的 ， 老 兄 ！
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
///////////////////////////////////////////////////////////////////////
instance DIA_Rengaru_Zeichen(C_INFO)
{
	npc				= VLK_492_Rengaru;
	nr				= 2;
	condition		= DIA_Rengaru_Zeichen_Condition;
	information		= DIA_Rengaru_Zeichen_Info;
	description		= "（ 发 出 盗 贼 信 号 ）";
};

func int DIA_Rengaru_Zeichen_Condition()
{
	if ((Knows_SecretSign == TRUE)
	&& (Rengaru_InKnast == FALSE)
	&& Npc_KnowsInfo(other, DIA_Rengaru_GOTYOU))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_Zeichen_Info()
{
	AI_PlayAni(other, "T_YES");

	AI_Output(self, other, "DIA_Rengaru_Zeichen_07_00"); //嘿 ， 你 是 我 们 的 人 。
	AI_Output(self, other, "DIA_Rengaru_Zeichen_07_01"); //让 我 告 诉 你 一 些 事 情 吧 。 如 果 你 打 算 把 镇 上 的 钱 包 都 掏 空 的 话 ， 要 特 别 小 心 那 些 商 人 ！
	AI_Output(self, other, "DIA_Rengaru_Zeichen_07_02"); //他 们 非 常 精 于 看 管 他 们 的 物 品 。 但 是 ， 我 能 给 你 一 点 提 示 。
	AI_Output(self, other, "DIA_Rengaru_Zeichen_07_03"); //试 着 一 只 手 抓 住 想 要 的 东 西 ， 然 后 挥 动 另 一 只 手 。 那 会 分 散 他 们 的 注 意 。

	B_RaiseAttribute(other, ATR_DEXTERITY, 1);
	Snd_Play("LEVELUP");
};
