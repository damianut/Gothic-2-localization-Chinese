// ---------------------------------------------------------------------
//	Item Werte
// ---------------------------------------------------------------------
const int Value_Goldnugget = 18;
const int Value_WhitePearl = 120;
const int Value_Addon_Joint_01 = 60;
// ---------------------------------------------------------------------
//	Goldbrocken
// ---------------------------------------------------------------------
instance ItMi_GoldNugget_Addon(C_Item)
{
	name						= "金 块";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_GoldNugget_01.3ds";
	material					= MAT_STONE;

	value						= Value_Goldnugget;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_MISC2_STANDARD;
};

// ---------------------------------------------------------------------
//	Weiße Perle
// ---------------------------------------------------------------------
instance ItMi_Addon_WhitePearl(C_Item)
{
	name						= "珍 珠";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_WhitePearl_01.3ds";
	material					= MAT_STONE;

	value						= Value_WhitePearl;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_MISC_STANDARD;
};

// ---------------------------------------------------------------------
//	Grüner Novize
// ---------------------------------------------------------------------
instance ItMi_Addon_Joint_01(C_Item)
{
	name						= "绿 色 新 信 徒";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Joint_US.3ds";
	material					= MAT_LEATHER;

	scemeName					= "JOINT";
	on_state[0]					= Use_Addon_Joint_01;

	value						= Value_Addon_Joint_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_RING_STANDARD;
};

var int FirstJoint;
func void Use_Addon_Joint_01()
{
	if (Npc_IsPlayer(self))
	{
		if (FirstJoint == FALSE)
		{
			FirstJoint = TRUE;
			B_GivePlayerXP(5);
		};

		Wld_PlayEffect("SLOW_TIME", self, self, 0, 0, 0, FALSE);
	};
};

//****************************************************************************
//				Baltrams Lieferung von Akil
//			---------------------------------------------
//****************************************************************************
instance ItMi_BaltramPaket(C_Item)
{
	name						= "贝 尔 卓 姆 的 货 物";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItMi_Packet.3ds";
	material					= MAT_LEATHER;

	value						= 200;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "一 个 沉 重 的 包 裹";							count[2] = 0;
	text[3]						= "好 东 西 。";						count[3] = 0;
	text[4]						= "来 自 农 民 阿 基 尔";							count[4] = 0;
};

//****************************************************************************
//				Baltrams Lieferung für Skip
//			---------------------------------------------
//****************************************************************************
instance ItMi_Packet_Baltram4Skip_Addon(C_Item)
{
	name						= "给 斯 奇 普 的 包 裹";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItMi_Packet.3ds";
	material					= MAT_LEATHER;

	value						= 200;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "这 个 沉 重 的 包 裹";						count[2] = 0;
	text[3]						= "好 东 西 。";						count[3] = 0;
	text[4]						= "是 给 海 盗 斯 奇 普 的";			count[4] = 0;
};

