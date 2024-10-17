// *********************************************************************
// game options menu - extensions
// *********************************************************************

// in Echtzeit abschaltbare neue Gothic 2 Features
// Wasser-FFTs			(ZTOGGLE MATMORPH)
// Wasser Alpha Fade	(ZTOGGLE FARFADE)
// Vobmorphing			(ZTOGGLE VOBMORPH)
// Ambient PFX			(ZTOGGLE AMBIENTPFX)
// Ambient Vobs			(ZTOGGLE RENDERAMBIENTVOBS)
// Env Mapping			(ZTOGGLE ENVMAP)

// optional vielleicht später noch
// Radial Fog			(TODO):		bisher nur in der INI einstellbar, vielleicht nötig auf älteren Karten und evtl. Performance Gewinn (TEST!)
// Wolkenschatten		(TODO):     bisher nur in der INI einstellbar, bringt Performance wenn aus und es regnet

INSTANCE MENU_OPT_EXT(C_MENU_DEF)
{
	backpic			= MENU_BACK_PIC;
	
	items[0]		= "MENUITEM_EXT_HEADLINE";
				
	items[1]		= "MENUITEM_EXT_FFT";	
	items[2]		= "MENUITEM_EXT_FFT_CHOICE";	
	
	items[3]		= "MENUITEM_EXT_WATERFADE";	
	items[4]		= "MENUITEM_EXT_WATERFADE_CHOICE";

	items[5]		= "MENUITEM_EXT_OBJWIND";
	items[6]		= "MENUITEM_EXT_OBJWIND_CHOICE";		
		
	//items[7]		= "MENUITEM_EXT_AMBIENTOBJ";				// nicht benutzt in gothic 2
	//items[8]		= "MENUITEM_EXT_AMBIENTOBJ_CHOICE";		
	
	items[7]		= "MENUITEM_EXT_CLOUDSHADOW";				
	items[8]		= "MENUITEM_EXT_CLOUDSHADOW_CHOICE";		
	
	items[9]		= "MENUITEM_EXT_AMBIENTPFX";
	items[10]		= "MENUITEM_EXT_AMBIENTPFX_CHOICE";		
					
	items[11]		= "MENUITEM_EXT_ENVMAP";
	items[12]		= "MENUITEM_EXT_ENVMAP_CHOICE";		
	
	items[13]		= "MENUITEM_EXT_RADIALFOG";
	items[14]		= "MENUITEM_EXT_RADIALFOG_CHOICE";		
	
	items[15]		= "MENUITEM_GRA_BACK";	
	
	flags = flags | MENU_SHOW_INFO;
};


INSTANCE MENUITEM_EXT_HEADLINE(C_MENU_ITEM_DEF) 
{
	text[0]		=	"扩 展 配 置";
	type		=	MENU_ITEM_TEXT;
	// Position und Dimension	
	posx		=	0;		posy		=	MENU_TITLE_Y;
	dimx		=	8100;
	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags | IT_TXT_CENTER;	
};


//
// Water-Quality
//

INSTANCE MENUITEM_EXT_FFT(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"水 波 浪";
	text[1]		= 	"切 换 波 浪 运 动 开 ／ 关"; // Kommentar
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*0;
	dimx		=	3000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags		= flags | IT_EFFECTS_NEXT;		
};

instance MENUITEM_EXT_FFT_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;		
	text[0]		= 	MENU_NO_YES;
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5000;		posy		=	MENU_START_Y + MENU_DY*0 + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;	dimy 		= 	MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "zWaterAniEnabled";
	onChgSetOptionSection 											= "ENGINE";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;	
	flags		= flags  | IT_TXT_CENTER;
};

INSTANCE MENUITEM_EXT_WATERFADE(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"水 浅 隐";
	text[1]		= 	"切 换 水 浅 隐 开 ／ 关"; // Kommentar
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*1;
	dimx		=	3000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags		= flags | IT_EFFECTS_NEXT;		
};

instance MENUITEM_EXT_WATERFADE_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;		
	text[0]		= 	MENU_NO_YES;
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5000;		posy		=	MENU_START_Y + MENU_DY*1 + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;	dimy 		= 	MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "zFarClipAlphaFade";
	onChgSetOptionSection 											= "ENGINE";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;	
	flags		= flags  | IT_TXT_CENTER;
};

