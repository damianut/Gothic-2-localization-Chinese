///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_EXIT(C_INFO)
{
	npc				= Mil_337_Mika;
	nr				= 999;
	condition		= DIA_Mika_EXIT_Condition;
	information		= DIA_Mika_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Mika_EXIT_Condition()
{
	if (Kapitel <= 2)
	{
		return TRUE;
	};
};

func void DIA_Mika_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Refuse Talk wenn Lares am Start
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_Refuse(C_INFO)
{
	npc				= Mil_337_Mika;
	nr				= 1;
	condition		= DIA_Mika_Refuse_Condition;
	information		= DIA_Mika_Refuse_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Mika_Refuse_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (Lares.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Mika_Refuse_Info()
{
	B_Say(self, other, "$NOTNOW");
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Wohin
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_WOHIN(C_INFO)
{
	npc				= Mil_337_Mika;
	nr				= 4;
	condition		= DIA_Mika_WOHIN_Condition;
	information		= DIA_Mika_WOHIN_Info;
	important		= TRUE;
};

func int DIA_Mika_WOHIN_Condition()
{
	if (Lares.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mika_WOHIN_Info()
{
	AI_Output(self, other, "DIA_Mika_WOHIN_12_00"); //嘿 ， 嘿 。 不 要 那 么 急 。 一 个 人 在 这 里 转 的 话 很 危 险 。 你 从 哪 里 来 ？

	Info_ClearChoices(DIA_Mika_WOHIN);

	Info_AddChoice(DIA_Mika_WOHIN, "那 不 关 你 的 事 。", DIA_Mika_WOHIN_weg);
	Info_AddChoice(DIA_Mika_WOHIN, "从 一 个 农 场 来 。", DIA_Mika_WOHIN_Bauern);
	Info_AddChoice(DIA_Mika_WOHIN, "从 城 市 来.", DIA_Mika_WOHIN_stadt);
};

func void DIA_Mika_WOHIN_stadt()
{
	AI_Output(other, self, "DIA_Mika_WOHIN_stadt_15_00"); //从 城 市 来 ！
	AI_Output(self, other, "DIA_Mika_WOHIN_stadt_12_01"); //嗯 ， 嗯 。 那 么 你 为 什 么 要 离 开 城 市 的 保 护 墙 ， 到 这 里 转 呢 ？

	Info_ClearChoices(DIA_Mika_WOHIN);
};

func void DIA_Mika_WOHIN_Bauern()
{
	AI_Output(other, self, "DIA_Mika_WOHIN_Bauern_15_00"); //从 一 个 农 场 来 。
	AI_Output(self, other, "DIA_Mika_WOHIN_Bauern_12_01"); //一 个 农 民 ， 嗯 ？ 唔 。 那 么 你 不 应 该 一 个 人 走 这 么 危 险 的 路 。 谁 知 道 有 谁 会 藏 在 前 面 等 着 你 呢 。

	Info_ClearChoices(DIA_Mika_WOHIN);
};

func void DIA_Mika_WOHIN_weg()
{
	AI_Output(other, self, "DIA_Mika_WOHIN_weg_15_00"); //那 不 关 你 的 事 。
	AI_Output(self, other, "DIA_Mika_WOHIN_weg_12_01"); //如 果 你 要 那 么 说 的 话 。 但 是 如 果 后 来 有 人 要 杀 掉 你 的 时 候 ， 不 要 抱 怨 。 祝 你 一 天 愉 快 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WasGefaehrlich
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_WASGEFAEHRLICH(C_INFO)
{
	npc				= Mil_337_Mika;
	nr				= 5;
	condition		= DIA_Mika_WASGEFAEHRLICH_Condition;
	information		= DIA_Mika_WASGEFAEHRLICH_Info;
	description		= "这 里 有 什 么 这 样 危 险 ？";
};

func int DIA_Mika_WASGEFAEHRLICH_Condition()
{
	return TRUE;
};

func void DIA_Mika_WASGEFAEHRLICH_Info()
{
	AI_Output(other, self, "DIA_Mika_WASGEFAEHRLICH_15_00"); //这 里 有 什 么 这 样 危 险 ？
	AI_Output(self, other, "DIA_Mika_WASGEFAEHRLICH_12_01"); //很 多 事 情 。
	if (other.protection[PROT_EDGE] < ITAR_Leather_L.protection [PROT_EDGE]) // Joly: kleiner als die Lederrüstung
	{
		AI_Output(self, other, "DIA_Mika_WASGEFAEHRLICH_12_02"); //有 一 件 事 ， 有 强 盗 。 他 们 会 杀 掉 你 这 样 的 弱 者 来 做 早 餐 。
		AI_Output(self, other, "DIA_Mika_WASGEFAEHRLICH_12_03"); //如 果 强 盗 没 有 抓 住 你 ， 那 么 森 林 里 的 野 生 动 物 或 者 在 附 近 游 荡 的 雇 佣 兵 也 会 解 决 你 。
		AI_Output(self, other, "DIA_Mika_WASGEFAEHRLICH_12_04"); //所 以 ， 在 出 去 之 前 ， 先 给 你 自 己 弄 一 套 象 样 的 盔 甲 。
	};

	AI_Output(self, other, "DIA_Mika_WASGEFAEHRLICH_12_05"); //我 打 赌 ， 你 在 路 的 下 一 个 拐 弯 那 里 就 会 大 声 呼 叫 请 求 我 的 帮 助 。
};

///////////////////////////////////////////////////////////////////////
//	Info waskostetHilfe
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_WASKOSTETHILFE(C_INFO)
{
	npc				= Mil_337_Mika;
	nr				= 6;
	condition		= DIA_Mika_WASKOSTETHILFE_Condition;
	information		= DIA_Mika_WASKOSTETHILFE_Info;
	description		= "只 是 假 定 我 需 要 你 的 帮 助 。";
};

func int DIA_Mika_WASKOSTETHILFE_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Mika_WASGEFAEHRLICH))
	{
		return TRUE;
	};
};

func void DIA_Mika_WASKOSTETHILFE_Info()
{
	AI_Output(other, self, "DIA_Mika_WASKOSTETHILFE_15_00"); //只 是 假 设 ， 如 果 我 回 来 请 求 你 的 帮 助 ， 那 需 要 花 多 少 钱 ？
	AI_Output(self, other, "DIA_Mika_WASKOSTETHILFE_12_01"); //我 只 是一 个 谦 卑 的 国 王 的 仆 人 ， 不 喜 欢 欺 骗 这 个 国 家 中 那 些 无 助 的 小 市 民 。
	AI_Output(self, other, "DIA_Mika_WASKOSTETHILFE_12_02"); //但 是 你 知 道 ， 如 果 你 那 样 说 的 话 ， 我 不 反 对 收 取 一 点 资 金 援 助 以 提 升 我 们 未 来 的 商 业 关 系 。
	AI_Output(self, other, "DIA_Mika_WASKOSTETHILFE_12_03"); //一 开 始10枚 金 币 应 该 够 了 。 你 觉 得 呢 ？

	Info_ClearChoices(DIA_Mika_WASKOSTETHILFE);

	Info_AddChoice(DIA_Mika_WASKOSTETHILFE, "我 要 考 虑 一 下 。", DIA_Mika_WASKOSTETHILFE_nochnicht);
	Info_AddChoice(DIA_Mika_WASKOSTETHILFE, "为 什 么 不 ？ 这 是 你 的 １ ０ 块 钱 。", DIA_Mika_WASKOSTETHILFE_ja);
};

func void DIA_Mika_WASKOSTETHILFE_ja()
{
	AI_Output(other, self, "DIA_Mika_WASKOSTETHILFE_ja_15_00"); //为 什 么 不 ？ 这 是 你 的 １ ０ 块 钱 。

	if (B_GiveInvItems(other, self, ItMi_Gold, 10))
	{
		AI_Output(self, other, "DIA_Mika_WASKOSTETHILFE_ja_12_01"); //非 常 好 。 如 果 你 需 要 我 的 帮 助 ， 你 知 道 到 哪 里 来 找 我 。
		AI_Output(self, other, "DIA_Mika_WASKOSTETHILFE_ja_12_02"); //但 是 请 帮 我 一 个 忙 ， 不 要 因 为 一 点 点 小 事 就 来 麻 烦 我 。 我 受 不 了 那 个 ， 你 听 到 了 吗 ？ ？

		Mika_Helps = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Mika_WASKOSTETHILFE_ja_12_03"); //你 没 有 那 么 多 钱 。 也 许 你 应 该 重 新 考 虑 一 下 是 否 需 要 我 的 帮 助 。
	};

	AI_StopProcessInfos(self);
};

func void DIA_Mika_WASKOSTETHILFE_nochnicht()
{
	AI_Output(other, self, "DIA_Mika_WASKOSTETHILFE_nochnicht_15_00"); //我 会 考 虑 考 虑 的 。
	AI_Output(self, other, "DIA_Mika_WASKOSTETHILFE_nochnicht_12_01"); //你 随 便 。 享 受 死 亡 吧 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Ueberlegt
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_UEBERLEGT(C_INFO)
{
	npc				= Mil_337_Mika;
	nr				= 7;
	condition		= DIA_Mika_UEBERLEGT_Condition;
	information		= DIA_Mika_UEBERLEGT_Info;
	permanent		= TRUE;
	description		= "我 改 变 主 意 了 。 我 愿 意 付 你 １ ０ 枚 金 币 。";
};

func int DIA_Mika_UEBERLEGT_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Mika_WASKOSTETHILFE))
	&& (Mika_Helps == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mika_UEBERLEGT_Info()
{
	AI_Output(other, self, "DIA_Mika_UEBERLEGT_15_00"); //我 改 变 主 意 了 。 我 愿 意 付 你 １ ０ 枚 金 币 。

	if (B_GiveInvItems(other, self, ItMi_Gold, 10))
	{
		AI_Output(self, other, "DIA_Mika_UEBERLEGT_12_01"); //好 极 了 。 迟 到 总 比 不 到 好 。 现 在 呢 ？

		Mika_Helps = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Mika_UEBERLEGT_12_02"); //（ 生 气 ） 等 你 有 钱 了 再 回 来 吧 。
		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info HILFE
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_HILFE(C_INFO)
{
	npc				= Mil_337_Mika;
	nr				= 8;
	condition		= DIA_Mika_HILFE_Condition;
	information		= DIA_Mika_HILFE_Info;
	permanent		= TRUE;
	description		= "我 需 要 你 的 帮 助 。";
};

func int DIA_Mika_HILFE_Condition()
{
	if (Mika_Helps == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Mika_HILFE_Info()
{
	AI_Output(other, self, "DIA_Mika_HILFE_15_00"); //我 需 要 你 的 帮 助 。
	AI_Output(self, other, "DIA_Mika_HILFE_12_01"); //如 果 确 实 需 要 的 话 … … 有 什 么 麻 烦 ？

	Info_ClearChoices(DIA_Mika_HILFE);

	Info_AddChoice(DIA_Mika_HILFE, "我 被 强 盗 们 追 赶 。", DIA_Mika_HILFE_schongut);
	Info_AddChoice(DIA_Mika_HILFE, "我 遭 到 了 怪 物 的 袭 击 。", DIA_Mika_HILFE_monster);

	if ((!Npc_IsDead(Alvares))
	&& (!Npc_IsDead(Engardo))
	&& ((Akils_SLDstillthere == TRUE) || (Npc_KnowsInfo(other, DIA_Sarah_Bauern))))
	{
		Info_AddChoice(DIA_Mika_HILFE, "农 民 阿 基 尔 遭 到 雇 佣 兵 的 袭 击 。", DIA_Mika_HILFE_Akil);
	};
};

func void DIA_Mika_HILFE_Akil()
{
	AI_Output(other, self, "DIA_Mika_HILFE_Akil_15_00"); //农 民 阿 基 尔 遭 到 雇 佣 兵 的 袭 击 。
	AI_Output(self, other, "DIA_Mika_HILFE_Akil_12_01"); //什 么 ？ 那 些 流 氓 在 阿 基 尔 的 农 场 附 近 ？ 那 我 们 不 要 浪 费 时 间 。 跟 我 来 。

	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	B_GivePlayerXP(Xp_Ambient);
	B_LogEntry(TOPIC_AkilsSLDStillthere, TOPIC_AkilsSLDStillthere_2);

	Npc_ExchangeRoutine(self, "Akil");
};

func void DIA_Mika_HILFE_monster()
{
	AI_Output(other, self, "DIA_Mika_HILFE_monster_15_00"); //我 遭 到 了 怪 物 的 袭 击 。
	AI_Output(self, other, "DIA_Mika_HILFE_monster_12_01"); //但 是 我 没 有 看 到 任 何 怪 物 。 我 肯 定 那 只 是 你 虚 构 的 。

	AI_StopProcessInfos(self);
};

func void DIA_Mika_HILFE_schongut()
{
	AI_Output(other, self, "DIA_Mika_HILFE_schongut_15_00"); //我 被 强 盗 们 追 赶 。
	AI_Output(self, other, "DIA_Mika_HILFE_schongut_12_01"); //真 的 ？ 那 么 他 们 在 哪 里 ？ 如 果 你 被 追 赶 的 话 ， 我 至 少 应 该 能 看 到 他 们 之 中 的 一 个 ， 对 吗 ？

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Zack
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_Zack(C_INFO)
{
	npc				= Mil_337_Mika;
	nr				= 8;
	condition		= DIA_Mika_Zack_Condition;
	information		= DIA_Mika_Zack_Info;
	important		= TRUE;
};

func int DIA_Mika_Zack_Condition()
{
	if ((Npc_GetDistToWP(self, "NW_FARM2_PATH_03") < 500)
	&& ((!Npc_IsDead(Alvares)) || (!Npc_IsDead(Engardo))))
	{
		return TRUE;
	};
};

func void DIA_Mika_Zack_Info()
{
	AI_Output(self, other, "DIA_Mika_Zack_12_00"); //现 在 看 看 这 是 怎 样 进 行 的 。
	Info_AddChoice(DIA_Mika_Zack, DIALOG_ENDE, DIA_Mika_Zack_los);
};

func void DIA_Mika_Zack_los()
{
	AI_StopProcessInfos(self);
	// Joly: B_attack funzt hier nicht und ist auch nicht nötig!!!!!!!!!!!
	if (!Npc_IsDead(Alvares))
	{
		Alvares.aivar[AIV_EnemyOverride] = FALSE;
	};

	if (!Npc_IsDead(Engardo))
	{
		Engardo.aivar[AIV_EnemyOverride] = FALSE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info WiederNachHause
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_WIEDERNACHHAUSE(C_INFO)
{
	npc				= Mil_337_Mika;
	nr				= 9;
	condition		= DIA_Mika_WIEDERNACHHAUSE_Condition;
	information		= DIA_Mika_WIEDERNACHHAUSE_Info;
	important		= TRUE;
};

func int DIA_Mika_WIEDERNACHHAUSE_Condition()
{
	if ((Npc_GetDistToWP(self, "NW_FARM2_PATH_03") < 10000)
	&& (Npc_IsDead(Alvares))
	&& (Npc_IsDead(Engardo)))
	{
		return TRUE;
	};
};

func void DIA_Mika_WIEDERNACHHAUSE_Info()
{
	AI_Output(self, other, "DIA_Mika_WIEDERNACHHAUSE_12_00"); //好 吧 。 就 这 样 了 。 那 我 离 开 了 。

	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self, "Start");
	B_GivePlayerXP(Xp_Ambient);
};

// ############################################
// ##
// ## Kapitel 3
// ##
// ############################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_Kap3_EXIT(C_INFO)
{
	npc				= Mil_337_Mika;
	nr				= 999;
	condition		= DIA_Mika_Kap3_EXIT_Condition;
	information		= DIA_Mika_Kap3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Mika_Kap3_EXIT_Condition()
{
	if (Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Mika_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//***************************************************
//		Perm Kap3
//***************************************************

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_Kap3u4u5_PERM(C_INFO)
{
	npc				= Mil_337_Mika;
	nr				= 39;
	condition		= DIA_Mika_Kap3u4u5_PERM_Condition;
	information		= DIA_Mika_Kap3u4u5_PERM_Info;
	permanent		= TRUE;
	description		= "都 安 静 了 ？";
};

func int DIA_Mika_Kap3u4u5_PERM_Condition()
{
	if ((Kapitel >= 3)
	&& (Npc_KnowsInfo(other, DIA_Mika_WOHIN))
	&& (Npc_IsDead(Alvares))
	&& (Npc_IsDead(Engardo)))
	{
		return TRUE;
	};
};

func void DIA_Mika_Kap3u4u5_PERM_Info()
{
	AI_Output(other, self, "DIA_Mika_Kap3u4u5_PERM_15_00"); //都 安 静 了 ？
	AI_Output(self, other, "DIA_Mika_Kap3u4u5_PERM_12_01"); //你 还 活 着 。 我 很 惊 讶 。
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Mika_PICKPOCKET(C_INFO)
{
	npc				= Mil_337_Mika;
	nr				= 900;
	condition		= DIA_Mika_PICKPOCKET_Condition;
	information		= DIA_Mika_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Mika_PICKPOCKET_Condition()
{
	C_Beklauen(65, 75);
};

func void DIA_Mika_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Mika_PICKPOCKET);
	Info_AddChoice(DIA_Mika_PICKPOCKET, DIALOG_BACK, DIA_Mika_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Mika_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Mika_PICKPOCKET_DoIt);
};

func void DIA_Mika_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Mika_PICKPOCKET);
};

func void DIA_Mika_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Mika_PICKPOCKET);
};
