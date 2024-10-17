///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Zuris_EXIT(C_INFO)
{
	npc				= VLK_409_Zuris;
	nr				= 999;
	condition		= DIA_Zuris_EXIT_Condition;
	information		= DIA_Zuris_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Zuris_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Zuris_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Zuris_PICKPOCKET(C_INFO)
{
	npc				= VLK_409_Zuris;
	nr				= 900;
	condition		= DIA_Zuris_PICKPOCKET_Condition;
	information		= DIA_Zuris_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "（ 偷 他 的 药 剂 很 容 易 ）";
};

func int DIA_Zuris_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (40 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Zuris_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Zuris_PICKPOCKET);
	Info_AddChoice(DIA_Zuris_PICKPOCKET, DIALOG_BACK, DIA_Zuris_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Zuris_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Zuris_PICKPOCKET_DoIt);
};

func void DIA_Zuris_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 40)
	{
		CreateInvItems(self, ITPO_Health_03, 1);
		B_GiveInvItems(self, other, ITPO_Health_03, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Zuris_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Zuris_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Zuris_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info Sperre
///////////////////////////////////////////////////////////////////////
instance DIA_Zuris_Sperre(C_INFO)
{
	npc				= VLK_409_Zuris;
	nr				= 2;
	condition		= DIA_Zuris_Sperre_Condition;
	information		= DIA_Zuris_Sperre_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Zuris_Sperre_Condition()
{
	if ((Canthar_Sperre == TRUE)
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Zuris_Sperre_Info()
{
	AI_Output(self, other, "DIA_Zuris_Sperre_14_00"); //你 是 从 矿 坑 流 放 地 逃 出 来 的 罪 犯 。 滚 开 ！
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Zuris_GREET(C_INFO)
{
	npc				= VLK_409_Zuris;
	nr				= 2;
	condition		= DIA_Zuris_GREET_Condition;
	information		= DIA_Zuris_GREET_Info;
	important		= TRUE;
};

func int DIA_Zuris_GREET_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (Canthar_Sperre == FALSE)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Zuris_GREET_Info()
{
	AI_Output(self, other, "DIA_Zuris_GREET_14_00"); //我 是 祖 里 斯 ， 药 剂 大 师 。
	AI_Output(self, other, "DIA_Zuris_GREET_14_01"); //你 需 要 一 个 治 疗 精 华 或 者 一 个 魔 法 炼 金 药 ？ 那 么 你 来 对 地 方 了 。

	Log_CreateTopic(Topic_CityTrader, LOG_NOTE);
	B_LogEntry(Topic_CityTrader, Topic_CityTrader_20);
};

///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
var int Zuris_einmal;
instance DIA_Zuris_WAREZ(C_INFO)
{
	npc				= VLK_409_Zuris;
	nr				= 2;
	condition		= DIA_Zuris_WAREZ_Condition;
	information		= DIA_Zuris_WAREZ_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "让 我 看 看 你 的 货 物";
};

func int DIA_Zuris_WAREZ_Condition()
{
	return TRUE;
};

func void DIA_Zuris_WAREZ_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other, self, "DIA_Zuris_WAREZ_15_00"); //让 我 看 看 你 的 货 物 。

	if ((Zuris_einmal == FALSE)
	&& (!Npc_KnowsInfo(other, DIA_Zuris_Potions)))
	{
		AI_Output(self, other, "DIA_Zuris_GREET_14_02"); //我 刚 收 到 一 些 新 药 剂 。 是 我 的 客 人 - 火 魔 法 师 达 隆 大 师 ， 从 修 道 院 带 来 的 。
		Zuris_einmal = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info POTIONS
///////////////////////////////////////////////////////////////////////
instance DIA_Zuris_POTIONS(C_INFO)
{
	npc				= VLK_409_Zuris;
	nr				= 2;
	condition		= DIA_Zuris_POTIONS_Condition;
	information		= DIA_Zuris_POTIONS_Info;
	description		= "你 也 自 己 酿 造 药 剂 吗 ？";
};

func int DIA_Zuris_POTIONS_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Zuris_GREET))
	{
		return TRUE;
	};
};

func void DIA_Zuris_POTIONS_Info()
{
	AI_Output(other, self, "DIA_Zuris_POTIONS_15_00"); //你 也 自 己 酿 造 药 剂 吗 ？
	AI_Output(self, other, "DIA_Zuris_POTIONS_14_01"); //不 ， 我 要 不 就 去 修 道 院 弄 到 它 们 ， 要 不 就 从 炼 金 术 士 康 斯 坦 提 诺 那 里 买 。

	if (hero.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Zuris_POTIONS_14_02"); //如 果 你 对 酿 造 药 剂 感 兴 趣 ， 那 就 去 跟 他 谈 谈 。 他 需 要 一 个 助 手 。
		AI_Output(self, other, "DIA_Zuris_POTIONS_14_03"); //但 是 他 太 顽 固 了 ， 不 肯 自 己 雇 人 。 他 简 直 倔 得 象 一 头 驴 子 。
	};

	AI_Output(self, other, "DIA_Zuris_Add_14_00"); //他 每 次 从 东 门 出 去 为 他 的 药 剂 收 集 药 草 ， 回 来 时 都 会 经 过 我 这 里 。
};

// **************************************************
//				Wo sammelt Constantino?
// **************************************************
instance DIA_Zuris_Kraut(C_INFO)
{
	npc				= VLK_409_Zuris;
	nr				= 2;
	condition		= DIA_Zuris_Kraut_Condition;
	information		= DIA_Zuris_Kraut_Info;
	description		= "康 斯 坦 提 诺 究 竟 在 哪 里 采 集 药 草 ？";
};

func int DIA_Zuris_Kraut_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Zuris_POTIONS))
	{
		return TRUE;
	};
};

