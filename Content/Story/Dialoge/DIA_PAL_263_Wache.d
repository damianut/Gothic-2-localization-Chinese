///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_263_EXIT(C_INFO)
{
	npc				= PAL_263_Wache;
	nr				= 999;
	condition		= DIA_PAL_263_EXIT_Condition;
	information		= DIA_PAL_263_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_PAL_263_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_263_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_263_PERM(C_INFO)
{
	npc				= PAL_263_Wache;
	nr				= 2;
	condition		= DIA_PAL_263_PERM_Condition;
	information		= DIA_PAL_263_PERM_Info;
	permanent		= TRUE;
	description		= "报 告 ， 士 兵 ！";
};

func int DIA_PAL_263_PERM_Condition()
{
	if (hero.guild == GIL_MIL
	|| hero.guild == GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_PAL_263_PERM_Info()
{
	AI_Output(other, self, "DIA_PAL_263_PERM_15_00"); //报 告 ， 士 兵 ！
	AI_Output(self, other, "DIA_PAL_263_PERM_04_01"); //是 ， 长 官 ！ 按 命 令 坚 守 阵 地 。 没 有 其 它 损 失 。 储 备 在 持 续 短 缺 ， 兽 人 还 是 很 安 静 。
	AI_Output(self, other, "DIA_PAL_263_PERM_04_02"); //龙 的 上 一 次 袭 击 完 全 摧 毁 了 外 墙 。 但 从 那 以 后 就 没 有 什 么 不 寻 常 的 事 情 了 。
	AI_Output(other, self, "DIA_PAL_263_PERM_15_03"); //好 的 ， 继 续 。
};

///////////////////////////////////////////////////////////////////////
//	Info PERM_OTH
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_263_PERM_OTH(C_INFO)
{
	npc				= PAL_263_Wache;
	nr				= 2;
	condition		= DIA_PAL_263_PERM_OTH_Condition;
	information		= DIA_PAL_263_PERM_OTH_Info;
	permanent		= TRUE;
	description		= "最 近 怎 么 样 ？";
};

func int DIA_PAL_263_PERM_OTH_Condition()
{
	if (hero.guild != GIL_MIL
	|| hero.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_PAL_263_PERM_OTH_Info()
{
	AI_Output(other, self, "DIA_PAL_263_PERM_OTH_15_00"); //状 况 怎 么 样 ？
	AI_Output(self, other, "DIA_PAL_263_PERM_OTH_04_01"); //我 们 已 经 控 制 了 局 势 。 不 用 担 心 ， 市 民 。 最 后 一 切 都 将 好 转 。
};
