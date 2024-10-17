///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Rangar_EXIT(C_INFO)
{
	npc				= MIL_321_Rangar;
	nr				= 999;
	condition		= DIA_Rangar_EXIT_Condition;
	information		= DIA_Rangar_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Rangar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rangar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Rangar_PICKPOCKET(C_INFO)
{
	npc				= MIL_321_Rangar;
	nr				= 900;
	condition		= DIA_Rangar_PICKPOCKET_Condition;
	information		= DIA_Rangar_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "（ 偷 他 的 钥 匙 应 该 很 容 易 ）";
};

func int DIA_Rangar_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_City_Tower_02) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Rangar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rangar_PICKPOCKET);
	Info_AddChoice(DIA_Rangar_PICKPOCKET, DIALOG_BACK, DIA_Rangar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rangar_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Rangar_PICKPOCKET_DoIt);
};

func void DIA_Rangar_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems(self, other, ItKe_City_Tower_02, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Rangar_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Rangar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rangar_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Rangar_Hallo(C_INFO)
{
	npc				= MIL_321_Rangar;
	nr				= 2;
	condition		= DIA_Rangar_Hallo_Condition;
	information		= DIA_Rangar_Hallo_Info;
	description		= "嘿 ， 有 什 么 新 鲜 事 吗 ？";
};

func int DIA_Rangar_Hallo_Condition()
{
	if (((Npc_GetDistToWP(self, "NW_CITY_PALCAMP_15") < 500) == FALSE)
	&& ((Npc_GetDistToWP(self, "NW_CITY_WAY_TO_SHIP_03") < 500) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rangar_Hallo_Info()
{
	AI_Output(other, self, "DIA_Rangar_Hallo_15_00"); //嘿 ， 有 什 么 新 鲜 事 吗 ？
	AI_Output(self, other, "DIA_Rangar_Hallo_07_01"); //只 要 圣 骑 士 没 有 给 我 指 派 任 何 新 任 务 ， 我 就 可 以 在 这 里 喝 上 几 杯 啤 酒 。 你 还 要 问 什 么 ？ （ 露 齿 而 笑 ）
	AI_Output(other, self, "DIA_Rangar_Hallo_15_02"); //你 在 为 圣 骑 士 工 作 ？
	AI_Output(self, other, "DIA_Rangar_Hallo_07_03"); //是 的 ， 我 向 他 们 报 告 城 市 里 的 情 况 。 现 在 ， 一 切 都 很 平 静 。
};

///////////////////////////////////////////////////////////////////////
//	Info Ork
///////////////////////////////////////////////////////////////////////
instance DIA_Rangar_Ork(C_INFO)
{
	npc				= MIL_321_Rangar;
	nr				= 3;
	condition		= DIA_Rangar_Ork_Condition;
	information		= DIA_Rangar_Ork_Info;
	description		= "最 近 兽 人 怎 么 样 了 ？";
};

func int DIA_Rangar_Ork_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rangar_Hallo)
	&& ((Npc_GetDistToWP(self, "NW_CITY_PALCAMP_15") < 500) == FALSE)
	&& ((Npc_GetDistToWP(self, "NW_CITY_WAY_TO_SHIP_03") < 500) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rangar_Ork_Info()
{
	AI_Output(other, self, "DIA_Rangar_Ork_15_00"); //最 近 兽 人 怎 么 样 了 ？
	AI_Output(self, other, "DIA_Rangar_Ork_07_01"); //没 有 什 么 可 担 心 的 - 我 们 在 城 市 里 ， 卫 兵 和 圣 骑 士 已 经 控 制 住 了 一 切 。
	AI_Output(self, other, "DIA_Rangar_Ork_07_02"); //回 家 去 ， 让 我 们 做 我 们 的 工 作 。 我 们 在 监 护 城 市 和 里 面 的 市 民 。 - 打 嗝 声 -
};

///////////////////////////////////////////////////////////////////////
//	Info Ork
///////////////////////////////////////////////////////////////////////
instance DIA_Rangar_Bier(C_INFO)
{
	npc				= MIL_321_Rangar;
	nr				= 4;
	condition		= DIA_Rangar_Bier_Condition;
	information		= DIA_Rangar_Bier_Info;
	permanent		= TRUE;
	description		= "你 还 要 啤 酒 吗 ？";
};

func int DIA_Rangar_Bier_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rangar_Hallo)
	&& ((Npc_GetDistToWP(self, "NW_CITY_PALCAMP_15") < 500) == FALSE)
	&& ((Npc_GetDistToWP(self, "NW_CITY_WAY_TO_SHIP_03") < 500) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rangar_Bier_Info()
{
	AI_Output(other, self, "DIA_Rangar_Bier_15_00"); //你 还 要 啤 酒 吗 ？

	if (B_GiveInvItems(other, self, ItFo_Beer, 1))
	{
		if (Knows_Paladins == FALSE)
		{
			AI_Output(self, other, "DIA_Rangar_Bier_07_01"); //啊 - 没 有 什 么 比 一 杯 冰 凉 的 麦 芽 酒 更 好 的 东 西 了 。
			CreateInvItems(self, ItFo_Booze, 1);
			B_UseItem(self, ItFo_Booze);
			AI_Output(other, self, "DIA_Rangar_Bier_15_02"); //你 要 说 说 关 于 兽 人 的 事 情 … …
			AI_Output(self, other, "DIA_Rangar_Bier_07_03"); //哦 ， 是 的 ， 对 。 兽 人 对 这 座 城 市 绝 对 没 有 威 胁 。
			AI_Output(self, other, "DIA_Rangar_Bier_07_04"); //他 们 都 呆 在 矿 藏 山 谷 里 。 关 卡 被 圣 骑 士 控 制 着 。
			AI_Output(self, other, "DIA_Rangar_Bier_07_05"); //甚 至 连 一 只 肉 虫 也 无 法 从 那 里 通 过 。

			Knows_Paladins = 1;
			Info_ClearChoices(DIA_Rangar_Bier);
		}
		else if ((Knows_Paladins == 1)
		&& (Knows_Ork == TRUE))
		{
			AI_Output(self, other, "DIA_Rangar_Bier_07_06"); //对 美 酒 我 是 不 会 拒 绝 的 。
			CreateInvItems(self, ItFo_Booze, 1);
			B_UseItem(self, ItFo_Booze);
			AI_Output(other, self, "DIA_Rangar_Bier_15_07"); //他 们 甚 至 在 城 外 看 到 了 一 个 兽 人 。
			AI_Output(self, other, "DIA_Rangar_Bier_07_08"); //是 的 ， 对 ， 危 险 的 兽 人 就 在 城 外 。 一 个 真 正 的 兽 人 怪 物 。 他 很 快 就 要 进 攻 城 市 了 。
			AI_Output(self, other, "DIA_Rangar_Bier_07_09"); //听 着 ， 如 果 那 个 兽 人 蠢 货 靠 城 市 太 近 的 话 ， 我 们 马 上 就 会 收 拾 他 。 明 白 了 吗 ？
			AI_Output(other, self, "DIA_Rangar_Bier_15_10"); //我 知 道 。
			Knows_Paladins = 2;
			Info_ClearChoices(DIA_Rangar_Bier);
		}
		else
		{
			AI_Output(self, other, "DIA_Rangar_Bier_07_11"); //一 杯 美 味 的 、 略 苦 的 麦 芽 酒 绝 对 是 最 好 的 。
			CreateInvItems(self, ItFo_Booze, 1);
			B_UseItem(self, ItFo_Booze);
			AI_Output(self, other, "DIA_Rangar_Bier_07_12"); //你 知 道 ， 你 不 会 总 碰 上 某 个 人 愿 意 用 啤 酒 招 待 你 的 。 你 很 好 。
			Info_ClearChoices(DIA_Rangar_Bier);
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Rangar_Bier_07_13"); //当 然 我 还 想 要 一 瓶 啤 酒 ， 帮 我 弄 一 些 。
		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Erwischt
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Rangar_Erwischt(C_INFO)
{
	npc				= MIL_321_Rangar;
	nr				= 5;
	condition		= DIA_Addon_Rangar_Erwischt_Condition;
	information		= DIA_Addon_Rangar_Erwischt_Info;
	description		= "你 在 那 里 做 什 么 ？";
};

var int DIA_Addon_Rangar_Erwischt_OneTime;

func int DIA_Addon_Rangar_Erwischt_Condition()
{
	if (((Npc_GetDistToWP(self, "NW_CITY_PALCAMP_15") < 500))
	&& (DIA_Addon_Rangar_Erwischt_OneTime == FALSE)
	&& (MIS_Addon_Martin_GetRangar == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Rangar_Erwischt_Info()
{
	AI_Output(other, self, "DIA_Addon_Rangar_Erwischt_15_00"); //你 在 那 里 做 什 么 ？
	AI_Output(self, other, "DIA_Addon_Rangar_Erwischt_07_01"); //（ 感 觉 被 突 然 抓 住 ） 嗯 。 我 … … 呃 … … 这 不 关 你 的 事 。 走 开 。
	AI_Output(other, self, "DIA_Addon_Rangar_Erwischt_15_02"); //如 果 我 能 告 诉 马 丁 ， 当 他 离 开 时 候 ， 是 谁 在 他 的 物 品 堆 里 打 转 的 话 ， 他 一 定 会 很 高 兴 。
	AI_Output(self, other, "DIA_Addon_Rangar_Erwischt_07_03"); //（ 轻 蔑 的 ） 你 愿 意 做 什 么 就 去 做 。 我 要 走 了 ， 小 朋 友 。
	B_GivePlayerXP(XP_Addon_Martin_GotRangar);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Start");
	SC_GotRangar = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info nachhaken
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Rangar_nachhaken(C_INFO)
{
	npc				= MIL_321_Rangar;
	nr				= 2;
	condition		= DIA_Addon_Rangar_nachhaken_Condition;
	information		= DIA_Addon_Rangar_nachhaken_Info;
	permanent		= TRUE;
	description		= "你 真 的 以 为 你 也 拿 着 这 个 离 开 ？";
};

func int DIA_Addon_Rangar_nachhaken_Condition()
{
	if ((SC_GotRangar == TRUE)
	&& (MIS_Addon_Martin_GetRangar == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Rangar_nachhaken_Info()
{
	AI_Output(other, self, "DIA_Addon_Rangar_nachhaken_15_00"); //你 真 的 以 为 你 也 拿 着 这 个 离 开 ？
	AI_Output(self, other, "DIA_Addon_Rangar_nachhaken_07_01"); //（ 冷 淡 的 ） 不 要 因 为 一 点 点 的 食 物 就 小 题 大 做 。
};
