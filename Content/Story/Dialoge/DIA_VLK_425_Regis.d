///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_EXIT(C_INFO)
{
	npc				= VLK_425_Regis;
	nr				= 999;
	condition		= DIA_Regis_EXIT_Condition;
	information		= DIA_Regis_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Regis_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Regis_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Regis_PICKPOCKET(C_INFO)
{
	npc				= VLK_425_Regis;
	nr				= 900;
	condition		= DIA_Regis_PICKPOCKET_Condition;
	information		= DIA_Regis_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Regis_PICKPOCKET_Condition()
{
	C_Beklauen(40, 35);
};

func void DIA_Regis_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Regis_PICKPOCKET);
	Info_AddChoice(DIA_Regis_PICKPOCKET, DIALOG_BACK, DIA_Regis_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Regis_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Regis_PICKPOCKET_DoIt);
};

func void DIA_Regis_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Regis_PICKPOCKET);
};

func void DIA_Regis_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Regis_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_Hallo(C_INFO)
{
	npc				= VLK_425_Regis;
	nr				= 1;
	condition		= DIA_Regis_Hallo_Condition;
	information		= DIA_Regis_Hallo_Info;
	important		= TRUE;
};

func int DIA_Regis_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Regis_Hallo_Info()
{
	AI_Output(self, other, "DIA_Regis_Hallo_13_00"); //嘿 ， 你 是 刚 来 城 里 的 ， 是 吗 ？
	AI_Output(other, self, "DIA_Regis_Hallo_15_01"); //是 的 ， 那 你 呢 ？
	AI_Output(self, other, "DIA_Regis_Hallo_13_02"); //我 从 大 陆 上 来 的 ， 现 在 我 在 这 里 游 荡 。 我 几 乎 身 无 分 文 了 ， 所 以 ， 我 想 我 现 在 只 能 加 入 民 兵 了 。
	AI_Output(self, other, "DIA_Regis_Hallo_13_03"); //但 是 ， 我 不 想 那 样 做 。 我 不 希 望 为 了 国 王 的 利 益 而 被 那 些 兽 人 杀 掉 。
};

///////////////////////////////////////////////////////////////////////
//	Info MILIZ
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_MILIZ(C_INFO)
{
	npc				= VLK_425_Regis;
	nr				= 5;
	condition		= DIA_Regis_MILIZ_Condition;
	information		= DIA_Regis_MILIZ_Info;
	description		= "关 于 民 兵 你 能 告 诉 我 一 些 什 么 事 ？";
};

func int DIA_Regis_MILIZ_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Regis_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Regis_MILIZ_Info()
{
	AI_Output(other, self, "DIA_Regis_MILIZ_15_00"); //关 于 民 兵 你 能 告 诉 我 一 些 什 么 事 ？
	AI_Output(self, other, "DIA_Regis_Add_13_01"); //是 一 个 圣 骑 士 在 指 挥 ， 一 个 叫 安 德 烈 的 勋 爵 。
	AI_Output(self, other, "DIA_Regis_Add_13_02"); //他 调 动 了 半 个 城 市 的 力 量 来 预 防 兽 人 的 攻 击 。
	AI_Output(self, other, "DIA_Regis_Add_13_03"); //但 是 ， 你 要 成 为 城 里 的 市 民 才 能 被 接 受 。
	AI_Output(self, other, "DIA_Regis_Add_13_04"); //据 我 所 知 ， 如 果 你 不 是 个 市 民 ， 你 还 是 可 以 被 训 练 ， 但 是 ， 你 不 会 被 正 式 接 受 。
};

///////////////////////////////////////////////////////////////////////
//	Info ANDRE
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_ANDRE(C_INFO)
{
	npc				= VLK_425_Regis;
	nr				= 5;
	condition		= DIA_Regis_ANDRE_Condition;
	information		= DIA_Regis_ANDRE_Info;
	description		= "你 还 能 告 诉 我 一 些 什 么 关 于 安 德 烈 勋 爵 的 事 ？";
};

func int DIA_Regis_ANDRE_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Regis_MILIZ))
	{
		return TRUE;
	};
};

