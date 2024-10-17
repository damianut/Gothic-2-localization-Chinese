///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Pablo_EXIT(C_INFO)
{
	npc				= Mil_319_Pablo;
	nr				= 999;
	condition		= DIA_Pablo_EXIT_Condition;
	information		= DIA_Pablo_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Pablo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pablo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Pablo_PICKPOCKET(C_INFO)
{
	npc				= Mil_319_Pablo;
	nr				= 900;
	condition		= DIA_Pablo_PICKPOCKET_Condition;
	information		= DIA_Pablo_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "（ 偷 他 的 钥 匙 有 如 儿 戏 ）";
};

func int DIA_Pablo_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_City_Tower_01) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (20 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Pablo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Pablo_PICKPOCKET);
	Info_AddChoice(DIA_Pablo_PICKPOCKET, DIALOG_BACK, DIA_Pablo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Pablo_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Pablo_PICKPOCKET_DoIt);
};

func void DIA_Pablo_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 20)
	{
		B_GiveInvItems(self, other, ItKe_City_Tower_01, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Pablo_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Pablo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Pablo_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info WANTED
///////////////////////////////////////////////////////////////////////
var int Pablo_belogen;
// --------------------
instance DIA_Pablo_WANTED(C_INFO)
{
	npc				= Mil_319_Pablo;
	nr				= 1;
	condition		= DIA_Pablo_WANTED_Condition;
	information		= DIA_Pablo_WANTED_Info;
	important		= TRUE;
};

func int DIA_Pablo_WANTED_Condition()
{
	if ((hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	&& (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Pablo_WANTED_Info()
{
	AI_Output(self, other, "DIA_Pablo_WANTED_12_00"); //嘿 ， 你 ， 等 一 下 - 你 看 起 来 很 眼 熟 。
	AI_Output(other, self, "DIA_Pablo_WANTED_15_01"); //你 想 要 什 么 ？
	AI_Output(self, other, "DIA_Pablo_WANTED_12_02"); //我 在 什 么 地 方 见 过 你 的 脸 … … 啊 - 对 了 ！
	B_UseFakeScroll();
	AI_Output(self, other, "DIA_Pablo_WANTED_12_03"); //给 - 我 几 天 前 在 一 些 强 盗 身 上 找 到 这 张 图 像 - 看 起 来 很 像 你 。
	B_GiveInvItems(self, other, ItWr_Poster_MIS, 1);
	AI_Output(self, other, "DIA_Pablo_WANTED_12_04"); //很 显 然 ， 那 些 家 伙 在 找 你 。

	Info_ClearChoices(DIA_Pablo_WANTED);

	Info_AddChoice(DIA_Pablo_WANTED, "不 ， 你 弄 错 了 。 ", DIA_Pablo_WANTED_NOTHING);
	Info_AddChoice(DIA_Pablo_WANTED, "哎 呀 ， 我 自 己 从 没 那 样 想 过", DIA_Pablo_WANTED_IRONY);
};

func void DIA_Pablo_WANTED_NOTHING()
{
	AI_Output(other, self, "DIA_Pablo_WANTED_NOTHING_15_00"); //不 ， 你 弄 错 了 。 我 很 好 啊 … …
	AI_Output(self, other, "DIA_Pablo_WANTED_NOTHING_12_01"); //随 便 你 怎 么 说 ， 陌 生 人 。
	// AI_Output(self, other, "DIA_Pablo_WANTED_NOTHING_12_02"); // Aber wenn du Probleme hast - dann lass sie außerhalb der Stadt. Wir haben hier schon genug Schwierigkeiten.
	AI_Output(self, other, "DIA_Pablo_Add_12_00"); //但 是 如 果 那 碰 巧 是 你 的 画 像 的 话 - 而 且 如 果 你 有 什 么 难 题 的 话 - 不 要 进 入 城 市 。 这 里 的 情 况 现 在 很 棘 手 。
	AI_Output(self, other, "DIA_Pablo_WANTED_NOTHING_12_03"); //那 些 把 麻 烦 带 进 城 的 人 不 会 在 这 里 呆 很 久 - 我 希 望 我 说 得 够 明 白 。
	Pablo_belogen = TRUE;

	AI_StopProcessInfos(self);
};

func void DIA_Pablo_WANTED_IRONY()
{
	AI_Output(other, self, "DIA_Pablo_WANTED_IRONY_15_00"); //哎 呀 ， 我 自 己 从 没 那 样 想 过 。
	AI_Output(self, other, "DIA_Pablo_WANTED_IRONY_12_01"); //非 常 有 意 思 … … 那 些 家 伙 想 从 你 身 上 得 到 什 么 ？
	// AI_Output(other, self, "DIA_Pablo_WANTED_IRONY_15_02"); // Ich werde sie fragen, wenn ich sie sehe. Ihr habt doch die Kerle eingelocht, die den Wisch dabei hatten, oder?
	AI_Output(other, self, "DIA_Pablo_Add_15_01"); //你 自 己 去 问 他 们 吧 。 你 已 经 把 他 们 锁 起 来 了 ， 是 吗 ？
	AI_Output(self, other, "DIA_Pablo_WANTED_IRONY_12_03"); //不 - 他 们 死 了 。
	AI_Output(other, self, "DIA_Pablo_WANTED_IRONY_15_04"); //那 么 我 想 我 们 永 远 也 不 会 知 道 了 。
	// AI_Output(self, other, "DIA_Pablo_WANTED_IRONY_12_05"); // Nun, wenn du in Schwierigkeiten steckst, dann sprich mal mit Lord Andre. Den Wisch kannst du behalten. Schönen Tag noch.
	AI_Output(self, other, "DIA_Pablo_Add_12_02"); //如 果 你 陷 入 了 某 些 麻 烦 的 话 - 去 找 安 德 烈 勋 爵 。 也 许 他 能 帮 助 你 。 你 可 以 在 兵 营 里 找 到 他 。

	AI_StopProcessInfos(self);
};

// *************************************************************
// 							Banditen
// *************************************************************
instance DIA_Pablo_Banditen(C_INFO)
{
	npc				= Mil_319_Pablo;
	nr				= 3;
	condition		= DIA_Pablo_Banditen_Condition;
	information		= DIA_Pablo_Banditen_Info;
	description		= "关 于 强 盗 你 知 道 些 什 么 ？";
};

func int DIA_Pablo_Banditen_Condition()
{
	return TRUE;
};

func void DIA_Pablo_Banditen_Info()
{
	AI_Output(other, self, "DIA_Pablo_Add_15_03"); //关 于 强 盗 你 知 道 些 什 么 ？
	// AI_Output(other, self, "DIA_Pablo_Banditen_15_00"); // Was weißt du über die Banditen, die vor der Stadt ihr Unwesen treiben?
	AI_Output(self, other, "DIA_Pablo_Add_12_04"); //他 们 都 来 自 那 个 该 死 的 矿 井 流 放 地 ， 但 是 分 成 了 几 个 团 体 。
	AI_Output(self, other, "DIA_Pablo_Add_12_05"); //有 一 些 躲 在 山 里 ， 另 外 一 些 加 入 了 地 主 欧 纳 尔 。
	AI_Output(self, other, "DIA_Pablo_Add_12_06"); //但 是 城 镇 外 面 的 强 盗 才 是 惹 麻 烦 最 多 的 。
	AI_Output(self, other, "DIA_Pablo_Add_12_07"); //他 们 是 造 成 那 些 雇 佣 兵 不 敢 跨 进 城 门 一 步 的 原 因 。
};

// *************************************************************
// 							HakonBandits
// *************************************************************
instance DIA_Pablo_HakonBandits(C_INFO)
{
	npc				= Mil_319_Pablo;
	nr				= 3;
	condition		= DIA_Pablo_HakonBandits_Condition;
	information		= DIA_Pablo_HakonBandits_Info;
	description		= "关 于 强 盗 抢 劫 商 人 哈 肯 的 事 你 知 道 些 什 么 ？";
};

func int DIA_Pablo_HakonBandits_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Hakon_Miliz))
	&& (Npc_KnowsInfo(other, DIA_Pablo_Banditen)))
	{
		return TRUE;
	};
};

func void DIA_Pablo_HakonBandits_Info()
{
	AI_Output(other, self, "DIA_Pablo_Add_15_20"); //关 于 强 盗 抢 劫 商 人 哈 肯 的 事 你 知 道 些 什 么 ？
	AI_Output(self, other, "DIA_Pablo_Add_12_21"); //哦 ， 那 样 的 事 ， 不 用 提 醒 我 … …
	AI_Output(self, other, "DIA_Pablo_Add_12_22"); //据 我 们 所 知 ， 他 们 对 多 次 针 对 商 人 的 攻 击 负 有 责 任 。

	AI_Output(self, other, "DIA_Pablo_Banditen_12_01"); //那 些 鼠 辈 们 已 经 缩 回 他 们 的 洞 里 ， 不 敢 再 出 来 了 。
	AI_Output(self, other, "DIA_Pablo_Banditen_12_02"); //有 一 次 ， 我 们 发 现 了 他 们 的 踪 迹 ， 并 跟 踪 了 他 们 。 但 是 我 们 的 追 击 在 城 外 的 森 林 里 中 断 了 。
	AI_Output(self, other, "DIA_Pablo_Banditen_12_03"); //那 里 有 非 常 多 的 野 兽 在 游 荡 ， 太 危 险 了 。

	B_LogEntry(TOPIC_HakonBanditen, TOPIC_HakonBanditen_1);

	if (Pablo_AndreMelden == FALSE)
	{
		AI_Output(self, other, "DIA_Pablo_Add_12_23"); //但 是 还 有 一 件 事 … …
		AI_Output(self, other, "DIA_Pablo_Banditen_12_04"); //一 些 被 盗 的 货 物 又 出 现 在 了 克 霍 里 尼 斯 。
		AI_Output(other, self, "DIA_Pablo_Banditen_15_05"); //这 就 意 味 着 ， 他 们 知 道 如 何 把 货 物 走 私 进 入 城 里 ， 并 出 售 它 们 … …
		AI_Output(self, other, "DIA_Pablo_Banditen_12_06"); //是 的 ， 我 们 怀 疑 在 城 里 有 一 个 销 赃 人 。 但 是 我 们 还 没 有 抓 到 那 个 家 伙 。
		AI_Output(self, other, "DIA_Pablo_Banditen_12_07"); //如 果 你 有 任 何 与 此 事 有 关 的 发 现 ， 记 住 安 德 烈 勋 爵 已 经 发 布 了 那 个 销 赃 人 的 悬 赏 令 。

		B_LogEntry(TOPIC_HakonBanditen, TOPIC_HakonBanditen_2);
	};
};

// *************************************************************
// 							MyBandits
// *************************************************************
instance DIA_Pablo_MyBandits(C_INFO)
{
	npc				= Mil_319_Pablo;
	nr				= 4;
	condition		= DIA_Pablo_MyBandits_Condition;
	information		= DIA_Pablo_MyBandits_Info;
	description		= "拿 着 我 的 通 缉 海 报 的 强 盗 从 哪 里 来 ？";
};

func int DIA_Pablo_MyBandits_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Pablo_Banditen))
	&& (Npc_KnowsInfo(other, DIA_Pablo_Wanted)))
	{
		return TRUE;
	};
};

