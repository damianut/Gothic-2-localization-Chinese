// -------------------------------------------------------------------------------------
//				Milten_03 // oben
// -------------------------------------------------------------------------------------
const string Bookstand_Milten_03_S1_1 = "已 经 晚 了 。";
const string Bookstand_Milten_03_S1_2 = "旧 矿 井 的 崩 溃 导 致 了 矿 石 大 亨 的 情 绪 的 低 落 。";
const string Bookstand_Milten_03_S1_3 = "高 梅 兹 象 一 个 马 上 就 要 爆 炸 的 炸 药 桶 。  ";
const string Bookstand_Milten_03_S1_4 = "科 瑞 斯 托";
const string Bookstand_Milten_03_S1_5 = "他 认 为 那 个 新 面 孔 应 该 为 矿 井 的 崩 塌 负 责 。 那 个 人 真 的 很 奇 怪 。 但 是 他 最 好 不 要 在 附 近 再 次 出 现 。";
const string Bookstand_Milten_03_S1_6 = "科 瑞 斯 托";
const string Bookstand_Milten_03_S1_7 = "葛 梅 兹 的 脾 气 比 以 往 更 大 了 ， 我 想 我 能 猜 到 他 的 计 划 。 我 们 必 须 警 告 水 法 师 - 在 为 时 已 晚 之 前 。 ";
const string Bookstand_Milten_03_S1_8 = "科 瑞 斯 托";
const string Bookstand_Milten_03_S1_9 = "也 许 我 们 可 以 避 开 一 场 灾 难 。 很 难 想 象 如 果 自 由 矿 井 … … ";
func void Bookstand_Milten_03_S1()
{
	var C_Npc her; her = Hlp_GetNpc(PC_Hero);

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		var int nDocID;

		nDocID = Doc_Create();
		Doc_SetPages(nDocID, 2);
		Doc_SetPage(nDocID, 0, "Book_Brown_L.tga", 0);
		Doc_SetPage(nDocID, 1, "Book_Brown_R.tga", 0);

		Doc_SetFont(nDocID, -1, FONT_Book);
		Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);

		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLines(nDocID, 0, Bookstand_Milten_03_S1_1);
		Doc_PrintLines(nDocID, 0, Bookstand_Milten_03_S1_2);
		Doc_PrintLines(nDocID, 0, Bookstand_Milten_03_S1_3);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, Bookstand_Milten_03_S1_4);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLines(nDocID, 0, Bookstand_Milten_03_S1_5);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, Bookstand_Milten_03_S1_6);

		Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_Milten_03_S1_7);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, Bookstand_Milten_03_S1_8);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_Milten_03_S1_9);
		Doc_Show(nDocID);
	};
};

// -------------------------------------------------------------------------------------
//				Milten_02 // unten
// -------------------------------------------------------------------------------------
const string Bookstand_Milten_02_S1_1 = "我 冒 昧 地 让 自 己 觉 得 更 加 舒 适 。 谁 知 道 有 一 天 我 会 是 营 地 最 后 一 个 法 师 呢 ？";
const string Bookstand_Milten_02_S1_2 = "嗯 ， 回 来 以 后 ， 我 真 的 无 法 感 到 高 兴 。 实 际 上 ， 在 外 面 我 应 该 能 看 到 更 清 楚 。";
const string Bookstand_Milten_02_S1_3 = "这 次 探 险 一 点 也 不 成 功 。";
const string Bookstand_Milten_02_S1_4 = "昨 天 矿 工 们 离 开 了 。 他 们 带 走 了 迪 雅 戈 - 他 变 成 一 个 逃 亡 者 一 点 也 不 让 我 感 到 惊 讶 。 ";
const string Bookstand_Milten_02_S1_5 = "总 之 他 不 会 再 挥 舞 十 字 镐 头 了 。 ";
const string Bookstand_Milten_02_S1_6 = "嗯 ， 我 会 花 一 些 时 间 深 入 研 究 一 下 炼 金 术 。 ";
const string Bookstand_Milten_02_S1_7 = "米 尔 腾";
func void Bookstand_Milten_02_S1()
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
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLines(nDocID, 0, Bookstand_Milten_02_S1_1);
		Doc_PrintLines(nDocID, 0, Bookstand_Milten_02_S1_2);
		Doc_PrintLines(nDocID, 0, Bookstand_Milten_02_S1_3);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLines(nDocID, 0, "");

		Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_Milten_02_S1_4);
		Doc_PrintLines(nDocID, 1, Bookstand_Milten_02_S1_5);
		Doc_PrintLines(nDocID, 1, Bookstand_Milten_02_S1_6);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, Bookstand_Milten_02_S1_7);
		Doc_Show(nDocID);
	};
};

