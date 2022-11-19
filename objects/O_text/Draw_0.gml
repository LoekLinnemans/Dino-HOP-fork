var halfw = w *0.5;

//teken het vierkant
draw_set_colour(c_black);
draw_set_alpha(0.5);
draw_roundrect_ext(x-halfw-border,y-h-(border*2),x+halfw+border, y,15,15,false);
draw_sprite(S_marker,0,x,y);
draw_set_alpha(1);

//teken tekst
draw_set_color(c_white);
draw_set_font(F_Text);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(x,y-h-border,text_current);










