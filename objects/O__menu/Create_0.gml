//Menu variables
#macro SAVEFILE "Save.sav"

//hier haalt die de display breedte,hoogte en zet hij een marge op
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 128;


//hier wordt de menu positie bepaalt
menu_x = gui_width +600; 
menu_y = gui_height - gui_margin;
menu_x_target = gui_width - gui_margin;

//menu snelheid wordt bepaalt
menu_speed = 25; //lager is sneller
//menu font wordt bepaalt.
menu_font = F_menu;
//hier wordt font groote bepaalt
menu_itemheight = font_get_size(menu_font);
//zorgt voor cursor
menu_committed = -1;
menu_control = true;

//MENU
menu[2] = "New Game";
menu[1] = "Continue";
menu[0] = "Quit";
//menu items
menu_items = array_length_1d(menu);
menu_cursor = 2;

menu_top = menu_y - ((menu_itemheight *1.5) * menu_items);



