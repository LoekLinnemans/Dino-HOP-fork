//als aanraking met player
if (place_meeting(x,y,O_player) && !collected)
{
	global.coins++;
	image_index = 0
	collected = true;
}

//als coin is gepakt
if (collected)
{
	sprite_index  = S_coin_collected;
	if (floor(image_index) >= image_number -1)
	{
		instance_destroy();
	}
}

