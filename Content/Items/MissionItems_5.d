//**********************************************************************************
//	ItWr_XardasLetterToOpenBook_MIS an den SC um die HALLEN von Irdorath zu öffnen!
// ----------------------------------------------------------------------------------

instance ItWr_XardasLetterToOpenBook_MIS(C_Item)
{
	name						= "艾 克 萨 达 斯 的 信";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_XardasLetterToOpenBook;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string XardasLetterToOpenBook_1 = "我 怀 疑 在 矿 藏 山 谷 有 某 只 龙 是 邪 恶 的 根 源 。";
const string XardasLetterToOpenBook_2 = "我 错 了 。";
const string XardasLetterToOpenBook_3 = "如 果 一 切 都 象 我 预 期 的 那 样 发 生 了 ， ";
const string XardasLetterToOpenBook_4 = "你 现 在 应 该 在 寻 找 伊 尔 多 拉 斯 大 厅 。 ";
const string XardasLetterToOpenBook_5 = "你 交 给 皮 罗 卡 的 书 里 面 包 含 所 有 你 需 要 的 线 索 。";
const string XardasLetterToOpenBook_6 = "我 应 该 知 道 为 什 么 搜 索 者 要 找 它 ，";
const string XardasLetterToOpenBook_7 = " 如 此 地 迫 切 。";
const string XardasLetterToOpenBook_8 = "你 必 须 把 它 拿 回 来 ！";
const string XardasLetterToOpenBook_9 = "咒 语 ‘ Ｘ Ａ Ｒ Ａ Ｋ Ｂ Ｅ Ｎ Ｄ Ａ Ｒ Ｄ Ｏ ’ 可 以 打 开 它 。 不 要 告 诉 任 何 人 ！";
const string XardasLetterToOpenBook_10 = "我 现 在 有 更 重 要 的 事 情 要 做 。";
const string XardasLetterToOpenBook_11 = "我 在 你 的 任 务 中 不 能 帮 上 任 何 忙 。 只 有 你 可 以 击 败 邪 恶 的 根 源 。";
const string XardasLetterToOpenBook_12 = "我 们 会 再 见 面 的 ！ ";
const string XardasLetterToOpenBook_13 = "                             艾 克 萨 达 斯";
func void Use_XardasLetterToOpenBook()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, XardasLetterToOpenBook_1);
				Doc_PrintLines	(nDocID, 0, XardasLetterToOpenBook_2);
				Doc_PrintLines	(nDocID, 0, XardasLetterToOpenBook_3);
				Doc_PrintLines	(nDocID, 0, XardasLetterToOpenBook_4);
				Doc_PrintLines	(nDocID, 0, XardasLetterToOpenBook_5);
				Doc_PrintLines	(nDocID, 0, XardasLetterToOpenBook_6);
				Doc_PrintLines	(nDocID, 0, XardasLetterToOpenBook_7);
				Doc_PrintLines	(nDocID, 0, XardasLetterToOpenBook_8);
				Doc_PrintLines	(nDocID, 0, XardasLetterToOpenBook_9);
				Doc_PrintLines	(nDocID, 0, XardasLetterToOpenBook_10);
				Doc_PrintLines	(nDocID, 0, XardasLetterToOpenBook_11);
				Doc_PrintLines	(nDocID, 0, XardasLetterToOpenBook_12);
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, XardasLetterToOpenBook_13);
	Doc_Show(nDocID);

	if (MIS_Xardas_SCCanOpenIrdorathBook == FALSE)
	{
		B_LogEntry(TOPIC_BuchHallenVonIrdorath, TOPIC_BuchHallenVonIrdorath_2);
	};

	MIS_Xardas_SCCanOpenIrdorathBook = TRUE; // Joly: Spieler kann nun das Buch im Kloster lesen und findet so die geheime Bibliothek!
};

//**********************************************************************************
//	ItKe_MonastarySecretLibrary_Mis Schlüssel zur geheimen Bibliothek
//**********************************************************************************

