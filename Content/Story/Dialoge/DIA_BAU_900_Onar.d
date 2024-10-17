// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Onar_EXIT(C_INFO)
{
	npc				= BAU_900_Onar;
	nr				= 999;
	condition		= DIA_Onar_EXIT_Condition;
	information		= DIA_Onar_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Onar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Onar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				Hallo
// ************************************************************
instance DIA_Onar_Hallo(C_INFO)
{
	npc				= BAU_900_Onar;
	nr				= 1;
	condition		= DIA_Onar_Hallo_Condition;
	information		= DIA_Onar_Hallo_Info;
	important		= TRUE;
};

func int DIA_Onar_Hallo_Condition()
{
	if ((self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Onar_Hallo_Info()
{
	AI_Output(self, other, "DIA_Onar_Hallo_14_00"); //谁 让 你 进 这 里 的 ？ ！
	AI_Output(self, other, "DIA_Onar_Hallo_14_01"); //你 在 我 的 农 场 这 里 做 什 么 ？ ！
};

// ************************************************************
// 			  				PERM
// ************************************************************
instance DIA_Onar_PERM(C_INFO)
{
	npc				= BAU_900_Onar;
	nr				= 1;
	condition		= DIA_Onar_PERM_Condition;
	information		= DIA_Onar_PERM_Info;
	permanent		= TRUE;
	description		= "农 场 这 里 一 切 都 好 吗 ？";
};

func int DIA_Onar_PERM_Condition()
{
	return TRUE;
};

func void DIA_Onar_PERM_Info()
{
	AI_Output(other, self, "DIA_Onar_PERM_15_00"); //农 场 这 里 一 切 都 好 吗 ？

	if (other.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Onar_PERM_14_01"); //我 不 知 道 你 在 这 里 有 什 么 事 要 做 。 你 不 属 于 这 个 农 场 ！
	};

	if (other.guild == GIL_SLD)
	{
		AI_Output(self, other, "DIA_Onar_PERM_14_02"); //我 当 然 希 望 那 样 ！ 那 正 是 我 付 钱 给 你 的 原 因 ！
		AI_Output(self, other, "DIA_Onar_PERM_14_03"); //你 最 好 去 托 尔 洛 夫 那 里 ， 问 他 是 不 是 有 工 作 给 你 ！
	};

	if (other.guild == GIL_DJG)
	{
		AI_Output(self, other, "DIA_Onar_PERM_14_04"); //对 ， 当 然 。 你 就 去 猎 你 的 龙 吧 。
	};

	if ((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self, other, "DIA_Onar_PERM_14_05"); //这 里 不 欢 迎 你 这 个 从 修 道 院 出 来 假 装 虔 诚 的 混 蛋 ！
	};

	if ((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self, other, "DIA_Onar_PERM_14_06"); //我 们 的 热 情 不 会 献 给 国 王 的 军 队 。
	};
};

// ************************************************************
// 			  				Work
// ************************************************************
instance DIA_Onar_Work(C_INFO)
{
	npc				= BAU_900_Onar;
	nr				= 2;
	condition		= DIA_Onar_Work_Condition;
	information		= DIA_Onar_Work_Info;
	description		= "我 要 为 你 工 作 ！";
};

func int DIA_Onar_Work_Condition()
{
	if (Lee_SendToOnar == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Onar_Work_Info()
{
	AI_Output(other, self, "DIA_Onar_Work_15_00"); //我 要 为 你 工 作 ！
	AI_Output(self, other, "DIA_Onar_Work_14_01"); //我 现 在 不 需 要 农 场 工 人 。
	AI_Output(self, other, "DIA_Onar_Work_14_02"); //我 的 人 负 责 所 有 其 它 的 事 情 。
	AI_Output(self, other, "DIA_Onar_Work_14_03"); //这 所 房 子 里 没 有 你 的 事 ， 所 以 滚 出 去 ！
};

// ************************************************************
// 			  				WorkAsSld
// ************************************************************
instance DIA_Onar_WorkAsSld(C_INFO)
{
	npc				= BAU_900_Onar;
	nr				= 2;
	condition		= DIA_Onar_WorkAsSld_Condition;
	information		= DIA_Onar_WorkAsSld_Info;
	description		= "我 要 在 这 里 当 一 名 雇 佣 兵 ！";
};

func int DIA_Onar_WorkAsSld_Condition()
{
	if ((Lee_SendToOnar == FALSE)
	&& (Onar_WegenSldWerden == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Onar_Work)))
	{
		return TRUE;
	};
};

func void DIA_Onar_WorkAsSld_Info()
{
	AI_Output(other, self, "DIA_Onar_WorkAsSld_15_00"); //我 要 在 这 里 当 一 名 雇 佣 兵 ！
	AI_Output(self, other, "DIA_Onar_WorkAsSld_14_01"); //你 ？ 雇 佣 兵 ？ 别 逗 我 笑 ！ 如 果 你 真 的 能 象 雇 佣 兵 那 么 出 色 的 话 ， 李 就 告 诉 我 了 。
	AI_Output(self, other, "DIA_Onar_WorkAsSld_14_02"); //现 在 马 上 从 这 里 出 去 。
	Onar_WegenSldWerden = TRUE;
};

// ************************************************************
// 			  				Aufstand
// ************************************************************
instance DIA_Onar_Aufstand(C_INFO)
{
	npc				= BAU_900_Onar;
	nr				= 3;
	condition		= DIA_Onar_Aufstand_Condition;
	information		= DIA_Onar_Aufstand_Info;
	description		= "你 正 在 反 抗 那 座 城 市 ， 我 听 到 是 不 是 这 样 ？";
};

func int DIA_Onar_Aufstand_Condition()
{
	return TRUE;
};

func void DIA_Onar_Aufstand_Info()
{
	AI_Output(other, self, "DIA_Onar_Aufstand_15_00"); //你 正 在 反 抗 那 座 城 市 ， 我 听 到 是 不 是 这 样 ？
	AI_Output(self, other, "DIA_Onar_Aufstand_14_01"); //现 在 听 好 。 我 是 从 我 父 亲 那 里 继 承 的 这 座 农 场 和 这 片 土 地 。
	AI_Output(self, other, "DIA_Onar_Aufstand_14_02"); //而 他 又 是 从 他 父 亲 那 里 继 承 的 。
	AI_Output(self, other, "DIA_Onar_Aufstand_14_03"); //我 不 允 许 国 王 那 些 贪 得 无 厌 的 蠢 货 们 为 了 喂 养 他 那 没 用 的 军 队 而 把 它 夺 走 。
	AI_Output(self, other, "DIA_Onar_Aufstand_14_04"); //和 兽 人 之 间 的 战 争 已 经 持 续 了 很 久 了 。 我 们 现 在 是 什 么 处 境 ？ 马 上 就 要 溃 不 成 军 。
	AI_Output(self, other, "DIA_Onar_Aufstand_14_05"); //不 - 我 宁 愿 自 己 保 护 我 的 农 场 ！ 我 存 下 的 钱 足 够 供 养 我 自 己 的 军 队 。
};

// ************************************************************
// 			  				WegenPepe
// ************************************************************
instance DIA_Onar_WegenPepe(C_INFO)
{
	npc				= BAU_900_Onar;
	nr				= 4;
	condition		= DIA_Onar_WegenPepe_Condition;
	information		= DIA_Onar_WegenPepe_Info;
	description		= "感 谢 布 尔 克 ， 你 的 羊 现 在 几 乎 没 有 了 。";
};

func int DIA_Onar_WegenPepe_Condition()
{
	if (MIS_Pepe_KillWolves == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Onar_WegenPepe_Info()
{
	AI_Output(other, self, "DIA_Onar_WegenPepe_15_00"); //感 谢 布 尔 克 ， 你 的 羊 现 在 几 乎 没 有 了 。
	AI_Output(self, other, "DIA_Onar_WegenPepe_14_01"); //你 在 说 什 么 ？ 谁 是 布 尔 克 ？
	AI_Output(other, self, "DIA_Onar_WegenPepe_15_02"); //是 一 个 雇 佣 兵 。 事 实 上 他 的 工 作 就 是 保 护 牧 场 。
	AI_Output(self, other, "DIA_Onar_WegenPepe_14_03"); //那 怎 么 会 提 起 我 的 兴 趣 ？ 如 果 他 杀 我 的 绵 羊 ， 那 他 就 必 须 向 李 有 所 交 代 。
	AI_Output(self, other, "DIA_Onar_WegenPepe_14_04"); //所 以 ， 你 为 什 么 要 偷 听 我 这 些 小 的 细 节 呢 ？
	Onar_WegenPepe = TRUE;
};

// ************************************************************
// 			  				WegenSekob
// ************************************************************
instance DIA_Onar_WegenSekob(C_INFO)
{
	npc				= BAU_900_Onar;
	nr				= 5;
	condition		= DIA_Onar_WegenSekob_Condition;
	information		= DIA_Onar_WegenSekob_Info;
	description		= "我 来 是 为 了 塞 柯 布 的 租 金 … …";
};

func int DIA_Onar_WegenSekob_Condition()
{
	if (MIS_Sekob_RedeMitOnar == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Onar_WegenSekob_Info()
{
	AI_Output(other, self, "DIA_Onar_WegenSekob_15_00"); //我 来 是 为 了 塞 柯 布 的 租 金 … …

	if ((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Onar_WegenSekob_14_01"); //你 想 从 这 里 找 什 么 ？ 把 钱 拿 给 托 尔 洛 夫 。
	}
	else // GIL_NONE
	{
		AI_Output(self, other, "DIA_Onar_WegenSekob_14_02"); //你 究 竟 有 什 么 事 ？
		AI_Output(other, self, "DIA_Onar_WegenSekob_15_03"); //我 想 要 成 为 一 名 雇 佣 兵 。 收 租 是 我 的 测 试 。
		Onar_WegenSldWerden = TRUE;
	};

	AI_Output(other, self, "DIA_Onar_WegenSekob_15_04"); //但 是 塞 柯 布 没 有 钱 。 我 甚 至 痛 打 过 他 。
	AI_Output(other, self, "DIA_Onar_WegenSekob_15_05"); //他 说 是 因 为 可 怜 的 收 成 … …
	AI_Output(self, other, "DIA_Onar_WegenSekob_14_06"); //（ 吼 叫 ） 你 这 傻 瓜 ！ 你 以 为 他 会 带 着 钱 满 街 跑 ？ 他 把 它 藏 起 来 了 ！
	AI_Output(self, other, "DIA_Onar_WegenSekob_14_07"); //你 知 道 这 里 下 了 多 少 雨 吗 ？ 收 成 糟 透 了 ！
	AI_Output(self, other, "DIA_Onar_WegenSekob_14_08"); //不 管 怎 么 样 ， 去 把 钱 从 他 那 里 挤 出 来 ！
	Onar_WegenSekob = TRUE;
};

// ************************************************************
// 			  			Lee schickt mich
// ************************************************************
instance DIA_Onar_LeeSentMe(C_INFO)
{
	npc				= BAU_900_Onar;
	nr				= 6;
	condition		= DIA_Onar_LeeSentMe_Condition;
	information		= DIA_Onar_LeeSentMe_Info;
	description		= "李 派 我 来 的 。 我 要 在 这 里 当 一 名 雇 佣 兵 ！";
};

func int DIA_Onar_LeeSentMe_Condition()
{
	if ((Lee_SendToOnar == TRUE)
	&& (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Onar_LeeSentMe_Info()
{
	AI_Output(other, self, "DIA_Onar_LeeSentMe_15_00"); //李 派 我 来 的 。 我 要 在 这 里 当 一 名 雇 佣 兵 ！
	AI_Output(self, other, "DIA_Onar_LeeSentMe_14_01"); //他 已 经 和 我 说 过 了 。

	if (Onar_WegenSldWerden == TRUE)
	{
		AI_Output(self, other, "DIA_Onar_LeeSentMe_14_02"); //当 你 第 一 次 问 我 的 时 候 ， 我 根 本 不 重 视 你
		AI_Output(self, other, "DIA_Onar_LeeSentMe_14_03"); //但 是 如 果 李 认 为 你 可 以 的 话 ， 那 我 愿 意 给 你 一 个 机 会 。
	};

	AI_Output(self, other, "DIA_Onar_LeeSentMe_14_04"); //他 要 为 你 负 责 。 所 以 ， 你 自 便 吧 。
	AI_Output(self, other, "DIA_Onar_LeeSentMe_14_05"); //但 是 不 要 在 这 里 吊 儿 郎 当 ！ 不 要 骚 扰 农 民 和 那 些 少 女 ， 最 重 要 的 是 ， 不 要 抢 任 何 东 西 ， 明 白 吗 ？
	AI_Output(self, other, "DIA_Onar_LeeSentMe_14_06"); //有 其 它 事 情 的 话 ， 找 李 去 说 。
	AI_Output(self, other, "DIA_Onar_LeeSentMe_14_07"); //我 们 现 在 要 讨 论 的 就 是 你 的 薪 水 。

	Onar_Approved = TRUE;
	B_LogEntry(TOPIC_BecomeSLD, TOPIC_BecomeSLD_4);
};

// ************************************************************
// 			  			Sold verhandeln
// ************************************************************
var int Onar_SOLD_Day;
var int Onar_SOLD_XP;
// -------------------
instance DIA_Onar_HowMuch(C_INFO)
{
	npc				= BAU_900_Onar;
	nr				= 7;
	condition		= DIA_Onar_HowMuch_Condition;
	information		= DIA_Onar_HowMuch_Info;
	description		= "那 我 的 报 酬 呢 ？";
};

func int DIA_Onar_HowMuch_Condition()
{
	if (Onar_Approved == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Onar_HowMuch_Info()
{
	AI_Output(other, self, "DIA_Onar_HowMuch_15_00"); //那 我 的 报 酬 呢 ？
	AI_Output(self, other, "DIA_Onar_HowMuch_14_01"); //嗯 ， 我 们 看 一 下 … …

	SOLD = 50;

	if (Onar_WegenSldWerden == TRUE)
	{
		AI_Output(self, other, "DIA_Onar_HowMuch_14_02"); //我 不 看 重 你 。
	};

	if (Onar_WegenSekob == TRUE)
	{
		AI_Output(self, other, "DIA_Onar_HowMuch_14_03"); //你 不 是 最 能 干 的 。 从 塞 柯 布 那 件 事 上 可 以 看 的 很 明 显 。
		SOLD = SOLD - 10;
	};

	if ((ABSOLUTIONLEVEL_Farm > 1)
	|| ((B_GetGreatestPetzCrime(self) > CRIME_NONE) && (ABSOLUTIONLEVEL_Farm > 0)))
	{
		AI_Output(self, other, "DIA_Onar_HowMuch_14_04"); //你 已 经 在 农 场 这 里 惹 了 不 少 麻 烦 。
		SOLD = SOLD - 10;
	};

	if ((Onar_WegenPepe == TRUE)
	&& ((Onar_WegenSekob == TRUE) || (Onar_WegenSldWerden == TRUE)))
	{
		AI_Output(self, other, "DIA_Onar_HowMuch_14_05"); //而 且 你 总 是 跟 着 我 胡 说 八 道 。
		SOLD = SOLD - 10;
	};

	AI_Output(self, other, "DIA_Onar_HowMuch_14_06"); //让 我 想 想 … …
	B_Say_Gold(self, other, SOLD);

	Onar_SOLD_Day = Wld_GetDay();
	Onar_SOLD_XP = other.exp;

	AI_Output(self, other, "DIA_Onar_HowMuch_14_07"); //你 认 为 怎 么 样 ？

	Info_ClearChoices(DIA_Onar_HowMuch);
	Info_AddChoice(DIA_Onar_HowMuch, "听 起 来 不 错 ！", DIA_Onar_HowMuch_Ok);
	Info_AddChoice(DIA_Onar_HowMuch, "那 不 算 很 多 … …", DIA_Onar_HowMuch_More);
	Info_AddChoice(DIA_Onar_HowMuch, "每 天 ？ ", DIA_Onar_HowMuch_PerDay);
};

func void DIA_Onar_HowMuch_PerDay()
{
	AI_Output(other, self, "DIA_Onar_HowMuch_PerDay_15_00"); //每 天 ？
	AI_Output(self, other, "DIA_Onar_HowMuch_PerDay_14_01"); //你 怎 么 想 的？ 每 周 ？ 你 真 的 一 点 也 不 机 灵 。
	AI_Output(self, other, "DIA_Onar_HowMuch_PerDay_14_02"); //那 么 就 来 这 里 拿 你 的 钱 吧 。
	AI_Output(self, other, "DIA_Onar_HowMuch_PerDay_14_03"); //我 不 会 给 你 送 去 的 。
};

func void DIA_Onar_HowMuch_More()
{
	AI_Output(other, self, "DIA_Onar_HowMuch_More_15_00"); //那 不 算 很 多 … …
	AI_Output(self, other, "DIA_Onar_HowMuch_More_14_01"); //当 然 ， 欢 迎 你 给 我 免 费 工 作 。
	AI_Output(self, other, "DIA_Onar_HowMuch_More_14_02"); //总 之 ， 这 是 所 有 你 得 到 的 ！

	Log_CreateTopic(Topic_Bonus, LOG_NOTE);
	B_LogEntry(Topic_Bonus, Topic_Bonus_7);

	Info_ClearChoices(DIA_Onar_HowMuch);
};

func void DIA_Onar_HowMuch_Ok()
{
	AI_Output(other, self, "DIA_Onar_HowMuch_Ok_15_00"); //听 起 来 不 错 ！
	AI_Output(self, other, "DIA_Onar_HowMuch_Ok_14_01"); //我 也 这 么 想 。 现 在 去 找 李 ！

	Log_CreateTopic(Topic_Bonus, LOG_NOTE);
	B_LogEntry(Topic_Bonus, Topic_Bonus_7);

	Info_ClearChoices(DIA_Onar_HowMuch);
};

// ************************************************************
// 			  				Sold abholen
// ************************************************************
instance DIA_Onar_CollectGold(C_INFO)
{
	npc				= BAU_900_Onar;
	nr				= 8;
	condition		= DIA_Onar_CollectGold_Condition;
	information		= DIA_Onar_CollectGold_Info;
	permanent		= TRUE;
	description		= "支 付 我 的 工 资 ！";
};

func int DIA_Onar_CollectGold_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Onar_HowMuch))
	&& ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Onar_CollectGold_Info()
{
	AI_Output(other, self, "DIA_Onar_CollectGold_15_00"); //支 付 我 的 工 资 ！

	if (other.guild == GIL_DJG)
	{
		AI_Output(self, other, "DIA_Onar_CollectGold_14_01"); //我 付 钱 给 雇 佣 兵 ， 而 不 是 龙 猎 手 。
	}
	else if (Torlof_TheOtherMission_TooLate == TRUE)
	{
		AI_Output(self, other, "DIA_Onar_CollectGold_14_02"); //你 没 有 处 理 好 指 派 给 你 的 任 务 ！
		AI_Output(self, other, "DIA_Onar_CollectGold_14_03"); //我 已 经 问 过 托 尔 洛 夫 你 干 得 怎 么 样 。 而 他 说 你 的 工 作 永 远 也 完 不 成 。
		AI_Output(self, other, "DIA_Onar_CollectGold_14_04"); //我 不 会 在 懒 汉 身 上 浪 费 钱 。
		AI_Output(self, other, "DIA_Onar_CollectGold_14_05"); //从 现 在 起 几 周 内 ， 你 将 没 有 报 酬 ！ 也 许 那 样 你 就 能 学 会 点 什 么 。
	}
	else if (B_GetGreatestPetzCrime(self) > CRIME_NONE)
	{
		AI_Output(self, other, "DIA_Onar_CollectGold_14_06"); //我 听 说 你 惹 事 了 。 先 去 李 那 里 把 那 件 事 解 决 了 ！
	}
	else if (Wld_GetDay() <= Onar_SOLD_Day)
	{
		AI_Output(self, other, "DIA_Onar_CollectGold_14_07"); //你 疯 了 吗 ？
		AI_Output(self, other, "DIA_Onar_CollectGold_14_08"); //先 为 我 工 作 一 天 。 然 后 你 可 以 在 第 二 天 拿 到 你 的 报 酬 。
	}
	else if (Wld_GetDay() - 2 >= Onar_SOLD_Day)
	{
		if (Wld_GetDay() - 2 == Onar_SOLD_Day)
		{
			AI_Output(self, other, "DIA_Onar_CollectGold_14_09"); //你 昨 天 在 哪 里 ？
		}
		else
		{
			AI_Output(self, other, "DIA_Onar_CollectGold_14_10"); //你 前 几 天 去 哪 里 了 ？
		};

		AI_Output(self, other, "DIA_Onar_CollectGold_14_11"); //你 根 本 不 在 这 里 。
		AI_Output(self, other, "DIA_Onar_CollectGold_14_12"); //谁 知 道 你 在 哪 里 闲 逛 。
		Onar_SOLD_Day = Wld_GetDay();
		Onar_SOLD_XP = other.exp;
	}
	else // genau 1 Tag später...
	{
		if (other.exp > Onar_SOLD_XP + 200)
		{
			AI_Output(self, other, "DIA_Onar_CollectGold_14_13"); //（ 后 悔 的 ） 哦 ， 好 吧 。 这 是 你 的 工 资 。

			// patch m.F.
			B_GiveInvItems(self, other, itmi_gold, SOLD);
			B_Say_Gold(self, other, SOLD);
		}
		else // nur gepennt
		{
			AI_Output(self, other, "DIA_Onar_CollectGold_14_14"); //什 么 ？ 你 不 睡 觉 的 时 候 就 整 天 闲 逛 什 么 事 都 不 做 ！
			AI_Output(self, other, "DIA_Onar_CollectGold_14_15"); //我 不 会 付 你 工 资 的 ！
		};

		Onar_SOLD_Day = Wld_GetDay();
		Onar_SOLD_XP = other.exp;
	};
};

// ************************************************************
// 			  				Sold abholen
// ************************************************************
instance DIA_Onar_MariaGold(C_INFO)
{
	npc				= BAU_900_Onar;
	nr				= 9;
	condition		= DIA_Onar_MariaGold_Condition;
	information		= DIA_Onar_MariaGold_Info;
	description		= "玛 丽 亚 认 为 我 不 会 满 足 。";
};

func int DIA_Onar_MariaGold_Condition()
{
	if (Maria_MehrGold == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Onar_MariaGold_Info()
{
	AI_Output(other, self, "DIA_Onar_MariaGold_15_00"); //玛 丽 亚 认 为 我 不 会 满 足 。
	AI_Output(self, other, "DIA_Onar_MariaGold_14_01"); //什 么 ？
	AI_Output(other, self, "DIA_Onar_MariaGold_15_02"); //她 说 你 应 该 多 给 我 点 钱 。
	AI_Output(self, other, "DIA_Onar_MariaGold_14_03"); //（ 理 解 ） 那 个 女 人 什 么 闲 事 都 要 管 。
	AI_Output(self, other, "DIA_Onar_MariaGold_14_04"); //她 说 了 多 少 吗 ？
	AI_Output(other, self, "DIA_Onar_MariaGold_15_05"); //不 。
	AI_Output(self, other, "DIA_Onar_MariaGold_14_06"); //好 吧 ， 从 你 下 次 拿 工 资 开 始 ， 你 将 得 到 额 外 的10枚 金 币 。
	AI_Output(self, other, "DIA_Onar_MariaGold_14_07"); //但 是 不 能 再 多 一 分 钱 了 ， 明 白 吗 ？

	SOLD = SOLD + 10;
};

// ************************************************************
// 			  				WannaSheep
// ************************************************************
var int Onar_SellSheep;
// --------------------
instance DIA_Onar_WannaSheep(C_INFO)
{
	npc				= BAU_900_Onar;
	nr				= 10;
	condition		= DIA_Onar_WannaSheep_Condition;
	information		= DIA_Onar_WannaSheep_Info;
	permanent		= TRUE;
	description		= "我 想 要 买 一 头 绵 羊！";
};

func int DIA_Onar_WannaSheep_Condition()
{
	if (Onar_SellSheep == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Onar_WannaSheep_Info()
{
	AI_Output(other, self, "DIA_Onar_WannaSheep_15_00"); //我 想 要 买 一 头 绵 羊 ！
	AI_Output(self, other, "DIA_Onar_WannaSheep_14_01"); //那 你 在 这 里 做 什 么 ？ 就 看 着 一 头 羊 ？！
	AI_Output(other, self, "DIA_Onar_WannaSheep_15_02"); //我 … …
	AI_Output(self, other, "DIA_Onar_WannaSheep_14_03"); //如 果 你 想 要 买 绵 羊 ， 去 牧 场 。 就 在 我 的 房 子 的 右 边 。
	AI_Output(self, other, "DIA_Onar_WannaSheep_14_04"); //皮 皮 卖 给 你 了 吗 ？。

	if (Npc_IsDead(Pepe))
	{
		AI_Output(other, self, "DIA_Onar_WannaSheep_15_05"); //恐 怕 皮 皮 已 经 死 了 。
		AI_Output(self, other, "DIA_Onar_WannaSheep_14_06"); //哦 ！ 那 样 的 话 … … 给 我 留 下200枚 金 币 ， 然 后 从 牧 场 里 挑 一 头 羊 。

		Onar_SellSheep = TRUE;
	};
};

// ************************************************************
// 			  				Buy Liesel
// ************************************************************
instance DIA_Onar_BuyLiesel(C_INFO)
{
	npc				= BAU_900_Onar;
	nr				= 10;
	condition		= DIA_Onar_BuyLiesel_Condition;
	information		= DIA_Onar_BuyLiesel_Info;
	permanent		= TRUE;
	description		= "给 你 ， ２ ０ ０ 枚 金 币 。 给 我 一 头 绵 羊 。";
};

func int DIA_Onar_BuyLiesel_Condition()
{
	if (Onar_SellSheep == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Onar_BuyLiesel_Info()
{
	AI_Output(other, self, "DIA_Onar_BuyLiesel_15_00"); //给 你 ， ２ ０ ０ 枚 金 币 。 给 我 一 头 绵 羊 。

	if (B_GiveInvItems(other, self, ItMi_Gold, 200))
	{
		AI_Output(self, other, "DIA_Onar_BuyLiesel_14_01"); //你 可 以 从 牧 场 选 一 头 。
		AI_Output(self, other, "DIA_Onar_BuyLiesel_14_02"); //那 些 绵 羊 中 一 定 会 有 一 头 跟 着 你 。 它 们 中 大 部 分 都 会 响 应 贝 斯 蒂 这 个 名 字 。

		Wld_InsertNpc(Follow_Sheep, "NW_BIGFARM_SHEEP2_02");

		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, other, "DIA_Onar_BuyLiesel_14_03"); //你 根 本 没 有 那 么 多 金 币 。 别 浪 费 我 宝 贵 的 时 间 ！
	};
};
