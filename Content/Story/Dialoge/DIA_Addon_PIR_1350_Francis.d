// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Addon_Francis_EXIT(C_INFO)
{
	npc				= PIR_1350_Addon_Francis;
	nr				= 999;
	condition		= DIA_Addon_Francis_EXIT_Condition;
	information		= DIA_Addon_Francis_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Francis_EXIT_Condition()
{
	if (GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  			In Gregs Hütte rein
// ************************************************************
// ------------------------------------------------------------
// 			  		Spieler kennt Hütte nicht
// ------------------------------------------------------------
instance DIA_Addon_Francis_First(C_INFO)
{
	npc				= PIR_1350_Addon_Francis;
	nr				= 1;
	condition		= DIA_Addon_Francis_First_Condition;
	information		= DIA_Addon_Francis_First_Info;
	description		= "这 是 你 的 小 屋 ？";
};

func int DIA_Addon_Francis_First_Condition()
{
	if ((Knows_GregsHut == FALSE)
	&& (Francis_ausgeschissen == FALSE)
	&& (Npc_HasItems(self, ITKE_Greg_ADDON_MIS)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_First_Info()
{
	AI_Output(other, self, "DIA_Addon_Francis_GregsHut_15_00"); //这 是 你 的 小 屋 ？
	AI_Output(self, other, "DIA_Addon_Francis_GregsHut_13_01"); //不 ， 它 属 于 格 雷 格 。
	Knows_GregsHut = TRUE;
};

// ------------------------------------------------------------
// 			  			Ich muß da rein!
// ------------------------------------------------------------
instance DIA_Addon_Francis_LetMeIn(C_INFO)
{
	npc				= PIR_1350_Addon_Francis;
	nr				= 2;
	condition		= DIA_Addon_Francis_LetMeIn_Condition;
	information		= DIA_Addon_Francis_LetMeIn_Info;
	description		= "我 必 须 要 进 入 格 雷 格 的 小 屋 。";
};

func int DIA_Addon_Francis_LetMeIn_Condition()
{
	if (((Npc_KnowsInfo(other, DIA_Addon_Francis_First)) || (Knows_GregsHut == TRUE))
	&& (Francis_ausgeschissen == FALSE)
	&& (Npc_HasItems(self, ITKE_Greg_ADDON_MIS)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_LetMeIn_Info()
{
	AI_Output(other, self, "DIA_Addon_Francis_LetMeIn_15_00"); //我 必 须 要 进 入 格 雷 格 的 小 屋 。
	AI_Output(self, other, "DIA_Addon_Francis_LetMeIn_13_01"); //算 了 吧 ！
	AI_Output(self, other, "DIA_Addon_Francis_LetMeIn_13_02"); //格 雷 格 不 在 那 里 。 我 已 经 把 门 锁 上 了 ， 保 证 没 人 能 溜 进 这 里 做 点 小 偷 小 摸 的 事 。
	AI_Output(self, other, "DIA_Addon_Francis_LetMeIn_13_03"); //那 么 快 溜 走 吧 ， 不 然 我 就 让 你 遭 殃 ！
};

// ------------------------------------------------------------
// 			  			Hab Greg getroffen!
// ------------------------------------------------------------
instance DIA_Addon_Francis_AboutGreg(C_INFO)
{
	npc				= PIR_1350_Addon_Francis;
	nr				= 3;
	condition		= DIA_Addon_Francis_AboutGreg_Condition;
	information		= DIA_Addon_Francis_AboutGreg_Info;
	description		= "格 雷 格 是 你 的 上 司 ？";
};

func int DIA_Addon_Francis_AboutGreg_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Francis_LetMeIn))
	&& (Francis_ausgeschissen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_AboutGreg_Info()
{
	AI_Output(other, self, "DIA_Addon_Francis_AboutGreg_15_00"); //格 雷 格 是 你 的 上 司 ？
	AI_Output(self, other, "DIA_Addon_Francis_AboutGreg_13_01"); //现 在 不 要 再 尝 试 以 及 告 诉 我 你 认 识 他 ！
	AI_Output(self, other, "DIA_Addon_Francis_AboutGreg_13_02"); //有 任 何 水 手 - 甚 至 包 括 岛 上 那 些 该 死 的 旱 鸭 子 在 内 - 认 识 那 个 可 怕 的 船 长 格 雷 格 吗 !
	AI_Output(self, other, "DIA_Addon_Francis_AboutGreg_13_03"); //（ 目 中 无 人 ） 让 我 指 挥 ！
	AI_Output(self, other, "DIA_Addon_Francis_AboutGreg_13_04"); //我 负 责 让 那 些 懒 惰 的 混 蛋 去 按 命 令 做 他 们 的 事 ！
	AI_Output(self, other, "DIA_Addon_Francis_AboutGreg_13_05"); //那 些 小 子 们 以 为 船 长 不 在 这 里 的 时 候 ， 他 们 就 可 以 为 所 欲 为 。
	AI_Output(self, other, "DIA_Addon_Francis_AboutGreg_13_06"); //当 格 雷 格 回 来 的 时 候 ， 他 们 不 会 感 到 吃 惊 吗 。
	AI_Output(self, other, "DIA_Addon_Francis_AboutGreg_13_07"); //我 会 告 诉 他 这 里 发 生 的 一 切 事 情 ， 明 白 吗 ？
	AI_Output(self, other, "DIA_Addon_Francis_AboutGreg_13_08"); //包 括 有 谁 想 要 进 入 他 的 小 屋 。
	AI_Output(self, other, "DIA_Addon_Francis_AboutGreg_13_09"); //所 以 快 点 滚 吧 ， 否 则 你 就 惹 上 一 大 堆 麻 烦 了 。
};

// ------------------------------------------------------------
// 		  			Gib mir Schlüssel + Bestechung!
// ------------------------------------------------------------
var int Francis_bezahlt;
instance DIA_Addon_Francis_Key(C_INFO)
{
	npc				= PIR_1350_Addon_Francis;
	nr				= 4;
	condition		= DIA_Addon_Francis_Key_Condition;
	information		= DIA_Addon_Francis_Key_Info;
	permanent		= TRUE;
	description		= "把 格 雷 格 小 屋 的 钥 匙 给 我 ！";
};

func int DIA_Addon_Francis_Key_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Francis_LetMeIn))
	&& (Npc_HasItems(self, ITKE_Greg_ADDON_MIS)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_Key_Info()
{
	AI_Output(other, self, "DIA_Addon_Francis_Key_15_00"); //把 格 雷 格 小 屋 的 钥 匙 给 我 ！
	AI_Output(self, other, "DIA_Addon_Francis_Key_13_01"); //你 一 定 在 开 玩 笑 ！

	Info_ClearChoices(DIA_Addon_Francis_Key);
	Info_AddChoice(DIA_Addon_Francis_Key, "我 会 再 考 虑 一 下..", DIA_Addon_Francis_Key_BACK);
	Info_AddChoice(DIA_Addon_Francis_Key, "我 会 给 你 ２ ０ ０ ０ 金 币 ！", DIA_Addon_Francis_Key_2000Gold);
	Info_AddChoice(DIA_Addon_Francis_Key, "我 会 给 你 ２ ０ ０ ０ 金 币 ！", DIA_Addon_Francis_Key_1000Gold);
};

func void DIA_Addon_Francis_Key_BACK()
{
	Info_ClearChoices(DIA_Addon_Francis_Key);
};

func void DIA_Addon_Francis_Key_1000Gold()
{
	AI_Output(other, self, "DIA_Addon_Francis_Key_1000Gold_15_00"); //我 会 给 你 １ ０ ０ ０ 金 币 ！
	AI_Output(self, other, "DIA_Addon_Francis_Key_1000Gold_13_01"); //恐 怕 那 还 不 足 以 让 我 背 叛 我 的 船 长 ，你 不 觉 得 吗？
	AI_Output(self, other, "DIA_Addon_Francis_Key_1000Gold_13_02"); //注 意 你 说 的 话 ， 否 则 我 就 扒 了 你 的 皮 ！
};

func void DIA_Addon_Francis_Key_2000Gold()
{
	AI_Output(other, self, "DIA_Addon_Francis_Key_2000Gold_15_00"); //我 会 给 你 ２ ０ ０ ０ 金 币 ！

	if (Npc_HasItems(other, ItMI_Gold) >= 2000)
	{
		AI_Output(self, other, "DIA_Addon_Francis_Key_2000Gold_13_01"); //小 子 ， 你 所 要 求 的 是 叛 变 ！
		AI_Output(self, other, "DIA_Addon_Francis_Key_2000Gold_13_02"); //（ 自 言 自 语 ） 但 是 ， 重 新 考 虑 一 下 … …
		AI_Output(self, other, "DIA_Addon_Francis_Key_2000Gold_13_03"); //嗯 ， 好 吧 ， 给 我 。 没 人 会 知 道 。
		AI_Output(self, other, "DIA_Addon_Francis_Key_2000Gold_13_04"); //这 是 钥 匙 ！
		AI_Output(self, other, "DIA_Addon_Francis_Key_2000Gold_13_05"); //不 过 要 快 点 ， 赶 在 格 雷 格 回 来 之 前 。 而 且 不 能 对 其 他 人 透 露 一 点 ， 明 白 吗 ？！
		B_GiveInvItems(other, self, ItMi_Gold, 2000);
		B_GiveInvItems(self, other, ITKE_Greg_ADDON_MIS, 1);
		Francis_bezahlt = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_FrancisNotEnoughGold_13_05"); //（ 大 笑 ） 哈 ！ 我 打 赌 你 没 有 那 么 多 ！
	};

	Info_ClearChoices(DIA_Addon_Francis_Key);
};

// ------------------------------------------------------------
// 			  				Aufs Maul!
// ------------------------------------------------------------
instance DIA_Addon_Francis_AufsMaul(C_INFO)
{
	npc				= PIR_1350_Addon_Francis;
	nr				= 5;
	condition		= DIA_Addon_Francis_AufsMaul_Condition;
	information		= DIA_Addon_Francis_AufsMaul_Info;
	permanent		= TRUE;
	description		= "嗯 ， 那 么 让 我 看 看 你 拿 到 了 什 么 。";
};

func int DIA_Addon_Francis_AufsMaul_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Francis_LetMeIn))
	&& (Npc_HasItems(self, ITKE_Greg_ADDON_MIS)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_AufsMaul_Info()
{
	AI_Output(other, self, "DIA_Addon_Francis_AufsMaul_15_00"); //嗯 ， 那 么 让 我 看 看 你 拿 到 了 什 么 。
	AI_Output(self, other, "DIA_Addon_Francis_AufsMaul_13_01"); //（ 刺 耳 的 ） 什 么 ？ 我 是 这 里 的 船 长 ！
	AI_Output(self, other, "DIA_Addon_Francis_AufsMaul_13_02"); //我 要 教 你 学 会 尊 重 ， 你 这 个 旱 鸭 子 ！

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

// ------------------------------------------------------------
// 			  		Ich habe dein Versteck gefunden...
// ------------------------------------------------------------
instance DIA_Addon_Francis_Buch(C_INFO)
{
	npc				= PIR_1350_Addon_Francis;
	nr				= 5;
	condition		= DIA_Addon_Francis_Buch_Condition;
	information		= DIA_Addon_Francis_Buch_Info;
	permanent		= TRUE;
	description		= "我 找 到 了 你 的 贮 藏 物 … …";
};

func int DIA_Addon_Francis_Buch_Condition()
{
	if (Npc_HasItems(other, ITWR_Addon_FrancisAbrechnung_Mis))
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_Buch_Info()
{
	AI_Output(other, self, "DIA_Addon_Francis_Key_Business_15_03"); //我 找 到 了 你 的 储 藏 处 ， 你 的 财 宝 和 你 的 支 付 记 录 。 这 是 你 的 帐 簿 ， 对 吗 ？
	AI_Output(self, other, "DIA_Addon_Francis_Buch_13_01"); //呃 … … 我 以 前 从 没 见 过 这 本 书 。
	AI_Output(self, other, "DIA_Addon_Francis_Buch_13_02"); //而 且 … … 呃 … … 即 使 这 是 我 的 书 … …
	AI_Output(self, other, "DIA_Addon_Francis_Buch_13_03"); //你 不 是 真 的 以 为 那 个 家 伙 会 凭 几 张 发 黄 的 纸 就 买 你 的 帐 ， 是 吗 ？
	AI_Output(other, self, "DIA_Addon_Francis_Key_Business_15_01"); //你 骗 走 了 他 们 所 有 应 得 的 那 份 。
	AI_Output(self, other, "DIA_Addon_Francis_Buch_13_04"); //呃 … … 等 一 下 … …
	if (Npc_HasItems(self, ITKE_Greg_ADDON_MIS))
	{
		if (Npc_KnowsInfo(other, DIA_Addon_Francis_LetMeIn))
		{
			AI_Output(self, other, "DIA_Addon_Francis_Buch_13_05"); //(微笑地)你 想 要 格 雷 格 小 屋 的 钥 匙 ，对 吗 ？。
		};

		AI_Output(self, other, "DIA_Addon_Francis_Buch_13_06"); //我 会 把 格 雷 格 的 小 屋 钥 匙 给 你 ！
		AI_Output(self, other, "DIA_Addon_Francis_Buch_13_07"); //那 里 有 大 量 值 钱 的 东 西 … …
		AI_Output(self, other, "DIA_Addon_Francis_Buch_13_08"); //（ 惴 惴 不 安 的 ） 但 是 你 要 把 书 给 我 ， 并 且 闭 上 你 的 嘴 巴 ， 好 吗 ？
		B_GiveInvItems(other, self, ITWR_Addon_FrancisAbrechnung_Mis, 1);
		B_GiveInvItems(self, other, ITKE_Greg_ADDON_MIS, 1);
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Francis_Buch_13_09"); //千 万 不 要 做 任 何 傻 事 ！
		if ((Francis_bezahlt == TRUE)
		&& (Npc_HasItems(self, itmi_gold) >= 2000))
		{
			AI_Output(self, other, "DIA_Addon_Francis_Buch_13_10"); //这 是 你 的 2 0 0 0 枚 金 币 ！
			AI_Output(self, other, "DIA_Addon_Francis_Buch_13_11"); //而 且 我 还 要 再 给 你 5 0 0 金 币
			B_GiveInvItems(self, other, itmi_gold, 2500);
		}
		else
		{
			AI_Output(self, other, "DIA_Addon_Francis_Buch_13_12"); //这 是 5 0 0 枚 金 币 ！
			B_GiveInvItems(self, other, itmi_gold, 500);
		};

		AI_Output(self, other, "DIA_Addon_Francis_Buch_13_13"); //（ 匆 忙 的 ） 现 在 把 那 东 西 给 我 … …
		B_GiveInvItems(other, self, ITWR_Addon_FrancisAbrechnung_Mis, 1);
	};

	AI_StopProcessInfos(self);
};

// ------------------------------------------------------------
// 			  				PICK POCKET
// ------------------------------------------------------------
instance DIA_Francis_PICKPOCKET(C_INFO)
{
	npc				= PIR_1350_Addon_Francis;
	nr				= 900;
	condition		= DIA_Francis_PICKPOCKET_Condition;
	information		= DIA_Francis_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "（ 偷 他 的 钥 匙 应 该 很 容 易 ）";
};

func int DIA_Francis_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ITKE_Greg_ADDON_MIS) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (40 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Francis_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Francis_PICKPOCKET);
	Info_AddChoice(DIA_Francis_PICKPOCKET, DIALOG_BACK, DIA_Francis_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Francis_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Francis_PICKPOCKET_DoIt);
};

func void DIA_Francis_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 40)
	{
		B_GiveInvItems(self, other, ITKE_Greg_ADDON_MIS, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Francis_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // AR_Theft führt zu NEWS!
	};

	Info_ClearChoices(DIA_Francis_PICKPOCKET);
};

func void DIA_Francis_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Francis_PICKPOCKET);
};

// ************************************************************
// 			  		Wenn von Greg weggeschickt
// ************************************************************
instance DIA_Francis_Ausgeschissen(C_INFO)
{
	npc				= PIR_1350_Addon_Francis;
	nr				= 900;
	condition		= DIA_Francis_Ausgeschissen_Condition;
	information		= DIA_Francis_Ausgeschissen_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Francis_Ausgeschissen_Condition()
{
	if ((Francis_ausgeschissen == TRUE)
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Francis_Ausgeschissen_Info()
{
	if (!Npc_IsDead(Greg))
	{
		AI_Output(self, other, "DIA_Addon_Francis_Ausgeschissen_13_00"); //（ 狂 怒 ） 因 为 你 ， 格 雷 格 现 在 让 我 去 锯 木 板 ， 直 到 岛 上 没 有 木 头 的 时 候 ！
	};

	AI_Output(self, other, "DIA_Addon_Francis_Ausgeschissen_13_01"); //离 我 远 点 ！
	AI_StopProcessInfos(self);
};
