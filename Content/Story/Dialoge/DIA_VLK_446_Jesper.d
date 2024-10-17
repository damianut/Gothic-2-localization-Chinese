//////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Jesper_EXIT(C_INFO)
{
	npc				= VLK_446_Jesper;
	nr				= 999;
	condition		= DIA_Jesper_EXIT_Condition;
	information		= DIA_Jesper_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Jesper_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jesper_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Jesper_PICKPOCKET(C_INFO)
{
	npc				= VLK_446_Jesper;
	nr				= 900;
	condition		= DIA_Jesper_PICKPOCKET_Condition;
	information		= DIA_Jesper_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Jesper_PICKPOCKET_Condition()
{
	C_Beklauen(80, 180);
};

func void DIA_Jesper_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jesper_PICKPOCKET);
	Info_AddChoice(DIA_Jesper_PICKPOCKET, DIALOG_BACK, DIA_Jesper_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jesper_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Jesper_PICKPOCKET_DoIt);
};

func void DIA_Jesper_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Jesper_PICKPOCKET);
};

func void DIA_Jesper_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jesper_PICKPOCKET);
};

//////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Jesper_Hallo(C_INFO)
{
	npc				= VLK_446_Jesper;
	nr				= 1;
	condition		= DIA_Jesper_Hallo_Condition;
	information		= DIA_Jesper_Hallo_Info;
	important		= TRUE;
};

func int DIA_Jesper_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Jesper_Hallo_Info()
{
	AI_Output(self, other, "DIA_Jesper_Hallo_09_00"); //嘿 ， 你 在 这 下 面 干 什 么 ？ 这 里 没 有 你 需 要 的 东 西 。
	AI_Output(self, other, "DIA_Jesper_Hallo_09_01"); //那 么 ， 说 吧 ， 你 在 这 里 干 什 么 ？

	Info_ClearChoices(DIA_Jesper_Hallo);
	Info_AddChoice(DIA_Jesper_Hallo, "我 是 来 杀 你 的 。", DIA_Jesper_Hallo_Kill);
	Info_AddChoice(DIA_Jesper_Hallo, "我 只 是 想 要 四 处 看 一 下 。", DIA_Jesper_Hallo_NurSo);

	if (Attila_Key == TRUE)
	{
		Info_AddChoice(DIA_Jesper_Hallo, "阿 提 拉 给 我 一 把 钥 匙 … …", DIA_Jesper_Hallo_Willkommen);
	}
	else
	{
		Info_AddChoice(DIA_Jesper_Hallo, "我 干 掉 了 阿 提 拉 … …", DIA_Jesper_Hallo_Umgelegt);
	};

	DG_gefunden = TRUE;
};

func void DIA_Jesper_Hallo_Kill()
{
	AI_Output(other, self, "DIA_Jesper_Hallo_Kill_15_00"); //我 是 来 杀 你 的 。
	AI_Output(self, other, "DIA_Jesper_Hallo_Kill_09_01"); //真 是 个 好 主 意 啊 。 你 自 己 想 出 来 的 吗 ？ 哈 ， 我 来 把 它 简 化 点 吧。

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "START");
	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_Jesper_Hallo_NurSo()
{
	AI_Output(other, self, "DIA_Jesper_Hallo_NurSo_15_00"); //我 只 是 想 要 四 处 看 一 下 。
	AI_Output(self, other, "DIA_Jesper_Hallo_NurSo_09_01"); //这 里 没 有 什 么 好 看 的 。 你 正 走 在 一 个 危 险 的 地 方 ， 明 白 吗 ？
	AI_Output(self, other, "DIA_Jesper_Hallo_NurSo_09_02"); //不 要 碰 你 的 武 器 ， 告 诉 我 你 为 什 么 在 这 里 。
};

func void DIA_Jesper_Hallo_Willkommen()
{
	AI_Output(other, self, "DIA_Jesper_Hallo_Willkommen_15_00"); //阿 提 拉 给 了 我 一 把 钥 匙 。 这 就 是 为 什 么 我 在 这 里 。 那 么 ， 你 想 要 我 做 什 么 ？
	AI_Output(self, other, "DIA_Jesper_Hallo_Willkommen_09_01"); //你 想 知 道 吗 ？ 保 持 冷 静 。
	AI_Output(self, other, "DIA_Jesper_Hallo_Willkommen_09_02"); //去 见 见 凯 希 亚 。 他 在 等 着 你 。

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "START");
};

