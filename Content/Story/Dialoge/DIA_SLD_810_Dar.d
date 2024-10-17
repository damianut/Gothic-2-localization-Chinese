// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Dar_EXIT(C_INFO)
{
	npc				= SLD_810_Dar;
	nr				= 999;
	condition		= DIA_Dar_EXIT_Condition;
	information		= DIA_Dar_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Dar_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Dar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				   Hallo
// ************************************************************
instance DIA_Dar_Hallo(C_INFO)
{
	npc				= SLD_810_Dar;
	nr				= 1;
	condition		= DIA_Dar_Hallo_Condition;
	information		= DIA_Dar_Hallo_Info;
	description		= "你 在 那 里 吸 的 是 什 么 烟 ？";
};

func int DIA_Dar_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Dar_Hallo_Info()
{
	AI_Output(other, self, "DIA_Dar_Hallo_15_00"); //你 在 那 里 吸 的 是 什 么 烟 ？
	AI_Output(self, other, "DIA_Dar_Hallo_03_01"); //想 抽 一 口 烟 吗 ？

	Info_ClearChoices(DIA_Dar_Hallo);
	Info_AddChoice(DIA_Dar_Hallo, "不 。", DIA_Dar_Hallo_Nein);
	Info_AddChoice(DIA_Dar_Hallo, "当 然 。", DIA_Dar_Hallo_Ja);
};

func void DIA_Dar_Hallo_Ja()
{
	AI_Output(other, self, "DIA_Dar_Hallo_Ja_15_00"); //当 然 。
	CreateInvItem(other, itmi_joint);
	B_UseItem(other, itmi_joint);
	AI_Output(self, other, "DIA_Dar_Hallo_Ja_03_01"); //不 错 啊 ， 嗯 ？
	AI_Output(other, self, "DIA_Dar_Hallo_Ja_15_02"); //你 在 哪 里 弄 到 这 些 东 西 的 ？
	CreateInvItem(self, itmi_joint);
	B_UseItem(self, itmi_joint);
	AI_Output(self, other, "DIA_Dar_Hallo_Ja_03_03"); //（ 咧 着 嘴 笑 ） 我 有 我 的 门 路 。
	Info_ClearChoices(DIA_Dar_Hallo);
};

func void DIA_Dar_Hallo_Nein()
{
	AI_Output(other, self, "DIA_Dar_Hallo_Nein_15_00"); //不 。
	Info_ClearChoices(DIA_Dar_Hallo);
};

// ************************************************************
// 			  				   PERM
// ************************************************************
var int Dar_einmal;
instance DIA_Dar_PERM(C_INFO)
{
	npc				= SLD_810_Dar;
	nr				= 2;
	condition		= DIA_Dar_PERM_Condition;
	information		= DIA_Dar_PERM_Info;
	permanent		= TRUE;
	description		= "除 了 抽 烟 ， 你 还 干 点 什 么 别 的 事 ？";
};

func int DIA_Dar_PERM_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Dar_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Dar_PERM_Info()
{
	AI_Output(other, self, "DIA_Dar_PERM_15_00"); //除 了 抽 烟 ， 你 还 干 点 什 么 别 的 事 ？

	if ((Dar_LostAgainstCipher == TRUE)
	&& (Dar_einmal == FALSE))
	{
		AI_Output(self, other, "DIA_Dar_PERM_03_01"); //（ 讽 刺 ） 有 时 我 让 一 些 怀 着 报 复 心 的 抽 沼 生 草 的 家 伙 毒 打 我 。
		Dar_einmal = TRUE;
	}
	else // DEFAULT
	{
		AI_Output(self, other, "DIA_Dar_PERM_03_02"); //现 在 不 行 。
	};
};

// ************************************************************
// 			  				WannaJoin
// ************************************************************
instance DIA_Dar_WannaJoin(C_INFO)
{
	npc				= SLD_810_Dar;
	nr				= 3;
	condition		= DIA_Dar_WannaJoin_Condition;
	information		= DIA_Dar_WannaJoin_Info;
	description		= "我 想 要 加 入 雇 佣 兵 。 你 有 什 么 意 见 ？";
};

func int DIA_Dar_WannaJoin_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Dar_Hallo))
	&& (other.guild == GIL_NONE)
	&& (Dar_LostAgainstCipher == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dar_WannaJoin_Info()
{
	AI_Output(other, self, "DIA_Dar_WannaJoin_15_00"); //我 想 加 入 雇 佣 兵 。 你 介 意 吗 ？
	AI_Output(self, other, "DIA_Dar_WannaJoin_03_01"); //谁 会 在 意 。
};

// ************************************************************
// 			  				DuDieb
// ************************************************************
instance DIA_Dar_DuDieb(C_INFO)
{
	npc				= SLD_810_Dar;
	nr				= 4;
	condition		= DIA_Dar_DuDieb_Condition;
	information		= DIA_Dar_DuDieb_Info;
	description		= "希 弗 告 诉 我 ， 有 人 从 他 那 里 偷 走 了 一 包 沼 生 草 … …";
};

func int DIA_Dar_DuDieb_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Cipher_TradeWhat)) // von Diebstahl gehört
	&& (MIS_Cipher_Paket == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Dar_DuDieb_Info()
{
	AI_Output(other, self, "DIA_Dar_DuDieb_15_00"); //希 弗 告 诉 我 ， 有 人 从 他 那 里 偷 走 了 一 包 沼 生 草 … …
	AI_Output(self, other, "DIA_Dar_DuDieb_03_01"); //（ 笑 声 渐 弱 ， 象 白 痴 一 样 ）
	AI_Output(other, self, "DIA_Dar_DuDieb_15_02"); //关 于 那 个 ， 你 会 知 道 些 什 么 ？
	AI_Output(self, other, "DIA_Dar_DuDieb_03_03"); //（ 非 常 简 略 ） 不 。

	Dar_Verdacht = TRUE;
};

// ************************************************************
// 			  				WoPaket
// ************************************************************
instance DIA_Dar_WoPaket(C_INFO)
{
	npc				= SLD_810_Dar;
	nr				= 4;
	condition		= DIA_Dar_WoPaket_Condition;
	information		= DIA_Dar_WoPaket_Info;
	permanent		= TRUE;
	description		= "包 裹 在 哪 里 ？";
};

func int DIA_Dar_WoPaket_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Dar_DuDieb))
	&& (Dar_Dieb == FALSE)
	&& (MIS_Cipher_Paket == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Dar_WoPaket_Info()
{
	AI_Output(other, self, "DIA_Dar_WoPaket_15_00"); //（ 威 胁 ） 那 个 包 裹 在 哪 里 ？

	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self, other, "DIA_Dar_WoPaket_03_01"); //好 ， 好 ， 好 。 我 在 城 里 把 它 卖 给 一 个 流 浪 汉 了 。
		AI_Output(self, other, "DIA_Dar_WoPaket_03_02"); //是 在 港 口 那 里 。 我 记 不 起 他 的 样 子 了 。
		AI_Output(other, self, "DIA_Dar_WoPaket_15_03"); //你 是 不 是 还 想 再 挨 一 顿 揍 呢 ？
		AI_Output(self, other, "DIA_Dar_WoPaket_03_04"); //是 真 的 ， 伙 计 ， 我 那 时 已 经 喝 得 烂 醉 如 泥 。 我 真 的 一 点 点 都 不 知 道 那 个 家 伙 是 什 么 样 子 。
		AI_Output(self, other, "DIA_Dar_WoPaket_03_05"); //是 在 港 口 那 里 ， 靠 近 那 个 造 船 的 家 伙 那 里 。 我 只 记 得 这 么 多 了 。

		Dar_Dieb = TRUE;
		B_LogEntry(Topic_CipherPaket, Topic_CipherPaket_1);
	}
	else
	{
		AI_Output(self, other, "DIA_Dar_WoPaket_03_06"); //我 怎 么 知 道 ？
	};
};

