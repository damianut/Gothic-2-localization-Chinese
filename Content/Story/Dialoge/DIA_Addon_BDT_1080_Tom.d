// ---------------------------------------------------------------------
//	Info EXIT
// ---------------------------------------------------------------------
instance DIA_Addon_Tom_EXIT(C_INFO)
{
	npc				= BDT_1080_Addon_Tom;
	nr				= 999;
	condition		= DIA_Addon_Tom_EXIT_Condition;
	information		= DIA_Addon_Tom_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Tom_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Tom_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Tom_PICKPOCKET(C_INFO)
{
	npc				= BDT_1080_Addon_Tom;
	nr				= 900;
	condition		= DIA_Addon_Tom_PICKPOCKET_Condition;
	information		= DIA_Addon_Tom_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Addon_Tom_PICKPOCKET_Condition()
{
	C_Beklauen(40, 52);
};

func void DIA_Addon_Tom_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Tom_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Tom_PICKPOCKET, DIALOG_BACK, DIA_Addon_Tom_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Tom_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Tom_PICKPOCKET_DoIt);
};

func void DIA_Addon_Tom_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Tom_PICKPOCKET);
};

func void DIA_Addon_Tom_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Tom_PICKPOCKET);
};

// ---------------------------------------------------------------------
//	Info HI
// ---------------------------------------------------------------------
instance DIA_Addon_Tom_HI(C_INFO)
{
	npc				= BDT_1080_Addon_Tom;
	nr				= 1;
	condition		= DIA_Addon_Tom_HI_Condition;
	information		= DIA_Addon_Tom_HI_Info;
	description		= "你 为 什 么 在 这 附 近 无 所 事 事 ？";
};

func int DIA_Addon_Tom_HI_Condition()
{
	return TRUE;
};

func void DIA_Addon_Tom_HI_Info()
{
	AI_Output(other, self, "DIA_Addon_Tom_HI_15_00"); //你 为 什 么 在 这 附 近 无 所 事 事 ？
	AI_Output(self, other, "DIA_Addon_Tom_HI_11_01"); //我 遇 到 了 问 题 。 现 在 ， 如 果 我 不 在 营 地 露 面 的 话 ， 更 加 有 利 于 我 的 健 康 。
	AI_Output(other, self, "DIA_Addon_Tom_HI_15_02"); //怎 么 了 ？
	AI_Output(self, other, "DIA_Addon_Tom_HI_11_03"); //我 和 一 些 海 盗 的 关 系 非 常 好 ， 你 知 道 吗 ？
	AI_Output(self, other, "DIA_Addon_Tom_HI_11_04"); //我 常 常 和 那 些 小 子 在 他 们 的 营 地 外 面 碰 头 ， 然 后 交 易 。
	AI_Output(self, other, "DIA_Addon_Tom_HI_11_05"); //老 兄 ！ 我 给 营 地 一 半 的 人 带 东 西 。 ‘ 汤 姆 给 我 带 来 了 这 个 - 汤 姆 给 了 我 那 个 ’ 。
	AI_Output(self, other, "DIA_Addon_Tom_HI_11_06"); //然 后 那 个 混 蛋 伊 斯 特 班 插 了 进 来 。
};

// ---------------------------------------------------------------------
//	Info Juan
// ---------------------------------------------------------------------
instance DIA_Addon_Tom_Juan(C_INFO)
{
	npc				= BDT_1080_Addon_Tom;
	nr				= 2;
	condition		= DIA_Addon_Tom_Juan_Condition;
	information		= DIA_Addon_Tom_Juan_Info;
	description		= "发 生 了 什 么 事 ？";
};

func int DIA_Addon_Tom_Juan_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Tom_HI))
	{
		return TRUE;
	};
};

func void DIA_Addon_Tom_Juan_Info()
{
	AI_Output(other, self, "DIA_Addon_Tom_Juan_15_00"); //发 生 了 什 么 事 ？
	AI_Output(self, other, "DIA_Addon_Tom_Juan_11_01"); //伊 斯 特 班 派 出 了 胡 安 - 他 的 一 个 跟 班 。 那 个 混 蛋 伏 击 了 我 们 。
	AI_Output(self, other, "DIA_Addon_Tom_Juan_11_02"); //当 他 从 黑 暗 中 蹿 出 、 两 下 就 把 我 击 倒 的 时 候 ， 我 正 准 备 要 和 海 盗 做 交 易 。
	AI_Output(self, other, "DIA_Addon_Tom_Juan_11_03"); //老 兄 ， 那 个 家 伙 行 动 敏 捷 ！ 但 是 还 不 够 快 。 我 还 是 从 他 手 上 逃 走 了 。
	SC_Knows_JuanMurderedAngus = TRUE;

	B_LogEntry(TOPIC_Addon_KillJuan, TOPIC_Addon_KillJuan_2);
};

