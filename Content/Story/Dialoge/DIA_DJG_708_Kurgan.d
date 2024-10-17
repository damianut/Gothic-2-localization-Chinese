//*********************************************************************
//	Info EXIT
//*********************************************************************
instance DIA_Kurgan_EXIT(C_INFO)
{
	npc				= DJG_708_Kurgan;
	nr				= 999;
	condition		= DIA_Kurgan_EXIT_Condition;
	information		= DIA_Kurgan_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Kurgan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Kurgan_EXIT_Info()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(Biff, 400); // Joly: Damit Biff nicht sofort am Anfang Kohle einfordert.
};

//************************************************************************
//	Hello
//************************************************************************
instance DIA_Kurgan_HELLO(C_INFO)
{
	npc				= DJG_708_Kurgan;
	condition		= DIA_Kurgan_HELLO_Condition;
	information		= DIA_Kurgan_HELLO_Info;
	important		= TRUE;
};

func int DIA_Kurgan_HELLO_Condition()
{
	return TRUE;
};

func void DIA_Kurgan_HELLO_Info()
{
	AI_Output(self, other, "DIA_Kurgan_HELLO_01_00"); //嘿 ， 你 ！ 你 这 样 的 家 伙 应 该 留 神 他 们 向 哪 里 走 。
	AI_Output(other, self, "DIA_Kurgan_HELLO_15_01"); //你 想 要 对 我 说 什 么 ？
	AI_Output(self, other, "DIA_Kurgan_HELLO_01_02"); //我 是 说 ， 这 里 的 空 气 对 你 的 健 康 没 好 处 。 这 个 地 方 到 处 都 是 兽 人 和 怪 物 。
	AI_Output(self, other, "DIA_Kurgan_HELLO_01_03"); //更 不 用 提 那 些 龙 了 。 这 只 是 善 意 的 警 告 。
	B_LogEntry(TOPIC_Dragonhunter, TOPIC_Dragonhunter_7);
};

//**************************************************************************
//	Was sonst noch?
//**************************************************************************
instance DIA_Kurgan_ELSE(C_INFO)
{
	npc				= DJG_708_Kurgan;
	nr				= 0;
	condition		= DIA_Kurgan_ELSE_Condition;
	information		= DIA_Kurgan_ELSE_Info;
	description		= "你 能 告 诉 我 任 何 我 还 不 知 道 的 事 吗 ？";
};

func int DIA_Kurgan_ELSE_Condition()
{
	return TRUE;
};

func void DIA_Kurgan_ELSE_Info()
{
	AI_Output(other, self, "DIA_Kurgan_ELSE_15_00"); //你 能 告 诉 我 任 何 我 还 不 知 道 的 事 吗 ？
	AI_Output(self, other, "DIA_Kurgan_ELSE_01_01"); //我 可 以 给 你 一 条 好 的 建 议 ， 完 全 免 费 。
	AI_Output(self, other, "DIA_Kurgan_ELSE_01_02"); //我 们 这 里 不 需 要 那 种 听 到 最 小 的 龙 放 屁 的 声 音 就 会 晕 死 过 去 的 人 。
	AI_Output(self, other, "DIA_Kurgan_ELSE_01_03"); //回 家 吧 ， 这 项 工 作 是 给 真 正 的 男 人 的 。
};

//**************************************************************************
//	Bist du hier der Anführer?
//**************************************************************************
instance DIA_Kurgan_Leader(C_INFO)
{
	npc				= DJG_708_Kurgan;
	nr				= 0;
	condition		= DIA_Kurgan_Leader_Condition;
	information		= DIA_Kurgan_Leader_Info;
	description		= "你 是 这 里 的 头 吗 ？";
};

func int DIA_Kurgan_Leader_Condition()
{
	return TRUE;
};

