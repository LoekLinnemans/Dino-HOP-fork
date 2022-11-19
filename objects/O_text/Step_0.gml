letters += spd;
text_current = string_copy(text,1,floor(letters));

draw_set_font(F_Text);
if (h == 0) h = string_height(text);
w = string_width(text_current);

//verwijder als hij klaar is
if (letters >= length && (keyboard_check_pressed(vk_anykey)))
{
	instance_destroy();
	with(O_camera) follow = O_player;
}











