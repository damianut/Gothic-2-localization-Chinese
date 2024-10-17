// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_NOV_8_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_NOV_8_EXIT_Condition;
	information		= DIA_NOV_8_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_NOV_8_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NOV_8_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 		Fegen
// *************************************************************************
instance DIA_NOV_8_Fegen(C_INFO)
{
	nr				= 2;
	condition		= DIA_NOV_8_Fegen_Condition;
	information		= DIA_NOV_8_Fegen_Info;
	permanent		= TRUE;
	description		= "我 需 要 帮 手 来 打 扫 学 徒 的 房 间 。";
};

func int DIA_NOV_8_Fegen_Condition()
{
	if ((Kapitel == 1)
	&& (MIS_KlosterArbeit == LOG_RUNNING)
	&& (NOV_Helfer < 4))
	{
		return TRUE;
	};
};

// -------------------------------
var int Feger3_Permanent;
// -------------------------------
func void DIA_NOV_8_Fegen_Info()
{
	AI_Output(other, self, "DIA_NOV_8_Fegen_15_00"); //我 需 要 帮 手 来 打 扫 学 徒 的 房 间 。

	if (Hlp_GetInstanceID(Feger3) == Hlp_GetInstanceID(self))
	{
		if (Feger3_Permanent == FALSE)
		{
			AI_Output(self, other, "DIA_NOV_8_Fegen_08_01"); //哦 ， 伙 计 。 你 刚 到 这 里 他 们 就 让 你 打 扫 卫 生 ？
			AI_Output(self, other, "DIA_NOV_8_Fegen_08_02"); //自 我 安 慰 一 下 吧 ， 我 刚 到 这 里 的 时 候 也 一 样 ， 所 以 我 才 要 帮 助 你 。 如 果 我 们 两 个 人 还 解 决 不 了 它 的 话 ， 就 太 可 笑 了 。

			NOV_Helfer = (NOV_Helfer + 1);
			Feger3_Permanent = TRUE;
			B_GivePlayerXP(XP_Feger);
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self, "FEGEN");

			B_LogEntry(Topic_ParlanFegen, Topic_ParlanFegen_1);
		}
		else // if(Feger3_Permanent == TRUE)
		{
			AI_Output(self, other, "DIA_NOV_8_Fegen_08_03"); //兄 弟 ， 我 了 解 你 所 处 的 境 遇 。 而 且 我 已 经 告 诉 你 我 会 帮 助 你 的 。 而 我 也 正 在 那 样 做 。
		};
	};

	// -------------------------- alle anderen Novizen mit Stimme 8 -----------------------------------------------------

	if ((Hlp_GetInstanceID(Feger3) == Hlp_GetInstanceID(self)) == FALSE)
	{
		AI_Output(self, other, "DIA_NOV_8_Fegen_08_04"); //嘿 ， 我 很 想 那 么 做 ， 不 过 我 真 的 很 忙 。
	};
};

// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
instance DIA_NOV_8_Wurst(C_INFO)
{
	nr				= 3;
	condition		= DIA_NOV_8_Wurst_Condition;
	information		= DIA_NOV_8_Wurst_Info;
	permanent		= TRUE;
	description		= "美 味 的 羊 肉 香 肠 怎 么 样 ？";
};

