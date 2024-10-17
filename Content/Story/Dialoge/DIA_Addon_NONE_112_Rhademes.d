// ***********************************************************
//							EXIT
// ***********************************************************
instance DIA_Addon_Rhademes_EXIT(C_INFO)
{
	npc				= NONE_ADDON_112_Rhademes;
	nr				= 999;
	condition		= DIA_Addon_Rhademes_EXIT_Condition;
	information		= DIA_Addon_Rhademes_EXIT_Info;
	permanent		= TRUE;
	description		= "我 会 找 到 自 己 的 路 ！ （ 结 束 ）";
};

func int DIA_Addon_Rhademes_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Rhademes_EXIT_Info()
{
	AI_Output(other, self, "DIA_Addon_Rhademes_EXIT_15_00"); //我 会 自 己 找 到 方 法 ！
	AI_Output(self, other, "DIA_Addon_Rhademes_EXIT_03_01"); //如 你 所 愿 … …

	AI_StopProcessInfos(self);
};

// ***********************************************************
//							First
// ***********************************************************
var int Rhademes_Understood;
// -----------------------------------------------------------
instance DIA_Addon_Rhademes_First(C_INFO)
{
	npc				= NONE_ADDON_112_Rhademes;
	nr				= 1;
	condition		= DIA_Addon_Rhademes_First_Condition;
	information		= DIA_Addon_Rhademes_First_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_Rhademes_First_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (Rhademes_Understood == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Rhademes_First_Info()
{
	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_Rhademes_First_03_00"); //我 的 灵 魂 已 经 被 永 世 囚 禁 。
		AI_Output(self, other, "DIA_Addon_Rhademes_First_03_01"); //最 终 我 自 由 了 。 这 把 剑 找 到 了 一 个 新 的 持 有 者 。
		AI_Output(self, other, "DIA_Addon_Rhademes_First_03_02"); //最 后 的 房 间 已 经 被 打 开 了 。
		AI_Output(other, self, "DIA_Addon_Rhademes_First_15_03"); //但 是 大 门 似 乎 关 上 了 ！
		AI_Output(self, other, "DIA_Addon_Rhademes_First_03_04"); //这 不 是 通 向 最 后 房 间 的 大 门 。
		AI_Output(self, other, "DIA_Addon_Rhademes_First_03_05"); //这 扇 门 仅 仅 通 向 前 厅 。
		AI_Output(self, other, "DIA_Addon_Rhademes_First_03_06"); //持 有 者 … … 已 经 从 后 面 把 它 关 上 了 。

		Rhademes_Understood = TRUE;
	}
	else // Spieler spricht Sprache nicht
	{
		AI_Output(self, other, "DIA_Addon_Rhademes_First_03_07"); //（ 紧 张 的 ）Ghanima en Kandra Adanos？ ！
		B_Say(other, self, "$CANTUNDERSTANDTHIS");
		AI_Output(self, other, "DIA_Addon_Rhademes_First_03_08"); //（ 生 气 ）Bengla anthani！

		AI_StopProcessInfos(self);
	};
};

// ***********************************************************
//						Wie Pforte auf // E1
// ***********************************************************
instance DIA_Addon_Rhademes_Pforte(C_INFO)
{
	npc				= NONE_ADDON_112_Rhademes;
	nr				= 2;
	condition		= DIA_Addon_Rhademes_Pforte_Condition;
	information		= DIA_Addon_Rhademes_Pforte_Info;
	description		= "我 怎 么 开 门 ？";
};

func int DIA_Addon_Rhademes_Pforte_Condition()
{
	return TRUE;
};

func void DIA_Addon_Rhademes_Pforte_Info()
{
	AI_Output(other, self, "DIA_Addon_Rhademes_Pforte_15_00"); //我 怎 么 开 门 ？
	AI_Output(self, other, "DIA_Addon_Rhademes_Pforte_03_01"); //拉 动 … … 一 个 拉 杆 。
	AI_Output(other, self, "DIA_Addon_Rhademes_Pforte_15_02"); //任 何 一 个 ？
	AI_Output(self, other, "DIA_Addon_Rhademes_Pforte_03_03"); //所 有 这 些 拉 杆 会 打 开 大 门 。
};

// ***********************************************************
//						Hebel & Falle // E2
// ***********************************************************
instance DIA_Addon_Rhademes_Hebel(C_INFO)
{
	npc				= NONE_ADDON_112_Rhademes;
	nr				= 3;
	condition		= DIA_Addon_Rhademes_Hebel_Condition;
	information		= DIA_Addon_Rhademes_Hebel_Info;
	description		= "并 非 所 有 的 拉 杆 都 会 触 发 机 关 ， 是 吗 ？";
};

func int DIA_Addon_Rhademes_Hebel_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Rhademes_Pforte))
	&& (!Npc_KnowsInfo(other, DIA_Addon_Rhademes_DeinVater)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Rhademes_Hebel_Info()
{
	AI_Output(other, self, "DIA_Addon_Rhademes_Hebel_15_00"); //并 非 所 有 的 拉 杆 都 会 触 发 机 关 ， 是 吗 ？
	AI_Output(self, other, "DIA_Addon_Rhademes_Hebel_03_01"); //是 的 ， 它 们 能 ！
};

// ***********************************************************
//						Glaube dir nicht // E2
// ***********************************************************
instance DIA_Addon_Rhademes_DontBelieve(C_INFO)
{
	npc				= NONE_ADDON_112_Rhademes;
	nr				= 4;
	condition		= DIA_Addon_Rhademes_DontBelieve_Condition;
	information		= DIA_Addon_Rhademes_DontBelieve_Info;
	description		= "我 不 相 信 你 ！";
};

func int DIA_Addon_Rhademes_DontBelieve_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Rhademes_Pforte))
	&& (!Npc_KnowsInfo(other, DIA_Addon_Rhademes_DeinVater)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Rhademes_DontBelieve_Info()
{
	AI_Output(other, self, "DIA_Addon_Rhademes_DontBelieve_15_00"); //我 不 相 信 你 ！
	AI_Output(self, other, "DIA_Addon_Rhademes_DontBelieve_03_01"); //然 而 ， 我 … … 只 说 真 相 。
};

// ***********************************************************
//						Dein Vater // E2
// ***********************************************************
instance DIA_Addon_Rhademes_DeinVater(C_INFO)
{
	npc				= NONE_ADDON_112_Rhademes;
	nr				= 5;
	condition		= DIA_Addon_Rhademes_DeinVater_Condition;
	information		= DIA_Addon_Rhademes_DeinVater_Info;
	description		= "你 的 父 亲 建 造 了 陷 阱 ， 你 怎 么 知 道 它 如 何 工 作 ？！";
};

func int DIA_Addon_Rhademes_DeinVater_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Rhademes_Pforte))
	&& (Npc_HasItems(other, ItMi_Addon_Stone_04) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Rhademes_DeinVater_Info()
{
	AI_Output(other, self, "DIA_Addon_Rhademes_DeinVater_15_00"); //你 的 父 亲 建 造 了 陷 阱 ， 你 怎 么 知 道 它 如 何 工 作 ？！
	AI_Output(self, other, "DIA_Addon_Rhademes_DeinVater_03_01"); //夸 霍 德 隆 ！ 我 还 能 听 到 铁 锤 的 重 击 声 … … 在 门 另 一 面 … … 在 这 么 久 之 后 … …
	AI_Output(self, other, "DIA_Addon_Rhademes_DeinVater_03_02"); //剑 … … 指 示 我 … … 复 仇 … … 因 为 我 的 失 败 … …
	AI_Output(other, self, "DIA_Addon_Rhademes_DeinVater_15_03"); //你 的 意 思 是 你 已 经 看 出 那 个 拉 杆 是 正 确 的 ？
	AI_Output(self, other, "DIA_Addon_Rhademes_DeinVater_03_04"); //我 早 就 忘 记 了 。

	Info_ClearChoices(DIA_Addon_Rhademes_DeinVater);
	Info_AddChoice(DIA_Addon_Rhademes_DeinVater, "那 猜 一 下 ！", DIA_Addon_Rhademes_DeinVater_Guess);
	Info_AddChoice(DIA_Addon_Rhademes_DeinVater, "试 着 记 起 来 ！", DIA_Addon_Rhademes_DeinVater_Remember);
	Info_AddChoice(DIA_Addon_Rhademes_DeinVater, "想 ！", DIA_Addon_Rhademes_DeinVater_Think);
};

// ------------------------
var int Rhademes_fertig;

// ------ zieh dran! ------
func void B_Addon_Rhademes_Lever(var int choice)
{
	AI_Output(self, other, "DIA_Addon_Rhademes_Lever_03_00"); //那 已 经 是 很 久 以 前 了 … …
	AI_StopProcessInfos(self);

	if (choice <= 1)
	{
		AI_GotoWP(self, "ADW_ADANOSTEMPEL_RHADEMES_04");
	}
	else if (choice == 2)
	{
		AI_GotoWP(self, "ADW_ADANOSTEMPEL_RHADEMES_04");
	}
	else // choice >= 3
	{
		AI_GotoWP(self, "ADW_ADANOSTEMPEL_RHADEMES_04");
	};

	AI_UseMob(self, "LEVER", 1);

	Rhademes_fertig = TRUE;
};

func void DIA_Addon_Rhademes_DeinVater_Think()
{
	AI_Output(other, self, "DIA_Addon_Rhademes_DeinVater_Think_15_00"); //想 ！
	B_Addon_Rhademes_Lever(1);
};

func void DIA_Addon_Rhademes_DeinVater_Remember()
{
	AI_Output(other, self, "DIA_Addon_Rhademes_DeinVater_Remember_15_00"); //试 着 记 起 来 ！
	B_Addon_Rhademes_Lever(2);
};

func void DIA_Addon_Rhademes_DeinVater_Guess()
{
	AI_Output(other, self, "DIA_Addon_Rhademes_DeinVater_Guess_15_00"); //那 猜 一 下 ！
	B_Addon_Rhademes_Lever(3);
};

// ***********************************************************
//							PERM
// ***********************************************************
instance DIA_Addon_Rhademes_PERM(C_INFO)
{
	npc				= NONE_ADDON_112_Rhademes;
	nr				= 2;
	condition		= DIA_Addon_Rhademes_PERM_Condition;
	information		= DIA_Addon_Rhademes_PERM_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_Rhademes_PERM_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (Rhademes_fertig == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Rhademes_PERM_Info()
{
	AI_Output(self, other, "DIA_Addon_Rhademes_PERM_03_00"); //如 果 你 有 力 量 … … 把 它 沉 掉 … … 在 大 海 的 深 处 … …
	SC_TookRhademesTrap = TRUE;
	SC_TalkedToRhademAfter = TRUE;
	AI_StopProcessInfos(self);
};
