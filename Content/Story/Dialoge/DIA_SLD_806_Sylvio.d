// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Sylvio_EXIT(C_INFO)
{
	npc				= SLD_806_Sylvio;
	nr				= 999;
	condition		= DIA_Sylvio_EXIT_Condition;
	information		= DIA_Sylvio_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Sylvio_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sylvio_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				   Hallo
// ************************************************************
instance DIA_Sylvio_Hallo(C_INFO)
{
	npc				= SLD_806_Sylvio;
	nr				= 1;
	condition		= DIA_Sylvio_Hallo_Condition;
	information		= DIA_Sylvio_Hallo_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 鲜 事 吗 ？";
};

func int DIA_Sylvio_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Sylvio_Hallo_Info()
{
	AI_Output(other, self, "DIA_Sylvio_Hallo_15_00"); //情 况 怎 么 样 了 ？
	AI_Output(self, other, "DIA_Sylvio_Hallo_09_01"); //我 允 许 你 跟 我 说 话 了 吗 ？

	Sylvio_angequatscht = Sylvio_angequatscht + 1;
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				  Thekla
// ************************************************************
instance DIA_Sylvio_Thekla(C_INFO)
{
	npc				= SLD_806_Sylvio;
	nr				= 2;
	condition		= DIA_Sylvio_Thekla_Condition;
	information		= DIA_Sylvio_Thekla_Info;
	description		= "特 赫 克 拉 和 你 之 间 有 问 题 。";
};

func int DIA_Sylvio_Thekla_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Thekla_Problem))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_Thekla_Info()
{
	AI_Output(other, self, "DIA_Sylvio_Thekla_15_00"); //特 赫 克 拉 和 你 之 间 有 问 题 。
	AI_Output(self, other, "DIA_Sylvio_Thekla_09_01"); //是 这 样 吗 ？ 那 个 尊 贵 的 小 姐 遇 到 了 什 么 麻 烦 ？ 为 什 么 她 不 亲 自 来 ？
	AI_Output(other, self, "DIA_Sylvio_Thekla_15_02"); //你 很 清 楚。
	AI_Output(self, other, "DIA_Sylvio_Thekla_09_03"); //（ 冷 嘲 热 讽 ， 友 善 的 ） 你 为 什 么 不 去 跟 我 的 朋 友 布 尔 克 商 量 一 下 呢 ？

	Sylvio_angequatscht = Sylvio_angequatscht + 1;
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				   Gossip
// ************************************************************
instance DIA_Sylvio_Gossip(C_INFO)
{
	npc				= SLD_806_Sylvio;
	nr				= 3;
	condition		= DIA_Sylvio_Gossip_Condition;
	information		= DIA_Sylvio_Gossip_Info;
	description		= "很 多 人 都 在 谈 论 你 … …";
};

func int DIA_Sylvio_Gossip_Condition()
{
	return TRUE;
};

func void DIA_Sylvio_Gossip_Info()
{
	AI_Output(other, self, "DIA_Sylvio_Gossip_15_00"); //很 多 人 都 在 谈 论 你 … …
	AI_Output(self, other, "DIA_Sylvio_Gossip_09_01"); //很 多 人 话 说 得 太 多 。

	Sylvio_angequatscht = Sylvio_angequatscht + 1;
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				   Gossip
// ************************************************************
instance DIA_Sylvio_AboutLee(C_INFO)
{
	npc				= SLD_806_Sylvio;
	nr				= 4;
	condition		= DIA_Sylvio_AboutLee_Condition;
	information		= DIA_Sylvio_AboutLee_Info;
	description		= "你 对 李 有 什 么 看 法 ？";
};

func int DIA_Sylvio_AboutLee_Condition()
{
	return TRUE;
};

func void DIA_Sylvio_AboutLee_Info()
{
	AI_Output(other, self, "DIA_Sylvio_AboutLee_15_00"); //你 对 李 有 什 么 看 法 ？
	AI_Output(self, other, "DIA_Sylvio_AboutLee_09_01"); //（ 些 许 的 讽 刺 ） 哦 ， 他 是 个 不 错 的 战 士 。 我 从 来 不 会 想 要 跟 他 打 。
	AI_Output(self, other, "DIA_Sylvio_AboutLee_09_02"); //（ 冷 冰 冰 的 ） 当 然 ， 除 非 那 是 不 可 避 免 的 。

	Sylvio_angequatscht = Sylvio_angequatscht + 1;
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				  MenDefeated
// ************************************************************
instance DIA_Sylvio_MenDefeated(C_INFO)
{
	npc				= SLD_806_Sylvio;
	nr				= 5;
	condition		= DIA_Sylvio_MenDefeated_Condition;
	information		= DIA_Sylvio_MenDefeated_Info;
	important		= TRUE;
};

func int DIA_Sylvio_MenDefeated_Condition()
{
	var int victories;
	victories = 0;
	if (Rod.aivar[AIV_DefeatedByPlayer] == TRUE) { victories = victories + 1; };
	if (Sentenza.aivar[AIV_DefeatedByPlayer] == TRUE) { victories = victories + 1; };
	if (Fester.aivar[AIV_DefeatedByPlayer] == TRUE) { victories = victories + 1; };
	if (Raoul.aivar[AIV_DefeatedByPlayer] == TRUE) { victories = victories + 1; };
	if (Bullco.aivar[AIV_DefeatedByPlayer] == TRUE) { victories = victories + 1; };
	if ((MIS_Jarvis_SldKO != FALSE)
	&& (victories >= 2))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_MenDefeated_Info()
{
	AI_Output(self, other, "DIA_Sylvio_MenDefeated_09_00"); //有 件 事 引 起 了 我 的 注 意 ： 你 对 我 们 的 人 怀 恨 在 心 ！
	AI_Output(self, other, "DIA_Sylvio_MenDefeated_09_01"); //据 我 所 知 ，你 是 李 的 手 下 之 一 。
	AI_Output(self, other, "DIA_Sylvio_MenDefeated_09_02"); //我 是 在 警 告 你 ！ 很 快 ， 这 里 有 几 件 事 情 发 生 变 化 ， 那 时 ， 我 们 再 谈 这 件 事 ！

	Sylvio_MenDefeated = TRUE;

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				 Asshole
// ************************************************************
instance DIA_Sylvio_Asshole(C_INFO)
{
	npc				= SLD_806_Sylvio;
	nr				= 2;
	condition		= DIA_Sylvio_Asshole_Condition;
	information		= DIA_Sylvio_Asshole_Info;
	description		= "嘿 ， 混 蛋 … …";
};

func int DIA_Sylvio_Asshole_Condition()
{
	if (Sylvio_angequatscht >= 1)
	{
		return TRUE;
	};
};

func void DIA_Sylvio_Asshole_Info()
{
	AI_Output(other, self, "DIA_Sylvio_Asshole_15_00"); //嘿 ， 混 蛋 … …
	AI_Output(self, other, "DIA_Sylvio_Asshole_09_01"); //你 不 是 真 的 以 为 我 会 跟 你 进 行 一 场 决 斗 吧 ？
	AI_Output(self, other, "DIA_Sylvio_Asshole_09_02"); //爬 回 你 的 石 头 下 面 去 吧 。

	Sylvio_angequatscht = Sylvio_angequatscht + 1;

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_SylvioSLD_PICKPOCKET(C_INFO)
{
	npc				= SLD_806_Sylvio;
	nr				= 900;
	condition		= DIA_SylvioSLD_PICKPOCKET_Condition;
	information		= DIA_SylvioSLD_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_SylvioSLD_PICKPOCKET_Condition()
{
	C_Beklauen(80, 210);
};

func void DIA_SylvioSLD_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_SylvioSLD_PICKPOCKET);
	Info_AddChoice(DIA_SylvioSLD_PICKPOCKET, DIALOG_BACK, DIA_SylvioSLD_PICKPOCKET_BACK);
	Info_AddChoice(DIA_SylvioSLD_PICKPOCKET, DIALOG_PICKPOCKET, DIA_SylvioSLD_PICKPOCKET_DoIt);
};

func void DIA_SylvioSLD_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_SylvioSLD_PICKPOCKET);
};

func void DIA_SylvioSLD_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_SylvioSLD_PICKPOCKET);
};