func int DIA_NOV_8_Wurst_Condition()
{
	if ((Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems(self, ItFo_SchafsWurst) == 0)
	&& (Npc_HasItems(other, ItFo_SchafsWurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NOV_8_Wurst_Info()
{
	AI_Output(other, self, "DIA_NOV_8_Wurst_15_00"); //美 味 的 羊 肉 香 肠 怎 么 样 ？
	AI_Output(self, other, "DIA_NOV_8_Wurst_08_01"); //我 绝 不 会 说 不 的 。 谢 谢 ， 伙 计 - 我 正 是 需 要 那 个 。

	B_GiveInvItems(other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben + 1);

	CreateInvItems(self, ITFO_Sausage, 1);
	B_UseItem(self, ITFO_Sausage);

	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString(13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
instance DIA_NOV_8_JOIN(C_INFO)
{
	nr				= 4;
	condition		= DIA_NOV_8_JOIN_Condition;
	information		= DIA_NOV_8_JOIN_Info;
	permanent		= TRUE;
	description		= "我 要 成 为 一 个 魔 法 师 的 话 ， 必 须 要 做 些 什 么 ？";
};

func int DIA_NOV_8_JOIN_Condition()
{
	if (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_NOV_8_JOIN_Info()
{
	AI_Output(other, self, "DIA_NOV_8_JOIN_15_00"); //我 要 成 为 一 个 魔 法 师 的 话 ， 必 须 要 做 些 什 么 ？
	AI_Output(self, other, "DIA_NOV_8_JOIN_08_01"); //只 有 当 高 级 火 魔 法 师 同 意 时 ， 你 才 能 成 为 英 诺 斯 的 选 择 者 。
	AI_Output(self, other, "DIA_NOV_8_JOIN_08_02"); //作 为 新 信 徒 ， 我 们 不 能 学 习 咒 语 魔 法 - 只 有 当 我 们 得 到 魔 法 师 的 许 可 后 ， 才 能 学 习 古 老 的 铭 文 。
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
instance DIA_NOV_8_PEOPLE(C_INFO)
{
	nr				= 5;
	condition		= DIA_NOV_8_PEOPLE_Condition;
	information		= DIA_NOV_8_PEOPLE_Info;
	permanent		= TRUE;
	description		= "谁 主 管 这 座 修 道 院 ？";
};

func int DIA_NOV_8_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_NOV_8_PEOPLE_Info()
{
	AI_Output(other, self, "DIA_NOV_8_PEOPLE_15_00"); //谁 主 管 这 座 修 道 院 ？
	AI_Output(self, other, "DIA_NOV_8_PEOPLE_08_01"); //高 级 议 会 ， 它 由 我 们 修 道 会 中 最 强 大 的 三 名 魔 法 师 组 成 。 他 们 每 天 都 在 教 会 中 进 行 协 商 。
	AI_Output(self, other, "DIA_NOV_8_PEOPLE_08_02"); //英 诺 斯 的 选 择 者 都 是 魔 法 师 。 英 诺 斯 赐 予 他 们 这 个 天 赋 ， 以 便 他 们 能 在 大 地 上 实 现 他 的 意 愿 。
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
instance DIA_NOV_8_LOCATION(C_INFO)
{
	nr				= 6;
	condition		= DIA_NOV_8_LOCATION_Condition;
	information		= DIA_NOV_8_LOCATION_Info;
	permanent		= TRUE;
	description		= "和 我 谈 谈 这 座 修 道 院 。";
};

func int DIA_NOV_8_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_NOV_8_LOCATION_Info()
{
	AI_Output(other, self, "DIA_NOV_8_LOCATION_15_00"); //和 我 谈 谈 这 座 修 道 院 。
	AI_Output(self, other, "DIA_NOV_8_LOCATION_08_01"); //它 非 常 古 老 。 早 在 罗 巴 尔 一 世 之 前 就 存 在 了 。
	AI_Output(self, other, "DIA_NOV_8_LOCATION_08_02"); //修 道 院 下 面 是 地 下 墓 穴 。 它 们 延 伸 到 山 脉 的 深 处 。
	// AI_Output(self, other, "DIA_NOV_8_LOCATION_08_03"); // Aber zur untersten Ebene haben nur die höchsten Geweihten Innos' Zutritt.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
instance DIA_NOV_8_STANDARD(C_INFO)
{
	nr				= 10;
	condition		= DIA_NOV_8_STANDARD_Condition;
	information		= DIA_NOV_8_STANDARD_Info;
	permanent		= TRUE;
	description		= "还 有 什 么 新 的 吗 ？";
};

func int DIA_NOV_8_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_NOV_8_STANDARD_Info()
{
	AI_Output(other, self, "DIA_NOV_8_STANDARD_15_00"); //还 有 什 么 新 的 吗 ？

	if (Kapitel == 1)
	{
		if (other.guild == GIL_KDF)
		{
			AI_Output(self, other, "DIA_NOV_8_STANDARD_08_01"); //你 可 以 这 么 说 。 自 从 上 一 个 这 么 快 就 加 入 火 之 环 的 新 信 徒 ， 已 经 过 去 一 百 多 年 了 !
			AI_Output(self, other, "DIA_NOV_8_STANDARD_08_02"); //我 希 望 这 种 荣 耀 有 朝 一 日 也 会 降 临 到 我 身 上 。 我 要 更 加 努 力 。
		}
		else
		{
			AI_Output(self, other, "DIA_NOV_8_STANDARD_08_03"); //圣 骑 士 最 近 到 达 了 克 霍 里 尼 斯 。 他 们 中 有 一 个 人 现 在 就 在 修 道 院 这 里 祈 祷 。
		};
	};

	if ((Kapitel == 2)
	|| (Kapitel == 3))
	{
		if ((Pedro_Traitor == TRUE)
		&& (MIS_NovizenChase != LOG_SUCCESS)) // Kap 3b - SC weiss, das Pedro das Auge Innos geklaut hat
		{
			AI_Output(self, other, "DIA_NOV_3_STANDARD_08_04"); //我 还 是 不 能 相 信 。 我 们 之 中 有 人 背 叛 了 修 道 院 ， 并 偷 走 了 英 诺 斯 之 眼 。
			AI_Output(self, other, "DIA_NOV_3_STANDARD_08_05"); //建 造 社 团 是 我 们 的 任 务 ， 但 是 我 们 太 虚 弱 了 。 这 是 唯 一 的 原 因 ， 因 此 贝 利 尔 才 能 成 功 地 把 我 们 之 间 的 某 人 拉 到 他 一 方 。
		}
		else if (MIS_NovizenChase == LOG_SUCCESS) // Kap 3c - Das Auge Innos ist wieder da
		{
			AI_Output(self, other, "DIA_NOV_3_STANDARD_08_06"); //赞 美 英 诺 斯 ， 我 们 才 可 以 把 ‘ 眼 睛 ’ 从 敌 人 手 里 夺 回 来 。
			AI_Output(self, other, "DIA_NOV_3_STANDARD_08_07"); //你 的 勇 气 可 以 作 为 许 多 绝 望 的 人 的 楷 模 ， 并 帮 助 他 们 度 过 那 些 黑 暗 的 时 光 。
		}
		else // Kap 2 - 3a
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self, other, "DIA_NOV_8_STANDARD_08_08"); //我 已 经 听 说 龙 和 一 支 邪 恶 的 军 队 的 事 。 英 诺 斯 与 我 们 同 在 ！
			}
			else
			{
				AI_Output(self, other, "DIA_NOV_8_STANDARD_08_09"); //高 级 议 会 非 常 关 心 我 们 圣 骑 士 目 前 的 处 境 。 已 经 有 一 段 时 间 没 有 收 到 来 自 矿 藏 山 谷 的 消 息 了 。
			};
		};
	};

	if (Kapitel == 4)
	{
		AI_Output(self, other, "DIA_NOV_8_STANDARD_08_10"); //不 。 我 非 常 感 谢 我 们 的 神 。 有 了 英 诺 斯 之 眼 ， 我 们 就 可 以 把 龙 打 败 ！
	};

	if (Kapitel >= 5)
	{
		AI_Output(self, other, "DIA_NOV_8_STANDARD_08_11"); //是 的 。 我 们 已 经 成 功 地 击 败 了 龙 ！ 英 诺 斯 教 导 我 们 永 远 不 能 放 弃 希 望 。
		AI_Output(self, other, "DIA_NOV_8_STANDARD_08_12"); //然 而 还 有 很 多 阴 影 ， 我 们 必 须 点 亮 更 多 的 光 明 把 它 们 逐 开 。
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_NOV_8(var C_Npc slf)
{
	DIA_NOV_8_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_8_JOIN.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_8_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_8_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_8_STANDARD.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_8_Fegen.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_8_Wurst.npc = Hlp_GetInstanceID(slf);
};
