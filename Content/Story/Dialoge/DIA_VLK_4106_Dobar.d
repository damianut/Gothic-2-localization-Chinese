///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_EXIT(C_INFO)
{
	npc				= VLK_4106_Dobar;
	nr				= 999;
	condition		= DIA_Dobar_EXIT_Condition;
	information		= DIA_Dobar_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Dobar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dobar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HALLO
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_HALLO(C_INFO)
{
	npc				= VLK_4106_Dobar;
	nr				= 2;
	condition		= DIA_Dobar_HALLO_Condition;
	information		= DIA_Dobar_HALLO_Info;
	important		= TRUE;
};

func int DIA_Dobar_HALLO_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Dobar_HALLO_Info()
{
	AI_Output(self, other, "DIA_Dobar_HALLO_08_00"); //（ 粗 暴 的 ） 你 想 要 什 么 ？
};

///////////////////////////////////////////////////////////////////////
//	Info Ich verstehe mich auf's schmieden.
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_Talent(C_INFO)
{
	npc				= VLK_4106_Dobar;
	nr				= 3;
	condition		= DIA_Dobar_Talent_Condition;
	information		= DIA_Dobar_Talent_Info;
	description		= "我 知 道 一 点 关 于 锻 造 的 事 。";
};

func int DIA_Dobar_Talent_Condition()
{
	if (Npc_GetTalentSkill(other, NPC_TALENT_SMITH) > 0)
	{
		return TRUE;
	};
};

func void DIA_Dobar_Talent_Info()
{
	AI_Output(other, self, "DIA_Dobar_Talent_15_00"); //我 知 道 一 点 关 于 锻 造 的 事 。
	AI_Output(self, other, "DIA_Dobar_Talent_08_01"); //好 的 … … 那 又 怎 么 样 ？
};

///////////////////////////////////////////////////////////////////////
//	Info Schmiede
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_Schmiede(C_INFO)
{
	npc				= VLK_4106_Dobar;
	nr				= 3;
	condition		= DIA_Dobar_Schmiede_Condition;
	information		= DIA_Dobar_Schmiede_Info;
	description		= "我 能 使 用 你 的 锻 造 车 间 吗 ？";
};

func int DIA_Dobar_Schmiede_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Dobar_Talent))
	{
		return TRUE;
	};
};

func void DIA_Dobar_Schmiede_Info()
{
	AI_Output(other, self, "DIA_Dobar_Schmiede_15_00"); //我 能 使 用 你 的 锻 造 车 间 吗 ？
	AI_Output(self, other, "DIA_Dobar_Schmiede_08_01"); //我 有 很 多 事 要 做 。 我 们 只 会 互 相 妨 碍 。 就 等 到 天 黑 吧 。
	AI_Output(self, other, "DIA_Dobar_Schmiede_08_02"); //然 后 帕 拉 夫 和 我 将 会 去 睡 觉 ， 你 就 可 以 安 安 静 静 地 工 作 了 。
};

///////////////////////////////////////////////////////////////////////
//	Info beibringen
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_beibringen(C_INFO)
{
	npc				= VLK_4106_Dobar;
	nr				= 2;
	condition		= DIA_Dobar_beibringen_Condition;
	information		= DIA_Dobar_beibringen_Info;
	description		= "你 能 教 我 什 么 吗 ？";
};

func int DIA_Dobar_beibringen_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Dobar_Talent))
	{
		return TRUE;
	};
};

func void DIA_Dobar_beibringen_Info()
{
	AI_Output(other, self, "DIA_Dobar_beibringen_15_00"); //你 能 教 我 什 么 吗 ？
	AI_Output(self, other, "DIA_Dobar_beibringen_08_01"); //那 么 ， 你 已 经 知 道 要 领 了 。 我 可 以 告 诉 你 怎 样 改 进 你 的 工 作 。
	AI_Output(self, other, "DIA_Dobar_beibringen_08_02"); //以 后 你 就 能 做 出 更 好 的 武 器 了 。

	Dobar_Learnsmith = TRUE;
	Log_CreateTopic(TOPIC_Teacher_OC, LOG_NOTE);
	B_LogEntry(TOPIC_Teacher_OC, TOPIC_Teacher_OC_2);
};

///////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_Teach(C_INFO)
{
	npc				= VLK_4106_Dobar;
	nr				= 3;
	condition		= DIA_Dobar_Teach_Condition;
	information		= DIA_Dobar_Teach_Info;
	permanent		= TRUE;
	description		= B_BuildLearnString(NAME_LEARN_SMITHING2, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_01));
};

