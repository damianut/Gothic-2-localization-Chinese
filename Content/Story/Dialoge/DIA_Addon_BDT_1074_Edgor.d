var int Edgor_Exiteinmal;
instance DIA_Addon_Edgor_EXIT(C_INFO)
{
	npc				= BDT_1074_Addon_Edgor;
	nr				= 999;
	condition		= DIA_Addon_Edgor_EXIT_Condition;
	information		= DIA_Addon_Edgor_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Edgor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Edgor_EXIT_Info()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Edgor_MIS2)
	&& (Edgor_Exiteinmal == FALSE))
	{
		AI_Output(self, other, "DIA_Addon_Edgor_EXIT_06_00"); //认 识 你 很 好 … …
		Edgor_Exiteinmal = TRUE;
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Edgor_PICKPOCKET(C_INFO)
{
	npc				= BDT_1074_Addon_Edgor;
	nr				= 900;
	condition		= DIA_Addon_Edgor_PICKPOCKET_Condition;
	information		= DIA_Addon_Edgor_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Addon_Edgor_PICKPOCKET_Condition()
{
	C_Beklauen(10, 7);
};

func void DIA_Addon_Edgor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Edgor_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Edgor_PICKPOCKET, DIALOG_BACK, DIA_Addon_Edgor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Edgor_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Edgor_PICKPOCKET_DoIt);
};

func void DIA_Addon_Edgor_PICKPOCKET_DoIt()
{
	B_Beklauen();
	B_Say(self, self, "$AWAKE");
	Info_ClearChoices(DIA_Addon_Edgor_PICKPOCKET);
};

func void DIA_Addon_Edgor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Edgor_PICKPOCKET);
};

// ---------------------------------------------------------------------
//	Info Hi
// ----------------------------------------------------------------------
instance DIA_Addon_Edgor_Hi(C_INFO)
{
	npc				= BDT_1074_Addon_Edgor;
	nr				= 2;
	condition		= DIA_Addon_Edgor_Hi_Condition;
	information		= DIA_Addon_Edgor_Hi_Info;
	description		= "怎 么 样 了 ？";
};

func int DIA_Addon_Edgor_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Edgor_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_Edgor_Hi_15_00"); //怎 么 样 了 ？
	AI_Output(self, other, "DIA_Addon_Edgor_Hi_06_01"); //你 想 要 知 道 什 么 ？ 我 会 告 诉 你 我 知 道 的 一 切 。
	AI_Output(self, other, "DIA_Addon_Edgor_Hi_06_02"); //首 先 一 些 海 盗 在 一 个 风 暴 交 加 的 夜 晚 把 我 带 到 这 里 。 老 兄 ， 在 那 个 破 船 里 我 一 直 都 在 吐 。
	AI_Output(self, other, "DIA_Addon_Edgor_Hi_06_03"); //然 后 瑞 雯 把 矿 井 封 闭 起 来 ， 因 为 有 些 白 痴 太 痴 狂 于 那 些 黄 金 了 。
	AI_Output(self, other, "DIA_Addon_Edgor_Hi_06_04"); //然 后 佛 朗 哥 成 为 了 猎 人 的 首 领 ， 杀 掉 任 何 反 对 他 的 人 。
	AI_Output(self, other, "DIA_Addon_Edgor_Hi_06_05"); //我 要 说 ， 那 真 是 相 当 糟 糕 。

	if (SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry(TOPIC_Addon_RavenKDW, LogText_Addon_RavensGoldmine);
		Log_AddEntry(TOPIC_Addon_Sklaven, LogText_Addon_RavensGoldmine);
		Log_AddEntry(TOPIC_Addon_ScoutBandits, Log_Text_Addon_ScoutBandits);
	};

	SC_KnowsRavensGoldmine = TRUE;
};

// ---------------------------------------------------------------------
//	Franco
// ---------------------------------------------------------------------
instance DIA_Addon_Edgor_Franco(C_INFO)
{
	npc				= BDT_1074_Addon_Edgor;
	nr				= 2;
	condition		= DIA_Addon_Edgor_Franco_Condition;
	information		= DIA_Addon_Edgor_Franco_Info;
	description		= "佛 朗 哥 是 怎 么 成 为 首 领 的 ？";
};