// ************************************************************
// 			  				AufsMaul
// ************************************************************
instance DIA_Dar_AufsMaul(C_INFO)
{
	npc				= SLD_810_Dar;
	nr				= 5;
	condition		= DIA_Dar_AufsMaul_Condition;
	information		= DIA_Dar_AufsMaul_Info;
	description		= "我 要 把 你 打 倒 ！";
};

func int DIA_Dar_AufsMaul_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Dar_DuDieb))
	&& (Dar_Dieb == FALSE)
	&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST))
	{
		return TRUE;
	};
};

func void DIA_Dar_AufsMaul_Info()
{
	AI_Output(other, self, "DIA_Dar_AufsMaul_15_00"); //我 要 把 你 打 倒 ！
	AI_Output(self, other, "DIA_Dar_AufsMaul_03_01"); //放 松 点 。 我 醉 得 太 厉 害 不 能 跟 你 打 ！
	B_GiveInvItems(self, other, itmi_joint, 1);
	AI_Output(self, other, "DIA_Dar_AufsMaul_03_02"); //给 ， 先 抽 一 大 口 。
};

// ************************************************************
// 			  			Kameradenschwein
// ************************************************************
instance DIA_Dar_Kameradenschwein(C_INFO)
{
	npc				= SLD_810_Dar;
	nr				= 1;
	condition		= DIA_Dar_Kameradenschwein_Condition;
	information		= DIA_Dar_Kameradenschwein_Info;
	important		= TRUE;
};