func void DIA_Jesper_Hallo_Umgelegt()
{
	AI_Output(other, self, "DIA_Jesper_Hallo_Umgelegt_15_00"); //我 杀 了 阿 提 拉 。 他 身 上 有 这 把 下 水 道 的 钥 匙 。
	AI_Output(self, other, "DIA_Jesper_Hallo_Umgelegt_09_01"); //（ 怀 疑 的 ） 你 杀 了 阿 提 拉 ？ ！ （ 藐 视 地 ） 那 又 怎 么 样 ， 反 正 他 是 个 可 恶 的 卑 鄙 小 人 。
	AI_Output(self, other, "DIA_Jesper_Hallo_Umgelegt_09_02"); //但 我 可 以 告 诉 你 。 如 果 你 攻 击 我 ， 我 就 会 杀 了 你 。

	Info_ClearChoices(DIA_Jesper_Hallo);
	Info_AddChoice(DIA_Jesper_Hallo, "你 在 这 里 做 什 么 … …", DIA_Jesper_Hallo_Was);
	Info_AddChoice(DIA_Jesper_Hallo, "带 我 去 你 的 首 领 那 里 。 ", DIA_Jesper_Hallo_Anfuehrer);
};

func void DIA_Jesper_Hallo_Was()
{
	AI_Output(other, self, "DIA_Jesper_Hallo_Was_15_00"); //你 在 这 个 黑 暗 、 潮 湿 的 洞 里 面 干 什 么 ？
	AI_Output(self, other, "DIA_Jesper_Hallo_Was_09_01"); //（ 咆 哮 ） 我 住 在 这 里 。 再 问 一 个 愚 蠢 问 题 我 就 在 你 的 皮 上 画 上 花 。
};

func void DIA_Jesper_Hallo_Anfuehrer()
{
	AI_Output(other, self, "DIA_Jesper_Hallo_Anfuehrer_15_00"); //带 我 去 你 的 首 领 那 里 。
	AI_Output(self, other, "DIA_Jesper_Hallo_Anfuehrer_09_01"); //（ 卑 鄙 地 笑 ） 哈 - 我 的 首 领 ？ 我 敢 肯 定 凯 希 亚 会 想 跟 你 谈 谈 。
	AI_Output(self, other, "DIA_Jesper_Hallo_Anfuehrer_09_02"); //往 前 走 - 但 别 想 愚 弄 我 。
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "START");
};

//////////////////////////////////////////////////////////////////////
//	Info Lernen freischalten
///////////////////////////////////////////////////////////////////////
instance DIA_Jesper_Bezahlen(C_INFO)
{
	npc				= VLK_446_Jesper;
	nr				= 1;
	condition		= DIA_Jesper_Bezahlen_Condition;
	information		= DIA_Jesper_Bezahlen_Info;
	permanent		= TRUE;
	description		= "你 能 教 我 什 么 吗 ？";
};

