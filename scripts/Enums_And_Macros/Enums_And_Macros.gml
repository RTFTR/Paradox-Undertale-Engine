#macro ENGINE_VERSION "Beta v4.8.3"
#macro ALLOW_DEBUG  true
#macro CHECK_HORIZONTAL global.diagonal_speed ? input_check("right") - input_check("left") :  input_x("left", "right", "up", "down")
#macro CHECK_VERTICAL global.diagonal_speed ? input_check("down") - input_check("up") :  input_y("left", "right", "up", "down")
#macro PRESS_HORIZONTAL input_check_pressed("right") - input_check_pressed("left")
#macro PRESS_VERTICAL input_check_pressed("down") - input_check_pressed("up")
#macro PRESS_CONFIRM input_check_pressed("confirm")
#macro HOLD_CONFIRM input_check("confirm")
#macro PRESS_CANCEL input_check_pressed("cancel")

enum FONTS {
	GAMEOVER,
	DAMAGE,
	COT,
	DTMONO,
	DTSANS,
	LOGO,
	MNC,
	SANS,
	UI,
	CHINESE,
}
function LoadFonts() {
	global.__CoalitionFonts = [
		font_add("Fonts/8-BIT WONDER.TTF", 36, false, false, 32, 128),
		font_add("Fonts/Hachicro.ttf", 30, false, false, 32, 128),
		font_add("Fonts/crypt of tomorrow.ttf", 9, false, false, 32, 128),
		font_add("Fonts/Determination Mono.otf", 20, false, false, 32, 128),
		font_add("Fonts/Determination Sans.otf", 20, false, false, 32, 128),
		font_add("Fonts/Monster Friend Fore.otf", 36, false, false, 32, 128),
		font_add("Fonts/Mars Needs Cunnilingus.ttf", 18, false, false, 32, 128),
		font_add("Fonts/Comic Sans UT.ttf", 12, false, false, 32, 128),
		font_add("Fonts/UT Hp Font.ttf", 7.5, false, false, 32, 128),
		font_add("Fonts/fzxs12.ttf", 18, false, false, 32, 128),
	];
	//waiting for scribble to be updated to 9.0 so sdf from font_add are supported for scribble
	//#macro fnt_8bitwonder global.__CoalitionFonts[0]
	//font_enable_sdf(fnt_8bitwonder, true);
	//#macro fnt_dmg global.__CoalitionFonts[1]
	//font_enable_sdf(fnt_dmg, true);
	//#macro fnt_cot global.__CoalitionFonts[2]
	//font_enable_sdf(fnt_cot, true);
	//#macro fnt_dt_mono global.__CoalitionFonts[3]
	//font_enable_sdf(fnt_dt_mono, true);
	//#macro fnt_dt_sans global.__CoalitionFonts[4]
	//font_enable_sdf(fnt_dt_sans, true);
	//#macro fnt_logo global.__CoalitionFonts[5]
	//font_enable_sdf(fnt_logo, true);
	//#macro fnt_mnc global.__CoalitionFonts[6]
	//font_enable_sdf(fnt_mnc, true);
	//#macro fnt_sans global.__CoalitionFonts[7]
	//font_enable_sdf(fnt_sans, true);
	//#macro fnt_uicon global.__CoalitionFonts[8]
	//font_enable_sdf(fnt_uicon, true);
	//#macro fnt_menu_chin global.__CoalitionFonts[9]
	//font_enable_sdf(fnt_menu_chin, true);
}

function UnloadFonts() {
	var i = 0;
	repeat array_length(global.__CoalitionFonts)
	{
		if font_exists(global.__CoalitionFonts[i])
			font_delete(global.__CoalitionFonts[i]);
		++i;
	}
}

//Input
enum INPUT
{
	UP,
	DOWN,
	LEFT,
	RIGHT,
	CONFIRM,
	CANCEL,
	MENU
};
enum INPUT_TYPE
{
	CHECK,
	PRESS,
	RELEASE,
};

//Soul
enum SOUL_MODE
{
	RED = 1,
	BLUE = 2,
	ORANGE = 3,
	YELLOW = 4,
	GREEN = 5,
	PURPLE = 6,
	CYAN = 7,
	FREEBLUE = 8,
}

//Direction
enum DIR
{
	UP = 90,
	DOWN = 270,
	LEFT = 180,
	RIGHT = 0,
}

//Optional, just for better coding experience for idiots like me (Eden)
//Items
enum ITEM
{
	PIE = 1,
	INOODLES = 2,
	STEAK = 3,
	SNOWP = 4,
	LHERO = 5,
	SEATEA = 6,
}
//Change this value when more items are added
#macro ITEM_COUNT 6
//Item Scroll types
enum ITEM_SCROLL
{
	DEFAULT = 0,
	VERTICAL = 1,
	CIRCLE = 2,
	HORIZONTAL = 3,
}
//Overworld Room ID
enum OVERWORLD
{
	CORRIDOR = 0,
	RUINS_ROOM_1 = 1,
	RUINS_ROOM_2 = 2,
}

// Batle or Menu States
enum BATTLE_STATE
{
	MENU = 0,
	DIALOG = 1,
	IN_TURN = 2,
	RESULT = 3
}
enum MENU_STATE
{
	BUTTON_SELECTION = 0,
	FIGHT = 1,
	ACT = 2,
	ITEM = 3,
	MERCY = 4,
	FIGHT_AIM = 5,
	ACT_SELECT = 6,
	MERCY_END = 7,
	FLEE = 8
}

enum FADE
{
	DEFAULT = 0,
	CIRCLE = 1,
	LINES = 2
}

#macro c_dkgreen make_color_rgb(0, 255, 0)
