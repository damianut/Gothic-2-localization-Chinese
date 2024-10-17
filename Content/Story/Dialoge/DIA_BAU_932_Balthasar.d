///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_EXIT(C_INFO)
{
	npc				= BAU_932_Balthasar;
	nr				= 999;
	condition		= DIA_Balthasar_EXIT_Condition;
	information		= DIA_Balthasar_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Balthasar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Balthasar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_HALLO(C_INFO)
{
	npc				= BAU_932_Balthasar;
	nr				= 3;
	condition		= DIA_Balthasar_HALLO_Condition;
	information		= DIA_Balthasar_HALLO_Info;
	description		= "那 最 近 怎 么 样 ？";
};

func int DIA_Balthasar_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Balthasar_HALLO_Info()
{
	AI_Output(other, self, "DIA_Balthasar_HALLO_15_00"); //那 最 近 怎 么 样 ？
	AI_Output(self, other, "DIA_Balthasar_HALLO_05_01"); //啊 ， 农 场 里 出 现 了 一 张 新 面 孔 。 那 个 老 吝 啬 鬼 终 于 同 意 给 我 一 个 学 徒 了 吗 ？
	AI_Output(other, self, "DIA_Balthasar_HALLO_15_02"); //我 不 是 学 徒 。
	AI_Output(self, other, "DIA_Balthasar_HALLO_05_03"); //哦 ， 我 明 白 了 。 我 不 象 以 前 那 么 年 青 了 ， 你 知 道 吗 ？ 我 一 直 在 等 接 班 人 ， 已 经 等 几 年 了 。
	AI_Output(self, other, "DIA_Balthasar_HALLO_05_04"); //你 不 在 这 里 ， 是 因 为 邻 居 受 到 了 骚 扰 ， 对 吗 ？
};

///////////////////////////////////////////////////////////////////////
//	Info wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_WASMACHSTDU(C_INFO)
{
	npc				= BAU_932_Balthasar;
	nr				= 4;
	condition		= DIA_Balthasar_WASMACHSTDU_Condition;
	information		= DIA_Balthasar_WASMACHSTDU_Info;
	description		= "你 在 这 里 做 什 么 工 作 ？";
};

func int DIA_Balthasar_WASMACHSTDU_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Balthasar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_WASMACHSTDU_Info()
{
	AI_Output(other, self, "DIA_Balthasar_WASMACHSTDU_15_00"); //你 在 这 里 做 什 么 工 作 ？
	AI_Output(self, other, "DIA_Balthasar_WASMACHSTDU_05_01"); //哦 ， 我 保 护 这 些 绵 羊 ， 而 我 自 打 记 事 起 就 干 这 个 。
	AI_Output(self, other, "DIA_Balthasar_WASMACHSTDU_05_02"); //你 知 道 ， 动 物 是 非 常 忠 诚 、 非 常 聪 明 的 。 如 果 你 善 待 它 们 ， 他 们 一 生 都 会 跟 随 你 。
};

///////////////////////////////////////////////////////////////////////
//	Info Rangerbandits
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Balthasar_Rangerbandits(C_INFO)
{
	npc				= BAU_932_Balthasar;
	nr				= 5;
	condition		= DIA_Addon_Balthasar_Rangerbandits_Condition;
	information		= DIA_Addon_Balthasar_Rangerbandits_Info;
	description		= "你 看 到 任 何 强 盗 路 过 这 里 吗 ？。";
};

func int DIA_Addon_Balthasar_Rangerbandits_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Balthasar_HALLO))
	&& (
	(MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)
	|| (SC_KnowsLuciaCaughtByBandits == TRUE)
	))
	{
		return TRUE;
	};
};

