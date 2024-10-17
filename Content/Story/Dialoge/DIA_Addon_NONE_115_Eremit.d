// ********************************************************
// 							EXIT
// ********************************************************
instance DIA_Addon_Eremit_EXIT(C_INFO)
{
	npc				= NONE_ADDON_115_Eremit;
	nr				= 999;
	condition		= DIA_Addon_Eremit_EXIT_Condition;
	information		= DIA_Addon_Eremit_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Eremit_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Eremit_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ********************************************************
// 							Hallo
// ********************************************************
instance DIA_Addon_Eremit_Hello(C_INFO)
{
	npc				= NONE_ADDON_115_Eremit;
	nr				= 1;
	condition		= DIA_Addon_Eremit_Hello_Condition;
	information		= DIA_Addon_Eremit_Hello_Info;
	important		= TRUE;
};

func int DIA_Addon_Eremit_Hello_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Eremit_Hello_Info()
{
	AI_Output(other, self, "DIA_Addon_Eremit_Add_15_00"); //（ 吃 惊 的 ） 你 在 这 里 做 什 么?
	AI_Output(self, other, "DIA_Addon_Eremit_Add_04_00"); //我 在 这 里 做 什 么 ？ ！ 你 到 底 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Addon_Eremit_Add_04_01"); //我 来 到 这 个 岛 上 最 偏 僻 的 地 方 ， 是 因 为 我 最 后 想 得 到 一 些 安 宁 ！
	AI_Output(self, other, "DIA_Addon_Eremit_Add_04_02"); //内 战 、 强 盗 突 袭 、 我 房 门 外 面 的 兽 人 … …
	AI_Output(self, other, "DIA_Addon_Eremit_Add_04_03"); //那 都 不 关 我 的 事 了 ， 我 已 经 从 躲 开 了 那 些 疯 狂 的 事 情 。
	AI_Output(self, other, "DIA_Addon_Eremit_Add_04_04"); //这 里 可 能 有 兽 人 ， 但 是 不 太 多 。
	AI_Output(self, other, "DIA_Addon_Eremit_Add_04_05"); //而 其 它 人 - 感 谢 英 诺 斯 - 从 来 没 在 这 里 出 现 过 。 （ 粗 暴 的 ） 直 到 今 天 。
};

// ********************************************************
// 					Suche Steintafeln
// ********************************************************
instance DIA_Addon_Eremit_SeekTafeln(C_INFO)
{
	npc				= NONE_ADDON_115_Eremit;
	nr				= 2;
	condition		= DIA_Addon_Eremit_SeekTafeln_Condition;
	information		= DIA_Addon_Eremit_SeekTafeln_Info;
	description		= "我 在 寻 找 一 些 石 片 … …";
};

func int DIA_Addon_Eremit_SeekTafeln_Condition()
{
	return TRUE;
};

func void DIA_Addon_Eremit_SeekTafeln_Info()
{
	AI_Output(other, self, "DIA_Addon_Eremit_Add_15_02"); //我 在 寻 找 石 片 。 你 不 会 刚 好 有 一 块 吧 ？
	AI_Output(self, other, "DIA_Addon_Eremit_Add_04_06"); //（ 小 心 的 ） 是 的 … … 但 是 我 要 留 着 它 们 ！
	AI_Output(self, other, "DIA_Addon_Eremit_Add_04_07"); //它 们 是 这 里 唯 一 可 以 阅 读 的 东 西 。
	AI_Output(self, other, "DIA_Addon_Eremit_Add_04_08"); //我 也 许 还 不 能 完 全 理 解 他 们 ， 但 是 我 已 经 能 解 释 一 些 文 字 了 。
};

// ********************************************************
// 				Wegen Steintafeln - TEACH
// ********************************************************
var int Eremit_Teach_Once;
// --------------------------------------------------------
instance DIA_Addon_Eremit_Teach(C_INFO)
{
	npc				= NONE_ADDON_115_Eremit;
	nr				= 3;
	condition		= DIA_Addon_Eremit_Teach_Condition;
	information		= DIA_Addon_Eremit_Teach_Info;
	permanent		= TRUE;
	description		= "关 于 石 片 … …";
};

func int DIA_Addon_Eremit_Teach_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Eremit_SeekTafeln))
	&& (Eremit_Teach_Once == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Eremit_Teach_Info()
{
	AI_Output(other, self, "DIA_Addon_Eremit_Add_15_03"); //关 于 石 片 … …
	AI_Output(self, other, "DIA_Addon_Eremit_Add_04_25"); //要 我 教 你 阅 读 它 们 吗 ？
	if (MIS_Eremit_Klamotten != LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Addon_Eremit_Add_04_26"); //（ 匆 忙 的 ） 但 是 你 不 能 拿 走 我 的 ！ 你 必 须 去 找 你 自 己 的 ！
	};

	Info_ClearChoices(DIA_Addon_Eremit_Teach);
	Info_AddChoice(DIA_Addon_Eremit_Teach, DIALOG_BACK, DIA_Addon_Eremit_Teach_No);

	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Eremit_Teach, B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_1, B_GetLearnCostTalent(other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_1)), DIA_Addon_Eremit_Teach_Yes);
	}
	else if ((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
	{
		Info_AddChoice(DIA_Addon_Eremit_Teach, B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_2, B_GetLearnCostTalent(other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_2)), DIA_Addon_Eremit_Teach_Yes);
	}
	else if ((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE))
	{
		Info_AddChoice(DIA_Addon_Eremit_Teach, B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_3, B_GetLearnCostTalent(other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_3)), DIA_Addon_Eremit_Teach_Yes);
	};
};