func int DIA_Addon_Edgor_Franco_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Edgor_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Edgor_Franco_Info()
{
	AI_Output(other, self, "DIA_Addon_Edgor_Franco_15_00"); //佛 朗 哥 是 怎 么 成 为 首 领 的 ？
	AI_Output(self, other, "DIA_Addon_Edgor_Franco_06_01"); //非 常 简 单 ， 他 杀 死 了 弗 莱 彻 。 他 以 前 是 猎 人 们 的 首 领 。
	AI_Output(self, other, "DIA_Addon_Edgor_Franco_06_02"); //弗 莱 彻 还 好 些 。 佛 朗 哥 只 是 不 断 地 使 唤 我 们 。
};

// ---------------------------------------------------------------------
//	Info MIS2
// ---------------------------------------------------------------------
instance DIA_Addon_Edgor_MIS2(C_INFO)
{
	npc				= BDT_1074_Addon_Edgor;
	nr				= 4;
	condition		= DIA_Addon_Edgor_MIS2_Condition;
	information		= DIA_Addon_Edgor_MIS2_Info;
	description		= "佛 朗 哥 派 我 来 处 理 这 块 石 片 … …";
};

func int DIA_Addon_Edgor_MIS2_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Edgor_Hi)
	&& (MIS_HlpEdgor == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Edgor_MIS2_Info()
{
	AI_Output(other, self, "DIA_Addon_Edgor_MIS2_15_00"); //佛 朗 哥 派 我 来 这 里 是 为 了 那 个 石 片 。 你 找 到 它 了 吗 ？
	AI_Output(self, other, "DIA_Addon_Edgor_MIS2_06_01"); //老 兄 ， 我 还 没 有 找 到 它 。 我 所 知 道 的 就 是 它 可 能 在 沼 泽 深 处 这 座 古 老 的 建 筑 里 。
	AI_Output(self, other, "DIA_Addon_Edgor_MIS2_06_02"); //而 我 内 心 深 处 有 个 声 音 告 诉 我 ， ‘ 艾 德 高 ， 不 要 靠 近 沼 泽 深 处 那 座 古 老 的 建 筑 物 。 ’
	AI_Output(self, other, "DIA_Addon_Edgor_MIS2_06_03"); //我 当 然 不 会 为 了 那 个 笨 蛋 佛 朗 哥 去 冒 险 ！

	B_LogEntry(Topic_Addon_Stoneplate, Topic_Addon_Stoneplate_2);
};

// ---------------------------------------------------------------------
//	Info Wegbeschreibung
// ---------------------------------------------------------------------
instance DIA_Addon_Edgor_Weg(C_INFO)
{
	npc				= BDT_1074_Addon_Edgor;
	nr				= 4;
	condition		= DIA_Addon_Edgor_Weg_Condition;
	information		= DIA_Addon_Edgor_Weg_Info;
	description		= "这 座 旧 建 筑 指 的 究 竟 是 什 么 ？";
};

func int DIA_Addon_Edgor_Weg_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Edgor_MIS2))
	{
		return TRUE;
	};
};

func void DIA_Addon_Edgor_Weg_Info()
{
	AI_Output(other, self, "DIA_Addon_Edgor_Weg_15_00"); //这 座 旧 建 筑 指 的 究 竟 是 什 么 ？
	AI_Output(self, other, "DIA_Addon_Edgor_Weg_06_01"); //从 这 里 的 那 块 大 岩 石 左 边 走 。 一 会 后 ， 你 就 来 到 了 另 外 一 块 大 岩 石 旁 。
	AI_Output(self, other, "DIA_Addon_Edgor_Weg_06_02"); //你 可 以 从 左 边 或 者 右 边 绕 过 那 块 岩 石 - 我 就 不 太 清 楚 了 ， 那 是 很 久 以 前 的 事 了 。
	AI_Output(self, other, "DIA_Addon_Edgor_Weg_06_03"); //但 是 那 废 墟 应 该 是 在 某 个 高 地 上 。 不 过 它 可 能 藏 在 树 后 面 。
	AI_Output(self, other, "DIA_Addon_Edgor_Weg_06_04"); //也 许 你 够 幸 运 的 话 ， 就 不 会 发 现 … …
};

