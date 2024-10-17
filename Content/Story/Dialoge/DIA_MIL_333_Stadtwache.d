// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Mil_333_Stadtwache_EXIT(C_INFO)
{
	npc				= Mil_333_Stadtwache;
	nr				= 999;
	condition		= DIA_Mil_333_Stadtwache_EXIT_Condition;
	information		= DIA_Mil_333_Stadtwache_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Mil_333_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_333_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
const string Mil_333_Checkpoint = "NW_CITY_MERCHANT_PATH_29"; // Eingang City Hintereingang!
// -----------------------------------------------------------
var int MIL_333_Personal_AbsolutionLevel;
// var int Mil_333_schonmalreingelassen; --> GLOBALS
// -----------------------------------------------------------
instance DIA_Mil_333_Stadtwache_FirstWarn(C_INFO)
{
	npc				= Mil_333_Stadtwache;
	nr				= 1;
	condition		= DIA_Mil_333_Stadtwache_FirstWarn_Condition;
	information		= DIA_Mil_333_Stadtwache_FirstWarn_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Mil_333_Stadtwache_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, Mil_333_Checkpoint) <= 1000) // NICHT von hinten!
	{
		Npc_SetRefuseTalk(self, 5);
		return FALSE;
	};

	if ((B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) // wenn CRIME in Stadt bekannt
	&& (B_GetCurrentAbsolutionLevel(self) == MIL_333_Personal_AbsolutionLevel)) // und noch nicht bezahlt
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else // CRIME_NONE (oder Sheepkiller) - wenn Crime rehabilitiert, wird hier PASSGATE automatisch wieder auf TRUE gesetzt
	{
		if (Mil_333_schonmalreingelassen == TRUE)
		{
			self.aivar[AIV_PASSGATE] = TRUE;
		};
	};

	if ((self.aivar[AIV_Guardpassage_Status] == GP_NONE)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE)
	&& (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_FirstWarn_Info()
{
	AI_Output(self, other, "DIA_Mil_333_Stadtwache_FirstWarn_06_00"); //停 下 ！

	// ------ PETZMASTER LIGHT ------
	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		AI_Output(other, self, "DIA_Mil_333_Stadtwache_FirstWarn_15_01"); //（ 叹 息 ） 那 是 什 么 ？
		AI_Output(self, other, "DIA_Mil_333_Stadtwache_FirstWarn_06_02"); //你 知 道 的 很 清 楚 ！

		if (B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self, other, "DIA_Mil_333_Stadtwache_FirstWarn_06_03"); //你 因 为 谋 杀 而 在 镇 上 遭 到 通 缉 ！
		};

		if (B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self, other, "DIA_Mil_333_Stadtwache_FirstWarn_06_04"); //我 们 这 里 不 需 要 卑 鄙 的 小 偷 ！
		};

		if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self, other, "DIA_Mil_333_Stadtwache_FirstWarn_06_05"); //我 们 的 镇 上 不 需 要 麻 烦 的 家 伙 ！
		};

		AI_Output(self, other, "DIA_Mil_333_Stadtwache_FirstWarn_06_06"); //你 为 什 么 认 为 我 们 会 让 你 进 去 ？
	}
	else // ------ normales Reinkommen ------
	{
		var C_Item itm; itm = Npc_GetEquippedArmor(other);

		// ------ ohne Rüstung ODER als Bauer ------
		if ((Npc_HasEquippedArmor(other) == FALSE)
		|| (Hlp_IsItem(itm, ItAr_Bau_L) == TRUE)
		|| (Hlp_IsItem(itm, ItAr_Bau_M) == TRUE))
		{
			AI_Output(other, self, "DIA_Mil_333_Stadtwache_FirstWarn_15_07"); //嗯 ？
			AI_Output(self, other, "DIA_Mil_333_Stadtwache_FirstWarn_06_08"); //你 看 起 来 像 个 可 怜 的 虫 。 在 这 个 镇 上 ， 我 们 不 需 要 没 有 钱 的 人 。

			if (Npc_HasItems(other, ItWr_Passierschein))
			{
				AI_Output(other, self, "DIA_Mil_333_Stadtwache_FirstWarn_15_09"); //但 是 我 有 通 行 证 ！
				AI_Output(self, other, "DIA_Mil_333_Stadtwache_FirstWarn_06_10"); //那 只 在 其 它 的 城 门 有 用 ！
			};

			if (Npc_KnowsInfo(other, DIA_Mil_310_Stadtwache_MilizWerden))
			{
				AI_Output(other, self, "DIA_Mil_333_Stadtwache_FirstWarn_15_11"); //但 是 我 打 算 加 入 城 市 卫 兵 ！
				AI_Output(self, other, "DIA_Mil_333_Stadtwache_FirstWarn_06_12"); //哈 ！ 别 逗 我 笑 了 ！ 到 其 它 的 大 门 去 ， 把 你 的 故 事 告 诉 他 们 。
				AI_Output(other, self, "DIA_Mil_333_Stadtwache_FirstWarn_15_13"); //我 已 经 去 过 了 那 边 - 他 们 让 我 来 见 你 。
				AI_Output(self, other, "DIA_Mil_333_Stadtwache_FirstWarn_06_14"); //（ 讨 厌 的 大 笑 ） 哦 老 兄 ！ 他 们 总 是 送 给 我 们 一 些 优 秀 人 物 … … …
			};
		}
		// ------ alle anderen Rüstungen ------
		else
		{
			AI_Output(other, self, "DIA_Mil_333_Stadtwache_FirstWarn_15_15"); //（ 平 静 的 ） 什 么 ？
			AI_Output(self, other, "DIA_Mil_333_Stadtwache_FirstWarn_06_16"); //只 是 想 要 看 一 下 你 。 嗯 ， 不 错 ， 看 来 你 还 有 点 钱 。 进 去 吧 。

			self.aivar[AIV_PASSGATE] = TRUE;
			Stadtwache_310.aivar[AIV_PASSGATE] = TRUE; // Wache vom anderen Stadttor
			Mil_333_schonmalreingelassen = TRUE;

			AI_StopProcessInfos(self);
		};
	};

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other, Mil_333_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************
instance DIA_Mil_333_Stadtwache_SecondWarn(C_INFO)
{
	npc				= Mil_333_Stadtwache;
	nr				= 2;
	condition		= DIA_Mil_333_Stadtwache_SecondWarn_Condition;
	information		= DIA_Mil_333_Stadtwache_SecondWarn_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Mil_333_Stadtwache_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE)
	&& (Npc_GetDistToWP(other, Mil_333_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_SecondWarn_Info()
{
	AI_Output(self, other, "DIA_Mil_333_Stadtwache_SecondWarn_06_00"); //你 的 耳 朵 出 问 题 了 吗 ？ 再 往 前 走 一 步 ， 你 就 要 尝 尝 我 的 刀 刃 的 滋 味 ！

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other, Mil_333_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;

	AI_StopProcessInfos(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************
instance DIA_Mil_333_Stadtwache_Attack(C_INFO)
{
	npc				= Mil_333_Stadtwache;
	nr				= 3;
	condition		= DIA_Mil_333_Stadtwache_Attack_Condition;
	information		= DIA_Mil_333_Stadtwache_Attack_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Mil_333_Stadtwache_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE)
	&& (Npc_GetDistToWP(other, Mil_333_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE; // wird auch in ZS_Attack resettet

	AI_Output(self, other, "DIA_Mil_333_Stadtwache_Attack_06_00"); //你 自 讨 苦 吃 … …

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_GuardStopsIntruder, 0);
};

// ************************************************************
// 							Bestechung!
// ************************************************************
instance DIA_Mil_333_Stadtwache_Bribe(C_INFO)
{
	npc				= Mil_333_Stadtwache;
	nr				= 5;
	condition		= DIA_Mil_333_Stadtwache_Bribe_Condition;
	information		= DIA_Mil_333_Stadtwache_Bribe_Info;
	permanent		= TRUE;
	description		= "这 是 １ ０ ０ 枚 金 币 。 让 我 过 去 ！";
};

func int DIA_Mil_333_Stadtwache_Bribe_Condition()
{
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_Bribe_Info()
{
	AI_Output(other, self, "DIA_Mil_333_Stadtwache_Bribe_15_00"); //这 是 １ ０ ０ 枚 金 币 。 让 我 过 去 ！

	if (B_GiveInvItems(other, self, itmi_gold, 100))
	{
		AI_Output(self, other, "DIA_Mil_333_Stadtwache_Bribe_06_01"); //（ 贪 婪 的 ）100枚 金 币 听 起 来 不 错 。 那 么 你 进 去 吧 。

		if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
		{
			AI_Output(self, other, "DIA_Mil_333_Stadtwache_Bribe_06_02"); //直 接 去 安 德 烈 那 里 ！ 否 则 下 次 我 还 要 收 你100枚 金 币 ！
		};

		self.aivar[AIV_PASSGATE] = TRUE;
		Stadtwache_310.aivar[AIV_PASSGATE] = TRUE; // Wache vom anderen Stadttor
		Mil_333_schonmalreingelassen = TRUE;
		B_CheckLog();

		// ------ wenn bezahlt, persönliche Absolution erteilen -------
		MIL_333_Personal_AbsolutionLevel = B_GetCurrentAbsolutionLevel(self) + 1;
	}
	else // nicht genug Gold
	{
		AI_Output(self, other, "DIA_Mil_333_Stadtwache_Bribe_06_03"); //什 么 ？ ！ 在 哪 里 ？ ！ 我 没 看 到 一 点 金 币 。 走 开 ！
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
// 							PERM
// ************************************************************
instance DIA_Mil_333_Stadtwache_PERM(C_INFO)
{
	npc				= Mil_333_Stadtwache;
	nr				= 5;
	condition		= DIA_Mil_333_Stadtwache_PERM_Condition;
	information		= DIA_Mil_333_Stadtwache_PERM_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Mil_333_Stadtwache_PERM_Condition()
{
	if ((self.aivar[AIV_PASSGATE] == TRUE)
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_PERM_Info()
{
	AI_Output(self, other, "DIA_Mil_333_Stadtwache_PERM_06_00"); //继 续 走 ！

	AI_StopProcessInfos(self);
};