func void DIA_Regis_ANDRE_Info()
{
	AI_Output(other, self, "DIA_Regis_ANDRE_15_00"); //你 还 能 告 诉 我 一 些 什 么 关 于 安 德 烈 勋 爵 的 事 ？
	AI_Output(self, other, "DIA_Regis_Add_13_05"); //他 同 样 还 接 管 了 法 官 的 位 置 。
	AI_Output(self, other, "DIA_Regis_Add_13_06"); //如 果 你 在 城 里 惹 了 什 么 麻 烦 ， 你 将 必 须 接 受 他 的 质 询 。
	AI_Output(self, other, "DIA_Regis_Add_13_07"); //有 一 次 我 跟 一 个 市 民 打 了 一 架 。
	AI_Output(self, other, "DIA_Regis_Add_13_08"); //他 跑 到 安 德 烈 勋 爵 那 里 去 哭 诉 ， 把 我 供 了 出 来 。
	AI_Output(self, other, "DIA_Regis_Add_13_09"); //那 件 小 事 让 我 花 了 5 0 个 金 币 。
	AI_Output(self, other, "DIA_Regis_Add_13_10"); //我 很 走 运 ， 那 是 发 生 在 晚 上 ， 否 则 还 会 有 别 人 来 指 证 我 。
	AI_Output(self, other, "DIA_Regis_Add_13_11"); //城 里 指 控 你 的 人 越 多 ， 你 的 罚 金 就 越 高 。
};

// ****************************************************
// 					Prügelei mit Valentino
// ****************************************************
instance DIA_Regis_Valentino(C_INFO)
{
	npc				= VLK_425_Regis;
	nr				= 5;
	condition		= DIA_Regis_Valentino_Condition;
	information		= DIA_Regis_Valentino_Info;
	description		= "你 在 同 谁 战 斗 ？";
};

func int DIA_Regis_Valentino_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Regis_ANDRE))
	{
		return TRUE;
	};
};

func void DIA_Regis_Valentino_Info()
{
	AI_Output(other, self, "DIA_Regis_Add_15_12"); //你 在 同 谁 战 斗 ？
	AI_Output(self, other, "DIA_Regis_Add_13_13"); //跟 一 个 叫 瓦 尔 地 诺 的 家 伙 。 他 经 常 在 神 殿 附 近 的 酒 馆 转 悠 。
	AI_Output(self, other, "DIA_Regis_Add_13_14"); //我 平 常 不 是 个 暴 力 的 人 。 但 是 ， 那 个 家 伙 的 脸 需 要 按 照 最 差 的 样 子 整 形 … …
};

// ****************************************************
// 					Valentino DEFEATED
// ****************************************************
instance DIA_Regis_ValDefeat(C_INFO)
{
	npc				= VLK_425_Regis;
	nr				= 5;
	condition		= DIA_Regis_ValDefeat_Condition;
	information		= DIA_Regis_ValDefeat_Info;
	description		= "我 遇 到 了 瓦 尔 地 诺 … …";
};

