// variabelen
//display grootte
w = display_get_gui_width()
h = display_get_gui_height()
h_half = h *0.5;

//enum is een contstante variablen (deze kan je altijd gebruikten in dit geval zijn het modussen
enum TRANS_MODE
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO	
}
//start modus
mode = TRANS_MODE.INTRO;
//
percent = 1;
//target room
target = room;
