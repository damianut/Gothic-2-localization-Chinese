///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_270_EXIT(C_INFO)
{
	npc				= PAL_270_Ritter;
	nr				= 999;
	condition		= DIA_PAL_270_EXIT_Condition;
	information		= DIA_PAL_270_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_PAL_270_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_270_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info OUT
///////////////////////////////////////////////////////////////////////
instance DIA_Ritter_OUT(C_INFO)
{
	npc				= PAL_270_Ritter;
	condition		= DIA_Ritter_OUT_Condition;
	information		= DIA_Ritter_OUT_Info;
	permanent		= TRUE;
	important		= TRUE;
};

var int DIA_Ritter_OUT_NoPerm;
func int DIA_Ritter_OUT_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Ritter_OUT_Info()
{
	if (DIA_Ritter_OUT_NoPerm == FALSE)
	{
		AI_Output(self, other, "DIA_Ritter_OUT_06_00"); //你 从 克 霍 里 尼 斯 来 ， 是 吗 ？ 当 这 里 的 一 切 结 束 后 ， 我 将 回 到 那 里 去 。
		DIA_Ritter_OUT_NoPerm = TRUE;
	};

	if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Ritter_OUT_06_01"); //有 了 你 的 支 持 ， 对 我 们 来 说 是 一 个 巨 大 的 安 慰 ， 阁 下 。
	}
	else
	{
		AI_Output(self, other, "DIA_Ritter_OUT_06_02"); //我 们 将 会 取 得 成 功 。 我 们 要 把 那 些 矿 石 带 去 克 霍 里 尼 斯 让 他 们 为 我 们 庆 祝 ！
	};
};
