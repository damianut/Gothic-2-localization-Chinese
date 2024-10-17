// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Gunnar_EXIT(C_INFO)
{
	npc				= BAU_902_Gunnar;
	nr				= 999;
	condition		= DIA_Gunnar_EXIT_Condition;
	information		= DIA_Gunnar_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Gunnar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gunnar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				  Hallo
// ************************************************************
var int Gunnar_HalloGesagt;
// ------------------------
instance DIA_Gunnar_Hallo(C_INFO)
{
	npc				= BAU_902_Gunnar;
	nr				= 1;
	condition		= DIA_Gunnar_Hallo_Condition;
	information		= DIA_Gunnar_Hallo_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 鲜 事 吗 ？";
};

func int DIA_Gunnar_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Gunnar_Hallo_Info()
{
	AI_Output(other, self, "DIA_Gunnar_Hallo_15_00"); //有 什 么 新 鲜 事 吗 ？
	if (other.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Gunnar_Hallo_10_01"); //因 为 欧 纳 尔 宣 称 他 雇 佣 了 雇 佣 兵 ， 所 以 地 里 除 了 流 氓 什 么 都 没 有 。
		AI_Output(self, other, "DIA_Gunnar_Hallo_10_02"); //所 有 以 前 没 胆 量 离 开 树 林 的 暴 民 们 现 在 都 在 这 里 了 。
		AI_Output(self, other, "DIA_Gunnar_Hallo_10_03"); //那 些 混 蛋 真 的 来 自 四 面 八 方 … …
	};

	if ((other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Gunnar_Hallo_10_04"); //那 么 你 现 在 是 一 名 雇 佣 兵 了 ， 嗯 ？
	};

	if ((other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF))
	{
		AI_Output(self, other, "DIA_Gunnar_Hallo_10_05"); //英 诺 斯 与 你 同 在 ！
	};

	if ((other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL))
	{
		AI_Output(self, other, "DIA_Gunnar_Hallo_10_06"); //这 里 不 欢 迎 来 自 城 市 的 人 。
	};

	Gunnar_HalloGesagt = TRUE;
};

// ************************************************************
// 			  				  Everywhere
// ************************************************************
instance DIA_Gunnar_Everywhere(C_INFO)
{
	npc				= BAU_902_Gunnar;
	nr				= 2;
	condition		= DIA_Gunnar_Everywhere_Condition;
	information		= DIA_Gunnar_Everywhere_Info;
	permanent		= TRUE;
	description		= "雇 佣 兵 来 自 各 地 ？";
};

func int DIA_Gunnar_Everywhere_Condition()
{
	if (Gunnar_HalloGesagt == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Gunnar_Everywhere_Info()
{
	AI_Output(other, self, "DIA_Gunnar_Everywhere_15_00"); //雇 佣 兵 来 自 各 地 ？
	AI_Output(self, other, "DIA_Gunnar_Everywhere_10_01"); //他 们 中 的 大 部 分 来 自 罪 犯 流 放 地 。
	AI_Output(self, other, "DIA_Gunnar_Everywhere_10_02"); //另 一 群 雇 佣 兵 是 从 南 边 来 的 ， 他 们 以 前 可 能 在 那 里 猎 杀 兽 人 。
	AI_Output(self, other, "DIA_Gunnar_Everywhere_10_03"); //而 且 我 肯 定 有 些 从 山 区 来 的 强 盗 也 出 现 在 这 里 ， 想 弄 点 免 费 的 饭 吃 ！
};

// ************************************************************
// 			  			Aud dem Süden
// ************************************************************
instance DIA_Gunnar_South(C_INFO)
{
	npc				= BAU_902_Gunnar;
	nr				= 3;
	condition		= DIA_Gunnar_South_Condition;
	information		= DIA_Gunnar_South_Info;
	permanent		= TRUE;
	description		= "关 于 那 边 来 的 那 些 雇 佣 兵 你 都 知 道 什 么 ？";
};

func int DIA_Gunnar_South_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Gunnar_Everywhere))
	{
		return TRUE;
	};
};

func void DIA_Gunnar_South_Info()
{
	AI_Output(other, self, "DIA_Gunnar_South_15_00"); //关 于 那 边 来 的 那 些 雇 佣 兵 你 都 知 道 什 么 ？
	AI_Output(self, other, "DIA_Gunnar_South_10_01"); //不 多 。 据 我 所 知 ， 他 们 在 那 里 追 杀 兽 人 。
	AI_Output(self, other, "DIA_Gunnar_South_10_02"); //席 尔 维 欧 是 他 们 的 头 。 布 尔 克 、 森 腾 扎 、 罗 欧 和 其 它 几 个 人 跟 着 他 干 … …
};

// ************************************************************
// 			  			Aus der Barriere
// ************************************************************
instance DIA_Gunnar_Colony(C_INFO)
{
	npc				= BAU_902_Gunnar;
	nr				= 4;
	condition		= DIA_Gunnar_Colony_Condition;
	information		= DIA_Gunnar_Colony_Info;
	permanent		= TRUE;
	description		= "他 们 中 的 哪 一 个 来 自 殖 民 地 ？";
};

func int DIA_Gunnar_Colony_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Gunnar_Everywhere))
	{
		return TRUE;
	};
};

