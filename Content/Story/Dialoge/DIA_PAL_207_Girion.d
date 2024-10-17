///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Girion_EXIT(C_INFO)
{
	npc				= PAL_207_Girion;
	nr				= 999;
	condition		= DIA_Girion_EXIT_Condition;
	information		= DIA_Girion_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Girion_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Girion_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Girion_Hallo(C_INFO)
{
	npc				= PAL_207_Girion;
	nr				= 2;
	condition		= DIA_Girion_Hallo_Condition;
	information		= DIA_Girion_Hallo_Info;
	important		= TRUE;
};

func int DIA_Girion_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (MIS_ShipIsFree == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Girion_Hallo_Info()
{
	AI_Output(self, other, "DIA_Girion_Hallo_08_00"); //我 是 吉 里 昂 ， 双 手 武 器 教 练 ， 国 王 的 圣 骑 士 。 你 为 什 么 要 打 扰 我 ？
};

///////////////////////////////////////////////////////////////////////
//	Can You Teach Me?
///////////////////////////////////////////////////////////////////////
instance DIA_Girion_CanTeach(C_INFO)
{
	npc				= PAL_207_Girion;
	nr				= 5;
	condition		= DIA_Girion_CanTeach_Condition;
	information		= DIA_Girion_CanTeach_Info;
	permanent		= TRUE;
	description		= "你 能 训 练 我 吗 ？";
};

func int DIA_Girion_CanTeach_Condition()
{
	if (Girion_Teach2H == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Girion_CanTeach_Info()
{
	AI_Output(other, self, "DIA_Girion_CanTeach_15_00"); //你 能 训 练 我 吗 ？

	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_Girion_CanTeach_08_01"); //由 你 来 教 授 所 有 格 斗 技 能 中 最 高 贵 的 这 一 种 真 是 太 合 适 了 。 英 诺 斯 的 勇 士 就 应 该 是 这 样 的 。
		AI_Output(self, other, "DIA_Girion_CanTeach_08_02"); //我 会 指 导 你 的 。 准 备 好 了 就 来 向 我 报 告 。

		Girion_Teach2H = TRUE;
		B_LogEntry(TOPIC_CityTeacher, TOPIC_CityTeacher_9);
	}
	else
	{
		AI_Output(self, other, "DIA_Girion_CanTeach_08_03"); //如 果 你 想 学 什 么 东 西 ， 就 必 须 从 我 们 的 修 道 会 外 面 去 找 一 个 老 师 。
		AI_Output(self, other, "DIA_Girion_CanTeach_08_04"); //我 是 一 名 武 士 ， 不 是 老 师 。
	};
};

//**************************************
//			Ich will trainieren
//**************************************
instance DIA_Girion_Teach(C_INFO)
{
	npc				= PAL_207_Girion;
	nr				= 100;
	condition		= DIA_Girion_Teach_Condition;
	information		= DIA_Girion_Teach_Info;
	permanent		= TRUE;
	description		= "我 已 经 做 好 训 练 的 准 备 了 。";
};

// ----------------------------------
var int DIA_Girion_Teach_permanent;
// ----------------------------------
func int DIA_Girion_Teach_Condition()
{
	if ((Girion_Teach2H == TRUE)
	&& (DIA_Girion_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

// -------------------------------
var int girion_merk2h;
// -------------------------------
func void DIA_Girion_Teach_Info()
{
	girion_merk2h = other.HitChance[NPC_TALENT_2H];

	AI_Output(other, self, "DIA_Girion_Teach_15_00"); //我 已 经 准 备 好 接 受 训 练 了 。

	Info_ClearChoices(DIA_Girion_Teach);
	Info_AddChoice(DIA_Girion_Teach, DIALOG_BACK, DIA_Girion_Teach_Back);
	Info_AddChoice(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Girion_Teach_2H_1);
	Info_AddChoice(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Girion_Teach_2H_5);
};

func void DIA_Girion_Teach_Back()
{
	if (other.HitChance[NPC_TALENT_2H] >= 90)
	{
		AI_Output(self, other, "DIA_DIA_Girion_Teach_08_00"); //当 然 ， 你 的 训 练 还 没 有 结 束 ， 但 我 已 经 教 不 了 你 更 多 的 东 西 了 。
		AI_Output(self, other, "DIA_DIA_Girion_Teach_08_01"); //如 果 你 想 进 一 步 提 高 自 己 使 用 武 器 的 能 力 ， 就 必 须 要 找 到 一 位 真 正 的 剑 术 大 师 。
		AI_Output(other, self, "DIA_DIA_Girion_Teach_15_02"); //在 哪 里 能 找 到 这 样 的 人 ？
		AI_Output(self, other, "DIA_DIA_Girion_Teach_08_03"); //哈 根 勋 爵 就 是 一 个 剑 术 大 师 。 他 肯 定 会 指 导 你 的 。

		DIA_Girion_Teach_permanent = TRUE;
	};

	Info_ClearChoices(DIA_Girion_Teach);
};

func void DIA_Girion_Teach_2H_1()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_2H, 1, 90);

	if (other.HitChance[NPC_TALENT_2H] > girion_merk2h)
	{
		if (Girion_Labercount == 0)
		{
			AI_Output(self, other, "DIA_DIA_Girion_Teach_2H_1_08_00"); //为 荣 誉 而 战 。 战 斗 是 我 们 的 生 命 - 如 果 没 有 荣 誉 ， 生 命 是 什 么 ？
		};

		if (Girion_Labercount == 1)
		{
			AI_Output(self, other, "DIA_DIA_Girion_Teach_2H_1_08_01"); //在 战 斗 中 要 小 心 并 迅 速 。 使 对 手 感 到 出 其 不 意 。
		};

		if (Girion_Labercount == 2)
		{
			AI_Output(self, other, "DIA_DIA_Girion_Teach_2H_1_08_02"); //不 要 打 无 准 备 的 仗 。 你 永 远 不 会 知 道 这 是 不 是 最 后 一 仗 。
		};

		if (Girion_Labercount == 3)
		{
			AI_Output(self, other, "DIA_DIA_Girion_Teach_2H_1_08_03"); //一 名 圣 骑 士 时 刻 准 备 好 战 斗 。 但 他 从 不 会 发 起 一 场 不 能 取 胜 的 战 斗 。
		};

		Girion_Labercount = Girion_Labercount + 1;
		if (Girion_Labercount >= 3)
		{
			Girion_Labercount = 0;
		};
	};

	Info_ClearChoices(DIA_Girion_Teach);
	Info_AddChoice(DIA_Girion_Teach, DIALOG_BACK, DIA_Girion_Teach_Back);
	Info_AddChoice(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Girion_Teach_2H_1);
	Info_AddChoice(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Girion_Teach_2H_5);
};

func void DIA_Girion_Teach_2H_5()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_2H, 5, 90);

	if (other.HitChance[NPC_TALENT_2H] > girion_merk2h)
	{
		if (Girion_Labercount == 0)
		{
			AI_Output(self, other, "DIA_DIA_Girion_Teach_2H_5_08_00"); //一 名 圣 骑 士 不 仅 仅 是 用 剑 来 搏 斗 ， 还 要 用 他 的 脑 子 。
		};

		if (Girion_Labercount == 1)
		{
			AI_Output(self, other, "DIA_DIA_Girion_Teach_2H_5_08_01"); //你 必 须 知 道 要 点 取 决 于 你 能 够 安 全 撤 退 。
		};

		if (Girion_Labercount == 2)
		{
			AI_Output(self, other, "DIA_DIA_Girion_Teach_2H_5_08_02"); //记 住 ， 如 果 你 能 控 制 你 的 对 手 ， 并 且 不 给 他 机 会 让 他 自 控 的 话 ， 你 的 战 斗 技 巧 就 非 常 好 了 。
		};

		if (Girion_Labercount == 3)
		{
			AI_Output(self, other, "DIA_DIA_Girion_Teach_2H_5_08_03"); //当 你 放 弃 时 ， 你 只 有 失 败 。
		};

		Girion_Labercount = Girion_Labercount + 1;
		if (Girion_Labercount >= 3)
		{
			Girion_Labercount = 0;
		};
	};

	Info_ClearChoices(DIA_Girion_Teach);
	Info_AddChoice(DIA_Girion_Teach, DIALOG_BACK, DIA_Girion_Teach_Back);
	Info_AddChoice(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Girion_Teach_2H_1);
	Info_AddChoice(DIA_Girion_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Girion_Teach_2H_5);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 5
// ##
// ##
// #####################################################################

///////////////////////////////////////////////////////////////////////
//	Info CatchPlayerStolenShip
///////////////////////////////////////////////////////////////////////
instance DIA_Girion_CATCHPLAYERSTOLENSHIP(C_INFO)
{
	npc				= PAL_207_Girion;
	nr				= 5;
	condition		= DIA_Girion_CATCHPLAYERSTOLENSHIP_Condition;
	information		= DIA_Girion_CATCHPLAYERSTOLENSHIP_Info;
	important		= TRUE;
};

func int DIA_Girion_CATCHPLAYERSTOLENSHIP_Condition()
{
	if ((Kapitel >= 5)
	&& (MIS_ShipIsFree == TRUE)
	&& (Npc_GetDistToWP(self, "NW_CITY_WAY_TO_SHIP_25") < 1000)) // Joly: ist nur hier, wenn SC die Wachen überredet hat, ihm das Schiff zu geben.
	{
		return TRUE;
	};
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_Info()
{
	AI_Output(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_08_00"); //嘿 ！ 能 不 能 告 诉 我 你 在 这 里 干 什 么 ？

	Info_ClearChoices(DIA_Girion_CATCHPLAYERSTOLENSHIP);
	Info_AddChoice(DIA_Girion_CATCHPLAYERSTOLENSHIP, "我 不 知 道 你 在 说 什 么 。", DIA_Girion_CATCHPLAYERSTOLENSHIP_no);
	Info_AddChoice(DIA_Girion_CATCHPLAYERSTOLENSHIP, "别 挡 我 的 路 ， 不 然 我 就 杀 了 你 。", DIA_Girion_CATCHPLAYERSTOLENSHIP_weg);
	Info_AddChoice(DIA_Girion_CATCHPLAYERSTOLENSHIP, "我 需 要 船 。", DIA_Girion_CATCHPLAYERSTOLENSHIP_ship);
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_no()
{
	AI_Output(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_no_15_00"); //我 不 知 道 你 在 说 什 么 。
	AI_Output(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_01"); //我 在 谈 论 你 在 那 边 和 轮 船 守 卫 之 间 的 那 件 事 。 臭 名 昭 著 。

	if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_02"); //就 算 你 是 个 魔 法 师 ， 我 还 是 不 会 相 信 你 。
	};
};

var int Girion_WantstoKillSC;
func void DIA_Girion_CATCHPLAYERSTOLENSHIP_weg()
{
	AI_Output(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_15_00"); //别 挡 我 的 路 ， 不 然 我 就 杀 了 你 。
	AI_Output(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_01"); //你 也 许 可 以 骗 骗 那 个 船 只 守 卫 ， 但 你 会 发 现 我 是 个 很 难 对 付 的 人 ， 我 的 小 朋 友 。
	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_02"); //即 使 你 是 我 们 中 的 一 员 ， 那 也 并 不 意 味 着 你 可 以 偷 盗 国 王 的 财 物 。 去 死 吧 ， 该 死 的 叛 徒 。
	};

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
	Girion_WantstoKillSC = TRUE;
};

func void B_GirionStayOnShip()
{
	AI_Output(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_09"); //我 们 完 成 这 件 事 情 后 ， 你 就 把 这 艘 船 交 给 我 ， 明 白 吗 ？
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_ship()
{
	AI_Output(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_00"); //我 需 要 这 艘 船 。 所 以 我 会 接 手 它 。

	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_01"); //你 不 能 那 样 做 。 矿 石 的 运 输 … …
	}
	else
	{
		AI_Output(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_02"); //你 太 大 胆 了 ， 你 这 个 可 恶 的 混 蛋 … …
	};

	AI_Output(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_03"); //矿 藏 山 谷 的 矿 石 还 不 足 以 让 国 王 满 意 。 我 去 过 那 里 。 那 里 已 经 没 法 弄 到 更 多 的 东 西 了 。 哈 根 的 使 命 根 本 是 个 闹 剧 。
	AI_Output(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_04"); //威 胁 的 真 正 根 源 在 离 这 里 不 远 的 一 座 海 岛 上 。 我 将 会 驾 船 到 那 里 去 终 结 它 。
	AI_Output(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_05"); //要 么 你 加 入 我 ， 要 么 我 杀 死 你 。 你 自 己 选 择 。
	AI_Output(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_06"); //唔 。 听 起 来 我 好 象 没 得 选 择 。
	AI_Output(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_07"); //正 确 。
	AI_Output(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_08"); //那 好 吧 。 我 加 入 你 ， 但 有 一 个 条 件 。

	B_GirionStayOnShip();

	AI_Output(other, self, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_10"); //我 能 接 受 。
	AI_Output(self, other, "DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_11"); //那 就 做 你 必 须 做 的 事 吧 。 我 会 在 这 里 等 你 。

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Ship");
	crewmember_Count = (Crewmember_Count + 1);
	Girion_IsOnBoard = LOG_SUCCESS;
};

///////////////////////////////////////////////////////////////////////
//	Info Verrat
///////////////////////////////////////////////////////////////////////
instance DIA_Girion_Verrat(C_INFO)
{
	npc				= PAL_207_Girion;
	nr				= 2;
	condition		= DIA_Girion_Verrat_Condition;
	information		= DIA_Girion_Verrat_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Girion_Verrat_Condition()
{
	if (Girion_WantstoKillSC == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Girion_Verrat_Info()
{
	AI_Output(self, other, "DIA_Girion_Verrat_08_00"); //叛 徒 ！
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info OnShip
///////////////////////////////////////////////////////////////////////
instance DIA_Girion_OnShip(C_INFO)
{
	npc				= PAL_207_Girion;
	nr				= 2;
	condition		= DIA_Girion_OnShip_Condition;
	information		= DIA_Girion_OnShip_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Girion_OnShip_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (Girion_IsOnBoard == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Girion_OnShip_Info()
{
	B_GirionStayOnShip();
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Girion_PICKPOCKET(C_INFO)
{
	npc				= PAL_207_Girion;
	nr				= 900;
	condition		= DIA_Girion_PICKPOCKET_Condition;
	information		= DIA_Girion_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Girion_PICKPOCKET_Condition()
{
	C_Beklauen(73, 280);
};

func void DIA_Girion_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Girion_PICKPOCKET);
	Info_AddChoice(DIA_Girion_PICKPOCKET, DIALOG_BACK, DIA_Girion_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Girion_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Girion_PICKPOCKET_DoIt);
};

func void DIA_Girion_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Girion_PICKPOCKET);
};

func void DIA_Girion_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Girion_PICKPOCKET);
};
