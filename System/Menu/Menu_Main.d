// *********************************************************************
// main menu (startup)
// *********************************************************************

INSTANCE MENU_MAIN(C_MENU_DEF) 
{
	backpic			= MENU_BACK_PIC;
	musictheme		= "SYS_Menu";
	
	items[0]		= "MENUITEM_MAIN_HEADLINE";
	items[1]		= "MENUITEM_MAIN_HEADLINE2";
	items[2]		= "MENUITEM_MAIN_NEWGAME";
	items[3]		= "MENUITEM_MAIN_SAVEGAME_LOAD";	
	items[4]		= "MENUITEM_MAIN_SAVEGAME_SAVE";	
	items[5]		= "MENUITEM_MAIN_RESUME"; 
	items[6]		= "MENUITEM_MAIN_OPTIONS";
	items[7]		= "MENUITEM_MAIN_INTRO"; 
	items[8]		= "MENUITEM_MAIN_CREDITS";	
	items[9]		= "MENUITEM_MAIN_EXIT"; 
	
	defaultOutGame	= 2;	// NEWGAME
	defaultInGame	= 4;	// SAVEGAME
	
	flags = flags | MENU_SHOW_INFO;
};
	
	
const int MENU_MAIN_DY = 550;
const int MENU_MAIN_Y = 2500;

//
// NEW GAME
//

instance MENUITEM_MAIN_NEWGAME(C_MENU_ITEM_DEF) 
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "新 游 戏";
	text[1]		= "开 始 新 的 冒 险";  // Kommentar
	
	// Positionen  und Dimensionen	
	posx		= 0;		posy		= MENU_MAIN_Y + MENU_MAIN_DY*0;
	dimx		= 8100;		dimy		=  750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_CLOSE;
	onSelAction_S[0]= "NEW_GAME";
	// Weitere Eigenschaften
	flags			= flags | IT_TXT_CENTER;
};


//
// LOAD & SAVE GAME
//


INSTANCE MENUITEM_MAIN_SAVEGAME_LOAD(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"读 取 游 戏";
	text[1]		=	"继 续 已 保 存 的 游 戏";  // Kommentar
	
	// Positionen  und Dimensionen	
	posx		=  0;		posy		= MENU_MAIN_Y + MENU_MAIN_DY*1;
	dimx		= 8100;		dimy		=  750;
	// Aktionen
	onSelAction_S[0]= "MENU_SAVEGAME_LOAD";
	onSelAction[0]	= SEL_ACTION_STARTMENU;
	// Weitere Eigenschaften
	flags			= flags | IT_TXT_CENTER;
};

instance MENUITEM_MAIN_SAVEGAME_SAVE(C_MENU_ITEM_DEF) 
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "保 存 游 戏";
	text[1]		= "保 存 当 前 游 戏";  // Kommentar
	
	// Positionen  und Dimensionen
	posx		= 0;		posy		= MENU_MAIN_Y + MENU_MAIN_DY*2;
	dimx		=  8100;	dimy		= 750;
	// Aktionen
	onSelAction_S[0]= "MENU_SAVEGAME_SAVE";
	onSelAction[0]	= SEL_ACTION_STARTMENU;
	// Weitere Eigenschaften
	flags			= flags | IT_TXT_CENTER | IT_ONLY_IN_GAME;
};


//
// RESUME
//


INSTANCE MENUITEM_MAIN_RESUME(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"返 回";
	text[1]		=   "返 回 当 前 游 戏";  // Kommentar
	
	// Position und Dimension
	posx		=	0;		posy		=	MENU_MAIN_Y + MENU_MAIN_DY*3;
	dimx		=	8192;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= 	SEL_ACTION_BACK;
	// Weitere Eigenschaften
	flags			= flags | IT_TXT_CENTER | IT_ONLY_IN_GAME;
};


//
// OPTIONS, INTRO & CREDITS
//

instance MENUITEM_MAIN_OPTIONS(C_MENU_ITEM_DEF) 
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "选 项";
	text[1]		= "游 戏 、 视 频 、 音 频 设 置";  // Kommentar
	
	// Positionen  und Dimensionen	
	posx		= 0;		posy		= MENU_MAIN_Y + MENU_MAIN_DY*4;
	dimx		= 8100;		dimy		=  750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_STARTMENU;
	onSelAction_S[0]= "MENU_OPTIONS";
	// Weitere Eigenschaften
	flags			= flags | IT_TXT_CENTER;
};


instance MENUITEM_MAIN_INTRO(C_MENU_ITEM_DEF) 
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "播 放 片 头 介 绍";
	text[1]		= "播 介 绍 影 片。";
	// Positionen  und Dimensione	
	posx		= 0;		posy		= MENU_MAIN_Y + MENU_MAIN_DY*5;
	dimx		= 8100;		dimy		=  750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	onEventAction[EVENT_EXECUTE] = ShowIntro;
	// Weitere Eigenschaften
	flags			= flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_MAIN_CREDITS(C_MENU_ITEM_DEF) 
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "制 作 成 员";
	text[1]		= "制 作 成 员";  // Kommentar
	
	// Positionen  und Dimensionen	
	posx		= 0;		posy		= MENU_MAIN_Y + MENU_MAIN_DY*6;
	dimx		= 8100;		dimy		=  750;	
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	onEventAction[EVENT_EXECUTE] = ShowCredits;
	// Weitere Eigenschaften
	flags			= flags | IT_TXT_CENTER;
};

//
// EXIT
//


INSTANCE MENUITEM_MAIN_EXIT(C_MENU_ITEM_DEF) 
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "退 出 游 戏";
	text[1]		= "离 开 哥 特 王 朝 II 的 世 界";  // Kommentar
	
	// Positionen  und Dimensionen
	posx		= 0;		posy		= MENU_MAIN_Y + MENU_MAIN_DY*7;	
	dimx		= 8100;		dimy		=  750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_STARTMENU;
	onSelAction_S[0]= "MENU_LEAVE_GAME";
	// Weitere Eigenschaften
	flags			= flags | IT_TXT_CENTER;
};



//
// Statische Items
//

INSTANCE MENUITEM_MAIN_HEADLINE2(C_MENU_ITEM_DEF) 
{
	backPic		= "menu_gothic.tga";
	// Positionen  und Dimensionen	
	posx		=  250;		posy		=  500;	
	dimx		= 7900;		dimy		= 2300;	
	// Weitere Eigenschaften
	alphaMode 		= "BLEND";	
	alpha			= 255;		
	flags			= flags | IT_TXT_CENTER;
	flags			= flags & ~IT_SELECTABLE;
};

INSTANCE MENUITEM_MAIN_HEADLINE(C_MENU_ITEM_DEF) 
{
	backPic		= "menu_gothicshadow.tga";
	// Positionen  und Dimensionen	
	posx		=  250;		posy		=  500;
	dimx		= 7900;		dimy		= 2300;				
	// Weitere Eigenschaften
	alphaMode		= "BLEND";	
	alpha			= 220;			
	flags			= flags | IT_TXT_CENTER;
	flags			= flags & ~IT_SELECTABLE;
};


func int ShowIntro()
{
	PlayVideo("intro.bik");
	return 1;
};

func int ShowCredits()
{
	PlayVideo("credits.bik");
	PlayVideo("credits2.bik");
	return 1;
};