func void DIA_Zuris_Kraut_Info()
{
	AI_Output(other, self, "DIA_Zuris_Add_15_01"); //康 斯 坦 提 诺 究 竟 在 哪 里 采 集 药 草 ？
	AI_Output(self, other, "DIA_Zuris_Add_14_02"); //他 经 常 从 城 的 东 门 出 去 ， 然 后 消 失 在 左 边 那 片 荒 野 里 。
	AI_Output(self, other, "DIA_Zuris_Add_14_03"); //有 一 次 他 告 诉 我 那 里 几 乎 能 长 出 所 有 的 东 西 ， 除 了 国 王 酢 浆 草 ,

	Wld_InsertItem(ItPl_Mana_Herb_01, "FP_ITEM_HERB_01");
	Wld_InsertItem(ItPl_Mana_Herb_02, "FP_ITEM_HERB_02");
	Wld_InsertItem(ItPl_Mana_Herb_03, "FP_ITEM_HERB_03");
	Wld_InsertItem(ItPl_Health_Herb_01, "FP_ITEM_HERB_04");
	Wld_InsertItem(ItPl_Health_Herb_02, "FP_ITEM_HERB_05");
	Wld_InsertItem(ItPl_Health_Herb_03, "FP_ITEM_HERB_06");
	Wld_InsertItem(ItPl_Speed_Herb_01, "FP_ITEM_HERB_07");
	Wld_InsertItem(ItPl_Temp_Herb, "FP_ITEM_HERB_08");
	Wld_InsertItem(ItPl_Strength_Herb_01, "FP_ITEM_HERB_09");
	Wld_InsertItem(ItPl_Dex_Herb_01, "FP_ITEM_HERB_10");
};

// **************************************************
//					 Kronstöckel
// **************************************************
instance DIA_Zuris_Kronstoeckel(C_INFO)
{
	npc				= VLK_409_Zuris;
	nr				= 2;
	condition		= DIA_Zuris_Kronstoeckel_Condition;
	information		= DIA_Zuris_Kronstoeckel_Info;
	description		= "康 斯 坦 提 诺 曾 经 告 诉 过 你 去 哪 里 找 国 王 酢 浆 草 吗 ？";
};

func int DIA_Zuris_Kronstoeckel_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Zuris_Kraut))
	{
		return TRUE;
	};
};