func int DIA_Dar_Kameradenschwein_Condition()
{
	if (Dar_LostAgainstCipher == TRUE)
	{
		self.aivar[AIV_LastFightComment] = FALSE; // geht NUR bei ECHTER Important-Info!
		return TRUE;
	};
};

func void DIA_Dar_Kameradenschwein_Info()
{
	AI_Output(self, other, "DIA_Dar_Kameradenschwein_03_00"); //长 舌 妇 ！ 你 告 诉 希 弗 我 拿 了 他 的 沼 生 草 ！
	if ((Npc_KnowsInfo(other, DIA_Dar_WannaJoin))
	&& (other.guild == GIL_NONE))
	{
		AI_Output(self, other, "DIA_Dar_Kameradenschwein_03_01"); //我 才 不 会 给 你 投 票 。
	};
};

// ************************************************************
// 			  				Pilztabak
// ************************************************************
instance DIA_Dar_Pilztabak(C_INFO)
{
	npc				= SLD_810_Dar;
	nr				= 6;
	condition		= DIA_Dar_Pilztabak_Condition;
	information		= DIA_Dar_Pilztabak_Info;
	description		= "你 以 前 试 过 史 鲁 姆 烟 吗 ？";
};

func int DIA_Dar_Pilztabak_Condition()
{
	if (Npc_HasItems(other, Itmi_Pilztabak) > 0)
	{
		return TRUE;
	};
};

