//*********************************************************************
//	Info EXIT
//*********************************************************************
instance DIA_Angar_DI_EXIT(C_INFO)
{
	npc				= DJG_705_Angar_DI;
	nr				= 999;
	condition		= DIA_Angar_DI_EXIT_Condition;
	information		= DIA_Angar_DI_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Angar_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Angar_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HALLO
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_DI_HALLO(C_INFO)
{
	npc				= DJG_705_Angar_DI;
	nr				= 10;
	condition		= DIA_Angar_DI_HALLO_Condition;
	information		= DIA_Angar_DI_HALLO_Info;
	permanent		= TRUE;
	description		= "你 好 吗 ？";
};

func int DIA_Angar_DI_HALLO_Condition()
{
	if ((Npc_IsDead(UndeadDragon)) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Angar_DI_HALLO_Info()
{
	AI_Output(other, self, "DIA_Angar_DI_HALLO_15_00"); //你 好 吗 ？

	if ((Npc_IsDead(UndeadDragon)) == FALSE)
	{
		AI_Output(self, other, "DIA_Angar_DI_HALLO_04_01"); //自 从 我 们 来 到 这 个 岛 上 以 后 ， 头 疼 越 来 越 难 以 忍 受 。
		AI_Output(self, other, "DIA_Angar_DI_HALLO_04_02"); //该 死 。 这 一 定 要 结 束 。
	}
	else
	{
		AI_Output(self, other, "DIA_Angar_DI_HALLO_04_03"); //不 用 担 心 我 。 我 们 离 开 这 里 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info ORKS
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_DI_ORKS(C_INFO)
{
	npc				= DJG_705_Angar_DI;
	nr				= 5;
	condition		= DIA_Angar_DI_ORKS_Condition;
	information		= DIA_Angar_DI_ORKS_Info;
	important		= TRUE;
};

func int DIA_Angar_DI_ORKS_Condition()
{
	if ((ORkSturmDI == TRUE)
	&& ((Npc_IsDead(UndeadDragon)) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_DI_ORKS_Info()
{
	AI_Output(self, other, "DIA_Angar_DI_ORKS_04_00"); //你 必 须 尽 快 。 兽 人 下 一 次 进 攻 的 代 价 将 是 我 们 的 生 命 。
	AI_Output(other, self, "DIA_Angar_DI_ORKS_15_01"); //我 正 在 尽 力 。
	AI_Output(self, other, "DIA_Angar_DI_ORKS_04_02"); //那 不 够 。

	Info_ClearChoices(DIA_Angar_DI_ORKS);
	Info_AddChoice(DIA_Angar_DI_ORKS, "放 松 。", DIA_Angar_DI_ORKS_no);
	Info_AddChoice(DIA_Angar_DI_ORKS, "那 就 帮 我 ， 并 且 不 要 再 抱 怨 。", DIA_Angar_DI_ORKS_follow);
};

func void DIA_Angar_DI_ORKS_follow()
{
	AI_Output(other, self, "DIA_Angar_DI_ORKS_follow_15_00"); //那 就 帮 我 ， 并 且 不 要 再 抱 怨 。
	AI_Output(self, other, "DIA_Angar_DI_ORKS_follow_04_01"); //我 会 的 。 你 先 走 。 出 发 。
	AI_StopProcessInfos(self);
	B_GivePlayerXP(XP_Ambient);
	Npc_ExchangeRoutine(self, "FollowDI");
	Angar_DI_Party = LOG_RUNNING;
};

func void DIA_Angar_DI_ORKS_no()
{
	AI_Output(other, self, "DIA_Angar_DI_ORKS_no_15_00"); //放 松 。
	AI_Output(self, other, "DIA_Angar_DI_ORKS_no_04_01"); //你 说 的 倒 容 易 。 我 在 这 里 已 经 快 疯 了 。
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info FOLLOW
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_DI_FOLLOW(C_INFO)
{
	npc				= DJG_705_Angar_DI;
	nr				= 5;
	condition		= DIA_Angar_DI_FOLLOW_Condition;
	information		= DIA_Angar_DI_FOLLOW_Info;
	permanent		= TRUE;
	description		= "现 在 退 后 。";
};

func int DIA_Angar_DI_FOLLOW_Condition()
{
	if (Angar_DI_Party == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Angar_DI_FOLLOW_Info()
{
	AI_Output(other, self, "DIA_Angar_DI_FOLLOW_15_00"); //现 在 退 后 。

	if (Npc_GetDistToWP(self, "SKELETTE") < 4000)
	{
		AI_Output(other, self, "DIA_Angar_DI_FOLLOW_15_01"); //我 必 须 亲 自 照 料 剩 余 的 人 。
		AI_Output(self, other, "DIA_Angar_DI_FOLLOW_04_02"); //祝 你 好 运 。

		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self, "Start");
		Angar_DI_Party = LOG_SUCCESS; // Joly: (Schluss mit Follow)
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(self, other, "DIA_Angar_DI_FOLLOW_04_03"); //当 然 了 。

		AI_StopProcessInfos(self);

		if (Npc_GetDistToWP(self, "SHIP") < 10000)
		{
			Npc_ExchangeRoutine(self, "Start");
		}
		else
		{
			if (Npc_IsDead(FireDragonIsland))
			{
				Npc_ExchangeRoutine(self, "FireDragonIsland");
			}
			else if (Npc_IsDead(OrkElite_AntiPaladinOrkOberst_DI))
			{
				Npc_ExchangeRoutine(self, "ORKOBERST_DI");
			}
			else if (Npc_IsDead(Troll_DI))
			{
				Npc_ExchangeRoutine(self, "Troll_DI");
			}
			else
			{
				Npc_ExchangeRoutine(self, "Start");
			};
		};
	};

	Angar_DI_Party = LOG_OBSOLETE;
};

///////////////////////////////////////////////////////////////////////
//	Info FOLLOWAGAIN
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_DI_FOLLOWAGAIN(C_INFO)
{
	npc				= DJG_705_Angar_DI;
	nr				= 5;
	condition		= DIA_Angar_DI_FOLLOWAGAIN_Condition;
	information		= DIA_Angar_DI_FOLLOWAGAIN_Info;
	permanent		= TRUE;
	description		= "跟 着 我 。";
};

func int DIA_Angar_DI_FOLLOWAGAIN_Condition()
{
	if (Angar_DI_Party == LOG_OBSOLETE)
	{
		return TRUE;
	};
};

func void DIA_Angar_DI_FOLLOWAGAIN_Info()
{
	AI_Output(other, self, "DIA_Angar_DI_FOLLOWAGAIN_15_00"); //跟 着 我 。
	AI_Output(self, other, "DIA_Angar_DI_FOLLOWAGAIN_04_01"); //你 先 走 。
	Angar_DI_Party = LOG_RUNNING;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "FollowDI");
};

///////////////////////////////////////////////////////////////////////
//	Info FOLLOW
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_DI_FOLLOWSTOP(C_INFO)
{
	npc				= DJG_705_Angar_DI;
	nr				= 5;
	condition		= DIA_Angar_DI_FOLLOWSTOP_Condition;
	information		= DIA_Angar_DI_FOLLOWSTOP_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Angar_DI_FOLLOWSTOP_Condition()
{
	if ((Angar_DI_Party == LOG_RUNNING)
	&& (
	((Npc_GetDistToWP(self, "DI_DRACONIANAREA_FIREDRAGON") < 3000) && (Npc_IsDead(FireDragonIsland) == FALSE))
	|| ((Npc_GetDistToWP(self, "SKELETTE") < 3000))
	))
	{
		return TRUE;
	};
};

func void DIA_Angar_DI_FOLLOWSTOP_Info()
{
	AI_Output(self, other, "DIA_Angar_DI_FOLLOWSTOP_04_00"); //啊 ！ 这 种 头 痛 要 让 我 疯 掉 了 ！。
};

///////////////////////////////////////////////////////////////////////
//	Info UNDEADDRGDEAD
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_DI_UNDEADDRGDEAD(C_INFO)
{
	npc				= DJG_705_Angar_DI;
	nr				= 2;
	condition		= DIA_Angar_DI_UNDEADDRGDEAD_Condition;
	information		= DIA_Angar_DI_UNDEADDRGDEAD_Info;
	description		= "你 度 过 了 难 关 。";
};

func int DIA_Angar_DI_UNDEADDRGDEAD_Condition()
{
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

func void DIA_Angar_DI_UNDEADDRGDEAD_Info()
{
	AI_Output(other, self, "DIA_Angar_DI_UNDEADDRGDEAD_15_00"); //你 度 过 了 难 关 。
	AI_Output(self, other, "DIA_Angar_DI_UNDEADDRGDEAD_04_01"); //我 们 终 于 能 离 开 这 里 了 吗 ？
	AI_Output(other, self, "DIA_Angar_DI_UNDEADDRGDEAD_15_02"); //是 的 。 敌 人 已 经 被 击 败 了 。
	AI_Output(self, other, "DIA_Angar_DI_UNDEADDRGDEAD_04_03"); //那 么 我 们 不 要 浪 费 一 点 时 间 。 去 船 长 那 里 ， 告 诉 他 起 锚 。

	if (SC_KnowsMadPsi == TRUE)
	{
		AI_Output(other, self, "DIA_Angar_DI_UNDEADDRGDEAD_15_04"); //我 希 望 没 有 再 剩 下 任 何 你 们 那 些 背 弃 宗 教 的 成 员 。
		AI_Output(self, other, "DIA_Angar_DI_UNDEADDRGDEAD_04_05"); //任 何 事 都 有 可 能 。 不 过 搜 索 者 彻 底 完 蛋 了 。 就 连 我 也 差 点 为 他 们 所 奴 役 。 谁 知 道 ？
	};

	AI_Output(other, self, "DIA_Angar_DI_UNDEADDRGDEAD_15_06"); //你 下 一 步 要 做 什 么 ？
	AI_Output(self, other, "DIA_Angar_DI_UNDEADDRGDEAD_04_07"); //也 许 我 会 在 乡 村 退 休 ， 并 成 为 一 个 农 民 。 我 厌 倦 了 战 争 。
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Start");
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Angar_DI_PICKPOCKET(C_INFO)
{
	npc				= DJG_705_Angar_DI;
	nr				= 900;
	condition		= DIA_Angar_DI_PICKPOCKET_Condition;
	information		= DIA_Angar_DI_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Angar_DI_PICKPOCKET_Condition()
{
	C_Beklauen(47, 45);
};

func void DIA_Angar_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Angar_DI_PICKPOCKET);
	Info_AddChoice(DIA_Angar_DI_PICKPOCKET, DIALOG_BACK, DIA_Angar_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Angar_DI_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Angar_DI_PICKPOCKET_DoIt);
};

func void DIA_Angar_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Angar_DI_PICKPOCKET);
};

func void DIA_Angar_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Angar_DI_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info FoundAmulett
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_DI_FOUNDAMULETT(C_INFO)
{
	npc				= DJG_705_Angar_DI;
	nr				= 7;
	condition		= DIA_Angar_DI_FOUNDAMULETT_Condition;
	information		= DIA_Angar_DI_FOUNDAMULETT_Info;
	description		= "我 找 到 了 你 的 护 身 符 。";
};

func int DIA_Angar_DI_FOUNDAMULETT_Condition()
{
	if ((Npc_HasItems(other, ItAm_Mana_Angar_MIS))
	&& (Npc_KnowsInfo(other, DIA_Angar_WIEKOMMSTDUHIERHER))
	&& (DJG_AngarGotAmulett == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_DI_FOUNDAMULETT_Info()
{
	B_AngarsAmulettAbgeben();
};