func void DIA_Addon_Balthasar_Rangerbandits_Info()
{
	AI_Output(other, self, "DIA_Addon_Balthasar_Rangerbandits_15_00"); //你 看 到 任 何 强 盗 路 过 这 里 吗 ？
	AI_Output(self, other, "DIA_Addon_Balthasar_Rangerbandits_05_01"); //我 当 然 见 过 。 他 们 经 过 塞 柯 布 的 农 场 附 近 ， 然 后 进 入 了 北 边 的 树 林 。

	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)
	{
		AI_Output(self, other, "DIA_Addon_Balthasar_Rangerbandits_05_02"); //他 们 运 了 很 多 武 器 。 他 们 看 起 来 似 乎 已 经 做 好 在 与 兽 人 的 战 争 中 获 胜 的 准 备 了 。
	};

	if (SC_KnowsLuciaCaughtByBandits == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_Balthasar_Rangerbandits_05_03"); //如 果 我 的 眼 睛 没 有 花 的 话 ， 他 们 还 拉 着 一 名 年 青 女 子 一 起 进 了 树 林 。
		AI_Output(self, other, "DIA_Addon_Balthasar_Rangerbandits_05_04"); //我 真 的 希 望 他 们 能 放 过 她 。
	};

	B_GivePlayerXP(XP_Ambient);
	AI_Output(self, other, "DIA_Addon_Balthasar_Rangerbandits_05_05"); //我 很 高 兴 他 们 没 有 骚 扰 我 们 的 农 场 。
};

///////////////////////////////////////////////////////////////////////
//	Info aergermitnachbarn
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_AERGERMITNACHBARN(C_INFO)
{
	npc				= BAU_932_Balthasar;
	nr				= 5;
	condition		= DIA_Balthasar_AERGERMITNACHBARN_Condition;
	information		= DIA_Balthasar_AERGERMITNACHBARN_Info;
	description		= "你 的 邻 居 有 什 么 麻 烦 ？";
};

func int DIA_Balthasar_AERGERMITNACHBARN_Condition()
{
	if (
	(Npc_KnowsInfo(other, DIA_Balthasar_WASMACHSTDU))
	&& ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	&& (
	((Npc_IsDead(BalthasarSheep1)) == FALSE)
	|| ((Npc_IsDead(BalthasarSheep2)) == FALSE)
	|| ((Npc_IsDead(BalthasarSheep3)) == FALSE)
	)
	)
	{
		return TRUE;
	};
};

func void DIA_Balthasar_AERGERMITNACHBARN_Info()
{
	AI_Output(other, self, "DIA_Balthasar_AERGERMITNACHBARN_15_00"); //你 的 邻 居 有 什 么 麻 烦 ？
	AI_Output(self, other, "DIA_Balthasar_AERGERMITNACHBARN_05_01"); //在 这 一 大 片 原 野 上 ， 这 边 的 草 长 得 又 矮 又 干 。 所 以 我 经 常 到 其 它 农 场 的 大 牧 场 去 。
	AI_Output(self, other, "DIA_Balthasar_AERGERMITNACHBARN_05_02"); //地 主 并 不 介 意 ， 但 是 本 加 - 那 个 高 原 牧 场 上 的 农 场 主 ， 在 我 把 动 物 们 带 到 那 里 时 ， 总 是 小 题 大 作 。
	AI_Output(self, other, "DIA_Balthasar_AERGERMITNACHBARN_05_03"); //他 说 如 果 我 把 动 物 们 带 到 本 加 的 牧 场 上 ， 塞 柯 布 就 应 该 付 钱 。
	AI_Output(self, other, "DIA_Balthasar_AERGERMITNACHBARN_05_04"); //但 是 塞 柯 布 不 会 为 此 付 一 分 钱 的 ， 所 以 我 就 不 能 再 把 动 物 带 到 那 里 去 了 。
};

///////////////////////////////////////////////////////////////////////
//	Info woBengar
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_WOBENGAR(C_INFO)
{
	npc				= BAU_932_Balthasar;
	nr				= 10;
	condition		= DIA_Balthasar_WOBENGAR_Condition;
	information		= DIA_Balthasar_WOBENGAR_Info;
	description		= "我 在 哪 里 能 找 到 高 原 牧 场 和 本 加 的 农 场 ？";
};

func int DIA_Balthasar_WOBENGAR_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Balthasar_AERGERMITNACHBARN))
	&& ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_WOBENGAR_Info()
{
	AI_Output(other, self, "DIA_Balthasar_WOBENGAR_15_00"); //我 在 哪 里 能 找 到 高 原 牧 场 和 本 加 的 农 场 ？
	AI_Output(self, other, "DIA_Balthasar_WOBENGAR_05_01"); //沿 着 这 条 路 走 ， 并 穿 过 一 个 大 十 字 路 口 。
	AI_Output(self, other, "DIA_Balthasar_WOBENGAR_05_02"); //如 果 你 沿 着 右 边 走 ， 你 将 会 看 到 一 块 露 出 地 面 的 大 岩 石 。 从 那 后 面 向 右 走 ， 就 是 高 原 牧 场 和 关 卡 。
};

