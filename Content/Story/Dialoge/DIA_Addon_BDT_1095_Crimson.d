// ---------------------------------------------------------------------
//	Info EXIT
// ---------------------------------------------------------------------
instance DIA_Addon_Crimson_EXIT(C_INFO)
{
	npc				= BDT_1095_Addon_Crimson;
	nr				= 999;
	condition		= DIA_Addon_Crimson_EXIT_Condition;
	information		= DIA_Addon_Crimson_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Crimson_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Crimson_EXIT_Info()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Crimson_PICKPOCKET(C_INFO)
{
	npc				= BDT_1095_Addon_Crimson;
	nr				= 900;
	condition		= DIA_Addon_Crimson_PICKPOCKET_Condition;
	information		= DIA_Addon_Crimson_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Addon_Crimson_PICKPOCKET_Condition()
{
	C_Beklauen(66, 66);
};

func void DIA_Addon_Crimson_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Crimson_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Crimson_PICKPOCKET, DIALOG_BACK, DIA_Addon_Crimson_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Crimson_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Crimson_PICKPOCKET_DoIt);
};

func void DIA_Addon_Crimson_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Crimson_PICKPOCKET);
};

func void DIA_Addon_Crimson_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Crimson_PICKPOCKET);
};

// ---------------------------------------------------------------------
//	Info Hi
// ---------------------------------------------------------------------
instance DIA_Addon_Crimson_Hi(C_INFO)
{
	npc				= BDT_1095_Addon_Crimson;
	nr				= 2;
	condition		= DIA_Addon_Crimson_Hi_Condition;
	information		= DIA_Addon_Crimson_Hi_Info;
	description		= "你 在 做 什 么 ？ 你 要 把 你 的 金 子 熔 化 掉 ？";
};

func int DIA_Addon_Crimson_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Crimson_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_Crimson_Hi_15_00"); //你 在 做 什 么 ？ 你 要 把 你 的 金 子 熔 化 掉 ？
	AI_Output(self, other, "DIA_Addon_Crimson_Hi_10_01"); //不 ， 我 在 洗 蔬 菜 。 当 然 ， 我 在 熔 化 黄 金 - 我 还 用 它 铸 金 币 。
	AI_Output(self, other, "DIA_Addon_Crimson_Hi_10_02"); //因 为 ， 那 就 想 象 一 下 ： 一 个 美 好 的 夜 晚 ， 瑞 雯 出 现 了 ， 并 把 一 个 金 币 模 子 放 进 我 手 里 。
	AI_Output(self, other, "DIA_Addon_Crimson_Hi_10_03"); //用 一 个 小 金 块 ， 我 能 铸 造 一 大 堆 的 金 币 … … 我 是 最 棒 的 ， 没 人 能 看 出 不 同 ！
};

// ---------------------------------------------------------------------
//	Info How
// ---------------------------------------------------------------------
instance DIA_Addon_Crimson_How(C_INFO)
{
	npc				= BDT_1095_Addon_Crimson;
	nr				= 2;
	condition		= DIA_Addon_Crimson_How_Condition;
	information		= DIA_Addon_Crimson_How_Info;
	description		= "每 个 金 块 你 愿 意 付 给 我 多 少 钱 ？";
};

func int DIA_Addon_Crimson_How_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Crimson_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Crimson_How_Info()
{
	AI_Output(other, self, "DIA_Addon_Crimson_How_15_00"); //每 个 金 块 你 愿 意 付 给 我 多 少 钱 ？
	AI_Output(self, other, "DIA_Addon_Crimson_How_10_01"); //嗯 ， 我 根 本 不 认 识 你 ， 但 是 我 可 以 给 你 特 价 。 用 一 小 块 金 块 ， 我 可 以 给 你 … …
	B_Say_Gold(self, other, 10);
};

// ---------------------------------------------------------------------
//	Info Feilsch
// ---------------------------------------------------------------------
instance DIA_Addon_Crimson_Feilsch(C_INFO)
{
	npc				= BDT_1095_Addon_Crimson;
	nr				= 2;
	condition		= DIA_Addon_Crimson_Feilsch_Condition;
	information		= DIA_Addon_Crimson_Feilsch_Info;
	description		= "我 们 还 一 下 价 ！ ";
};

func int DIA_Addon_Crimson_Feilsch_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Crimson_How))
	{
		return TRUE;
	};
};

