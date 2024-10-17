//****************************************************************************
//				Erzfisch (Halvor)
//			---------------------------------------------
//****************************************************************************
instance ItSe_ErzFisch(C_Item)
{
	name						= "球 形 鱼";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItFo_Fish.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_ErzFisch;

	value						= 25;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "在 这 条 鱼 里 面 藏 着 某 些 东 西 。";	count[2] = 0;
};

func void Use_ErzFisch()
{
	B_PlayerFindItem(ItMi_Nugget, 1);
};

//****************************************************************************
//				Goldfisch (Halvor)
//			---------------------------------------------
//****************************************************************************
instance ItSe_GoldFisch(C_Item)
{
	name						= "沉 重 的 鱼";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItFo_Fish.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_GoldFisch;

	value						= 25;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "在 这 条 鱼 里 面 藏 着 某 些 东 西 。";	count[2] = 0;
};

func void Use_GoldFisch()
{
	B_PlayerFindItem(ItMI_Gold, 50);
};

//****************************************************************************
//				Ringfisch (Halvor) (Protcetion Fire Ring)
//			---------------------------------------------
//****************************************************************************
instance ItSe_Ringfisch(C_Item)
{
	name						= "小 鱼";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItFo_Fish.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_Ringfisch;

	value						= 25;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "在 这 条 鱼 里 面 藏 着 某 些 东 西 。";	count[2] = 0;
};

func void Use_Ringfisch()
{
	B_PlayerFindItem(ItRi_Prot_Fire_01, 1);
};

//****************************************************************************
//				Lockpickfisch (Halvor)
//			---------------------------------------------
//****************************************************************************
instance ItSe_LockpickFisch(C_Item)
{
	name						= "轻 鱼";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItFo_Fish.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_LockpickFisch;

	value						= 25;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "在 这 条 鱼 里 面 藏 着 某 些 东 西 。";	count[2] = 0;
};

func void Use_LockpickFisch()
{
	B_PlayerFindItem(ITKE_Lockpick, 3);
};

//****************************************************************************
//			Allgemeine Goldbeutel (25, 50, 100)
//			---------------------------------------------
//****************************************************************************

// ------------- 25 Gold -----------------------
instance ItSe_GoldPocket25(C_Item)
{
	name						= "皮 背 包";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Pocket.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= GoldPocket25;

	value						= 25;

	description					= "一 个 皮 革 袋 子 。";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "里 面 有 些 硬 币 叮 当 作 响 。";				count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void GoldPocket25()
{
	B_PlayerFindItem(ItMI_Gold, 25);
};

// ------------- 50 Gold -----------------------
instance ItSe_GoldPocket50(C_Item)
{
	name						= "皮 背 包";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Pocket.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= GoldPocket50;

	value						= 50;

	description					= "一 个 皮 革 袋 子 。";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "袋 子 里 面 装 满 了 硬 币 。";				count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void GoldPocket50()
{
	B_PlayerFindItem(ItMI_Gold, 50);
};

// ------------- 100 Gold -----------------------
instance ItSe_GoldPocket100(C_Item)
{
	name						= "皮 背 包";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Pocket.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= GoldPocket100;

	value						= 100;

	description					= "一 个 皮 革 袋 子 。";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "一 个 沉 重 的 袋 子 ， 装 满 了";						count[2] = 0;
	text[3]						= "金 币 。";				count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void GoldPocket100()
{
	B_PlayerFindItem(ItMI_Gold, 100);
};

// ------------- Hannas Beutel -----------------------
instance ItSe_HannasBeutel(C_Item)
{
	name						= "皮 背 包";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Pocket.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= HannasBeutel;

	value						= 100;

	description					= "一 个 皮 革 袋 子 。";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "汉 纳 把 它 给 了 我 。";					count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void HannasBeutel()
{
	CreateInvItems(hero, ITKE_Lockpick, 10);
	CreateInvItems(hero, ItKe_ThiefTreasure, 1);
	Print(PRINT_HannasBeutel);
};
