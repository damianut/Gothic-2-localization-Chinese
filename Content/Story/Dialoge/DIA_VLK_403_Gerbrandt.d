// ************************************************************
// 			  				   EXIT
// ************************************************************

var int DIEGO_COMING;
// -------------------------
instance DIA_Gerbrandt_EXIT(C_INFO)
{
	npc				= VLK_403_Gerbrandt;
	nr				= 999;
	condition		= DIA_Gerbrandt_EXIT_Condition;
	information		= DIA_Gerbrandt_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Gerbrandt_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gerbrandt_EXIT_Info()
{
	if (DIEGO_COMING == TRUE)
	{
		DiegoNW = Hlp_GetNpc(PC_THIEF_NW);

		if (Diego_IsOnBoard == FALSE)
		{
			B_StartOtherRoutine(DiegoNW, "GERBRANDT");
		};

		// patch m.f. B_Startotherroutine raus und ersetzt durch Npc_exchange

		Npc_ExchangeRoutine(self, "NEWLIFE");
		B_StartOtherRoutine(GerbrandtsFrau, "NEWLIFE");

		DIEGO_COMING = 2; // Weder TRUE noch False
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Gerbrandt_PICKPOCKET(C_INFO)
{
	npc				= VLK_403_Gerbrandt;
	nr				= 900;
	condition		= DIA_Gerbrandt_PICKPOCKET_Condition;
	information		= DIA_Gerbrandt_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "（ 偷 他 的 钱 包 应 该 很 容 易 。 ）";
};

func int DIA_Gerbrandt_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItSe_GoldPocket100) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	&& (DIEGO_COMING != TRUE)) // NICHT, wenn Diego kommt
	{
		return TRUE;
	};
};

func void DIA_Gerbrandt_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gerbrandt_PICKPOCKET);
	Info_AddChoice(DIA_Gerbrandt_PICKPOCKET, DIALOG_BACK, DIA_Gerbrandt_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gerbrandt_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Gerbrandt_PICKPOCKET_DoIt);
};

func void DIA_Gerbrandt_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems(self, other, ItSe_GoldPocket100, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Gerbrandt_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Gerbrandt_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gerbrandt_PICKPOCKET);
};

// ************************************************************
// 			  				  Hallo
// ************************************************************
instance DIA_Gerbrandt_Hello(C_INFO)
{
	npc				= VLK_403_Gerbrandt;
	nr				= 5;
	condition		= DIA_Gerbrandt_Hello_Condition;
	information		= DIA_Gerbrandt_Hello_Info;
	description		= "你 在 这 里 干 什 么 ？";
};

func int DIA_Gerbrandt_Hello_Condition()
{
	if ((hero.guild != GIL_KDF)
	&& (hero.guild != GIL_PAL)
	&& (DIEGO_COMING == FALSE)) // nur BEVOR Diego kommt
	{
		return TRUE;
	};
};

func void DIA_Gerbrandt_Hello_Info()
{
	AI_Output(other, self, "DIA_Gerbrandt_Hello_15_00"); //你 在 这 里 干 什 么 ？
	AI_Output(self, other, "DIA_Gerbrandt_Hello_10_01"); //那 你 是 谁 ？ 看 来 你 是 新 来 的 ， 不 了 解 这 里 的 情 况 。
	AI_Output(self, other, "DIA_Gerbrandt_Hello_10_02"); //他 们 叫 我 哲 勃 兰 特 。 对 你 来 说 是 ： 哲 勃 兰 特 阁 下 ， 老 兄 。 明 白 吗 ？

	Info_ClearChoices(DIA_Gerbrandt_Hello);
	Info_AddChoice(DIA_Gerbrandt_Hello, "我 知 道 了 ， 哲 勃 兰 特 。", DIA_Gerbrandt_Hello_No);
	Info_AddChoice(DIA_Gerbrandt_Hello, "我 懂 了 ， 哲 勃 兰 特 先 生 。", DIA_Gerbrandt_Hello_Yes);
};