func int DIA_Jesper_Bezahlen_Condition()
{
	if ((Join_Thiefs == TRUE)
	&& (Jesper_TeachSneak == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Cassia_Lernen))
	&& (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Bezahlen_Info()
{
	AI_Output(other, self, "DIA_Jesper_Bezahlen_15_00"); //你 能 教 我 什 么 吗 ？

	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output(self, other, "DIA_Jesper_Bezahlen_09_01"); //当 然 ， 我 会 告 诉 你 怎 样 潜 行 - 对 你 免 费 。
		Jesper_TeachSneak = TRUE;
		Info_ClearChoices(DIA_Jesper_Bezahlen);
	}
	else
	{
		AI_Output(self, other, "DIA_Jesper_Bezahlen_09_02"); //你 想 要 学 会 怎 样 在 行 动 时 不 发 出 任 何 声 音 ？ 那 需 要 1 0 0 个 金 币 。
		B_Say_Gold(self, other, Jesper_Cost);

		Info_ClearChoices(DIA_Jesper_Bezahlen);
		Info_AddChoice(DIA_Jesper_Bezahlen, "以 后 吧 … … （ 返 回 ）", DIA_Jesper_Bezahlen_Spaeter);
		Info_AddChoice(DIA_Jesper_Bezahlen, "好 ， 我 想 要 学 习 如 何 潜 行 （ 付 １ ０ ０ 金 币 ）", DIA_Jesper_Bezahlen_Okay);
	};
};

func void DIA_Jesper_Bezahlen_Spaeter()
{
	Info_ClearChoices(DIA_Jesper_Bezahlen);
};

func void DIA_Jesper_Bezahlen_Okay()
{
	AI_Output(other, self, "DIA_Jesper_Bezahlen_Okay_15_00"); //好 ， 我 想 要 学 会 怎 样 潜 行 。

	if (B_GiveInvItems(other, self, ItMi_Gold, 100))
	{
		AI_Output(other, self, "DIA_Jesper_Bezahlen_Okay_15_01"); //给 你 金 币 。
		AI_Output(self, other, "DIA_Jesper_Bezahlen_Okay_09_02"); //那 么 ， 等 你 准 备 好 了 就 告 诉 我 。
		Jesper_TeachSneak = TRUE;
		Info_ClearChoices(DIA_Jesper_Bezahlen);
	}
	else
	{
		AI_Output(self, other, "DIA_Jesper_Bezahlen_Okay_09_03"); //没 有 金 币 ， 你 就 学 不 会 任 何 东 西 。
		Info_ClearChoices(DIA_Jesper_Bezahlen);
	};
};

//////////////////////////////////////////////////////////////////////
//	Info Schleichen
///////////////////////////////////////////////////////////////////////
instance DIA_Jesper_Schleichen(C_INFO)
{
	npc				= VLK_446_Jesper;
	nr				= 10;
	condition		= DIA_Jesper_Schleichen_Condition;
	information		= DIA_Jesper_Schleichen_Info;
	permanent		= TRUE;
	description		= "教 我 潜 行 的 技 巧";
};

// --------------------------------------
var int DIA_Jesper_Schleichen_permanent;
// --------------------------------------
func int DIA_Jesper_Schleichen_Condition()
{
	if ((Jesper_TeachSneak == TRUE)
	&& (DIA_Jesper_Schleichen_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Schleichen_Info()
{
	AI_Output(other, self, "DIA_Jesper_Schleichen_15_00"); //教 我 潜 行 的 本 领 。

	if (B_TeachThiefTalent(self, other, NPC_TALENT_SNEAK))
	{
		AI_Output(self, other, "DIA_Jesper_Schleichen_09_01"); //潜 行 是 每 个 盗 贼 的 基 本 要 领 。 首 先 ， 当 你 在 别 人 的 房 子 里 走 动 的 时 候 。
		AI_Output(self, other, "DIA_Jesper_Schleichen_09_02"); //不 要 像 那 样 大 踏 步 走 进 去 。 大 部 分 人 睡 眠 都 很 浅 。
		AI_Output(self, other, "DIA_Jesper_Schleichen_09_03"); //只 有 当 你 潜 行 时 才 没 人 听 得 到 - 那 么 你 就 能 不 受 打 扰 地 工 作 了 。
		DIA_Jesper_Schleichen_permanent = TRUE;
	};
};

//////////////////////////////////////////////////////////////////////
//	Info Freunde getötet
///////////////////////////////////////////////////////////////////////
instance DIA_Jesper_Killer(C_INFO)
{
	npc				= VLK_446_Jesper;
	nr				= 2;
	condition		= DIA_Jesper_Killer_Condition;
	information		= DIA_Jesper_Killer_Info;
	important		= TRUE;
};

func int DIA_Jesper_Killer_Condition()
{
	if (Npc_IsDead(Cassia)
	|| Npc_IsDead(Ramirez))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Killer_Info()
{
	if (Npc_IsDead(Cassia)
	&& Npc_IsDead(Ramirez))
	{
		AI_Output(self, other, "DIA_Jesper_Killer_09_00"); //你 杀 了 我 的 朋 友 。 你 为 什 么 要 那 样 做 ， 你 这 个 杀 人 犯 ？
		AI_Output(self, other, "DIA_Jesper_Killer_09_01"); //我 要 把 你 送 到 贝 利 尔 所 在 的 领 域 去 。
	}
	else if (Npc_IsDead(Cassia))
	{
		AI_Output(self, other, "DIA_Jesper_Killer_09_02"); //你 杀 了 凯 希 亚 ， 你 这 个 肮 脏 的 杀 人 犯 。 但 是 ， 你 别 想 从 我 这 里 过 去 ！

		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_NONE, 1);
	}
	else if (Npc_IsDead(Ramirez))
	{
		AI_Output(self, other, "DIA_Jesper_Killer_09_03"); //我 已 经 为 雷 米 瑞 兹 做 了 很 多 的 事 情 ， 攒 了 很 多 的 钱 ， 那 比 你 以 前 见 过 的 都 要 多 。
		AI_Output(self, other, "DIA_Jesper_Killer_09_04"); //你 刚 刚 杀 了 他 ， 你 这 个 可 恶 的 坏 蛋 ！ 现 在 要 你 自 食 其 果 ！

		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_NONE, 1);
	};
};

//////////////////////////////////////////////////////////////////////
//	Info Bogen
///////////////////////////////////////////////////////////////////////
instance DIA_Jesper_Bogen(C_INFO)
{
	npc				= VLK_446_Jesper;
	nr				= 10;
	condition		= DIA_Jesper_Bogen_Condition;
	information		= DIA_Jesper_Bogen_Info;
	description		= "你 知 道 和 伯 斯 波 的 弓 有 关 的 事 吗 ？ ";
};

func int DIA_Jesper_Bogen_Condition()
{
	if ((Npc_HasItems(other, ItRw_Bow_L_03_MIS) < 1)
	&& (MIS_Bosper_Bogen == LOG_RUNNING)
	&& (Join_Thiefs == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Bogen_Info()
{
	AI_Output(other, self, "DIA_Jesper_Bogen_15_00"); //你 知 道 和 伯 斯 波 的 弓 有 关 的 事 吗 ？
	AI_Output(self, other, "DIA_Jesper_Bogen_09_01"); //你 是 说 那 个 制 弓 匠 的 弓 ？ 是 的 ， 我 把 它 收 在 一 个 箱 子 里 了 。
	AI_Output(self, other, "DIA_Jesper_Bogen_09_02"); //但 是 那 里 有 很 多 老 鼠 在 打 转 。 你 可 以 去 把 它 拿 来 ， 如 果 那 些 畜 生 不 打 扰 你 的 话 。
	AI_Output(self, other, "DIA_Jesper_Bogen_09_03"); //哦 ， 当 然 那 个 箱 子 是 被 锁 住 了 。 你 只 能 想 办 法 打 开 它 了 。 （ 咧 着 嘴 笑 ） 但 愿 你 还 有 一 把 开 锁 工 具 。

	Wld_InsertNpc(Giant_Rat, "NW_CITY_KANAL_ROOM_01_01");
	Wld_InsertNpc(Giant_Rat, "NW_CITY_KANAL_ROOM_01_02");
	Wld_InsertNpc(Giant_Rat, "NW_CITY_KANAL_ROOM_01_03");
};

//////////////////////////////////////////////////////////////////////
//	Info Tür
///////////////////////////////////////////////////////////////////////
instance DIA_Jesper_Tuer(C_INFO)
{
	npc				= VLK_446_Jesper;
	nr				= 10;
	condition		= DIA_Jesper_Tuer_Condition;
	information		= DIA_Jesper_Tuer_Info;
	description		= "那 扇 锁 住 的 门 后 面 有 什 么 ？ ";
};

func int DIA_Jesper_Tuer_Condition()
{
	if ((MIS_CassiaRing == LOG_SUCCESS)
	&& (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Tuer_Info()
{
	AI_Output(other, self, "DIA_Jesper_Tuer_15_00"); //那 扇 锁 住 的 门 后 面 有 什 么 ？
	AI_Output(self, other, "DIA_Jesper_Tuer_09_01"); //（ 咧 着 嘴 笑 ） 那 后 面 就 是 那 个 箱 子 - 开 锁 大 师 芬 格 斯 的 箱 子 。
	AI_Output(self, other, "DIA_Jesper_Tuer_09_02"); //他 在 它 上 面 装 了 一 把 如 此 难 以 置 信 的 复 杂 的 锁 ， 直 到 现 在 ， 没 有 一 个 人 能 打 开 它 。
	AI_Output(self, other, "DIA_Jesper_Tuer_09_03"); //不 幸 的 是 ， 他 被 逮 捕 了 - 他 们 把 他 扔 进 了 屏 障 ， 也 许 他 死 在 了 那 里 。
	AI_Output(self, other, "DIA_Jesper_Tuer_09_04"); //不 过 ， 如 果 你 想 试 试 打 开 这 个 箱 子 的 话 ， 给 你 进 房 间 的 钥 匙 。

	B_GiveInvItems(self, other, ItKe_Fingers, 1);
};

//////////////////////////////////////////////////////////////////////
//	Info Truhe
///////////////////////////////////////////////////////////////////////
instance DIA_Jesper_Truhe(C_INFO)
{
	npc				= VLK_446_Jesper;
	nr				= 10;
	condition		= DIA_Jesper_Truhe_Condition;
	information		= DIA_Jesper_Truhe_Info;
	description		= "我 想 办 法 打 开 了 箱 子 。 ";
};

func int DIA_Jesper_Truhe_Condition()
{
	if ((Mob_HasItems("MOB_FINGERS", Itmi_Gold) < 300)
	|| (Mob_HasItems("MOB_FINGERS", Itmi_Silvercup) < 5)
	|| (Mob_HasItems("MOB_FINGERS", Itmi_Goldcup) < 1)
	|| (Mob_HasItems("MOB_FINGERS", ItAM_Strg_01) < 1)
	|| (Mob_HasItems("MOB_FINGERS", ItPO_perm_Dex) < 1))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Truhe_Info()
{
	AI_Output(other, self, "DIA_Jesper_Truhe_15_00"); //我 想 办 法 打 开 了 箱 子 。
	AI_Output(self, other, "DIA_Jesper_Truhe_09_01"); //难 以 置 信 ！ 看 来 ， 我 们 有 了 一 位 新 的 开 锁 大 师 ！
	AI_Output(self, other, "DIA_Jesper_Truhe_09_02"); //恭 喜 你 拥 有 这 么 高 超 的 技 艺 。

	B_GivePlayerXP(XP_JesperTruhe);
};