func int DIA_Regis_ValDefeat_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Regis_Valentino))
	&& (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Regis_ValDefeat_Info()
{
	AI_Output(other, self, "DIA_Regis_Add_15_15"); //我 遇 到 了 瓦 尔 地 诺 … …
	AI_Output(self, other, "DIA_Regis_Add_13_16"); //然 后 ？
	AI_Output(other, self, "DIA_Regis_Add_15_17"); //我 给 了 他 一 顿 暴 打 … …
	AI_Output(self, other, "DIA_Regis_Add_13_18"); //（ 大 笑 ） 他 活 该 … …
	if (!Npc_IsDead(Valentino))
	{
		AI_Output(self, other, "DIA_Regis_Add_13_19"); //给 - 我 们 的 小 冲 突 解 决 后 ， 我 在 他 身 上 找 到 了 这 枚 戒 指 。
		B_GiveInvItems(self, other, ItRi_ValentinosRing, 1);
		Regis_Ring = TRUE;
		AI_Output(self, other, "DIA_Regis_Add_13_20"); //（ 咧 着 嘴 笑 ） 欢 迎 你 把 它 传 给 下 一 个 痛 打 他 的 人 … …
	};
};

// **************************************************************
// 							PERM
// **************************************************************
// --------------------------
var int Regis_Bogendieb;
// --------------------------
instance DIA_Regis_PERM(C_INFO)
{
	npc				= VLK_425_Regis;
	nr				= 200;
	condition		= DIA_Regis_PERM_Condition;
	information		= DIA_Regis_PERM_Info;
	permanent		= TRUE;
	description		= "发 生 了 什 么 令 人 兴 奋 的 事 情 吗 ？";
};

func int DIA_Regis_PERM_Condition()
{
	return TRUE;
};

func void DIA_Regis_PERM_Info()
{
	AI_Output(other, self, "DIA_Regis_PERM_15_00"); //发 生 了 什 么 令 人 兴 奋 的 事 情 吗 ？

	if ((Regis_Bogendieb == FALSE)
	&& (MIS_Bosper_Bogen != LOG_SUCCESS))
	{
		AI_Output(self, other, "DIA_Regis_PERM_13_01"); //你 说 得 对 。
		AI_Output(self, other, "DIA_Regis_PERM_13_02"); //他 们 偷 了 制 弓 匠 伯 斯 波 的 东 西 。 多 么 无 耻 的 事 情 啊 ！
		AI_Output(self, other, "DIA_Regis_PERM_13_03"); //那 个 家 伙 从 容 地 走 进 了 商 店 ， 在 光 天 化 日 下 拿 了 一 张 弓 走 了 。
		AI_Output(self, other, "DIA_Regis_PERM_13_04"); //伯 斯 波 就 在 他 后 面 追 ， 大 声 喊 着 ‘ 停 下 ， 你 这 个 无 赖 ！ ’ 但 是 那 个 贼 跑 得 太 快 了 。

		MIS_Bosper_Bogen = LOG_RUNNING;
		Regis_Bogendieb = TRUE;
	}
	else if ((MIS_Bosper_Bogen == LOG_SUCCESS)
	&& (Regis_Bogendieb != 2))
	{
		AI_Output(self, other, "DIA_Regis_PERM_13_05"); //后 来 有 一 个 正 直 的 人 真 的 帮 伯 斯 波 把 那 把 被 盗 走 的 弓 找 回 来 还 给 了 他 。
		AI_Output(self, other, "DIA_Regis_PERM_13_06"); //真 是 奇 怪 - 在 这 种 时 候 ， 每 个 人 都 只 顾 自 己 ， 但 是 这 个 人 竟 然 去 帮 他 找 回 了 那 张 弓 。
		Regis_Bogendieb = 2;
	}
	else
	{
		if (Kapitel != 3)
		{
			AI_Output(self, other, "DIA_Regis_PERM_13_07"); //哦 ， 好 吧 ， 一 切 都 平 静 了 。 我 估 计 当 兽 人 来 的 时 候 ， 我 们 不 会 注 意 不 到 的 … …
		}
		else
		{
			if (MIS_RescueBennet == LOG_SUCCESS)
			{
				AI_Output(self, other, "DIA_Regis_PERM_13_08"); //他 们 确 实 查 明 那 个 雇 佣 兵 是 无 辜 的 ， 所 以 他 们 不 得 不 让 他 走 了 。
				AI_Output(self, other, "DIA_Regis_PERM_13_09"); //哈 根 勋 爵 一 定 气 得 发 疯 了 。
			}
			else
			{
				AI_Output(self, other, "DIA_Regis_PERM_13_10"); //这 件 事 闹 得 整 个 城 里 沸 沸 洋 洋 。 你 还 记 得 洛 萨 吗 ， 那 个 圣 骑 士 ？
				AI_Output(other, self, "DIA_Regis_PERM_15_11"); //也 许 。
				AI_Output(self, other, "DIA_Regis_PERM_13_12"); //不 管 怎 样 ， 他 已 经 死 了 。 就 在 大 街 上 被 谋 杀 了 。 当 然 ， 他 们 都 在 谴 责 那 些 雇 佣 兵 。
			};
		};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Crew
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_Crew(C_INFO)
{
	npc				= VLK_425_Regis;
	nr				= 51;
	condition		= DIA_Regis_Crew_Condition;
	information		= DIA_Regis_Crew_Info;
	description		= "我 要 找 船 员 进 行 航 海 。";
};

func int DIA_Regis_Crew_Condition()
{
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Regis_Crew_Info()
{
	AI_Output(other, self, "DIA_Regis_Crew_15_00"); //我 要 找 船 员 进 行 航 海 。
	AI_Output(self, other, "DIA_Regis_Crew_13_01"); //我 不 能 帮 你 这 个 忙 。 你 也 许 应 该 去 港 口 四 处 看 看 ， 或 者 去 酒 馆 里 。
	AI_Output(self, other, "DIA_Regis_Crew_13_02"); //如 果 还 能 剩 下 几 个 水 手 的 话 ， 你 应 该 能 在 那 里 找 到 他 们 。
};