// ---------------------------------------------------------------
func void B_Addon_Eremit_TeachLanguage()
{
	AI_Output(self, other, "DIA_Addon_Eremit_Add_04_27"); //嗯 ， 这 非 常 简 单 。G是O，T是H，I是C。
	AI_Output(self, other, "DIA_Addon_Eremit_Add_04_28"); //如 果 你 能 理 解 那 个 ， 其 余 的 就 非 常 合 乎 逻 辑 … …

	/*

	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	{
		PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] = TRUE;
	}
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] = TRUE;
	}
	else
	{
		PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] = TRUE;
	};

		*/

	Eremit_Teach_Once = TRUE;
};

// ---------------------------------------------------------------
func void DIA_Addon_Eremit_Teach_No()
{
	Info_ClearChoices(DIA_Addon_Eremit_Teach);
};

func void DIA_Addon_Eremit_Teach_Yes()
{
	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_Eremit_Add_04_29"); //我 不 认 为 还 能 再 教 你 什 么 了 。
		Eremit_Teach_Once = TRUE;
	}
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	{
		if (B_TeachPlayerTalentForeignLanguage(self, other, LANGUAGE_3))
		{
			B_Addon_Eremit_TeachLanguage();
		};
	}
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		if (B_TeachPlayerTalentForeignLanguage(self, other, LANGUAGE_2))
		{
			B_Addon_Eremit_TeachLanguage();
		};
	}
	else // Keine Language
	{
		if (B_TeachPlayerTalentForeignLanguage(self, other, LANGUAGE_1))
		{
			B_Addon_Eremit_TeachLanguage();
		};
	};
};

// ********************************************************
// 					Klamotten geben
// ********************************************************
instance DIA_Addon_Eremit_Klamotten(C_INFO)
{
	npc				= NONE_ADDON_115_Eremit;
	nr				= 4;
	condition		= DIA_Addon_Eremit_Klamotten_Condition;
	information		= DIA_Addon_Eremit_Klamotten_Info;
	permanent		= TRUE;
	description		= "我 有 一 些 衣 服 给 你 … …";
};