func void DIA_Dar_Pilztabak_Info()
{
	AI_Output(other, self, "DIA_Dar_Pilztabak_15_00"); //你 以 前 试 过 史 鲁 姆 烟 吗 ？
	AI_Output(self, other, "DIA_Dar_Pilztabak_03_01"); //听 起 来 很 有 趣 。 接 着 往 下 说 。
	B_GiveInvItems(other, self, Itmi_Pilztabak, 1);
	AI_Output(self, other, "DIA_Dar_Pilztabak_03_02"); //好 吧 ， 你 说 的 没 错 … …
	CreateInvItem(self, itmi_joint);
	B_UseItem(self, itmi_joint);
	AI_Output(self, other, "DIA_Dar_Pilztabak_03_03"); //你 自 己 曾 经 抽 过 这 种 东 西 吗 ？
	AI_Output(other, self, "DIA_Dar_Pilztabak_15_04"); //嗯 … …
	CreateInvItem(self, itmi_joint);
	B_UseItem(self, itmi_joint);
	AI_Output(self, other, "DIA_Dar_Pilztabak_03_05"); //有 还 是 没 有 ？
	AI_Output(other, self, "DIA_Dar_Pilztabak_15_06"); //我 一 直 有 点 忙 … …
	AI_Output(self, other, "DIA_Dar_Pilztabak_03_07"); //哦 ， 该 死 ！
	AI_PlayAni(self, "T_MAGRUN_2_HEASHOOT");
	AI_Output(self, other, "DIA_Dar_Pilztabak_03_08"); //神 圣 的 罗 巴 尔 ！
	AI_PlayAni(self, "T_HEASHOOT_2_STAND");
	AI_Output(self, other, "DIA_Dar_Pilztabak_03_09"); //那 种 东 西 对 身 体 非 常 有 害 ！ 千 万 不 要 试 ！
	B_GivePlayerXP(XP_Ambient);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 3
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************
instance DIA_Dar_KAP3_EXIT(C_INFO)
{
	npc				= SLD_810_Dar;
	nr				= 999;
	condition		= DIA_Dar_KAP3_EXIT_Condition;
	information		= DIA_Dar_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Dar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Dar_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 4
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************
instance DIA_Dar_KAP4_EXIT(C_INFO)
{
	npc				= SLD_810_Dar;
	nr				= 999;
	condition		= DIA_Dar_KAP4_EXIT_Condition;
	information		= DIA_Dar_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Dar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Dar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Orcring
///////////////////////////////////////////////////////////////////////
instance DIA_Dar_ORCRING(C_INFO)
{
	npc				= SLD_810_Dar;
	nr				= 4;
	condition		= DIA_Dar_ORCRING_Condition;
	information		= DIA_Dar_ORCRING_Info;
	description		= "看 来 ， 这 里 有 几 个 雇 佣 兵 不 见 了 。";
};

func int DIA_Dar_ORCRING_Condition()
{
	if (Kapitel >= 4)
	{
		return TRUE;
	};
};

func void DIA_Dar_ORCRING_Info()
{
	AI_Output(other, self, "DIA_Dar_ORCRING_15_00"); //看 来 ， 这 里 有 几 个 雇 佣 兵 不 见 了 。
	AI_Output(self, other, "DIA_Dar_ORCRING_03_01"); //当 然 。 是 这 样 。 席 尔 维 欧 早 就 走 远 了 ， 他 带 走 了 半 数 的 队 员 。
	AI_Output(self, other, "DIA_Dar_ORCRING_03_02"); //谁 在 乎 呢 。 我 有 了 更 好 的 机 会 成 为 李 的 人 。 我 只 需 要 最 后 一 下 。
	AI_Output(self, other, "DIA_Dar_ORCRING_03_03"); //如 果 我 能 证 明 我 是 一 个 真 正 的 好 汉 ， 也 许 我 甚 至 能 成 为 李 的 保 镖 之 一 。

	Info_ClearChoices(DIA_Dar_ORCRING);
	Info_AddChoice(DIA_Dar_ORCRING, "那 与 我 无 关 。", DIA_Dar_ORCRING_no);
	Info_AddChoice(DIA_Dar_ORCRING, "硬 汉 ？ 你 ？", DIA_Dar_ORCRING_necken);

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF))
	{
		Info_AddChoice(DIA_Dar_ORCRING, "那 应 该 是 什 么 样 子 ？", DIA_Dar_ORCRING_wie);
	};
};

func void DIA_Dar_ORCRING_necken()
{
	AI_Output(other, self, "DIA_Dar_ORCRING_necken_15_00"); //硬 汉 ？ 你 ？
	AI_Output(self, other, "DIA_Dar_ORCRING_necken_03_01"); //（ 愤 怒 的 ） 哦 ， 算 了 吧 ， 闭 嘴 。 你 以 为 你 是 谁 ？

	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self, other, "DIA_Dar_ORCRING_necken_03_02"); //城 里 来 的 趾 高 气 昂 的 傻 瓜 。 没 有 人 会 喜 欢 你 这 样 的 白 痴 。
	};

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Dar_ORCRING_necken_03_03"); //你 才 来 这 里 两 天 就 已 经 在 这 里 说 长 道 短 。
	};

	if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Dar_ORCRING_necken_03_04"); //你 想 用 那 个 什 么 魔 法 的 蠢 话 来 吓 谁 ？ 反 正 不 是 我 。
	};

	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self, other, "DIA_Dar_ORCRING_necken_03_05"); //现 在 我 在 想 ， 打 爆 你 的 头 会 让 李 的 人 对 我 肃 然 起 敬 。

		Info_ClearChoices(DIA_Dar_ORCRING);
		Info_AddChoice(DIA_Dar_ORCRING, "我 没 时 间 来 胡 说 八 道 。", DIA_Dar_ORCRING_necken_no);
		Info_AddChoice(DIA_Dar_ORCRING, "好 吧 。 那 就 试 试 。", DIA_Dar_ORCRING_necken_schlagen);
	}
	else
	{
		AI_Output(self, other, "DIA_Dar_ORCRING_necken_03_06"); //你 等 等 。 我 会 想 个 办 法 给 李 一 个 深 刻 的 印 象 。
	};
};

