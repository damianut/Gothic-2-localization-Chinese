///////////////////////////////////////////////////////////////////////
//	Info hello
///////////////////////////////////////////////////////////////////////
instance DIA_Schwarzmagier_HELLO(C_INFO)
{
	npc				= DMT_1299_OberDementor_DI;
	nr				= 5;
	condition		= DIA_Schwarzmagier_HELLO_Condition;
	information		= DIA_Schwarzmagier_HELLO_Info;
	important		= TRUE;
};

func int DIA_Schwarzmagier_HELLO_Condition()
{
	return TRUE;
};

var int SC_KnowsMadPsi;
func void DIA_Schwarzmagier_HELLO_Info()
{
	AI_Output(self, other, "DIA_Schwarzmagier_HELLO_09_00"); //那 么 你 这 讨 厌 的 可 怜 虫 ， 你 真 的 胆 敢 来 到 主 人 的 门 前 。
	AI_Output(other, self, "DIA_Schwarzmagier_HELLO_15_01"); //你 就 是 那 个 在 幕 后 操 纵 的 人 ？
	AI_Output(self, other, "DIA_Schwarzmagier_HELLO_09_02"); //我 是 伊 尔 多 拉 斯 大 厅 的 守 护 者 。 世 上 最 强 的 贝 利 尔 力 量 的 源 泉 。 主 人 的 神 力 在 我 手 中 流 淌 。
	AI_Output(self, other, "DIA_Schwarzmagier_HELLO_09_03"); //只 要 我 说 一 句 话 ， 你 将 会 坠 入 永 恒 的 疯 狂 。
	AI_Output(other, self, "DIA_Schwarzmagier_HELLO_15_04"); //我 明 白 。 我 想 我 必 须 消 灭 另 外 一 个 中 间 人 。

	B_LogEntry(TOPIC_HallenVonIrdorath, TOPIC_HallenVonIrdorath_9);

	Info_ClearChoices(DIA_Schwarzmagier_HELLO);

	Info_AddChoice(DIA_Schwarzmagier_HELLO, "把 我 带 到 你 的 主 人 那 里 去 。", DIA_Schwarzmagier_HELLO_meister);
	Info_AddChoice(DIA_Schwarzmagier_HELLO, "我 还 要 杀 多 少 像 你 们 这 样 的 人 ？", DIA_Schwarzmagier_HELLO_dmt);
	Info_AddChoice(DIA_Schwarzmagier_HELLO, "在 那 里 那 扇 巨 大 的 传 送 门 后 面 隐 藏 着 什 么 ？", DIA_Schwarzmagier_HELLO_hinterTor);
	Info_AddChoice(DIA_Schwarzmagier_HELLO, "谁 是 你 的 主 人 ？", DIA_Schwarzmagier_HELLO_wer);

	if (SC_KnowsMadPsi == TRUE)
	{
		Info_AddChoice(DIA_Schwarzmagier_HELLO, "你 以 前 是 沉 睡 者 的 追 随 者 。", DIA_Schwarzmagier_HELLO_schlaefer);
	};
};

func void DIA_Schwarzmagier_HELLO_wer()
{
	AI_Output(other, self, "DIA_Schwarzmagier_HELLO_wer_15_00"); //谁 是 你 的 主 人 ？
	AI_Output(self, other, "DIA_Schwarzmagier_HELLO_wer_09_01"); //他 是 在 世 界 之 间 的 徘 徊 者 。 他 的 神 圣 智 慧 启 发 着 我 们 。
	AI_Output(self, other, "DIA_Schwarzmagier_HELLO_wer_09_02"); //他 是 贝 利 尔 选 中 的 人 ， 将 把 整 个 王 国 从 英 诺 斯 那 些 可 怜 的 追 随 者 手 中 解 放 出 来 。
	AI_Output(self, other, "DIA_Schwarzmagier_HELLO_wer_09_03"); //他 把 死 亡 带 给 所 有 那 些 怀 疑 他 的 荣 耀 的 人 。
	AI_Output(other, self, "DIA_Schwarzmagier_HELLO_wer_15_04"); //听 起 来 很 熟 悉 。
};

