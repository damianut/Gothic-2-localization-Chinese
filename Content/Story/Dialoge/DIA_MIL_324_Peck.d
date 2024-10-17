///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Peck_EXIT(C_INFO)
{
	npc				= Mil_324_Peck;
	nr				= 999;
	condition		= DIA_Peck_EXIT_Condition;
	information		= DIA_Peck_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Peck_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Peck_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Peck_PICKPOCKET(C_INFO)
{
	npc				= Mil_324_Peck;
	nr				= 900;
	condition		= DIA_Peck_PICKPOCKET_Condition;
	information		= DIA_Peck_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "（ 偷 他 的 钥 匙 很 冒 险 ）";
};

func int DIA_Peck_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_City_Tower_05) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (60 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Peck_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Peck_PICKPOCKET);
	Info_AddChoice(DIA_Peck_PICKPOCKET, DIALOG_BACK, DIA_Peck_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Peck_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Peck_PICKPOCKET_DoIt);
};

func void DIA_Peck_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 60)
	{
		B_GiveInvItems(self, other, ItKe_City_Tower_05, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Peck_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Peck_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Peck_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info HEY
///////////////////////////////////////////////////////////////////////
instance DIA_Peck_HEY(C_INFO)
{
	npc				= Mil_324_Peck;
	nr				= 2;
	condition		= DIA_Peck_HEY_Condition;
	information		= DIA_Peck_HEY_Info;
	permanent		= TRUE;
	description		= "嘿 ， 有 什 么 新 鲜 事 吗 ？";
};

func int DIA_Peck_HEY_Condition()
{
	if ((MIS_Andre_Peck != LOG_RUNNING)
	&& (Npc_GetDistToWP(self, "NW_CITY_HABOUR_PUFF_PECK") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Peck_HEY_Info()
{
	AI_Output(other, self, "DIA_Peck_HEY_15_00"); //嘿 ， 有 什 么 新 鲜 事 吗 ？
	AI_Output(self, other, "DIA_Peck_HEY_12_01"); //老 兄 ， 我 很 忙 。 走 开 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info FOUND_PECK
///////////////////////////////////////////////////////////////////////
instance DIA_Peck_FOUND_PECK(C_INFO)
{
	npc				= Mil_324_Peck;
	nr				= 2;
	condition		= DIA_Peck_FOUND_PECK_Condition;
	information		= DIA_Peck_FOUND_PECK_Info;
	description		= "嘿 ， 该 上 路 了 。";
};

func int DIA_Peck_FOUND_PECK_Condition()
{
	if ((MIS_Andre_Peck == LOG_RUNNING)
	&& (Npc_GetDistToWP(self, "NW_CITY_HABOUR_PUFF_PECK") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Peck_FOUND_PECK_Info()
{
	AI_Output(other, self, "DIA_Peck_FOUND_PECK_15_00"); //嘿 ， 该 上 路 了 。
	AI_Output(self, other, "DIA_Peck_FOUND_PECK_12_01"); //你 想 要 做 什 么 ？ 你 看 不 到 我 正 在 忙 吗 ？
	AI_Output(other, self, "DIA_Peck_FOUND_PECK_15_02"); //我 需 要 一 件 武 器 ， 所 以 快 回 兵 营 来 。
	AI_Output(self, other, "DIA_Peck_FOUND_PECK_12_03"); //该 死 ， 你 的 武 器 可 以 等 等 。
	AI_Output(other, self, "DIA_Peck_FOUND_PECK_15_04"); //快 来 ， 安 德 烈 也 已 经 在 想 你 了 。
	AI_Output(self, other, "DIA_Peck_FOUND_PECK_12_05"); //呸 … … 该 死 。 好 吧 ， 我 已 经 来 了 - 但 是 当 你 回 去 向 安 德 烈 报 到 的 时 候 ， 不 要 告 诉 他 我 在 这 里 。

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "STORAGE");
	Npc_ExchangeRoutine(Vanja, "ALONE");
};

///////////////////////////////////////////////////////////////////////
//	Info WEAPON
///////////////////////////////////////////////////////////////////////
instance DIA_Peck_WEAPON(C_INFO)
{
	npc				= Mil_324_Peck;
	nr				= 2;
	condition		= DIA_Peck_WEAPON_Condition;
	information		= DIA_Peck_WEAPON_Info;
	permanent		= TRUE;
	description		= "我 要 给 自 己 找 一 件 武 器";
};

// ------------------------------------
var int DIA_Peck_WEAPON_perm;
// ------------------------------------
func int DIA_Peck_WEAPON_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Andre_FOUND_PECK)
	&& (Npc_GetDistToWP(self, "NW_CITY_ARMORY_PECK") <= 1000)
	&& (Kapitel < 3)
	&& (DIA_Peck_WEAPON_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Peck_WEAPON_Info()
{
	AI_Output(other, self, "DIA_Peck_WEAPON_15_00"); //我 要 给 自 己 找 一 件 武 器 。

	if (MIS_Andre_Peck == LOG_RUNNING)
	{
		AI_Output(self, other, "DIA_Peck_WEAPON_12_01"); //先 去 安 德 烈 那 里 向 他 报 到 。
	}
	else
	{
		if (MIS_Andre_Peck == LOG_OBSOLETE)
		{
			AI_Output(self, other, "DIA_Peck_WEAPON_12_02"); //嗯 ， 看 看 谁 在 这 儿 。 我 们 的 新 同 志 。 而 他 想 要 一 把 剑 。
			AI_Output(self, other, "DIA_Peck_WEAPON_12_03"); //你 没 有 告 诉 安 德 烈 我 去 了 红 灯 笼 。 你 的 人 看 起 来 不 错 。 给 ， 你 的 剑 。
			AI_Output(self, other, "DIA_Peck_Add_12_00"); //这 是 我 这 里 最 好 的 。
			B_GiveInvItems(self, hero, ItMw_Schwert1, 1); // edles Schwert 35
		}
		else if (MIS_Andre_Peck == LOG_SUCCESS) // ist schon korrekt, das SUCCESS gilt für Andre M.F.
		{
			AI_Output(self, other, "DIA_Peck_WEAPON_12_04"); //我 没 有 忘 记 你 。 那 么 是 谁 告 诉 安 德 烈 我 去 了 红 灯 笼 ？
			AI_Output(self, other, "DIA_Peck_WEAPON_12_05"); //现 在 你 要 跟 我 要 武 器 … … 好 吧 ， 你 会 拿 到 武 器 的 。 给 。 现 在 去 死 吧 。

			B_GiveInvItems(self, hero, ItMw_1h_MISC_Sword, 1); // rostiges Schwert
		};

		DIA_Peck_WEAPON_perm = TRUE;
		AI_Output(self, other, "DIA_Peck_WEAPON_12_06"); //如 果 你 想 要 更 好 的 武 器 ， 去 市 场 的 商 人 那 里 吧 。
	};

	AI_StopProcessInfos(self);
};

// ***************
// B_Peck_LeckMich
// ***************

func void B_Peck_LeckMich()
{
	AI_Output(self, other, "DIA_Peck_Add_12_07"); //吻 我 的 屁 股 吧 ！
};

// *********************************************************
// 						zweite Waffe
// *********************************************************
instance DIA_Peck_WEAPON2(C_INFO)
{
	npc				= Mil_324_Peck;
	nr				= 2;
	condition		= DIA_Peck_WEAPON2_Condition;
	information		= DIA_Peck_WEAPON2_Info;
	permanent		= TRUE;
	description		= "你 有 更 好 的 武 器 给 我 吗 ？";
};

// ------------------------------------
var int DIA_Peck_WEAPON2_perm;
// ------------------------------------
func int DIA_Peck_WEAPON2_Condition()
{
	if ((other.guild == GIL_MIL)
	&& (Npc_GetDistToWP(self, "NW_CITY_ARMORY_PECK") <= 1000)
	&& (EnterOW_Kapitel2 == TRUE)
	&& (DIA_Peck_WEAPON_perm == TRUE)
	&& (DIA_Peck_WEAPON2_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Peck_WEAPON2_Info()
{
	AI_Output(self, other, "DIA_Peck_Add_15_01"); //你 有 更 好 的 武 器 给 我 吗 ？
	if (MIS_Andre_Peck == LOG_SUCCESS) // Peck verpetzt
	{
		AI_Output(self, other, "DIA_Peck_Add_12_06"); //我 还 没 有 忘 记 你 到 安 德 烈 勋 爵 那 里 给 我 打 小 报 告 。
		B_Peck_LeckMich();
	}
	else if (Kapitel < 3)
	{
		AI_Output(self, other, "DIA_Peck_Add_12_02"); //现 在 不 行 … …
	}
	else
	{
		AI_Output(self, other, "DIA_Peck_Add_12_03"); //问 得 很 好 。 我 们 从 欧 纳 尔 的 雇 佣 兵 那 里 弄 到 了 一 些 相 当 不 错 的 武 器 。
		AI_Output(self, other, "DIA_Peck_Add_12_04"); //他 们 一 定 不 再 需 要 那 些 东 西 了 （ 挖 苦 的 笑 ）.
		AI_Output(self, other, "DIA_Peck_Add_12_05"); //给 ， 拿 上 它 。
		B_GiveInvItems(self, other, ItMw_Rubinklinge, 1); // 50

		DIA_Peck_WEAPON2_perm = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Peck_PERM(C_INFO)
{
	npc				= Mil_324_Peck;
	nr				= 998;
	condition		= DIA_Peck_PERM_Condition;
	information		= DIA_Peck_PERM_Info;
	permanent		= TRUE;
	description		= "你 一 切 都 好 吗 ？";
};

func int DIA_Peck_PERM_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Peck_WEAPON)
	|| (other.guild != GIL_MIL)
	&& (Npc_GetDistToWP(self, "NW_CITY_ARMORY_PECK") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Peck_PERM_Info()
{
	AI_Output(other, self, "DIA_Peck_PERM_15_00"); //你 一 切 都 好 吗 ？

	if (MIS_Andre_Peck == LOG_SUCCESS) // Peck verpetzt
	{
		B_Peck_LeckMich();
	}
	else if (Kapitel != 3)
	{
		AI_Output(self, other, "DIA_Peck_PERM_12_01"); //对 ， 和 你 一 起 ？
	}
	else if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			if ((hero.guild == GIL_MIL)
			|| (hero.guild == GIL_PAL))
			{
				AI_Output(self, other, "DIA_Peck_PERM_12_02"); //不 全 是 。 我 在 担 心 雇 佣 兵 ， 我 是 说 ， 他 们 一 定 会 设 法 把 他 们 的 朋 友 从 监 狱 里 救 出 去 。
				AI_Output(self, other, "DIA_Peck_PERM_12_03"); //我 可 不 打 算 去 对 抗 一 群 老 练 的 战 士 。
			}
			else if (hero.guild == GIL_KDF)
			{
				AI_Output(self, other, "DIA_Peck_PERM_12_04"); //当 然 ！ 我 们 都 保 持 着 警 惕 。 魔 法 师 们 可 以 放 心 ， 那 个 囚 犯 绝 对 没 有 机 会 逃 走 。
			}
			else // Sld oder DJG
			{
				AI_Output(self, other, "DIA_Peck_PERM_12_05"); //我 知 道 你 正 在 盘 算 ， 但 是 你 绝 对 不 可 能 成 功 地 把 囚 犯 救 走 。
			};
		}
		else
		{
			AI_Output(self, other, "DIA_Peck_PERM_12_06"); //我 很 高 兴 凶 手 的 事 情 解 决 了 。
			AI_Output(other, self, "DIA_Peck_PERM_15_07"); //什 么 ？
			AI_Output(self, other, "DIA_Peck_PERM_12_08"); //雇 佣 兵 绝 对 不 会 不 采 取 行 动 ， 就 那 么 眼 睁 睁 地 看 着 我 们 把 他 们 的 人 送 上 绞 架 。
			AI_Output(self, other, "DIA_Peck_PERM_12_09"); //在 最 坏 的 情 况 下 ， 他 们 可 能 马 上 就 会 攻 击 我 们 。 我 甚 至 不 敢 想 象 那 时 候 会 是 什 么 样 子 。
		};
	};
};