// ---------------------------------------------------------------------
//	Info Found
// ---------------------------------------------------------------------
instance DIA_Addon_Edgor_Found(C_INFO)
{
	npc				= BDT_1074_Addon_Edgor;
	nr				= 4;
	condition		= DIA_Addon_Edgor_Found_Condition;
	information		= DIA_Addon_Edgor_Found_Info;
	description		= "我 找 到 了 石 片 ！";
};

func int DIA_Addon_Edgor_Found_Condition()
{
	if ((Npc_HasItems(other, ItMi_Addon_Stone_04) >= 1)
	&& !Npc_IsDead(Franco)
	&& (MIS_HlpEdgor == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Edgor_Found_Info()
{
	AI_Output(other, self, "DIA_Addon_Edgor_Found_15_00"); //我 找 到 了 石 片 ！
	AI_Output(self, other, "DIA_Addon_Edgor_Found_06_01"); //（ 无 聊 的 ） 真 的 吗 ？ 你 一 定 是 个 勇 敢 的 家 伙。
	AI_Output(self, other, "DIA_Addon_Edgor_Found_06_02"); //（ 无 聊 的 ） 那 你 一 定 非 常 想 要 进 营 地 。 （ 打 哈 欠 ）
};

// ---------------------------------------------------------------------
//	Info Teach
// ---------------------------------------------------------------------
instance DIA_Addon_Edgor_Teach(C_INFO)
{
	npc				= BDT_1074_Addon_Edgor;
	nr				= 9;
	condition		= DIA_Addon_Edgor_Teach_Condition;
	information		= DIA_Addon_Edgor_Teach_Info;
	description		= "你 能 教 我 一 些 东 西 吗 ？";
};

func int DIA_Addon_Edgor_Teach_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Edgor_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Edgor_Teach_Info()
{
	AI_Output(other, self, "DIA_Addon_Edgor_Teach_15_00"); //你 能 教 我 一 些 东 西 吗 ？
	AI_Output(self, other, "DIA_Addon_Edgor_Teach_06_01"); //我 非 常 了 解 血 蝇 。 我 憎 恨 那 些 可 恶 的 生 物 ， 甚 至 要 超 过 我 对 佛 朗 哥 的 憎 恨 ！
	AI_Output(self, other, "DIA_Addon_Edgor_Teach_06_02"); //但 是 我 知 道 如 何 把 他 们 的 刺 和 翅 膀 从 它 们 的 尸 体 上 撕 下 来 。 （ 疯 狂 的 ） 是 的 ， 把 它 们 撕 碎 … …
	AI_Output(self, other, "DIA_Addon_Edgor_Teach_06_03"); //除 了 那 些 以 外 ， 我 还 知 道 如 何 从 刺 中 提 取 分 泌 物 。
	AI_Output(self, other, "DIA_Addon_Edgor_Teach_06_04"); //如 果 你 想 要 学 的 话 ， 我 可 以 把 那 些 乱 七 八 糟 的 东 西 都 教 给 你 。
	AI_Output(self, other, "DIA_Addon_Edgor_Teach_06_05"); //当 然 ， 这 里 没 有 什 么 东 西 是 免 费 的 … …

	Log_CreateTopic(Topic_Addon_BDT_Teacher, LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Teacher, Topic_Addon_BDT_Teacher_4);
	Edgor_Teach = TRUE;
};

func void B_Edgor_NotEnoughGold()
{
	AI_Output(self, other, "DIA_Addon_Edgor_NotEnoughGold_06_00"); //给 我 钱 。 我 只 要 金 币 ， 不 要 金 块 。
};

// ---------------------------------------------------------------------
//	Info Train (Bloodflys)
// ---------------------------------------------------------------------
instance DIA_Addon_Edgor_TrainStart(C_INFO)
{
	npc				= BDT_1074_Addon_Edgor;
	nr				= 9;
	condition		= DIA_Addon_Edgor_Start_Condition;
	information		= DIA_Addon_Edgor_Start_Info;
	permanent		= TRUE;
	description		= "关 于 血 蝇 … …";
};

func int DIA_Addon_Edgor_Start_Condition()
{
	if (Edgor_Teach == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Edgor_Start_Info()
{
	AI_Output(other, self, "DIA_Addon_Edgor_TrainStart_SEKRET_15_00"); //关 于 血 蝇 … …
	AI_Output(self, other, "DIA_Addon_Edgor_TrainStart_SEKRET_06_01"); //你 想 知 道 什 么 ？

	Info_ClearChoices(DIA_Addon_Edgor_TrainStart);
	Info_AddChoice(DIA_Addon_Edgor_TrainStart, DIALOG_BACK, DIA_Addon_Edgor_TrainStart_BACK);

	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Edgor_TrainStart, "拔 出 血 蝇 刺 （ 花 费 ： ５ Ｌ Ｐ ， １ ０ ０ 金 币 ）", DIA_Addon_Edgor_TrainStart_Sting);
	};

	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Edgor_TrainStart, "拔 掉 血 蝇 翅 膀 （ 花 费 ： ５ Ｌ Ｐ ， １ ０ ０ 金 币 ）", DIA_Addon_Edgor_TrainStart_Wing);
	};

	if (Knows_Bloodfly == FALSE)
	{
		Info_AddChoice(DIA_Addon_Edgor_TrainStart, "从 刺 里 提 取 分 泌 物 （ 花 费 ： １ Ｌ Ｐ ， １ ０ ０ 金 币 ）", DIA_Addon_Edgor_TrainStart_GIFT);
	};
};

func void DIA_Addon_Edgor_TrainStart_BACK()
{
	Info_ClearChoices(DIA_Addon_Edgor_TrainStart);
};

func void DIA_Addon_Edgor_TrainStart_Sting()
{
	if (B_GiveInvItems(other, self, ItmI_Gold, 100))
	{
		if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_BFSting))
		{
			AI_Output(other, self, "DIA_Addon_Edgor_TrainStart_Sting_15_00"); //我 怎 么 把 血 蝇 的 刺 取 下 来 ？
			AI_Output(self, other, "DIA_Addon_Edgor_TrainStart_Sting_06_01"); //把 那 种 野 兽 的 尸 体 腹 部 向 上 翻 过 来 ， 然 后 十 字 切 开 。 抓 起 内 脏 ， 然 后 从 后 面 剪 断 所 有 的 组 织 。
			AI_Output(self, other, "DIA_Addon_Edgor_TrainStart_Sting_06_02"); //然 后 你 一 拉 就 能 把 刺 取 下 来 。
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};

	Info_ClearChoices(DIA_Addon_Edgor_TrainStart);
};