///////////////////////////////////////////////////////////////////////
//	Info talktoBengar
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_TALKTOBENGAR(C_INFO)
{
	npc				= BAU_932_Balthasar;
	nr				= 6;
	condition		= DIA_Balthasar_TALKTOBENGAR_Condition;
	information		= DIA_Balthasar_TALKTOBENGAR_Info;
	description		= "也 许 我 应 该 和 本 加 谈 谈 。";
};

func int DIA_Balthasar_TALKTOBENGAR_Condition()
{
	if (
	(Npc_KnowsInfo(other, DIA_Balthasar_AERGERMITNACHBARN))
	&& ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	&& (
	((Npc_IsDead(BalthasarSheep1)) == FALSE)
	|| ((Npc_IsDead(BalthasarSheep2)) == FALSE)
	|| ((Npc_IsDead(BalthasarSheep3)) == FALSE)
	)
	)
	{
		return TRUE;
	};
};

func void DIA_Balthasar_TALKTOBENGAR_Info()
{
	AI_Output(other, self, "DIA_Balthasar_TALKTOBENGAR_15_00"); //也 许 我 应 该 和 本 加 谈 谈 。
	AI_Output(self, other, "DIA_Balthasar_TALKTOBENGAR_05_01"); //我 要 帮 我 的 忙 ？ 那 你 打 算 怎 么 对 他 讲 ， 我 的 意 思 是 ， 我 不 想 惹 上 任 何 的 麻 烦 ， 你 听 到 了 吗 ？
	AI_Output(other, self, "DIA_Balthasar_TALKTOBENGAR_15_02"); //关 于 那 个 到 时 候 就 知 道 了 。

	Log_CreateTopic(TOPIC_BalthasarsSchafe, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BalthasarsSchafe, LOG_RUNNING);
	B_LogEntry(TOPIC_BalthasarsSchafe, TOPIC_BalthasarsSchafe_2);
	MIS_Balthasar_BengarsWeide = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info Bengarueberredet
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_BENGARUEBERREDET(C_INFO)
{
	npc				= BAU_932_Balthasar;
	nr				= 8;
	condition		= DIA_Balthasar_BENGARUEBERREDET_Condition;
	information		= DIA_Balthasar_BENGARUEBERREDET_Info;
	description		= "你 可 以 把 你 的 绵 羊 带 回 本 加 的 牧 场 了 。";
};

func int DIA_Balthasar_BENGARUEBERREDET_Condition()
{
	if (
	(Npc_KnowsInfo(other, DIA_Balthasar_TALKTOBENGAR))
	&& (MIS_Balthasar_BengarsWeide == LOG_SUCCESS)
	&& ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	&& (
	((Npc_IsDead(BalthasarSheep1)) == FALSE)
	|| ((Npc_IsDead(BalthasarSheep2)) == FALSE)
	|| ((Npc_IsDead(BalthasarSheep3)) == FALSE)
	)
	)
	{
		return TRUE;
	};
};

func void DIA_Balthasar_BENGARUEBERREDET_Info()
{
	AI_Output(other, self, "DIA_Balthasar_BENGARUEBERREDET_15_00"); //你 可 以 把 你 的 绵 羊 带 回 本 加 的 牧 场 了 。 我 已 经 同 他 讲 过 了 。
	AI_Output(self, other, "DIA_Balthasar_BENGARUEBERREDET_05_01"); //谢 谢 你 。 我 马 上 出 发 。
	AI_Output(self, other, "DIA_Balthasar_BENGARUEBERREDET_05_02"); //给 ， 拿 上 这 些 绵 羊 皮 ， 作 为 我 表 达 感 激 之 情 的 象 征 。

	B_GiveInvItems(self, other, ItAt_SheepFur, 10);

	AI_StopProcessInfos(self);

	Npc_ExchangeRoutine(self, "BengarsWeide");

	B_GivePlayerXP(XP_Balthasar_BengarsWeide);

	// Joly: "NW_BIGMILL_FARM3_BALTHASAR"

	Wld_InsertNpc(Sheep, "NW_BIGMILL_FARM3_BALTHASAR");
	Wld_InsertNpc(Sheep, "NW_BIGMILL_FARM3_BALTHASAR");
	Wld_InsertNpc(Hammel, "NW_BIGMILL_FARM3_BALTHASAR");

	BalthasarSheep1 = Hlp_GetNpc(Balthasar_Sheep1);

	if ((Hlp_IsValidNpc(BalthasarSheep1))
	&& (!Npc_IsDead(BalthasarSheep1)))
	{
		AI_StartState(BalthasarSheep1, ZS_MM_Rtn_Follow_Sheep_Balthasar, 1, "");
	};

	BalthasarSheep2 = Hlp_GetNpc(Balthasar_Sheep2);

	if ((Hlp_IsValidNpc(BalthasarSheep2))
	&& (!Npc_IsDead(BalthasarSheep2)))
	{
		AI_StartState(BalthasarSheep2, ZS_MM_Rtn_Follow_Sheep_Balthasar, 1, "");
	};

	BalthasarSheep3 = Hlp_GetNpc(Balthasar_Sheep3);

	if ((Hlp_IsValidNpc(BalthasarSheep3))
	&& (!Npc_IsDead(BalthasarSheep3)))
	{
		AI_StartState(BalthasarSheep3, ZS_MM_Rtn_Follow_Sheep_Balthasar, 1, "");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_PERMKAP1(C_INFO)
{
	npc				= BAU_932_Balthasar;
	nr				= 70;
	condition		= DIA_Balthasar_PERMKAP1_Condition;
	information		= DIA_Balthasar_PERMKAP1_Info;
	permanent		= TRUE;
	description		= "其 它 事 情 都 好 吗 ？";
};

func int DIA_Balthasar_PERMKAP1_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Balthasar_WASMACHSTDU))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_PERMKAP1_Info()
{
	AI_Output(other, self, "DIA_Balthasar_PERMKAP1_15_00"); //其 它 事 情 都 好 吗 ？

	Npc_PerceiveAll(self);
	if (
	(
	(Wld_DetectNpc(self, Balthasar_Sheep1, NOFUNC, -1) && (Npc_GetDistToNpc(self, other) < 2000))
	|| (Wld_DetectNpc(self, Balthasar_Sheep2, NOFUNC, -1) && (Npc_GetDistToNpc(self, other) < 2000))
	|| (Wld_DetectNpc(self, Balthasar_Sheep3, NOFUNC, -1) && (Npc_GetDistToNpc(self, other) < 2000))
	|| (Wld_DetectNpc(self, Sheep, NOFUNC, -1) && (Npc_GetDistToNpc(self, other) < 2000))
	|| (Wld_DetectNpc(self, Hammel, NOFUNC, -1) && (Npc_GetDistToNpc(self, other) < 2000))
	)
	)
	{
		AI_Output(self, hero, "DIA_Balthasar_PERMKAP1_05_01"); //我 不 能 抱 怨 。 谢 谢 你 垂 询 。
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, hero, "DIA_Balthasar_PERMKAP1_05_02"); //这 真 是 非 常 时 期 。 我 找 不 到 我 的 绵 羊 了 。
		if (Npc_IsDead(Sekob) == FALSE)
		{
			AI_Output(self, hero, "DIA_Balthasar_PERMKAP1_05_03"); //我 想 我 必 须 要 告 诉 塞 柯 布 。
		};

		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self, "Start"); // Joly: falls er auf der 2. Weide bei Bengar ist.
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Balthasar_PICKPOCKET(C_INFO)
{
	npc				= BAU_932_Balthasar;
	nr				= 900;
	condition		= DIA_Balthasar_PICKPOCKET_Condition;
	information		= DIA_Balthasar_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Balthasar_PICKPOCKET_Condition()
{
	C_Beklauen(10, 10);
};

func void DIA_Balthasar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Balthasar_PICKPOCKET);
	Info_AddChoice(DIA_Balthasar_PICKPOCKET, DIALOG_BACK, DIA_Balthasar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Balthasar_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Balthasar_PICKPOCKET_DoIt);
};

func void DIA_Balthasar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Balthasar_PICKPOCKET);
};

func void DIA_Balthasar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Balthasar_PICKPOCKET);
};
