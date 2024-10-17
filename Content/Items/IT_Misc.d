// ************************************************************************************************
// Wert von Kram
// ************************************************************************************************

// Items für Objektbenutzung und Item-Interaktion...
// z.B. Krautstampfer, Hammer, Kochlöffel, Laborflasche, Roheisen (Schmiede)

const int Value_SwordBlade = 10;
const int Value_SwordBladeHot = 10;
const int Value_SwordRawHot = 10;
const int Value_SwordRaw = 10;

const int Value_Brush = 3;
const int Value_Flask = 3;
const int Value_Stomper = 3;
const int Value_Pan = 20;
const int Value_Saw = 20;
const int Value_Broom = 10;
const int Value_Rake = 10;

const int Value_Hammer = 10;
const int Value_Scoop = 3;
const int Value_Nugget = 200;
const int Value_Joint = 30;
const int Value_Alarmhorn = 10;
const int Value_Lute = 10;
const int Value_Gold = 1;

const int Value_RuneBlank = 100;

const int Value_Sulfur = 20;
const int Value_Quartz = 20;
const int Value_Pitch = 10;
const int Value_Rockcrystal = 30;
const int Value_Aquamarine = 100;
const int Value_HolyWater = 20;
const int Value_Coal = 15;
const int Value_DarkPearl = 1000;

// Tabak
const int VALUE_ItMi_ApfelTabak = 10;
const int VALUE_ItMi_PilzTabak = 10;
const int VALUE_ItMi_SumpfTabak = 10;
const int VALUE_ItMi_DoppelTabak = 10;
const int VALUE_ItMi_HonigTabak = 10;

// Schmuck Items
const int Value_SilverRing = 120;
const int Value_SilverNecklace = 200;
const int Value_SilverCandleHolder = 50;
const int Value_SilverPlate = 100; // muss durch 2 teilbar in B_Say Gold enthalten sein
const int Value_SilverCup = 100; // muss durch 2 teilbar in B_Say Gold enthalten sein
const int Value_SilverChalice = 250;

const int Value_GoldPlate = 200;
const int Value_GoldRing = 250;
const int Value_GoldNecklace = 300;
const int Value_GoldCandleHolder = 120;
const int Value_GoldCup = 350;
const int Value_BloodCup = 200;
const int Value_GoldChalice = 500;
const int Value_GoldChest = 750;
const int Value_JeweleryChest = 1000;

const int Value_InnosStatue = 100;
const int Value_Sextant = 1500;

/*ursprüngliche Werte:
const int Value_SilverRing = 200;
const int Value_SilverNecklace = 100;
const int Value_SilverCandleHolder = 30;
const int Value_SilverPlate = 100;
const int Value_SilverCup = 200;
const int Value_SilverChalice = 100;

const int Value_GoldRing = 1150;
const int Value_GoldNecklace = 250;
const int Value_GoldCandleHolder = 300;
const int Value_GoldCup = 800;
const int Value_GoldChalice = 400;
const int Value_GoldChest = 1000;
const int Value_JeweleryChest = 50;

const int Value_InnosStatue = 100;
const int Value_Sextant = 30;
*/

/*******************************************************************************************
** Items für Mobsi - Benutzung **
*******************************************************************************************/
// Krautstampfen

