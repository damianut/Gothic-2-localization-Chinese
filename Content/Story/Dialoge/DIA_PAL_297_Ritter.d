///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_297_EXIT(C_INFO)
{
	npc				= PAL_297_Ritter;
	nr				= 999;
	condition		= DIA_PAL_297_EXIT_Condition;
	information		= DIA_PAL_297_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_PAL_297_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_297_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info TRESPAS
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_297_TRESPAS(C_INFO)
{
	npc				= PAL_297_Ritter;
	nr				= 2;
	condition		= DIA_PAL_297_TRESPAS_Condition;
	information		= DIA_PAL_297_TRESPAS_Info;
	permanent		= TRUE;
	description		= "情 况 怎 么 样 了 ？ ";
};

func int DIA_PAL_297_TRESPAS_Condition()
{
	return TRUE;
};

func void DIA_PAL_297_TRESPAS_Info()
{
	AI_Output(other, self, "DIA_PAL_297_TRESPAS_15_00"); //情 况 怎 么 样 了 ？

	if (Kapitel == 1)
	{
		AI_Output(self, other, "DIA_PAL_297_TRESPAS_04_01"); //这 个 区 域 极 其 危 险 ， 所 以 你 必 须 回 去 - 我 们 当 然 不 想 有 什 么 事 情 发 生 在 你 身 上 。
	}
	else
	{
		AI_Output(self, other, "DIA_PAL_297_TRESPAS_04_02"); //你 能 进 到 这 个 山 谷 里 真 是 太 勇 敢 了 。 只 是 要 随 身 带 上 足 够 的 治 疗 药 剂 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Rangerbandits
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_PAL_297_Rangerbandits(C_INFO)
{
	npc				= PAL_297_Ritter;
	nr				= 5;
	condition		= DIA_Addon_PAL_297_Rangerbandits_Condition;
	information		= DIA_Addon_PAL_297_Rangerbandits_Info;
	description		= "最 近 有 强 盗 路 过 这 里 吗 ？";
};

func int DIA_Addon_PAL_297_Rangerbandits_Condition()
{
	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_PAL_297_Rangerbandits_Info()
{
	AI_Output(other, self, "DIA_Addon_PAL_297_Rangerbandits_15_00"); //最 近 有 强 盗 路 过 这 里 吗 ？
	AI_Output(self, other, "DIA_Addon_PAL_297_Rangerbandits_04_01"); //不 知 你 在 说 什 么 。 只 要 我 们 在 执 行 守 卫 的 职 责 ， 就 不 能 让 任 何 人 通 过 。 当 然 包 括 某 些 肮 脏 的 强 盗 。
	AI_Output(self, other, "DIA_Addon_PAL_297_Rangerbandits_04_02"); //去 后 面 问 问 那 里 的 农 民 。 也 许 他 们 看 见 过 什 么 。
};