var int Dar_FightAgainstPaladin;
func void DIA_Dar_ORCRING_necken_schlagen()
{
	Dar_FightAgainstPaladin = TRUE;
	AI_Output(other, self, "DIA_Dar_ORCRING_necken_schlagen_15_00"); //好 吧 。 那 就 试 试 。
	AI_Output(self, other, "DIA_Dar_ORCRING_necken_schlagen_03_01"); //哦 哦 ， 我 等 不 及 了 。
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_Dar_ORCRING_necken_no()
{
	AI_Output(other, self, "DIA_Dar_ORCRING_necken_no_15_00"); //我 没 时 间 来 胡 说 八 道 。
	AI_Output(self, other, "DIA_Dar_ORCRING_necken_no_03_01"); //哦 ， 是 啊 。 那 个 杰 出 的 正 义 骑 士 ， 我 忘 了 。 太 糟 了 。 我 以 为 你 有 更 大 的 胆 量 呢 。
	AI_StopProcessInfos(self);
};

func void DIA_Dar_ORCRING_wie()
{
	AI_Output(other, self, "DIA_Dar_ORCRING_wie_15_00"); //那 应 该 是 什 么 样 子 ？
	AI_Output(self, other, "DIA_Dar_ORCRING_wie_03_01"); //我 不 确 定 。 某 些 种 类 的 兽 人 战 利 品 不 会 太 差 。
	AI_Output(self, other, "DIA_Dar_ORCRING_wie_03_02"); //像 某 种 从 兽 人 首 领 那 里 弄 到 的 勋 章 或 者 什 么 的 。 一 面 旗 子 、 一 个 臂 章 或 者 一 个 戒 指 、 或 者 诸 如 此 类 的 东 西 。
	AI_Output(self, other, "DIA_Dar_ORCRING_wie_03_03"); //量 太 少 的 话 我 不 能 给 人 留 下 任 何 印 象 。 这 个 很 明 显 。

	Log_CreateTopic(TOPIC_Dar_BringOrcEliteRing, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Dar_BringOrcEliteRing, LOG_RUNNING);
	B_LogEntry(TOPIC_Dar_BringOrcEliteRing, TOPIC_Dar_BringOrcEliteRing_1);

	MIS_Dar_BringOrcEliteRing = LOG_RUNNING;
	Info_ClearChoices(DIA_Dar_ORCRING);
};

func void DIA_Dar_ORCRING_no()
{
	AI_Output(other, self, "DIA_Dar_ORCRING_no_15_00"); //那 与 我 无 关 。
	AI_Output(self, other, "DIA_Dar_ORCRING_no_03_01"); //（ 愤 怒 的 ） 当 然 不 。 我 应 该 感 到 很 吃 惊 。
	Info_ClearChoices(DIA_Dar_ORCRING);
};

///////////////////////////////////////////////////////////////////////
//	Info FightagainstPalOver
///////////////////////////////////////////////////////////////////////
instance DIA_Dar_FIGHTAGAINSTPALOVER(C_INFO)
{
	npc				= SLD_810_Dar;
	nr				= 4;
	condition		= DIA_Dar_FIGHTAGAINSTPALOVER_Condition;
	information		= DIA_Dar_FIGHTAGAINSTPALOVER_Info;
	important		= TRUE;
};

func int DIA_Dar_FIGHTAGAINSTPALOVER_Condition()
{
	if ((Dar_FightAgainstPaladin == TRUE)
	&& ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Dar_FIGHTAGAINSTPALOVER_Info()
{
	AI_Output(self, other, "DIA_Dar_FIGHTAGAINSTPALOVER_03_00"); //好 的 ， 我 知 道 如 果 我 又 和 你 混 到 一 起 ， 李 会 很 不 高 兴 的 。
	AI_Output(self, other, "DIA_Dar_FIGHTAGAINSTPALOVER_03_01"); //我 不 想 在 这 里 树 敌 。 所 以 ， 我 们 还 是 忘 了 这 些 傻 话 吧 ， 行 吗 ？
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BringOrcEliteRing
///////////////////////////////////////////////////////////////////////
instance DIA_Dar_BRINGORCELITERING(C_INFO)
{
	npc				= SLD_810_Dar;
	nr				= 4;
	condition		= DIA_Dar_BRINGORCELITERING_Condition;
	information		= DIA_Dar_BRINGORCELITERING_Info;
	description		= "我 已 经 拿 到 了 你 要 想 要 的 兽 人 战 利 品 。";
};

func int DIA_Dar_BRINGORCELITERING_Condition()
{
	if ((MIS_Dar_BringOrcEliteRing == LOG_RUNNING)
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF))
	&& (Npc_HasItems(other, ItRi_OrcEliteRing)))
	{
		return TRUE;
	};
};

func void DIA_Dar_BRINGORCELITERING_Info()
{
	AI_Output(other, self, "DIA_Dar_BRINGORCELITERING_15_00"); //我 已 经 拿 到 了 你 要 想 要 的 兽 人 战 利 品 。
	AI_Output(self, other, "DIA_Dar_BRINGORCELITERING_03_01"); //你 给 我 的 是 什 么 东 西 ？
	AI_Output(other, self, "DIA_Dar_BRINGORCELITERING_15_02"); //兽 人 首 领 的 戒 指 。
	AI_Output(self, other, "DIA_Dar_BRINGORCELITERING_03_03"); //哦 ， 既 然 这 样 … … 你 想 要 什 么 作 为 交 换 ？
	MIS_Dar_BringOrcEliteRing = LOG_SUCCESS;

	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);

	Info_AddChoice(DIA_Dar_BRINGORCELITERING, "你 可 以 给 我 提 供 一 些 什 么 ？", DIA_Dar_BRINGORCELITERING_was);

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice(DIA_Dar_BRINGORCELITERING, "给 我 一 些 金 币 。", DIA_Dar_BRINGORCELITERING_geld);
	};
};