instance ItMi_Stomper(C_Item)
{
	name						= "碎 草 机";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Stomper.3DS";
	material					= MAT_WOOD;

	value						= Value_Stomper;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
// Runen Bauen
instance ItMi_RuneBlank(C_Item)
{
	name						= "咒 语";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_RuneBlank.3DS";
	material					= MAT_STONE;

	value						= Value_RuneBlank;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItMi_Pliers(C_Item)
{
	name						= "钳 子";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Pliers.3DS";
	material					= MAT_METAL;

	value						= Value_RuneBlank;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
// Labor Wasserflasche
instance ItMi_Flask(C_Item)
{
	name						= "实 验 室 水 瓶";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Flask.3ds";
	material					= MAT_GLAS;

	value						= Value_Flask;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
// Reparieren
instance ItMi_Hammer(C_Item)
{
	name						= "锤 子";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Hammer.3DS";
	material					= MAT_WOOD;

	value						= Value_Hammer;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
// im Topf rühren
instance ItMi_Scoop(C_Item)
{
	name						= "勺 子";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Scoop.3DS";
	material					= MAT_WOOD;

	value						= Value_Scoop;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
//	Pfanne zum Braten (für Lagerfeuer)

instance ItMi_Pan(C_Item)
{
	name						= "平 底 锅";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Pan.3DS";
	material					= MAT_METAL;

	value						= Value_Pan;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

// Pfann für Herd

instance ItMi_PanFull(C_Item)
{
	name						= "平 底 锅";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_PanFull.3DS";
	material					= MAT_METAL;

	value						= Value_Pan;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
//	Säge für Baumstamm

instance ItMi_Saw(C_Item)
{
	name						= "锯";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Saw.3DS";
	material					= MAT_METAL;

	value						= Value_Saw;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
//	Items für Schmiede **

instance ItMiSwordraw(C_Item)
{
	name						= "原 钢";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMiSwordraw.3DS";
	material					= MAT_METAL;

	value						= Value_SwordRaw;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItMiSwordrawhot(C_Item)
{
	name						= "红 热 钢";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMiSwordrawhot.3DS";
	material					= MAT_METAL;

	value						= Value_SwordRawHot;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItMiSwordbladehot(C_Item)
{
	name						= "红 热 剑";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMiSwordbladehot.3DS";
	material					= MAT_METAL;

	value						= Value_SwordBladehot;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItMiSwordblade(C_Item)
{
	name						= "剑";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMiSwordblade.3DS";
	material					= MAT_METAL;

	value						= Value_SwordBlade;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/

/*******************************************************************************************
** Items für Item - Interaktionen(ohne Mobsi benutzbar) **
*******************************************************************************************/

/******************************************************************************************/
// Besen zum Fegen
instance ItMi_Broom(C_Item)
{
	name						= "扫 把";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Broom.3DS";
	material					= MAT_WOOD;

	scemeName					= "BROOM";
	on_state[0]					= Use_Broom;

	value						= Value_Broom;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_Broom()
{
	if ((Npc_IsPlayer(self))
	&& (Wld_GetPlayerPortalGuild() == GIL_NOV)
	&& (MIS_ParlanFegen == LOG_RUNNING))
	{
		B_Say(self, self, "$NOSWEEPING");
		Print(PRINT_NoSweeping);
	};
};

/******************************************************************************************/
// zum Rumklimpern
instance ItMi_Lute(C_Item)
{
	name						= "琵 琶";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Lute.3DS";
	material					= MAT_WOOD;

	scemeName					= "LUTE";
	on_state[0]					= Use_Lute;

	value						= Value_Lute;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_Lute()
{
};

/******************************************************************************************/
// Für Babe-Putzen
instance ItMi_Brush(C_Item)
{
	name						= "刷 子";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Brush.3ds";
	material					= MAT_WOOD;

	scemeName					= "BRUSH";
	on_state[0]					= Use_Brush;

	value						= Value_Brush;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_Brush()
{
};

/******************************************************************************************/
instance ItMi_Joint(C_Item)
{
	name						= "沼 生 草 茎";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Joint_US.3ds";
	material					= MAT_LEATHER;

	scemeName					= "JOINT";
	on_state[0]					= Use_Joint;

	value						= Value_Joint;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_RING_STANDARD;
};

func void Use_Joint()
{
	if (Npc_IsPlayer(self))
	{
		Wld_PlayEffect("SLOW_TIME", self, self, 0, 0, 0, FALSE);
	};
};

/******************************************************************************************/
/*
instance ItMi_Alarmhorn(C_Item)
{
	name						= "Horn";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Alarmhorn.3DS";
	material					= MAT_WOOD;

	scemeName					= "HORN";
	on_state[0]					= Use_Alarmhorn;

	value						= Value_Alarmhorn;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_Alarmhorn()
{
};

*/
//*******************************
// Päckchen
//*******************************
instance ItMi_Packet(C_Item)
{
	name						= "包 裹";

	mainflag					= ITEM_KAT_NONE;
	flags						= 0;

	visual						= "ItMi_Packet.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	// on_state[0]				= UsePacket;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

// in dieser Funktio steht der inhalt, die use Funkt dann bitte einkommentiren.
func void UsePacket()
{
};

instance ItMi_Pocket(C_Item) // steht drin, weil auch in Welt verteilt!!
{
	name						= "皮 背 包";

	mainflag					= ITEM_KAT_NONE | ITEM_MULTI;
	flags						= 0;

	visual						= "ItMi_Pocket.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= UsePocket;

	value						= 10;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "一 个 小 袋 子";						count[2] = 0;
	text[3]						= "不 太 重 。";							count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

// in dieser Funktio steht der inhalt, die use Funkt dann bitte einkommentiren.
func void UsePocket()
{
	CreateInvItems(hero, ItMi_Gold, 10);
	Print(PRINT_FoundGold10);
	Snd_Play("Geldbeutel");
};

//******************************************************************************************
//	Wertvolle Gegenstände
//******************************************************************************************
instance ItMi_Nugget(C_Item)
{
	name						= "矿 石 块";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_MANAPOTION";

	visual						= "ItMi_Nugget.3ds";
	material					= MAT_STONE;

	value						= Value_Nugget;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_MISC2_STANDARD;
};

/******************************************************************************************/
instance ItMi_Gold(C_Item)
{
	name						= "金 币";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Gold.3DS";
	material					= MAT_STONE;

	value						= Value_Gold;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_MISC2_STANDARD;
};

/******************************************************************************************/
instance ItMi_OldCoin(C_Item)
{
	name						= "古 老 的 硬 币";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItMi_OldCoin.3DS";
	material					= MAT_METAL;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_MISC2_STANDARD;
};

/******************************************************************************************/
instance ItMi_GoldCandleHolder(C_Item)
{
	name						= "金 烛 台";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_GoldCandleHolder.3DS";
	material					= MAT_METAL;

	value						= Value_GoldCandleHolder;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItMi_GoldNecklace(C_Item)
{
	name						= "金 项 链";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_AMULET;

	visual						= "ItMi_GoldNecklace.3DS";
	material					= MAT_METAL;

	value						= Value_GoldNecklace;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_RING_STANDARD;
};

/******************************************************************************************/

instance ItMi_SilverRing(C_Item)
{
	name						= "银 戒 指";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_RING;

	visual						= "ItMi_SilverRing.3DS";
	material					= MAT_METAL;

	value						= Value_SilverRing;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_RING_STANDARD;
	INV_ROTX					= INVCAM_X_RING_STANDARD;
	INV_ROTZ					= INVCAM_Z_RING_STANDARD;
};

/******************************************************************************************/
instance ItMi_SilverCup(C_Item)
{
	name						= "银 杯";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_SilverCup.3DS";
	material					= MAT_METAL;

	value						= Value_SilverCup;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItMi_SilverPlate(C_Item)
{
	name						= "银 盘";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_SilverPlate.3DS";
	material					= MAT_METAL;

	value						= Value_SilverPlate;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItMi_GoldPlate(C_Item)
{
	name						= "金 盘";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_GoldPlate.3DS";
	material					= MAT_METAL;

	value						= Value_GoldPlate;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItMi_GoldCup(C_Item)
{
	name						= "金 杯";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_GoldCup.3DS";
	material					= MAT_METAL;

	value						= Value_GoldCup;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItMi_BloodCup_MIS(C_Item)
{
	name						= "鲜 血 圣 杯";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItMi_GoldCup.3DS";
	material					= MAT_METAL;

	value						= Value_BloodCup;

	description					= "一 个 鲜 血 圣 杯";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItMi_GoldRing(C_Item)
{
	name						= "金 戒 指";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_RING;

	visual						= "ItMi_GoldRing.3DS";
	material					= MAT_METAL;

	value						= Value_GoldRing;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_RING_STANDARD;
	INV_ROTX					= INVCAM_X_RING_STANDARD;
	INV_ROTZ					= INVCAM_Z_RING_STANDARD;
};

/******************************************************************************************/
instance ItMi_SilverChalice(C_Item)
{
	name						= "银 碟 子";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_SilverChalice.3DS";
	material					= MAT_METAL;

	value						= Value_SilverChalice;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItMi_JeweleryChest(C_Item)
{
	name						= "宝 石 匣";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_JeweleryChest.3DS";
	material					= MAT_METAL;

	value						= Value_JeweleryChest;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItMi_GoldChalice(C_Item)
{
	name						= "金 碟 子";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_GoldChalice.3DS";
	material					= MAT_METAL;

	value						= Value_GoldChalice;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItMi_GoldChest(C_Item)
{
	name						= "首 饰 盒";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_GoldChest.3DS";
	material					= MAT_METAL;

	value						= Value_GoldChest;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItMi_InnosStatue(C_Item)
{
	name						= "英 诺 斯 雕 像";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_InnosStatue.3DS";
	material					= MAT_METAL;

	value						= Value_InnosStatue;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItMi_Sextant(C_Item)
{
	name						= "六 分 仪";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Sextant.3DS";
	material					= MAT_METAL;

	value						= Value_Sextant;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItMi_SilverCandleHolder(C_Item)
{
	name						= "银 烛 台";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_SilverCandleHolder.3DS";
	material					= MAT_METAL;

	value						= Value_SilverCandleHolder;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

/******************************************************************************************/
instance ItMi_SilverNecklace(C_Item)
{
	name						= "银 项 链";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_AMULET;

	visual						= "ItMi_SilverNecklace.3DS";
	material					= MAT_METAL;

	value						= Value_SilverNecklace;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//*****************************************************************************************
//	Alchemy Ingredienzien
//*****************************************************************************************
instance ItMi_Sulfur(C_Item)
{
	name						= "硫 磺";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Sulfur.3DS";
	material					= MAT_WOOD;

	value						= Value_Sulfur;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_MISC2_STANDARD;
};

instance ItMi_Quartz(C_Item)
{
	name						= "冰 河 石 英";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Quartz.3ds";
	material					= MAT_STONE;

	value						= Value_Quartz;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_RING_STANDARD;
};

instance ItMi_Pitch(C_Item)
{
	name						= "沥 青";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Pitch.3DS";
	material					= MAT_GLAS;

	value						= Value_Pitch;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItMi_Rockcrystal(C_Item)
{
	name						= "岩 石 水 晶";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Rockcrystal.3ds";
	material					= MAT_STONE;

	value						= Value_Rockcrystal;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItMi_Aquamarine(C_Item)
{
	name						= "蓝 宝 石";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Aquamarine.3ds";
	material					= MAT_STONE;

	value						= Value_Aquamarine;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_MISC_STANDARD;
};

instance ItMi_HolyWater(C_Item)
{
	name						= "圣 水";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_HolyWater.3ds";
	material					= MAT_GLAS;

	value						= Value_HolyWater;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItMi_Coal(C_Item)
{
	name						= "煤";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Coal.3ds";
	material					= MAT_STONE;

	value						= Value_Coal;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_MISC_STANDARD;
};

instance ItMi_DarkPearl(C_Item)
{
	name						= "黑 珍 珠";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_DarkPearl.3ds";
	material					= MAT_STONE;

	value						= Value_DarkPearl;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_MISC_STANDARD;
};

// -------------------------------------------------------------
//					Tabak Sorten
//		 Apfeltabak (Basis für alle anderen)
// -------------------------------------------------------------
instance ItMi_ApfelTabak(C_Item)
{
	name						= "苹 果 烟 草";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Pocket.3ds";
	material					= MAT_LEATHER;

	value						= VALUE_ItMi_ApfelTabak;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "一 袋 苹 果 烟 草 。";					count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

// -------------------------------------------------------------
//			Pilztabak
// -------------------------------------------------------------
instance ItMi_PilzTabak(C_Item)
{
	name						= "蘑 菇 烟 草";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Pocket.3ds";
	material					= MAT_LEATHER;

	value						= VALUE_ItMi_PilzTabak;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "黑 暗 苹 果-蘑 菇 烟 草";					count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

// -------------------------------------------------------------
//			Doppel Apfel
// -------------------------------------------------------------
instance ItMi_DoppelTabak(C_Item)
{
	name						= "双 倍 苹 果";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Pocket.3ds";
	material					= MAT_LEATHER;

	value						= VALUE_ItMi_DoppelTabak;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "味 道 非 常 象 苹 果 … …";				count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

// -------------------------------------------------------------
//			Honigtabak
// -------------------------------------------------------------
instance ItMi_Honigtabak(C_Item)
{
	name						= "蜂 蜜 烟 草";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Pocket.3ds";
	material					= MAT_LEATHER;

	value						= VALUE_ItMi_Honigtabak;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "芳 香 的 苹 果 烟 草";							count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

// -------------------------------------------------------------
//		SumpfKraut Tabak
// -------------------------------------------------------------
instance ItMi_SumpfTabak(C_Item)
{
	name						= "药 烟 草";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Pocket.3ds";
	material					= MAT_LEATHER;

	value						= VALUE_ItMi_SumpfTabak;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "沼 生 草 混 合 物";						count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};
