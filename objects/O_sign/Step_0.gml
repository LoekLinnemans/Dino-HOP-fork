//als player in cirkel om bordje is met radius 64
if (point_in_circle(O_player.x,O_player.y,x,y,64) && (!instance_exists(O_text) && keyboard_check_released(vk_enter)))
{
	with (instance_create_layer(x,y-64,layer,O_text))
	{
		text = other.text;
		length = string_length(text);
	}
	with (O_camera)
	{
		follow = other.id;
	}
		
}









