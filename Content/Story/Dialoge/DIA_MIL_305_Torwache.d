// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Mil_305_Torwache_EXIT(C_INFO)
{
	npc				= Mil_305_Torwache;
	nr				= 999;
	condition		= DIA_Mil_305_Torwache_EXIT_Condition;
	information		= DIA_Mil_305_Torwache_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Mil_305_Torwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_305_Torwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
const string Mil_305_Checkpoint = "NW_CITY_UPTOWN_PATH_02"; // WP hinter City-Tor vom Spielstart aus!
// -----------------------------------------------------------
//	var int Mil_305_schonmalreingelassen; Hab ich mal in Globals geschrieben, weils im Close Log abgefragt wird Mattes
// -----------------------------------------------------------
instance DIA_Mil_305_Torwache_FirstWarn(C_INFO)
{
	npc				= Mil_305_Torwache;
	nr				= 1;
	condition		= DIA_Mil_305_Torwache_FirstWarn_Condition;
	information		= DIA_Mil_305_Torwache_FirstWarn_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Mil_305_Torwache_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, Mil_305_Checkpoint) <= 700) // NICHT von hinten!
	{
		Npc_SetRefuseTalk(self, 5);
		return FALSE;
	};

	if ((B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) // wenn CRIME in Stadt bekannt
	&& (Mil_305_schonmalreingelassen == TRUE))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else // CRIME_NONE (oder Sheepkiller) - wenn Crime rehabilitiert, wird hier PASSGATE automatisch wieder auf TRUE gesetzt
	{
		if (Mil_305_schonmalreingelassen == TRUE)
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

func void DIA_Mil_305_Torwache_FirstWarn_Info()
{
	AI_Output(self, other, "DIA_Mil_305_Torwache_FirstWarn_03_00"); //停 下 ！

	// ------ PETZMASTER LIGHT und Personal CRIMES -------
	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		if (B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self, other, "DIA_Mil_305_Torwache_FirstWarn_03_01"); //你 因 为 谋 杀 而 遭 到 通 缉 ！ 在 那 件 事 澄 清 之 前 ， 我 不 能 让 你 进 入 城 市 富 人 区 。
		};

		if (B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self, other, "DIA_Mil_305_Torwache_FirstWarn_03_02"); //只 要 你 还 受 到 盗 窃 的 指 控 ， 你 就 不 能 进 入 富 人 区 ！
		};

		if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self, other, "DIA_Mil_305_Torwache_FirstWarn_03_03"); //像 你 这 样 会 惹 麻 烦 的 人 不 能 进 入 富 人 区 。
		};

		AI_Output(self, other, "DIA_Mil_305_Torwache_FirstWarn_03_04"); //去 找 安 德 烈 勋 爵 ， 并 解 决 问 题 ！
	}

	// ------ normales Reinkommen ------
	else
	{
		AI_Output(self, other, "DIA_Mil_305_Torwache_FirstWarn_03_05"); //只 有 市 民 和 国 王 的 部 队 才 能 进 入 镇 上 的 富 人 区 ！
	};

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other, Mil_305_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************
instance DIA_Mil_305_Torwache_SecondWarn(C_INFO)
{
	npc				= Mil_305_Torwache;
	nr				= 2;
	condition		= DIA_Mil_305_Torwache_SecondWarn_Condition;
	information		= DIA_Mil_305_Torwache_SecondWarn_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Mil_305_Torwache_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE)
	&& (Npc_GetDistToWP(other, Mil_305_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_SecondWarn_Info()
{
	AI_Output(self, other, "DIA_Mil_305_Torwache_SecondWarn_03_00"); //再 向 前 一 步 ， 你 就 会 死 。

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other, Mil_305_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;

	AI_StopProcessInfos(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************
instance DIA_Mil_305_Torwache_Attack(C_INFO)
{
	npc				= Mil_305_Torwache;
	nr				= 3;
	condition		= DIA_Mil_305_Torwache_Attack_Condition;
	information		= DIA_Mil_305_Torwache_Attack_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Mil_305_Torwache_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE)
	&& (Npc_GetDistToWP(other, Mil_305_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE; // wird auch in ZS_Attack resettet

	AI_Output(self, other, "DIA_Mil_305_Torwache_Attack_03_00"); //你 自 讨 苦 吃 … …
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_GuardStopsIntruder, 0);
};

// ***************************************************************
//					Nachricht für Lord Hagen
// ***************************************************************
instance DIA_Mil_305_Torwache_MESSAGE(C_INFO)
{
	npc				= Mil_305_Torwache;
	nr				= 1;
	condition		= DIA_Mil_305_Torwache_MESSAGE_Condition;
	information		= DIA_Mil_305_Torwache_MESSAGE_Info;
	description		= "我 给 哈 根 勋 爵 带 来 了 一 条 重 要 的 信 息 。";
};

func int DIA_Mil_305_Torwache_MESSAGE_Condition()
{
	if ((Player_KnowsLordHagen == TRUE)
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_MESSAGE_Info()
{
	AI_Output(other, self, "DIA_Mil_305_Torwache_MESSAGE_15_00"); //我 给 哈 根 勋 爵 带 来 了 一 条 重 要 的 信 息 。
	AI_Output(self, other, "DIA_Mil_305_Torwache_MESSAGE_03_01"); //城 里 有 一 半 的 人 都 想 找 哈 根 勋 爵 谈 论 重 要 问 题 。
	AI_Output(self, other, "DIA_Mil_305_Torwache_MESSAGE_03_02"); //如 果 我 们 让 每 一 个 请 愿 人 都 过 去 的 话 ， 他 除 了 解 决 市 民 的 琐 事 以 外 ， 就 不 用 再 处 理 其 它 事 了 。
};

// ***************************************************************
//							Ausnahme (PERM)
// ***************************************************************
instance DIA_Mil_305_Torwache_Ausnahme(C_INFO)
{
	npc				= Mil_305_Torwache;
	nr				= 2;
	condition		= DIA_Mil_305_Torwache_Ausnahme_Condition;
	information		= DIA_Mil_305_Torwache_Ausnahme_Info;
	permanent		= TRUE;
	description		= "我 们 不 能 破 一 次 例 吗 ？";
};

func int DIA_Mil_305_Torwache_Ausnahme_Condition()
{
	if (Mil_305_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_Ausnahme_Info()
{
	AI_Output(other, self, "DIA_Mil_305_Torwache_Ausnahme_15_00"); //我 们 不 能 破 一 次 例 吗 ？
	AI_Output(self, other, "DIA_Mil_305_Torwache_Ausnahme_03_01"); //（ 怒 吼 ） 什 么 ？ ！ 这 个 镇 上 有 自 己 的 规 则 ！ 所 有 人 都 必 须 执 行 ， 没 有 例 外 ！
	AI_Output(self, other, "DIA_Mil_305_Torwache_Ausnahme_03_02"); //如 果 我 让 你 破 坏 了 这 些 规 则 ， 那 对 其 他 那 些 遵 守 它 的 人 来 说 就 是 不 公 平 的 。
};

// ************************************************************
// 						Ich BIN Bürger!
// ************************************************************
instance DIA_Mil_305_Torwache_PassAsCitizen(C_INFO)
{
	npc				= Mil_305_Torwache;
	nr				= 2;
	condition		= DIA_Mil_305_Torwache_PassAsCitizen_Condition;
	information		= DIA_Mil_305_Torwache_PassAsCitizen_Info;
	permanent		= TRUE;
	description		= "我 是 一 名 克 霍 里 尼 斯 尊 贵 的 市 民 ！ 让 我 过 去 ！";
};

func int DIA_Mil_305_Torwache_PassAsCitizen_Condition()
{
	if ((Mil_305_schonmalreingelassen == FALSE)
	&& (Kapitel <= 1))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_PassAsCitizen_Info()
{
	AI_Output(other, self, "DIA_Mil_305_Torwache_PassAsCitizen_15_00"); //我 是 一 名 克 霍 里 尼 斯 尊 贵 的 市 民 ！ 让 我 过 去 ！

	if (Player_IsApprentice > APP_NONE)
	{
		AI_Output(self, other, "DIA_Mil_305_Torwache_PassAsCitizen_03_01"); //无 论 克 霍 里 尼 斯 的 工 匠 大 师 是 怎 么 雇 佣 你 做 学 徒 的 - 我 都 不 想 知 道 。
		AI_Output(self, other, "DIA_Mil_305_Torwache_PassAsCitizen_03_02"); //你 可 以 进 去 ！ 但 是 注 意 你 的 行 为 ！ 否 则 你 就 会 遇 到 一 生 中 最 大 的 麻 烦 ！

		self.aivar[AIV_PASSGATE] = TRUE;
		Mil_305_schonmalreingelassen = TRUE;
		B_CheckLog();
		AI_StopProcessInfos(self);
	}
	else if ((MIS_Matteo_Gold == LOG_SUCCESS)
	|| (MIS_Thorben_GetBlessings == LOG_SUCCESS)
	|| (MIS_Bosper_Bogen == LOG_SUCCESS) || (MIS_Bosper_WolfFurs == LOG_SUCCESS)
	|| (MIS_Harad_Orc == LOG_SUCCESS) || (MIS_HakonBandits == LOG_SUCCESS))
	{
		AI_Output(self, other, "DIA_Mil_305_Torwache_PassAsCitizen_03_03"); //你 也 许 得 到 了 城 镇 的 贫 民 区 中 某 些 工 匠 大 师 的 赞 赏 ， 但 是 如 果 你 是 这 个 城 镇 的 市 民 的 话 ， 我 一 定 会 知 道 的 ！
		AI_Output(self, other, "DIA_Mil_305_Torwache_PassAsCitizen_03_04"); //别 想 欺 骗 我 ！ 我 警 告 你 ！
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, other, "DIA_Mil_305_Torwache_PassAsCitizen_03_05"); //你 只 是 我 指 甲 里 的 污 垢 ！ 滚 开 ！
		AI_StopProcessInfos(self);
	};
};

// ************************************************************
// 						Pass as MILIZ
// ************************************************************
instance DIA_Mil_305_Torwache_PassAsMil(C_INFO)
{
	npc				= Mil_305_Torwache;
	nr				= 3;
	condition		= DIA_Mil_305_Torwache_PassAsMil_Condition;
	information		= DIA_Mil_305_Torwache_PassAsMil_Info;
	permanent		= TRUE;
	description		= "我 属 于 民 兵 - 让 我 过 去 ！";
};

func int DIA_Mil_305_Torwache_PassAsMil_Condition()
{
	if ((other.guild == GIL_MIL)
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_PassAsMil_Info()
{
	AI_Output(other, self, "DIA_Mil_305_Torwache_PassAsMil_15_00"); //我 属 于 民 兵 - 让 我 过 去 ！
	AI_Output(self, other, "DIA_Mil_305_Torwache_PassAsMil_03_01"); //这 么 说 安 德 烈 接 受 你 了 ？ 那 样 的 话 ， 你 就 不 会 是 个 坏 人 ！
	AI_Output(self, other, "DIA_Mil_305_Torwache_PassAsMil_03_02"); //你 现 在 是 城 市 的 保 护 者 之 一 了 ！ 所 以 要 和 蔼 、 友 善 地 对 待 市 民 ！

	self.aivar[AIV_PASSGATE] = TRUE;
	Mil_305_schonmalreingelassen = TRUE;
	B_CheckLog();
	AI_StopProcessInfos(self);
};

// ************************************************************
// 						Pass as MAGE
// ************************************************************
instance DIA_Mil_305_Torwache_PassAsMage(C_INFO)
{
	npc				= Mil_305_Torwache;
	nr				= 3;
	condition		= DIA_Mil_305_Torwache_PassAsMage_Condition;
	information		= DIA_Mil_305_Torwache_PassAsMage_Info;
	permanent		= TRUE;
	description		= "你 胆 敢 挡 住 英 诺 斯 的 代 表 的 路 ？！";
};

func int DIA_Mil_305_Torwache_PassAsMage_Condition()
{
	if ((other.guild == GIL_KDF)
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_PassAsMage_Info()
{
	AI_Output(other, self, "DIA_Mil_305_Torwache_PassAsMage_15_00"); //你 胆 敢 挡 住 英 诺 斯 的 代 表 的 路 ？！
	AI_Output(self, other, "DIA_Mil_305_Torwache_PassAsMage_03_01"); //嗯 … … 不 ！ 当 然 不 ！ 大 门 将 为 英 诺 斯 的 选 择 者 敞 开 ！
	AI_Output(other, self, "DIA_Mil_305_Torwache_PassAsMage_15_02"); //恳 请 英 诺 斯 宽 恕 这 种 亵 渎 ！
	AI_Output(self, other, "DIA_Mil_305_Torwache_PassAsMage_03_03"); //是 的 ， 天 选 者 ！

	self.aivar[AIV_PASSGATE] = TRUE;
	Mil_305_schonmalreingelassen = TRUE;
	B_CheckLog();
	AI_StopProcessInfos(self);
};

// ************************************************************
// 						Pass as SÖLDNER
// ************************************************************
instance DIA_Mil_305_Torwache_PassAsSld(C_INFO)
{
	npc				= Mil_305_Torwache;
	nr				= 3;
	condition		= DIA_Mil_305_Torwache_PassAsSld_Condition;
	information		= DIA_Mil_305_Torwache_PassAsSld_Info;
	permanent		= TRUE;
	description		= "我 有 一 条 重 要 的 信 息 给 哈 根 勋 爵 ！";
};

func int DIA_Mil_305_Torwache_PassAsSld_Condition()
{
	if ((other.guild == GIL_SLD)
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_PassAsSld_Info()
{
	AI_Output(other, self, "DIA_Mil_305_Torwache_PassAsSld_15_00"); //我 有 一 条 重 要 的 信 息 给 哈 根 勋 爵 ！
	AI_Output(self, other, "DIA_Mil_305_Torwache_PassAsSld_03_01"); //你 是 那 些 雇 佣 兵 流 氓 的 一 员 ！ 你 究 竟 想 找 哈 根 勋 爵 做 什 么 ？！
	AI_Output(other, self, "DIA_Mil_305_Torwache_PassAsSld_15_02"); //我 带 来 了 一 份 和 平 协 议 。
	AI_Output(self, other, "DIA_Mil_305_Torwache_PassAsSld_03_03"); //啊 ！ 你 们 这 些 恶 棍 终 于 有 点 理 智 了 。 那 么 去 见 哈 根 勋 爵 吧 ， 但 是 要 有 礼 貌 ， 否 则 他 一 定 会 教 训 你 这 个 蠢 货 ！

	self.aivar[AIV_PASSGATE] = TRUE;
	Mil_305_schonmalreingelassen = TRUE;
	B_CheckLog();
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				   PERM
// ************************************************************
instance DIA_Mil_305_Torwache_PERM(C_INFO)
{
	npc				= Mil_305_Torwache;
	nr				= 1;
	condition		= DIA_Mil_305_Torwache_PERM_Condition;
	information		= DIA_Mil_305_Torwache_PERM_Info;
	permanent		= TRUE;
	description		= "怎 么 样 了 ？";
};

func int DIA_Mil_305_Torwache_PERM_Condition()
{
	if ((Mil_305_schonmalreingelassen == TRUE)
	&& (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_PERM_Info()
{
	AI_Output(other, self, "DIA_Mil_305_Torwache_PERM_15_00"); //怎 么 样 了 ？

	if ((other.guild == GIL_PAL)
	|| (other.guild == GIL_MIL))
	{
		AI_Output(self, other, "DIA_Mil_305_Torwache_PERM_03_01"); //一 切 都 好 ， 伙 伴 ！
	}
	else if (other.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Mil_305_Torwache_PERM_03_02"); //我 们 只 是 在 这 里 履 行 我 们 的 职 责 。 谢 谢 你 注 意 到 我 ， 天 选 者 ！
	}
	else if ((other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Mil_305_Torwache_PERM_03_03"); //我 不 得 不 放 你 进 去 ， 但 我 不 一 定 要 和 你 说 话 ！
	}
	else // GIL_None
	{
		AI_Output(self, other, "DIA_Mil_305_Torwache_PERM_03_04"); //你 想 要 什 么 ？
	};

	AI_StopProcessInfos(self);
};