func void DIA_Zuris_Kronstoeckel_Info()
{
	AI_Output(other, self, "DIA_Zuris_Add_15_04"); //康 斯 坦 提 诺 曾 经 告 诉 过 你 去 哪 里 找 国 王 酢 浆 草 吗 ？
	AI_Output(self, other, "DIA_Zuris_Add_14_05"); //有 一 次 ， 我 听 他 说 那 种 东 西 长 在 石 头 圈 附 近 。
	AI_Output(self, other, "DIA_Zuris_Add_14_06"); //靠 近 洛 拔 特 的 农 场 ， 那 是 另 一 扇 大 门 附 近 的 那 个 农 场 ， 那 里 有 一 个 石 头 圈 。
	AI_Output(self, other, "DIA_Zuris_Add_14_07"); //我 想 那 是 在 一 座 小 山 上 。 它 以 前 是 一 座 墓 地 或 什 么 的 。

	Wld_InsertItem(ItPl_Perm_Herb, "FP_ITEM_HERB_11");
};

///////////////////////////////////////////////////////////////////////
//	Info WHERE
///////////////////////////////////////////////////////////////////////
instance DIA_Zuris_WHERE(C_INFO)
{
	npc				= VLK_409_Zuris;
	nr				= 0;
	condition		= DIA_Zuris_WHERE_Condition;
	information		= DIA_Zuris_WHERE_Info;
	description		= "我 在 哪 里 能 找 到 康 斯 坦 提 诺 ？";
};

func int DIA_Zuris_WHERE_Condition()
{
	if ((Npc_KnowsInfo(hero, DIA_Zuris_POTIONS))
	&& (Constantino.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Zuris_WHERE_Info()
{
	AI_Output(other, self, "DIA_Zuris_WHERE_15_00"); //我 在 哪 里 能 找 到 康 斯 坦 提 诺 ？
	AI_Output(self, other, "DIA_Zuris_WHERE_14_01"); //他 的 房 间 在 一 条 隧 道 里 ， 靠 近 哈 莱 德 的 铁 匠 铺 。 应 该 不 会 太 难 找 。
};

///////////////////////////////////////////////////////////////////////
//	Info Kloster
///////////////////////////////////////////////////////////////////////
instance DIA_Zuris_Kloster(C_INFO)
{
	npc				= VLK_409_Zuris;
	nr				= 2;
	condition		= DIA_Zuris_Kloster_Condition;
	information		= DIA_Zuris_Kloster_Info;
	description		= "告 诉 我 关 于 修 道 院 的 事 。 ";
};

func int DIA_Zuris_Kloster_Condition()
{
	if (Zuris_einmal == TRUE)
	{
		return FALSE;
	};
};

func void DIA_Zuris_Kloster_Info()
{
	AI_Output(other, self, "DIA_Zuris_Kloster_14_00"); //告 诉 我 关 于 修 道 院 的 事 。
	AI_Output(self, other, "DIA_Zuris_Kloster_14_01"); //你 最 好 跟 达 隆 大 师 本 人 谈 谈 。 他 比 我 知 道 得 更 多 。
};

// ************************************************************
// 		Minenanteil
// ************************************************************
instance DIA_Zuris_Minenanteil(C_INFO)
{
	npc				= VLK_409_Zuris;
	nr				= 3;
	condition		= DIA_Zuris_Minenanteil_Condition;
	information		= DIA_Zuris_Minenanteil_Info;
	description		= "你 在 出 售 矿 井 股 票 ？";
};

func int DIA_Zuris_Minenanteil_Condition()
{
	if ((hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Zuris_Minenanteil_Info()
{
	AI_Output(other, self, "DIA_Zuris_Minenanteil_15_00"); //你 在 出 售 矿 井 股 票 ？
	AI_Output(self, other, "DIA_Zuris_Minenanteil_14_01"); //是 的 。 那 很 失 败 。 这 是 我 最 后 一 次 卷 入 这 样 的 黑 幕 交 易 ！

	B_GivePlayerXP(XP_Ambient);
};