/******************************************************************************************/
instance ItMi_BromorsGeld_Addon(C_Item)
{
	name						= "布 洛 摩 尔 的 金 碗";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItMi_GoldChalice.3DS";
	material					= MAT_METAL;

	value						= Value_Nugget;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "姓 名 ‘ 布 洛 摩 尔 ’";					count[2] = 0;
	text[3]						= "刻 在 底 上";			count[3] = 0;
	text[4]						= "碗 上 有 个 锋 利 的 物 体 。";			count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItSe_ADDON_CavalornsBeutel(C_Item)
{
	name						= "卡 瓦 隆 的 皮 袋";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItMi_Pocket.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_CavalornsBeutel;

	value						= Value_Nugget;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "上 面 有 个 标 签";					count[1] = 0;
	text[2]						= "姓 名 ‘ 卡 瓦 隆 ’";					count[2] = 0;
	text[3]						= "里 面 有 １ 小 块 矿 石";			count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_CavalornsBeutel()
{
	CreateInvItems(hero, ItMi_Nugget, 1);
	Print(PRINT_FoundOreNugget);
	SC_OpenedCavalornsBeutel = TRUE;
	Log_CreateTopic(TOPIC_Addon_CavalornTheHut, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_CavalornTheHut, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_CavalornTheHut, TOPIC_Addon_CavalornTheHut_2);
};

//**************************************
//		Diverser Kleinkram
//**************************************
instance ItMi_Skull(C_Item)
{
	name						= "破 颅 者";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "DT_SKELETON_V01_HEAD.3ds";
	material					= MAT_LEATHER;

	value						= 10;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// 				INEXTREMO ITEMS
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

instance ItMi_IECello(C_Item)
{
	name						= "大 提 琴";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "Itmi_IE_Cello.3ds";
	material					= MAT_WOOD;

	scemeName					= "CELLO";
	on_state[0]					= Use_Cello;

	value						= 1;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

func void Use_Cello()
{
};

instance ItMi_IECelloBow(C_Item)
{
	name						= "大 提 琴 弓";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "Itmi_IE_CelloBow.3ds";
	material					= MAT_WOOD;

	value						= 1;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

instance ItMi_IEDrum(C_Item)
{
	name						= "鼓";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "Itmi_IE_Drum.3ds";
	material					= MAT_WOOD;

	scemeName					= "PAUKE";
	on_state[0]					= Use_Drum;

	value						= 1;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

func void Use_Drum()
{
};

instance ItMi_IEDrumScheit(C_Item)
{
	name						= "小 喇 叭 码 头";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "Itmi_IE_Drumscheit.3ds";
	material					= MAT_WOOD;

	scemeName					= "DRUMSCHEIT";
	on_state[0]					= Use_Drumscheit;

	value						= 1;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

func void Use_Drumscheit()
{
};

instance ItMi_IEDrumStick(C_Item)
{
	name						= "鼓 槌";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "Itmi_IE_DrumStick.3ds";
	material					= MAT_WOOD;

	value						= 1;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

instance ItMi_IEDudelBlau(C_Item)
{
	name						= "蓝 色 风 笛";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "Itmi_IE_DudelBlau.3ds";
	material					= MAT_WOOD;

	scemeName					= "DUDEL";
	on_state[0]					= Use_Dudel;

	value						= 1;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

func void Use_Dudel()
{
};

instance ItMi_IEDudelGelb(C_Item)
{
	name						= "黄 色 风 笛";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "Itmi_IE_DudelGelb.3ds";
	material					= MAT_WOOD;

	scemeName					= "DUDEL";
	on_state[0]					= Use_Dudel;

	value						= 1;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

instance ItMi_IEHarfe(C_Item)
{
	name						= "竖 琴";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "Itmi_IE_Harfe.3ds";
	material					= MAT_WOOD;

	scemeName					= "HARFE";
	on_state[0]					= Use_Harfe;

	value						= 1;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

func void Use_Harfe()
{
};

instance ItMi_IELaute(C_Item)
{
	name						= "琵 琶";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "Itmi_IE_Laute.3ds";
	material					= MAT_WOOD;

	scemeName					= "IELAUTE";
	on_state[0]					= Use_Laute;

	value						= 1;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

func void Use_Laute()
{
};

//****************************************************************************
//				Lennar'S Dietrich Paket
//			---------------------------------------------
//****************************************************************************
instance ItMi_Addon_Lennar_Paket(C_Item)
{
	name						= "叮 当 作 响 的 包 裹";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItMi_Packet.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_LennarPaket;

	value						= 300;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "里 面 有 个 开 锁 工 具";						count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "很 多 开 锁 工 具";							count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_LennarPaket()
{
	B_PlayerFindItem(ItKE_lockpick, Lennar_picklock_amount);
	Snd_Play("Geldbeutel");

	LennarPaket_Open = TRUE;
};

instance ItMi_Zeitspalt_Addon(C_Item)
{
	name						= "黑 色 矿 石";

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_WEAKGLIMMER";

	visual						= "ItMi_Zeitspalt_Addon.3DS";
	material					= MAT_STONE;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_Zeitspalt_Addon;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "效 果 未 知 。";							count[3] = 0;
	INV_ZBIAS					= INVCAM_ENTF_MISC_STANDARD;
};

func void Use_Zeitspalt_Addon()
{
	if (Npc_IsPlayer(self))
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE", self, self, 0, 0, 0, FALSE);

		// FIXME_Nico: DropUnconscious (DropDead funktioniert bereits)
		// Npc_ChangeAttribute(self, ATR_MANA, -self.attribute[ATR_MANA]);
		// Npc_ChangeAttribute(self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS] + 2);
		// Bereits laufenden Effekt beenden, damit die Kamera nicht ausrastet...
		// (beim Wechsel immer noch starker Morph-Effekt, aber nicht mehr andauernd)
		Wld_StopEffect("SLOW_MOTION");
		Wld_PlayEffect("SLOW_MOTION", self, self, 0, 0, 0, FALSE);
	};
};
