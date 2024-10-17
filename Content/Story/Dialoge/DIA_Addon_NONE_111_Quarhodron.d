///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Quarhodron_EXIT(C_INFO)
{
	npc				= NONE_ADDON_111_Quarhodron;
	nr				= 999;
	condition		= DIA_Addon_Quarhodron_EXIT_Condition;
	information		= DIA_Addon_Quarhodron_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Quarhodron_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Quarhodron_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Quarhodron_Hello(C_INFO)
{
	npc				= NONE_ADDON_111_Quarhodron;
	nr				= 5;
	condition		= DIA_Addon_Quarhodron_Hello_Condition;
	information		= DIA_Addon_Quarhodron_Hello_Info;
	permanent		= TRUE;
	important		= TRUE;
};

var int DIA_Addon_Quarhodron_Hello_NoPerm;
func int DIA_Addon_Quarhodron_Hello_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (DIA_Addon_Quarhodron_Hello_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Quarhodron_Hello_Info()
{
	if ((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	|| (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	|| (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE))
	{
		AI_Output(self, other, "DIA_Addon_Quarhodron_Hello_11_00"); //你 为 什 么 打 扰 我 休 息 ， 守 卫 者 ？
		AI_Output(self, other, "DIA_Addon_Quarhodron_Hello_11_01"); //（ 生 气 ） 告 诉 我 ， 你 想 要 什 么 ？

		Info_ClearChoices(DIA_Addon_Quarhodron_Hello);
		Info_AddChoice(DIA_Addon_Quarhodron_Hello, "亚 达 诺 斯 神 殿 有 什 么 ？", DIA_Addon_Quarhodron_Hello_schwert);
		Info_AddChoice(DIA_Addon_Quarhodron_Hello, "有 人 进 入 了 亚 达 诺 斯 神 殿 。", DIA_Addon_Quarhodron_Hello_raven);
		Info_AddChoice(DIA_Addon_Quarhodron_Hello, "授 权 我 进 入 亚 达 诺 斯 神 殿 。", DIA_Addon_Quarhodron_Hello_tempel);
		Info_AddChoice(DIA_Addon_Quarhodron_Hello, "这 个 地 区 受 到 了 地 震 的 影 响 。", DIA_Addon_Quarhodron_Hello_erdbeben);
		DIA_Addon_Quarhodron_Hello_NoPerm = TRUE;
		Npc_RemoveInvItems(hero, ItWr_Addon_SUMMONANCIENTGHOST, 1); // Joly: sonst gammelt das ding unnütz herum.
		SC_TalkedToGhost = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Quarhodron_Hello_11_02"); //Bengla anthani, Osiri?
		B_Say(other, self, "$CANTUNDERSTANDTHIS");
		AI_Output(self, other, "DIA_Addon_Quarhodron_Hello_11_03"); //（ 大 声 的 ）Bengla anthani？
		AI_StopProcessInfos(self);
	};
};

var int DIA_Addon_Quarhodron_Hello_ChoiceCounter;
var int B_Quarhodron_Hello_KommZumPunkt_OneTime;
func void B_Quarhodron_Hello_KommZumPunkt()
{
	if ((DIA_Addon_Quarhodron_Hello_ChoiceCounter >= 3)
	&& (B_Quarhodron_Hello_KommZumPunkt_OneTime == FALSE))
	{
		Info_AddChoice(DIA_Addon_Quarhodron_Hello, "祖 先 的 智 慧 是 无 法 抵 抗 的 。", DIA_Addon_Quarhodron_Hello_frech);
		B_Quarhodron_Hello_KommZumPunkt_OneTime = TRUE;
	};
};

func void DIA_Addon_Quarhodron_Hello_erdbeben()
{
	AI_Output(other, self, "DIA_Addon_Quarhodron_Hello_erdbeben_15_00"); //这 片 陆 地 遭 到 地 震 的 困 扰 。 我 们 必 须 做 些 什 么 ， 否 则 整 个 岛 屿 将 会 沉 入 大 海 。
	AI_Output(self, other, "DIA_Addon_Quarhodron_Hello_erdbeben_11_01"); //我 们 什 么 也 做 不 了 。
	AI_Output(self, other, "DIA_Addon_Quarhodron_Hello_erdbeben_11_02"); //亚 达 诺 斯 的 愤 怒 已 经 降 临 在 加 肯 达 上 方 ， 惩 罚 那 些 异 教 徒 。
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt();
};

func void DIA_Addon_Quarhodron_Hello_raven()
{
	AI_Output(other, self, "DIA_Addon_Quarhodron_Hello_raven_15_00"); //有 人 进 入 了 亚 达 诺 斯 神 殿 。
	AI_Output(self, other, "DIA_Addon_Quarhodron_Hello_raven_11_01"); //荒 谬 。 我 亲 自 封 印 了 那 扇 门 。 不 可 能 再 通 过 它 。
	AI_Output(other, self, "DIA_Addon_Quarhodron_Hello_raven_15_02"); //真 的 ？
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt();
};

func void DIA_Addon_Quarhodron_Hello_tempel()
{
	AI_Output(other, self, "DIA_Addon_Quarhodron_Hello_tempel_15_00"); //授 权 我 进 入 亚 达 诺 斯 神 殿 。
	AI_Output(self, other, "DIA_Addon_Quarhodron_Hello_tempel_11_01"); //神 殿 将 永 远 保 持 封 闭 。 我 们 在 议 会 里 那 么 决 定 的 。
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt();
};

func void DIA_Addon_Quarhodron_Hello_schwert()
{
	AI_Output(other, self, "DIA_Addon_Quarhodron_Hello_schwert_15_00"); //亚 达 诺 斯 神 殿 有 什 么 ？
	AI_Output(self, other, "DIA_Addon_Quarhodron_Hello_schwert_11_01"); //我 极 其 悲 哀 ， 我 极 其 失 望 。
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt();
};

func void DIA_Addon_Quarhodron_Hello_frech()
{
	AI_Output(other, self, "DIA_Addon_Quarhodron_Hello_frech_15_00"); //祖 先 的 智 慧 是 无 法 抵 抗 的 。
	AI_Output(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_01"); //你 那 样 身 份 的 人 不 能 如 此 对 我 说 话 。
	AI_Output(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_02"); //我 无 法 摆 脱 那 种 印 象 ， 你 并 非 你 正 在 扮 演 的 那 个 人 。
	AI_Output(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_03"); //如 果 你 需 要 我 的 帮 助 ， 你 必 须 首 先 向 我 证 明 你 自 己 。
	AI_Output(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_04"); //回 答 我 的 问 题 ， 那 样 我 也 许 能 确 定 我 并 没 有 暴 露 给 陌 生 人 。

	Log_CreateTopic(TOPIC_Addon_Quarhodron, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Quarhodron, TOPIC_Addon_Quarhodron_3);

	Info_ClearChoices(DIA_Addon_Quarhodron_Hello);
};

///////////////////////////////////////////////////////////////////////
//	Info Fragen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Quarhodron_Fragen(C_INFO)
{
	npc				= NONE_ADDON_111_Quarhodron;
	nr				= 5;
	condition		= DIA_Addon_Quarhodron_Fragen_Condition;
	information		= DIA_Addon_Quarhodron_Fragen_Info;
	permanent		= TRUE;
	description		= "请 提 问 。";
};

func int DIA_Addon_Quarhodron_Fragen_Condition()
{
	if (QuarhodronIstZufrieden == FALSE)
	{
		return TRUE;
	};
};

var int Quarhodrons_NextQuestion;
var int QuarhodronIstZufrieden;
var int Quarhodrons_RichtigeAntworten;
const int Quarhodron_AlleFragenGestellt = 100;
var int B_Quarhodron_Fragen_ChoicesOneTime;

func void B_Quarhodron_TestFailed()
{
	AI_Output(self, other, "DIA_Addon_Quarhodron_TestFailed_11_00"); //你 那 错 误 的 答 案 透 露 了 你 邪 恶 的 动 机 。
	AI_Output(self, other, "DIA_Addon_Quarhodron_TestFailed_11_01"); //我 不 会 帮 助 你 。
	AI_StopProcessInfos(self);
};

func void B_Quarhodron_Fragen_Choices()
{
	B_LogEntry(TOPIC_Addon_Quarhodron, TOPIC_Addon_Quarhodron_4);

	if (Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	{
		B_Quarhodron_TestFailed();
	}
	else
	{
		if ((Quarhodrons_NextQuestion == 1)
		&& (Quarhodrons_RichtigeAntworten == 0))
		{
			AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_00"); //我 不 会 相 信 你 。
			AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_01"); //我 想 ， 只 有 等 你 决 定 告 诉 我 真 相 的 时 候 再 回 来 。
			AI_StopProcessInfos(self);
		}
		else
		{
			if (Quarhodrons_NextQuestion == 1)
			{
				if (B_Quarhodron_Fragen_ChoicesOneTime == FALSE)
				{
					AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_02"); //（ 沉 思 ） 你 已 经 使 用 死 亡 守 护 者 的 技 能 唤 醒 了 我 ， 那 是 事 实 。
					AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_03"); //（ 沉 思 ） 你 已 经 使 用 死 亡 守 护 者 的 技 能 唤 醒 了 我 ， 那 是 事 实 。
					AI_Output(self, other, "DIA_Addon_Quarhodron_Add_11_00"); //除 了 一 个 … …

					B_Quarhodron_Fragen_ChoicesOneTime = TRUE;
				};

				Quarhodrons_NextQuestion = 2;
			};

			if (Quarhodrons_NextQuestion == 7)
			{
				AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_04"); //谁 封 印 了 传 送 门 以 保 护 世 界 免 遭 邪 恶 ？
				B_LogEntry(TOPIC_Addon_Quarhodron, TOPIC_Addon_Quarhodron_5);
				Quarhodrons_NextQuestion = Quarhodron_AlleFragenGestellt;
			}
			else if (Quarhodrons_NextQuestion == 6)
			{
				AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_05"); //谁 缓 和 苦 难 并 治 疗 疾 病 ？
				B_LogEntry(TOPIC_Addon_Quarhodron, TOPIC_Addon_Quarhodron_6);
				Quarhodrons_NextQuestion = 7;
			}
			else if (Quarhodrons_NextQuestion == 5)
			{
				AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_06"); //谁 在 五 人 议 会 上 做 了 最 后 发 言 ？
				B_LogEntry(TOPIC_Addon_Quarhodron, TOPIC_Addon_Quarhodron_7);
				Quarhodrons_NextQuestion = 6;
			}
			else if (Quarhodrons_NextQuestion == 4)
			{
				AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_07"); //谁 把 邪 恶 带 到 我 们 这 里 ？
				B_LogEntry(TOPIC_Addon_Quarhodron, TOPIC_Addon_Quarhodron_8);
				Quarhodrons_NextQuestion = 5;
			}
			else if (Quarhodrons_NextQuestion == 3)
			{
				AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_08"); //谁 能 给 我 下 达 直 接 命 令 ？
				B_LogEntry(TOPIC_Addon_Quarhodron, TOPIC_Addon_Quarhodron_9);
				Quarhodrons_NextQuestion = 4;
			}
			else if (Quarhodrons_NextQuestion == 2)
			{
				AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_09"); //- － 谁 曾 经 在 敌 人 的 进 攻 中 保 护 了 加 肯 达 的 人 民 ？ - －
				B_LogEntry(TOPIC_Addon_Quarhodron, TOPIC_Addon_Quarhodron_10);
				Quarhodrons_NextQuestion = 3;
			};

			Info_ClearChoices(DIA_Addon_Quarhodron_Fragen);

			if (Quarhodrons_NextQuestion >= Quarhodron_AlleFragenGestellt)
			{
				Info_AddChoice(DIA_Addon_Quarhodron_Fragen, "我 不 可 能 知 道 那 些 。", DIA_Addon_Quarhodron_Fragen_NoPlan);
			}
			else
			{
				Info_AddChoice(DIA_Addon_Quarhodron_Fragen, "我 不 可 能 知 道 那 些 。", DIA_Addon_Quarhodron_Fragen_NoPlan);
			};

			Info_AddChoice(DIA_Addon_Quarhodron_Fragen, "学 者 。", DIA_Addon_Quarhodron_Fragen_gele);
			Info_AddChoice(DIA_Addon_Quarhodron_Fragen, "死 亡 守 护 者 。", DIA_Addon_Quarhodron_Fragen_totenw);
			Info_AddChoice(DIA_Addon_Quarhodron_Fragen, "牧 师 。", DIA_Addon_Quarhodron_Fragen_prie);
			Info_AddChoice(DIA_Addon_Quarhodron_Fragen, "战 士 阶 层 。", DIA_Addon_Quarhodron_Fragen_warr);
			Info_AddChoice(DIA_Addon_Quarhodron_Fragen, "治 疗 者 。", DIA_Addon_Quarhodron_Fragen_heiler);
		};
	};
};

var int DIA_Addon_Quarhodron_Fragen_Info_OneTime;

func void DIA_Addon_Quarhodron_Fragen_Info()
{
	Quarhodrons_NextQuestion = 0;
	Quarhodrons_RichtigeAntworten = 0;
	AI_Output(other, self, "DIA_Addon_Quarhodron_Fragen_15_00"); //请 提 问 。

	if (DIA_Addon_Quarhodron_Fragen_Info_OneTime == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_11_01"); //我 是 夸 霍 德 隆 ， 加 肯 达 的 老 军 阀 。
		AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_11_02"); //你 已 经 唤 醒 了 我 。

		DIA_Addon_Quarhodron_Fragen_Info_OneTime = TRUE;
	};

	AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_11_03"); //你 属 于 加 肯 达 的 哪 个 阶 级 ？

	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_warr()
{
	AI_Output(other, self, "DIA_Addon_Quarhodron_Fragen_warr_15_00"); //战 士 阶 层 。
	if (Quarhodrons_NextQuestion == 0) { Quarhodrons_NextQuestion = 1; };
	if (Quarhodrons_NextQuestion == 3) { Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1); };
	if (Quarhodrons_NextQuestion == 5) { Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1); };
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_prie()
{
	AI_Output(other, self, "DIA_Addon_Quarhodron_Fragen_prie_15_00"); //牧 师 。
	if (Quarhodrons_NextQuestion == 0) { Quarhodrons_NextQuestion = 1; };
	if (Quarhodrons_NextQuestion == 4) { Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1); };
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_gele()
{
	AI_Output(other, self, "DIA_Addon_Quarhodron_Fragen_gele_15_00"); //学 者 。
	if (Quarhodrons_NextQuestion == 0) { Quarhodrons_NextQuestion = 1; };
	if (Quarhodrons_NextQuestion == 6) { Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1); };
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_totenw()
{
	AI_Output(other, self, "DIA_Addon_Quarhodron_Fragen_totenw_15_00"); //死 亡 守 护 者 。
	if (Quarhodrons_NextQuestion == 0) { Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1); };
	if (Quarhodrons_NextQuestion == 0) { Quarhodrons_NextQuestion = 1; };
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_heiler()
{
	AI_Output(other, self, "DIA_Addon_Quarhodron_Fragen_heiler_15_00"); //治 疗 者 。
	if (Quarhodrons_NextQuestion == 0) { Quarhodrons_NextQuestion = 1; };
	if (Quarhodrons_NextQuestion == 7) { Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1); };
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_NoPlan()
{
	AI_Output(other, self, "DIA_Addon_Quarhodron_Fragen_NoPlan_15_00"); //我 不 知 道 。

	if ((Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	&& (Quarhodrons_RichtigeAntworten >= 6))
	{
		AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_NoPlan_11_01"); //好 。 我 相 信 你 并 将 帮 助 你 。
		QuarhodronIstZufrieden = TRUE;
		Info_ClearChoices(DIA_Addon_Quarhodron_Fragen);
	}
	else if (Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	{
		B_Quarhodron_TestFailed();
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_NoPlan_11_02"); //那 么 不 要 浪 费 我 的 时 间 。
		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info GibMirKey
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Quarhodron_GibMirKey(C_INFO)
{
	npc				= NONE_ADDON_111_Quarhodron;
	nr				= 5;
	condition		= DIA_Addon_Quarhodron_GibMirKey_Condition;
	information		= DIA_Addon_Quarhodron_GibMirKey_Info;
	description		= "（ 要 神 殿 的 钥 匙 ）";
};

func int DIA_Addon_Quarhodron_GibMirKey_Condition()
{
	if (QuarhodronIstZufrieden == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Quarhodron_GibMirKey_Info()
{
	AI_Output(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_00"); //现 在 听 好 。 一 个 非 常 邪 恶 的 家 伙 已 经 进 入 了 亚 达 诺 斯 神 殿 。
	AI_Output(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_01"); //如 果 你 不 能 立 刻 让 我 进 入 神 殿 的 话 ， 可 能 就 太 晚 了 ， 一 切 事 态 都 将 越 来 越 糟 。
	AI_Output(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_02"); //那 不 可 能 ！ 高 级 牧 师 克 哈 迪 蒙 和 我 是 加 肯 达 唯 一 知 道 如 何 打 开 亚 达 诺 神 殿 大 门 的 人 。
	AI_Output(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_03"); //嗯 。 那 么 一 定 是 你 的 朋 友 克 哈 迪 蒙 泄 密 了 。
	AI_Output(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_04"); //我 要 告 诉 你 ， 大 门 已 经 打 开 了 。 我 亲 眼 看 到 的 。
	AI_Output(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_05"); //嗯 ， 你 的 声 音 中 充 满 的 真 实 。 我 不 再 怀 疑 你 的 话 。
	AI_Output(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_06"); //我 希 望 如 此 。
	AI_Output(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_07"); //那 么 拿 上 密 码 ， 它 写 在 这 个 石 片 上 了 。 对 着 封 印 的 大 门 念 出 咒 语 ， 它 就 会 开 启 了 。
	CreateInvItems(self, ItMi_TempelTorKey, 1);
	B_GiveInvItems(self, other, ItMi_TempelTorKey, 1);
	AI_Output(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_08"); //（ 已 经 快 死 了 ） 我 的 时 间 没 了 。 唉 ， 我 不 能 再 帮 助 你 了 。
	AI_Output(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_09"); //（ 已 经 快 死 了 ） 但 是 记 住 ： 小 心 亚 达 诺 斯 的 房 间 。 否 则 你 难 逃 一 死 。
	AI_Output(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_10"); //等 等 。 那 房 间 是 怎 么 回 事 ？
	AI_Output(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_11"); //（ 已 经 快 死 了 ） 我 的 力 量 已 经 没 有 了 ， 再 会 ， 我 们 将 在 死 亡 国 度 见 面 。
	AI_StopProcessInfos(self);

	B_LogEntry(TOPIC_Addon_Quarhodron, TOPIC_Addon_Quarhodron_11);

	Log_CreateTopic(TOPIC_Addon_Kammern, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kammern, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Kammern, TOPIC_Addon_Kammern_1);

	Ghost_SCKnowsHow2GetInAdanosTempel = TRUE;
};