func void DIA_Addon_Edgor_TrainStart_Wing()
{
	if (B_GiveInvItems(other, self, ItmI_Gold, 100))
	{
		if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_BFWing))
		{
			AI_Output(other, self, "DIA_Addon_Edgor_TrainStart_Wing_15_00"); //我 要 怎 么 取 得 翅 膀 ？
			AI_Output(self, other, "DIA_Addon_Edgor_TrainStart_Wing_06_01"); //一 只 手 抓 住 翅 膀 。 另 一 只 手 沿 着 靠 近 皮 肤 的 那 一 层 把 它 们 切 断 。
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};

	Info_ClearChoices(DIA_Addon_Edgor_TrainStart);
};

func void DIA_Addon_Edgor_TrainStart_GIFT()
{
	if (B_GiveInvItems(other, self, ItmI_Gold, 100))
	{
		if (other.lp >= 1)
		{
			AI_Output(other, self, "DIA_Addon_Edgor_TrainStart_GIFT_15_00"); //我 怎 么 把 血 蝇 的 分 泌 物 取 出 来 ？
			AI_Output(self, other, "DIA_Addon_Edgor_TrainStart_GIFT_06_01"); //竖 着 把 刺 的 上 半 部 分 切 开 - 然 后 那 种 有 治 疗 效 果 的 分 泌 物 就 会 流 出 来 。
			AI_Output(self, other, "DIA_Addon_Edgor_TrainStart_GIFT_06_02"); //那 样 可 以 安 全 地 把 一 根 刺 吸 干 - 或 者 用 它 制 作 某 些 药 剂 。

			other.lp = (other.lp - 1);
			Knows_Bloodfly = TRUE;
			PrintScreen(PRINT_ADDON_KNOWSBF, -1, -1, FONT_Screen, 2);
		}
		else
		{
			PrintScreen(PRINT_NotEnoughLP, -1, -1, FONT_Screen, 2);
			B_Say(self, other, "$NOLEARNNOPOINTS");
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};

	Info_ClearChoices(DIA_Addon_Edgor_TrainStart);
};
