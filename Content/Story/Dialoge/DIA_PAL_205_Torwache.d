// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_PAL_205_Torwache_EXIT(C_INFO)
{
	npc				= PAL_205_Torwache;
	nr				= 999;
	condition		= DIA_PAL_205_Torwache_EXIT_Condition;
	information		= DIA_PAL_205_Torwache_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_PAL_205_Torwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_205_Torwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
const string PAL_205_Checkpoint = "NW_CITY_CITYHALL_IN"; // WP im Rathaus
// -----------------------------------------------------------
var int PAL_205_schonmalreingelassen;
// -----------------------------------------------------------
instance DIA_PAL_205_Torwache_FirstWarn(C_INFO)
{
	npc				= PAL_205_Torwache;
	nr				= 1;
	condition		= DIA_PAL_205_Torwache_FirstWarn_Condition;
	information		= DIA_PAL_205_Torwache_FirstWarn_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_PAL_205_Torwache_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, PAL_205_Checkpoint) <= 550) // NICHT von hinten!
	{
		Npc_SetRefuseTalk(self, 5);
		return FALSE;
	};

	if ((B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) // wenn CRIME in Stadt bekannt
	&& (PAL_205_schonmalreingelassen == TRUE))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else // CRIME_NONE (oder Sheepkiller) - wenn Crime rehabilitiert, wird hier PASSGATE automatisch wieder auf TRUE gesetzt
	{
		if (PAL_205_schonmalreingelassen == TRUE)
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

func void DIA_PAL_205_Torwache_FirstWarn_Info()
{
	AI_Output(self, other, "DIA_PAL_205_Torwache_FirstWarn_12_00"); //停 下 ！

	// ------ PETZMASTER LIGHT und Personal CRIMES -------
	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		if (B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self, other, "DIA_PAL_205_Torwache_FirstWarn_12_01"); //如 果 我 对 一 个 杀 人 犯 敞 开 大 门 的 话 ， 我 将 亵 渎 自 己 最 神 圣 的 职 责 。
		};

		if (B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self, other, "DIA_PAL_205_Torwache_FirstWarn_12_02"); //你 被 控 偷 窃 。 只 要 这 是 真 的 ， 你 就 不 能 进 去 ！
		};

		if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self, other, "DIA_PAL_205_Torwache_FirstWarn_12_03"); //你 以 好 斗 着 称 。 我 不 会 让 你 通 过 的 。
		};

		AI_Output(self, other, "DIA_PAL_205_Torwache_FirstWarn_12_04"); //去 找 安 德 烈 勋 爵 ， 并 解 决 问 题 ！
	}

	// ------ normales Reinkommen ------
	else
	{
		AI_Output(self, other, "DIA_PAL_205_Torwache_FirstWarn_12_05"); //只 有 为 国 王 服 役 的 人 才 能 进 入 市 镇 大 厅 。
	};

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other, PAL_205_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;

	PrintScreen("", -1, -1, FONT_Screen, 0);
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************
instance DIA_PAL_205_Torwache_SecondWarn(C_INFO)
{
	npc				= PAL_205_Torwache;
	nr				= 2;
	condition		= DIA_PAL_205_Torwache_SecondWarn_Condition;
	information		= DIA_PAL_205_Torwache_SecondWarn_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_PAL_205_Torwache_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE)
	&& (Npc_GetDistToWP(other, PAL_205_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_SecondWarn_Info()
{
	AI_Output(self, other, "DIA_PAL_205_Torwache_SecondWarn_12_00"); //如 果 你 再 往 前 走 一 步 ， 以 英 诺 斯 的 名 义 ， 我 将 把 你 打 趴 下 ！

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other, PAL_205_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;

	AI_StopProcessInfos(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************
instance DIA_PAL_205_Torwache_Attack(C_INFO)
{
	npc				= PAL_205_Torwache;
	nr				= 3;
	condition		= DIA_PAL_205_Torwache_Attack_Condition;
	information		= DIA_PAL_205_Torwache_Attack_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_PAL_205_Torwache_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE)
	&& (Npc_GetDistToWP(other, PAL_205_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE; // wird auch in ZS_Attack resettet

	AI_StopProcessInfos(self);

	B_Attack(self, other, AR_GuardStopsIntruder, 0);
};

// ************************************************************
// 					Ich muss mit Lord Hagen sprechen
// ************************************************************
instance DIA_PAL_205_Torwache_Hagen(C_INFO)
{
	npc				= PAL_205_Torwache;
	nr				= 2;
	condition		= DIA_PAL_205_Torwache_Hagen_Condition;
	information		= DIA_PAL_205_Torwache_Hagen_Info;
	permanent		= TRUE;
	description		= "我 需 要 同 哈 根 勋 爵 谈 话 ！";
};

func int DIA_PAL_205_Torwache_Hagen_Condition()
{
	if (PAL_205_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_Hagen_Info()
{
	AI_Output(other, self, "DIA_PAL_205_Torwache_Hagen_15_00"); //我 需 要 同 哈 根 勋 爵 谈 话 ！
	AI_Output(self, other, "DIA_PAL_205_Torwache_Hagen_12_01"); //你 知 道 我 每 天 听 到 多 少 遍 这 样 的 话 吗 ？ 你 不 能 进 去 。 只 要 你 敢 试 一 试 ， 我 就 不 得 不 杀 了 你 。

	AI_StopProcessInfos(self);
};

// ************************************************************
// 						Pass as MILIZ
// ************************************************************
instance DIA_PAL_205_Torwache_PassAsMil(C_INFO)
{
	npc				= PAL_205_Torwache;
	nr				= 3;
	condition		= DIA_PAL_205_Torwache_PassAsMil_Condition;
	information		= DIA_PAL_205_Torwache_PassAsMil_Info;
	permanent		= TRUE;
	description		= "我 是 民 兵 成 员 。";
};

func int DIA_PAL_205_Torwache_PassAsMil_Condition()
{
	if ((Npc_GetTrueGuild(other) == GIL_MIL)
	&& (PAL_205_schonmalreingelassen == FALSE)
	&& (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_PassAsMil_Info()
{
	AI_Output(other, self, "DIA_PAL_205_Torwache_PassAsMil_15_00"); //我 是 民 兵 成 员 。
	AI_Output(self, other, "DIA_PAL_205_Torwache_PassAsMil_12_01"); //好 吧 ， 你 可 以 进 去 了 。

	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_205_schonmalreingelassen = TRUE;
	AI_StopProcessInfos(self);
};

// ************************************************************
// 						Pass as MAGE
// ************************************************************
instance DIA_PAL_205_Torwache_PassAsMage(C_INFO)
{
	npc				= PAL_205_Torwache;
	nr				= 3;
	condition		= DIA_PAL_205_Torwache_PassAsMage_Condition;
	information		= DIA_PAL_205_Torwache_PassAsMage_Info;
	permanent		= TRUE;
	description		= "我 是 一 个 火 魔 法 师 。";
};

func int DIA_PAL_205_Torwache_PassAsMage_Condition()
{
	if ((Npc_GetTrueGuild(other) == GIL_KDF)
	&& (PAL_205_schonmalreingelassen == FALSE)
	&& (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_PassAsMage_Info()
{
	AI_Output(other, self, "DIA_PAL_205_Torwache_PassAsMage_15_00"); //我 是 一 个 火 魔 法 师 。
	AI_Output(self, other, "DIA_PAL_205_Torwache_PassAsMage_12_01"); //是 的 ， 当 然 。 原 谅 我 ， 天 选 者 ， 但 我 只 是 在 履 行 职 责 。

	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_205_schonmalreingelassen = TRUE;
	AI_StopProcessInfos(self);
};

// ************************************************************
// 						Pass as SÖLDNER
// ************************************************************
instance DIA_PAL_205_Torwache_PassAsSld(C_INFO)
{
	npc				= PAL_205_Torwache;
	nr				= 3;
	condition		= DIA_PAL_205_Torwache_PassAsSld_Condition;
	information		= DIA_PAL_205_Torwache_PassAsSld_Info;
	permanent		= TRUE;
	description		= "让 我 过 去 ， 我 带 着 雇 佣 兵 的 消 息 。";
};

func int DIA_PAL_205_Torwache_PassAsSld_Condition()
{
	if ((Npc_GetTrueGuild(other) == GIL_SLD)
	&& (PAL_205_schonmalreingelassen == FALSE)
	&& (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_PassAsSld_Info()
{
	AI_Output(other, self, "DIA_PAL_205_Torwache_PassAsSld_15_00"); //让 我 过 去 ， 我 带 着 雇 佣 兵 的 消 息 。
	AI_Output(self, other, "DIA_PAL_205_Torwache_PassAsSld_12_01"); //好 吧 ， 但 我 警 告 你 。 如 果 你 在 这 里 惹 出 什 么 乱 子 ， 你 会 连 后 悔 的 机 会 都 没 有 。

	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_205_schonmalreingelassen = TRUE;
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				   PERM
// ************************************************************
instance DIA_PAL_205_Torwache_PERM(C_INFO)
{
	npc				= PAL_205_Torwache;
	nr				= 2;
	condition		= DIA_PAL_205_Torwache_PERM_Condition;
	information		= DIA_PAL_205_Torwache_PERM_Info;
	permanent		= TRUE;
	description		= "你 的 责 任 呢 ？";
};

func int DIA_PAL_205_Torwache_PERM_Condition()
{
	if ((PAL_205_schonmalreingelassen == TRUE)
	&& (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_PERM_Info()
{
	AI_Output(other, self, "DIA_PAL_205_Torwache_PERM_15_00"); //你 的 责 任 呢 ？

	if ((other.guild == GIL_PAL)
	|| (other.guild == GIL_MIL))
	{
		AI_Output(self, other, "DIA_PAL_205_Torwache_PERM_12_01"); //一 切 都 在 我 们 的 控 制 之 下 。
	}
	else if (other.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_PAL_205_Torwache_PERM_12_02"); //工 作 使 我 实 现 自 我 ， 天 选 者 。
	}
	else if ((other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_PAL_205_Torwache_PERM_12_03"); //进 去 吧 ， 闭 上 你 的 嘴 。
	}
	else // GIL_None
	{
		AI_Output(self, other, "DIA_PAL_205_Torwache_PERM_12_04"); //你 想 要 什 么 ？
	};

	AI_StopProcessInfos(self);
};