INSTANCE MENUITEM_EXT_OBJWIND(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"风";
	text[1]		= 	"切 换 物 体 在 风 中 的 移 动 开 ／ 关"; // Kommentar
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*2;
	dimx		=	3000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags		= flags | IT_EFFECTS_NEXT;		
};

instance MENUITEM_EXT_OBJWIND_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;		
	text[0]		= 	MENU_NO_YES;
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5000;		posy		=	MENU_START_Y + MENU_DY*2 + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;	dimy 		= 	MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "zWindEnabled";
	onChgSetOptionSection 											= "ENGINE";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;	
	flags		= flags  | IT_TXT_CENTER;
};

/*
INSTANCE MENUITEM_EXT_AMBIENTOBJ(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Detailobjekte";
	text[1]		= 	"Ambientobjekte an/aus"; // Kommentar
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*3;
	dimx		=	3000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags		= flags | IT_EFFECTS_NEXT;		
};

instance MENUITEM_EXT_AMBIENTOBJ_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;		
	text[0]		= 	MENU_NO_YES;
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5000;		posy		=	MENU_START_Y + MENU_DY*3 + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;	dimy 		= 	MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "zAmbientVobsEnabled";
	onChgSetOptionSection 											= "ENGINE";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;	
	flags		= flags  | IT_TXT_CENTER;
};*/



INSTANCE MENUITEM_EXT_CLOUDSHADOW(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"云 阴 影";
	text[1]		= 	"切 换 云 阴 影 开 ／ 关"; // Kommentar
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*3;
	dimx		=	3500;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags		= flags | IT_EFFECTS_NEXT;		
};

instance MENUITEM_EXT_CLOUDSHADOW_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;		
	text[0]		= 	MENU_NO_YES;
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5000;		posy		=	MENU_START_Y + MENU_DY*3 + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;	dimy 		= 	MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "zCloudShadowScale";
	onChgSetOptionSection 											= "ENGINE";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;	
	flags		= flags  | IT_TXT_CENTER;
};


INSTANCE MENUITEM_EXT_AMBIENTPFX(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"环 境 特 效";
	text[1]		= 	"切 换 不 要 的 粒 子 效 果 开 ／ 关"; // Kommentar
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*4;
	dimx		=	3000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags		= flags | IT_EFFECTS_NEXT;		
};

instance MENUITEM_EXT_AMBIENTPFX_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;		
	text[0]		= 	MENU_NO_YES;
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5000;		posy		=	MENU_START_Y + MENU_DY*4 + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;	dimy 		= 	MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "zAmbientPFXEnabled";
	onChgSetOptionSection 											= "ENGINE";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;	
	flags		= flags  | IT_TXT_CENTER;
};


INSTANCE MENUITEM_EXT_ENVMAP(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"反 射";
	text[1]		= 	"切 换 反 射 开 ／ 关"; // Kommentar
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*5;
	dimx		=	3000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags		= flags | IT_EFFECTS_NEXT;		
};

instance MENUITEM_EXT_ENVMAP_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;		
	text[0]		= 	MENU_NO_YES;
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5000;		posy		=	MENU_START_Y + MENU_DY*5 + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;	dimy 		= 	MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "zEnvMappingEnabled";
	onChgSetOptionSection 											= "ENGINE";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;	
	flags		= flags  | IT_TXT_CENTER;
};


INSTANCE MENUITEM_EXT_RADIALFOG(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"光 线 模 糊";
	text[1]		= 	"切 换 光 线 模 糊 开 ／ 关"; // Kommentar
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*6;
	dimx		=	3000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags		= flags | IT_EFFECTS_NEXT;		
};

instance MENUITEM_EXT_RADIALFOG_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;		
	text[0]		= 	MENU_NO_YES;
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5000;		posy		=	MENU_START_Y + MENU_DY*6 + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;	dimy 		= 	MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "zFogRadial";
	onChgSetOptionSection 											= "RENDERER_D3D";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;	
	flags		= flags  | IT_TXT_CENTER;
};



INSTANCE MENUITEM_EXT_BACK(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	MENU_BACK;
	// Position und Dimension	
	posx		=	1000;		posy		=	MENU_BACK_Y;
	dimx		=	6192;		dimy		=	MENU_DY;
	// Aktionen
	onSelAction[0]	= 	SEL_ACTION_BACK;	
	flags = flags | IT_TXT_CENTER;
};