func int DIA_Addon_Eremit_Klamotten_Condition()
{
	if (MIS_Eremit_Klamotten == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Eremit_Klamotten_Info()
{
	AI_Output(other, self, "DIA_Addon_Eremit_Add_15_01"); //我 有 一 些 衣 服 给 你 … …
	AI_Output(self, other, "DIA_Addon_Eremit_Add_04_19"); //真 的 吗 ？ 给 我 看 看 ， 我 看 看 衣 服 是 否 合 身 ！

	Info_ClearChoices(DIA_Addon_Eremit_Klamotten);
	Info_AddChoice(DIA_Addon_Eremit_Klamotten, DIALOG_BACK, DIA_Addon_Eremit_Klamotten_BACK);
	if (Npc_HasItems(other, ITAR_PIR_L_Addon) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 轻 型 海 盗 盔 甲", DIA_Addon_Eremit_Klamotten_PIR_L);
	};

	if (Npc_HasItems(other, ITAR_PIR_M_Addon) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 中 型 海 盗 盔 甲", DIA_Addon_Eremit_Klamotten_PIR_M);
	};

	if (Npc_HasItems(other, ITAR_PIR_H_Addon) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 海 盗 船 长 的 盔 甲", DIA_Addon_Eremit_Klamotten_PIR_H);
	};

	// if(Npc_HasItems(other, ITAR_Thorus_Addon) > 0)
	// {
	//	Info_AddChoice(DIA_Addon_Eremit_Klamotten, "Gardistenrüstung geben", DIA_Addon_Eremit_Klamotten_Thorus);
	// };
	// if(Npc_HasItems(other, ITAR_OreBaron_Addon) > 0)
	// {
	//	Info_AddChoice(DIA_Addon_Eremit_Klamotten, "Erzbaronrüstung geben", DIA_Addon_Eremit_Klamotten_OreBaron);
	// };
	// if(Npc_HasItems(other, ITAR_Bloodwyn_Addon) > 0)
	// {
	//	Info_AddChoice(DIA_Addon_Eremit_Klamotten, "Bloodwyn's Rüstung geben", DIA_Addon_Eremit_Klamotten_Bloodwyn);
	// };
	// if(Npc_HasItems(other, ITAR_Raven_Addon) > 0)
	// {
	//	Info_AddChoice(DIA_Addon_Eremit_Klamotten, "Raven's Rüstung geben", DIA_Addon_Eremit_Klamotten_Raven);
	// };
	if (Npc_HasItems(other, ITAR_RANGER_Addon) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 水 之 环 盔 甲", DIA_Addon_Eremit_Klamotten_Ranger);
	};

	if (Npc_HasItems(other, ITAR_KDW_L_Addon) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 轻 型 水 之 环 长 袍", DIA_Addon_Eremit_Klamotten_KDW_L);
	};

	if (Npc_HasItems(other, ITAR_KDW_H) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 高 阶 水 之 环 长 袍", DIA_Addon_Eremit_Klamotten_KDW_H);
	};

	if (Npc_HasItems(other, ITAR_Governor) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 统 治 者 的 紧 身 上 衣", DIA_Addon_Eremit_Klamotten_Governor);
	};

	if (Npc_HasItems(other, ITAR_JUDGE) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 法 官 长 袍", DIA_Addon_Eremit_Klamotten_Judge);
	};

	if (Npc_HasItems(other, ITAR_SMITH) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 铁 匠 的 围 裙", DIA_Addon_Eremit_Klamotten_Smith);
	};

	if (Npc_HasItems(other, ITAR_BARKEEPER) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 房 东 的 围 裙", DIA_Addon_Eremit_Klamotten_Barkeeper);
	};

	if (Npc_HasItems(other, ITAR_VLK_L) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 市 民 的 衣 服 Ｉ", DIA_Addon_Eremit_Klamotten_VLK_L);
	};

	if (Npc_HasItems(other, ITAR_VLK_M) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 市 民 的 衣 服 Ｉ Ｉ", DIA_Addon_Eremit_Klamotten_VLK_M);
	};

	if (Npc_HasItems(other, ITAR_VLK_H) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 市 民 的 衣 服 Ｉ Ｉ Ｉ", DIA_Addon_Eremit_Klamotten_VLK_H);
	};

	if (Npc_HasItems(other, ITAR_VlkBabe_L) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 市 民 服 装 Ｉ", DIA_Addon_Eremit_Klamotten_VlkBabe_L);
	};

	if (Npc_HasItems(other, ITAR_VlkBabe_M) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 市 民 服 装 Ｉ Ｉ", DIA_Addon_Eremit_Klamotten_VlkBabe_M);
	};

	if (Npc_HasItems(other, ITAR_VlkBabe_H) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 市 民 服 装 Ｉ Ｉ Ｉ", DIA_Addon_Eremit_Klamotten_VlkBabe_H);
	};

	/*
	if (Npc_HasItems(other, ITAR_MIL_L) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "Leichte Milizrüstung geben", DIA_Addon_Eremit_Klamotten_MIL_L);
	};

	if (Npc_HasItems(other, ITAR_MIL_M) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "Mittlere Milizrüstung geben", DIA_Addon_Eremit_Klamotten_MIL_M);
	};

	if (Npc_HasItems(other, ITAR_PAL_M) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "Mittlere Paladinrüstung geben", DIA_Addon_Eremit_Klamotten_PAL_M);
	};

	if (Npc_HasItems(other, ITAR_PAL_H) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "Schwere Paladinrüstung geben", DIA_Addon_Eremit_Klamotten_PAL_H);
	};

	*/
	if (Npc_HasItems(other, ITAR_PAL_SKEL) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 风 化 的 圣 骑 士 的 盔 甲", DIA_Addon_Eremit_Klamotten_PAL_SKEL);
	};

	if (Npc_HasItems(other, ITAR_BAU_L) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 轻 型 农 民 的 衣 服", DIA_Addon_Eremit_Klamotten_BAU_L);
	};

	if (Npc_HasItems(other, ITAR_BAU_M) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 中 型 农 民 的 衣 服", DIA_Addon_Eremit_Klamotten_BAU_M);
	};

	if (Npc_HasItems(other, ITAR_BauBabe_L) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 轻 型 农 民 的 服 装", DIA_Addon_Eremit_Klamotten_BauBabe_L);
	};

	if (Npc_HasItems(other, ITAR_BauBabe_M) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 中 型 农 民 的 服 装", DIA_Addon_Eremit_Klamotten_BauBabe_M);
	};

	/*
	if (Npc_HasItems(other, ITAR_SLD_L) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "Leichte Söldnerrüstung geben", DIA_Addon_Eremit_Klamotten_SLD_L);
	};

	if (Npc_HasItems(other, ITAR_SLD_M) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "Mittlere Söldnerrüstung geben", DIA_Addon_Eremit_Klamotten_SLD_M);
	};

	if (Npc_HasItems(other, ITAR_SLD_H) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "Schwere Söldnerrüstung geben", DIA_Addon_Eremit_Klamotten_SLD_H);
	};

	*/
	if (Npc_HasItems(other, ITAR_DJG_Crawler) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 爬 行 者 盔 甲", DIA_Addon_Eremit_Klamotten_DJG_Crawler);
	};

	/*
	if (Npc_HasItems(other, ITAR_DJG_L) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "Leichte Drachenjägerrüstung geben", DIA_Addon_Eremit_Klamotten_DJG_L);
	};

	if (Npc_HasItems(other, ITAR_DJG_M) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "Mittlere Drachenjägerrüstung geben", DIA_Addon_Eremit_Klamotten_DJG_M);
	};

	if (Npc_HasItems(other, ITAR_DJG_H) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "Schwere Drachenjägerrüstung geben", DIA_Addon_Eremit_Klamotten_DJG_H);
	};

	if (Npc_HasItems(other, ITAR_NOV_L) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "Novizenrobe geben", DIA_Addon_Eremit_Klamotten_Nov_L);
	};

	if (Npc_HasItems(other, ITAR_KDF_L) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "Leichte Robe des Feuers geben", DIA_Addon_Eremit_Klamotten_KdF_L);
	};

	if (Npc_HasItems(other, ITAR_KDF_H) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "Schwere Robe des Feuers geben", DIA_Addon_Eremit_Klamotten_KdF_H);
	};

	*/
	if (Npc_HasItems(other, ITAR_Leather_L) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 皮 甲", DIA_Addon_Eremit_Klamotten_Leather);
	};

	// if(Npc_HasItems(other, ITAR_BDT_M) > 0)
	// {
	//	Info_AddChoice(DIA_Addon_Eremit_Klamotten, "Mittlere Banditenrüstung geben", DIA_Addon_Eremit_Klamotten_BDT_M);
	// };
	// if(Npc_HasItems(other, ITAR_BDT_H) > 0)
	// {
	//	Info_AddChoice(DIA_Addon_Eremit_Klamotten, "Schwere Banditenrüstung geben", DIA_Addon_Eremit_Klamotten_BDT_H);
	// };
	if (Npc_HasItems(other, ITAR_XARDAS) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 黑 暗 艺 术 长 袍", DIA_Addon_Eremit_Klamotten_Xardas);
	};

	if (Npc_HasItems(other, ITAR_Lester) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 莱 斯 特 的 长 袍", DIA_Addon_Eremit_Klamotten_Lester);
	};

	if (Npc_HasItems(other, ITAR_Diego) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 迪 雅 戈 的 盔 甲", DIA_Addon_Eremit_Klamotten_Diego);
	};

	if (Npc_HasItems(other, ITAR_CorAngar) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 科 尔 · 安 加 的 盔 甲", DIA_Addon_Eremit_Klamotten_CorAngar);
	};

	if (Npc_HasItems(other, ITAR_Prisoner) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 挖 掘 者 裤 子", DIA_Addon_Eremit_Klamotten_Prisoner);
	};

	if (Npc_HasItems(other, ITAR_Dementor) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, "给 出 搜 索 者 长 袍", DIA_Addon_Eremit_Klamotten_Dementor);
	};
};

// -------------------------------------------------------------
func void B_Eremit_Tatsache()
{
	AI_EquipBestArmor(self);
	AI_Output(self, other, "DIA_Addon_Eremit_Add_04_20"); //它 们 真 的 是 ！
	AI_Output(self, other, "DIA_Addon_Eremit_Add_04_21"); //嗯 ， 现 在 我 要 做 什 么 ？ 我 所 有 的 钱 都 在 通 过 海 盗 那 里 时 给 他 们 了 。
	AI_Output(self, other, "DIA_Addon_Eremit_Add_04_22"); //我 能 给 你 的 只 是 一 堆 旧 石 片 。
	AI_Output(self, other, "DIA_Addon_Eremit_Add_04_23"); //给 ， 拿 上 它 们 ， 没 问 题 。 我 会 再 去 找 一 些 新 的 。

	B_GiveInvItems(self, other, ItWr_DexStonePlate3_Addon, 1);
	B_GiveInvItems(self, other, ItWr_StonePlateCommon_Addon, 1);

	MIS_Eremit_Klamotten = LOG_SUCCESS;
	B_GivePlayerXP(200);

	Info_ClearChoices(DIA_Addon_Eremit_Klamotten);
};

// -------------------------------------------------------------

func void DIA_Addon_Eremit_Klamotten_BACK()
{
	AI_Output(self, other, "DIA_Addon_Eremit_Add_04_24"); //哦 ， 棒 极 了 。 你 先 让 我 激 动 万 分 ， 然 后 … … （ 叹 息 ）
	Info_ClearChoices(DIA_Addon_Eremit_Klamotten);
};

func void DIA_Addon_Eremit_Klamotten_PIR_L()
{
	B_GiveInvItems(other, self, ITAR_PIR_L_Addon, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_PIR_M()
{
	B_GiveInvItems(other, self, ITAR_PIR_M_Addon, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_PIR_H()
{
	B_GiveInvItems(other, self, ITAR_PIR_H_Addon, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_Thorus()
{
	B_GiveInvItems(other, self, ITAR_Thorus_Addon, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_OreBaron()
{
	B_GiveInvItems(other, self, ITAR_OreBaron_Addon, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_Bloodwyn()
{
	B_GiveInvItems(other, self, ITAR_Bloodwyn_Addon, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_Raven()
{
	B_GiveInvItems(other, self, ITAR_Raven_Addon, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_Ranger()
{
	B_GiveInvItems(other, self, ITAR_RANGER_Addon, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_KDW_L()
{
	B_GiveInvItems(other, self, ITAR_KDW_L_Addon, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_KDW_H()
{
	B_GiveInvItems(other, self, ITAR_KDW_H, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_Governor()
{
	B_GiveInvItems(other, self, ITAR_Governor, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_Judge()
{
	B_GiveInvItems(other, self, ITAR_JUDGE, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_Smith()
{
	B_GiveInvItems(other, self, ITAR_SMITH, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_Barkeeper()
{
	B_GiveInvItems(other, self, ITAR_BARKEEPER, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_VLK_L()
{
	B_GiveInvItems(other, self, ITAR_VLK_L, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_VLK_M()
{
	B_GiveInvItems(other, self, ITAR_VLK_M, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_VLK_H()
{
	B_GiveInvItems(other, self, ITAR_VLK_H, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_VlkBabe_L()
{
	B_GiveInvItems(other, self, ITAR_VlkBabe_L, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_VlkBabe_M()
{
	B_GiveInvItems(other, self, ITAR_VlkBabe_M, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_VlkBabe_H()
{
	B_GiveInvItems(other, self, ITAR_VlkBabe_H, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_MIL_L()
{
	B_GiveInvItems(other, self, ITAR_MIL_L, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_MIL_M()
{
	B_GiveInvItems(other, self, ITAR_MIL_M, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_PAL_M()
{
	B_GiveInvItems(other, self, ITAR_PAL_M, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_PAL_H()
{
	B_GiveInvItems(other, self, ITAR_PAL_H, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_PAL_SKEL()
{
	B_GiveInvItems(other, self, ITAR_PAL_SKEL, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_BAU_L()
{
	B_GiveInvItems(other, self, ITAR_BAU_L, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_BAU_M()
{
	B_GiveInvItems(other, self, ITAR_BAU_M, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_BauBabe_L()
{
	B_GiveInvItems(other, self, ITAR_BauBabe_L, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_BauBabe_M()
{
	B_GiveInvItems(other, self, ITAR_BauBabe_M, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_SLD_L()
{
	B_GiveInvItems(other, self, ITAR_SLD_L, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_SLD_M()
{
	B_GiveInvItems(other, self, ITAR_SLD_M, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_SLD_H()
{
	B_GiveInvItems(other, self, ITAR_SLD_H, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_DJG_Crawler()
{
	B_GiveInvItems(other, self, ITAR_DJG_Crawler, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_DJG_L()
{
	B_GiveInvItems(other, self, ITAR_DJG_L, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_DJG_M()
{
	B_GiveInvItems(other, self, ITAR_DJG_M, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_DJG_H()
{
	B_GiveInvItems(other, self, ITAR_DJG_H, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_Nov_L()
{
	B_GiveInvItems(other, self, ITAR_NOV_L, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_KdF_L()
{
	B_GiveInvItems(other, self, ITAR_KDF_L, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_KdF_H()
{
	B_GiveInvItems(other, self, ITAR_KDF_H, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_Leather()
{
	B_GiveInvItems(other, self, ITAR_Leather_L, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_BDT_M()
{
	B_GiveInvItems(other, self, ITAR_BDT_M, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_BDT_H()
{
	B_GiveInvItems(other, self, ITAR_BDT_H, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_Xardas()
{
	B_GiveInvItems(other, self, ITAR_XARDAS, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_Lester()
{
	B_GiveInvItems(other, self, ITAR_Lester, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_Diego()
{
	B_GiveInvItems(other, self, ITAR_Diego, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_CorAngar()
{
	B_GiveInvItems(other, self, ITAR_CorAngar, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_Prisoner()
{
	B_GiveInvItems(other, self, ITAR_Prisoner, 1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_Dementor()
{
	B_GiveInvItems(other, self, ITAR_Dementor, 1);
	B_Eremit_Tatsache();
};

// ********************************************************
// 							PERM
// ********************************************************
instance DIA_Addon_Eremit_PERM(C_INFO)
{
	npc				= NONE_ADDON_115_Eremit;
	nr				= 99;
	condition		= DIA_Addon_Eremit_PERM_Condition;
	information		= DIA_Addon_Eremit_PERM_Info;
	permanent		= TRUE;
	description		= "还 有...隐 居 的 生 活 怎 么 样 ？";
};

func int DIA_Addon_Eremit_PERM_Condition()
{
	return TRUE;
};

func void DIA_Addon_Eremit_PERM_Info()
{
	AI_Output(other, self, "DIA_Addon_Eremit_Add_15_04"); //还 有...隐 居 的 生 活 怎 么 样 ？

	if (MIS_Eremit_Klamotten == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Eremit_Add_04_09"); //（ 自 豪 的 ） 一 切 都 是 我 自 己 造 的 。 我 的 武 器 ， 我 的 工 具 ， 我 的 小 屋 ， 这 一 切 。
		AI_Output(self, other, "DIA_Addon_Eremit_Add_04_10"); //一 无 所 有 来 到 这 里 ， 只 有 一 个 好 心 情 … …
		AI_Output(self, other, "DIA_Addon_Eremit_Add_04_11"); //虽 然 有 时 … …
		AI_Output(other, self, "DIA_Addon_Eremit_Doppelt_15_01"); //是 吗 ？
		AI_Output(self, other, "DIA_Addon_Eremit_Add_04_12"); //有 时 候 ， 我 希 望 我 能 有 一 些 衣 服 。
		AI_Output(self, other, "DIA_Addon_Eremit_Add_04_13"); //我 不 知 道 如 何 织 布 和 鞣 制 兽 皮 … …
		AI_Output(self, other, "DIA_Addon_Eremit_Add_04_14"); //而 且 这 个 地 方 的 夜 晚 并 不 暖 和 。
		MIS_Eremit_Klamotten = LOG_RUNNING;
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Eremit_Add_04_15"); //我 想 办 法 。
		if (MIS_Eremit_Klamotten == LOG_SUCCESS)
		{
			AI_Output(self, other, "DIA_Addon_Eremit_Add_04_18"); //有 了 衣 服 ， 我 应 该 能 过 冬 了 ！ 那 以 后 … … 到 时 候 就 知 道 了 … …
		}
		else
		{
			AI_Output(self, other, "DIA_Addon_Eremit_Add_04_16"); //无 论 如 何 也 比 克 霍 里 尼 斯 好 ！
			AI_Output(self, other, "DIA_Addon_Eremit_Add_04_17"); //即 使 没 有 衣 服 。
		};
	};
};