instance ItKe_MonastarySecretLibrary_Mis(C_Item)
{
	name						= "钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_02.3ds";
	material					= MAT_METAL;

	value						= Value_Key_02;

	description					= name;
	text[0]						= "来 自 书 本 ‘ 伊 尔 多 拉 斯 大 厅 ’";		count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//**********************************************************************************
//	ItWr_HallsofIrdorath_Mis
//**********************************************************************************

instance ItWr_HallsofIrdorath_Mis(C_ITEM)
{
	name						= "伊 尔 多 拉 斯 大 厅";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Book_02_05.3ds"; // BUCH VARIATIONEN: ItWr_Book_01.3DS, ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_HallsofIrdorath;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_HallsofIrdorath()
{
	if (MIS_Xardas_SCCanOpenIrdorathBook == TRUE)
	{
		B_Say(self, self, "$SCOPENSIRDORATHBOOK");

		Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE", hero, hero, 0, 0, 0, FALSE);
		Snd_Play("SFX_HealObsession");

		CreateInvItems(hero, ItWr_HallsofIrdorath_Open_Mis, 1);
		CreateInvItems(hero, ItKe_MonastarySecretLibrary_Mis, 1);
		CreateInvItems(hero, ItWr_UseLampIdiot_Mis, 1);

		Print(PRINT_IrdorathBookHiddenKey);
		B_GivePlayerXP(XP_HallsofIrdorathIsOpen);
		ItWr_HallsofIrdorathIsOpen = TRUE;

		B_LogEntry(TOPIC_BuchHallenVonIrdorath, TOPIC_BuchHallenVonIrdorath_3);
	}
	else
	{
		CreateInvItems(hero, ItWr_HallsofIrdorath_Mis, 1); // Joly: wegen MAPSEALED!!!!!

		Print(PRINT_IrdorathBookDoesntOpen);
		Wld_PlayEffect("spellFX_Fear", self, self, 0, 0, 0, FALSE);
		Snd_Play("MFX_FEAR_CAST");
	};
};

//**********************************************************************************
//	ItWr_HallsofIrdorath_Open_Mis
//**********************************************************************************

instance ItWr_HallsofIrdorath_Open_Mis(C_ITEM)
{
	name						= "伊 尔 多 拉 斯 大 厅";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Book_02_05.3ds"; // BUCH VARIATIONEN: ItWr_Book_01.3DS, ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_HallsofIrdorath_Open;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string HallsofIrdorath_Open_1 = "… … 因 此 我 把 图 书 馆 的 入 口 隐 藏 在 一 扇 密 门 之 后 ， 来 保 护 我 关 于 贝 利 尔 神 殿 的 记 录 。 ";
const string HallsofIrdorath_Open_2 = "如 果 我 的 兄 弟 们 知 道 这 些 记 录 的 话 ， 那 些 傻 瓜 一 样 会 把 它 们 都 毁 掉 。";
const string HallsofIrdorath_Open_3 = "现 在 ， 他 们 所 有 人 知 道 的 知 识 可 以 使 得 这 些 神 殿 继 续 生 存 下 去 。";
const string HallsofIrdorath_Open_4 = "为 了 预 防 万 一 ， 我 让 一 些 信 徒 发 誓 保 护 图 书 馆 。";
const string HallsofIrdorath_Open_5 = "这 把 钥 匙 可 以 打 开 最 后 的 门 。";
func void Use_HallsofIrdorath_Open()
{
	if (ItWr_SCReadsHallsofIrdorath == FALSE)
	{
		B_LogEntry(TOPIC_BuchHallenVonIrdorath, TOPIC_BuchHallenVonIrdorath_4);
	};

	ItWr_SCReadsHallsofIrdorath = TRUE;

	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 2); // wieviel Pages

	Doc_SetPage(nDocID, 0, "BOOK_MAGE_L.tga", 0); // VARIATIONEN: BOOK_BROWN_L.tga, BOOK_MAGE_L.tga, BOOK_RED_L.tga
	Doc_SetPage(nDocID, 1, "BOOK_MAGE_R.tga", 0); // VARIATIONEN: BOOK_BROWN_R.tga, BOOK_MAGE_R.tga, BOOK_RED_R.tga

	// 1.Seite

				Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, HallsofIrdorath_Open_1);
				Doc_PrintLines	(nDocID, 0, HallsofIrdorath_Open_2);

	// 2.Seite
				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1); // 0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont(nDocID, 1, FONT_BookHeadline); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_SetFont(nDocID, 1, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, HallsofIrdorath_Open_3);
				Doc_PrintLine	(nDocID, 1, "");
	// Absatz
				Doc_PrintLines	(nDocID, 1, HallsofIrdorath_Open_4);
				Doc_PrintLine	(nDocID, 1, "");
	// Absatz
				Doc_PrintLine	(nDocID, 1, "");
	// Absatz
				Doc_PrintLines	(nDocID, 1, HallsofIrdorath_Open_5);

	Doc_Show(nDocID);
};