// -------------------------------------------------------------------------------------
//				Milten_01 // unten
// -------------------------------------------------------------------------------------
func void Bookstand_Milten_01_S1()
{
	var C_Npc her; her = Hlp_GetNpc(PC_Hero);

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		//	if(Npc_IsPlayer(self))
		//	{
		//		B_SetPlayerMap(ItWr_Map_OldWorld);
		//	};

		var int Document;
		Document = Doc_CreateMap();
		Doc_SetPages(Document, 1);
		Doc_SetPage(Document, 0, "Map_OldWorld.tga", TRUE); // TRUE = scale to fullscreen
		Doc_SetLevel(Document, "OldWorld\OldWorld.zen");
		Doc_SetLevelCoords(Document, -78500, 47500, 54000, -53000);
		Doc_Show(Document);
	};
};

// -------------------------------------------------------------------------------------
//				Engor // unten
// -------------------------------------------------------------------------------------
const string Bookstand_Engor_01_S1_1 = "库 存";
const string Bookstand_Engor_01_S1_2 = "我 们 找 到 了 一 些 东 西 - 没 什 么 有 用 的 。 记 录 如 下 ：";
const string Bookstand_Engor_01_S1_3 = "３ 箱 破 旧 的 衣 服";
const string Bookstand_Engor_01_S1_4 = "８ 箱 生 锈 的 钢 铁";
const string Bookstand_Engor_01_S1_5 = "４ 箱 破 损 的 盔 甲 ";
const string Bookstand_Engor_01_S1_6 = "５ 箱 （ 劣 质 ） 皮 甲 和 腰 带";
const string Bookstand_Engor_01_S1_7 = "２ 箱 十 字 镐";
const string Bookstand_Engor_01_S1_8 = "３ 箱 工 具";
const string Bookstand_Engor_01_S1_9 = "１ ６ 箱 石 块 （ 矿 石 实 际 上 没 有 ）";
const string Bookstand_Engor_01_S1_10 = "１ 箱 损 坏 的 刀";
const string Bookstand_Engor_01_S1_11 = "４ 箱 破 碎 的 陶 器 ";
const string Bookstand_Engor_01_S1_12 = "５ ６ 个 水 桶";
const string Bookstand_Engor_01_S1_13 = "１ 箱 沼 泽 的 某 些 东 西 （ 无 论 它 是 什 么 ， 都 已 经 腐 烂 了 ）";
const string Bookstand_Engor_01_S1_14 = "恩高尔";
func void Bookstand_Engor_01_S1()
{
	var C_Npc her; her = Hlp_GetNpc(PC_Hero);

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		var int nDocID;

		nDocID = Doc_Create();
		Doc_SetPages(nDocID, 2);
		Doc_SetPage(nDocID, 0, "Book_Red_L.tga", 0);
		Doc_SetPage(nDocID, 1, "Book_Red_R.tga", 0);

		Doc_SetFont(nDocID, -1, FONT_Book);
		Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);

		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLine(nDocID, 0, Bookstand_Engor_01_S1_1);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLines(nDocID, 0, Bookstand_Engor_01_S1_2);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLines(nDocID, 0, Bookstand_Engor_01_S1_3);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLines(nDocID, 0, Bookstand_Engor_01_S1_4);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLines(nDocID, 0, Bookstand_Engor_01_S1_5);
		Doc_PrintLine(nDocID, 0, "");
		Doc_PrintLines(nDocID, 0, Bookstand_Engor_01_S1_6);
		Doc_PrintLine(nDocID, 0, "");

		Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_Engor_01_S1_7);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_Engor_01_S1_8);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_Engor_01_S1_9);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_Engor_01_S1_10);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_Engor_01_S1_11);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_Engor_01_S1_12);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLines(nDocID, 1, Bookstand_Engor_01_S1_13);
		Doc_PrintLine(nDocID, 1, "");
		Doc_PrintLine(nDocID, 1, Bookstand_Engor_01_S1_14);
		Doc_Show(nDocID);
	};
};