func void DIA_Gerbrandt_Hello_No()
{
	AI_Output(other, self, "DIA_Gerbrandt_Hello_No_15_00"); //我 知 道 了 ， 哲 勃 兰 特 。
	AI_Output(self, other, "DIA_Gerbrandt_Hello_No_10_01"); //小 心 你 的 大 嘴 巴 。 你 最 好 对 我 多 尊 敬 一 点 ， 否 则 你 在 这 里 会 遇 到 各 种 各 样 的 麻 烦 。
	AI_Output(self, other, "DIA_Gerbrandt_Hello_No_10_02"); //我 掌 管 这 里 。 谁 要 是 惹 了 麻 烦 就 必 须 接 受 我 的 质 询 ， 而 且 最 好 快 点 逃 出 城 去 ， 因 为 一 旦 我 收 拾 了 他 ， 他 会 希 望 从 来 没 碰 上 我 。
	AI_Output(self, other, "DIA_Gerbrandt_Hello_No_10_03"); //大 部 分 港 口 周 围 的 人 都 为 我 工 作 。 如 果 你 也 是 在 找 工 作 ， 你 最 好 要 确 保 我 对 你 的 印 象 不 错 。

	Info_ClearChoices(DIA_Gerbrandt_Hello);
};

func void DIA_Gerbrandt_Hello_Yes()
{
	AI_Output(other, self, "DIA_Gerbrandt_Hello_Yes_15_00"); //我 懂 了 ， 哲 勃 兰 特 先 生 。
	AI_Output(self, other, "DIA_Gerbrandt_Hello_Yes_10_01"); //至 少 你 很 快 就 了 解 了 这 里 的 状 况 。
	AI_Output(self, other, "DIA_Gerbrandt_Hello_Yes_10_02"); //一 旦 生 意 重 新 开 始 走 上 正 轨 ， 我 肯 定 需 要 你 这 样 魁 梧 的 小 伙 子 。
	AI_Output(self, other, "DIA_Gerbrandt_Hello_Yes_10_03"); //你 可 以 成 为 一 个 很 棒 的 仓 库 主 管 。
	AI_Output(self, other, "DIA_Gerbrandt_Hello_Yes_10_04"); //你 认 识 字 吗 ？

	Info_ClearChoices(DIA_Gerbrandt_Hello);
	Info_AddChoice(DIA_Gerbrandt_Hello, "不 。", DIA_Gerbrandt_Hello_Yes_No);
	Info_AddChoice(DIA_Gerbrandt_Hello, "我 不 想 找 工 作 。", DIA_Gerbrandt_Hello_NoJob);
	Info_AddChoice(DIA_Gerbrandt_Hello, "当 然 。", DIA_Gerbrandt_Hello_Yes_Yes);
};

func void DIA_Gerbrandt_Hello_Yes_No()
{
	AI_Output(other, self, "DIA_Gerbrandt_Hello_Yes_No_15_00"); //不 。
	AI_Output(self, other, "DIA_Gerbrandt_Hello_Yes_No_10_01"); //沒 关 系 ， 至 少 你 能 背 几 个 大 麻 袋 什 么 的 。
	AI_Output(self, other, "DIA_Gerbrandt_Hello_Yes_No_10_02"); //如 果 我 对 你 满 意 的 话 ， 我 甚 至 也 许 会 给 你 提 供 一 个 永 久 的 职 位 。 这 里 到 处 都 能 找 到 事 情 要 干 。
	AI_Output(self, other, "DIA_Gerbrandt_Hello_Yes_No_10_03"); //那 么 好 吧 ， 当 回 到 这 里 的 第 一 艘 船 靠 岸 时 ， 我 希 望 你 能 来 。

	Info_ClearChoices(DIA_Gerbrandt_Hello);
};

