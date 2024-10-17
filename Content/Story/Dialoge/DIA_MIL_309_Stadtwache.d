///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Mil_309_Stadtwache_EXIT(C_INFO)
{
	npc				= Mil_309_Stadtwache;
	nr				= 999;
	condition		= DIA_Mil_309_Stadtwache_EXIT_Condition;
	information		= DIA_Mil_309_Stadtwache_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Mil_309_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_309_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WasMachstDu
///////////////////////////////////////////////////////////////////////
instance DIA_Mil_309_Stadtwache_Hallo(C_INFO)
{
	npc				= Mil_309_Stadtwache;
	nr				= 2;
	condition		= DIA_Mil_309_Stadtwache_Hallo_Condition;
	information		= DIA_Mil_309_Stadtwache_Hallo_Info;
	permanent		= TRUE;
	description		= "怎 么 样 了 ？";
};

func int DIA_Mil_309_Stadtwache_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Mil_309_Stadtwache_Hallo_Info()
{
	AI_Output(other, self, "DIA_Mil_309_Stadtwache_Hallo_15_00"); //怎 么 样 了 ？
	if ((hero.guild == GIL_MIL)
	|| (hero.guild == GIL_PAL)
	|| (hero.guild == GIL_KDF))
	{
		AI_Output(self, other, "DIA_Mil_309_Stadtwache_Hallo_06_01"); //一 切 都 很 平 静 。 我 们 需 要 保 持 警 惕 。
	}
	else if ((Stadtwache_310.aivar[AIV_PASSGATE] == FALSE)
	&& (MIl_309_News < 1))
	{
		AI_Output(self, other, "DIA_Mil_309_Stadtwache_Hallo_06_02"); //现 在 听 着 ， 我 们 不 能 让 你 进 入 城 市 。
		AI_Output(self, other, "DIA_Mil_309_Stadtwache_Hallo_06_03"); //但 是 我 会 给 你 一 个 提 示 ， 完 全 免 费 。
		AI_Output(self, other, "DIA_Mil_309_Stadtwache_Hallo_06_04"); //远 离 我 们 前 面 的 这 片 森 林 - 里 面 有 非 常 凶 恶 的 怪 物 出 没 。

		MIl_309_News = 1;
	}
	else if ((Stadtwache_310.aivar[AIV_PASSGATE] == FALSE)
	&& (MIl_309_News == 1))
	{
		AI_Output(self, other, "DIA_Mil_309_Stadtwache_Hallo_06_05"); //缩 回 你 的 石 头 下 面 去 ， 你 这 低 等 人 ！
	};

	if ((Stadtwache_310.aivar[AIV_PASSGATE] == TRUE)
	&& (MIl_309_News < 2))
	{
		AI_Output(self, other, "DIA_Mil_309_Stadtwache_Hallo_06_06"); //听 着 - 你 现 在 可 以 进 入 这 座 城 市 。 但 那 不 是 说 你 可 以 在 这 里 为 所 欲 为 。
		AI_Output(self, other, "DIA_Mil_309_Stadtwache_Hallo_06_07"); //如 果 你 不 遵 守 这 些 规 则 ， 你 就 将 失 去 在 这 里 的 所 有 权 力 ！

		MIl_309_News = 2;
	}
	else if ((Stadtwache_310.aivar[AIV_PASSGATE] == TRUE)
	&& (MIl_309_News == 2))
	{
		AI_Output(self, other, "DIA_Mil_309_Stadtwache_Hallo_06_08"); //继 续 往 前 走 ！
	};

	AI_StopProcessInfos(self);
};
