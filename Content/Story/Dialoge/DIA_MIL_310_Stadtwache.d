// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Mil_310_Stadtwache_EXIT(C_INFO)
{
	npc				= Mil_310_Stadtwache;
	nr				= 999;
	condition		= DIA_Mil_310_Stadtwache_EXIT_Condition;
	information		= DIA_Mil_310_Stadtwache_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Mil_310_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_310_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
const string Mil_310_Checkpoint = "NW_CITY_ENTRANCE_MAIN"; // WP hinter City-Tor vom Spielstart aus!
// -----------------------------------------------------------
var int MIL_310_Personal_AbsolutionLevel;
// var int Mil_310_schonmalreingelassen; --> GLOBALS
// -----------------------------------------------------------
instance DIA_Mil_310_Stadtwache_FirstWarn(C_INFO)
{
	npc				= Mil_310_Stadtwache;
	nr				= 1;
	condition		= DIA_Mil_310_Stadtwache_FirstWarn_Condition;
	information		= DIA_Mil_310_Stadtwache_FirstWarn_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Mil_310_Stadtwache_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, Mil_310_Checkpoint) <= 700) // NICHT von hinten!
	{
		Npc_SetRefuseTalk(self, 5);
		return FALSE;
	};

	if ((B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) // wenn CRIME in Stadt bekannt
	&& (B_GetCurrentAbsolutionLevel(self) == MIL_310_Personal_AbsolutionLevel)) // und noch nicht bezahlt
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else // CRIME_NONE (oder Sheepkiller) - wenn Crime rehabilitiert, wird hier PASSGATE automatisch wieder auf TRUE gesetzt
	{
		if (Mil_310_schonmalreingelassen == TRUE)
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

func void DIA_Mil_310_Stadtwache_FirstWarn_Info()
{
	AI_Output(self, other, "DIA_Mil_310_Stadtwache_FirstWarn_07_00"); //停 下 ！

	// ------ PETZMASTER LIGHT ------
	if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		AI_Output(other, self, "DIA_Mil_310_Stadtwache_FirstWarn_15_01"); //（ 叹 息 ） 那 是 什 么 ？
		AI_Output(self, other, "DIA_Mil_310_Stadtwache_FirstWarn_07_02"); //你 很 清 楚 是 什 么 ！

		if (B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self, other, "DIA_Mil_310_Stadtwache_FirstWarn_07_03"); //你 因 为 谋 杀 而 在 城 市 中 遭 到 通 缉 ！
		};

		if (B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self, other, "DIA_Mil_310_Stadtwache_FirstWarn_07_04"); //我 们 这 里 不 需 要 卑 鄙 的 盗 贼 ！
		};

		if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self, other, "DIA_Mil_310_Stadtwache_FirstWarn_07_05"); //我 们 的 城 市 里 不 需 要 制 造 麻 烦 的 家 伙 ！
		};

		AI_Output(self, other, "DIA_Mil_310_Stadtwache_FirstWarn_07_06"); //你 为 什 么 认 为 我 们 会 让 你 进 去 ？
	}
	else // ------ normales Reinkommen ------
	{
		var C_Item itm; itm = Npc_GetEquippedArmor(other);

		// ------ ohne Rüstung ------
		if ((Npc_HasEquippedArmor(other) == FALSE)
		&& (hero.guild == GIL_NONE))
		{
			AI_Output(other, self, "DIA_Mil_310_Stadtwache_FirstWarn_15_07"); //那 是 什 么 ？
			AI_Output(self, other, "DIA_Mil_310_Stadtwache_FirstWarn_07_08"); //你 不 能 进 这 里 ， 小 子 ！
			AI_Output(other, self, "DIA_Mil_310_Stadtwache_FirstWarn_15_09"); //为 什 么 不 ？
			AI_Output(self, other, "DIA_Mil_310_Stadtwache_FirstWarn_07_10"); //看 看 你 衣 衫 褴 褛 的 样 子 就 知 道 ， 你 只 会 在 这 里 惹 麻 烦 ！
			AI_Output(self, other, "DIA_Mil_310_Stadtwache_FirstWarn_07_11"); //我 们 的 城 里 已 经 有 很 多 乌 合 之 众 了 。 我 们 不 需 要 没 钱 的 人 。

			Log_CreateTopic(TOPIC_City, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_City, LOG_RUNNING);
			B_LogEntry(TOPIC_City, TOPIC_City_3);
		}

		// ------ als Bauer ------
		else if ((Hlp_IsItem(itm, ItAr_Bau_L) == TRUE)
		|| (Hlp_IsItem(itm, ItAr_Bau_M) == TRUE))
		{
			if (self.aivar[AIV_TalkedToPlayer] == TRUE)
			{
				AI_Output(self, other, "DIA_Mil_310_Stadtwache_FirstWarn_07_12"); //你 这 次 想 要 做 什 么 ？
				AI_Output(other, self, "DIA_Mil_310_Stadtwache_FirstWarn_15_13"); //农 场 主 派 我 来 的 。
				AI_Output(self, other, "DIA_Mil_310_Stadtwache_FirstWarn_07_14"); //真 的 ？ 那 你 这 次 至 少 有 个 象 样 的 理 由 来 这 里 吗 ？
			}
			else // zum ersten Mal da
			{
				AI_Output(self, other, "DIA_Mil_310_Stadtwache_FirstWarn_07_15"); //你 在 洛 拔 特 的 农 场 帮 工 ？ 我 以 前 从 在 这 里 没 见 过 你 ！
				AI_Output(other, self, "DIA_Mil_310_Stadtwache_FirstWarn_15_16"); //我 跟 着 洛 拔 特 时 间 不 长 。
				AI_Output(self, other, "DIA_Mil_310_Stadtwache_FirstWarn_07_17"); //你 想 去 城 市 做 什 么 ？
			};
		}

		// ------ alle anderen Rüstungen ------
		else
		{
			AI_Output(other, self, "DIA_Mil_310_Stadtwache_FirstWarn_15_18"); //（ 平 静 的 ） 什 么 ？
			if ((hero.guild == GIL_PAL)
			|| (hero.guild == GIL_KDF))
			{
				AI_Output(self, other, "DIA_Mil_310_Stadtwache_FirstWarn_07_19"); //请 原 谅 ， 但 那 是 我 们 的 命 令 。
				AI_Output(other, self, "DIA_Mil_310_Stadtwache_FirstWarn_15_20"); //你 想 要 阻 止 我 ？
				AI_Output(self, other, "DIA_Mil_310_Stadtwache_FirstWarn_07_21"); //当 然 不 。 所 有 英 诺 斯 教 会 的 成 员 一 定 会 受 到 欢 迎 。
			}
			else
			{
				AI_Output(self, other, "DIA_Mil_310_Stadtwache_FirstWarn_07_22"); //我 只 想 看 一 下 你 。 看 来 你 有 一 点 钱 ， 你 可 以 进 去 了 。
			};

			self.aivar[AIV_PASSGATE] = TRUE;
			Stadtwache_333.aivar[AIV_PASSGATE] = TRUE; // Wache vom anderen Stadttor
			Mil_310_schonmalreingelassen = TRUE;
			B_CheckLog();

			AI_StopProcessInfos(self);
		};
	};

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other, Mil_310_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************
instance DIA_Mil_310_Stadtwache_SecondWarn(C_INFO)
{
	npc				= Mil_310_Stadtwache;
	nr				= 2;
	condition		= DIA_Mil_310_Stadtwache_SecondWarn_Condition;
	information		= DIA_Mil_310_Stadtwache_SecondWarn_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Mil_310_Stadtwache_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE)
	&& (Npc_GetDistToWP(other, Mil_310_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_SecondWarn_Info()
{
	AI_Output(self, other, "DIA_Mil_310_Stadtwache_SecondWarn_07_00"); //别 做 傻 事 。 再 向 前 一 步 ， 我 就 把 你 砍 成 碎 片 ！

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other, Mil_310_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;

	AI_StopProcessInfos(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************
instance DIA_Mil_310_Stadtwache_Attack(C_INFO)
{
	npc				= Mil_310_Stadtwache;
	nr				= 3;
	condition		= DIA_Mil_310_Stadtwache_Attack_Condition;
	information		= DIA_Mil_310_Stadtwache_Attack_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Mil_310_Stadtwache_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE)
	&& (Npc_GetDistToWP(other, Mil_310_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE; // wird auch in ZS_Attack resettet

	AI_Output(self, other, "DIA_Mil_310_Stadtwache_Attack_07_00"); //你 自 讨 苦 吃 … …

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_GuardStopsIntruder, 0);
};

// ************************************************************
// 							Bestechung!
// ************************************************************
instance DIA_Mil_310_Stadtwache_Bribe(C_INFO)
{
	npc				= Mil_310_Stadtwache;
	nr				= 5;
	condition		= DIA_Mil_310_Stadtwache_Bribe_Condition;
	information		= DIA_Mil_310_Stadtwache_Bribe_Info;
	permanent		= TRUE;
	description		= "这 是 １ ０ ０ 枚 金 币 。 让 我 过 去 ！";
};

func int DIA_Mil_310_Stadtwache_Bribe_Condition()
{
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_Bribe_Info()
{
	AI_Output(other, self, "DIA_Mil_310_Stadtwache_Bribe_15_00"); //这 是 １ ０ ０ 枚 金 币 。 让 我 过 去 ！

	if (B_GiveInvItems(other, self, itmi_gold, 100))
	{
		AI_Output(self, other, "DIA_Mil_310_Stadtwache_Bribe_07_01"); //（ 贪 婪 的 ）100枚 金 币 听 起 来 不 错 。 那 你 进 去 吧 。

		if (B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
		{
			AI_Output(self, other, "DIA_Mil_310_Stadtwache_Bribe_07_02"); //直 接 去 找 安 德 烈 勋 爵 ！ 否 则 你 下 次 还 得 再 付 另 外100枚 金 币 ！
		};

		self.aivar[AIV_PASSGATE] = TRUE;
		Stadtwache_333.aivar[AIV_PASSGATE] = TRUE; // Wache vom anderen Stadttor
		Mil_310_schonmalreingelassen = TRUE;
		B_CheckLog();

		// ------ wenn bezahlt, persönliche Absolution erteilen -------
		MIL_310_Personal_AbsolutionLevel = B_GetCurrentAbsolutionLevel(self) + 1;
	}
	else // nicht genug Gold
	{
		AI_Output(self, other, "DIA_Mil_310_Stadtwache_Bribe_07_03"); //什 么 ？ ！ 在 哪 儿 ？ ！ 我 没 看 到 你 有100枚 金 币 。 走 开 ！
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
// 						Passierschein
// ************************************************************
instance DIA_Mil_310_Stadtwache_Passierschein(C_INFO)
{
	npc				= Mil_310_Stadtwache;
	nr				= 4;
	condition		= DIA_Mil_310_Stadtwache_Passierschein_Condition;
	information		= DIA_Mil_310_Stadtwache_Passierschein_Info;
	description		= "我 有 一 张 通 行 证 ！";
};

func int DIA_Mil_310_Stadtwache_Passierschein_Condition()
{
	if ((Npc_HasItems(other, ItWr_Passierschein))
	&& (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)
	&& (Mil_310_schonmalreingelassen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_Passierschein_Info()
{
	AI_Output(other, self, "DIA_Mil_310_Stadtwache_Passierschein_15_00"); //我 有 一 张 通 行 证 ！

	if (Npc_HasEquippedArmor(other) == FALSE) // ohne Rüstung
	{
		AI_Output(self, other, "DIA_Mil_310_Stadtwache_Passierschein_07_01"); //真 的 ？ 你 杀 了 谁 ， 你 这 个 杀 人 犯 ？
		AI_Output(other, self, "DIA_Mil_310_Stadtwache_Passierschein_15_02"); //现 在 你 是 让 我 过 去 呢 ， 还 是 不 让 ？
		AI_Output(self, other, "DIA_Mil_310_Stadtwache_Passierschein_07_03"); //嗯 ， 进 去 吧 ， 趁 我 还 没 改 变 主 意 ！
	}
	else
	{
		AI_Output(self, other, "DIA_Mil_310_Stadtwache_Passierschein_07_04"); //似 乎 还 行 。 继 续 走 。
	};

	self.aivar[AIV_PASSGATE] = TRUE;
	Stadtwache_333.aivar[AIV_PASSGATE] = TRUE; // Wache vom anderen Stadttor
	Mil_310_schonmalreingelassen = TRUE;
	B_CheckLog();

	AI_StopProcessInfos(self);
};

// ************************************************************
// 						Will zum Schmied
// ************************************************************
instance DIA_Mil_310_Stadtwache_ZumSchmied(C_INFO)
{
	npc				= Mil_310_Stadtwache;
	nr				= 3;
	condition		= DIA_Mil_310_Stadtwache_ZumSchmied_Condition;
	information		= DIA_Mil_310_Stadtwache_ZumSchmied_Info;
	description		= "我 要 去 找 铁 匠 ， 修 理 一 些 工 具 。";
};

func int DIA_Mil_310_Stadtwache_ZumSchmied_Condition()
{
	var C_Item itm; itm = Npc_GetEquippedArmor(other);

	if (((Hlp_IsItem(itm, ItAr_Bau_L) == TRUE) || (Hlp_IsItem(itm, ItAr_Bau_M) == TRUE))
	&& (Npc_KnowsInfo(other, DIA_Maleth_ToTheCity))
	&& (Mil_310_schonmalreingelassen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_ZumSchmied_Info()
{
	AI_Output(other, self, "DIA_Mil_310_Stadtwache_ZumSchmied_15_00"); //我 要 去 找 铁 匠 ， 修 理 一 些 工 具 。

	if (Mil_310_Scheisse_erzaehlt == TRUE)
	{
		AI_Output(self, other, "DIA_Mil_310_Stadtwache_ZumSchmied_07_01"); //（ 生 气 ） 哦 ？ 你 刚 才 为 什 么 不 这 么 说 ？
		AI_Output(other, self, "DIA_Mil_310_Stadtwache_ZumSchmied_15_02"); //我 只 是 想 知 道 你 会 有 什 么 反 应 。
		AI_Output(self, other, "DIA_Mil_310_Stadtwache_ZumSchmied_07_03"); //什 么 ？ ！ 再 对 我 那 么 做 的 话 ， 我 就 让 你 看 看 我 对 那 样 的 事 有 什 么 反 应 ， 你 这 愚 蠢 的 乡 巴 佬 ！
	}
	else
	{
		AI_Output(self, other, "DIA_Mil_310_Stadtwache_ZumSchmied_07_04"); //好 吧 ， 很 好 ， 那 你 进 去 吧 。
	};

	AI_Output(self, other, "DIA_Mil_310_Stadtwache_ZumSchmied_07_05"); //如 果 你 见 到 洛 拔 特 ， 你 应 该 告 诉 他 把 绵 羊 喂 的 肥 一 点 ， 我 们 很 快 就 回 去 找 他 ！ （ 讨 厌 的 大 笑 ）

	self.aivar[AIV_PASSGATE] = TRUE;
	Stadtwache_333.aivar[AIV_PASSGATE] = TRUE; // Wache vom anderen Stadttor
	Mil_310_schonmalreingelassen = TRUE;
	B_CheckLog();
	B_GivePlayerXP(XP_Ambient);

	AI_StopProcessInfos(self);
};

// ************************************************************
// 				Planzen für Constantino
// ************************************************************
instance DIA_Addon_Mil_310_Stadtwache_Constantino(C_INFO)
{
	npc				= Mil_310_Stadtwache;
	nr				= 2;
	condition		= DIA_Addon_Mil_310_Stadtwache_Constantino_Condition;
	information		= DIA_Addon_Mil_310_Stadtwache_Constantino_Info;
	permanent		= TRUE;
	description		= "我 给 炼 金 术 士 康 斯 坦 提 诺 带 来 一 些 草 药 。";
};

func int DIA_Addon_Mil_310_Stadtwache_Constantino_Condition()
{
	if ((MIS_Addon_Lester_PickForConstantino == LOG_RUNNING)
	&& (Mil_310_schonmalreingelassen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Mil_310_Stadtwache_Constantino_Info()
{
	AI_Output(other, self, "DIA_Addon_Mil_310_Stadtwache_Constantino_15_00"); //我 要 给 炼 金 术 士 康 斯 坦 提 诺 送 一 些 草 药 。

	if ((Npc_HasItems(other, ItPl_Mana_Herb_01) > 0)
	|| (Npc_HasItems(other, ItPl_Mana_Herb_02) > 0)
	|| (Npc_HasItems(other, ItPl_Mana_Herb_03) > 0)
	|| (Npc_HasItems(other, ItPl_Health_Herb_01) > 0)
	|| (Npc_HasItems(other, ItPl_Health_Herb_02) > 0)
	|| (Npc_HasItems(other, ItPl_Health_Herb_03) > 0)
	|| (Npc_HasItems(other, ItPl_Dex_Herb_01) > 0)
	|| (Npc_HasItems(other, ItPl_Strength_Herb_01) > 0)
	|| (Npc_HasItems(other, ItPl_Speed_Herb_01) > 0)
	|| (Npc_HasItems(other, ItPl_Temp_Herb) > 0)
	|| (Npc_HasItems(other, ItPl_Perm_Herb) > 0)
	|| (Npc_HasItems(other, ItPl_Beet) > 0))
	{
		AI_Output(self, other, "DIA_Addon_Mil_310_Stadtwache_Constantino_07_01"); //（ 狡 诈 的 ） 真 的 ？ 那 你 不 会 介 意 让 我 看 看 你 带 来 的 东 西 吧 。

		if ((Npc_HasItems(other, ItPl_Mana_Herb_01) >= MinimumPassagePlants)
		|| (Npc_HasItems(other, ItPl_Mana_Herb_02) >= MinimumPassagePlants)
		|| (Npc_HasItems(other, ItPl_Mana_Herb_03) >= MinimumPassagePlants)
		|| (Npc_HasItems(other, ItPl_Health_Herb_01) >= MinimumPassagePlants)
		|| (Npc_HasItems(other, ItPl_Health_Herb_02) >= MinimumPassagePlants)
		|| (Npc_HasItems(other, ItPl_Health_Herb_03) >= MinimumPassagePlants)
		|| (Npc_HasItems(other, ItPl_Dex_Herb_01) >= MinimumPassagePlants)
		|| (Npc_HasItems(other, ItPl_Strength_Herb_01) >= MinimumPassagePlants)
		|| (Npc_HasItems(other, ItPl_Speed_Herb_01) >= MinimumPassagePlants)
		|| (Npc_HasItems(other, ItPl_Temp_Herb) >= MinimumPassagePlants)
		|| (Npc_HasItems(other, ItPl_Perm_Herb) >= MinimumPassagePlants))
		{
			AI_Output(self, other, "DIA_Addon_Mil_310_Stadtwache_Constantino_07_02"); //（ 满 意 的 ） 嗯 。 看 起 来 还 不 错 。 好 ， 进 去 吧 。 但 是 不 要 惹 麻 烦 ， 明 白 吗 ？

			self.aivar[AIV_PASSGATE] = TRUE;
			Stadtwache_333.aivar[AIV_PASSGATE] = TRUE; // Wache vom anderen Stadttor
			Mil_310_schonmalreingelassen = TRUE;
			MIS_Addon_Lester_PickForConstantino = LOG_SUCCESS;
			B_CheckLog();
			B_GivePlayerXP(XP_Addon_PickForConstantino);
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self, other, "DIA_Addon_Mil_310_Stadtwache_Constantino_07_03"); //什 么 ？ 这 是 什 么 ？

			if (Npc_HasItems(other, ItPl_Beet) >= MinimumPassagePlants)
			{
				AI_Output(self, other, "DIA_Addon_Mil_310_Stadtwache_Constantino_07_04"); //炼 金 术 士 要 一 堆 萝 卜 做 什 么 用 ？ 你 想 要 变 得 聪 明 点 吗 ？ 走 开 。
			}
			else
			{
				AI_Output(self, other, "DIA_Addon_Mil_310_Stadtwache_Constantino_07_05"); //我 不 太 了 解 炼 金 术 ， 但 是 谁 能 用 这 样 一 捆 蔬 菜 混 合 出 什 么 东 西 吗 ？ 你 想 得 美 。
			};
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Mil_310_Stadtwache_Constantino_07_06"); //什 么 草 药 ？ 你 根 本 没 有 草 药 。 走 开 ！
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
// 						Miliz werden
// ************************************************************
instance DIA_Mil_310_Stadtwache_MilizWerden(C_INFO)
{
	npc				= Mil_310_Stadtwache;
	nr				= 2;
	condition		= DIA_Mil_310_Stadtwache_MilizWerden_Condition;
	information		= DIA_Mil_310_Stadtwache_MilizWerden_Info;
	description		= "我 来 加 入 民 兵 ！";
};

func int DIA_Mil_310_Stadtwache_MilizWerden_Condition()
{
	if (Mil_310_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_MilizWerden_Info()
{
	AI_Output(other, self, "DIA_Mil_310_Stadtwache_MilizWerden_15_00"); //我 来 加 入 民 兵 ！
	AI_Output(self, other, "DIA_Mil_310_Stadtwache_MilizWerden_07_01"); //干 得 不 错 ！ 去 别 的 大 门 试 试 吧 - 也 许 他 们 吃 你 这 一 套 。

	Mil_310_Scheisse_erzaehlt = TRUE;
};

// ************************************************************
// 				Wichtige Nachricht für Paladine
// ************************************************************
instance DIA_Mil_310_Stadtwache_Paladine(C_INFO)
{
	npc				= Mil_310_Stadtwache;
	nr				= 1;
	condition		= DIA_Mil_310_Stadtwache_Paladine_Condition;
	information		= DIA_Mil_310_Stadtwache_Paladine_Info;
	description		= "我 要 见 圣 骑 士 的 首 领 。";
};

func int DIA_Mil_310_Stadtwache_Paladine_Condition()
{
	if (Mil_310_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_Paladine_Info()
{
	AI_Output(other, self, "DIA_Mil_310_Stadtwache_Paladine_15_00"); //我 要 见 圣 骑 士 的 首 领 ！ 我 有 一 条 重 要 消 息 告 诉 他 ！
	AI_Output(self, other, "DIA_Mil_310_Stadtwache_Paladine_07_01"); //哦 ？ 是 什 么 重 要 消 息 ？

	Mil_310_Scheisse_erzaehlt = TRUE;

	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, "这 座 城 市 马 上 就 要 遭 到 攻 击 了 ！", DIA_Mil_310_Stadtwache_Paladine_AttackSoon);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, "邪 恶 的 部 队 正 驻 扎 在 克 霍 里 尼 斯 的 山 谷 里 ！", DIA_Mil_310_Stadtwache_Paladine_EvilArmy);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, "我 来 取 英 诺 斯 之 眼 ！", DIA_Mil_310_Stadtwache_Paladine_EyeInnos);
};

func void DIA_Mil_310_Stadtwache_Paladine_EyeInnos() // 1
{
	AI_Output(other, self, "DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_00"); //我 来 取 英 诺 斯 之 眼 ！
	AI_Output(self, other, "DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_01"); //什 么 ？ 从 没 听 说 过 - 那 会 是 什 么 ？
	AI_Output(other, self, "DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_02"); //它 是 一 件 重 要 的 宝 物 。
	AI_Output(self, other, "DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_03"); //你 看 起 来 不 像 是 什 么 重 要 的 信 使 。 你 有 身 份 证 明 吗 ？
	if (!Npc_HasItems(other, itwr_passierschein) > 0)
	{
		AI_Output(other, self, "DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_04"); //不 ， 我 没 有!
		AI_Output(self, other, "DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_05"); //那 就 不 要 浪 费 我 的 时 间 ！
	};

	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
};

func void DIA_Mil_310_Stadtwache_Paladine_EvilArmy() // 2 --> weiter
{
	AI_Output(other, self, "DIA_Mil_310_Stadtwache_Paladine_EvilArmy_15_00"); //邪 恶 的 部 队 正 驻 扎 在 克 霍 里 尼 斯 的 山 谷 里 ！
	AI_Output(self, other, "DIA_Mil_310_Stadtwache_Paladine_EvilArmy_07_01"); //在 矿 藏 山 谷 里 ？ 你 从 那 里 来 ？ 你 见 到 那 支 军 队 了 ？

	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, "不 - 不 过 派 我 来 的 那 个 人 看 到 了 他 们 。", DIA_Mil_310_Stadtwache_Paladine_NoSomeone);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, "不 。 但 是 我 知 道 那 是 由 龙 率 领 的 ！", DIA_Mil_310_Stadtwache_Paladine_NoDragons);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, "是 的 。 我 去 过 克 霍 里 尼 斯 山 谷 。 我 看 到 了 一 些 巨 大 的 龙 ！", DIA_Mil_310_Stadtwache_Paladine_YesDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_AttackSoon() // 3 --> weiter
{
	AI_Output(other, self, "DIA_Mil_310_Stadtwache_Paladine_AttackSoon_15_00"); //这 座 城 市 马 上 就 要 遭 到 攻 击 了 ！
	AI_Output(self, other, "DIA_Mil_310_Stadtwache_Paladine_AttackSoon_07_01"); //什 么 ？ 谁 ？ 兽 人 ？ 你 见 到 我 们 的 军 队 了 吗 ？

	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, "不 - 不 过 派 我 来 的 那 个 人 看 到 了 他 们 。", DIA_Mil_310_Stadtwache_Paladine_NoSomeone);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, "不 。 但 是 我 知 道 那 是 由 龙 率 领 的 ！", DIA_Mil_310_Stadtwache_Paladine_NoDragons);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, "是 的 。 我 去 过 克 霍 里 尼 斯 山 谷 。 我 看 到 了 一 些 巨 大 的 龙 ！", DIA_Mil_310_Stadtwache_Paladine_YesDragons);
};

// ------------------------------------------------------------------------
func void DIA_Mil_310_Stadtwache_Paladine_NoDragons() // +1
{
	AI_Output(other, self, "DIA_Mil_310_Stadtwache_Paladine_NoDragons_15_00"); //不 。 但 是 我 知 道 那 是 由 龙 率 领 的 ！
	AI_Output(self, other, "DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_01"); //当 然 ！ 我 的 祖 母 还 见 到 过 兽 人 将 军 。
	AI_Output(self, other, "DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_02"); //你 别 指 望 我 们 会 让 你 用 一 些 那 样 的 无 稽 之 谈 打 扰 哈 根 勋 爵 ！
	AI_Output(self, other, "DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_03"); //滚 开 ！
	Player_KnowsLordHagen = TRUE;

	AI_StopProcessInfos(self);
};

func void DIA_Mil_310_Stadtwache_Paladine_NoSomeone() // +2 --> weiter
{
	AI_Output(other, self, "DIA_Mil_310_Stadtwache_Paladine_NoSomeone_15_00"); //不 - 不 过 派 我 来 的 那 个 人 看 到 了 他 们 。
	AI_Output(self, other, "DIA_Mil_310_Stadtwache_Paladine_NoSomeone_07_01"); //（ 不 信 任 的 ） 谁 派 你 来 的 ？

	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, "我 无 权 告 诉 你 那 些 。", DIA_Mil_310_Stadtwache_Paladine_CantTellYou);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, "一 个 圣 骑 士 。", DIA_Mil_310_Stadtwache_Paladine_APaladin);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, "一 个 魔 法 师 。", DIA_Mil_310_Stadtwache_Paladine_AMage);
};

func void DIA_Mil_310_Stadtwache_Paladine_YesDragons() // +3
{
	AI_Output(other, self, "DIA_Mil_310_Stadtwache_Paladine_YesDragons_15_00"); //是 的 。 我 去 过 克 霍 里 尼 斯 山 谷 。 我 看 到 了 一 些 巨 大 的 龙 ！
	AI_Output(self, other, "DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_01"); //你 这 个 说 谎 的 家 伙 ！ 去 山 谷 的 关 卡 两 边 都 被 守 住 了 。 没 人 能 通 过 ！
	AI_Output(self, other, "DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_02"); //滚 出 去 ！

	AI_StopProcessInfos(self);
};

// -------------------------------------
func void DIA_Mil_310_Stadtwache_Paladine_AMage() // ++1
{
	AI_Output(other, self, "DIA_Mil_310_Stadtwache_Paladine_AMage_15_00"); //一 个 魔 法 师 。
	AI_Output(self, other, "DIA_Mil_310_Stadtwache_Paladine_AMage_07_01"); //你 有 魔 法 师 的 消 息 ？ 那 你 一 定 有 标 志 来 证 明 ！
	AI_Output(other, self, "DIA_Mil_310_Stadtwache_Paladine_AMage_15_02"); //不.
	AI_Output(self, other, "DIA_Mil_310_Stadtwache_Paladine_AMage_07_03"); //什 么 ？ 魔 法 师 总 会 给 他 们 的 信 使 一 个 证 明 。
	AI_Output(other, self, "DIA_Mil_310_Stadtwache_Paladine_AMage_15_04"); //不 是 这 个 魔 法 师 。
	AI_Output(self, other, "DIA_Mil_310_Stadtwache_Paladine_AMage_07_05"); //我 不 相 信 你 。 如 果 你 不 是 真 正 的 信 使 ， 那 么 说 出 你 的 消 息 或 者 走 开 ！

	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, "我 只 能 把 这 个 消 息 告 诉 圣 骑 士 ！", DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, "邪 恶 军 团 是 由 龙 率 领 的 ！", DIA_Mil_310_Stadtwache_Paladine_DepecheDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_APaladin() // ++2 --> weiter
{
	AI_Output(other, self, "DIA_Mil_310_Stadtwache_Paladine_APaladin_15_00"); //一 个 圣 骑 士 。
	AI_Output(self, other, "DIA_Mil_310_Stadtwache_Paladine_APaladin_07_01"); //嗯 ， 那 应 该 是 - 圣 骑 士 控 制 了 矿 藏 山 谷 的 关 卡 。
	AI_Output(self, other, "DIA_Mil_310_Stadtwache_Paladine_APaladin_07_02"); //把 你 的 消 息 告 诉 我 ， 我 帮 你 报 告 。

	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, "我 只 能 把 这 个 消 息 告 诉 圣 骑 士 ！", DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, "邪 恶 军 团 是 由 龙 率 领 的 ！", DIA_Mil_310_Stadtwache_Paladine_DepecheDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_CantTellYou() // ++3 - k.A.
{
	AI_Output(other, self, "DIA_Mil_310_Stadtwache_Paladine_CantTellYou_15_00"); //我 无 权 告 诉 你 那 些 。
	AI_Output(self, other, "DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_01"); //不 要 对 我 那 样 做 ， 小 子 ！ 我 是 城 市 卫 兵 的 成 员 。
	AI_Output(self, other, "DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_02"); //你 可 以 告 诉 我 所 有 事 情 。 那 么 - 谁 派 你 来 的 ？
};

// -------------------------------------------
func void DIA_Mil_310_Stadtwache_Paladine_DepecheDragons() // +++1
{
	AI_Output(other, self, "DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_15_00"); //邪 恶 军 团 是 由 龙 率 领 的 ！
	AI_Output(self, other, "DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_01"); //什 么 ？ 那 不 可 能 是 真 的 。 那 样 的 话 ， 我 会 让 你 进 去 。
	AI_Output(self, other, "DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_02"); //如 果 让 你 把 那 个 故 事 告 诉 哈 根 勋 爵 的 话 ， 他 一 定 会 扭 断 我 的 头 。
	AI_Output(self, other, "DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_03"); //滚 开 ！
	Player_KnowsLordHagen = TRUE;

	AI_StopProcessInfos(self);
};

func void DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins() // +++2 --> 2b
{
	AI_Output(other, self, "DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_15_00"); //我 只 能 把 这 个 消 息 告 诉 圣 骑 士 ！
	AI_Output(self, other, "DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_01"); //那 行 不 通 ， 小 子 ！
	AI_Output(self, other, "DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_02"); //如 果 我 不 能 确 定 你 不 会 浪 费 哈 根 勋 爵 宝 贵 时 间 就 让 你 进 去 的 话 ， 那 就 太 糟 糕 了 。
	Player_KnowsLordHagen = TRUE;

	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, "不 。 这 个 只 能 告 诉 圣 骑 士 。", DIA_Mil_310_Stadtwache_Paladine_Only2);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine, "邪 恶 军 团 是 由 龙 率 领 的 ！", DIA_Mil_310_Stadtwache_Paladine_DepecheDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_Only2() // +++2b
{
	AI_Output(other, self, "DIA_Mil_310_Stadtwache_Paladine_Only2_15_00"); //不 。 这 个 只 能 告 诉 圣 骑 士 。
	AI_Output(self, other, "DIA_Mil_310_Stadtwache_Paladine_Only2_07_01"); //那 么 你 的 旅 行 到 这 里 结 束 了 ， 陌 生 人 。

	AI_StopProcessInfos(self);
};

// ************************************************************
// 							PERM
// ************************************************************
instance DIA_Mil_310_Stadtwache_PERM(C_INFO)
{
	npc				= Mil_310_Stadtwache;
	nr				= 5;
	condition		= DIA_Mil_310_Stadtwache_PERM_Condition;
	information		= DIA_Mil_310_Stadtwache_PERM_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Mil_310_Stadtwache_PERM_Condition()
{
	if ((self.aivar[AIV_PASSGATE] == TRUE)
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_PERM_Info()
{
	AI_Output(self, other, "DIA_Mil_310_Stadtwache_PERM_07_00"); //走 开 ！

	AI_StopProcessInfos(self);
};
