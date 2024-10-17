// ##########################################################################
// ##
// ## Hier stehen alle Buchständermobsiscripte
// ##
// ##########################################################################

//*************************************
//	Buchständer in der Klosterbibliothek
//*************************************

const string Bookstand_01_S1_1 = "火 焰 测 试";
const string Bookstand_01_S1_2 = "虽 然 一 个 学 徒 可 能 觉 得 已 经 做 好 准 备 申 请 魔 法 测 试 ， 他 还 不 见 得 会 被 选 中 。 无 论 如 何 ， 如 果 他 的 决 定 经 过 充 分 考 虑 ， 并 且 他 坚 持 的 话 ， 他 有 权 力 要 求 测 试 ， 并 且 没 有 魔 法 师 会 拒 绝 他 。 但 是 他 不 仅 仅 要 通 过 魔 法 测 试 ， 他 还 必 须 通 过 火 焰 得 到 启 迪 。 如 果 他 在 高 级 议 会 前 坚 持 的 话 ， 他 将 参 加 火 焰 测 试 。";
const string Bookstand_01_S1_3 = "测 试 将 会 挑 战 这 个 学 徒 的 智 慧 、 力 量 和 敏 捷 。 因 此 他 必 须 通 过 三 项 考 验 ， 在 与 火 焰 立 下 ‘ 火 焰 誓 言 ’ 契 约 之 前 ， 每 一 项 测 试 都 由 高 级 议 会 的 一 名 魔 法 师 为 他 安 排 。 ";
const string Bookstand_01_S1_4 = "这 是 英 诺 斯 的 意 愿 ， 因 此 必 须 这 样 做 。 ";
const string Bookstand_01_S1_5 = "高 级 议 会";
func void Use_Bookstand_01_S1() // Buchständer in der Magierbibliothek
{
	var C_Npc her; her = Hlp_GetNpc(PC_Hero);

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if (hero.guild == GIL_NOV)
		{
			KNOWS_FIRE_CONTEST = TRUE; // für die Prüfung des Feuers

			Log_CreateTopic(TOPIC_FireContest, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_FireContest, LOG_RUNNING);
			B_LogEntry(TOPIC_FireContest, TOPIC_FireContest_1);
		};

		var int nDocID;

		nDocID = Doc_Create();
		Doc_SetPages(nDocID, 2);
		Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
		Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);

		Doc_SetFont(nDocID, -1, FONT_Book);
		Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);

		Doc_PrintLine(nDocID, 0, Bookstand_01_S1_1);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, "");

		Doc_PrintLines(nDocID, 0, Bookstand_01_S1_2);

		Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_01_S1_3);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_01_S1_4);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_01_S1_5);
		Doc_Show(nDocID);
	};
};

//*************************************
//	Buchständer in der Geheimen Bibliothek
//*************************************
// --------------------------------------
var int FinalDragonEquipment_Once;
// --------------------------------------

