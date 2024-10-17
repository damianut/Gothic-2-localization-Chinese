///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Fellan_EXIT(C_INFO)
{
	npc				= VLK_480_Fellan;
	nr				= 999;
	condition		= DIA_Fellan_EXIT_Condition;
	information		= DIA_Fellan_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Fellan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fellan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Fellan_PICKPOCKET(C_INFO)
{
	npc				= VLK_480_Fellan;
	nr				= 900;
	condition		= DIA_Fellan_PICKPOCKET_Condition;
	information		= DIA_Fellan_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Fellan_PICKPOCKET_Condition()
{
	C_Beklauen(40, 40);
};

func void DIA_Fellan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fellan_PICKPOCKET);
	Info_AddChoice(DIA_Fellan_PICKPOCKET, DIALOG_BACK, DIA_Fellan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fellan_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Fellan_PICKPOCKET_DoIt);
};

func void DIA_Fellan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Fellan_PICKPOCKET);
};

func void DIA_Fellan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fellan_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info Tough Guy News
///////////////////////////////////////////////////////////////////////
instance DIA_Fellan_News(C_INFO)
{
	npc				= VLK_480_Fellan;
	nr				= 1;
	condition		= DIA_Fellan_News_Condition;
	information		= DIA_Fellan_News_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Fellan_News_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE)
	&& (self.aivar[AIV_LastFightComment] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fellan_News_Info()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self, other, "DIA_Fellan_News_06_00"); //嗯 ， 这 可 难 倒 我 了 。 那 是 相 当 英 勇 的 行 为 。

		if ((MIS_AttackFellan == LOG_RUNNING)
		&& (FellanGeschlagen == FALSE))
		{
			AI_Output(other, self, "DIA_Fellan_News_15_01"); //你 能 马 上 停 止 敲 敲 打 打 吗 ， 还 是 我 不 得 不 再 给 你 一 顿 好 打 ？
			AI_Output(self, other, "DIA_Fellan_News_06_02"); //不 ， 别 再 打 我 了 。 我 会 停 下 。 但 如 果 这 里 的 一 切 都 崩 塌 了 ， 那 会 是 你 的 错 ！

			FellanGeschlagen = TRUE;
			Npc_ExchangeRoutine(self, "OHNEHAMMER");
			AI_StopProcessInfos(self);
		};
	};

	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		AI_Output(self, other, "DIA_Fellan_News_06_03"); //发 生 了 什 么 事 ？ 再 在 脸 上 来 一 拳 怎 么 样 ？
	};

	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
	{
		AI_Output(self, other, "DIA_Fellan_News_06_04"); //你 是 疯 子 吗 ？ 打 ， 不 要 打 ， 说 - 你 真 正 想 干 什 么 ？
	};

	self.aivar[AIV_LastFightComment] = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Fellan_HALLO(C_INFO)
{
	npc				= VLK_480_Fellan;
	nr				= 2;
	condition		= DIA_Fellan_HALLO_Condition;
	information		= DIA_Fellan_HALLO_Info;
	description		= "你 为 什 么 要 敲 打 ？";
};