func void DIA_Gerbrandt_Hello_NoJob()
{
	AI_Output(other, self, "DIA_Gerbrandt_Hello_NoJob_15_00"); //我 不 想 找 工 作 。
	AI_Output(self, other, "DIA_Gerbrandt_Hello_NoJob_10_01"); //你 以 为 自 己 相 当 聪 明 。 注 意 ， 只 要 我 不 同 意 ， 就 没 有 人 能 在 这 里 找 到 活 干 。
	AI_Output(self, other, "DIA_Gerbrandt_Hello_NoJob_10_02"); //所 以 ， 如 果 你 再 对 我 说 这 些 无 礼 的 话 ， 就 得 找 一 个 长 满 臭 虫 的 稻 草 垫 子 去 睡 了 ， 因 为 你 只 买 的 起 那 种 东 西 。
	AI_Output(self, other, "DIA_Gerbrandt_Hello_NoJob_10_03"); //你 会 来 求 我 给 你 一 份 工 作 的 。

	Info_ClearChoices(DIA_Gerbrandt_Hello);
};

func void DIA_Gerbrandt_Hello_Yes_Yes()
{
	AI_Output(other, self, "DIA_Gerbrandt_Hello_Yes_Yes_15_00"); //当 然 。
	AI_Output(self, other, "DIA_Gerbrandt_Hello_Yes_Yes_10_01"); //好 ， 好 。 受 过 训 练 的 员 工 很 难 碰 到 。
	AI_Output(self, other, "DIA_Gerbrandt_Hello_Yes_Yes_10_02"); //你 的 介 绍 人 怎 么 样 ？
	AI_Output(other, self, "DIA_Gerbrandt_Hello_Yes_Yes_15_03"); //介 绍 人 ？
	AI_Output(self, other, "DIA_Gerbrandt_Hello_Yes_Yes_10_04"); //嗯 ， 我 得 记 住 你 的 脸 。 一 旦 生 意 恢 复 之 后 就 来 见 我 。 那 时 ， 我 可 能 正 好 有 活 儿 给 你 干 。

	Info_ClearChoices(DIA_Gerbrandt_Hello);
};

// ************************************************************
// 			  	Perm
// ************************************************************

func void B_GErbrandt_PissOff()
{
	AI_Output(self, other, "B_Gerbrandt_PissOff_10_00"); //那 是 怎 么 回 事 - 你 在 挖 苦 我 ？
	AI_Output(self, other, "B_Gerbrandt_PissOff_10_01"); //你 和 你 的 伙 伴 迪 雅 戈 已 经 造 成 了 太 多 的 破 坏 了 。
	AI_Output(self, other, "B_Gerbrandt_PissOff_10_02"); //别 打 扰 我 ！

	// Patch m.f. Wenn diego kommt und er wird gefragt, geht er nicht los, weil losgehen steht in exit info und durch diesen Ai_Stop wird das umgangen
	if (DIEGO_COMING != TRUE) // NICHT, wenn Diego kommt
	{
		AI_StopProcessInfos(self);
	};
};
instance DIA_Gerbrandt_Perm(C_INFO)
{
	npc				= VLK_403_Gerbrandt;
	nr				= 800;
	condition		= DIA_Gerbrandt_Perm_Condition;
	information		= DIA_Gerbrandt_Perm_Info;
	permanent		= TRUE;
	description		= "有 新 闻 吗 ？";
};

func int DIA_Gerbrandt_Perm_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Gerbrandt_Hello))
	{
		return TRUE;
	};
};