//**********************************************************************************
//	ItWr_XardasSeamapBook_Mis
//**********************************************************************************

instance ItWr_XardasSeamapBook_Mis(C_ITEM)
{
	name						= "积 满 灰 尘 的 书";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Book_02_01.3ds"; // BUCH VARIATIONEN: ItWr_Book_01.3DS, ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_XardasSeamapBook_Mis;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string XardasSeamapBook_Mis_1 = "… … 我 现 在 肯 定 这 座 建 筑 是 伊 尔 多 拉 斯 大 厅 。 它 们 坐 落 在 非 常 靠 近 克 霍 里 尼 斯 海 港 的 一 座 岛 上 。 贝 利 尔 对 矿 石 的 渴 求 显 而 易 见 … …";
const string XardasSeamapBook_Mis_2 = "… … 他 们 越 强 大 ， 那 么 他 们 成 为 亡 灵 奴 仆 后 的 价 值 就 越 大 。 这 些 改 变 立 场 的 圣 骑 士 对 于 战 士 来 说 是 及 其 难 以 击 败 的 。 他 们 中 有 一 个 已 经 落 入 了 我 的 手 中 。 我 仅 仅 希 望 其 他 的 人 没 有 注 意 到 他 来 到 这 里 … …";
const string XardasSeamapBook_Mis_3 = "… … 被 转 变 的 圣 骑 士 似 乎 不 再 对 任 何 刺 激 产 生 反 应 。 我 把 他 的 盔 甲 和 他 的 其 它 剩 余 物 品 藏 在 后 面 的 房 间 里 。 门 只 能 从 里 面 打 开 。 我 已 经 建 立 了 传 送 咒 语 用 来 进 入 房 间 。 我 把 说 明 写 入 了 年 鉴 ， 以 便 ‘ 那 个 人 ’ 可 以 找 到 它 们 … …";
const string XardasSeamapBook_Mis_4 = "… … 标 记 非 常 明 显 ！ 当 那 个 人 来 的 时 候 ， 他 需 要 所 有 我 们 能 够 给 予 的 帮 助 。 贝 利 尔 已 经 太 强 大 了 。 如 果 成 功 取 得 某 些 无 价 的 宝 物 后 ， 我 会 把 它 保 管 在 这 里 。 我 猜 想 ， 天 选 者 会 从 我 们 之 间 产 生 ， ";
const string XardasSeamapBook_Mis_5 = "所 以 我 把 说 明 写 入 年 鉴 供 他 参 考 。";
const string XardasSeamapBook_Mis_6 = "… … 我 现 在 十 分 肯 定 。 我 们 无 法 阻 止 命 运 之 手 。 当 贝 利 尔 足 够 强 大 时 ， 他 会 出 现 ， 并 试 图 统 治 世 界 。 我 必 须 找 到 ‘ 那 个 人 ’ ， 否 则 我 们 都 会 被 毁 灭 。";
const string XardasSeamapBook_Mis_7 = "… … 那 会 是 一 场 战 争 ， 一 场 决 定 世 界 命 运 的 战 争 。 看 来 我 是 唯 一 一 个 可 以 解 释 标 记 的 人 。 我 周 围 所 有 的 人 似 乎 都 忽 略 了 它 们 。 ‘ 天 选 者 ’ 将 会 到 来 ， 并 且 他 的 到 来 将 会 宣 布 战 争 的 开 始 。 这 是 一 场 和 事 件 同 样 古 老 的 战 争 ， 但 是 结 果 似 乎 马 上 就 会 出 现 在 眼 前 。  ";
const string XardasSeamapBook_Mis_8 = "当 其 他 人 要 把 世 界 的 命 运 控 制 在 他 们 手 中 时 ， 我 不 会 袖 手 旁 观 。";
const string XardasSeamapBook_Mis_9 = "… … 我 已 经 研 究 了 远 古 的 文 字 ， 并 且 我 已 经 知 道 了 如 何 制 造 远 古 龙 王 的 传 说 武 器 。 但 是 ， 我 不 知 道 如 何 获 得 原 料 。 我 已 经 把 配 方 写 入 年 鉴 以 防 万 一 。 谁 知 道 未 来 会 出 现 什 么 恐 怖 的 事 物 - 甚 至 可 能 是 龙 。";
func void Use_XardasSeamapBook_Mis()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 2); // wieviel Pages

	Doc_SetPage(nDocID, 0, "BOOK_BROWN_L.tga", 0); // VARIATIONEN: BOOK_BROWN_L.tga, BOOK_MAGE_L.tga, BOOK_RED_L.tga
	Doc_SetPage(nDocID, 1, "BOOK_BROWN_R.tga", 0); // VARIATIONEN: BOOK_BROWN_R.tga, BOOK_MAGE_R.tga, BOOK_RED_R.tga

	// 1.Seite

				Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, XardasSeamapBook_Mis_1);
				Doc_PrintLines	(nDocID, 0, "");

	if (hero.guild == GIL_PAL)
	{
				Doc_PrintLines	(nDocID, 0, XardasSeamapBook_Mis_2);

		// 2.Seite
				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1); // 0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont(nDocID, 1, FONT_BookHeadline); // -1 -> all pages
				Doc_SetFont(nDocID, 1, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, XardasSeamapBook_Mis_3);
	};

	if (hero.guild == GIL_KDF)
	{
				Doc_PrintLines	(nDocID, 0, XardasSeamapBook_Mis_4);

		// 2.Seite
				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1); // 0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont(nDocID, 1, FONT_BookHeadline); // -1 -> all pages
				Doc_SetFont(nDocID, 1, FONT_Book); // -1 -> all pages
				Doc_PrintLines	(nDocID, 1, XardasSeamapBook_Mis_5);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, XardasSeamapBook_Mis_6);
	};

	if (hero.guild == GIL_DJG)
	{
				Doc_PrintLines	(nDocID, 0, XardasSeamapBook_Mis_7);

		// 2.Seite
				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1); // 0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont(nDocID, 1, FONT_BookHeadline); // -1 -> all pages
				Doc_SetFont(nDocID, 1, FONT_Book); // -1 -> all pages
				Doc_PrintLines	(nDocID, 1, XardasSeamapBook_Mis_8);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, XardasSeamapBook_Mis_9);
	};

	Doc_Show(nDocID);
};

