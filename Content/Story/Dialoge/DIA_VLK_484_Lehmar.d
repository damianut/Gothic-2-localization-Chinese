///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Lehmar_EXIT(C_INFO)
{
	npc				= VLK_484_Lehmar;
	nr				= 999;
	condition		= DIA_Lehmar_EXIT_Condition;
	information		= DIA_Lehmar_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lehmar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lehmar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Entschuldigung
///////////////////////////////////////////////////////////////////////
instance DIA_Lehmar_ENTSCHULDIGUNG(C_INFO)
{
	npc				= VLK_484_Lehmar;
	nr				= 2;
	condition		= DIA_Lehmar_ENTSCHULDIGUNG_Condition;
	information		= DIA_Lehmar_ENTSCHULDIGUNG_Info;
	description		= "有 什 么 新 鲜 事 吗 ？";
};

func int DIA_Lehmar_ENTSCHULDIGUNG_Condition()
{
	return TRUE;
};

func void DIA_Lehmar_ENTSCHULDIGUNG_Info()
{
	AI_Output(other, self, "DIA_Lehmar_ENTSCHULDIGUNG_15_00"); //事 情 怎 么 样 了 ？
	AI_Output(self, other, "DIA_Lehmar_ENTSCHULDIGUNG_09_01"); //（ 厌 烦 的 ） 你 想 要 多 少 ？
	AI_Output(other, self, "DIA_Lehmar_ENTSCHULDIGUNG_15_02"); //你 说 ‘ 多 少 ’ 是 什 么 意 思 ？
	AI_Output(self, other, "DIA_Lehmar_ENTSCHULDIGUNG_09_03"); //我 是 放 高 利 贷 的 ， 而 你 来 找 我 。 你 想 问 我 要 什 么 ？ 当 然 是 钱 。
};

///////////////////////////////////////////////////////////////////////
//	Info GeldLeihen
///////////////////////////////////////////////////////////////////////
instance DIA_Lehmar_GELDLEIHEN(C_INFO)
{
	npc				= VLK_484_Lehmar;
	nr				= 3;
	condition		= DIA_Lehmar_GELDLEIHEN_Condition;
	information		= DIA_Lehmar_GELDLEIHEN_Info;
	permanent		= TRUE;
	description		= "借 我 点 钱 吧 ！";
};

// ----------------------------------------
var int DIA_Lehmar_GELDLEIHEN_noPerm;
// ----------------------------------------
func int DIA_Lehmar_GELDLEIHEN_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lehmar_ENTSCHULDIGUNG))
	&& (DIA_Lehmar_GELDLEIHEN_noPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDLEIHEN_Info()
{
	AI_Output(other, self, "DIA_Lehmar_GELDLEIHEN_15_00"); //借 我 点 钱 吧 ！
	AI_Output(self, other, "DIA_Lehmar_GELDLEIHEN_09_01"); //当 然 ！ 你 想 要 多 少 ？ 我 收20％ 的 费 用 !

	Info_ClearChoices(DIA_Lehmar_GELDLEIHEN);

	Info_AddChoice(DIA_Lehmar_GELDLEIHEN, "我 会 考 虑 的 。", DIA_Lehmar_GELDLEIHEN_back);
	Info_AddChoice(DIA_Lehmar_GELDLEIHEN, "１ ０ ０ ０ 个 金 币 。", DIA_Lehmar_GELDLEIHEN_1000);
	Info_AddChoice(DIA_Lehmar_GELDLEIHEN, " ２ ０ ０ 个 金 币 。", DIA_Lehmar_GELDLEIHEN_200);
	Info_AddChoice(DIA_Lehmar_GELDLEIHEN, "  ５ ０ 个 金 币 。", DIA_Lehmar_GELDLEIHEN_50);
};

func void DIA_Lehmar_GELDLEIHEN_back()
{
	AI_Output(other, self, "DIA_Lehmar_GELDLEIHEN_back_15_00"); //我 会 考 虑 的 。
	AI_Output(self, other, "DIA_Lehmar_GELDLEIHEN_back_09_01"); //作 出 你 的 决 定 ！ 别 浪 费 我 的 时 间 ！

	AI_StopProcessInfos(self);
};

func void DIA_Lehmar_GELDLEIHEN_50()
{
	AI_Output(other, self, "DIA_Lehmar_GELDLEIHEN_50_15_00"); //5 0 个 金 币 。
	AI_Output(self, other, "DIA_Lehmar_GELDLEIHEN_50_09_01"); //小 菜 一 碟 ， 是 吧 ？ 我 明 天 就 得 收 回 它 ， 明 白 吗 ？

	CreateInvItems(self, ItMi_Gold, 50);
	B_GiveInvItems(self, other, ItMi_Gold, 50);

	DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
	Lehmar_GeldGeliehen_Day = Wld_GetDay();
	Lehmar_GeldGeliehen = 50;

	Info_ClearChoices(DIA_Lehmar_GELDLEIHEN);
};

func void DIA_Lehmar_GELDLEIHEN_200()
{
	AI_Output(other, self, "DIA_Lehmar_GELDLEIHEN_200_15_00"); //２ ０ ０ 个 金 币 。
	AI_Output(self, other, "DIA_Lehmar_GELDLEIHEN_200_09_01"); //那 是 一 大 笔 钱 。 明 天 我 还 会 在 这 里 看 到 你 ， 还 有 那 些 钱 ， 明 白 吗 ？

	CreateInvItems(self, ItMi_Gold, 200);
	B_GiveInvItems(self, other, ItMi_Gold, 200);

	DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
	Lehmar_GeldGeliehen_Day = Wld_GetDay();
	Lehmar_GeldGeliehen = 200;

	Info_ClearChoices(DIA_Lehmar_GELDLEIHEN);
};

func void DIA_Lehmar_GELDLEIHEN_1000()
{
	AI_Output(other, self, "DIA_Lehmar_GELDLEIHEN_1000_15_00"); //１ ０ ０ ０ 个 金 币 。
	AI_Output(self, other, "DIA_Lehmar_GELDLEIHEN_1000_09_01"); //你 在 想 屁 吃 。
	AI_Output(self, other, "DIA_Lehmar_GELDLEIHEN_1000_09_02"); //我 会 给 你 1 0 0 。 还 有 ， 别 忘 了 ， 我 明 天 就 得 收 回 它 ！

	CreateInvItems(self, ItMi_Gold, 100);
	B_GiveInvItems(self, other, ItMi_Gold, 100);

	DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
	Lehmar_GeldGeliehen_Day = Wld_GetDay();
	Lehmar_GeldGeliehen = 100;

	Info_ClearChoices(DIA_Lehmar_GELDLEIHEN);
};

///////////////////////////////////////////////////////////////////////
//	Info warumGeld
///////////////////////////////////////////////////////////////////////
instance DIA_Lehmar_WARUMGELD(C_INFO)
{
	npc				= VLK_484_Lehmar;
	nr				= 3;
	condition		= DIA_Lehmar_WARUMGELD_Condition;
	information		= DIA_Lehmar_WARUMGELD_Info;
	description		= "你 总 是 那 样 把 你 的 钱 借 给 人 们 ？";
};

func int DIA_Lehmar_WARUMGELD_Condition()
{
	if (Lehmar_GeldGeliehen != 0)
	{
		return TRUE;
	};
};

func void DIA_Lehmar_WARUMGELD_Info()
{
	AI_Output(other, self, "DIA_Lehmar_WARUMGELD_15_00"); //你 总 是 那 样 把 你 的 钱 借 给 人 们 ？
	AI_Output(self, other, "DIA_Lehmar_WARUMGELD_09_01"); //（ 开 心 的 ） 别 担 心 。 你 会 还 回 来 的 。 否 则 ， 我 会 找 到 你 并 杀 了 你 。 就 那 么 简 单 。
	AI_Output(self, other, "DIA_Lehmar_WARUMGELD_09_02"); //你 有 这 一 张 如 此 与 众 不 同 的 脸 ， 那 么 ， 我 不 会 要 花 太 多 时 间 去 找 你 。
	AI_Output(self, other, "DIA_Lehmar_WARUMGELD_09_03"); //所 以 ， 千 万 不 要 想 跟 我 胡 闹 。
};

///////////////////////////////////////////////////////////////////////
//	Info geldeintreiben
///////////////////////////////////////////////////////////////////////
var int Lehmar_vorbei;
instance DIA_Lehmar_GELDEINTREIBEN(C_INFO)
{
	npc				= VLK_484_Lehmar;
	nr				= 5;
	condition		= DIA_Lehmar_GELDEINTREIBEN_Condition;
	information		= DIA_Lehmar_GELDEINTREIBEN_Info;
	important		= TRUE;
};

func int DIA_Lehmar_GELDEINTREIBEN_Condition()
{
	if (((Lehmar_GeldGeliehen_Day <= (Wld_GetDay() - 2))
	&& (Lehmar_GeldGeliehen != 0))
	&& (RangerHelp_LehmarKohle == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDEINTREIBEN_Info()
{
	AI_Output(self, other, "DIA_Lehmar_GELDEINTREIBEN_09_00"); //你 迟 到 了 ， 你 这 个 混 蛋 ！ 把 我 的 钱 给 我 ！ 而 且 既 然 让 我 来 提 醒 你 ， 那 会 更 贵 。
	AI_Output(self, other, "DIA_Lehmar_GELDEINTREIBEN_09_01"); //那 将 让 需 要 你 支 付30％ 而 不 是 平 常 的 2 0％ 。

	Info_ClearChoices(DIA_Lehmar_GELDEINTREIBEN);
	Info_AddChoice(DIA_Lehmar_GELDEINTREIBEN, "我 会 还 债 的", DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen);
	Info_AddChoice(DIA_Lehmar_GELDEINTREIBEN, "我 不 会 给 你 任 何 东 西 。", DIA_Lehmar_GELDEINTREIBEN_kannstmich);
};

func void DIA_Lehmar_GELDEINTREIBEN_kannstmich()
{
	AI_Output(other, self, "DIA_Lehmar_GELDEINTREIBEN_kannstmich_15_00"); //我 不 会 给 你 任 何 东 西 。
	AI_Output(self, other, "DIA_Lehmar_GELDEINTREIBEN_kannstmich_09_01"); //哦， 是 的 ， 你 会 的 。
	Lehmar_vorbei = TRUE;
	AI_StopProcessInfos(self);

	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen()
{
	AI_Output(other, self, "DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_15_00"); //我 会 还 债 的 。

	///////////////////////////////////////////////////////////////////////

	if (Lehmar_GeldGeliehen == 50)
	{
		Lehmar_GeldGeliehen_MitZinsen = 65;
	};

	if (Lehmar_GeldGeliehen == 200)
	{
		Lehmar_GeldGeliehen_MitZinsen = 260;
	};

	if (Lehmar_GeldGeliehen == 100)
	{
		Lehmar_GeldGeliehen_MitZinsen = 130;
	};

	///////////////////////////////////////////////////////////////////////
	IntToFloat(Lehmar_GeldGeliehen_MitZinsen);

	if ((Npc_HasItems(other, ItMi_Gold)) >= Lehmar_GeldGeliehen_MitZinsen)
	{
		B_GiveInvItems(other, self, ItMi_Gold, Lehmar_GeldGeliehen_MitZinsen);

		AI_Output(self, other, "DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_01"); //算 你 走 运 ！ 那 么 马 上 滚 吧 ！
		Lehmar_GeldGeliehen = 0;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, other, "DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_02"); //你 身 上 没 有 足 够 的 钱 ！ 嗯 ， 好 吧 。 我 知 道 我 不 得 不 教 训 教 训 你 。
		AI_Output(self, other, "DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_03"); //别 以 个 人 看 法 而 言 - 我 还 要 维 护 自 己 的 声 誉 呢 。
		Lehmar_vorbei = TRUE;

		AI_StopProcessInfos(self);

		B_Attack(self, other, AR_NONE, 1);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Geldzurück
///////////////////////////////////////////////////////////////////////
instance DIA_Lehmar_GELDZURUECK(C_INFO)
{
	npc				= VLK_484_Lehmar;
	nr				= 6;
	condition		= DIA_Lehmar_GELDZURUECK_Condition;
	information		= DIA_Lehmar_GELDZURUECK_Info;
	permanent		= TRUE;
	description		= "把 钱 还 给 你 ！";
};

func int DIA_Lehmar_GELDZURUECK_Condition()
{
	if (!(Npc_KnowsInfo(other, DIA_Lehmar_GELDEINTREIBEN))
	&& (Lehmar_GeldGeliehen != 0))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDZURUECK_Info()
{
	AI_Output(other, self, "DIA_Lehmar_GELDZURUECK_15_00"); //把 钱 还 给 你 ！

	if ((RangerHelp_LehmarKohle == TRUE)
	&& (Lehmar_GeldGeliehen_Day <= (Wld_GetDay() - 2)))
	{
		AI_Output(self, other, "DIA_Addon_Lehmar_GELDZURUECK_09_00"); //别 担 心 。 莱 尔 瑞 兹 已 经 为 你 解 决 这 件 事 了 。
		AI_Output(self, other, "DIA_Addon_Lehmar_GELDZURUECK_09_01"); //那 个 混 蛋 是 你 的 一 个 朋 友 ， 是 吗 ？ 哦 ， 好 吧 ， 不 关 我 的 事 。 祝 你 愉 快 。
		Lehmar_GeldGeliehen = 0;
		AI_StopProcessInfos(self);
	}
	else
	{
		///////////////////////////////////////////////////////////////////////

		if (Lehmar_GeldGeliehen == 50)
		{
			Lehmar_GeldGeliehen_MitZinsen = 60;
		};

		if (Lehmar_GeldGeliehen == 200)
		{
			Lehmar_GeldGeliehen_MitZinsen = 240;
		};

		if (Lehmar_GeldGeliehen == 100)
		{
			Lehmar_GeldGeliehen_MitZinsen = 120;
		};

		///////////////////////////////////////////////////////////////////////
		IntToFloat(Lehmar_GeldGeliehen_MitZinsen);

		if ((Npc_HasItems(other, ItMi_Gold)) >= Lehmar_GeldGeliehen_MitZinsen)
		{
			B_GiveInvItems(other, self, ItMi_Gold, Lehmar_GeldGeliehen_MitZinsen);

			AI_Output(self, other, "DIA_Lehmar_GELDZURUECK_09_01"); //太 棒 了 ！ 跟 你 做 生 意 真 棒 。

			Lehmar_GeldGeliehen = 0;
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self, other, "DIA_Lehmar_GELDZURUECK_09_02"); //你 没 有 足 够 的 钱 ！ 当 你 有 了 再 来 。 你 的 期 限 还 没 到 。 记 住 ，20％ ！
			AI_StopProcessInfos(self);
		};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info NOCHMALGELD
///////////////////////////////////////////////////////////////////////
instance DIA_Lehmar_NOCHMALGELD(C_INFO)
{
	npc				= VLK_484_Lehmar;
	nr				= 8;
	condition		= DIA_Lehmar_NOCHMALGELD_Condition;
	information		= DIA_Lehmar_NOCHMALGELD_Info;
	permanent		= TRUE; // Joly: letzte Info die im KAPITEL 1 Stehen bleibt
	description		= "我 还 能 向 你 借 点 钱 吗 ？";
};

func int DIA_Lehmar_NOCHMALGELD_Condition()
{
	if ((Lehmar_GeldGeliehen == 0)
	&& (Lehmar_GeldGeliehen_MitZinsen != 0)) // Joly: SC hat sich schon mal Geld geliehen!
	{
		return TRUE;
	};
};

func void DIA_Lehmar_NOCHMALGELD_Info()
{
	AI_Output(other, self, "DIA_Lehmar_NOCHMALGELD_15_00"); //我 还 能 向 你 借 点 钱 吗 ？

	if ((Npc_KnowsInfo(other, DIA_Lehmar_GELDEINTREIBEN)) // Joly: SC hat Schulden nicht ordnungsgemäß zurück gezahlt!
	|| (Npc_KnowsInfo(other, DIA_Lehmar_BuchWeg)))
	{
		AI_Output(self, other, "DIA_Lehmar_NOCHMALGELD_09_01"); //你 是 不 是 认 为 我 很 傻 ？ 快 走 ！
	}
	else
	{
		AI_Output(self, other, "DIA_Lehmar_NOCHMALGELD_09_02"); //现 在 没 了 ！ 我 刚 花 了 一 大 笔 钱 ， 所 以 ， 我 需 要 每 一 个 子 儿 。
		AI_Output(self, other, "DIA_Lehmar_NOCHMALGELD_09_03"); //过 几 天 再 来 ！
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Lehmar_PICKPOCKET(C_INFO)
{
	npc				= VLK_484_Lehmar;
	nr				= 900;
	condition		= DIA_Lehmar_PICKPOCKET_Condition;
	information		= DIA_Lehmar_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "（ 要 偷 走 他 的 小 书 简 直 如 同 儿 戏 ）";
};

func int DIA_Lehmar_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItWr_Schuldenbuch) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (20 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lehmar_PICKPOCKET);
	Info_AddChoice(DIA_Lehmar_PICKPOCKET, DIALOG_BACK, DIA_Lehmar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lehmar_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Lehmar_PICKPOCKET_DoIt);
};

func void DIA_Lehmar_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 20)
	{
		B_GiveInvItems(self, other, ItWr_Schuldenbuch, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Lehmar_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Lehmar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Canthar_PICKPOCKET);
};

// ************************************************************
// 			  			Schuldenbuch weg
// ************************************************************
instance DIA_Lehmar_BuchWeg(C_INFO)
{
	npc				= VLK_484_Lehmar;
	nr				= 1;
	condition		= DIA_Lehmar_BuchWeg_Condition;
	information		= DIA_Lehmar_BuchWeg_Info;
	important		= TRUE;
};

func int DIA_Lehmar_BuchWeg_Condition()
{
	if ((self.aivar[AIV_DefeatedByPlayer] == FALSE)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_BuchWeg_Info()
{
	AI_Output(self, other, "DIA_Lehmar_Add_09_00"); //（ 懊 悔 地 ） 哪 个 可 恶 的 扒 手 偷 走 了 我 的 账 本 … …
	AI_Output(self, other, "DIA_Lehmar_Add_09_01"); //你 跟 这 件 事 情 没 有 任 何 关 系 ， 是 吗 ？
	AI_Output(other, self, "DIA_Addon_Lehmar_Add_15_02"); //（ 咧 着 嘴 笑 ） 我 ？ 不 。
	AI_Output(self, other, "DIA_Lehmar_Add_09_03"); //是 的 ， 是 的 ， 好 吧 。 从 这 里 滚 出 去 … …
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  			Lehmar verhauen
// ************************************************************
instance DIA_Lehmar_verhauen(C_INFO)
{
	npc				= VLK_484_Lehmar;
	nr				= 1;
	condition		= DIA_Lehmar_verhauen_Condition;
	information		= DIA_Lehmar_verhauen_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Lehmar_verhauen_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		if ((self.aivar[AIV_DefeatedByPlayer] == TRUE)
		|| (Npc_KnowsInfo(other, DIA_Lehmar_BuchWeg))
		|| (Lehmar_vorbei == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Lehmar_verhauen_Info()
{
	B_Say(self, other, "$NOTNOW");
	AI_StopProcessInfos(self);
};
