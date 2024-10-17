// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Sld_820_EXIT(C_INFO)
{
	npc				= Sld_820_Soeldner;
	nr				= 999;
	condition		= DIA_Sld_820_EXIT_Condition;
	information		= DIA_Sld_820_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Sld_820_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sld_820_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				   Halt
// ************************************************************
instance DIA_Sld_820_Halt(C_INFO)
{
	npc				= Sld_820_Soeldner;
	nr				= 1;
	condition		= DIA_Sld_820_Halt_Condition;
	information		= DIA_Sld_820_Halt_Info;
	important		= TRUE;
};

func int DIA_Sld_820_Halt_Condition()
{
	if ((other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Sld_820_Halt_Info()
{
	AI_Output(self, other, "DIA_Sld_820_Halt_07_00"); //你 想 去 哪 里 ？
	AI_Output(other, self, "DIA_Sld_820_Halt_15_01"); //当 然 是 去 屋 子 里 。
	AI_Output(self, other, "DIA_Sld_820_Halt_07_02"); //欧 纳 尔 花 钱 雇 我 们 就 是 为 了 不 让 你 这 样 的 家 伙 进 这 里 ！

	if (other.guild == GIL_MIL)
	{
		AI_Output(self, other, "DIA_Sld_820_Halt_07_03"); //一 定 不 要 让 任 何 民 兵 进 这 里 ！ - 那 是 他 的 原 话 。
	};

	AI_Output(other, self, "DIA_Sld_820_Halt_15_04"); //我 想 跟 李 谈 谈 ！
	AI_Output(self, other, "DIA_Sld_820_Halt_07_05"); //你 想 找 他 干 什 么 ？

	Info_ClearChoices(DIA_Sld_820_Halt);
	Info_AddChoice(DIA_Sld_820_Halt, "我 和 他 是 老 朋 友 了 … …", DIA_Sld_820_Halt_KenneLee);
	if (other.guild == GIL_NONE)
	{
		Info_AddChoice(DIA_Sld_820_Halt, "我 想 要 加 入 雇 佣 兵 ！", DIA_Sld_820_Halt_WannaJoin);
	};
};

func void B_Sld_820_LeeIsRight()
{
	AI_Output(self, other, "B_Sld_820_LeeIsRight_07_00"); //李 在 右 边 厢 房 。 千 万 别 考 虑 去 别 的 地 方 ！
};

func void DIA_Sld_820_Halt_WannaJoin()
{
	AI_Output(other, self, "DIA_Sld_820_Halt_WannaJoin_15_00"); //我 想 要 加 入 雇 佣 兵 ！
	AI_Output(self, other, "DIA_Sld_820_Halt_WannaJoin_07_01"); //啊 ， 年 青 的 大 兵 ！ 进 去 吧 。
	B_Sld_820_LeeIsRight();
	AI_Output(self, other, "DIA_Sld_820_Halt_WannaJoin_07_02"); //但 是 最 重 要 的 是 别 去 打 扰 欧 纳 尔 ！ 他 不 喜 欢 别 人 在 没 有 争 得 同 意 时 就 跟 他 讲 话 。 尤 其 是 像 你 这 样 的 家 伙 。
	AI_StopProcessInfos(self);
};

func void DIA_Sld_820_Halt_KenneLee()
{
	AI_Output(other, self, "DIA_Sld_820_Halt_KenneLee_15_00"); //我 和 他 是 老 朋 友 了 … …
	AI_Output(self, other, "DIA_Sld_820_Halt_KenneLee_07_01"); //你 是 李 的 朋 友 ？ 我 一 个 字 都 不 信 ！ 但 是 ， 进 去 吧 ， 如 果 他 不 认 识 你 ， 你 就 会 知 道 … … （ 大 笑 ）
	B_Sld_820_LeeIsRight();
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				   PERM
// ************************************************************
instance DIA_Sld_820_PERM(C_INFO)
{
	npc				= Sld_820_Soeldner;
	nr				= 1;
	condition		= DIA_Sld_820_PERM_Condition;
	information		= DIA_Sld_820_PERM_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 鲜 事 吗 ？";
};

func int DIA_Sld_820_PERM_Condition()
{
	return TRUE;
};

func void DIA_Sld_820_PERM_Info()
{
	AI_Output(other, self, "DIA_Sld_820_PERM_15_00"); //还 好 吗 ？
	AI_Output(self, other, "DIA_Sld_820_PERM_07_01"); //如 果 你 愿 意 就 进 去 吧 ， 但 是 别 跟 我 瞎 扯 。
	AI_StopProcessInfos(self);
};
