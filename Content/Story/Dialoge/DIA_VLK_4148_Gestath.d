///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Gestath_EXIT(C_INFO)
{
	npc				= VLK_4148_Gestath;
	nr				= 999;
	condition		= DIA_Gestath_EXIT_Condition;
	information		= DIA_Gestath_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Gestath_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gestath_EXIT_Info()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);

	if (Hlp_IsItem(heroArmor, ITAR_DJG_Crawler) == TRUE)
	{
		AI_Output(self, other, "DIA_Gestath_EXIT_09_00"); //（ 冷 冰 冰 的 ） 不 错 的 盔 甲 ！
	};

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HALLO
///////////////////////////////////////////////////////////////////////
instance DIA_Gestath_HALLO(C_INFO)
{
	npc				= VLK_4148_Gestath;
	nr				= 3;
	condition		= DIA_Gestath_HALLO_Condition;
	information		= DIA_Gestath_HALLO_Info;
	description		= "有 什 么 新 鲜 事 吗 ？";
};

func int DIA_Gestath_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Gestath_HALLO_Info()
{
	AI_Output(other, self, "DIA_Gestath_HALLO_15_00"); //怎 么 样 了 ？
	AI_Output(self, other, "DIA_Gestath_HALLO_09_01"); //（ 冷 冰 冰 的 ） 你 真 勇 敢 ， 能 到 这 儿 来 。 你 迷 路 了 ， 是 吗 ？
	Gestath_TeachAnimalTrophy = TRUE;
	Info_ClearChoices(DIA_Gestath_HALLO);
	Info_AddChoice(DIA_Gestath_HALLO, "这 里 能 看 到 什 么 ？", DIA_Gestath_HALLO_waszusehen);
	Info_AddChoice(DIA_Gestath_HALLO, "你 在 这 里 做 什 么 ？", DIA_Gestath_HALLO_was);
};

func void DIA_Gestath_HALLO_plate()
{
	AI_Output(other, self, "DIA_Gestath_HALLO_plate_15_00"); //那 是 你 正 穿 着 的 盔 甲 。
	AI_Output(self, other, "DIA_Gestath_HALLO_plate_09_01"); //是 啊 。 很 难 得 。 它 是 用 矿 井 爬 行 者 的 鳞 片 做 成 的 。 一 个 叫 狼 的 家 伙 给 我 做 的 。
	AI_Output(self, other, "DIA_Gestath_HALLO_plate_09_02"); //我 曾 经 是 流 放 地 的 一 个 囚 犯 。 给 了 他 两 个 矿 井 爬 行 者 的 鳞 ， 几 天 后 那 个 东 西 就 做 成 了 。 那 个 家 伙 不 错 。

	Wolf_ProduceCrawlerArmor = TRUE;

	Info_AddChoice(DIA_Gestath_HALLO, DIALOG_BACK, DIA_Gestath_HALLO_Back);
	Info_AddChoice(DIA_Gestath_HALLO, "狼 现 在 在 哪 里 ？", DIA_Gestath_HALLO_plate_woWolf);
};

func void DIA_Gestath_HALLO_plate_woWolf()
{
	AI_Output(other, self, "DIA_Gestath_HALLO_plate_woWolf_15_00"); //狼 现 在 在 哪 里 ？
	AI_Output(self, other, "DIA_Gestath_HALLO_plate_woWolf_09_01"); //我 很 久 没 有 见 到 他 了 。 当 时 ， 他 是 一 个 流 放 地 的 雇 佣 兵 。
	AI_Output(self, other, "DIA_Gestath_HALLO_plate_woWolf_09_02"); //我 猜 他 仍 然 跟 那 些 小 子 在 到 处 闲 逛 。
};

func void DIA_Gestath_HALLO_was()
{
	AI_Output(other, self, "DIA_Gestath_HALLO_was_15_00"); //你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Gestath_HALLO_was_09_01"); //我 来 这 里 赚 钱 。
	AI_Output(other, self, "DIA_Gestath_HALLO_was_15_02"); //这 里 ， 在 不 知 道 是 什 么 地 方 的 中 间 ？
	AI_Output(self, other, "DIA_Gestath_HALLO_was_09_03"); //我 是 一 个 猎 人 。 我 专 门 解 决 一 些 棘 手 的 事 情 。
	AI_Output(self, other, "DIA_Gestath_HALLO_was_09_04"); //火 蜥 蜴 、 矿 井 爬 行 者 、 巨 暴 龙 … … 其 它 人 不 能 捕 猎 的 任 何 东 西 。 那 很 赚 钱 。

	Info_AddChoice(DIA_Gestath_HALLO, "那 是 你 正 穿 着 的 盔 甲 。", DIA_Gestath_HALLO_plate);
};

