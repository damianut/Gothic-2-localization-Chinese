// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Grimes_EXIT(C_INFO)
{
	npc				= VLK_4111_Grimes;
	nr				= 999;
	condition		= DIA_Grimes_EXIT_Condition;
	information		= DIA_Grimes_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

// --------------------
var int Grimes_First;
// --------------------
func int DIA_Grimes_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Grimes_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				   Hallo
// ************************************************************
instance DIA_Grimes_Hallo(C_INFO)
{
	npc				= VLK_4111_Grimes;
	nr				= 2;
	condition		= DIA_Grimes_Hallo_Condition;
	information		= DIA_Grimes_Hallo_Info;
	important		= TRUE;
};

func int DIA_Grimes_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Grimes_Hallo_Info()
{
	AI_Output(self, other, "DIA_Grimes_Hallo_05_00"); //是 你 ？ 谁 能 想 得 到 我 们 还 能 再 见 到 对 方 。？
	AI_Output(self, other, "DIA_Grimes_Hallo_05_01"); //那 么 ， 看 来 我 们 俩 都 知 道 怎 样 保 命 ， 而 且 ， 如 你 所 见 ， 我 已 经 从 事 探 矿 工 作 了 。

	if (Grimes_First == FALSE)
	{
		Wld_InsertNpc(Snapper, "OW_PATH_148_A");
		Wld_InsertNpc(Snapper, "OW_PATH_146");
		Wld_InsertNpc(Snapper, "OW_PATH_147");
		Wld_InsertNpc(Snapper, "OW_PATH_148");
		Wld_InsertNpc(Snapper, "OW_PATH_264");

		Grimes_First = TRUE;
	};
};

// ************************************************************
// 			  	Erz
// ************************************************************
instance DIA_Grimes_Erz(C_INFO)
{
	npc				= VLK_4111_Grimes;
	nr				= 2;
	condition		= DIA_Grimes_Erz_Condition;
	information		= DIA_Grimes_Erz_Info;
	description		= "你 已 经 采 集 了 多 少 矿 石 ？ ";
};

func int DIA_Grimes_Erz_Condition()
{
	if ((Kapitel == 2)
	&& (MIS_ScoutMine == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Grimes_Erz_Info()
{
	AI_Output(other, self, "DIA_Grimes_Erz_15_00"); //你 已 经 采 集 了 多 少 矿 石 ？
	AI_Output(self, other, "DIA_Grimes_Erz_05_01"); //好 几 箱 。 不 过 那 些 东 西 已 经 不 在 这 里 了 。
	AI_Output(self, other, "DIA_Grimes_Erz_05_02"); //因 为 我 们 一 直 受 到 兽 人 的 攻 击 ， 所 以 圣 骑 士 马 科 斯 决 定 要 把 矿 石 带 到 城 堡 去 。
};

// ************************************************************
// 			 Weg
// ************************************************************
instance DIA_Grimes_Weg(C_INFO)
{
	npc				= VLK_4111_Grimes;
	nr				= 3;
	condition		= DIA_Grimes_Weg_Condition;
	information		= DIA_Grimes_Weg_Info;
	description		= "你 知 道 马 科 斯 走 的 是 哪 条 路 吗 ？";
};

func int DIA_Grimes_Weg_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Grimes_Erz)
	&& (Npc_KnowsInfo(other, DIA_Marcos_Garond) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Grimes_Weg_Info()
{
	AI_Output(other, self, "DIA_Grimes_Weg_15_00"); //你 知 道 马 科 斯 走 的 是 哪 条 路 吗 ？
	AI_Output(self, other, "DIA_Grimes_Weg_05_01"); //他 没 有 走 直 接 的 路 线 - 而 是 想 跨 过 那 条 结 了 冰 的 河 流 。
	AI_Output(self, other, "DIA_Grimes_Weg_05_02"); //他 想 绕 路 穿 行 ， 然 后 从 西 边 到 达 城 堡 。
};

// ************************************************************
// 			  Grimes
// ************************************************************
instance DIA_Grimes_Grimes(C_INFO)
{
	npc				= VLK_4111_Grimes;
	nr				= 2;
	condition		= DIA_Grimes_Grimes_Condition;
	information		= DIA_Grimes_Grimes_Info;
	description		= "你 想 要 离 开 山 谷 ？";
};

func int DIA_Grimes_Grimes_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Grimes_Grimes_Info()
{
	AI_Output(other, self, "DIA_Grimes_Grimes_15_00"); //你 想 要 离 开 山 谷 ？
	AI_Output(self, other, "DIA_Grimes_Grimes_05_01"); //不 ， 我 将 继 续 采 集 矿 石 。
	AI_Output(self, other, "DIA_Grimes_Grimes_05_02"); //我 不 想 让 几 个 兽 人 来 阻 止 我 - 困 难的 时 刻 我 已 经 挺 过 来 了 。
	AI_Output(self, other, "DIA_Grimes_Grimes_05_03"); //以 前 ， 我 们 还 在 旧 矿 坑 挖 掘 的 时 候 ， 突 然 有 水 涌 了 进 来 … …
	AI_Output(self, other, "DIA_Grimes_Grimes_05_04"); //不 过 那 都 是 过 去 的 事 了 。
};

// ************************************************************
// 			  Grimes
// ************************************************************
instance DIA_Grimes_PERM(C_INFO)
{
	npc				= VLK_4111_Grimes;
	nr				= 2;
	condition		= DIA_Grimes_PERM_Condition;
	information		= DIA_Grimes_PERM_Info;
	permanent		= TRUE;
	description		= "工 作 怎 么 样 ？";
};

func int DIA_Grimes_PERM_Condition()
{
	if (Kapitel >= 2)
	{
		return TRUE;
	};
};

func void DIA_Grimes_PERM_Info()
{
	AI_Output(other, self, "DIA_Grimes_PERM_15_00"); //工 作 怎 么 样 ？
	AI_Output(self, other, "DIA_Grimes_PERM_05_01"); //这 些 石 头 都 十 分 坚 固 - 简 直 就 像 它 要 阻 止 我 们 拿 走 矿 石 。
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Grimes_PICKPOCKET(C_INFO)
{
	npc				= VLK_4111_Grimes;
	nr				= 900;
	condition		= DIA_Grimes_PICKPOCKET_Condition;
	information		= DIA_Grimes_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Grimes_PICKPOCKET_Condition()
{
	C_Beklauen(43, 21);
};

func void DIA_Grimes_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Grimes_PICKPOCKET);
	Info_AddChoice(DIA_Grimes_PICKPOCKET, DIALOG_BACK, DIA_Grimes_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Grimes_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Grimes_PICKPOCKET_DoIt);
};

func void DIA_Grimes_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Grimes_PICKPOCKET);
};

func void DIA_Grimes_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Grimes_PICKPOCKET);
};

/*
Keine Ahnung - vielleicht steckt er noch irgendwo da draussen. Ich werde ihn wohl suchen müssen.
Ich habe ihn gefunden.
Er hält sich in einem kleinen Tal auf - unweit der Burg. Dort sind die Kisten wenigstens sicher.
Innos sei dank...

Nein, bisher nicht.
Dann hoffe ich, das er ein Versteck für sich und das Erz gefunden hat.
*/