func void DIA_Pablo_MyBandits_Info()
{
	AI_Output(other, self, "DIA_Pablo_Add_15_08"); //拿 着 我 的 通 缉 海 报 的 强 盗 从 哪 里 来 ？
	if (Pablo_belogen == TRUE)
	{
		AI_Output(self, other, "DIA_Pablo_Add_12_09"); //啊 哈 ！ 那 么 说 这 就 是 你 的 画 像 。 你 为 什 么 不 立 刻 承 认 呢 ， 嗯 ？
		AI_Output(self, other, "DIA_Pablo_Add_12_10"); //（ 询 问 的 ） 你 想 要 什 么 ？
		AI_Output(other, self, "DIA_Pablo_Add_15_11"); //老 实 说 - 我 不 知 道 ！
		AI_Output(self, other, "DIA_Pablo_Add_12_12"); //是 的 ， 是 的 。 我 知 道 。 告 诉 你 吧 ， 如 果 我 认 为 你 在 与 这 些 强 盗 合 谋 的 话 ， 你 现 在 就 已 经 在 监 狱 里 等 着 了 ， 明 白 吗 ？
		AI_Output(self, other, "DIA_Pablo_Add_12_13"); //尽 管 如 此 ， 我 最 好 把 这 件 事 报 告 给 安 德 烈 勋 爵 … …
		Pablo_AndreMelden = TRUE;
		AI_Output(self, other, "DIA_Pablo_Add_12_14"); //但 是 - 回 答 你 的 问 题 … …
	};

	AI_Output(self, other, "DIA_Pablo_Add_12_15"); //我 们 是 在 地 主 的 地 盘 附 近 抓 住 他 们 的 。
	AI_Output(self, other, "DIA_Pablo_Add_12_16"); //但 是 他 们 不 像 是 欧 纳 尔 的 人 。
	AI_Output(self, other, "DIA_Pablo_Add_12_17"); //我 想 他 们 是 藏 在 欧 纳 尔 的 农 场 附 近 山 区 中 的 一 小 群 人 。
	AI_Output(self, other, "DIA_Pablo_Add_12_18"); //但 是 如 果 你 打 算 去 那 里 ， 我 要 警 告 你 。 那 些 杀 人 犯 会 干 掉 任 何 人 ！
	AI_Output(other, self, "DIA_Pablo_Add_15_19"); //我 会 记 住 的 。
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Pablo_Perm(C_INFO)
{
	npc				= Mil_319_Pablo;
	nr				= 1;
	condition		= DIA_Pablo_Perm_Condition;
	information		= DIA_Pablo_Perm_Info;
	permanent		= TRUE;
	description		= "最 近 怎 么 样 ？";
};

func int DIA_Pablo_Perm_Condition()
{
	return TRUE;
};

func void DIA_Pablo_Perm_Info()
{
	AI_Output(other, self, "DIA_Pablo_Perm_15_00"); //状 况 怎 么 样 ？

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			if ((hero.guild == GIL_MIL)
			|| (hero.guild == GIL_PAL))
			{
				AI_Output(self, other, "DIA_Pablo_Perm_12_01"); //我 一 直 都 说 不 能 相 信 这 些 雇 佣 兵 。
				AI_Output(self, other, "DIA_Pablo_Perm_12_02"); //早 该 教 训 一 下 那 个 混 蛋 了 。 这 绝 不 是 贝 尼 特 一 个 人 策 划 的 。
			}
			else if (hero.guild == GIL_KDF)
			{
				AI_Output(self, other, "DIA_Pablo_Perm_12_03"); //对 于 尊 贵 的 圣 骑 士 洛 萨 遇 害 ， 我 感 到 深 深 的 震 惊 。
				AI_Output(self, other, "DIA_Pablo_Perm_12_04"); //但 是 我 知 道 教 会 将 给 那 个 恶 棍 一 个 公 正 的 惩 罚 。
			}
			else
			{
				AI_Output(self, other, "DIA_Pablo_Perm_12_05"); //你 在 这 附 近 游 荡 ， 想 要 做 什 么 ？ 如 果 你 打 算 救 你 的 雇 佣 兵 朋 友 ， 还 是 放 弃 吧 。
			};
		}
		else // Bennet ist unschuldig
		{
			AI_Output(self, other, "DIA_Pablo_Perm_12_06"); //真 是 可 悲 。 现 在 他 们 正 在 煽 动 我 们 彼 此 敌 对 。
			AI_Output(self, other, "DIA_Pablo_Perm_12_07"); //就 算 你 没 有 找 到 谋 杀 的 真 正 罪 犯 ， 兽 人 们 也 不 会 因 此 动 一 根 手 指 。
		};
	}
	else if (Kapitel == 5)
	{
		AI_Output(self, other, "DIA_Pablo_Perm_12_08"); //我 在 担 心 如 果 圣 骑 士 现 在 离 开 的 话 ， 会 发 生 什 么 事 。
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Pablo_Perm_12_09"); //你 可 以 依 靠 我 们 ， 我 们 会 使 用 一 切 可 能 的 方 法 来 确 保 这 座 城 市 不 会 堕 落 成 藏 污 纳 垢 的 场 所 。
	}
	else if ((hero.guild == GIL_SLD)
	|| (hero.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Pablo_Perm_12_10"); //注 意 你 在 这 里 的 一 举 一 动 。 我 们 对 你 这 样 的 无 赖 都 会 严 密 监 视 。
	}
	else
	{
		AI_Output(self, other, "DIA_Pablo_Perm_12_11"); //现 在 事 态 很 平 静 。 只 有 城 外 的 强 盗 还 在 给 我 们 惹 麻 烦 。
	};
};