func void DIA_Gestath_HALLO_waszusehen()
{
	AI_Output(other, self, "DIA_Gestath_HALLO_waszusehen_15_00"); //这 里 能 看 到 什 么 ？
	AI_Output(self, other, "DIA_Gestath_HALLO_waszusehen_09_01"); //一 群 火 蜥 蜴 、 兽 人 和 我 不 认 识 的 什 么 东 西 。 在 那 片 高 地 上 不 远 的 地 方 。
	AI_Output(self, other, "DIA_Gestath_HALLO_waszusehen_09_02"); //我 奉 劝 你 别 那 么 干 。 上 面 的 那 些 东 西 可 不 太 友 好 。
};

func void DIA_Gestath_HALLO_Back()
{
	Info_ClearChoices(DIA_Gestath_HALLO);
};

///////////////////////////////////////////////////////////////////////
//	Info Drachen
///////////////////////////////////////////////////////////////////////
instance DIA_Gestath_Drachen(C_INFO)
{
	npc				= VLK_4148_Gestath;
	nr				= 3;
	condition		= DIA_Gestath_Drachen_Condition;
	information		= DIA_Gestath_Drachen_Info;
	permanent		= TRUE;
	description		= "你 也 能 解 剖 龙 吗 ？";
};

var int Gestath_DragonTrophy;

func int DIA_Gestath_Drachen_Condition()
{
	if ((Gestath_DragonTrophy == FALSE)
	&& (Gestath_TeachAnimalTrophy == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Gestath_Drachen_Info()
{
	AI_Output(other, self, "DIA_Gestath_Drachen_15_00"); //你 也 能 解 剖 龙 吗 ？
	if (Kapitel < 4)
	{
		AI_Output(self, other, "DIA_Gestath_Drachen_09_01"); //（ 大 笑 ） 以 后 再 问 我 ， 当 你 准 备 好 对 付 那 样 的 东 西 ， 行 吗 ？
	}
	else
	{
		AI_Output(self, other, "DIA_Gestath_Drachen_09_02"); //当 然 。 为 什 么 不 呢 ？
		Gestath_DragonTrophy = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TeachHunting
///////////////////////////////////////////////////////////////////////
instance DIA_Gestath_TEACHHUNTING(C_INFO)
{
	npc				= VLK_4148_Gestath;
	nr				= 12;
	condition		= DIA_Gestath_TEACHHUNTING_Condition;
	information		= DIA_Gestath_TEACHHUNTING_Info;
	permanent		= TRUE;
	description		= "教 我 如 何 解 剖 动 物 。";
};

func int DIA_Gestath_TEACHHUNTING_Condition()
{
	if (Gestath_TeachAnimalTrophy == TRUE)
	{
		return TRUE;
	};
};

var int DIA_Gestath_TEACHHUNTING_OneTime;
func void DIA_Gestath_TEACHHUNTING_Info()
{
	AI_Output(other, self, "DIA_Gestath_TEACHHUNTING_15_00"); //教 我 如 何 解 剖 动 物 。
	if (
	(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_FireTongue] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_CrawlerPlate] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DrgSnapperHorn] == FALSE)
	|| (
	(Gestath_DragonTrophy == TRUE)
	&& (
	(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonScale] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonBlood] == FALSE)
	)
	)
	)
	{
		if (DIA_Gestath_TEACHHUNTING_OneTime == FALSE)
		{
			AI_Output(self, other, "DIA_Gestath_TEACHHUNTING_09_01"); //为 什 么 不 呢 ？ 现 在 我 已 经 拥 有 足 够 的 了 。
			DIA_Gestath_TEACHHUNTING_OneTime = TRUE;
		}
		else
		{
			AI_Output(self, other, "DIA_Gestath_TEACHHUNTING_09_02"); //你 想 知 道 什 么 ？
		};

		Info_AddChoice(DIA_Gestath_TEACHHUNTING, DIALOG_BACK, DIA_Gestath_TEACHHUNTING_BACK);

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_FireTongue] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_TEACHHUNTING, B_BuildLearnString(NAME_LEARN_FIRE_TONGUE, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_FireTongue)), DIA_Gestath_TEACHHUNTING_FireTongue);
		};

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_CrawlerPlate] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_TEACHHUNTING, B_BuildLearnString(NAME_LEARN_CRAWLER_PLATES, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_CrawlerPlate)), DIA_Gestath_TEACHHUNTING_CrawlerPlate);
		};

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_TEACHHUNTING, B_BuildLearnString(NAME_LEARN_MANDIBLES, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Mandibles)), DIA_Gestath_TEACHHUNTING_Mandibles);
		};

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DrgSnapperHorn] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_TEACHHUNTING, B_BuildLearnString(NAME_LEARN_DRAGON_SNAPPER_HORN, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DrgSnapperHorn)), DIA_Gestath_TEACHHUNTING_DrgSnapperHorn);
		};

		if (Gestath_DragonTrophy == TRUE)
		{
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonScale] == FALSE)
			{
				Info_AddChoice(DIA_Gestath_TEACHHUNTING, B_BuildLearnString(NAME_LEARN_DRAGON_SCALES, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DragonScale)), DIA_Gestath_TEACHHUNTING_DragonScale);
			};

			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonBlood] == FALSE)
			{
				Info_AddChoice(DIA_Gestath_TEACHHUNTING, B_BuildLearnString(NAME_LEARN_DRAGON_BLOOD, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DragonBlood)), DIA_Gestath_TEACHHUNTING_DragonBlood);
			};
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Gestath_TEACHHUNTING_09_03"); //现 在 ， 我 不 知 道 我 还 可 以 教 你 些 什 么 。
	};
};