func void DIA_Schwarzmagier_HELLO_hinterTor()
{
	AI_Output(other, self, "DIA_Schwarzmagier_HELLO_hinterTor_15_00"); //在 那 里 那 扇 巨 大 的 传 送 门 后 面 隐 藏 着 什 么 ？
	AI_Output(self, other, "DIA_Schwarzmagier_HELLO_hinterTor_09_01"); //（ 大 笑 ） 我 的 主 人 的 房 间 是 你 无 法 进 入 的 。 我 不 会 给 你 打 开 大 门 的 机 会 。
};

func void DIA_Schwarzmagier_HELLO_schlaefer()
{
	AI_Output(other, self, "DIA_Schwarzmagier_HELLO_schlaefer_15_00"); //你 以 前 是 沉 睡 者 的 追 随 者 。
	AI_Output(self, other, "DIA_Schwarzmagier_HELLO_schlaefer_09_01"); //那 是 遥 远 的 过 去 。 主 人 已 经 开 启 了 我 们 的 眼 睛 。 现 在 没 人 能 阻 止 我 们 。
	AI_Output(self, other, "DIA_Schwarzmagier_HELLO_schlaefer_09_02"); //主 人 已 经 告 诉 我 们 解 决 你 们 这 些 异 教 徒 唯 一 的 方 法 。

	TOPIC_END_DEMENTOREN = TRUE;
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Schwarzmagier_HELLO_dmt()
{
	AI_Output(other, self, "DIA_Schwarzmagier_HELLO_dmt_15_00"); //我 还 要 杀 多 少 象 你 们 这 样 的 人 ？
	AI_Output(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_01"); //我 们 非 常 多 。 你 不 知 道 等 待 这 自 由 时 刻 的 我 们 究 竟 有 多 少 。
	AI_Output(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_02"); //当 我 们 进 入 这 个 世 界 时 ， 悲 哀 的 哭 号 会 象 潮 水 一 样 在 大 地 上 蔓 延 。
	AI_Output(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_03"); //把 这 个 世 界 从 那 些 自 称 是 火 焰 守 护 者 的 野 蛮 人 手 中 解 放 出 来 。 我 们 在 神 殿 这 里 的 集 合 不 会 持 续 多 久 了 。
	AI_Output(other, self, "DIA_Schwarzmagier_HELLO_dmt_15_04"); //是 。
};

func void DIA_Schwarzmagier_HELLO_meister()
{
	Wld_PlayEffect("DEMENTOR_FX", hero, hero, 0, 0, 0, FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_RED", self, self, 0, 0, 0, FALSE);
	Wld_PlayEffect("FX_EarthQuake", self, self, 0, 0, 0, FALSE);
	Wld_PlayEffect("SFX_Circle", self, self, 0, 0, 0, FALSE);
	AI_PlayAni(self, "T_PRACTICEMAGIC5");
	AI_Output(self, other, "DIA_Schwarzmagier_HELLO_meister_09_00"); //（ 威 胁 ） 傻 话 说 够 了 吧 ！ 我 要 消 灭 你 。
	AI_Output(self, other, "DIA_Schwarzmagier_HELLO_meister_09_01"); //你 的 视 线 将 会 模 糊 ， 你 的 灵 魂 将 消 失 在 黑 暗 之 中 。

	if (Npc_HasItems(other, ItAm_Prot_BlackEye_Mis))
	{
		AI_Output(other, self, "DIA_Schwarzmagier_HELLO_meister_15_02"); //（ 自 言 自 语 ） 没 有 那 个 灵 魂 召 唤 护 身 符 ， 我 现 在 遇 到 严 重 的 问 题 了 。
	}
	else
	{
		hero.attribute[ATR_MANA] = 0;

		if (hero.attribute[ATR_HITPOINTS] > 50)
		{
			hero.attribute[ATR_HITPOINTS] = ((hero.attribute[ATR_HITPOINTS]) / 2);
		};

		SC_ObsessionCounter = 100;
		B_SCIsObsessed(hero);
	};

	Info_ClearChoices(DIA_Schwarzmagier_HELLO);
	Info_AddChoice(DIA_Schwarzmagier_HELLO, DIALOG_ENDE, DIA_Schwarzmagier_HELLO_back);
};

func void DIA_Schwarzmagier_HELLO_back()
{
	AI_StopProcessInfos(self);
	Wld_StopEffect("DEMENTOR_FX");
	self.flags = 0;
	Snd_Play("MFX_FEAR_CAST");
	B_Attack(self, other, AR_SuddenEnemyInferno, 1);
};