func int DIA_Dobar_Teach_Condition()
{
	if ((Dobar_Learnsmith == TRUE)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dobar_Teach_Info()
{
	AI_Output(other, self, "DIA_Dobar_Teach_15_00"); //告 诉 我 如 何 锻 造 一 把 好 剑 ！

	if (B_TeachPlayerTalentSmith(self, hero, WEAPON_1H_Special_01))
	{
		AI_Output(self, other, "DIA_Dobar_Teach_08_01"); //要 确 保 铁 块 周 围 烧 红 得 很 均 匀 ， 那 么 稍 后 才 能 做 出 平 滑 的 刀 剑 。
		AI_Output(self, other, "DIA_Dobar_Teach_08_02"); //如 果 你 把 这 个 记 在 脑 子 里 ， 你 铸 造 出 来 的 刀 剑 就 会 坚 固 并 且 锋 利 。
		AI_Output(self, other, "DIA_Dobar_Teach_08_03"); //这 是 你 需 要 知 道 的 一 切 。 如 果 你 正 在 城 堡 这 里 找 钢 铁 ， 去 跟 恩 高 尔 谈 谈 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Waffe
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_Waffe(C_INFO)
{
	npc				= VLK_4106_Dobar;
	nr				= 80;
	condition		= DIA_Dobar_Waffe_Condition;
	information		= DIA_Dobar_Waffe_Info;
	description		= "你 能 帮 我 铸 造 一 把 武 器 吗 ？";
};

func int DIA_Dobar_Waffe_Condition()
{
	return TRUE;
};

func void DIA_Dobar_Waffe_Info()
{
	AI_Output(other, self, "DIA_Dobar_Waffe_15_00"); //你 能 帮 我 铸 造 一 把 武 器 吗 ？
	AI_Output(self, other, "DIA_Dobar_Waffe_08_01"); //我 没 有 时 间 做 那 个 。 坦 多 分 配 武 器 - 我 只 管 制 造 它 们 ， 还 有 帕 拉 夫 负 责 磨 快 它 们 。

	Log_CreateTopic(TOPIC_Trader_OC, LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC, TOPIC_Trader_OC_2);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Dobar_NEWS(C_INFO)
{
	npc				= VLK_4106_Dobar;
	nr				= 900;
	condition		= DIA_Dobar_NEWS_Condition;
	information		= DIA_Dobar_NEWS_Info;
	permanent		= TRUE;
	description		= "工 作 怎 么 样 了 ？";
};

func int DIA_Dobar_NEWS_Condition()
{
	return TRUE;
};

func void DIA_Dobar_NEWS_Info()
{
	AI_Output(other, self, "DIA_Dobar_NEWS_15_00"); //工 作 怎 么 样 了 ？

	if (Dobar_einmalig == FALSE)
	{
		AI_Output(self, other, "DIA_Dobar_NEWS_08_01"); //我 为 城 堡 里 的 骑 士 铸 造 武 器 。 自 从 我 们 来 到 这 里 ， 我 就 只 能 制 造 新 武 器 了 。
		AI_Output(self, other, "DIA_Dobar_NEWS_08_02"); //而 且 我 们 会 需 要 它 们 。 我 会 让 那 些 该 死 的 兽 人 看 看 我 们 的 武 器 有 多 么 锋 利 。

		if ((Npc_IsDead(Parlaf)) == FALSE)
		{
			B_TurnToNpc(self, Parlaf);
			AI_Output(self, other, "DIA_Dobar_NEWS_08_03"); //（ 叫 喊 ） 嘿 ， 帕 拉 夫 - 把 那 些 刀 刃 磨 漂 亮 ， 而 且 要 锋 利 点 - 兽 人 都 是 十 分 强 悍 的 家 伙 ！
			B_TurnToNpc(self, other);
		};

		Dobar_einmalig = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Dobar_NEWS_08_04"); //那 样 会 更 好 。 如 果 你 不 是 没 完 没 了 地 打 搅 我 的 话 ， 我 可 能 真 的 做 好 了 一 些 东 西 。
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Dobar_PICKPOCKET(C_INFO)
{
	npc				= VLK_4106_Dobar;
	nr				= 900;
	condition		= DIA_Dobar_PICKPOCKET_Condition;
	information		= DIA_Dobar_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "（ 要 偷 他 的 矿 石 很 难 ）";
};

func int DIA_Dobar_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItMI_Nugget) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (79 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Dobar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dobar_PICKPOCKET);
	Info_AddChoice(DIA_Dobar_PICKPOCKET, DIALOG_BACK, DIA_Dobar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dobar_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Dobar_PICKPOCKET_DoIt);
};

func void DIA_Dobar_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 79)
	{
		B_GiveInvItems(self, other, ItMI_Nugget, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Dobar_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Dobar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dobar_PICKPOCKET);
};