func void DIA_Addon_Crimson_Feilsch_Info()
{
	AI_Output(other, self, "DIA_Addon_Crimson_Feilsch_15_00"); //我 们 还 一 下 价 ！
	AI_Output(self, other, "DIA_Addon_Crimson_Feilsch_10_01"); //嗯 … … 不 。 那 是 和 所 有 人 都 一 样 的 标 准 价 格 。
	AI_Output(other, self, "DIA_Addon_Crimson_Feilsch_15_02"); //我 以 为 那 是 特 价 。
	AI_Output(self, other, "DIA_Addon_Crimson_Feilsch_10_03"); //当 然 是 。 这 里 的 每 个 人 对 我 来 说 都 很 特 别 。
};

// ---------------------------------------------------------------------
//	Info Gold tauschen
// ---------------------------------------------------------------------
instance DIA_Addon_Crimson_Gold(C_INFO)
{
	npc				= BDT_1095_Addon_Crimson;
	nr				= 99;
	condition		= DIA_Addon_Crimson_Gold_Condition;
	information		= DIA_Addon_Crimson_Gold_Info;
	permanent		= TRUE;
	description		= "交 易 金 块 … …";
};

func int DIA_Addon_Crimson_Gold_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Crimson_How))
	{
		return TRUE;
	};
};

func void DIA_Addon_Crimson_Gold_Info()
{
	AI_Output(other, self, "DIA_Addon_Crimson_Gold_15_00"); //我 们 交 易 吧 … …

	Info_ClearChoices(DIA_Addon_Crimson_Gold);
	Info_AddChoice(DIA_Addon_Crimson_Gold, DIALOG_BACK, DIA_Addon_Crimson_Gold_BACK);

	if (Npc_HasItems(other, ItMi_GoldNugget_Addon) >= 1)
	{
		Info_AddChoice(DIA_Addon_Crimson_Gold, "交 易 所 有 金 块", DIA_Addon_Crimson_Gold_ALLE);
		Info_AddChoice(DIA_Addon_Crimson_Gold, "交 易 １ 个 金 块", DIA_Addon_Crimson_Gold_1);
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Crimson_Gold_10_01"); //但 是 你 身 上 没 有 一 个 金 块 。
	};
};

func void DIA_Addon_Crimson_Gold_BACK()
{
	Info_ClearChoices(DIA_Addon_Crimson_Gold);
};

func void DIA_Addon_Crimson_Gold_ALLE()
{
	var int CurrentNuggets;
	CurrentNuggets = Npc_HasItems(other, ItMi_GoldNugget_Addon);

	B_GiveInvItems(other, self, ItMi_GoldNugget_Addon, CurrentNuggets);
	B_GiveInvItems(self, other, ItMI_Gold,(CurrentNuggets * 10));

	Info_ClearChoices(DIA_Addon_Crimson_Gold);
	Info_AddChoice(DIA_Addon_Crimson_Gold, DIALOG_BACK, DIA_Addon_Crimson_Gold_BACK);

	if (Npc_HasItems(other, ItMi_GoldNugget_Addon) >= 1)
	{
		Info_AddChoice(DIA_Addon_Crimson_Gold, "交 易 所 有 金 块", DIA_Addon_Crimson_Gold_ALLE);
		Info_AddChoice(DIA_Addon_Crimson_Gold, "交 易 １ 个 金 块", DIA_Addon_Crimson_Gold_1);
	};
};

func void DIA_Addon_Crimson_Gold_1()
{
	B_GiveInvItems(other, self, ItMi_GoldNugget_Addon, 1);
	B_GiveInvItems(self, other, ItMI_Gold, 10);

	Info_ClearChoices(DIA_Addon_Crimson_Gold);
	Info_AddChoice(DIA_Addon_Crimson_Gold, DIALOG_BACK, DIA_Addon_Crimson_Gold_BACK);

	if (Npc_HasItems(other, ItMi_GoldNugget_Addon) >= 1)
	{
		Info_AddChoice(DIA_Addon_Crimson_Gold, "交 易 所 有 金 块", DIA_Addon_Crimson_Gold_ALLE);
		Info_AddChoice(DIA_Addon_Crimson_Gold, "交 易 １ 个 金 块", DIA_Addon_Crimson_Gold_1);
	};
};

func void B_Say_CrimsonBeliar()
{
	AI_Output(self, other, "DIA_Addon_Crimson_FATAGN_LOS_10_00"); //（ 念 咒 语 ）KHARDIMON FATAGN SHATAR FATAGN BELIAR。
};