func void DIA_Kurgan_Leader_Info()
{
	AI_Output(other, self, "DIA_Kurgan_Leader_15_00"); //你 是 这 里 的 头 吗 ？
	AI_Output(self, other, "DIA_Kurgan_Leader_01_01"); //我 看 起 来 像 吗 ？ 当 然 不 。 我 们 不 需 要 任 何 自 高 自 大 的 蠢 货 来 指 挥 我 们 。
	AI_Output(self, other, "DIA_Kurgan_Leader_01_02"); //当 席 尔 维 欧 想 要 扮 演 老 板 的 时 候 ， 我 们 向 他 和 他 的 朋 友 们 展 示 了 我 们 想 做 的 事 。
	AI_Output(self, other, "DIA_Kurgan_Leader_01_03"); //发 生 了 争 吵 。 最 后 ， 他 们 自 己 离 开 了 。
	AI_Output(self, other, "DIA_Kurgan_Leader_01_04"); //我 希 望 席 尔 维 欧 被 兽 人 吊 在 汤 锅 里 。
};

//**************************************************************************
//	Wolltet ihr nicht ein paar Drachen töten?
//**************************************************************************
instance DIA_Kurgan_KillDragon(C_INFO)
{
	npc				= DJG_708_Kurgan;
	nr				= 0;
	condition		= DIA_Kurgan_KillDragon_Condition;
	information		= DIA_Kurgan_KillDragon_Info;
	description		= "那 么 说 你 要 杀 龙 ？";
};

func int DIA_Kurgan_KillDragon_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Kurgan_Leader))
	{
		return TRUE;
	};
};

var int Kurgan_KillDragon_Day;
func void DIA_Kurgan_KillDragon_Info()
{
	AI_Output(other, self, "DIA_Kurgan_KillDragon_15_00"); //（ 嘲 弄 的 ） 那 么 你 想 要 杀 龙 ？
	AI_Output(self, other, "DIA_Kurgan_KillDragon_01_01"); //聪 明 家 伙 。 那 么 你 知 道 怎 么 干 掉 一 条 龙 吗 ？
	AI_Output(self, other, "DIA_Kurgan_KillDragon_01_02"); //你 以 为 当 你 要 砍 掉 它 的 脑 袋 时 ， 那 头 野 兽 只 会 安 静 地 坐 在 那 里 ？
	AI_Output(self, other, "DIA_Kurgan_KillDragon_01_03"); //那 种 事 需 要 妥 善 的 计 划 和 果 断 的 行 动 。
	AI_Output(other, self, "DIA_Kurgan_KillDragon_15_04"); //我 明 白 。 那 你 怎 么 着 手 去 做 ？
	AI_Output(self, other, "DIA_Kurgan_KillDragon_01_05"); //首 先 我 们 要 侦 察 清 楚 在 哪 里 能 找 到 那 种 野 兽 。
	AI_Output(self, other, "DIA_Kurgan_KillDragon_01_06"); //只 有 到 那 时 ， 我 们 才 会 考 虑 最 佳 的 进 攻 方 式 。

	Kurgan_KillDragon_Day = Wld_GetDay();

	Info_AddChoice(DIA_Kurgan_KillDragon, "我 很 愿 意 看 你 那 样 做 ， 不 过 我 必 须 走 自 己 的 路 。", DIA_Kurgan_KillDragon_weg);
	Info_AddChoice(DIA_Kurgan_KillDragon, "你 打 算 怎 么 穿 过 那 些 兽 人 ？", DIA_Kurgan_KillDragon_orks);
	Info_AddChoice(DIA_Kurgan_KillDragon, "我 想 你 即 使 连 一 头 瞎 掉 的 绵 羊 也 找 不 到 。", DIA_Kurgan_KillDragon_spott);
};