func void DIA_Gerbrandt_Perm_Info()
{
	AI_Output(other, self, "DIA_Gerbrandt_Perm_15_00"); //还 有 什 么 新 的 吗 ？

	if (Kapitel <= 2)
	{
		if ((hero.guild != GIL_KDF)
		&& (hero.guild != GIL_PAL))
		{
			AI_Output(self, other, "DIA_Gerbrandt_Perm_10_01"); //这 里 没 有 事 情 给 你 这 样 的 人 做 。 这 里 是 上 流 人 士 居 住 区 ， 不 是 流 浪 汉 或 者 骗 子 呆 的 地 方 。
			AI_Output(self, other, "DIA_Gerbrandt_Perm_10_02"); //如 果 你 将 来 在 财 富 和 名 望 方 面 取 得 了 成 功 ， 你 也 许 会 发 现 自 己 在 这 里 会 更 受 欢 迎 。
		}
		else
		{
			AI_Output(self, other, "DIA_Gerbrandt_Perm_10_03"); //我 不 能 抱 怨 ， 尊 敬 的 爵 士 。
		};
	}
	else if (Kapitel >= 3)
	{
		if (MIS_DiegosResidence != LOG_SUCCESS)
		{
			if ((hero.guild != GIL_KDF)
			&& (hero.guild != GIL_PAL))
			{
				AI_Output(self, other, "DIA_Gerbrandt_Perm_10_04"); //我 见 过 像 你 这 样 的 人 - 你 只 是 不 知 道 自 己 的 处 境 。
				AI_Output(self, other, "DIA_Gerbrandt_Perm_10_05"); //我 会 跟 总 督 谈 谈 关 于 针 对 城 市 富 人 区 采 取 适 当 保 安 措 施 的 事 情 。
			}
			else
			{
				AI_Output(self, other, "DIA_Gerbrandt_Perm_10_06"); //那 事 和 我 没 关 系 。 我 很 忙 ！
			};
		}
		else
		{
			B_Gerbrandt_PissOff();
		};
	};
};

// ################################
// ##
// ## Kapitel 3
// ##
// ################################
instance DIA_Gerbrandt_GreetingsFromDiego(C_INFO)
{
	npc				= VLK_403_Gerbrandt;
	nr				= 10;
	condition		= DIA_Gerbrandt_GreetingsFromDiego_Condition;
	information		= DIA_Gerbrandt_GreetingsFromDiego_Info;
	description		= "迪 雅 戈 问 你 好 。";
};

func int DIA_Gerbrandt_GreetingsFromDiego_Condition()
{
	if ((MIS_DiegosResidence == LOG_RUNNING)
	&& (Npc_HasItems(other, ItWr_DiegosLetter_MIS) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Gerbrandt_GreetingsFromDiego_Info()
{
	AI_Output(other, self, "DIA_Gerbrandt_GreetingsFromDiego_15_00"); //迪 雅 戈 问 你 好 。
	AI_Output(self, other, "DIA_Gerbrandt_GreetingsFromDiego_10_01"); //（ 恐 惧 的 ） 什 么 ？ 谁 ？ 什 么 迪 雅 戈 ？
	AI_Output(other, self, "DIA_Gerbrandt_GreetingsFromDiego_15_02"); //他 还 希 望 我 给 你 这 封 信 。

	B_GiveInvItems(other, self, ItWr_DiegosLetter_MIS, 1);
	B_UseFakeScroll();

	AI_Output(self, other, "DIA_Gerbrandt_GreetingsFromDiego_10_03"); //（ 激 动 的 ） 那 不 可 能 。 不 。 我 要 死 了 ！。
	AI_Output(self, other, "DIA_Gerbrandt_GreetingsFromDiego_10_04"); //（ 胆 怯 地 ） 那 么 ， 他 在 城 里 吗 ？
	AI_Output(other, self, "DIA_Gerbrandt_GreetingsFromDiego_15_05"); //谁 ？
	AI_Output(self, other, "DIA_Gerbrandt_GreetingsFromDiego_10_06"); //迪 雅 戈 ， 当 然 ！
	AI_Output(other, self, "DIA_Gerbrandt_GreetingsFromDiego_15_07"); //是 的 ， 我 很 快 就 会 在 这 里 跟 他 见 面 。
	AI_Output(self, other, "DIA_Gerbrandt_GreetingsFromDiego_10_08"); //（ 绝 望 的 ， 自 言 自 语 ） 那 么 ， 这 就 完 了 。 一 切 都 完 了 。
	AI_Output(self, other, "DIA_Gerbrandt_GreetingsFromDiego_10_09"); //我 没 有 时 间 了 ， 我 必 须 离 开 这 里 。 快 点 。 如 果 他 发 现 我 在 这 里 ， 我 就 死 定 了 。

	MIS_DiegosResidence = LOG_SUCCESS;

	B_GivePlayerXP(XP_DiegosResidence);

	DIEGO_COMING = TRUE;
};