func int DIA_Fellan_HALLO_Condition()
{
	if (FellanGeschlagen == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Fellan_HALLO_Info()
{
	AI_Output(other, self, "DIA_Fellan_HALLO_15_00"); //你 为 什 么 要 敲 打 ？
	AI_Output(self, other, "DIA_Fellan_HALLO_06_01"); //至 今 已 经 很 多 天 了 ， 我 一 直 绝 望 地 试 图 修 理 我 屋 子 里 的 漏 洞 。
	AI_Output(self, other, "DIA_Fellan_HALLO_06_02"); //自 从 最 近 我 们 这 里 的 几 场 大 雨 过 后 ， 这 些 椽 就 一 直 在 崩 溃 。 很 快 一 切 都 将 在 我 周 围 塌 下 来 ！
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Stop
///////////////////////////////////////////////////////////////////////
instance DIA_Fellan_Stop(C_INFO)
{
	npc				= VLK_480_Fellan;
	nr				= 3;
	condition		= DIA_Fellan_Stop_Condition;
	information		= DIA_Fellan_Stop_Info;
	description		= "你 能 停 止 敲 打 吗 ？ ";
};

func int DIA_Fellan_Stop_Condition()
{
	if (MIS_AttackFellan == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Fellan_Stop_Info()
{
	AI_Output(other, self, "DIA_Fellan_Stop_15_00"); //你 能 停 止 敲 打 吗 ？
	AI_Output(self, other, "DIA_Fellan_Stop_06_01"); //不 ， 我 必 须 做 完 这 件 事 。

	Info_ClearChoices(DIA_Fellan_Stop);
	Info_AddChoice(DIA_Fellan_Stop, "不 要 再 敲 打 了 ， 否 则 我 就 把 你 身 上 的 每 一 根 骨 头 都 打 断", DIA_Fellan_Stop_Bones);
	Info_AddChoice(DIA_Fellan_Stop, "如 果 你 能 停 止 敲 打 的 话 ， 我 就 给 你 １ ０ 枚 金 币", DIA_Fellan_Stop_Gold);
	Info_AddChoice(DIA_Fellan_Stop, "马 上 停 止 敲 打 ， 好 吗 ？", DIA_Fellan_Stop_Just);
};

func void DIA_Fellan_Stop_Bones()
{
	AI_Output(other, self, "DIA_Fellan_Stop_Bones_15_00"); //不 要 再 敲 打 了 ， 否 则 我 就 把 你 身 上 的 每 一 根 骨 头 都 打 断 。
	AI_Output(self, other, "DIA_Fellan_Stop_Bones_06_01"); //算 了 吧 ， 否 则 我 会 用 我 的 锤 子 往 你 的 脑 子 里 敲 进 去 一 些 理 智 。
	AI_StopProcessInfos(self);
};

func void DIA_Fellan_Stop_Gold()
{
	AI_Output(other, self, "DIA_Fellan_Stop_Gold_15_00"); //如 果 你 能 停 止 敲 打 的 话 ， 我 就 给 你 １ ０ 枚 金 币 。
	AI_Output(self, other, "DIA_Fellan_Stop_Gold_06_01"); //嘿 … … 你 真 是 太 慷 慨 了 。 不 过 对 于 你 的 金 币 ， 你 可 以 … …
	AI_Output(self, other, "DIA_Fellan_Stop_Gold_06_02"); //… … 嗯 ， 你 知 道 你 可 以 用 它 干 什 么 。
};

func void DIA_Fellan_Stop_Just()
{
	AI_Output(other, self, "DIA_Fellan_Stop_Just_15_00"); //马 上 停 止 敲 打 ， 好 吗 ？
	AI_Output(self, other, "DIA_Fellan_Stop_Just_06_01"); //只 要 设 法 别 太 打 搅 我 ， 好 吗 ？
};

///////////////////////////////////////////////////////////////////////
//	Info Alles klar?
///////////////////////////////////////////////////////////////////////
instance DIA_Fellan_klar(C_INFO)
{
	npc				= VLK_480_Fellan;
	nr				= 5;
	condition		= DIA_Fellan_klar_Condition;
	information		= DIA_Fellan_klar_Info;
	permanent		= TRUE;
	description		= "你 好 - 你 感 觉 好 些 了 吗 ？";
};

func int DIA_Fellan_klar_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Fellan_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Fellan_klar_Info()
{
	AI_Output(other, self, "DIA_Fellan_klar_15_00"); //你 好 - 你 感 觉 好 些 了 吗 ？

	if (FellanGeschlagen == FALSE)
	{
		AI_Output(self, other, "DIA_Fellan_klar_06_01"); //好 ， 只 要 我 能 及 时 修 好 全 部 这 些 东 西 。
	}
	else
	{
		AI_Output(self, other, "DIA_Fellan_klar_06_02"); //这 个 屋 顶 无 时 无 刻 不 在 变 得 更 糟 。 下 次 再 下 雨 时 ， 那 些 雨 水 会 淹 到 我 的 脚 踝 上 来 。 而 那 都 是 你 的 错 ！
	};

	AI_StopProcessInfos(self);
};

// Kapitel 2 Miliz Kandidat