//**********************************************************************
//	geheime Nachricht geheimer Schalter Lampe
//**********************************************************************

instance ItWr_UseLampIdiot_Mis(C_Item)
{
	name						= "褶 皱 的 信";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseItWr_UseLampIdiot_Mis;

	value						= 50;

	description					= name;
	text[0]						= "来 自 书 本 ‘ 伊 尔 多 拉 斯 大 厅 ’";		count[0] = 0;
};

const string ItWr_UseLampIdiot_Mis_1 = "     灯 把 光 线 ";
const string ItWr_UseLampIdiot_Mis_2 = "     照 射 到 较 低 的 区 域";
func void UseItWr_UseLampIdiot_Mis()
{
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_BookHeadline);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetFont(nDocID, 0, FONT_Book);
				Doc_PrintLine	(nDocID, 0, ItWr_UseLampIdiot_Mis_1);
				Doc_PrintLine	(nDocID, 0, ItWr_UseLampIdiot_Mis_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetMargins(nDocID, -1, 200, 50, 50, 50, 1);
	Doc_Show(nDocID);
};

//**********************************************************************************
//	ItWr_Seamap_Irdorath
//**********************************************************************************

instance ItWr_Seamap_Irdorath(C_Item)
{
	name						= "伊 尔 多 拉 斯 之 岛 的 海 图";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Map_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Seamap_Irdorath;

	value						= 50;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_Seamap_Irdorath()
{
	var int nDocID;

	nDocID = Doc_CreateMap(); // DocManager
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "Map_NewWorld_Seamap.tga", 1); // 1 -> DO NOT SCALE
	Doc_Show(nDocID);

	if ((MIS_ShipIsFree == FALSE)
	&& (Kapitel < 6))
	{
		B_Say(self, self, "$IRDORATHTHEREYOUARE");
	};

	if (MIS_SCKnowsWayToIrdorath == FALSE)
	{
		Log_CreateTopic(TOPIC_SHIP, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SHIP, LOG_RUNNING);
		B_LogEntry(TOPIC_SHIP, TOPIC_SHIP_3);
		B_GivePlayerXP(XP_SCKnowsWayToIrdorath);
	};

	MIS_SCKnowsWayToIrdorath = TRUE;
};

