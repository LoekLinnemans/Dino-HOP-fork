// het menu gebruiken
menu_x += (menu_x_target - menu_x) / menu_speed;

//menu bedienen
if(menu_control)
{
	//als pijl omhoog
	if (keyboard_check_pressed(vk_up))
	{
		//menu selectie gaat 1 omhoog
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	//als pijl omlaag
	if (keyboard_check_pressed(vk_down))
	{
		//menu selectie gaat 1 omlaag
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items-1;
	}
	
	//als enter toets
	if (keyboard_check_pressed(vk_enter))
	{
		//speelt click geluid
		audio_play_sound(SN_click,1,false);
		//menu gaat weg
		menu_x_target = gui_width +300;
		menu_committed = menu_cursor;
		//menu controls gaan uit
		menu_control = false;

	
	}
	
	//zorgt voor muis control van menu
	//bepaal muislocatie
	var mouse_y_gui = device_mouse_y_to_gui(0);
	var mouse_x_gui = device_mouse_x_to_gui(0);
	//als muislocatie kleiner is dan menu y en groter dan menu top en groter dan menu.x
	if (mouse_y_gui < menu_y) && (mouse_y_gui > menu_top) && (mouse_x_gui > menu_x-150)
	{
		//menu selectie is dan menu y - mouse y
		menu_cursor = (menu_y - mouse_y_gui) div (menu_itemheight *1.5);
		
		//als muis wordt in gedrukt
		if (mouse_check_button_pressed(mb_left))
		{
			//zelfde als bij entertoets
			audio_play_sound(SN_click,1,false);
			menu_x_target = gui_width +300;
			menu_committed = menu_cursor;
			menu_control = false;

		}
	
	}
	
	
	
}

		//file save
if (menu_x > gui_width+150) && (menu_committed != -1)
	{
		switch (menu_committed)
		{
			case 2: default: Slidetransition(TRANS_MODE.NEXT); break;
			case 1: 
			{
				//save bestand wordt opgehaald
				if (!file_exists(SAVEFILE))
				{
					//gaat metteen naar opgehaalde room
					Slidetransition(TRANS_MODE.NEXT);
				}
				else
				{
					var file = file_text_open_read(SAVEFILE);
					var target = file_text_read_real(file);
					file_text_close(file);
					Slidetransition(TRANS_MODE.GOTO,target);	
				}
			}
			break;
			case 0: game_end(); break;
		}
	}