func void DIA_Gestath_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_FireTongue()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_FireTongue))
	{
		AI_Output(self, other, "DIA_Gestath_TEACHHUNTING_FireTongue_09_00"); //你 一 只 手 抓 住 它 ， 一 刀 从 一 个 火 蜥 蜴 的 嘴 里 割 下 它 的 舌 头 。
	};

	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_CrawlerPlate()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_CrawlerPlate))
	{
		AI_Output(self, other, "DIA_Gestath_TEACHHUNTING_CrawlerPlate_09_00"); //你 必 须 用 一 把 坚 固 的 刀 才 能 从 爬 行 者 背 上 剥 下 那 些 畜 生 的 鳞 。
	};

	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_Mandibles()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_Mandibles))
	{
		AI_Output(self, other, "DIA_Gestath_TEACHHUNTING_Mandibles_09_00"); //旷 野 袭 击 者 或 是 矿 井 爬 行 者 的 下 颚 骨 深 深 地 嵌 在 头 骨 里 面 。 必 须 费 些 力 气 才 能 把 它 们 撬 出 来 。
	};

	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DrgSnapperHorn()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_DrgSnapperHorn))
	{
		AI_Output(self, other, "DIA_Gestath_TEACHHUNTING_DrgSnapperHorn_09_00"); //要 把 巨 暴 龙 的 角 从 头 骨 中 分 离 出 来 的 话 ， 最 好 的 位 置 是 它 的 额 头 顶 部 。 用 一 把 坚 固 的 刀 。
	};

	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DragonScale()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_DragonScale))
	{
		AI_Output(self, other, "DIA_Gestath_TEACHHUNTING_DragonScale_09_00"); //龙 鳞 确 实 很 坚 固 ， 但 当 你 觉 得 没 有 地 方 下 手 的 时 候 ， 你 会 发 现 龙 背 是 个 好 位 置 。
	};

	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DragonBlood()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_DragonBlood))
	{
		AI_Output(self, other, "DIA_Gestath_TEACHHUNTING_DragonBlood_09_00"); //收 集 血 液 最 好 的 位 置 是 它 的 下 腹 部 。 找 一 个 柔 软 的 部 位 ， 把 一 把 锋 利 的 刀 插 进 去 。
	};

	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Gestath_PICKPOCKET(C_INFO)
{
	npc				= VLK_4148_Gestath;
	nr				= 900;
	condition		= DIA_Gestath_PICKPOCKET_Condition;
	information		= DIA_Gestath_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_100;
};

func int DIA_Gestath_PICKPOCKET_Condition()
{
	C_Beklauen(81, 350);
};

func void DIA_Gestath_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gestath_PICKPOCKET);
	Info_AddChoice(DIA_Gestath_PICKPOCKET, DIALOG_BACK, DIA_Gestath_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gestath_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Gestath_PICKPOCKET_DoIt);
};

func void DIA_Gestath_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Gestath_PICKPOCKET);
};

func void DIA_Gestath_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gestath_PICKPOCKET);
};
