///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Moe_EXIT(C_INFO)
{
	npc				= VLK_432_Moe;
	nr				= 999;
	condition		= DIA_Moe_EXIT_Condition;
	information		= DIA_Moe_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Moe_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Moe_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Moe_PICKPOCKET(C_INFO)
{
	npc				= VLK_432_Moe;
	nr				= 900;
	condition		= DIA_Moe_PICKPOCKET_Condition;
	information		= DIA_Moe_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Moe_PICKPOCKET_Condition()
{
	C_Beklauen(25, 30);
};

func void DIA_Moe_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Moe_PICKPOCKET);
	Info_AddChoice(DIA_Moe_PICKPOCKET, DIALOG_BACK, DIA_Moe_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Moe_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Moe_PICKPOCKET_DoIt);
};

func void DIA_Moe_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Moe_PICKPOCKET);
};

func void DIA_Moe_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Moe_PICKPOCKET);
};

// ************************************************************
// 				 Hallo
// ************************************************************
instance DIA_Moe_Hallo(C_INFO)
{
	npc				= VLK_432_Moe;
	nr				= 2;
	condition		= DIA_Moe_Hallo_Condition;
	information		= DIA_Moe_Hallo_Info;
	important		= TRUE;
};

func int DIA_Moe_Hallo_Condition()
{
	if ((Npc_GetDistToNpc(self, other) <= ZivilAnquatschDist)
	&& (hero.guild != GIL_PAL)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_NOV)
	&& (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Moe_Hallo_Info()
{
	AI_Output(self, other, "DIA_Moe_Hallo_01_00"); //嘿 ， 我 不 认 识 你 。 你 在 这 里 做 什 么 ？ 你 要 进 酒 馆 吗 ？

	Info_ClearChoices(DIA_Moe_Hallo);
	Info_AddChoice(DIA_Moe_Hallo, "不 ， 我 不 去 酒 馆 … … （ 结 束 ）", DIA_Moe_Hallo_Gehen);
	Info_AddChoice(DIA_Moe_Hallo, "哦 ， 那 么 这 就 是 那 个 水 坑 … … ", DIA_Moe_Hallo_Witz);
	Info_AddChoice(DIA_Moe_Hallo, "是 的 ， 你 介 意 吗 ？", DIA_Moe_Hallo_Reizen);
};

func void DIA_Moe_Hallo_Gehen()
{
	AI_Output(other, self, "DIA_Moe_Hallo_Gehen_15_00"); //不 ， 我 不 去 酒 馆 … …
	AI_Output(self, other, "DIA_Moe_Hallo_Gehen_01_01"); //是 的 ， 要 是 我 也 会 那 样 说 。 不 过 那 并 不 重 要 - 而 那 是 我 们 能 直 接 来 谈 生 意 的 原 因 。
	AI_Output(self, other, "DIA_Moe_Hallo_Gehen_01_02"); //因 为 你 是 刚 来 这 里 的 ， 我 将 给 你 开 个 价 。 你 给 我 5 0 个 金 币 ， 然 后 就 能 走 了 。
	AI_Output(self, other, "DIA_Moe_Hallo_Gehen_01_03"); //那 是 你 进 酒 馆 的 入 门 费 。

	Info_ClearChoices(DIA_Moe_Hallo);
	Info_AddChoice(DIA_Moe_Hallo, "让 我 们 查 清 楚 民 兵 是 怎 么 想 的 … …", DIA_Moe_Hallo_Miliz);
	Info_AddChoice(DIA_Moe_Hallo, "算 了 吧 ， 你 一 分 钱 也 拿 不 到 ！", DIA_Moe_Hallo_Vergisses);
	Info_AddChoice(DIA_Moe_Hallo, "好 吧 。 我 愿 意 付 钱 。", DIA_Moe_Hallo_Zahlen);
	Info_AddChoice(DIA_Moe_Hallo, "但 是 我 不 想 去 酒 馆 ！", DIA_Moe_Hallo_Kneipe);
};

func void DIA_Moe_Hallo_Kneipe()
{
	AI_Output(other, self, "DIA_Moe_Hallo_Kneipe_15_00"); //但 是 我 不 想 去 那 家 酒 馆 ！
	AI_Output(self, other, "DIA_Moe_Hallo_Kneipe_01_01"); //你 知 道 ， 或 早 或 晚 ， 每 一 个 人 都 想 进 这 个 酒 馆 。 所 以 ， 你 现 在 可 以 付 钱 了 - 然 后 这 件 事 就 了 结 了 。
};

func void DIA_Moe_Hallo_Witz()
{
	AI_Output(other, self, "DIA_Moe_Hallo_Witz_15_00"); //哦 ， 那 么 ， 这 里 是 码 头 的 小 酒 馆 ？我 还 以 为 这 是 总 督 的 官 邸 。
	AI_Output(self, other, "DIA_Moe_Hallo_Witz_01_01"); //嘿 - 别 开 那 种 无 聊 的 玩 笑 了 ， 矮 子 ， 否 则 你 就 要 吃 拳头 了 。

	Info_ClearChoices(DIA_Moe_Hallo);
	Info_AddChoice(DIA_Moe_Hallo, "明 白 了 ， 我 被 迫 要 狠 狠 地 抽 你 … …", DIA_Moe_Hallo_Pruegel);
	Info_AddChoice(DIA_Moe_Hallo, "你 想 给 我 惹 麻 烦 ？", DIA_Moe_Hallo_Aerger);
	Info_AddChoice(DIA_Moe_Hallo, "冷 静 ， 我 想 要 的 就 是 喝 一 杯 啤 酒 。", DIA_Moe_Hallo_Ruhig);
	Info_AddChoice(DIA_Moe_Hallo, "但 是 我 不 想 去 酒 馆 ！", DIA_Moe_Hallo_Kneipe);
};

func void DIA_Moe_Hallo_Reizen()
{
	AI_Output(other, self, "DIA_Moe_Hallo_Reizen_15_00"); //是 的 ， 你 介 意 吗 ？
	AI_Output(self, other, "DIA_Moe_Hallo_Reizen_01_01"); //这 里 没 有 你 的 事 ， 矮 子 。

	Info_ClearChoices(DIA_Moe_Hallo);
	Info_AddChoice(DIA_Moe_Hallo, "明 白 了 ， 我 被 迫 要 狠 狠 地 抽 你 … …", DIA_Moe_Hallo_Pruegel);
	Info_AddChoice(DIA_Moe_Hallo, "你 想 给 我 惹 麻 烦 ？", DIA_Moe_Hallo_Aerger);
	Info_AddChoice(DIA_Moe_Hallo, "冷 静 ， 我 想 要 的 就 是 喝 一 杯 啤 酒 。", DIA_Moe_Hallo_Ruhig);
};

func void DIA_Moe_Hallo_Miliz()
{
	AI_Output(other, self, "DIA_Moe_Hallo_Miliz_15_00"); //让 我 们 查 清 楚 民 兵 是 怎 么 想 的 … …
	AI_Output(self, other, "DIA_Moe_Hallo_Miliz_01_01"); //（ 大 笑 ） 这 里 没 有 民 兵 。 但 你 知 道 为 什 么 他 们 不 来 这 里 吗 ？
	AI_Output(self, other, "DIA_Moe_Hallo_Miliz_01_02"); //这 里 是 港 口 区 ， 矮 子 。 没 有 一 个 民 兵 敢 在 这 里 跟 我 打 架 。
	AI_Output(self, other, "DIA_Moe_Hallo_Miliz_01_03"); //最 多 ， 他 们 会 去 ‘ 红 灯 笼 ’ 。 你 看 ， 只 有 你 和 我 。 （ 卑 鄙 地 咧 着 嘴 笑 ）
};

func void DIA_Moe_Hallo_Pruegel()
{
	AI_Output(other, self, "DIA_Moe_Hallo_Pruegel_15_00"); //我 明 白 ， 我 被 迫 要 打 你 一 顿 才 能 更 进 一 步 。
	AI_Output(self, other, "DIA_Moe_Hallo_Pruegel_01_01"); //欢 迎 你 来 试 一 试 ， 矮 子 。 让 我 看 看 你 有 什 么 能 耐 ！

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_Moe_Hallo_Aerger()
{
	AI_Output(other, self, "DIA_Moe_Hallo_Aerger_15_00"); //你 想 给 我 惹 麻 烦 ？
	AI_Output(self, other, "DIA_Moe_Hallo_Aerger_01_01"); //当 然 ， 我 是 制 造 麻 烦 的 大 师 。 所 以 ， 保 护 好 你 自 己 ， 矮 子 。

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_Moe_Hallo_Ruhig()
{
	AI_Output(other, self, "DIA_Moe_Hallo_Ruhig_15_00"); //冷 静 ， 我 想 要 的 就 是 喝 一 杯 啤 酒 。
	AI_Output(self, other, "DIA_Moe_Hallo_Ruhig_01_01"); //好 的 ， 但 是 要 进 去 的 话 需 要 5 0 个 金 币 。 （ 咧 着 嘴 笑 ）

	Info_ClearChoices(DIA_Moe_Hallo);
	Info_AddChoice(DIA_Moe_Hallo, "算 了 吧 ， 你 一 分 钱 也 拿 不 到 ！", DIA_Moe_Hallo_Vergisses);
	Info_AddChoice(DIA_Moe_Hallo, "好 吧 。 我 愿 意 付 钱 。", DIA_Moe_Hallo_Zahlen);
};

func void DIA_Moe_Hallo_Zahlen()
{
	AI_Output(other, self, "DIA_Moe_Hallo_Zahlen_15_00"); //好 的 ， 我 会 付 钱 的 。

	if (B_GiveInvItems(other, self, ItMi_Gold, 50))
	{
		AI_Output(self, other, "DIA_Moe_Hallo_Zahlen_01_01"); //太 棒 了 。 既 然 进 行 得 这 么 顺 利 ， 现 在 你 可 以 把 你 身 上 其 它 的 东 西 给 我 了 。

		Info_ClearChoices(DIA_Moe_Hallo);
		Info_AddChoice(DIA_Moe_Hallo, "算 了 吧 ， 你 一 分 钱 也 拿 不 到 ！", DIA_Moe_Hallo_Vergisses);
		Info_AddChoice(DIA_Moe_Hallo, "好 吧 ， 这 是 我 的 全 部 家 当 。", DIA_Moe_Hallo_Alles);
	}
	else if (Npc_HasItems(hero, ItMi_Gold) > 9)
	{
		AI_Output(other, self, "DIA_Moe_Hallo_Zahlen_15_02"); //… … 但 是 ， 我 身 上 没 带 那 么 多 金 币 。
		AI_Output(self, other, "DIA_Moe_Hallo_Zahlen_01_03"); //那 没 有 关 系 。 就 给 我 你 身 上 所 有 的 东 西 吧 。

		Info_ClearChoices(DIA_Moe_Hallo);
		Info_AddChoice(DIA_Moe_Hallo, "算 了 吧 ， 你 一 分 钱 也 拿 不 到 ！", DIA_Moe_Hallo_Vergisses);
		Info_AddChoice(DIA_Moe_Hallo, "好 吧 ， 这 是 我 的 全 部 家 当 。", DIA_Moe_Hallo_Alles);
	}
	else
	{
		AI_Output(other, self, "DIA_Moe_Hallo_Zahlen_15_04"); //… … 但 是 ， 我 连 1 0 个 金 币 都 没 有 。
		AI_Output(self, other, "DIA_Moe_Hallo_Zahlen_01_05"); //伙 计 ， 我 是 挑 了 个 活 人 吗 。
		AI_Output(self, other, "DIA_Moe_Hallo_Zahlen_01_06"); //好 吧 - 叹 气 - 你 可 以 走 了 。

		AI_StopProcessInfos(self);
	};
};

func void DIA_Moe_Hallo_Vergisses()
{
	AI_Output(other, self, "DIA_Moe_Hallo_Vergisses_15_00"); //算 了 吧 ， 你 一 分 钱 也 拿 不 到 ！
	AI_Output(self, other, "DIA_Moe_Hallo_Vergisses_01_01"); //那 么 我 会 拿 走 你 全 部 的 东 西 - 只 要 你 一 躺 在 我 前 面 的 地 上 。

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_Moe_Hallo_Alles()
{
	AI_Output(other, self, "DIA_Moe_Hallo_Alles_15_00"); //好 吧 ， 这 是 我 的 全 部 家 当 。

	B_GiveInvItems(other, self, ItMi_Gold, Npc_HasItems(other, ItMi_Gold));

	AI_Output(self, other, "DIA_Moe_Hallo_Alles_01_01"); //好 的 ， 那 就 够 了 。 永 远 慷 慨 大 方 - 那 就 是 我 。 （ 咧 着 嘴 笑 ）
	AI_StopProcessInfos(self);
};

//************************************************
//	Das Hafenviertel
//************************************************
instance DIA_Moe_Harbor(C_INFO)
{
	npc				= VLK_432_Moe;
	nr				= 998;
	condition		= DIA_Moe_Harbor_Condition;
	information		= DIA_Moe_Harbor_Info;
	permanent		= TRUE;
	description		= "你 知 道 海 港 的 路 ， 不 是 吗 ？";
};

func int DIA_Moe_Harbor_Condition()
{
	return TRUE;
};

func void DIA_Moe_Harbor_Info()
{
	AI_Output(other, self, "DIA_Moe_Harbor_15_00"); //你 知 道 海 港 的 路 ， 不 是 吗 ？
	AI_Output(self, other, "DIA_Moe_Harbor_01_01"); //当 然 。 为 什 么 ？

	Info_ClearChoices(DIA_Moe_Harbor);
	Info_AddChoice(DIA_Moe_Harbor, DIALOG_BACK, DIA_Moe_Harbor_Back);
	Info_AddChoice(DIA_Moe_Harbor, "海 运 买 卖 怎 么 样 ？", DIA_Moe_Harbor_Ship);
	Info_AddChoice(DIA_Moe_Harbor, "为 什 么 我 看 不 到 一 个 民 兵 ？", DIA_Moe_Harbor_Militia);
	Info_AddChoice(DIA_Moe_Harbor, "现 在 有 什 么 传 言 吗 ？", DIA_Moe_Harbor_Rumors);
};

func void DIA_Moe_Harbor_Back()
{
	Info_ClearChoices(DIA_Moe_Harbor);
};

func void DIA_Moe_Harbor_Ship()
{
	AI_Output(other, self, "DIA_Moe_Harbor_Ship_15_00"); //海 运 买 卖 怎 么 样 ？
	AI_Output(self, other, "DIA_Moe_Harbor_Ship_01_01"); //最 近 只 有 圣 骑 士 的 船 只 到 这 儿 来 过 。
	AI_Output(self, other, "DIA_Moe_Harbor_Ship_01_02"); //在 西 南 方 那 边 那 片 石 头 山 后 面 。
};

func void DIA_Moe_Harbor_Militia()
{
	AI_Output(other, self, "DIA_Moe_Harbor_Militia_15_00"); //为 什 么 我 看 不 到 一 个 民 兵 ？
	AI_Output(self, other, "DIA_Moe_Harbor_Militia_01_01"); //他 们 不 敢 来 这 里 。 我 们 自 己 解 决 问 题 。
};

func void DIA_Moe_Harbor_Rumors()
{
	AI_Output(other, self, "DIA_Moe_Harbor_Rumors_15_00"); //现 在 有 什 么 传 言 吗 ？

	if (Kapitel == 1)
	{
		AI_Output(self, other, "DIA_Moe_Harbor_Rumors_01_01"); //在 这 周 围 ， 我 们 不 喜 欢 问 这 问 那 的 人 。 尤 其 是 那 些 陌 生 人 。
	}
	else if (Kapitel == 2)
	{
		if (hero.guild == GIL_MIL)
		{
			AI_Output(self, other, "DIA_Moe_Harbor_Rumors_01_02"); //没 什 么 - 能 有 什 么 呢 ？ 这 里 的 一 切 都 很 平 静 。
		}
		else if ((hero.guild == GIL_KDF)
		|| (hero.guild == GIL_PAL))
		{
			AI_Output(self, other, "DIA_Moe_Harbor_Rumors_01_03"); //（ 做 作 的 ） 太 糟 了 。 日 子 不 好 过 ， 而 我 们 一 直 都 试 图 走 正 道 。
			AI_Output(other, self, "DIA_Moe_Harbor_Rumors_15_04"); //不 要 嘲 笑 我 。
			AI_Output(self, other, "DIA_Moe_Harbor_Rumors_01_05"); //你 怎 么 能 把 我 想 成 这 样 ？ 我 被 伤 得 很 深 。
		}
		else
		{
			AI_Output(self, other, "DIA_Moe_Harbor_Rumors_01_06"); //事 情 真 的 很 紧 急 。 安 德 烈 勋 爵 很 久 以 来 一 直 在 探 听 一 些 与 他 无 关 的 事 情 。
			AI_Output(self, other, "DIA_Moe_Harbor_Rumors_01_07"); //那 些 大 人 物 永 远 都 不 会 明 白 这 里 的 处 境 。
		};
	}
	else if (Kapitel == 3)
	{
		if (Mis_RescueBennet == LOG_SUCCESS)
		{
			if ((hero.guild == GIL_MIL)
			|| (hero.guild == GIL_PAL)
			|| (hero.guild == GIL_KDF))
			{
				AI_Output(self, other, "DIA_Moe_Harbor_Rumors_01_08"); //关 于 那 件 事 ， 我 们 帮 不 上 任 何 忙 。
				AI_Output(other, self, "DIA_Moe_Harbor_Rumors_15_09"); //什 么 事 ？
				AI_Output(self, other, "DIA_Moe_Harbor_Rumors_01_10"); //就 是 关 于 他 们 在 那 里 谋 杀 的 那 个 圣 骑 士 。 你 真 的 应 该 担 心 这 些 雇 佣 兵 ， 而 不 是 在 这 里 浪 费 时 间 。
			}
			else
			{
				AI_Output(self, other, "DIA_Moe_Harbor_Rumors_01_11"); //我 知 道 你 在 这 件 事 情 上 面 插 不 了 什 么 手 ， 但 是 谋 杀 那 个 圣 骑 士 的 凶 手 确 实 让 那 些 高 贵 的 绅 士 们 害 怕 了 。
				AI_Output(self, other, "DIA_Moe_Harbor_Rumors_01_12"); //如 果 你 想 要 一 些 朋 友 的 忠 告 的 话 ， 离 开 这 座 城 。 至 少 一 段 时 间 内 。
			};
		}
		else
		{
			AI_Output(self, other, "DIA_Moe_Harbor_Rumors_01_13"); //自 从 有 消 息 说 那 些 雇 佣 兵 没 有 杀 害 那 个 圣 骑 士 后 ， 那 些 民 兵 完 全 不 敢 到 这 里 来 了 。
			AI_Output(self, other, "DIA_Moe_Harbor_Rumors_01_14"); //我 认 为 他 们 是 害 怕 那 几 个 该 死 的 探 子 。 这 对 我 来 说 很 好 。
		};
	}
	else if (Kapitel == 4)
	{
		AI_Output(self, other, "DIA_Moe_Harbor_Rumors_01_15"); //这 里 绝 对 没 有 发 生 任 何 事 情 。
	}
	else // Kapitel 5
	{
		AI_Output(self, other, "DIA_Moe_Harbor_Rumors_01_16"); //终 于 ， 那 些 自 吹 自 擂 的 圣 骑 士 要 离 开 港 口 了 。 是 时 候 了 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info LehmarGeldeintreiben
///////////////////////////////////////////////////////////////////////
instance DIA_Moe_LEHMARGELDEINTREIBEN(C_INFO)
{
	npc				= VLK_432_Moe;
	nr				= 2;
	condition		= DIA_Moe_LEHMARGELDEINTREIBEN_Condition;
	information		= DIA_Moe_LEHMARGELDEINTREIBEN_Info;
	important		= TRUE;
};

func int DIA_Moe_LEHMARGELDEINTREIBEN_Condition()
{
	if (((Lehmar_GeldGeliehen_Day <= (Wld_GetDay() - 2))
	&& (Lehmar_GeldGeliehen != 0))
	&& (RangerHelp_LehmarKohle == FALSE)
	&& (Lehmar.aivar[AIV_DefeatedByPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Moe_LEHMARGELDEINTREIBEN_Info()
{
	AI_Output(self, other, "DIA_Moe_LEHMARGELDEINTREIBEN_01_00"); //嘿 ， 你 ！ 雷 玛 尔 问 你 好 。

	AI_StopProcessInfos(self);

	B_Attack(self, other, AR_NONE, 1);
};
