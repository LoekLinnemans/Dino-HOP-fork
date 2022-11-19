//teken locatie bepaalt
var draw_x = 1910;
var draw_y = 110;


//draw coin GUI
draw_set_font(F_coin);

//display breette wordt bepaalt
var _w = display_get_gui_width();

//hier wordt de coin getekent in de hoek bij levels
draw_sprite_stretched(S_coin, 0, _w- draw_x , draw_y *0.75,64,64)
draw_set_halign(fa_right);
draw_text(_w - draw_x + 100, draw_y + 10,global.coins);
draw_set_halign(fa_left);