// ---------------------------------------------------------------------
//	Info Raven
// ---------------------------------------------------------------------
instance DIA_Addon_Crimson_Raven(C_INFO)
{
	npc				= BDT_1095_Addon_Crimson;
	nr				= 9;
	condition		= DIA_Addon_Crimson_Raven_Condition;
	information		= DIA_Addon_Crimson_Raven_Info;
	description		= "你 都 知 道 关 于 瑞 雯 的 什 么 事 情 ？ ";
};

func int DIA_Addon_Crimson_Raven_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Crimson_How))
	{
		return TRUE;
	};
};

func void DIA_Addon_Crimson_Raven_Info()
{
	AI_Output(other, self, "DIA_Addon_Crimson_Raven_15_00"); //你 都 知 道 关 于 瑞 雯 的 什 么 事 情 ？
	AI_Output(self, other, "DIA_Addon_Crimson_Raven_10_01"); //你 不 会 相 信 的 。 我 在 那 里 。 我 看 到 了 他 在 坟 墓 里 做 的 事 !
	AI_Output(self, other, "DIA_Addon_Crimson_Raven_10_02"); //（ 害 怕 的 ） 他 喃 喃 而 语 地 说 了 很 多 奇 怪 的 话 。 一 遍 又 一 遍 … …
	B_Say_CrimsonBeliar();
	AI_Output(self, other, "DIA_Addon_Crimson_Raven_10_03"); //（ 大 声 的 ） 然 后 一 道 强 烈 的 光 线 从 墓 地 里 射 出 ， 然 后 我 听 到 一 声 尖 叫 。
	AI_Output(self, other, "DIA_Addon_Crimson_Raven_10_04"); //（ 呼 喊 ） 哦 ， 天 啊 ， 那 个 声 音 。 那 是 世 界 末 日 的 声 音 ！
	AI_Output(self, other, "DIA_Addon_Crimson_Raven_10_05"); //瑞 雯 和 它 说 话 ， 他 们 在 交 谈 - 瑞 雯 和 那 个 声 音 ！
	AI_Output(self, other, "DIA_Addon_Crimson_Raven_10_06"); //我 记 不 起 他 们 在 说 什 么 - 我 只 知 道 在 很 长 时 间 以 后 ， 我 才 能 在 控 制 自 己 的 腿 返 回 营 地 。
};

// ---------------------------------------------------------------------
//	Info FATAGN
// ---------------------------------------------------------------------
instance DIA_Addon_Crimson_FATAGN(C_INFO)
{
	npc				= BDT_1095_Addon_Crimson;
	nr				= 98;
	condition		= DIA_Addon_Crimson_FATAGN_Condition;
	information		= DIA_Addon_Crimson_FATAGN_Info;
	permanent		= TRUE;
	description		= "你 能 再 重 复 一 次 瑞 雯 的 话 吗 ？";
};

func int DIA_Addon_Crimson_FATAGN_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Crimson_Raven)
	&& (Crimson_SayBeliar < 4))
	{
		return TRUE;
	};
};

func void DIA_Addon_Crimson_FATAGN_Info()
{
	Crimson_SayBeliar = (Crimson_SayBeliar + 1);

	AI_Output(other, self, "DIA_Addon_Crimson_FATAGN_15_00"); //你 能 再 重 复 一 次 瑞 雯 的 话 吗 ？

	if (Crimson_SayBeliar <= 3)
	{
		AI_Output(self, other, "DIA_Addon_Crimson_FATAGN_10_01"); //真 的 。 你 准 备 好 了 吗 ？

		Info_ClearChoices(DIA_Addon_Crimson_FATAGN);
		Info_AddChoice(DIA_Addon_Crimson_FATAGN, "好 吧 。", DIA_Addon_Crimson_FATAGN_LOS);
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Crimson_FATAGN_10_02"); //我 想 我 们 最 好 不 要 去 管 它 … …
	};
};

func void DIA_Addon_Crimson_FATAGN_LOS()
{
	Snd_Play("Mystery_09");
	B_Say_CrimsonBeliar();

	if (Crimson_SayBeliar == 3)
	{
		Wld_PlayEffect("FX_EARTHQUAKE", self, self, 0, 0, 0, FALSE);
		Wld_PlayEffect("DEMENTOR_FX", self, self, 0, 0, 0, FALSE);
	};

	Info_ClearChoices(DIA_Addon_Crimson_FATAGN);
};