func void DIA_Dar_BRINGORCELITERING_geld()
{
	AI_Output(other, self, "DIA_Dar_BRINGORCELITERING_geld_15_00"); //给 我 一 些 金 币 。

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Dar_BRINGORCELITERING_geld_03_01"); //嗯 。600个 金 币 ？
		AI_Output(other, self, "DIA_Dar_BRINGORCELITERING_geld_15_02"); //你 说 什 么 ？
	};

	AI_Output(self, other, "DIA_Dar_BRINGORCELITERING_geld_03_03"); //好 吧 。 我 会 给 你1200个 金 币 作 为 交 换 。

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Dar_BRINGORCELITERING_geld_03_04"); //拿 走 或 者 留 下 这 个 戒 指 。
	};

	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING, "那 不 够 。", DIA_Dar_BRINGORCELITERING_geld_no);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING, "成 交 。", DIA_Dar_BRINGORCELITERING_geld_ok);
};

func void DIA_Dar_BRINGORCELITERING_geld_ok()
{
	AI_Output(other, self, "DIA_Dar_BRINGORCELITERING_geld_ok_15_00"); //一 言 为 定 。 戒 指 在 这 里 。
	B_GiveInvItems(other, self, ItRi_OrcEliteRing, 1);
	AI_Output(self, other, "DIA_Dar_BRINGORCELITERING_geld_ok_03_01"); //谢 谢 。 我 等 不 及 想 听 到 别 人 怎 么 说 它 。

	CreateInvItems(self, ItMi_Gold, 1200);
	B_GiveInvItems(self, other, ItMi_Gold, 1200);
	B_GivePlayerXP(XP_Dar_BringOrcEliteRing);

	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
};

