///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_EXIT(C_INFO)
{
	npc				= NOV_602_Ulf;
	nr				= 999;
	condition		= DIA_Ulf_EXIT_Condition;
	information		= DIA_Ulf_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Ulf_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ulf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info YOU
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Hallo(C_INFO)
{
	npc				= NOV_602_Ulf;
	nr				= 2;
	condition		= DIA_Ulf_Hallo_Condition;
	information		= DIA_Ulf_Hallo_Info;
	description		= "你 在 这 里 做 什 么 ？";
};

func int DIA_Ulf_Hallo_Condition()
{
	if ((hero.guild != GIL_NOV)
	&& (hero.guild != GIL_KDF)
	&& (MIS_SCHNITZELJAGD == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Hallo_Info()
{
	AI_Output(other, self, "DIA_Ulf_Hallo_15_00"); //你 在 这 里 做 什 么 ？

	if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Ulf_Hallo_03_01"); //我 正 在 做 修 道 院 交 给 我 的 任 务 以 获 取 你 的 满 意 。
	}
	else
	{
		AI_Output(self, other, "DIA_Ulf_Hallo_03_02"); //我 是 来 自 修 道 院 的 新 信 徒 。 我 为 魔 法 师 和 圣 骑 士 做 事 。
		AI_Output(self, other, "DIA_Ulf_Hallo_03_03"); //我 已 经 把 修 道 院 的 葡 萄 酒 供 应 给 了 城 市 里 的 三 个 酒 馆 老 板 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Wirte
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Wirte(C_INFO)
{
	npc				= NOV_602_Ulf;
	nr				= 3;
	condition		= DIA_Ulf_Wirte_Condition;
	information		= DIA_Ulf_Wirte_Info;
	description		= "那 三 个 旅 馆 主 人 是 谁 ？";
};

func int DIA_Ulf_Wirte_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Ulf_Hallo)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Wirte_Info()
{
	AI_Output(other, self, "DIA_Ulf_Wirte_15_00"); //那 三 个 旅 馆 主 人 是 谁 ？
	AI_Output(self, other, "DIA_Ulf_Wirte_03_01"); //他 们 之 间 其 中 一 人 正 是 这 里 吧 台 后 面 的 好 人 。
	AI_Output(self, other, "DIA_Ulf_Wirte_03_02"); //然 后 是 卡 拉 贡 ， 他 的 酒 馆 在 神 殿 广 场 ， 还 有 卡 迪 夫 ， 海 港 地 区 酒 吧 的 主 人 。
};

///////////////////////////////////////////////////////////////////////
//	Info Kloster
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Kloster(C_INFO)
{
	npc				= NOV_602_Ulf;
	nr				= 3;
	condition		= DIA_Ulf_Kloster_Condition;
	information		= DIA_Ulf_Kloster_Info;
	description		= "关 于 修 道 院 你 能 告 诉 什 么 ？";
};

func int DIA_Ulf_Kloster_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Ulf_Hallo)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Kloster_Info()
{
	AI_Output(other, self, "DIA_Ulf_Kloster_15_00"); //关 于 修 道 院 你 能 告 诉 什 么 ？
	AI_Output(self, other, "DIA_Ulf_Kloster_03_01"); //我 们 新 信 徒 在 对 英 诺 斯 的 祈 祷 中 寻 找 教 化 ， 向 魔 法 师 们 学 习 信 仰 的 原 则 。
	AI_Output(self, other, "DIA_Ulf_Kloster_03_02"); //我 们 对 待 他 们 就 像 对 待 英 诺 斯 一 样 ， 并 让 自 己 做 好 与 火 焰 结 合 的 准 备 。
};

///////////////////////////////////////////////////////////////////////
//	bring mich zum Kloster
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Bringen(C_INFO)
{
	npc				= NOV_602_Ulf;
	nr				= 4;
	condition		= DIA_Ulf_Bringen_Condition;
	information		= DIA_Ulf_Bringen_Info;
	description		= "带 我 去 修 道 院 。";
};

func int DIA_Ulf_Bringen_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Ulf_Hallo)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_NOV)
	&& (hero.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Bringen_Info()
{
	AI_Output(other, self, "DIA_Ulf_Bringen_15_00"); //带 我 去 修 道 院 。
	AI_Output(self, other, "DIA_Ulf_Bringen_03_01"); //算 了 吧 。 你 知 道 我 在 路 上 要 躲 避 多 少 生 物 吗 ？
	AI_Output(self, other, "DIA_Ulf_Bringen_03_02"); //当 我 想 起 所 有 那 些 血 蝇 、 狼 和 哥 布 林 时 ， 我 非 常 高 兴 ， 我 不 用 再 离 开 这 里 了 。
	AI_Output(self, other, "DIA_Ulf_Bringen_03_03"); //此 外 ， 无 论 如 何 你 不 能 进 入 修 道 院 。
	AI_Output(other, self, "DIA_Ulf_Bringen_15_04"); //为 什 么 不 呢 ？
	AI_Output(self, other, "DIA_Ulf_Bringen_03_05"); //入 口 只 允 许 魔 法 师 、 圣 骑 士 和 新 信 徒 通 过 。
};

///////////////////////////////////////////////////////////////////////
//	Info Kloster
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Aufnahme(C_INFO)
{
	npc				= NOV_602_Ulf;
	nr				= 3;
	condition		= DIA_Ulf_Aufnahme_Condition;
	information		= DIA_Ulf_Aufnahme_Info;
	description		= "我 怎 么 才 能 成 为 新 信 徒 ？";
};

func int DIA_Ulf_Aufnahme_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Ulf_Bringen)
	&& (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Aufnahme_Info()
{
	AI_Output(other, self, "DIA_Ulf_Aufnahme_15_00"); //我 怎 么 才 能 成 为 新 信 徒 ？
	AI_Output(self, other, "DIA_Ulf_Aufnahme_03_01"); //如 果 某 个 人 迫 切 地 想 要 … …
	AI_Output(other, self, "DIA_Ulf_Aufnahme_15_02"); //嘿 - 只 要 告 诉 我 条 件 是 什 么 就 行 了 。
	AI_Output(self, other, "DIA_Ulf_Aufnahme_03_03"); //你 需 要 献 礼 。 一 头 绵 羊 和 … …
	B_Say_Gold(self, other, Summe_Kloster);

	Log_CreateTopic(Topic_Kloster, LOG_MISSION);
	Log_SetTopicStatus(Topic_Kloster, LOG_RUNNING);
	B_LogEntry(Topic_Kloster, Topic_Kloster_1);
};

///////////////////////////////////////////////////////////////////////
//	Info Gold
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Gold(C_INFO)
{
	npc				= NOV_602_Ulf;
	nr				= 8;
	condition		= DIA_Ulf_Gold_Condition;
	information		= DIA_Ulf_Gold_Info;
	description		= "我 怎 么 才 能 弄 到 那 么 多 的 金 币 ？";
};

func int DIA_Ulf_Gold_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Ulf_Aufnahme)
	&& (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Gold_Info()
{
	AI_Output(other, self, "DIA_Ulf_Gold_15_00"); //我 怎 么 才 能 弄 到 那 么 多 的 金 币 ？
	AI_Output(self, other, "DIA_Ulf_Gold_03_01"); //显 然 你 不 认 识 任 何 愿 意 为 你 付 钱 的 人 ， 那 么 你 只 能 去 找 工 作 。
};

///////////////////////////////////////////////////////////////////////
//	Info Schaf
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Schaf(C_INFO)
{
	npc				= NOV_602_Ulf;
	nr				= 9;
	condition		= DIA_Ulf_Schaf_Condition;
	information		= DIA_Ulf_Schaf_Info;
	description		= "我 在 哪 里 能 弄 到 绵 羊？ ";
};

func int DIA_Ulf_Schaf_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Ulf_Aufnahme)
	&& (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Schaf_Info()
{
	AI_Output(other, self, "DIA_Ulf_Schaf_15_00"); //我 在 哪 里 能 弄 到 绵 羊 ？
	AI_Output(self, other, "DIA_Ulf_Schaf_03_01"); //当 然 从 农 民 那 里 ， 但 是 你 不 会 白 白 得 到 任 何 东 西 。

	B_LogEntry(Topic_Kloster, Topic_Kloster_3);
};

///////////////////////////////////////////////////////////////////////
//	Info Suche
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Suche(C_INFO)
{
	npc				= NOV_602_Ulf;
	nr				= 9;
	condition		= DIA_Ulf_Suche_Condition;
	information		= DIA_Ulf_Suche_Info;
	important		= TRUE;
};

func int DIA_Ulf_Suche_Condition()
{
	if ((MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& (Npc_GetDistToWP(self, "NW_TROLLAREA_PATH_42") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Suche_Info()
{
	AI_Output(self, other, "DIA_Ulf_Suche_03_00"); //嘿 ， 你 知 道 发 生 了 什 么 事 吗 ？
	AI_Output(other, self, "DIA_Ulf_Suche_15_01"); //你 被 选 中 的 了 。
	AI_Output(self, other, "DIA_Ulf_Suche_03_02"); //正 确 。 正 当 我 要 喝 一 口 冰 凉 的 啤 酒 时 - 达 隆 走 到 角 落 并 且 告 诉 我 ， 我 被 选 中 了 。
	AI_Output(self, other, "DIA_Ulf_Suche_03_03"); //谁 会 想 到 呢 ？ 英 诺 斯 的 意 愿 是 高 深 莫 测 的 。 你 为 什 么 来 这 里 ？
	AI_Output(other, self, "DIA_Ulf_Suche_15_04"); //我 已 经 申 请 了 火 焰 测 试 。
	AI_Output(self, other, "DIA_Ulf_Suche_03_05"); //不 可 能 ？ ！ 小 子 ， 你 十 分 勇 敢 。 那 么 说 你 也 在 找 那 个 ‘ 信 徒 在 道 路 尽 头 找 到 的 东 西 ’ ？
	AI_Output(other, self, "DIA_Ulf_Suche_15_06"); //看 起 来 像 是 。
};

///////////////////////////////////////////////////////////////////////
//	Info Rausgefunden
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Rausgefunden(C_INFO)
{
	npc				= NOV_602_Ulf;
	nr				= 9;
	condition		= DIA_Ulf_Rausgefunden_Condition;
	information		= DIA_Ulf_Rausgefunden_Info;
	description		= "你 发 现 什 么 没 有 ？";
};

func int DIA_Ulf_Rausgefunden_Condition()
{
	if ((MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& (Npc_GetDistToWP(self, "NW_TROLLAREA_PATH_42") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Rausgefunden_Info()
{
	AI_Output(other, self, "DIA_Ulf_Rausgefunden_15_00"); //你 发 现 什 么 没 有 ？
	AI_Output(self, other, "DIA_Ulf_Rausgefunden_03_01"); //嗯 ， 我 刚 刚 跟 着 阿 岗 - 但 是 那 时 我 跟 丢 了 。
	AI_Output(self, other, "DIA_Ulf_Rausgefunden_03_02"); //那 么 现 在 … … 他 们 是 怎 么 说 的 ？ 跟 随 英 诺 斯 的 标 记 。 但 是 我 不 知 道 ‘ 道 路 ’ 那 一 部 分 的 含 义 … …
	AI_Output(self, other, "DIA_Ulf_Rausgefunden_03_03"); //那 又 怎 么 样 ？ 我 会 继 续 搜 索 。

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "FOLLOW");
};

///////////////////////////////////////////////////////////////////////
//	Info Folgen
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Folgen(C_INFO)
{
	npc				= NOV_602_Ulf;
	nr				= 9;
	condition		= DIA_Ulf_Folgen_Condition;
	information		= DIA_Ulf_Folgen_Info;
	description		= "嘿 ， 你 在 跟 踪 我 ？";
};

func int DIA_Ulf_Folgen_Condition()
{
	if ((MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& Npc_KnowsInfo(other, DIA_Ulf_Rausgefunden))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Folgen_Info()
{
	AI_Output(other, self, "DIA_Ulf_Folgen_15_00"); //嘿 ， 你 在 跟 踪 我 ？
	AI_Output(self, other, "DIA_Ulf_Folgen_03_01"); //胡 说 。 我 只 是 刚 好 和 你 走 的 同 一 个 方 向 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Stop
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Stop(C_INFO)
{
	npc				= NOV_602_Ulf;
	nr				= 9;
	condition		= DIA_Ulf_Stop_Condition;
	information		= DIA_Ulf_Stop_Info;
	description		= "别 跟 着 我 ！";
};

func int DIA_Ulf_Stop_Condition()
{
	if ((MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& Npc_KnowsInfo(other, DIA_Ulf_Folgen))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Stop_Info()
{
	AI_Output(other, self, "DIA_Ulf_Stop_15_00"); //别 跟 着 我 ！
	AI_Output(self, other, "DIA_Ulf_Stop_03_01"); //我 不 是 在 跟 着 你 走 。 但 是 ， 如 果 你 是 那 样 想 的 话 - 那 我 现 在 走 另 外 一 条 不 同 的 路 。

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "SUCHE");
};

///////////////////////////////////////////////////////////////////////
//	Info Abrechnung
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Abrechnung(C_INFO)
{
	npc				= NOV_602_Ulf;
	nr				= 9;
	condition		= DIA_Ulf_Abrechnung_Condition;
	information		= DIA_Ulf_Abrechnung_Info;
	important		= TRUE;
};

func int DIA_Ulf_Abrechnung_Condition()
{
	if ((MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& (Npc_HasItems(other, ItmI_RuneBlank) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Abrechnung_Info()
{
	AI_Output(self, other, "DIA_Ulf_Abrechnung_03_00"); //我 们 又 碰 上 了 。 我 一 直 在 想 ， 你 知 道 。 我 相 信 ， 成 为 魔 法 师 的 渴 望 在 我 内 心 十 分 强 烈 。
	AI_Output(other, self, "DIA_Ulf_Abrechnung_15_01"); //哦 ， 老 兄 - 不 要 那 么 做 … …
	AI_Output(self, other, "DIA_Ulf_Abrechnung_03_02"); //我 别 无 选 择 。 新 信 徒 的 生 活 不 属 于 我 。
	AI_Output(self, other, "DIA_Ulf_Abrechnung_03_03"); //我 就 是 要 成 为 一 名 魔 法 师 ， 那 样 我 的 一 切 都 会 顺 利 。 现 在 我 要 拿 走 我 应 得 的 。
	AI_Output(self, other, "DIA_Ulf_Abrechnung_03_04"); //你 有 什 么 遗 言 吗 ？

	Info_ClearChoices(DIA_Ulf_Abrechnung);
	Info_AddChoice(DIA_Ulf_Abrechnung, "停 下 ， 我 不 想 杀 你 。 ", DIA_Ulf_Abrechnung_Lass);
	Info_AddChoice(DIA_Ulf_Abrechnung, "我 们 直 接 了 当 的 说 吧 - 我 要 返 回 修 道 院 。", DIA_Ulf_Abrechnung_Schnell);
	Info_AddChoice(DIA_Ulf_Abrechnung, "你 有 什 么 烟 能 吸 吗 ？", DIA_Ulf_Abrechnung_Rauch);
};

func void DIA_Ulf_Abrechnung_Lass()
{
	AI_Output(other, self, "DIA_Ulf_Abrechnung_Lass_15_00"); //停 下 ， 我 不 想 杀 你 。
	AI_Output(self, other, "DIA_Ulf_Abrechnung_Lass_03_01"); //吹 牛 。 但 是 你 知 道 和 我 对 抗 你 根 本 没 有 机 会 ！ 来 吧 ！。

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_KILL, 0);
};

func void DIA_Ulf_Abrechnung_Schnell()
{
	AI_Output(other, self, "DIA_Ulf_Abrechnung_Schnell_15_00"); //我 们 直 截 了 当 的 说 吧 - 我 要 回 到 修 道 院 去 。
	AI_Output(self, other, "DIA_Ulf_Abrechnung_Schnell_03_01"); //你 永 远 不 能 再 去 任 何 地 方 了 ！

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_KILL, 0);
};

func void DIA_Ulf_Abrechnung_Rauch()
{
	AI_Output(other, self, "DIA_Ulf_Abrechnung_Rauch_15_00"); //你 有 什 么 烟 能 吸 吗 ？
	AI_Output(self, other, "DIA_Ulf_Abrechnung_Rauch_03_01"); //你 很 幸 运 。 我 真 的 在 这 里 找 到 了 一 些 东 西 。

	B_GiveInvItems(self, other, ITmi_Joint, 1);
	B_UseItem(other, itmI_Joint);
	AI_Output(self, other, "DIA_Ulf_Abrechnung_Rauch_03_02"); //我 们 完 成 它 吧 。

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_KILL, 0);
};

///////////////////////////////////////////////////////////////////////
//	Info Troll
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Troll(C_INFO)
{
	npc				= NOV_602_Ulf;
	nr				= 9;
	condition		= DIA_Ulf_Troll_Condition;
	information		= DIA_Ulf_Troll_Info;
	important		= TRUE;
};

func int DIA_Ulf_Troll_Condition()
{
	if ((MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& Npc_KnowsInfo(other, DIA_Ulf_Rausgefunden)
	&& ((Npc_GetDistToWP(self, "NW_TROLLAREA_PATH_14") <= 1000)
	|| (Npc_GetDistToWP(self, "NW_TROLLAREA_PATH_15") <= 1000)))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Troll_Info()
{
	AI_Output(self, other, "DIA_Ulf_Troll_03_00"); //嘿 ， 你 真 的 认 为 我 们 走 的 路 正 确 吗 ？ 一 个 巨 魔 住 在 那 里 的 某 个 地 方 。
	AI_Output(self, other, "DIA_Ulf_Troll_03_01"); //我 想 我 最 好 另 找 一 个 方 向 。

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "WAIT");
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Ulf_PICKPOCKET(C_INFO)
{
	npc				= NOV_602_Ulf;
	nr				= 900;
	condition		= DIA_Ulf_PICKPOCKET_Condition;
	information		= DIA_Ulf_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Ulf_PICKPOCKET_Condition()
{
	C_Beklauen(34, 50);
};

func void DIA_Ulf_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ulf_PICKPOCKET);
	Info_AddChoice(DIA_Ulf_PICKPOCKET, DIALOG_BACK, DIA_Ulf_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ulf_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Ulf_PICKPOCKET_DoIt);
};

func void DIA_Ulf_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Ulf_PICKPOCKET);
};

func void DIA_Ulf_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ulf_PICKPOCKET);
};