const string FINALDRAGONEQUIPMENT_S1_1 = "… … 我 希 望 穹 窿 可 以 保 护 矿 石 不 受 贝 利 尔 的 威 胁 。 国 王 太 天 真 了 ， 以 为 我 们 修 建 穹 窿 是 为 了 防 止 破 坏 。 嗯 ， 只 要 这 条 计 策 继 续 下 去 ， 我 们 就 可 以 完 成 进 一 步 的 目 标 。 我 只 能 希 望 我 们 还 有 足 够 的 时 间 为 战 斗 做 好 准 备 。 只 要 矿 藏 山 谷 四 周 的 穹 窿 一 建 好 ， 我 就 要 调 用 所 有 能 够 调 用 的 力 量 来 阻 止 战 斗 。 ";
const string FINALDRAGONEQUIPMENT_S1_2 = "… … 我 按 照 说 明 ， 把 英 诺 斯 的 圣 水 倒 在 咒 语 台 上 的 空 白 咒 语 石 里 。 咒 语 石 被 毁 掉 了 。 我 猜 测 这 个 魔 法 真 的 只 有 ‘ 天 选 者 ’ 才 能 施 展 。";
const string FINALDRAGONEQUIPMENT_S1_3 = "我 把 英 诺 斯 的 神 圣 光 环 留 下 保 护 修 道 院 。 在 天 选 者 出 现 前 ， 修 道 院 能 够 保 全 自 己 。";
const string FINALDRAGONEQUIPMENT_S1_4 = "英 诺 斯 之 泪 可 能 在 将 来 的 战 斗 中 起 到 重 要 的 作 用 。 但 是 把 它 放 在 所 有 人 都 能 看 到 的 地 方 太 危 险 了 。 我 最 好 把 它 们 放 在 图 书 馆 这 里 。";
const string FINALDRAGONEQUIPMENT_S1_5 = "你 必 须 制 造 一 个 传 送 咒 语 咒 语 抵 达 那 个 秘 密 的 地 方 。 为 此 ， 你 需 要 一 块 空 白 的 咒 语 石 和 一 小 瓶 圣 水 。 你 可 以 使 用 这 个 咒 语 传 送 到 房 间 里 面 去 。";
const string FINALDRAGONEQUIPMENT_S1_6 = "我 现 在 相 当 肯 定 英 诺 斯 之 泪 是 古 代 圣 骑 士 用 来 进 行 失 传 已 久 的 仪 式 ： 神 圣 化 剑 。 那 意 味 着 我 可 以 用 我 发 现 的 小 瓶 子 给 神 圣 化 的 武 器 增 加 额 外 的 力 量 。";
const string FINALDRAGONEQUIPMENT_S1_7 = "来 自 ： 龙 王 武 器 。";
const string FINALDRAGONEQUIPMENT_S1_8 = "要 想 制 造 出 最 硬 的 龙 鳞 盔 甲 ， 就 要 用 采 自 凯 瑞 尼 斯 山 谷 的 矿 石 涂 抹 在 鳞 片 上 。";
const string FINALDRAGONEQUIPMENT_S1_9 = "要 制 造 最 有 价 值 的 龙 王 刀 ， 刀 片 必 须 使 用 龙 血 浸 泡 。 即 便 ５ 瓶 龙 血 也 能 赐 予 钢 铁 无 比 的 锋 利 和 力 量 。";
const string FINALDRAGONEQUIPMENT_S1_10 = "注 释 ： ‘ 凯 瑞 尼 斯 ’ 可 能 就 是 指 我 们 现 在 所 知 道 的 克 霍 里 尼 斯 。";
func void Use_FINALDRAGONEQUIPMENT_S1() // Buchständer in der geheimen Bibliothek
{
	var C_Npc her; her = Hlp_GetNpc(PC_Hero);

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		var int nDocID;

		nDocID = Doc_Create();
		Doc_SetPages(nDocID, 2);
		Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0);
		Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0);

		Doc_SetFont(nDocID, -1, FONT_Book);
		Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);

		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLines(nDocID, 0, FINALDRAGONEQUIPMENT_S1_1);
		Doc_PrintLines(nDocID, 0, "");

		if (hero.guild == GIL_KDF)
		{
			PlayerGetsAmulettOfDeath = TRUE;
			PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] = TRUE;
			B_LogEntry(TOPIC_TalentRunes, TOPIC_TalentRunes_1);

			Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
			Doc_PrintLine(nDocID, 1, "");
			Doc_PrintLines(nDocID, 1, FINALDRAGONEQUIPMENT_S1_2);
			Doc_PrintLines(nDocID, 1, FINALDRAGONEQUIPMENT_S1_3);
			Doc_PrintLines(nDocID, 1, FINALDRAGONEQUIPMENT_S1_4);
			Doc_Show(nDocID);
		}
		else if (hero.guild == GIL_PAL)
		{
			PAL_KnowsAbout_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] = TRUE;
			PrintScreen(PRINT_LearnPalTeleportSecret, -1, -1, FONT_Screen, 2);

			Log_CreateTopic(TOPIC_TalentRunes, LOG_NOTE);
			B_LogEntry(TOPIC_TalentRunes, TOPIC_TalentRunes_2);
			Log_AddEntry(TOPIC_TalentRunes, TOPIC_TalentRunes_3);

			Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
			Doc_PrintLine(nDocID, 1, "");
			Doc_PrintLines(nDocID, 1, FINALDRAGONEQUIPMENT_S1_5);
			Doc_PrintLine(nDocID, 1, "");
			Doc_PrintLines(nDocID, 1, FINALDRAGONEQUIPMENT_S1_6);
			Doc_PrintLine(nDocID, 1, "");
			Doc_Show(nDocID);
		}
		else
		{
			PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] = TRUE;
			PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] = TRUE;

			PrintScreen(PRINT_LearnSmith, -1, -1, FONT_Screen, 2);
			Npc_SetTalentSkill(self, NPC_TALENT_SMITH, 1);
			Log_CreateTopic(TOPIC_TalentSmith, LOG_NOTE);
			B_LogEntry(TOPIC_TalentSmith, TOPIC_TalentSmith_1);
			Log_AddEntry(TOPIC_TalentSmith, TOPIC_TalentSmith_2);
			B_LogEntry(TOPIC_TalentSmith, TOPIC_TalentSmith_3);
			PlayerGetsFinalDJGArmor = TRUE;

			Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
			Doc_PrintLine(nDocID, 1, "");
			Doc_PrintLines(nDocID, 1, FINALDRAGONEQUIPMENT_S1_7);
			Doc_PrintLines(nDocID, 1, FINALDRAGONEQUIPMENT_S1_8);
			Doc_PrintLine(nDocID, 1, "");
			Doc_PrintLines(nDocID, 1, FINALDRAGONEQUIPMENT_S1_9);
			Doc_PrintLine(nDocID, 1, "");
			Doc_PrintLines(nDocID, 1, FINALDRAGONEQUIPMENT_S1_10);
			Doc_Show(nDocID);
		};

		if (FinalDragonEquipment_Once == FALSE)
		{
			B_GivePlayerXP(XP_FinalDragonEquipment);
			FinalDragonEquipment_Once = TRUE;
		};
	};
};
