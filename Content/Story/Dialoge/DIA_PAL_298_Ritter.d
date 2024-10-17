///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_EXIT(C_INFO)
{
	npc				= PAL_298_Ritter;
	nr				= 999;
	condition		= DIA_PAL_298_EXIT_Condition;
	information		= DIA_PAL_298_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_PAL_298_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_298_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Pass
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_Pass(C_INFO)
{
	npc				= PAL_298_Ritter;
	nr				= 2;
	condition		= DIA_PAL_298_Pass_Condition;
	information		= DIA_PAL_298_Pass_Info;
	description		= "这 条 路 通 向 哪 里 ？ ";
};

func int DIA_PAL_298_Pass_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_PAL_298_Pass_Info()
{
	AI_Output(other, self, "DIA_PAL_298_Pass_15_00"); //这 条 路 通 向 哪 里 ？
	AI_Output(self, other, "DIA_PAL_298_Pass_09_01"); //大 门 后 面 有 条 小 路 通 往 矿 藏 山 谷 。
	AI_Output(self, other, "DIA_PAL_298_Pass_09_02"); //我 们 在 这 边 - 有 几 个 兽 人 在 另 一 边 蹲 守 。
	AI_Output(self, other, "DIA_PAL_298_Pass_09_03"); //你 最 好 还 是 回 去 - 你 不 能 通 过 这 里 。
};

///////////////////////////////////////////////////////////////////////
//	Info TRESPASS
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_TRESPASS(C_INFO)
{
	npc				= PAL_298_Ritter;
	nr				= 2;
	condition		= DIA_PAL_298_TRESPASS_Condition;
	information		= DIA_PAL_298_TRESPASS_Info;
	important		= TRUE;
};

func int DIA_PAL_298_TRESPASS_Condition()
{
	if (MIS_OLDWORLD == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_PAL_298_TRESPASS_Info()
{
	AI_Output(self, other, "DIA_PAL_298_TRESPASS_09_00"); //你 真 的 想 要 进 到 那 里 去 ？ 我 恐 怕 你 不 会 走 得 太 远 - 那 一 边 有 兽 人 。
	AI_Output(other, self, "DIA_PAL_298_TRESPASS_15_01"); //如 果 有 路 通 往 矿 藏 山 谷 ， 我 会 找 到 它 的 。
	AI_Output(self, other, "DIA_PAL_298_TRESPASS_09_02"); //好 吧 ， 那 你 走 吧 。 与 英 诺 斯 同 行 。
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_Perm1(C_INFO)
{
	npc				= PAL_298_Ritter;
	nr				= 3;
	condition		= DIA_PAL_298_Perm1_Condition;
	information		= DIA_PAL_298_Perm1_Info;
	permanent		= TRUE;
	description		= "如 果 我 要 自 己 冒 险 出 发 呢 ？";
};

func int DIA_PAL_298_Perm1_Condition()
{
	if ((Kapitel == 1)
	&& Npc_KnowsInfo(other, DIA_PAL_298_Pass))
	{
		return TRUE;
	};
};

func void DIA_PAL_298_Perm1_Info()
{
	AI_Output(other, self, "DIA_PAL_298_Perm1_15_00"); //如 果 我 要 自 己 冒 险 出 发 呢 ？
	AI_Output(self, other, "DIA_PAL_298_Perm1_09_01"); //那 你 就 会 死 。 这 就 是 为 什 么 我 们 在 这 里 。 所 以 你 就 不 要 有 这 么 个 傻 念 头 了 。
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_Perm2(C_INFO)
{
	npc				= PAL_298_Ritter;
	nr				= 3;
	condition		= DIA_PAL_298_Perm2_Condition;
	information		= DIA_PAL_298_Perm2_Info;
	permanent		= TRUE;
	description		= "最 近 怎 么 样 ？";
};

func int DIA_PAL_298_Perm2_Condition()
{
	if (Kapitel >= 2)
	{
		return TRUE;
	};
};

func void DIA_PAL_298_Perm2_Info()
{
	AI_Output(other, self, "DIA_PAL_298_Perm2_15_00"); //状 况 怎 么 样 ？
	AI_Output(self, other, "DIA_PAL_298_Perm2_09_01"); //一 切 都 很 平 静 。 我 们 控 制 了 局 面 。
};
