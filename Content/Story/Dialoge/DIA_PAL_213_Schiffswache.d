///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Pal_213_Schiffswache_EXIT(C_INFO)
{
	npc				= Pal_213_Schiffswache;
	nr				= 999;
	condition		= DIA_Pal_213_Schiffswache_EXIT_Condition;
	information		= DIA_Pal_213_Schiffswache_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Pal_213_Schiffswache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pal_213_Schiffswache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// ------------------------------------------------------------
const string Pal_213_Checkpoint = "SHIP_DECK_09"; // Auf dem Schiff
// ------------------------------------------------------------
instance DIA_Pal_213_Schiffswache_FirstWarn(C_INFO)
{
	npc				= Pal_213_Schiffswache;
	nr				= 1;
	condition		= DIA_Pal_213_Schiffswache_FirstWarn_Condition;
	information		= DIA_Pal_213_Schiffswache_FirstWarn_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Pal_213_Schiffswache_FirstWarn_Condition()
{
	if ((MIS_ShipIsFree == FALSE)
	&& (self.aivar[AIV_Guardpassage_Status] == GP_NONE)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_FirstWarn_Info()
{
	AI_Output(self, other, "DIA_Pal_213_Schiffswache_FirstWarn_01_00"); //等 一 下 ！ 你 觉 得 你 正 在 往 哪 里 去 ？
	AI_Output(other, self, "DIA_Pal_213_Schiffswache_FirstWarn_15_01"); //我 想 … …

	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self, other, "DIA_Pal_213_Schiffswache_FirstWarn_01_02"); //对 不 起 。 你 不 能 从 这 里 通 过 。
	}
	else
	{
		AI_Output(self, other, "DIA_Pal_213_Schiffswache_FirstWarn_01_03"); //这 里 没 什 么 可 看 的 。 马 上 离 开 这 里 。
	};

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other, Pal_213_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************
instance DIA_Pal_213_Schiffswache_SecondWarn(C_INFO)
{
	npc				= Pal_213_Schiffswache;
	nr				= 2;
	condition		= DIA_Pal_213_Schiffswache_SecondWarn_Condition;
	information		= DIA_Pal_213_Schiffswache_SecondWarn_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Pal_213_Schiffswache_SecondWarn_Condition()
{
	if ((MIS_ShipIsFree == FALSE)
	&& (self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE)
	&& (Npc_GetDistToWP(other, Pal_213_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_SecondWarn_Info()
{
	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self, other, "DIA_Pal_213_Schiffswache_SecondWarn_01_00"); //不 许 再 往 前 一 步 。 没 有 例 外 。
	}
	else
	{
		AI_Output(self, other, "DIA_Pal_213_Schiffswache_SecondWarn_01_01"); //你 不 想 逼 我 揍 你 吧 ， 是 吗 ？
	};

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other, Pal_213_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;

	AI_StopProcessInfos(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************
instance DIA_Pal_213_Schiffswache_Attack(C_INFO)
{
	npc				= Pal_213_Schiffswache;
	nr				= 3;
	condition		= DIA_Pal_213_Schiffswache_Attack_Condition;
	information		= DIA_Pal_213_Schiffswache_Attack_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Pal_213_Schiffswache_Attack_Condition()
{
	if ((MIS_ShipIsFree == FALSE)
	&& (self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE)
	&& (Npc_GetDistToWP(other, Pal_213_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE; // wird auch in ZS_Attack resettet

	AI_StopProcessInfos(self); // dem Spieler sofort wieder die Kontrolle zurückgeben

	B_Attack(self, other, AR_GuardStopsIntruder, 1);
};

// #############################
// ### ###
// ### Kapitel 5 ###
// ### ###
// #############################

///////////////////////////////////////////////////////////////////////
//	Abziehen
///////////////////////////////////////////////////////////////////////
instance DIA_Pal_213_Schiffswache_GoOnBoard(C_INFO)
{
	npc				= Pal_213_Schiffswache;
	nr				= 5;
	condition		= DIA_Pal_213_Schiffswache_GoOnBoard_Condition;
	information		= DIA_Pal_213_Schiffswache_GoOnBoard_Info;
	description		= "我 想 要 上 船 。";
};

func int DIA_Pal_213_Schiffswache_GoOnBoard_Condition()
{
	return TRUE;
};

func void DIA_Pal_213_Schiffswache_GoOnBoard_Info()
{
	AI_Output(other, self, "DIA_Pal_213_Schiffswache_GoOnBoard_15_00"); //我 想 要 上 船 。
	AI_Output(self, other, "DIA_Pal_213_Schiffswache_GoOnBoard_01_01"); //没 有 人 可 以 进 入 这 艘 船 ！ 我 在 执 行 命 令 ！
	AI_Output(self, other, "DIA_Pal_213_Schiffswache_GoOnBoard_01_02"); //我 将 会 杀 死 任 何 一 个 没 有 授 权 就 进 入 这 艘 船 的 人 。
	AI_Output(self, other, "DIA_Pal_213_Schiffswache_GoOnBoard_01_03"); //以 英 诺 斯 的 名 义 ， 我 将 用 我 的 生 命 来 保 护 这 艘 船 。
};

//**********************************************************
// sc ist kdf -Du stellst den Wunsch eines eines Magiers des Feuers in Frage?
//**********************************************************
instance DIA_Pal_213_Schiffswache_IAmKDF(C_INFO)
{
	npc				= Pal_213_Schiffswache;
	nr				= 6;
	condition		= DIA_Pal_213_Schiffswache_IAmKDF_Condition;
	information		= DIA_Pal_213_Schiffswache_IAmKDF_Info;
	description		= "你 怀 疑 一 名 火 魔 法 师 的 意 愿 ？";
};

func int DIA_Pal_213_Schiffswache_IAmKDF_Condition()
{
	if ((Hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo(other, DIA_Pal_213_Schiffswache_GoOnBoard)))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF_Info()
{
	AI_Output(other, self, "DIA_Pal_213_Schiffswache_IAmKDF_15_00"); //你 怀 疑 一 名 火 魔 法 师 的 意 愿 ？
	AI_Output(self, other, "DIA_Pal_213_Schiffswache_IAmKDF_01_01"); //（ 不 安 的 ） 不 ， 当 然 不 。 愿 英 诺 斯 原 谅 我 。
	AI_Output(self, other, "DIA_Pal_213_Schiffswache_IAmKDF_01_02"); //（ 不 安 的 ） 火 魔 法 师 都 是 英 诺 斯 的 智 慧 的 守 卫 者 … …
	AI_Output(self, other, "DIA_Pal_213_Schiffswache_IAmKDF_01_03"); //（ 不 安 的 ） … … 无 论 是 谁 对 他 们 有 所 质 疑 ， 就 是 对 英 诺 斯 有 所 质 疑 ， 并 将 失 去 得 到 宽 恕 的 权 力 。
};

//**********************************************************
// Was passiert, wenn ich an Bord gehe?
//**********************************************************
instance DIA_Pal_213_Schiffswache_IAmKDF2(C_INFO)
{
	npc				= Pal_213_Schiffswache;
	nr				= 6;
	condition		= DIA_Pal_213_Schiffswache_IAmKDF2_Condition;
	information		= DIA_Pal_213_Schiffswache_IAmKDF2_Info;
	description		= "如 果 我 登 船 会 怎 么 样 ？";
};

func int DIA_Pal_213_Schiffswache_IAmKDF2_Condition()
{
	if ((Hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo(other, DIA_Pal_213_Schiffswache_IAmKDF)))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF2_Info()
{
	AI_Output(other, self, "DIA_Pal_213_Schiffswache_IAmKDF2_15_00"); //如 果 我 登 船 会 怎 么 样 ？
	AI_Output(self, other, "DIA_Pal_213_Schiffswache_IAmKDF2_01_01"); //（ 不 安 的 ） 我 要 杀 了 … … 我 是 说 ， 阻 止 你 。
};

//**********************************************************
// Du würdest einen Magier des Feuers angreifen?
//**********************************************************
instance DIA_Pal_213_Schiffswache_IAmKDF3(C_INFO)
{
	npc				= Pal_213_Schiffswache;
	nr				= 6;
	condition		= DIA_Pal_213_Schiffswache_IAmKDF3_Condition;
	information		= DIA_Pal_213_Schiffswache_IAmKDF3_Info;
	description		= "你 要 攻 击 一 名 火 魔 法 师 ？";
};

func int DIA_Pal_213_Schiffswache_IAmKDF3_Condition()
{
	if ((Hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo(other, DIA_Pal_213_Schiffswache_IAmKDF2)))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF3_Info()
{
	AI_Output(other, self, "DIA_Pal_213_Schiffswache_IAmKDF3_15_00"); //你 要 攻 击 一 名 火 魔 法 师 ？
	AI_Output(self, other, "DIA_Pal_213_Schiffswache_IAmKDF3_01_01"); //（ 不 安 的 ） 我 永 远 都 不 会 向 一 个 魔 法 师 动 手 。
	AI_Output(other, self, "DIA_Pal_213_Schiffswache_IAmKDF3_15_02"); //那 如 果 我 去 了 船 上 你 会 怎 么 样 呢 ？
	AI_Output(self, other, "DIA_Pal_213_Schiffswache_IAmKDF3_01_03"); //（ 怯 懦 地 ） 没 什 么 ， 阁 下 。
};

//**********************************************************
// Ich werde jetzt an Bord gehen.
//**********************************************************
instance DIA_Pal_213_Schiffswache_IAmKDF4(C_INFO)
{
	npc				= Pal_213_Schiffswache;
	nr				= 6;
	condition		= DIA_Pal_213_Schiffswache_IAmKDF4_Condition;
	information		= DIA_Pal_213_Schiffswache_IAmKDF4_Info;
	description		= "我 现 在 就 要 登 船 。";
};

func int DIA_Pal_213_Schiffswache_IAmKDF4_Condition()
{
	if ((Hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo(other, DIA_Pal_213_Schiffswache_IAmKDF3)))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF4_Info()
{
	AI_Output(other, self, "DIA_Pal_213_Schiffswache_IAmKDF4_15_00"); //我 现 在 就 要 登 船 。
	AI_Output(self, other, "DIA_Pal_213_Schiffswache_IAmKDF4_01_01"); //（ 不 安 的 ） 你 不 能 那 样 做 ， 哈 根 勋 爵 的 命 令 很 明 确 。
};

//**********************************************************
// Schließen Lord Hagen Befehle auch mich mit ein?.
//**********************************************************
instance DIA_Pal_213_Schiffswache_IAmKDF5(C_INFO)
{
	npc				= Pal_213_Schiffswache;
	nr				= 6;
	condition		= DIA_Pal_213_Schiffswache_IAmKDF5_Condition;
	information		= DIA_Pal_213_Schiffswache_IAmKDF5_Info;
	description		= "哈 根 勋 爵 的 命 令 也 包 括 我 ？";
};

func int DIA_Pal_213_Schiffswache_IAmKDF5_Condition()
{
	if ((Hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo(other, DIA_Pal_213_Schiffswache_IAmKDF4)))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF5_Info()
{
	AI_Output(other, self, "DIA_Pal_213_Schiffswache_IAmKDF5_15_00"); //哈 根 勋 爵 的 命 令 也 包 括 我 ？
	AI_Output(self, other, "DIA_Pal_213_Schiffswache_IAmKDF5_01_01"); //（ 不 安 的 ） 我 不 知 道 。
	AI_Output(other, self, "DIA_Pal_213_Schiffswache_IAmKDF5_15_02"); //只 要 想 一 想 - 哈 根 勋 爵 敢 于 怀 疑 一 个 魔 法 师 会 去 偷 窃 吗 ？
	AI_Output(self, other, "DIA_Pal_213_Schiffswache_IAmKDF5_01_03"); //我 不 相 信 那 个 。
};

//**********************************************************
// Zum letzten mal: Lass mich auf das Schiff
//**********************************************************
instance DIA_Pal_213_Schiffswache_IAmKDF6(C_INFO)
{
	npc				= Pal_213_Schiffswache;
	nr				= 6;
	condition		= DIA_Pal_213_Schiffswache_IAmKDF6_Condition;
	information		= DIA_Pal_213_Schiffswache_IAmKDF6_Info;
	description		= "最 后 一 次 ： 让 我 登 船 ！";
};

func int DIA_Pal_213_Schiffswache_IAmKDF6_Condition()
{
	if ((Hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo(other, DIA_Pal_213_Schiffswache_IAmKDF5)))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF6_Info()
{
	AI_Output(other, self, "DIA_Pal_213_Schiffswache_IAmKDF6_15_00"); //最 后 一 次 ： 让 我 登 船 ！
	AI_Output(self, other, "DIA_Pal_213_Schiffswache_IAmKDF6_01_01"); //（ 不 安 的 ） 明 白 了 。 你 可 以 上 船 。

	MIS_ShipIsFree = TRUE;
	B_StartOtherRoutine(Girion, "WaitForShip");
};

//**********************************************************
// sc ist PA -Misstraust du mir, Ritter?
//**********************************************************
instance DIA_Pal_213_Schiffswache_IAmPAL(C_INFO)
{
	npc				= Pal_213_Schiffswache;
	nr				= 6;
	condition		= DIA_Pal_213_Schiffswache_IAmPAL_Condition;
	information		= DIA_Pal_213_Schiffswache_IAmPAL_Info;
	description		= "你 不 信 任 我 ， 骑 士 ？";
};

func int DIA_Pal_213_Schiffswache_IAmPAL_Condition()
{
	if ((Hero.guild == GIL_PAL)
	&& (Npc_KnowsInfo(other, DIA_Pal_213_Schiffswache_GoOnBoard)))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmPAL_Info()
{
	AI_Output(other, self, "DIA_Pal_213_Schiffswache_IAmPAL_15_00"); //你 不 信 任 我 ， 骑 士 ？
	AI_Output(self, other, "DIA_Pal_213_Schiffswache_IAmPAL_01_01"); //不 ， 我 只 是 按 照 命 令 行 事 。
};

//**********************************************************
// sc ist PA -Dann solltest du wissen, wer hier den Vorgesetzter ist.
//**********************************************************
instance DIA_Pal_213_Schiffswache_IAmPAL2(C_INFO)
{
	npc				= Pal_213_Schiffswache;
	nr				= 6;
	condition		= DIA_Pal_213_Schiffswache_IAmPAL2_Condition;
	information		= DIA_Pal_213_Schiffswache_IAmPAL2_Info;
	description		= "那 你 应 该 知 道 我 们 两 个 谁 的 军 衔 更 高 。";
};

func int DIA_Pal_213_Schiffswache_IAmPAL2_Condition()
{
	if ((Hero.guild == GIL_PAL)
	&& (Npc_KnowsInfo(other, DIA_Pal_213_Schiffswache_IAmPAL)))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmPAL2_Info()
{
	AI_Output(other, self, "DIA_Pal_213_Schiffswache_IAmPAL2_15_00"); //那 你 应 该 知 道 我 们 两 个 谁 的 军 衔 更 高 。
	AI_Output(self, other, "DIA_Pal_213_Schiffswache_IAmPAL2_01_01"); //是 的 ， 阁 下 ！
};

//**********************************************************
// sc ist PA -Dann solltest du wissen, wer hier den Vorgesetzter ist.
//**********************************************************
instance DIA_Pal_213_Schiffswache_IAmPAL3(C_INFO)
{
	npc				= Pal_213_Schiffswache;
	nr				= 6;
	condition		= DIA_Pal_213_Schiffswache_IAmPAL3_Condition;
	information		= DIA_Pal_213_Schiffswache_IAmPAL3_Info;
	description		= "那 我 命 令 你 让 我 登 上 这 条 船 。";
};

func int DIA_Pal_213_Schiffswache_IAmPAL3_Condition()
{
	if ((Hero.guild == GIL_PAL)
	&& (Npc_KnowsInfo(other, DIA_Pal_213_Schiffswache_IAmPAL2)))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmPAL3_Info()
{
	AI_Output(other, self, "DIA_Pal_213_Schiffswache_IAmPAL3_15_00"); //因 此 ， 我 命 令 你 给 我 这 艘 船 的 通 行 权 。
	AI_Output(self, other, "DIA_Pal_213_Schiffswache_IAmPAL3_01_01"); //明 白 ， 阁 下 ， 我 将 赋 予 你 通 行 权 。

	MIS_ShipIsFree = TRUE;
	B_StartOtherRoutine(Girion, "WaitForShip");
};

//**********************************************************
// sc ist DJG -Kann man da nichts machen?
//**********************************************************
instance DIA_Pal_213_Schiffswache_IAmDJG(C_INFO)
{
	npc				= Pal_213_Schiffswache;
	nr				= 6;
	condition		= DIA_Pal_213_Schiffswache_IAmDJG_Condition;
	information		= DIA_Pal_213_Schiffswache_IAmDJG_Info;
	description		= "对 此 没 有 别 的 事 情 可 做 了 吗 ？";
};

func int DIA_Pal_213_Schiffswache_IAmDJG_Condition()
{
	if ((Hero.guild == GIL_DJG)
	&& (Npc_KnowsInfo(other, DIA_Pal_213_Schiffswache_GoOnBoard)))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmDJG_Info()
{
	AI_Output(other, self, "DIA_Pal_213_Schiffswache_IAmDJG_15_00"); //对 此 没 有 别 的 事 情 可 做 了 吗 ？
	AI_Output(self, other, "DIA_Pal_213_Schiffswache_IAmDJG_01_01"); //我 想 我 不 明 白 。
};

//**********************************************************
// sc ist DJG -Ich könnte dir Geld geben.
//**********************************************************
instance DIA_Pal_213_Schiffswache_IAmDJG2(C_INFO)
{
	npc				= Pal_213_Schiffswache;
	nr				= 6;
	condition		= DIA_Pal_213_Schiffswache_IAmDJG2_Condition;
	information		= DIA_Pal_213_Schiffswache_IAmDJG2_Info;
	description		= "我 可 以 给 你 钱 。";
};

func int DIA_Pal_213_Schiffswache_IAmDJG2_Condition()
{
	if ((Hero.guild == GIL_DJG)
	&& (Npc_KnowsInfo(other, DIA_Pal_213_Schiffswache_IAmDJG)))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmDJG2_Info()
{
	AI_Output(other, self, "DIA_Pal_213_Schiffswache_IAmDJG2_15_00"); //我 可 以 给 你 钱 。 看 看 有 没 有 别 的 办 法 。
	AI_Output(self, other, "DIA_Pal_213_Schiffswache_IAmDJG2_01_01"); //我 不 能 受 贿 ， 如 果 你 不 马 上 消 失 的 话 ， 我 将 把 那 看 作 是 侮 辱 。
};

//**********************************************************
// sc ist DJG -Ich habe einen Brief von Lord Hagen.
//**********************************************************
instance DIA_Pal_213_Schiffswache_IAmDJG3(C_INFO)
{
	npc				= Pal_213_Schiffswache;
	nr				= 6;
	condition		= DIA_Pal_213_Schiffswache_IAmDJG3_Condition;
	information		= DIA_Pal_213_Schiffswache_IAmDJG3_Info;
	description		= "我 有 一 份 书 面 许 可 。";
};

func int DIA_Pal_213_Schiffswache_IAmDJG3_Condition()
{
	if ((Hero.guild == GIL_DJG)
	&& (Npc_KnowsInfo(other, DIA_Pal_213_Schiffswache_IAmDJG))
	&& (Npc_HasItems(other, ITWr_ForgedShipLetter_MIS) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmDJG3_Info()
{
	AI_Output(other, self, "DIA_Pal_213_Schiffswache_IAmDJG3_15_00"); //我 有 书 面 授 权 。 我 被 允 许 进 入 这 艘 船 。
	AI_Output(self, other, "DIA_Pal_213_Schiffswache_IAmDJG3_01_01"); //让 我 看 看 。

	B_GiveInvItems(other, self, ItWr_ForgedShipLetter_Mis, 1);
	B_UseFakeScroll();

	AI_Output(self, other, "DIA_Pal_213_Schiffswache_IAmDJG3_01_02"); //好 吧 ， 你 可 以 过 去 。

	MIS_ShipIsFree = TRUE;
	B_StartOtherRoutine(Girion, "WaitForShip");
};
