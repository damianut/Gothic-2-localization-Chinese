///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Valentino_EXIT(C_INFO)
{
	npc				= VLK_421_Valentino;
	nr				= 999;
	condition		= DIA_Valentino_EXIT_Condition;
	information		= DIA_Valentino_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Valentino_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Valentino_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Valentino_HALLO(C_INFO)
{
	npc				= VLK_421_Valentino;
	nr				= 1;
	condition		= DIA_Valentino_HALLO_Condition;
	information		= DIA_Valentino_HALLO_Info;
	description		= "嗯 ， 我 们 这 里 有 什 么 ？";
};

func int DIA_Valentino_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Valentino_HALLO_Info()
{
	AI_Output(other, self, "DIA_Valentino_HALLO_15_00"); //嗯 ， 我 们 这 里 有 什 么 ？
	// AI_Output(other, self, "DIA_Valentino_Add_15_00"); // Hey, wer bist du denn?
	if ((hero.guild == GIL_KDF)
	|| (hero.guild == GIL_PAL))
	{
		AI_Output(self, other, "DIA_Valentino_HALLO_03_01"); //我 叫 瓦 尔 地 诺 。 我 在 努 力 找 工 作 ， 以 求 不 亵 渎 英 诺 斯 赐 予 我 工 作 的 这 一 天 。
		AI_Output(other, self, "DIA_Valentino_HALLO_15_02"); //注 意 你 的 用 词 。
		AI_Output(self, other, "DIA_Valentino_HALLO_03_03"); //哦 ， 原 谅 我 ， 我 不 想 冒 犯 我 们 的 主 。 请 原 谅 我 ， 先 生 。
	}
	else
	{
		AI_Output(self, other, "DIA_Valentino_HALLO_03_04"); //你 没 有 礼 貌 吗 ？ 那 很 讨 厌 ！
		AI_Output(self, other, "DIA_Valentino_HALLO_03_05"); //总 是 这 些 污 秽 的 流 浪 汉 。 你 在 该 去 的 地 方 没 有 工 作 吗 ？
		AI_Output(self, other, "DIA_Valentino_HALLO_03_06"); //不 过 我 猜 没 有 人 会 发 现 像 你 这 样 邋 遢 的 一 个 家 伙 不 见 了 ， 是 吧 ？
		AI_Output(self, other, "DIA_Valentino_HALLO_03_07"); //嗯 ， 如 果 你 有 我 这 么 多 钱 ， 你 就 也 不 需 要 工 作 了 。 但 是 ， 你 永 远 不 会 这 么 富 有 。
		AI_Output(other, self, "DIA_Valentino_HALLO_15_08"); //我 看 跟 你 说 话 我 会 有 很 多 乐 子 。
	};
};

// ********************************************************
// 						WhoAgain
// ********************************************************
instance DIA_Valentino_WhoAgain(C_INFO)
{
	npc				= VLK_421_Valentino;
	nr				= 2;
	condition		= DIA_Valentino_WhoAgain_Condition;
	information		= DIA_Valentino_WhoAgain_Info;
	description		= "我 在 问 你 是 谁 ？！";
};

func int DIA_Valentino_WhoAgain_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Valentino_HALLO))
	&& (other.guild != GIL_KDF)
	&& (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Valentino_WhoAgain_Info()
{
	AI_Output(other, self, "DIA_Valentino_Add_15_01"); //我 在 问 你 是 谁 ？！
	// AI_Output(other, self, "DIA_Valentino_HALLO_wasmachstdu_15_00"); // Was macht jemand wie du in der Stadt?
	AI_Output(self, other, "DIA_Valentino_HALLO_wasmachstdu_03_01"); //我 是 慷 慨 的 瓦 尔 地 诺 ， 生 活 考 究 ， 深 受 女 士 们 青 睐 的 男 人 。
	AI_Output(self, other, "DIA_Valentino_HALLO_wasmachstdu_03_02"); //缺 乏 照 顾 、 富 有 智 慧 和 财 富 、 女 人 们 都 主 动 上 门 来 找 我 。
	AI_Output(self, other, "DIA_Valentino_HALLO_wasmachstdu_03_03"); //如 果 你 有 难 题 的 话 ， 留 给 你 自 己 。 我 不 需 要 它 们 。
};

// ********************************************************
// 						Manieren
// ********************************************************
instance DIA_Valentino_Manieren(C_INFO)
{
	npc				= VLK_421_Valentino;
	nr				= 3;
	condition		= DIA_Valentino_Manieren_Condition;
	information		= DIA_Valentino_Manieren_Info;
	description		= "看 来 我 必 须 教 你 一 些 礼 貌 ！";
};

func int DIA_Valentino_Manieren_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Valentino_HALLO))
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Valentino_Manieren_Info()
{
	AI_Output(other, self, "DIA_Valentino_Add_15_02"); //看 来 我 必 须 教 你 一 些 礼 貌 ！
	// AI_Output(other, self, "DIA_Valentino_HALLO_klappe_15_00"); // Für deine dünnen Ärmchen hast du 'ne ganz schön große Klappe!
	AI_Output(self, other, "DIA_Valentino_HALLO_klappe_03_01"); //我 不 在 乎 ！ 随 便 你 怎 么 打 我 。 等 我 明 天 一 早 爬 起 来 ， 我 又 会 很 好 。
	AI_Output(self, other, "DIA_Valentino_HALLO_klappe_03_02"); //不 过 你 就 必 须 带 着 你 的 通 缉 令 四 处 逃 命 了 。
};