func void DIA_Dar_BRINGORCELITERING_geld_no()
{
	AI_Output(other, self, "DIA_Dar_BRINGORCELITERING_geld_no_15_00"); //那 不 够 。
	AI_Output(self, other, "DIA_Dar_BRINGORCELITERING_geld_no_03_01"); //我 想 这 太 多 了 。 这 个 交 易 对 我 来 说 太 不 可 靠 。 不 要 见 怪 。
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
};

func void DIA_Dar_BRINGORCELITERING_was()
{
	AI_Output(other, self, "DIA_Dar_BRINGORCELITERING_was_15_00"); //你 可 以 给 我 提 供 一 些 什 么 ？
	AI_Output(self, other, "DIA_Dar_BRINGORCELITERING_was_03_01"); //要 不 就 拿 钱 ， 要 不 就 是 这 个 护 身 符 … … 嗯 ， 就 这 样 吧 ， 刚 刚 得 到 的 。
	AI_Output(self, other, "DIA_Dar_BRINGORCELITERING_was_03_02"); //它 能 增 加 你 的 敏 捷 。 我 自 己 已 经 试 过 了 。

	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING, "给 我 一 些 金 币 。", DIA_Dar_BRINGORCELITERING_geld);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING, "给 我 护 身 符 。", DIA_Dar_BRINGORCELITERING_was_am);
};

func void DIA_Dar_BRINGORCELITERING_was_am()
{
	AI_Output(other, self, "DIA_Dar_BRINGORCELITERING_was_am_15_00"); //给 我 护 身 符 。
	AI_Output(self, other, "DIA_Dar_BRINGORCELITERING_was_am_03_01"); //确 实 不 错 。 好 好 享 受 它 吧 。 那 就 把 戒 指 给 我 吧 。

	B_GiveInvItems(other, self, ItRi_OrcEliteRing, 1);
	CreateInvItems(self, ItAm_Dex_01, 1);
	B_GiveInvItems(self, other, ItAm_Dex_01, 1);
	B_GivePlayerXP(XP_Dar_BringOrcEliteRing);

	AI_Output(self, other, "DIA_Dar_BRINGORCELITERING_was_am_03_02"); //真 是 愉 快 。
	Info_ClearChoices(DIA_Dar_BRINGORCELITERING);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 5
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************
instance DIA_Dar_KAP5_EXIT(C_INFO)
{
	npc				= SLD_810_Dar;
	nr				= 999;
	condition		= DIA_Dar_KAP5_EXIT_Condition;
	information		= DIA_Dar_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Dar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Dar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 6
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************
instance DIA_Dar_KAP6_EXIT(C_INFO)
{
	npc				= SLD_810_Dar;
	nr				= 999;
	condition		= DIA_Dar_KAP6_EXIT_Condition;
	information		= DIA_Dar_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Dar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Dar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Dar_PICKPOCKET(C_INFO)
{
	npc				= SLD_810_Dar;
	nr				= 900;
	condition		= DIA_Dar_PICKPOCKET_Condition;
	information		= DIA_Dar_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Dar_PICKPOCKET_Condition()
{
	C_Beklauen(67, 35);
};

func void DIA_Dar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dar_PICKPOCKET);
	Info_AddChoice(DIA_Dar_PICKPOCKET, DIALOG_BACK, DIA_Dar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dar_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Dar_PICKPOCKET_DoIt);
};

func void DIA_Dar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Dar_PICKPOCKET);
};

func void DIA_Dar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dar_PICKPOCKET);
};
