///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_STRF_1107_EXIT(C_INFO)
{
	npc				= STRF_1107_Straefling;
	nr				= 999;
	condition		= DIA_STRF_1107_EXIT_Condition;
	information		= DIA_STRF_1107_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_STRF_1107_EXIT_Condition()
{
	return TRUE;
};

func void DIA_STRF_1107_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info FINGER
///////////////////////////////////////////////////////////////////////
instance DIA_STRF_1107_FINGER(C_INFO)
{
	npc				= STRF_1107_Straefling;
	condition		= DIA_STRF_1107_FINGER_Condition;
	information		= DIA_STRF_1107_FINGER_Info;
	important		= TRUE;
};

func int DIA_STRF_1107_FINGER_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_FINGER_Info()
{
	AI_Output(self, other, "DIA_STRF_1107_FINGER_01_00"); //把 手 从 我 的 锅 上 面 拿 开 ！ 谁 也 不 能 碰 我 的 锅 ， 明 白 吗 ？ ！
	AI_Output(self, other, "DIA_STRF_1107_FINGER_01_01"); //我 负 责 食 物 ， 那 就 是 说 这 里 没 有 其 它 人 的 事 ！ 我 想 我 说 得 够 清 楚 了 ！
};

///////////////////////////////////////////////////////////////////////
//	Info COOK
///////////////////////////////////////////////////////////////////////
instance DIA_STRF_1107_COOK(C_INFO)
{
	npc				= STRF_1107_Straefling;
	nr				= 0;
	condition		= DIA_STRF_1107_COOK_Condition;
	information		= DIA_STRF_1107_COOK_Info;
	description		= "这 么 多 人 ， 谁 偏 偏 挑 了 你 来 做 厨 师 ？";
};

func int DIA_STRF_1107_COOK_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_STRF_1107_FINGER))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_COOK_Info()
{
	AI_Output(other, self, "DIA_STRF_1107_COOK_15_00"); //这 么 多 人 ， 谁 偏 偏 挑 了 你 来 做 厨 师 ？
	AI_Output(self, other, "DIA_STRF_1107_COOK_01_01"); //那 是 加 隆 德 指 挥 官 。 在 我 成 为 一 个 囚 犯 之 前 ， 我 曾 经 在 ‘ 狂 怒 的 野 猪 ’ 那 里 当 厨 子 。
	AI_Output(other, self, "DIA_STRF_1107_COOK_15_02"); //那 他 们 为 什 么 要 把 你 抓 起 来 ？
	AI_Output(self, other, "DIA_STRF_1107_COOK_01_03"); //这 是 一 个 客 人 、 一 把 切 肉 刀 和 我 之 间 的 误 会 。
};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_STRF_1107_PERM(C_INFO)
{
	npc				= STRF_1107_Straefling;
	nr				= 900;
	condition		= DIA_STRF_1107_PERM_Condition;
	information		= DIA_STRF_1107_PERM_Info;
	permanent		= TRUE;
	description		= "有 新 的 发 现 吗 ？ ";
};

func int DIA_STRF_1107_PERM_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_STRF_1107_FINGER))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_PERM_Info()
{
	AI_Output(other, self, "DIA_STRF_1107_PERM_15_00"); //有 新 的 发 现 吗 ？
	AI_Output(self, other, "DIA_STRF_1107_PERM_01_01"); //如 果 你 想 打 听 一 些 消 息 ， 那 就 去 问 那 些 骑 士 吧 。 我 只 是 个 被 囚 禁 的 厨 子 。
};