func void DIA_Gunnar_Colony_Info()
{
	AI_Output(other, self, "DIA_Gunnar_Colony_15_00"); //他 们 中 的 哪 一 个 来 自 殖 民 地 ？
	AI_Output(self, other, "DIA_Gunnar_Colony_10_01"); //李 和 他 的 人 。 托 尔 洛 夫 、 考 德 、 加 维 斯 、 狼 和 其 它 所 有 的 人 。
};

// ************************************************************
// 			  				Banditen
// ************************************************************
instance DIA_Gunnar_Bandits(C_INFO)
{
	npc				= BAU_902_Gunnar;
	nr				= 5;
	condition		= DIA_Gunnar_Bandits_Condition;
	information		= DIA_Gunnar_Bandits_Info;
	permanent		= TRUE;
	description		= "你 说 的 是 哪 些 强 盗 ？";
};

func int DIA_Gunnar_Bandits_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Gunnar_Everywhere))
	{
		return TRUE;
	};
};

func void DIA_Gunnar_Bandits_Info()
{
	AI_Output(other, self, "DIA_Gunnar_Bandits_15_00"); //你 说 的 是 哪 些 强 盗 ？
	AI_Output(self, other, "DIA_Gunnar_Bandits_10_01"); //啊 ， 我 只 是 在 瞎 说 。 我 不 太 肯 定 。
	AI_Output(self, other, "DIA_Gunnar_Bandits_10_02"); //在 山 谷 的 南 方 的 山 脉 里 有 一 个 废 弃 的 矿 井 。 有 些 强 盗 就 藏 在 那 里 。
	AI_Output(self, other, "DIA_Gunnar_Bandits_10_03"); //他 们 也 是 来 自 流 放 地 的 罪 犯 ， 就 像 这 里 大 多 数 的 雇 佣 兵 一 样 。
	AI_Output(self, other, "DIA_Gunnar_Bandits_10_04"); //唯 一 的 不 同 就 是 ， 他 们 是 更 加 凶 残 的 恶 棍 。 他 们 会 杀 掉 任 何 靠 近 他 们 的 人 。
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Gunnar_PICKPOCKET(C_INFO)
{
	npc				= BAU_902_Gunnar;
	nr				= 900;
	condition		= DIA_Gunnar_PICKPOCKET_Condition;
	information		= DIA_Gunnar_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Gunnar_PICKPOCKET_Condition()
{
	C_Beklauen(45, 70);
};

func void DIA_Gunnar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gunnar_PICKPOCKET);
	Info_AddChoice(DIA_Gunnar_PICKPOCKET, DIALOG_BACK, DIA_Gunnar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gunnar_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Gunnar_PICKPOCKET_DoIt);
};

func void DIA_Gunnar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Gunnar_PICKPOCKET);
};

func void DIA_Gunnar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gunnar_PICKPOCKET);
};
