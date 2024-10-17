///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_EXIT(C_INFO)
{
	npc				= KDW_1401_Addon_Cronos_NW;
	nr				= 999;
	condition		= DIA_Addon_Cronos_EXIT_Condition;
	information		= DIA_Addon_Cronos_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Cronos_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_Hallo(C_INFO)
{
	npc				= KDW_1401_Addon_Cronos_NW;
	nr				= 5;
	condition		= DIA_Addon_Cronos_Hallo_Condition;
	information		= DIA_Addon_Cronos_Hallo_Info;
	description		= "我 能 打 扰 你 一 会 吗 ？";
};

func int DIA_Addon_Cronos_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_Hallo_Info()
{
	AI_Output(other, self, "DIA_Addon_Cronos_Hallo_15_00"); //我 能 打 扰 你 一 会 吗 ？
	AI_Output(self, other, "DIA_Addon_Cronos_Hallo_04_01"); //（ 感 到 惊 讶 ） 是 你 。 我 从 没 想 到 还 能 再 见 到 你 。
	AI_Output(self, other, "DIA_Addon_Cronos_Hallo_04_02"); //你 能 在 这 里 现 身 证 明 你 非 常 勇 敢 。 有 一 段 时 间 里 ， 我 们 甚 至 要 活 剥 了 你 。
	AI_Output(self, other, "DIA_Addon_Cronos_Hallo_04_03"); //你 应 该 很 高 兴 ， 因 为 几 周 前 我 们 完 都 平 静 了 下 来 。
};

///////////////////////////////////////////////////////////////////////
//	Info WasMachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_WasMachstdu(C_INFO)
{
	npc				= KDW_1401_Addon_Cronos_NW;
	nr				= 5;
	condition		= DIA_Addon_Cronos_WasMachstdu_Condition;
	information		= DIA_Addon_Cronos_WasMachstdu_Info;
	description		= "你 在 这 里 干 什 么 ？";
};

func int DIA_Addon_Cronos_WasMachstdu_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Cronos_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cronos_WasMachstdu_Info()
{
	AI_Output(other, self, "DIA_Addon_Cronos_WasMachstdu_15_00"); //你 在 这 里 干 什 么 ？
	AI_Output(self, other, "DIA_Addon_Cronos_WasMachstdu_04_01"); //（ 困 惑 的 ） 我 的 任 务 是 了 解 更 多 那 些 神 殿 守 护 者 的 情 况 。
	AI_Output(self, other, "DIA_Addon_Cronos_WasMachstdu_04_02"); //那 是 一 个 难 题 ， 让 我 告 诉 你 。 这 些 石 头 哨 兵 有 一 些 对 我 来 说 完 全 陌 生 的 特 性 。
	AI_Output(self, other, "DIA_Addon_Cronos_WasMachstdu_04_03"); //有 时 他 们 会 毫 无 生 气 地 矗 立 在 那 里 ， 有 时 候 它 们 又 会 象 着 魔 一 样 攻 击 你 。
	AI_Output(self, other, "DIA_Addon_Cronos_WasMachstdu_04_04"); //我 还 无 法 确 定 驱 动 他 们 的 能 量 ， 但 是 有 一 件 事 可 以 确 定 ， 它 是 一 种 魔 法 能 源 。
};

///////////////////////////////////////////////////////////////////////
//	Info Waechter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_Waechter(C_INFO)
{
	npc				= KDW_1401_Addon_Cronos_NW;
	nr				= 5;
	condition		= DIA_Addon_Cronos_Waechter_Condition;
	information		= DIA_Addon_Cronos_Waechter_Info;
	description		= "再 多 告 诉 我 一 些 关 于 那 些 石 头 哨 兵 的 消 息 。";
};

func int DIA_Addon_Cronos_Waechter_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Cronos_WasMachstdu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cronos_Waechter_Info()
{
	AI_Output(other, self, "DIA_Addon_Cronos_Waechter_15_00"); //再 多 告 诉 我 一 些 关 于 那 些 石 头 哨 兵 的 消 息 。
	AI_Output(self, other, "DIA_Addon_Cronos_Waechter_04_01"); //（ 困 惑 的 ） 我 还 无 法 再 告 诉 你 更 多 的 情 况 。 不 幸 的 是 ， 我 们 不 得 不 消 灭 它 们 。 现 在 它 们 没 有 危 险 。
	AI_Output(self, other, "DIA_Addon_Cronos_Waechter_04_02"); //当 我 们 到 这 里 的 时 候 ， 它 们 攻 击 了 我 们 。
	AI_Output(self, other, "DIA_Addon_Cronos_Waechter_04_03"); //我 们 只 能 联 手 击 败 它 们 ， 但 是 我 担 心 在 传 送 门 后 有 更 多 。
	AI_Output(self, other, "DIA_Addon_Cronos_Waechter_04_04"); //一 定 有 方 法 消 除 它 们 的 驱 动 能 量 ， 那 样 它 们 就 只 是 一 群 雕 像 了 。
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_NW_Trade(C_INFO)
{
	npc				= KDW_1401_Addon_Cronos_NW;
	nr				= 5;
	condition		= DIA_Addon_Cronos_NW_Trade_Condition;
	information		= DIA_Addon_Cronos_NW_Trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "你 能 卖 我 一 些 装 备 吗 ？";
};

func int DIA_Addon_Cronos_NW_Trade_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Cronos_WasMachstdu))
	{
		return TRUE;
	};
};

var int DIA_Addon_Cronos_NW_Trade_OneTime;

func void DIA_Addon_Cronos_NW_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other, self, "DIA_Addon_Cronos_NW_Trade_15_00"); //你 能 卖 我 一 些 装 备 吗 ？

	if (DIA_Addon_Cronos_NW_Trade_OneTime == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Cronos_NW_Trade_04_01"); //为 什 么 不 ？ 如 果 我 记 得 没 错 的 话 ， 我 们 已 经 成 功 了 。

		DIA_Addon_Cronos_NW_Trade_OneTime = TRUE;
	};

	AI_Output(self, other, "DIA_Addon_Cronos_NW_Trade_04_02"); //告 诉 我 你 需 要 什 么 。

	Log_CreateTopic(Topic_OutTrader, LOG_NOTE);
	B_LogEntry(Topic_OutTrader, LogText_Addon_CronosTrade);
};
