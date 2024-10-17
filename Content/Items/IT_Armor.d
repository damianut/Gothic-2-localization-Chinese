// *********************************************************
// Rüstungs Kosten in Gold
// -----------------------
// Alles, was hier mit 0 angegeben ist
// a) kann der Spieler NIE bekommen und
// b) braucht auch KEIN Visuaisierungs-Item (ItAr_TestDummy)
// *********************************************************

// ------ Stadt ------
const int VALUE_ITAR_Governor = 1100;
const int VALUE_ITAR_Judge = 0;
const int VALUE_ITAR_Smith = 0;
const int VALUE_ITAR_Barkeeper = 0;
const int VALUE_ITAR_Vlk_L = 120;
const int VALUE_ITAR_Vlk_M = 120;
const int VALUE_ITAR_Vlk_H = 120;
const int VALUE_ITAR_VlkBabe_L = 0;
const int VALUE_ITAR_VlkBabe_M = 0;
const int VALUE_ITAR_VlkBabe_H = 0;
const int VALUE_ITAR_MIL_L = 600;
const int VALUE_ITAR_MIL_M = 2500;
const int VALUE_ITAR_PAL_M = 5000;
const int VALUE_ITAR_PAL_H = 20000;

// ------ Bauern und Söldner ------
const int VALUE_ITAR_Bau_L = 80;
const int VALUE_ITAR_Bau_M = 100;
const int VALUE_ITAR_BauBabe_L = 0;
const int VALUE_ITAR_BauBabe_M = 0;
const int VALUE_ITAR_SLD_L = 500;
const int VALUE_ITAR_SLD_M = 1000;
const int VALUE_ITAR_DJG_Crawler = 1500;
const int VALUE_ITAR_SLD_H = 2500;

// ------ Kloster ------
const int VALUE_ITAR_NOV_L = 280;
const int VALUE_ITAR_KDF_L = 500;
const int VALUE_ITAR_KDF_H = 3000;

// ------ Banditen ------
const int VALUE_ITAR_Leather_L = 250;
const int VALUE_ITAR_BDT_M = 550;
const int VALUE_ITAR_BDT_H = 2100;

// ------ Drachenjäger ------
const int VALUE_ITAR_DJG_L = 3000;
const int VALUE_ITAR_DJG_M = 12000;
const int VALUE_ITAR_DJG_H = 20000;
const int VALUE_ITAR_DJG_Babe = 0;

// ------ Besondere ------
const int VALUE_ITAR_XARDAS = 15000;
const int VALUE_ITAR_LESTER = 300;
const int VALUE_ITAR_DIEGO = 450;
const int VALUE_ITAR_CorAngar = 600;
const int VALUE_ITAR_Dementor = 500;
const int VALUE_ITAR_KDW_H = 450;
const int VALUE_ITAR_Prisoner = 10;

// ******************
// 		Rüstungen
// ******************