func void DIA_Kurgan_KillDragon_spott()
{
	AI_Output(other, self, "DIA_Kurgan_KillDragon_spott_15_00"); //我 想 你 即 使 连 一 头 瞎 掉 的 绵 羊 也 找 不 到 。
	AI_Output(self, other, "DIA_Kurgan_KillDragon_spott_01_01"); //什 么 ？ 你 想 让 我 打 扁 你 那 张 蠢 脸 ？
	AI_StopProcessInfos(self);

	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_Kurgan_KillDragon_orks()
{
	AI_Output(other, self, "DIA_Kurgan_KillDragon_orks_15_00"); //你 打 算 怎 么 穿 过 那 些 兽 人 ？
	AI_Output(self, other, "DIA_Kurgan_KillDragon_orks_01_01"); //我 们 以 后 再 担 心 那 些 细 节 。
};

func void DIA_Kurgan_KillDragon_weg()
{
	AI_Output(other, self, "DIA_Kurgan_KillDragon_weg_15_00"); //我 很 愿 意 看 你 那 样 做 ， 不 过 我 必 须 走 自 己 的 路 。
	AI_Output(self, other, "DIA_Kurgan_KillDragon_weg_01_01"); //回 关 卡 去 吧 。 否 则 你 可 能 会 失 去 一 两 条 肢 体 后 死 掉 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info SEENDRAGON
///////////////////////////////////////////////////////////////////////
instance DIA_Kurgan_SEENDRAGON(C_INFO)
{
	npc				= DJG_708_Kurgan;
	nr				= 0;
	condition		= DIA_Kurgan_SEENDRAGON_Condition;
	information		= DIA_Kurgan_SEENDRAGON_Info;
	permanent		= TRUE;
	description		= "你 已 经 见 到 龙 了 ？";
};

func int DIA_Kurgan_SEENDRAGON_Condition()
{
	if (Kurgan_KillDragon_Day <= (Wld_GetDay() - 2))
	{
		return TRUE;
	};
};

func void DIA_Kurgan_SEENDRAGON_Info()
{
	AI_Output(other, self, "DIA_Kurgan_SEENDRAGON_15_00"); //你 已 经 见 到 龙 了 ？
	AI_Output(self, other, "DIA_Kurgan_SEENDRAGON_01_01"); //现 在 还 没 有 。 但 是 那 野 兽 不 可 能 永 远 躲 着 。
};

//*********************************************************************
//	AllDragonsDead
//*********************************************************************
instance DIA_Kurgan_AllDragonsDead(C_INFO)
{
	npc				= DJG_708_Kurgan;
	nr				= 5;
	condition		= DIA_Kurgan_AllDragonsDead_Condition;
	information		= DIA_Kurgan_AllDragonsDead_Info;
	description		= "所 有 的 龙 都 死 了 。";
};

func int DIA_Kurgan_AllDragonsDead_Condition()
{
	if (MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Kurgan_AllDragonsDead_Info()
{
	AI_Output(other, self, "DIA_Kurgan_AllDragonsDead_15_00"); //所 有 的 龙 都 死 了 。
	AI_Output(self, other, "DIA_Kurgan_AllDragonsDead_01_01"); //哈 ， 那 应 该 让 谁 去 杀 死 他 们 ？ 圣 骑 士 ？
	AI_Output(other, self, "DIA_Kurgan_AllDragonsDead_15_02"); //我 。
	AI_Output(self, other, "DIA_Kurgan_AllDragonsDead_01_03"); //（ 大 笑 ） 哈 。 连 你 自 己 也 无 法 相 信 吧 。 别 烦 我 了 。
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Kurgan_PICKPOCKET(C_INFO)
{
	npc				= DJG_708_Kurgan;
	nr				= 900;
	condition		= DIA_Kurgan_PICKPOCKET_Condition;
	information		= DIA_Kurgan_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Kurgan_PICKPOCKET_Condition()
{
	C_Beklauen(34, 120);
};

func void DIA_Kurgan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Kurgan_PICKPOCKET);
	Info_AddChoice(DIA_Kurgan_PICKPOCKET, DIALOG_BACK, DIA_Kurgan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Kurgan_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Kurgan_PICKPOCKET_DoIt);
};

func void DIA_Kurgan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Kurgan_PICKPOCKET);
};

func void DIA_Kurgan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Kurgan_PICKPOCKET);
};