//**********************************************************************
//	Gefälschter Brief von Lee zum benutzen des Schiffes
//**********************************************************************

instance ITWr_ForgedShipLetter_MIS(C_Item)
{
	name						= "比 尔 号";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseITWr_ForgedShipLetter_MIS;

	value						= 50;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "授 权 信";						count[3] = 0;
	text[4]						= "给 圣 骑 士 的 船 。";				count[4] = 0;
};

const string ITWr_ForgedShipLetter_MIS_1 = " 授 权 信";
const string ITWr_ForgedShipLetter_MIS_2 = " 这 份 文 件 允 许 携 带 者";
const string ITWr_ForgedShipLetter_MIS_3 = " 持 有 者 可 以 在 哈 根 勋 爵 的";
const string ITWr_ForgedShipLetter_MIS_4 = " 皇 家 战 舰 上 自 由 行 动 ， 并";
const string ITWr_ForgedShipLetter_MIS_5 = " 下 等 区 域。";
const string ITWr_ForgedShipLetter_MIS_6 = "     皇 家 封 印";
func void UseITWr_ForgedShipLetter_MIS()
{
	var int nDocID;

// Joly:VORSICHT : Dieser Brief ist ein ERMÄCHTIGUNGSSCHREIBEN für das Schiff und kann von LEE oder dem Richter stammen. NICHT zwangsläufig von Lord Hagen oder gefälscht!!!!!!!!!

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_BookHeadline);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ITWr_ForgedShipLetter_MIS_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetFont(nDocID, 0, FONT_Book);
				Doc_PrintLine	(nDocID, 0, ITWr_ForgedShipLetter_MIS_2);
				Doc_PrintLine	(nDocID, 0, ITWr_ForgedShipLetter_MIS_3);
				Doc_PrintLine	(nDocID, 0, ITWr_ForgedShipLetter_MIS_4);
				Doc_PrintLine	(nDocID, 0, ITWr_ForgedShipLetter_MIS_5);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ITWr_ForgedShipLetter_MIS_6);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetMargins(nDocID, -1, 200, 50, 50, 50, 1);
	Doc_Show(nDocID);
};