instance ITAR_Governor(C_Item)
{
	name						= "统 治 者 的 紧 身 上 衣";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_Governor.3ds";
	visual_change				= "Armor_Governor.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 40;
	protection[PROT_BLUNT]		= 40;
	protection[PROT_POINT]		= 40;
	protection[PROT_FIRE]		= 0;
	protection[PROT_MAGIC]		= 0;

	value						= VALUE_ITAR_Governor;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

// ******************************************************
instance ITAR_JUDGE(C_Item)
{
	name						= "法 官 长 袍";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_Governor.3DS";
	visual_change				= "Armor_Judge.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 10;
	protection[PROT_BLUNT]		= 10;
	protection[PROT_POINT]		= 10;
	protection[PROT_FIRE]		= 0;
	protection[PROT_MAGIC]		= 0;

	value						= VALUE_ITAR_JUDGE;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

// ******************************************************
instance ITAR_SMITH(C_Item)
{
	name						= "铁 匠 衣 服";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_Smith.3DS";
	visual_change				= "Armor_Smith.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 15;
	protection[PROT_BLUNT]		= 15;
	protection[PROT_POINT]		= 15;
	protection[PROT_FIRE]		= 5;
	protection[PROT_MAGIC]		= 0;

	value						= VALUE_ITAR_SMITH;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

// ******************************************************
instance ITAR_BARKEEPER(C_Item)
{
	name						= "房 东 的 衣 服";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_Wirt.3DS";
	visual_change				= "Armor_Barkeeper.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 10;
	protection[PROT_BLUNT]		= 10;
	protection[PROT_POINT]		= 10;
	protection[PROT_FIRE]		= 0;
	protection[PROT_MAGIC]		= 0;

	value						= VALUE_ITAR_BARKEEPER;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

// ******************************************************
instance ITAR_VLK_L(C_Item)
{
	name						= "市 民 的 衣 服";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_VLK_L.3DS";
	visual_change				= "Armor_Vlk_L.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 10;
	protection[PROT_BLUNT]		= 10;
	protection[PROT_POINT]		= 10;
	protection[PROT_FIRE]		= 0;
	protection[PROT_MAGIC]		= 0;

	value						= VALUE_ITAR_VLK_L;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

// ******************************************************
instance ITAR_VLK_M(C_Item)
{
	name						= "市 民 的 衣 服";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_VLK_M.3DS";
	visual_change				= "Armor_Vlk_M.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 10;
	protection[PROT_BLUNT]		= 10;
	protection[PROT_POINT]		= 10;
	protection[PROT_FIRE]		= 0;
	protection[PROT_MAGIC]		= 0;

	value						= VALUE_ITAR_VLK_M;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

// ******************************************************
instance ITAR_VLK_H(C_Item)
{
	name						= "市 民 的 衣 服";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_VLK_H.3DS";
	visual_change				= "Armor_Vlk_H.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 10;
	protection[PROT_BLUNT]		= 10;
	protection[PROT_POINT]		= 10;
	protection[PROT_FIRE]		= 0;
	protection[PROT_MAGIC]		= 0;

	value						= VALUE_ITAR_VLK_H;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

// ******************************************************
instance ITAR_VlkBabe_L(C_Item)
{
	name						= "市 民 的 衣 服 １";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_VLKBabe.3DS";
	visual_change				= "Armor_VlkBabe_L.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 10;
	protection[PROT_BLUNT]		= 10;
	protection[PROT_POINT]		= 10;
	protection[PROT_FIRE]		= 0;
	protection[PROT_MAGIC]		= 0;

	value						= VALUE_ITAR_VlkBabe_L;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

// ******************************************************
instance ITAR_VlkBabe_M(C_Item)
{
	name						= "市 民 的 衣 服 2";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_VLKBabe.3DS";
	visual_change				= "Armor_VlkBabe_M.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 10;
	protection[PROT_BLUNT]		= 10;
	protection[PROT_POINT]		= 10;
	protection[PROT_FIRE]		= 0;
	protection[PROT_MAGIC]		= 0;

	value						= VALUE_ITAR_VlkBabe_M;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

// ******************************************************
instance ITAR_VlkBabe_H(C_Item)
{
	name						= "市 民 的 衣 服 3";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_VLKBabe.3DS";
	visual_change				= "Armor_VlkBabe_H.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 10;
	protection[PROT_BLUNT]		= 10;
	protection[PROT_POINT]		= 10;
	protection[PROT_FIRE]		= 0;
	protection[PROT_MAGIC]		= 0;

	value						= VALUE_ITAR_VlkBabe_H;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

// ******************************************************
instance ITAR_MIL_L(C_Item)
{
	name						= "轻 型 民 兵 盔 甲";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_MIL_L.3DS";
	visual_change				= "Armor_Mil_L.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 40;
	protection[PROT_BLUNT]		= 40;
	protection[PROT_POINT]		= 40;
	protection[PROT_FIRE]		= 0;
	protection[PROT_MAGIC]		= 0;

	on_equip					= Equip_ITAR_MIL_L;
	on_unequip					= UnEquip_ITAR_MIL_L;

	value						= VALUE_ITAR_MIL_L;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

func void Equip_ITAR_MIL_L()
{
	if (Npc_IsPlayer(self))
	{
		MILArmor_Equipped = TRUE;

		if (MIL01_Equipped == TRUE) // Gürtel
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void UnEquip_ITAR_MIL_L()
{
	if (Npc_IsPlayer(self))
	{
		MILArmor_Equipped = FALSE;

		if (MIL01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};

// ******************************************************
instance ITAR_MIL_M(C_Item)
{
	name						= "重 型 民 兵 盔 甲";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_MIL_M.3DS";
	visual_change				= "Armor_MIL_M.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 70;
	protection[PROT_BLUNT]		= 70;
	protection[PROT_POINT]		= 70;
	protection[PROT_FIRE]		= 10;
	protection[PROT_MAGIC]		= 10;

	on_equip					= Equip_ITAR_MIL_M;
	on_unequip					= UnEquip_ITAR_MIL_M;

	value						= VALUE_ITAR_MIL_M;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

func void Equip_ITAR_MIL_M()
{
	if (Npc_IsPlayer(self))
	{
		MILArmor_Equipped = TRUE;

		if (MIL01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void UnEquip_ITAR_MIL_M()
{
	if (Npc_IsPlayer(self))
	{
		MILArmor_Equipped = FALSE;

		if (MIL01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};

// ******************************************************
instance ITAR_PAL_M(C_Item)
{
	name						= "骑 士 盔 甲";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_Pal_M.3ds";
	visual_change				= "Armor_Pal_M.asc";
	visual_skin					= 0;
	material					= MAT_METAL;

	protection[PROT_EDGE]		= 100;
	protection[PROT_BLUNT]		= 100;
	protection[PROT_POINT]		= 100;
	protection[PROT_FIRE]		= 50;
	protection[PROT_MAGIC]		= 25;

	value						= VALUE_ITAR_PAL_M;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

// ******************************************************
instance ITAR_PAL_H(C_Item)
{
	name						= "圣 骑 士 的 盔 甲";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_Pal_H.3ds";
	visual_change				= "Armor_Pal_H.asc";
	visual_skin					= 0;
	material					= MAT_METAL;

	protection[PROT_EDGE]		= 150;
	protection[PROT_BLUNT]		= 150;
	protection[PROT_POINT]		= 150;
	protection[PROT_FIRE]		= 100;
	protection[PROT_MAGIC]		= 50;

	value						= VALUE_ITAR_PAL_H;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

// ******************************************************
instance ITAR_BAU_L(C_Item)
{
	name						= "农 民 的 衣 服 １";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_Bau_L.3DS";
	visual_change				= "Armor_Bau_L.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 15;
	protection[PROT_BLUNT]		= 15;
	protection[PROT_POINT]		= 15;
	protection[PROT_FIRE]		= 0;
	protection[PROT_MAGIC]		= 0;

	value						= VALUE_ITAR_BAU_L;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

// ******************************************************
instance ITAR_BAU_M(C_Item)
{
	name						= "农 民 的 衣 服 2";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_Bau_M.3ds";
	visual_change				= "Armor_Bau_M.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 15;
	protection[PROT_BLUNT]		= 15;
	protection[PROT_POINT]		= 15;
	protection[PROT_FIRE]		= 0;
	protection[PROT_MAGIC]		= 0;

	value						= VALUE_ITAR_BAU_M;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

// ******************************************************
instance ITAR_BauBabe_L(C_Item)
{
	name						= "农 民 的 服 装 １";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_VLKBabe.3DS";
	visual_change				= "Armor_BauBabe_L.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 10;
	protection[PROT_BLUNT]		= 10;
	protection[PROT_POINT]		= 10;
	protection[PROT_FIRE]		= 0;
	protection[PROT_MAGIC]		= 0;

	value						= VALUE_ITAR_BauBabe_L;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

// ******************************************************
instance ITAR_BauBabe_M(C_Item)
{
	name						= "农 民 的 服 装 2";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_VLKBabe.3DS";
	visual_change				= "Armor_BauBabe_M.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 10;
	protection[PROT_BLUNT]		= 10;
	protection[PROT_POINT]		= 10;
	protection[PROT_FIRE]		= 0;
	protection[PROT_MAGIC]		= 0;

	value						= VALUE_ITAR_BauBabe_M;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

// ******************************************************
instance ITAR_SLD_L(C_Item)
{
	name						= "轻 型 雇 佣 兵 盔 甲";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_Sld_L.3ds";
	visual_change				= "Armor_Sld_L.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 30;
	protection[PROT_BLUNT]		= 30;
	protection[PROT_POINT]		= 30;
	protection[PROT_FIRE]		= 0;
	protection[PROT_MAGIC]		= 0;

	on_equip					= Equip_ITAR_SLD_L;
	on_unequip					= UnEquip_ITAR_SLD_L;

	value						= VALUE_ITAR_SLD_L;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

func void Equip_ITAR_SLD_L()
{
	if (Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = TRUE;

		if (SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void UnEquip_ITAR_SLD_L()
{
	if (Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = FALSE;

		if (SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};

// ******************************************************
instance ITAR_SLD_M(C_Item)
{
	name						= "中 型 雇 佣 兵 盔 甲";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_Sld_M.3ds";
	visual_change				= "Armor_Sld_M.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 50;
	protection[PROT_BLUNT]		= 50;
	protection[PROT_POINT]		= 50;
	protection[PROT_FIRE]		= 0;
	protection[PROT_MAGIC]		= 5;

	on_equip					= Equip_ITAR_SLD_M;
	on_unequip					= UnEquip_ITAR_SLD_M;

	value						= VALUE_ITAR_SLD_M;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

func void Equip_ITAR_SLD_M()
{
	if (Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = TRUE;

		if (SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void UnEquip_ITAR_SLD_M()
{
	if (Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = FALSE;

		if (SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};

// ******************************************************
instance ITAR_SLD_H(C_Item)
{
	name						= "重 型 雇 佣 兵 盔 甲";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_Sld_H.3ds";
	visual_change				= "Armor_Sld_H.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 80;
	protection[PROT_BLUNT]		= 80;
	protection[PROT_POINT]		= 80;
	protection[PROT_FIRE]		= 5;
	protection[PROT_MAGIC]		= 10;

	on_equip					= Equip_ITAR_SLD_H;
	on_unequip					= UnEquip_ITAR_SLD_H;

	value						= VALUE_ITAR_SLD_H;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

func void Equip_ITAR_SLD_H()
{
	if (Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = TRUE;

		if (SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void UnEquip_ITAR_SLD_H()
{
	if (Npc_IsPlayer(self))
	{
		SLDArmor_Equipped = FALSE;

		if (SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};

// ******************************************************
instance ITAR_DJG_Crawler(C_Item)
{
	name						= "爬 行 者 板 甲";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_Djg_Crawler.3ds";
	visual_change				= "Armor_Djg_Crawler.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 70;
	protection[PROT_BLUNT]		= 70;
	protection[PROT_POINT]		= 70;
	protection[PROT_FIRE]		= 15;
	protection[PROT_MAGIC]		= 0;

	on_equip					= Equip_ITAR_DJG_Crawler;
	on_unequip					= UnEquip_ITAR_DJG_Crawler;

	value						= VALUE_ITAR_DJG_Crawler;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

func void Equip_ITAR_DJG_Crawler()
{
	if (Npc_IsPlayer(self))
	{
		MCArmor_Equipped = TRUE;

		if (MC_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void UnEquip_ITAR_DJG_Crawler()
{
	if (Npc_IsPlayer(self))
	{
		MCArmor_Equipped = FALSE;

		if (MC_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};

// ******************************************************
instance ITAR_DJG_L(C_Item)
{
	name						= "轻 型 龙 猎 手 盔 甲";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_Djg_L.3ds";
	visual_change				= "Armor_Djg_L.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 100;
	protection[PROT_BLUNT]		= 100;
	protection[PROT_POINT]		= 100;
	protection[PROT_FIRE]		= 50;
	protection[PROT_MAGIC]		= 25;

	value						= VALUE_ITAR_DJG_L;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

// ******************************************************
instance ITAR_DJG_M(C_Item)
{
	name						= "中 型 龙 猎 手 盔 甲";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_Djg_M.3ds";
	visual_change				= "Armor_Djg_M.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 120;
	protection[PROT_BLUNT]		= 120;
	protection[PROT_POINT]		= 120;
	protection[PROT_FIRE]		= 75;
	protection[PROT_MAGIC]		= 35;

	value						= VALUE_ITAR_DJG_M;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

// ******************************************************
instance ITAR_DJG_H(C_Item)
{
	name						= "重 型 龙 猎 手 盔 甲";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_Djg_H.3ds";
	visual_change				= "Armor_Djg_H.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 150;
	protection[PROT_BLUNT]		= 150;
	protection[PROT_POINT]		= 150;
	protection[PROT_FIRE]		= 100;
	protection[PROT_MAGIC]		= 50;

	value						= VALUE_ITAR_DJG_H;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

// ******************************************************
instance ITAR_DJG_BABE(C_Item)
{
	name						= "猎 龙 人 的 盔 甲";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_Djg_L.3DS";
	visual_change				= "Armor_Djg_Babe.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 60;
	protection[PROT_BLUNT]		= 60;
	protection[PROT_POINT]		= 60;
	protection[PROT_FIRE]		= 30;
	protection[PROT_MAGIC]		= 0;

	value						= VALUE_ITAR_DJG_BABE;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

// ******************************************************
instance ITAR_NOV_L(C_Item)
{
	name						= "学 徒 长 袍";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_Nov_L.3ds";
	visual_change				= "Armor_Nov_L.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 25;
	protection[PROT_BLUNT]		= 25;
	protection[PROT_POINT]		= 25;
	protection[PROT_FIRE]		= 0;
	protection[PROT_MAGIC]		= 10;

	on_equip					= Equip_ITAR_NOV_L;
	on_unequip					= UnEquip_ITAR_NOV_L;

	value						= VALUE_ITAR_NOV_L;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

func void Equip_ITAR_NOV_L()
{
	if (Npc_IsPlayer(self))
	{
		NOVArmor_Equipped = TRUE;

		if (NOV01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void UnEquip_ITAR_NOV_L()
{
	if (Npc_IsPlayer(self))
	{
		NOVArmor_Equipped = FALSE;

		if (NOV01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};

// ******************************************************
instance ITAR_KDF_L(C_Item)
{
	name						= "火 魔 法 师 的 长 袍";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_KdF_L.3ds";
	visual_change				= "Armor_Kdf_L.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 40;
	protection[PROT_BLUNT]		= 40;
	protection[PROT_POINT]		= 40;
	protection[PROT_FIRE]		= 20;
	protection[PROT_MAGIC]		= 20;

	on_equip					= Equip_ITAR_KDF_L;
	on_unequip					= UnEquip_ITAR_KDF_L;

	value						= VALUE_ITAR_KDF_L;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

func void Equip_ITAR_KDF_L()
{
	if (Npc_IsPlayer(self))
	{
		KDFArmor_Equipped = TRUE;

		if (KDF01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void UnEquip_ITAR_KDF_L()
{
	if (Npc_IsPlayer(self))
	{
		KDFArmor_Equipped = FALSE;

		if (KDF01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};

// ******************************************************
instance ITAR_KDF_H(C_Item)
{
	name						= "议 会 火 焰 长 袍";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_KdF_H.3ds";
	visual_change				= "Armor_Kdf_H.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 100;
	protection[PROT_BLUNT]		= 100;
	protection[PROT_POINT]		= 100;
	protection[PROT_FIRE]		= 50;
	protection[PROT_MAGIC]		= 50;

	on_equip					= Equip_ITAR_KDF_H;
	on_unequip					= UnEquip_ITAR_KDF_H;

	value						= VALUE_ITAR_KDF_H;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

func void Equip_ITAR_KDF_H()
{
	if (Npc_IsPlayer(self))
	{
		KDFArmor_Equipped = TRUE;

		if (KDF01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void UnEquip_ITAR_KDF_H()
{
	if (Npc_IsPlayer(self))
	{
		KDFArmor_Equipped = FALSE;

		if (KDF01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};

// ******************************************************
instance ITAR_Leather_L(C_Item)
{
	name						= "皮 甲";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_Leather_L.3ds";
	visual_change				= "Armor_Leather_L.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 25;
	protection[PROT_BLUNT]		= 25;
	protection[PROT_POINT]		= 20;
	protection[PROT_FIRE]		= 5;
	protection[PROT_MAGIC]		= 0;

	on_equip					= Equip_ITAR_Leather_L;
	on_unequip					= UnEquip_ITAR_Leather_L;

	value						= VALUE_ITAR_Leather_L;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

func void Equip_ITAR_Leather_L()
{
	if (Npc_IsPlayer(self))
	{
		LeatherArmor_Equipped = TRUE;

		if (Leather01_Equipped == TRUE) // Ledergürtel
		{
			self.protection[PROT_EDGE] += BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] += BA_Bonus01;
		};
	};
};

func void UnEquip_ITAR_Leather_L()
{
	if (Npc_IsPlayer(self))
	{
		LeatherArmor_Equipped = FALSE;

		if (Leather01_Equipped == TRUE) // Ledergürtel
		{
			self.protection[PROT_EDGE] -= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] -= BA_Bonus01;
		};
	};
};

// ******************************************************
instance ITAR_BDT_M(C_Item)
{
	name						= "中 型 强 盗 盔 甲";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_Bdt_M.3ds";
	visual_change				= "Armor_Bdt_M.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 35;
	protection[PROT_BLUNT]		= 35;
	protection[PROT_POINT]		= 35;
	protection[PROT_FIRE]		= 0;
	protection[PROT_MAGIC]		= 0;

	value						= VALUE_ITAR_BDT_M;

	description					= name;
	text[0]						= PRINT_Addon_BDTArmor;							count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

// ******************************************************
instance ITAR_BDT_H(C_Item)
{
	name						= "重 型 强 盗 盔 甲";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_Bdt_H.3ds";
	visual_change				= "Armor_Bdt_H.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 50;
	protection[PROT_BLUNT]		= 50;
	protection[PROT_POINT]		= 50;
	protection[PROT_FIRE]		= 0;
	protection[PROT_MAGIC]		= 0;

	value						= VALUE_ITAR_BDT_H;

	description					= name;
	text[0]						= PRINT_Addon_BDTArmor;							count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

// ******************************************************
instance ITAR_XARDAS(C_Item)
{
	name						= "黑 暗 艺 术 长 袍";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_Xardas.3ds";
	visual_change				= "Armor_Xardas.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 100;
	protection[PROT_BLUNT]		= 100;
	protection[PROT_POINT]		= 100;
	protection[PROT_FIRE]		= 50;
	protection[PROT_MAGIC]		= 50;

	value						= VALUE_ITAR_XARDAS;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ITAR_LESTER(C_Item)
{
	name						= "莱 斯 特 的 长 袍";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_Lester.3ds";
	visual_change				= "Armor_Lester.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 25;
	protection[PROT_BLUNT]		= 25;
	protection[PROT_POINT]		= 25;
	protection[PROT_FIRE]		= 0;
	protection[PROT_MAGIC]		= 0;

	value						= VALUE_ITAR_LESTER;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ITAR_Diego(C_Item)
{
	name						= "迪 雅 戈 的 盔 甲";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_Diego.3ds";
	visual_change				= "Armor_Diego.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 30;
	protection[PROT_BLUNT]		= 30;
	protection[PROT_POINT]		= 30;
	protection[PROT_FIRE]		= 0;
	protection[PROT_MAGIC]		= 0;

	value						= VALUE_ITAR_Diego;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ITAR_CorAngar(C_Item)
{
	name						= "科 尔 · 安 加 的 盔 甲";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_CorAngar.3ds";
	visual_change				= "Armor_CorAngar.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 100;
	protection[PROT_BLUNT]		= 100;
	protection[PROT_POINT]		= 100;
	protection[PROT_FIRE]		= 50;
	protection[PROT_MAGIC]		= 25;

	value						= VALUE_ITAR_CorAngar;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

// ******************************************************
instance ITAR_Dementor(C_Item)
{
	name						= "黑 暗 斗 篷";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_Xardas.3ds";
	visual_change				= "Armor_Dementor.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 130;
	protection[PROT_BLUNT]		= 130;
	protection[PROT_POINT]		= 130;
	protection[PROT_FIRE]		= 65;
	protection[PROT_MAGIC]		= 65;

	value						= VALUE_ITAR_Dementor;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

// ******************************************************
instance ITAR_KDW_H(C_Item)
{
	name						= "水 法 师 的 长 袍";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_KdW_H.3ds";
	visual_change				= "Armor_KdW_H.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 100;
	protection[PROT_BLUNT]		= 100;
	protection[PROT_POINT]		= 100;
	protection[PROT_FIRE]		= 50;
	protection[PROT_MAGIC]		= 50;

	value						= VALUE_ITAR_KDW_H;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

// ******************************************************
instance ITAR_Prisoner(C_Item)
{
	name						= "罪 犯 的 衣 服";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_Prisoner.3ds";
	visual_change				= "Armor_Prisoner.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 20;
	protection[PROT_BLUNT]		= 20;
	protection[PROT_POINT]		= 20;
	protection[PROT_FIRE]		= 0;
	protection[PROT_MAGIC]		= 0;

	value						= VALUE_ITAR_Prisoner;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};