///////////////////////////////////////////////////////////////////////
//	Info Wasnuetzliches
///////////////////////////////////////////////////////////////////////

var int Valentino_Lo_Perm;
var int Valentino_Hi_Perm;
// ---------------------------------------------------
instance DIA_Valentino_WASNUETZLICHES(C_INFO)
{
	npc				= VLK_421_Valentino;
	nr				= 4;
	condition		= DIA_Valentino_WASNUETZLICHES_Condition;
	information		= DIA_Valentino_WASNUETZLICHES_Info;
	permanent		= TRUE;
	description		= "你 还 有 其 它 事 告 诉 我 吗 ？";
};

func int DIA_Valentino_WASNUETZLICHES_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Valentino_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Valentino_WASNUETZLICHES_Info()
{
	AI_Output(other, self, "DIA_Valentino_Add_15_03"); //（ 平 静 地 ） 你 有 别 的 事 情 要 告 诉 我 吗 ？
	// AI_Output(other, self, "DIA_Valentino_WASNUETZLICHES_15_00"); // Kannst du mir was Nützliches über die Stadt erzählen?

	if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		B_Say(self, other, "$NOTNOW");
	}
	else if ((Valentino_Lo_Perm == FALSE)
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF))
	{
		AI_Output(self, other, "DIA_Valentino_WASNUETZLICHES_03_01"); //让 你 自 己 受 欢 迎 ， 不 要 对 任 何 人 承 诺 什 么 东 西 、 拿 你 能 拿 的 、 并 且 小 心 不 要 跟 民 兵 争 吵 。！
		AI_Output(self, other, "DIA_Valentino_WASNUETZLICHES_03_02"); //或 者 是 跟 一 个 爱 吃 醋 的 丈 夫 ， 当 然 - 我 告 诉 你 ， 他 们 是 最 坏 的 。
		Valentino_Lo_Perm = TRUE;
	}
	else if ((Valentino_Hi_Perm == FALSE)
	&& ((other.guild == GIL_PAL) || (other.guild == GIL_KDF)))
	{
		AI_Output(self, other, "DIA_Valentino_WASNUETZLICHES_03_03"); //处 于 你 这 种 境 地 的 男 人 ， 什 么 事 情 都 是 可 能 的 。 你 只 要 知 道 什 么 时 候 该 采 取 行 动 。
		AI_Output(self, other, "DIA_Valentino_WASNUETZLICHES_03_04"); //所 以 ， 不 要 浪 费 我 的 时 间 ， 行 动 吧 。
		Valentino_Hi_Perm = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Valentino_WASNUETZLICHES_03_05"); //我 已 经 告 诉 了 你 所 有 你 需 要 知 道 的 事 情 了 - 剩 下 的 就 要 靠 你 自 己 了 。
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Valentino_PICKPOCKET(C_INFO)
{
	npc				= VLK_421_Valentino;
	nr				= 900;
	condition		= DIA_Valentino_PICKPOCKET_Condition;
	information		= DIA_Valentino_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "（ 偷 他 的 钥 匙 应 该 很 容 易 ）";
};

func int DIA_Valentino_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_Valentino) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Valentino_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Valentino_PICKPOCKET);
	Info_AddChoice(DIA_Valentino_PICKPOCKET, DIALOG_BACK, DIA_Valentino_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Valentino_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Valentino_PICKPOCKET_DoIt);
};

func void DIA_Valentino_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems(self, other, ItKe_Valentino, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Valentino_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1);
	};
};

func void DIA_Valentino_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Valentino_PICKPOCKET);
};