// ---------------------------------------------------------------------
//	Info Esteban
// ---------------------------------------------------------------------
instance DIA_Addon_Tom_Esteban(C_INFO)
{
	npc				= BDT_1080_Addon_Tom;
	nr				= 3;
	condition		= DIA_Addon_Tom_Esteban_Condition;
	information		= DIA_Addon_Tom_Esteban_Info;
	description		= "被 伏 击 后 你 就 藏 在 这 里 ？";
};

func int DIA_Addon_Tom_Esteban_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Tom_Juan))
	{
		return TRUE;
	};
};

func void DIA_Addon_Tom_Esteban_Info()
{
	AI_Output(other, self, "DIA_Addon_Tom_Esteban_15_00"); //被 伏 击 后 你 就 藏 在 这 里 ？
	AI_Output(self, other, "DIA_Addon_Tom_Esteban_11_01"); //首 先 我 返 回 营 地 ， 并 让 费 斯 克 、 胡 诺 和 其 它 人 知 道 他 们 可 以 忘 记 他 们 的 货 物 了 。
	AI_Output(self, other, "DIA_Addon_Tom_Esteban_11_02"); //还 有 伊 斯 特 班 是 幕 后 指 使 。
	AI_Output(self, other, "DIA_Addon_Tom_Esteban_11_03"); //如 果 伊 斯 特 班 得 知 是 我 告 诉 别 人 他 应 该 负 有 责 任 的 话 ， 我 就 死 定 了 。
	AI_Output(self, other, "DIA_Addon_Tom_Esteban_11_04"); //所 以 我 不 能 返 回 营 地 。

	Tom_tells = TRUE;
};

// ---------------------------------------------------------------------
//	Info Dead
// ---------------------------------------------------------------------
instance DIA_Addon_Tom_Dead(C_INFO)
{
	npc				= BDT_1080_Addon_Tom;
	nr				= 4;
	condition		= DIA_Addon_Tom_Dead_Condition;
	information		= DIA_Addon_Tom_Dead_Info;
	description		= "伊 斯 特 班 死 了 。";
};

func int DIA_Addon_Tom_Dead_Condition()
{
	if ((Npc_IsDead(Esteban))
	&& (Npc_KnowsInfo(other, DIA_Addon_Tom_Esteban)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Tom_Dead_Info()
{
	AI_Output(other, self, "DIA_Addon_Tom_Dead_15_00"); //伊 斯 特 班 死 了 。
	AI_Output(self, other, "DIA_Addon_Tom_Dead_11_01"); //真 的 ？ 老 兄 ， 那 太 幸 运 了 ！
	AI_Output(self, other, "DIA_Addon_Tom_Dead_11_02"); //谁 做 的 ？
	AI_Output(other, self, "DIA_Addon_Tom_Dead_15_03"); //（ 顽 皮 的 ） 这 么 说 吧 ， 是 某 个 你 认 识 的 人 … …
	AI_Output(self, other, "DIA_Addon_Tom_Dead_11_04"); //感 谢 你 来 找 我 。 现 在 我 能 返 回 营 地 了 … …

	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "LAGER");
};

// ---------------------------------------------------------------------
// PERM
// ---------------------------------------------------------------------
instance DIA_Addon_Tom_PERM(C_INFO)
{
	npc				= BDT_1080_Addon_Tom;
	nr				= 5;
	condition		= DIA_Addon_Tom_PERM_Condition;
	information		= DIA_Addon_Tom_PERM_Info;
	permanent		= TRUE;
	description		= "还 有 什 么 ？";
};

func int DIA_Addon_Tom_PERM_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Tom_Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Tom_PERM_Info()
{
	AI_Output(other, self, "DIA_Addon_Tom_PERM_15_00"); //还 有 什 么 ？

	if (Npc_GetDistToWP(self, "BL_INN_05_B") <= 500)
	{
		AI_Output(self, other, "DIA_Addon_Tom_PERM_11_01"); //现 在 我 又 可 以 安 详 地 喝 着 露 西 亚 的 酒 醉 倒 了 。
	}
	else
	{
		if (Npc_KnowsInfo(other, DIA_Addon_Tom_Dead))
		{
			AI_Output(self, other, "DIA_Addon_Tom_PERM_11_02"); //现 在 我 终 于 可 以 再 在 营 地 里 面 露 面 了 ！
		}
		else
		{
			AI_Output(self, other, "DIA_Addon_Tom_PERM_11_03"); //不 然 ？ 不 然 我 就 要 坐 在 这 里 数 石 头 … …
		};
	};
};
