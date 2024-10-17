// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Edda_EXIT(C_INFO)
{
	npc				= VLK_471_Edda;
	nr				= 999;
	condition		= DIA_Edda_EXIT_Condition;
	information		= DIA_Edda_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Edda_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Edda_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				  Hallo
// ************************************************************
instance DIA_Edda_Hallo(C_INFO)
{
	npc				= VLK_471_Edda;
	nr				= 2;
	condition		= DIA_Edda_Hallo_Condition;
	information		= DIA_Edda_Hallo_Info;
	important		= TRUE;
};

func int DIA_Edda_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Edda_Hallo_Info()
{
	AI_Output(other, self, "DIA_Edda_Hallo_15_00"); //你 在 那 里 烹 饪 什 么 东 西 ？
	AI_Output(self, other, "DIA_Edda_Hallo_17_01"); //鱼 汤 。 它 不 是 那 么 美 味 ， 但 至 少 它 是 热 的 。
	AI_Output(self, other, "DIA_Edda_Hallo_17_02"); //如 果 你 喜 欢 ， 你 可 以 试 一 盘 。
};

// ************************************************************
// 			Stadt
// ************************************************************
instance DIA_Edda_Stadt(C_INFO)
{
	npc				= VLK_471_Edda;
	nr				= 5;
	condition		= DIA_Edda_Stadt_Condition;
	information		= DIA_Edda_Stadt_Info;
	description		= "你 能 介 绍 一 下 这 座 城 市 吗 ？";
};

func int DIA_Edda_Stadt_Condition()
{
	return TRUE;
};

func void DIA_Edda_Stadt_Info()
{
	AI_Output(other, self, "DIA_Edda_Stadt_15_00"); //你 能 介 绍 一 下 这 座 城 市 吗 ？
	AI_Output(self, other, "DIA_Edda_Stadt_17_01"); //这 座 城 里 的 大 部 分 市 民 都 害 怕 盗 贼 。 因 此 ， 进 入 一 个 陌 生 人 的 屋 子 可 不 是 个 好 主 意 。
	AI_Output(self, other, "DIA_Edda_Stadt_17_02"); //不 过 ， 如 果 你 正 在 找 地 方 过 夜 ， 欢 迎 你 睡 在 我 的 小 屋 里 。 这 里 有 一 张 空 床 可 以 给 你 用 。
	AI_Output(other, self, "DIA_Edda_Stadt_15_03"); //你 不 害 怕 盗 贼 吗 ？
	AI_Output(self, other, "DIA_Edda_Stadt_17_04"); //我 唯 一 有 点 价 值 的 东 西 已 经 被 拿 走 了 。
	AI_Output(self, other, "DIA_Edda_Stadt_17_05"); //有 人 偷 走 了 我 的 英 诺 斯 雕 像 。

	Edda_Schlafplatz = TRUE;
	Wld_AssignRoomToGuild("hafen08", GIL_NONE);
};

// ************************************************************
// 			Kannst du mir eine Suppe kochen?
// ************************************************************
instance DIA_Edda_Kochen(C_INFO)
{
	npc				= VLK_471_Edda;
	nr				= 6;
	condition		= DIA_Edda_Kochen_Condition;
	information		= DIA_Edda_Kochen_Info;
	description		= "你 能 帮 我 熬 一 些 汤 吗 ？";
};

func int DIA_Edda_Kochen_Condition()
{
	return TRUE;
};

func void DIA_Edda_Kochen_Info()
{
	AI_Output(other, self, "DIA_Edda_Kochen_15_00"); //你 能 帮 我 熬 一 些 汤 吗 ？
	AI_Output(self, other, "DIA_Edda_Kochen_17_01"); //我 为 每 一 个 人 烹 饪 。 也 为 你 ， 如 果 你 愿 意 。 你 只 要 把 鱼 带 给 我 就 行 。
};

// ************************************************************
// 		tägliche Suppe abholen
// ************************************************************
instance DIA_Edda_Suppe(C_INFO)
{
	npc				= VLK_471_Edda;
	nr				= 6;
	condition		= DIA_Edda_Suppe_Condition;
	information		= DIA_Edda_Suppe_Info;
	permanent		= TRUE;
	description		= "你 能 帮 我 熬 一 些 汤 吗 ？";
};

func int DIA_Edda_Suppe_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Edda_Kochen))
	{
		return TRUE;
	};
};

func void DIA_Edda_Suppe_Info()
{
	AI_Output(other, self, "DIA_Edda_Suppe_15_00"); //你 能 帮 我 熬 一 些 汤 吗 ？

	if (Wld_GetDay() == 0)
	{
		AI_Output(self, other, "DIA_Edda_Suppe_17_02"); //从 明 天 开 始 ， 你 可 以 每 天 来 这 里 拿 到 一 些 鱼 汤 。
	}
	else if (Edda_Day != Wld_GetDay())
	{
		if (B_GiveInvItems(other, self, ItFo_Fish, 1))
		{
			AI_Output(self, other, "DIA_Edda_Suppe_17_01"); //没 有 比 这 更 简 单 的 事 情 了 。 给 ， 来 一 盘 。
			B_GiveInvItems(self, other, ItFo_Fishsoup, 1);
			Edda_Day = Wld_GetDay();
		}
		else
		{
			AI_Output(self, other, "DIA_Edda_Suppe_17_04"); //给 我 带 一 条 鱼 来 ， 那 么 我 就 能 给 你 做 可 口 的 汤 了 。
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Edda_Suppe_17_03"); //不 ， 今 天 不 行 。 明 天 再 来 。
	};
};

// ************************************************************
// 			Ich habe hier eine Innos Statue
// ************************************************************
instance DIA_Edda_Statue(C_INFO)
{
	npc				= VLK_471_Edda;
	nr				= 6;
	condition		= DIA_Edda_Statue_Condition;
	information		= DIA_Edda_Statue_Info;
	description		= "看 ， 我 帮 你 找 到 一 个 英 诺 斯 雕 像 。";
};

func int DIA_Edda_Statue_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Edda_Stadt)
	&& (Npc_HasItems(other, ItMI_InnosStatue) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Edda_Statue_Info()
{
	AI_Output(other, self, "DIA_Edda_Statue_15_00"); //看 ， 我 帮 你 找 到 一 个 英 诺 斯 雕 像 。
	AI_Output(self, other, "DIA_Edda_Statue_17_01"); //哦 - 非 常 非 常 谢 谢 你 。 愿 英 诺 斯 让 他 的 光 芒 在 你 身 上 闪 耀 … …
	AI_Output(other, self, "DIA_Edda_Statue_15_02"); //是 的 ， 没 关 系 。

	B_GiveInvItems(other, self, ItMI_InnosStatue, 1);
	B_GivePlayerXP(XP_Edda_Statue);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Edda_PICKPOCKET(C_INFO)
{
	npc				= VLK_471_Edda;
	nr				= 900;
	condition		= DIA_Edda_PICKPOCKET_Condition;
	information		= DIA_Edda_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "（ 偷 她 的 雕 像 如 同 儿 戏 ）";
};

func int DIA_Edda_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItMI_EddasStatue) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (20 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Edda_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Edda_PICKPOCKET);
	Info_AddChoice(DIA_Edda_PICKPOCKET, DIALOG_BACK, DIA_Edda_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Edda_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Edda_PICKPOCKET_DoIt);
};

func void DIA_Edda_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 20)
	{
		B_GiveInvItems(self, other, ItMI_EddasStatue, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Edda_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1);
	};
};

func void DIA_Edda_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Edda_PICKPOCKET);
};
