///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_EXIT(C_INFO)
{
	npc				= BAU_954_Maleth;
	nr				= 999;
	condition		= DIA_Maleth_EXIT_Condition;
	information		= DIA_Maleth_EXIT_Info;
	permanent		= TRUE;
	description		= "我 必 须 走 了 ！( 结 束 )";
};

func int DIA_Maleth_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Maleth_EXIT_Info()
{
	AI_StopProcessInfos(self);

	if (Maleth_ersterWolf == FALSE)
	{
		Wld_InsertNpc(YWolf, "NW_FARM1_PATH_CITY_SHEEP_06");
		Maleth_ersterWolf = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_Hallo(C_INFO)
{
	npc				= BAU_954_Maleth;
	nr				= 1;
	condition		= DIA_Maleth_Hallo_Condition;
	information		= DIA_Maleth_Hallo_Info;
	important		= TRUE;
};

func int DIA_Maleth_Hallo_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Maleth_Hallo_Info()
{
	AI_Output(self, other, "DIA_Maleth_Hallo_08_00"); //嘿 ， 陌 生 人 ！

	if (hero.guild == GIL_NONE)
	{
		if (Npc_GetDistToWP(self, "NW_FARM1_PATH_CITY_SHEEP_09") < 500)
		{
			AI_Output(self, other, "DIA_Maleth_Hallo_08_01"); //我 看 到 了 你 是 如 何 从 山 区 走 出 来 的 。
		};

		AI_Output(self, other, "DIA_Maleth_Hallo_08_02"); //你 应 该 庆 幸 不 是 在 三 周 前 经 过 这 里 。
		AI_Output(self, other, "DIA_Maleth_Hallo_08_03"); //我 们 会 把 你 当 作 逃 犯 逮 捕 。 然 后 我 们 把 他 们 都 处 死 ！

		if (Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output(self, other, "DIA_Maleth_Hallo_08_04"); //你 看 起 来 彻 底 累 坏 了 。
		}
		else
		{
			AI_Output(self, other, "DIA_Maleth_Hallo_08_05"); //在 你 到 这 里 的 时 候 ， 看 起 来 彻 底 累 坏 了 。
			AI_Output(self, other, "DIA_Maleth_Hallo_08_06"); //嗯 ， 现 在 你 看 起 来 又 有 个 人 样 了 ！
		};
	};

	AI_Output(self, other, "DIA_Maleth_Hallo_08_07"); //（ 不 信 任 的 ） 你 在 这 里 想 要 做 什 么 ？
};

///////////////////////////////////////////////////////////////////////
//	Banditen Überfall
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_BANDITS(C_INFO) // E1
{
	npc				= BAU_954_Maleth;
	nr				= 1;
	condition		= DIA_Maleth_BANDITS_Condition;
	information		= DIA_Maleth_BANDITS_Info;
	description		= "我 在 山 上 被 强 盗 袭 击 了 。";
};

func int DIA_Maleth_BANDITS_Condition()
{
	if ((Kapitel < 3)
	&& (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Maleth_BANDITS_Info()
{
	AI_Output(other, self, "DIA_Maleth_BANDITS_15_00"); //我 在 山 上 被 强 盗 袭 击 了 。
	AI_Output(self, other, "DIA_Maleth_BANDITS_08_01"); //那 些 可 恶 的 暴 民 ！ 他 们 可 能 就 是 昨 天 偷 走 我 们 一 头 绵 羊 的 混 蛋 ！
	AI_Output(self, other, "DIA_Maleth_BANDITS_08_02"); //你 的 运 气 非 常 好 。 大 多 数 人 没 能 活 着 离 开 。
};

///////////////////////////////////////////////////////////////////////
//	Banditen tot
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_BanditsDEAD(C_INFO) // E2
{
	npc				= BAU_954_Maleth;
	nr				= 1;
	condition		= DIA_Maleth_BanditsDEAD_Condition;
	information		= DIA_Maleth_BanditsDEAD_Info;
	description		= "那 些 强 盗 不 会 再 给 你 惹 麻 烦 了 … …";
};

func int DIA_Maleth_BanditsDEAD_Condition()
{
	if ((Npc_IsDead(Ambusher_1013) || (Bdt_1013_Away == TRUE))
	&& (Npc_IsDead(Ambusher_1014))
	&& (Npc_IsDead(Ambusher_1015))
	&& (Npc_KnowsInfo(other, DIA_Maleth_BANDITS)))
	{
		return TRUE;
	};
};

func void DIA_Maleth_BanditsDEAD_Info()
{
	AI_Output(other, self, "DIA_Maleth_BanditsDEAD_15_00"); //那 些 强 盗 不 会 再 给 你 惹 麻 烦 了 … …
	AI_Output(self, other, "DIA_Maleth_BanditsDEAD_08_01"); //为 什 么 ？ 他 们 死 了 吗 ？
	AI_Output(other, self, "DIA_Maleth_BanditsDEAD_15_02"); //他 们 找 错 了 打 架 的 对 象 … …
	AI_Output(self, other, "DIA_Maleth_BanditsDEAD_08_03"); //感 谢 英 诺 斯 ！ 给 - 不 算 多 ， 但 是 我 要 你 拿 着 它 ！
	B_GiveInvItems(self, other, ItFo_Wine, 3);

	MIS_Maleth_Bandits = LOG_SUCCESS;
	B_GivePlayerXP(XP_MalethKillBandits);
	AI_Output(self, other, "DIA_Maleth_BanditsDEAD_08_04"); //我 会 告 诉 其 它 人 关 于 这 件 事 ！
};

///////////////////////////////////////////////////////////////////////
//	Banditen leben noch
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_BanditsALIVE(C_INFO) // E2
{
	npc				= BAU_954_Maleth;
	nr				= 1;
	condition		= DIA_Maleth_BanditsALIVE_Condition;
	information		= DIA_Maleth_BanditsALIVE_Info;
	description		= "我 知 道 强 盗 们 的 藏 身 处 … …";
};

func int DIA_Maleth_BanditsALIVE_Condition()
{
	var C_Npc b13; b13 = Hlp_GetNpc(Bdt_1013_Bandit_L);
	var C_Npc b14; b14 = Hlp_GetNpc(Bdt_1014_Bandit_L);
	var C_Npc b15; b15 = Hlp_GetNpc(Bdt_1015_Bandit_L);

	if (((!Npc_IsDead(b13)) || (!Npc_IsDead(b14)) || (!Npc_IsDead(b15)))
	&& (Npc_KnowsInfo(other, DIA_Maleth_BANDITS))
	&& (MIS_Maleth_Bandits != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Maleth_BanditsALIVE_Info()
{
	AI_Output(other, self, "DIA_Maleth_BanditsALIVE_15_00"); //我 知 道 强 盗 们 的 藏 身 处 … …
	AI_Output(self, other, "DIA_Maleth_BanditsALIVE_08_01"); //你 想 要 袭 击 他 们 ？ 不 要 算 上 我 ！ 那 太 危 险 了 ！
	AI_Output(self, other, "DIA_Maleth_BanditsALIVE_08_02"); //此 外 ， 我 必 须 保 护 我 的 绵 羊 ！
	AI_Output(self, other, "DIA_Maleth_BanditsALIVE_08_03"); //但 是 如 果 你 能 把 那 些 流 氓 从 我 们 这 里 赶 走 的 话 ， 整 个 农 场 都 会 非 常 感 激 你 。
	MIS_Maleth_Bandits = LOG_RUNNING;

	Log_CreateTopic(TOPIC_Maleth, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Maleth, LOG_RUNNING);
	B_LogEntry(TOPIC_Maleth, TOPIC_Maleth_1);
};

///////////////////////////////////////////////////////////////////////
//	Auf dem Weg in die Stadt
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_ToTheCity(C_INFO) // E1
{
	npc				= BAU_954_Maleth;
	nr				= 2;
	condition		= DIA_Maleth_ToTheCity_Condition;
	information		= DIA_Maleth_ToTheCity_Info;
	description		= "我 正 要 去 镇 上 。";
};

func int DIA_Maleth_ToTheCity_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Maleth_Hallo))
	&& (Kapitel < 3)
	&& (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Maleth_ToTheCity_Info()
{
	AI_Output(other, self, "DIA_Maleth_ToTheCity_15_00"); //我 正 要 去 镇 上 。

	if (Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self, other, "DIA_Maleth_ToTheCity_08_01"); //看 你 的 样 子 ， 你 必 须 贿 赂 卫 兵 才 能 进 去 。
		AI_Output(self, other, "DIA_Maleth_ToTheCity_08_02"); //而 且 你 必 须 知 道 他 们 喜 欢 听 什 么 。
	}
	else
	{
		AI_Output(self, other, "DIA_Maleth_ToTheCity_08_03"); //他 们 可 能 会 让 你 进 去 - 如 果 你 能 对 他 们 说 些 他 们 想 要 听 到 的 话 … …
	};

	AI_Output(other, self, "DIA_Maleth_ToTheCity_15_04"); //那 会 是 什 么 ？
	AI_Output(self, other, "DIA_Maleth_ToTheCity_08_05"); //嗯 ， 例 如 ， 说 你 从 洛 拔 特 的 农 场 来 ， 想 要 去 城 里 的 铁 匠 铺 。

	Log_CreateTopic(TOPIC_City, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_City, LOG_RUNNING);
	B_LogEntry(TOPIC_City, TOPIC_City_1);

	if (Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self, other, "DIA_Maleth_ToTheCity_08_06"); //但 是 那 样 对 你 没 有 任 何 好 处 。 你 看 起 来 不 像 是 农 民 。
		B_LogEntry(TOPIC_City, TOPIC_City_2);
	};

	AI_Output(other, self, "DIA_Maleth_ToTheCity_15_07"); //我 明 白 了 。
};

///////////////////////////////////////////////////////////////////////
//	Bessere Ausrüstung
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_Equipment(C_INFO)
{
	npc				= BAU_954_Maleth;
	nr				= 3;
	condition		= DIA_Maleth_Equipment_Condition;
	information		= DIA_Maleth_Equipment_Info;
	description		= "我 需 要 更 好 的 装 备 ！";
};

func int DIA_Maleth_Equipment_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Maleth_Hallo))
	&& (Kapitel < 3)
	&& (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Maleth_Equipment_Info()
{
	AI_Output(other, self, "DIA_Maleth_Equipment_15_00"); //我 需 要 更 好 的 装 备 ！
	AI_Output(self, other, "DIA_Maleth_Equipment_08_01"); //我 能 够 想 象 。 但 是 我 会 马 上 告 诉 你 ： 我 们 没 有 任 何 东 西 要 送 出 去 ！
	if (!Npc_IsDead(Lobart))
	{
		AI_Output(self, other, "DIA_Maleth_Equipment_08_02"); //如 果 你 能 付 得 起 钱 的 话 ， 洛 拔 特 会 送 你 一 些 东 西 。
		AI_Output(self, other, "DIA_Maleth_Equipment_08_03"); //否 则 ， 去 找 他 看 看 他 是 否 有 工 作 给 你 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Lobart
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_LOBART(C_INFO)
{
	npc				= BAU_954_Maleth;
	nr				= 3;
	condition		= DIA_Maleth_LOBART_Condition;
	information		= DIA_Maleth_LOBART_Info;
	description		= "我 在 哪 里 能 找 到 洛 拔 特 ？";
};

func int DIA_Maleth_LOBART_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Maleth_Equipment))
	&& (!Npc_IsDead(Lobart))
	&& (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Maleth_LOBART_Info()
{
	AI_Output(other, self, "DIA_Maleth_LOBART_15_00"); //我 在 哪 里 能 找 到 洛 拔 特 ？
	AI_Output(self, other, "DIA_Maleth_LOBART_08_01"); //嗯 ， 当 然 在 农 场 ！ 属 于 他 的 农 场 ！
	AI_Output(self, other, "DIA_Maleth_LOBART_08_02"); //但 是 不 要 干 扰 他 ！ 他 曾 经 鞭 打 过 很 多 流 浪 汉 ， 并 把 他 们 扔 出 他 的 农 场 。
};

// #####################################################################
// ##
// ##
// ## KAPITEL 3
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************
instance DIA_Maleth_KAP3_EXIT(C_INFO)
{
	npc				= BAU_954_Maleth;
	nr				= 999;
	condition		= DIA_Maleth_KAP3_EXIT_Condition;
	information		= DIA_Maleth_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Maleth_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Maleth_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info probleme
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_PROBLEME(C_INFO)
{
	npc				= BAU_954_Maleth;
	nr				= 30;
	condition		= DIA_Maleth_PROBLEME_Condition;
	information		= DIA_Maleth_PROBLEME_Info;
	description		= "近 来 有 什 么 新 的 进 展 吗 ？";
};

func int DIA_Maleth_PROBLEME_Condition()
{
	if (Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Maleth_PROBLEME_Info()
{
	AI_Output(other, self, "DIA_Maleth_PROBLEME_15_00"); //近 来 有 什 么 新 的 进 展 吗 ？
	AI_Output(self, other, "DIA_Maleth_PROBLEME_08_01"); //只 要 沿 着 道 路 向 前 走 ， 就 能 到 城 市 。
	AI_Output(self, other, "DIA_Maleth_PROBLEME_08_02"); //如 果 你 遇 到 一 个 穿 着 黑 袍 子 的 家 伙 ， 你 就 知 道 有 什 么 新 鲜 事 了 。
	Info_ClearChoices(DIA_Maleth_PROBLEME);
	Info_AddChoice(DIA_Maleth_PROBLEME, DIALOG_BACK, DIA_Maleth_PROBLEME_Back);
	Info_AddChoice(DIA_Maleth_PROBLEME, "你 的 绵 羊 怎 么 样 了 ？", DIA_Maleth_PROBLEME_schafe);
	Info_AddChoice(DIA_Maleth_PROBLEME, "那 些 黑 袍 人 还 来 看 你 ？", DIA_Maleth_PROBLEME_beidir);
};

func void DIA_Maleth_PROBLEME_beidir()
{
	AI_Output(other, self, "DIA_Maleth_PROBLEME_beidir_15_00"); //那 些 黑 袍 人 还 来 看 你 ？
	AI_Output(self, other, "DIA_Maleth_PROBLEME_beidir_08_01"); //对 。 他 们 几 天 前 就 到 了 这 里 。 依 我 说 ， 他 们 是 直 接 从 地 狱 里 来 的。
};

func void DIA_Maleth_PROBLEME_schafe()
{
	AI_Output(other, self, "DIA_Maleth_PROBLEME_schafe_15_00"); //你 的 绵 羊 怎 么 样 了 ？
	AI_Output(self, other, "DIA_Maleth_PROBLEME_schafe_08_01"); //（ 生 气 ） 似 乎 那 应 该 会 让 你 非 常 感 兴 趣 。 你 遇 到 其 它 问 题 了 。
	Info_AddChoice(DIA_Maleth_PROBLEME, "我 的 问 题 ？ 你 都 知 道 些 什 么 ？", DIA_Maleth_PROBLEME_schafe_probleme);
};

func void DIA_Maleth_PROBLEME_schafe_probleme()
{
	AI_Output(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_15_00"); //我 的 问 题 ？ 你 都 知 道 些 什 么 ？

	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_08_01"); //（ 直 率 的 ） 你 是 不 是 属 于 城 市 卫 兵 ？ 那 么 针 对 那 些 穿 黑 袍 子 的 混 蛋 做 点 什 么 事 情 。
	};

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_08_02"); //（ 生 气 ） 你 们 这 些 可 恶 的 雇 佣 兵 只 会 考 虑 一 件 事 情 ： 如 何 把 其 它 人 的 钱 弄 进 我 的 口 袋 。
	};

	if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_08_03"); //你 们 来 自 修 道 院 的 高 贵 统 治 者 应 该 对 那 些 戴 头 罩 的 家 伙 做 点 什 么 。
	};

	Info_ClearChoices(DIA_Maleth_PROBLEME);
	Info_AddChoice(DIA_Maleth_PROBLEME, DIALOG_BACK, DIA_Maleth_PROBLEME_Back);
	Info_AddChoice(DIA_Maleth_PROBLEME, "嘿 ， 注 意 你 的 嘴 ， 老 兄 。", DIA_Maleth_PROBLEME_schafe_probleme_drohen);

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice(DIA_Maleth_PROBLEME, "你 的 难 题 是 什 么 ？", DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag);
	};
};

func void DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag()
{
	AI_Output(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_00"); //你 的 难 题 是 什 么 ？
	AI_Output(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_01"); //我 谴 责 维 诺 几 周 前 卖 给 我 的 那 些 月 光 劣 质 酒 。
	AI_Output(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_02"); //我 几 乎 什 么 都 记 不 起 来 了 ， 老 兄 。 我 只 知 道 我 的 手 杖 在 那 个 时 候 丢 了 。
	AI_Output(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_03"); //你 就 是 因 为 那 个 才 制 造 了 这 么 大 的 骚 动 ？
	AI_Output(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_04"); //你 说 起 来 简 单 ， 它 又 不 是 你 的 。

	Log_CreateTopic(TOPIC_MalethsGehstock, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MalethsGehstock, LOG_RUNNING);
	B_LogEntry(TOPIC_MalethsGehstock, TOPIC_MalethsGehstock_1);

	Info_ClearChoices(DIA_Maleth_PROBLEME);
};

func void DIA_Maleth_PROBLEME_schafe_probleme_drohen()
{
	AI_Output(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_drohen_15_00"); //嘿 ， 注 意 你 的 嘴 ， 老 兄 。
	AI_Output(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_drohen_08_01"); //你 只 会 说 大 话 。 最 好 的 事 情 就 是 你 离 开 这 里 。
};

func void DIA_Maleth_PROBLEME_Back()
{
	Info_ClearChoices(DIA_Maleth_PROBLEME);
};

///////////////////////////////////////////////////////////////////////
//	Info Gehstock
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_GEHSTOCK(C_INFO)
{
	npc				= BAU_954_Maleth;
	nr				= 33;
	condition		= DIA_Maleth_GEHSTOCK_Condition;
	information		= DIA_Maleth_GEHSTOCK_Info;
	description		= "我 想 这 是 你 的 手 杖 。";
};

func int DIA_Maleth_GEHSTOCK_Condition()
{
	if ((Npc_HasItems(other, ItMw_MalethsGehstock_MIS))
	&& (Npc_KnowsInfo(other, DIA_Maleth_PROBLEME)))
	{
		return TRUE;
	};
};

func void DIA_Maleth_GEHSTOCK_Info()
{
	AI_Output(other, self, "DIA_Maleth_GEHSTOCK_15_00"); //我 想 这 是 你 的 手 杖 。
	AI_Output(self, other, "DIA_Maleth_GEHSTOCK_08_01"); //那 太 可 怕 了 。 我 … …
	AI_Output(other, self, "DIA_Maleth_GEHSTOCK_15_02"); //等 一 下 。 首 先 你 要 付 钱 。
	AI_Output(self, other, "DIA_Maleth_GEHSTOCK_08_03"); //但 是 … … 我 没 有 那 么 多 。
	AI_Output(other, self, "DIA_Maleth_GEHSTOCK_15_04"); //那 想 想 别 的 东 西 吧 。
	AI_Output(self, other, "DIA_Maleth_GEHSTOCK_08_05"); //好 吧 。 这 个 怎 么 样 ？ 昨 天 我 看 到 一 些 强 盗 带 着 几 袋 金 子 经 过 。
	AI_Output(self, other, "DIA_Maleth_GEHSTOCK_08_06"); //如 果 我 告 诉 你 他 们 把 赃 物 藏 在 哪 里 ， 我 能 要 回 我 的 手 杖 吗 ？
	TOPIC_END_MalethsGehstock = TRUE;
	B_GivePlayerXP(XP_FoundMalethsGehstock);

	Info_ClearChoices(DIA_Maleth_GEHSTOCK);
	Info_AddChoice(DIA_Maleth_GEHSTOCK, "抱 歉 ， 没 兴 趣 。 我 要 你 的 金 子 。", DIA_Maleth_GEHSTOCK_gold);
	Info_AddChoice(DIA_Maleth_GEHSTOCK, "好吧。", DIA_Maleth_GEHSTOCK_ok);
};

func void DIA_Maleth_GEHSTOCK_ok()
{
	AI_Output(other, self, "DIA_Maleth_GEHSTOCK_ok_15_00"); //好吧。
	B_GiveInvItems(other, self, ItMw_MalethsGehstock_MIS, 1);
	AI_Output(self, other, "DIA_Maleth_GEHSTOCK_ok_08_01"); //好 吧 。 你 只 要 向 西 到 那 里 的 小 树 林 。 你 会 看 到 一 个 溪 谷 。
	AI_Output(self, other, "DIA_Maleth_GEHSTOCK_ok_08_02"); //你 应 该 可 以 在 那 里 的 山 洞 中 找 到 些 什 么 。

	B_LogEntry(TOPIC_MalethsGehstock, TOPIC_MalethsGehstock_2);
	CreateInvItems(BDT_1024_MalethsBandit, ItMi_MalethsBanditGold, 1);
	Info_ClearChoices(DIA_Maleth_GEHSTOCK);
	AI_StopProcessInfos(self);
};

func void DIA_Maleth_GEHSTOCK_gold()
{
	AI_Output(other, self, "DIA_Maleth_GEHSTOCK_gold_15_00"); //抱 歉 ， 没 兴 趣 。 我 要 你 的 金 子 。
	AI_Output(self, other, "DIA_Maleth_GEHSTOCK_gold_08_01"); //这 是 我 所 有 的 东 西 。 那 应 该 足 够 了 。
	CreateInvItems(self, Itmi_Gold, 35);
	B_GiveInvItems(self, other, Itmi_Gold, 35);
	B_GiveInvItems(other, self, ItMw_MalethsGehstock_MIS, 1);
	Info_ClearChoices(DIA_Maleth_GEHSTOCK);
};

///////////////////////////////////////////////////////////////////////
//	Info perm3
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_PERM3(C_INFO)
{
	npc				= BAU_954_Maleth;
	nr				= 33;
	condition		= DIA_Maleth_PERM3_Condition;
	information		= DIA_Maleth_PERM3_Info;
	permanent		= TRUE;
	description		= "不 要 太 激 动 。 ";
};

func int DIA_Maleth_PERM3_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Maleth_PROBLEME))
	&& (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Maleth_PERM3_Info()
{
	AI_Output(other, self, "DIA_Maleth_PERM3_15_00"); //不 要 太 激 动 。
	AI_Output(self, other, "DIA_Maleth_PERM3_08_01"); //（ 恼 怒 的 ） 走 开 。
	AI_StopProcessInfos(self);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 4
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************
instance DIA_Maleth_KAP4_EXIT(C_INFO)
{
	npc				= BAU_954_Maleth;
	nr				= 999;
	condition		= DIA_Maleth_KAP4_EXIT_Condition;
	information		= DIA_Maleth_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Maleth_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Maleth_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 5
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************
instance DIA_Maleth_KAP5_EXIT(C_INFO)
{
	npc				= BAU_954_Maleth;
	nr				= 999;
	condition		= DIA_Maleth_KAP5_EXIT_Condition;
	information		= DIA_Maleth_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Maleth_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Maleth_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 6
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************
instance DIA_Maleth_KAP6_EXIT(C_INFO)
{
	npc				= BAU_954_Maleth;
	nr				= 999;
	condition		= DIA_Maleth_KAP6_EXIT_Condition;
	information		= DIA_Maleth_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Maleth_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Maleth_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Maleth_PICKPOCKET(C_INFO)
{
	npc				= BAU_954_Maleth;
	nr				= 900;
	condition		= DIA_Maleth_PICKPOCKET_Condition;
	information		= DIA_Maleth_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Maleth_PICKPOCKET_Condition()
{
	C_Beklauen(10, 10);
};

func void DIA_Maleth_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Maleth_PICKPOCKET);
	Info_AddChoice(DIA_Maleth_PICKPOCKET, DIALOG_BACK, DIA_Maleth_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Maleth_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Maleth_PICKPOCKET_DoIt);
};

func void DIA_Maleth_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Maleth_PICKPOCKET);
};

func void DIA_Maleth_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Maleth_PICKPOCKET);
};