instance ITKE_OC_MAINGATE_MIS(C_Item)
{
	name						= "主 城 门 守 卫 的 塔 楼 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ITKE_SHIP_LEVELCHANGE_MIS(C_Item) // Joly: führt zum Levelchange Kapitel 6!!!!!!!!!!!!!!!!!!!!!!
{
	name						= "船 长 住 所 的 钥 匙";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_03.3ds";
	material					= MAT_METAL;

	value						= Value_Key_03;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItPo_PotionOfDeath_01_Mis(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_ITEMGLIMMER";

	visual						= "ItMi_Flask.3ds";
	material					= MAT_GLAS;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseItPo_PotionOfDeath;

	value						= 10;

	description					= "英 诺 斯 之 泪";
	text[0]						= "";											count[0] = 0;
	text[1]						= "???";										count[1] = Mana_Essenz;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseItPo_PotionOfDeath()
{
	if (hero.guild == GIL_KDF)
	{
		Wld_PlayEffect("spellFX_LIGHTSTAR_BLUE", hero, hero, 0, 0, 0, FALSE);
		Snd_Play("SFX_HealObsession");
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];

		Npc_ChangeAttribute(self, ATR_STRENGTH, 5);
		self.aivar[REAL_STRENGTH] = self.aivar[REAL_STRENGTH] + 5;
		Npc_ChangeAttribute(self, ATR_DEXTERITY, 5);
		self.aivar[REAL_DEXTERITY] = self.aivar[REAL_DEXTERITY] + 5;

		PrintScreen(PRINT_LearnSTR5, -1, 45, FONT_SCREEN, 2);
		PrintScreen(PRINT_LearnDex5, -1, 55, FONT_SCREEN, 2);
		PrintScreen(PRINT_FullyHealed, - 1, 65, FONT_Screen, 2);
		Mdl_ApplyOverlayMDSTimed(self, "HUMANS_SPRINT.MDS", Time_Speed);
	}
	else
	{
		AI_Wait(hero, 3);
		AI_PlayAni(self, "S_FIRE_VICTIM");
		Wld_PlayEffect("VOB_MAGICBURN", hero, hero, 0, 0, 0, FALSE);
		B_Say(self, self, "$Dead");
		AI_StopFX(self, "VOB_MAGICBURN");
		Npc_ChangeAttribute(self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(self, "S_FIRE_VICTIM");
	};
};

instance ItPo_PotionOfDeath_02_Mis(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_ITEMGLIMMER";

	visual						= "ItMi_Flask.3ds";
	material					= MAT_GLAS;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseItPo_PotionOfDeath;

	value						= 10;

	description					= "英 诺 斯 之 泪";
	text[0]						= "";											count[0] = 0;
	text[1]						= "这 种 药 剂 可 以 给 予 火 魔 法 师 特 殊 的 能 力 。";count[1] = 0;
	text[2]						= "其 他 使 用 者 将 会 遭 遇 灭 顶 之 灾 。";			count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//************************************************
//	Amulett des Todes
//************************************************

instance ItAm_AmulettOfDeath_Mis(C_Item)
{
	name						= "英 诺 斯 的 神 圣 光 环";

	mainflag					= ITEM_KAT_MAGIC;
	flags						= ITEM_AMULET;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_ITEMGLIMMER";

	visual						= "ItAm_Prot_Fire_01.3ds";
	visual_skin					= 0;
	material					= MAT_METAL;

	on_equip					= Equip_ItAm_AmulettOfDeath_Mis;
	on_unequip					= UnEquip_ItAm_AmulettOfDeath_Mis;

	value						= 1000;

	description					= "英 诺 斯 的 神 圣 光 环 。";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "这 个 护 身 符 保 护 佩 带 者 ";		count[2] = 0;
	text[3]						= "不 受 任 何 形 式 的 伤 害 。";				count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_AMULETTE_STANDARD;
};

func void Equip_ItAm_AmulettOfDeath_Mis()
{
	self.protection [PROT_EDGE] += 30;
	self.protection [PROT_BLUNT] += 30;
	self.protection [PROT_POINT] += 30;
	self.protection [PROT_FIRE] += 30;
	self.protection [PROT_MAGIC] += 30;
	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE", self, self, 0, 0, 0, FALSE);
	Wld_PlayEffect("FX_EarthQuake", self, self, 0, 0, 0, FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE", self, self, 0, 0, 0, FALSE);
	AI_PlayAni(self, "T_MAGRUN_2_HEASHOOT");
	AI_StandUp(self);
	Snd_Play("MFX_FIRERAIN_INVEST");
};

func void UnEquip_ItAm_AmulettOfDeath_Mis()
{
	self.protection [PROT_EDGE] -= 30;
	self.protection [PROT_BLUNT] -= 30;
	self.protection [PROT_POINT] -= 30;
	self.protection [PROT_FIRE] -= 30;
	self.protection [PROT_MAGIC] -= 30;
};

/******************************************************************************************/
//	Heiltrank für Randolph //
/******************************************************************************************/
instance ItPo_HealRandolph_MIS(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI | ITEM_MISSION;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_ITEMGLIMMER";

	visual						= "ItMi_Flask.3ds";
	material					= MAT_GLAS;

	scemeName					= "POTIONFAST";
	on_state[0]					= Use_HealRandolph;

	value						= Value_HpEssenz;

	description					= "成 瘾 治疗";
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_Essenz;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_HpEssenz;
};

func void Use_HealRandolph()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_Essenz);
};
