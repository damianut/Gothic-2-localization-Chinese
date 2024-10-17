//***********************************************************************
//	Info EXIT
//***********************************************************************
instance DIA_Agon_EXIT(C_INFO)
{
	npc				= NOV_603_Agon;
	nr				= 999;
	condition		= DIA_Agon_EXIT_Condition;
	information		= DIA_Agon_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Agon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Agon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//************************************************************************
//			Hello
//************************************************************************
instance DIA_Agon_Hello(C_INFO)
{
	npc				= NOV_603_Agon;
	nr				= 2;
	condition		= DIA_Agon_Hello_Condition;
	information		= DIA_Agon_Hello_Info;
	important		= TRUE;
};

func int DIA_Agon_Hello_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (MIS_SCHNITZELJAGD == FALSE)
	&& (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Agon_Hello_Info()
{
	AI_Output(self, other, "DIA_Agon_Hello_07_00"); //（ 轻 蔑 的 ） 你 想 要 什 么 ？
};

// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
instance DIA_Agon_Wurst(C_INFO)
{
	npc				= NOV_603_Agon;
	nr				= 2;
	condition		= DIA_Agon_Wurst_Condition;
	information		= DIA_Agon_Wurst_Info;
	description		= "给 你 ， 我 这 里 有 给 你 的 羊 肉 香 肠 。";
};

func int DIA_Agon_Wurst_Condition()
{
	if ((Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems(self, ItFo_SchafsWurst) == 0)
	&& (Npc_HasItems(other, ItFo_SchafsWurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Agon_Wurst_Info()
{
	AI_Output(other, self, "DIA_Agon_Wurst_15_00"); //给 你 ， 我 这 里 有 给 你 的 羊 肉 香 肠 。
	AI_Output(self, other, "DIA_Agon_Wurst_07_01"); //绵 羊 香 肠 ， 绵 羊 奶 酪 … … 绵 羊 奶 … … 我 连 看 一 眼 都 感 觉 无 法 忍 受 。
	AI_Output(other, self, "DIA_Agon_Wurst_15_02"); //那 你 还 要 不 要 香 肠 ？
	AI_Output(self, other, "DIA_Agon_Wurst_07_03"); //哦 ， 马 上 给 我 ！

	B_GiveInvItems(other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben + 1);

	CreateInvItems(self, ITFO_Sausage, 1);
	B_UseItem(self, ITFO_Sausage);

	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString(13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};

//***********************************************************************
//	Ich bin Neu hier.
//***********************************************************************
instance DIA_Agon_New(C_INFO)
{
	npc				= NOV_603_Agon;
	nr				= 1;
	condition		= DIA_Agon_New_Condition;
	information		= DIA_Agon_New_Info;
	description		= "我 是 新 来 的";
};

func int DIA_Agon_New_Condition()
{
	if ((MIS_SCHNITZELJAGD == FALSE)
	&& (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Agon_New_Info()
{
	AI_Output(other, self, "DIA_Agon_New_15_00"); //我 是 新 来 的。
	AI_Output(self, other, "DIA_Agon_New_07_01"); //我 明 白 了 。
	AI_Output(self, other, "DIA_Agon_New_07_02"); //如 果 你 还 没 有 工 作 的 话 ， 去 找 帕 兰 。 他 会 指 派 给 你 的 。
};

//***********************************************************************
//	Was ist zwischen dir und Babo passiert?
//***********************************************************************
instance DIA_Agon_YouAndBabo(C_INFO)
{
	npc				= NOV_603_Agon;
	nr				= 1;
	condition		= DIA_Agon_YouAndBabo_Condition;
	information		= DIA_Agon_YouAndBabo_Info;
	description		= "你 和 白 波 之 间 发 生 了 什 么 事 ？";
};

func int DIA_Agon_YouAndBabo_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Opolos_Monastery)
	&& (MIS_SCHNITZELJAGD == FALSE))
	&& (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Agon_YouAndBabo_Info()
{
	AI_Output(other, self, "DIA_Agon_YouAndBabo_15_00"); //你 和 白 波 之 间 发 生 了 什 么 事 ？
	AI_Output(self, other, "DIA_Agon_YouAndBabo_07_01"); //你 不 要 听 到 什 么 都 相 信 。
	AI_Output(self, other, "DIA_Agon_YouAndBabo_07_02"); //（ 坚 持 的 ） 我 们 直 接 说 吧 ： 我 要 按 我 的 路 走 。 这 是 英 诺 斯 为 我 预 定 的 路 。
	AI_Output(self, other, "DIA_Agon_YouAndBabo_07_03"); //（ 坚 持 的 ） 我 们 直 接 说 吧 ： 我 要 按 我 的 路 走 。 这 是 英 诺 斯 为 我 预 定 的 路 。

	Info_ClearChoices(DIA_Agon_YouAndBabo);
	Info_AddChoice(DIA_Agon_YouAndBabo, "我 们 这 些 新 信 徒 不 是 团 结 在 一 起 吗 ？", DIA_Agon_YouAndBabo_AllTogether);
	Info_AddChoice(DIA_Agon_YouAndBabo, "只 有 英 诺 斯 知 道 我 们 应 该 走 那 条 路 。", DIA_Agon_YouAndBabo_InnosWay);
	Info_AddChoice(DIA_Agon_YouAndBabo, "我 们 应 该 和 平 相 处 。", DIA_Agon_YouAndBabo_Understand);
};

func void DIA_Agon_YouAndBabo_AllTogether()
{
	AI_Output(other, self, "DIA_Agon_YouAndBabo_AllTogether_15_00"); //我 们 这 些 新 信 徒 不 是 团 结 在 一 起 吗 ？
	AI_Output(self, other, "DIA_Agon_YouAndBabo_AllTogether_07_01"); //你 们 剩 下 的 人 可 以 随 便 互 相 支 持 。
	AI_Output(self, other, "DIA_Agon_YouAndBabo_AllTogether_07_02"); //但 是 ， 请 不 要 挡 我 的 路 。 （ 冷 酷 ） 没 人 能 挡 我 的 路 。

	Info_ClearChoices(DIA_Agon_YouAndBabo);
};

func void DIA_Agon_YouAndBabo_InnosWay()
{
	AI_Output(other, self, "DIA_Agon_YouAndBabo_InnosWay_15_00"); //只 有 英 诺 斯 知 道 我 们 应 该 走 那 条 路 。
	AI_Output(self, other, "DIA_Agon_YouAndBabo_InnosWay_07_01"); //我 的 家 庭 一 直 深 受 英 诺 斯 的 眷 爱 ， 那 永 远 不 会 改 变 。

	Info_ClearChoices(DIA_Agon_YouAndBabo);
};

func void DIA_Agon_YouAndBabo_Understand()
{
	AI_Output(other, self, "DIA_Agon_YouAndBabo_Understand_15_00"); //我 们 应 该 和 平 相 处 。
	AI_Output(self, other, "DIA_Agon_YouAndBabo_Understand_07_01"); //我 希 望 如 此 。 一 旦 我 成 为 魔 法 师 ， 我 会 为 你 说 好 话 的 。

	Info_ClearChoices(DIA_Agon_YouAndBabo);
};

//************************************************************************
//	Kann ich bei dir Kräuter bekommen?
//************************************************************************
instance DIA_Agon_GetHerb(C_INFO)
{
	npc				= NOV_603_Agon;
	nr				= 1;
	condition		= DIA_Agon_GetHerb_Condition;
	information		= DIA_Agon_GetHerb_Info;
	permanent		= TRUE;
	description		= "你 在 这 里 种 什 么 ？";
};

func int DIA_Agon_GetHerb_Condition()
{
	if (MIS_SCHNITZELJAGD == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Agon_GetHerb_Info()
{
	AI_Output(other, self, "DIA_Agon_GetHerb_15_00"); //你 在 这 里 种 什 么 ？
	AI_Output(self, other, "DIA_Agon_GetHerb_07_01"); //我 们 打 算 种 植 治 疗 植 物 ， 那 样 大 师 尼 欧 莱 斯 可 以 用 它 们 酿 造 药 剂 。
};

//************************************************************************
//	Agon ist in der Höhle
//************************************************************************
instance DIA_Agon_GolemDead(C_INFO)
{
	npc				= NOV_603_Agon;
	nr				= 1;
	condition		= DIA_Agon_GolemDead_Condition;
	information		= DIA_Agon_GolemDead_Info;
	important		= TRUE;
};

func int DIA_Agon_GolemDead_Condition()
{
	if ((MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (Npc_IsDead(Magic_Golem)))
	{
		return TRUE;
	};
};

func void DIA_Agon_GolemDead_Info()
{
	AI_Output(self, other, "DIA_Agon_GolemDead_07_00"); //（ 得 意 洋 洋 ） 你 太 晚 了 ！
	AI_Output(self, other, "DIA_Agon_GolemDead_07_01"); //我 先 到 这 里 的 ！ 我 已 经 赢 了 ！

	Info_ClearChoices(DIA_Agon_GolemDead);
	Info_AddChoice(DIA_Agon_GolemDead, "（ 恐 吓 ） 除 非 你 能 活 着 离 开 这 里 。！", DIA_Agon_GolemDead_NoWay);
	Info_AddChoice(DIA_Agon_GolemDead, "闭 嘴 ！", DIA_Agon_GolemDead_ShutUp);
	Info_AddChoice(DIA_Agon_GolemDead, "祝 贺 你 ， 你 这 是 理 所 当 然 的 。", DIA_Agon_GolemDead_Congrat);
};

func void DIA_Agon_GolemDead_NoWay()
{
	AI_Output(other, self, "DIA_Agon_GolemDead_NoWay_15_00"); //（ 恐 吓 ） 除 非 你 能 活 着 离 开 这 里 。
	AI_Output(self, other, "DIA_Agon_GolemDead_NoWay_07_01"); //你 想 杀 了 我 ？ 你 永 远 也 不 会 成 功 。

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_Agon_GolemDead_ShutUp()
{
	AI_Output(other, self, "DIA_Agon_GolemDead_ShutUp_15_00"); //闭 嘴 ！
	AI_Output(self, other, "DIA_Agon_GolemDead_ShutUp_07_01"); //（ 嘲 弄 的 ） 没 有 希 望 ， 你 已 经 失 败 了 ！ 你 承 认 吧 。
	AI_Output(self, other, "DIA_Agon_GolemDead_ShutUp_07_02"); //只 有 我 才 注 定 成 为 一 名 魔 法 师 。

	Info_ClearChoices(DIA_Agon_GolemDead);
	Info_AddChoice(DIA_Agon_GolemDead, "运 气 来 了 。 这 个 箱 子 是 我 的 。", DIA_Agon_GolemDead_ShutUp_MyChest);
	Info_AddChoice(DIA_Agon_GolemDead, "你 赢 了 。", DIA_Agon_GolemDead_ShutUp_YouWin);
};

func void DIA_Agon_GolemDead_ShutUp_MyChest()
{
	AI_Output(other, self, "DIA_Agon_GolemDead_ShutUp_MyChest_15_00"); //运 气 来 了 。 这 个 箱 子 是 我 的 。
	AI_Output(self, other, "DIA_Agon_GolemDead_ShutUp_MyChest_07_01"); //（ 狂 怒 ） 不 ， 你 不 能 那 么 做 ， 我 要 先 杀 了 你 。

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_Agon_GolemDead_ShutUp_YouWin()
{
	AI_Output(other, self, "DIA_Agon_GolemDead_ShutUp_YouWin_15_00"); //你 赢 了 。
	AI_Output(self, other, "DIA_Agon_GolemDead_ShutUp_YouWin_07_01"); //（ 狂 怒 ） 不 ， 你 骗 不 了 我 。 你 想 除 掉 我 。
	AI_Output(self, other, "DIA_Agon_GolemDead_ShutUp_YouWin_07_02"); //我 要 防 止 那 种 事 发 生 ！

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_Agon_GolemDead_Congrat()
{
	AI_Output(other, self, "DIA_Agon_GolemDead_Congrat_15_00"); //祝 贺 你 ， 你 这 是 理 所 当 然 的 。
	AI_Output(self, other, "DIA_Agon_GolemDead_Congrat_07_01"); //（ 不 信 任 的 ） 那 是 什 么 意 思 ？ 你 有 什 么 打 算 ？
	AI_Output(other, self, "DIA_Agon_GolemDead_Congrat_15_02"); //你 在 说 什 么 ？
	AI_Output(self, other, "DIA_Agon_GolemDead_Congrat_07_03"); //（ 不 安 的 ） 你 想 要 抢 走 我 的 胜 利 果 实 。 你 想 要 杀 死 我 ， 然 后 把 所 有 的 荣 誉 据 为 己 有 ！
	AI_Output(self, other, "DIA_Agon_GolemDead_Congrat_07_04"); //你 永 远 不 会 成 功 的！

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

//****************************************
//	Der Sc war vor Agon in der Höhle
//****************************************
instance DIA_Agon_GolemLives(C_INFO)
{
	npc				= NOV_603_Agon;
	nr				= 1;
	condition		= DIA_Agon_GolemLives_Condition;
	information		= DIA_Agon_GolemLives_Info;
	important		= TRUE;
};

func int DIA_Agon_GolemLives_Condition()
{
	if ((MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (Npc_IsDead(Magic_Golem) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Agon_GolemLives_Info()
{
	AI_Output(self, other, "DIA_Agon_GolemLives_07_00"); //（ 感 到 惊 讶 ） 你 在 我 之 前 找 到 了 隐 藏 的 地 点 。 那 不 可 能 …
	AI_Output(self, other, "DIA_Agon_GolemLives_07_01"); //（ 下 定 决 心 ） 那 一 定 不 行 ！ 我 不 允 许 那 样 。
	AI_Output(self, other, "DIA_Agon_GolemLives_07_02"); //他 们 甚 至 连 你 的 尸 体 也 找 不 到 。

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 0);
};

//****************************************
//	Sc hat Agon am Leben gelassen
//****************************************
/*
instance DIA_Agon_StillAlive(C_INFO)
{
	npc				= NOV_603_Agon;
	nr				= 1;
	condition		= DIA_Agon_StillAlive_Condition;
	information		= DIA_Agon_StillAlive_Info;
	permanent		= TRUE;
	description		= "Was machst Du hier?";
};

func int DIA_Agon_StillAlive_Condition()
{
	if ((Kapitel >= 2)
	&& (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Agon_StillAlive_Info()
{
	AI_Output(other, self, "DIA_Agon_StillAlive_15_00"); //Was machst Du hier?
	AI_Output(self, other, "DIA_Agon_StillAlive_07_01"); //Hättest Du mich nicht töten können? Dann müsste ich das ganze hier wenigstens nicht mehr ertragen.
	AI_Output(self, other, "DIA_Agon_StillAlive_07_02"); //Jetzt lass mich in Ruhe! Geh zurück ins Kloster!

	AI_StopProcessInfos(self);
};

*/
//***********************************************************************
// Perm
//***********************************************************************
instance DIA_Agon_Perm(C_INFO)
{
	npc				= NOV_603_Agon;
	nr				= 2;
	condition		= DIA_Agon_Perm_Condition;
	information		= DIA_Agon_Perm_Info;
	permanent		= TRUE;
	description		= "那 最 近 怎 么 样 ？";
};

func int DIA_Agon_Perm_Condition()
{
	if ((Kapitel >= 3)
	&& (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Agon_Perm_Info()
{
	AI_Output(other, self, "DIA_Agon_Perm_15_00"); //那 么 进 行 的 怎 么 样 了 ？

	if (other.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_Agon_Perm_07_01"); //哦 - 谢 谢 你 的 关 心 ， 圣 骑 士 阁 下 。 我 喜 欢 工 作 ， 而 我 一 定 很 快 就 会 被 选 中 成 为 魔 法 师 。
	}
	else
	{
		AI_Output(self, other, "DIA_Agon_Perm_07_02"); //（ 傲 慢 的 ） 你 只 是 英 诺 斯 的 修 道 院 的 一 个 游 客 。 因 此 你 要 按 规 定 行 动 ， 并 且 不 要 在 我 工 作 的 时 候 打 扰 我 。 日 安 。
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Agon_PICKPOCKET(C_INFO)
{
	npc				= NOV_603_Agon;
	nr				= 900;
	condition		= DIA_Agon_PICKPOCKET_Condition;
	information		= DIA_Agon_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Agon_PICKPOCKET_Condition()
{
	C_Beklauen(23, 12);
};

func void DIA_Agon_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Agon_PICKPOCKET);
	Info_AddChoice(DIA_Agon_PICKPOCKET, DIALOG_BACK, DIA_Agon_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Agon_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Agon_PICKPOCKET_DoIt);
};

func void DIA_Agon_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Agon_PICKPOCKET);
};

func void DIA_Agon_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Agon_PICKPOCKET);
};
