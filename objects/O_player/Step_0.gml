switch(player_state)
{

	case("ALIVE"):
	{

		//lopen van de speler
		if (hascontrol)
		{
			key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
			key_right = keyboard_check(vk_right) or keyboard_check(ord("D")); 
			key_jump = keyboard_check(vk_up)  or keyboard_check(vk_space) ;
			key_speed = keyboard_check(vk_shift )


			//calculate movement
			var move = key_right - key_left;
			hsp =  move * movespeed;
			vsp = vsp + grv;
	
	
			//als shift wordt in ingedrukt
			if (key_speed)
			{
				//dan gaat de speler rennen
				sprite_index = S_run_player;
				movespeed = runsp;		
			}
			//anders
			else
			{
				//dan loopt hij 
				movespeed = walksp;
				sprite_index = S_walk_player;
			}

			//als speler op de grond staat en up_key word ingedrukt
			if (place_meeting(x,y+1,O_wall)) && (key_jump)
			{
				//springt de speler en hoor je een geluid
				vsp = jump;
				audio_play_sound(SN_jump,10,false);
			}

			//horizontal collision
			if (place_meeting(x+hsp,y,O_wall )) 
			{
				//tijdes dat de speler geen horizontale aanraking heeft met object O_wall
				while (!place_meeting(x+sign(hsp),y,O_wall )) 
				{
					//hier zet die x vast
					x = x + sign(hsp);
				}
				
				//hsp weer terug naar 0
				hsp = 0;
			}

			// horizontale beweging
			x = x + hsp;


			//vertical collision
			if (place_meeting(x,y+vsp,O_wall ))
			{
				//als speler geen verticale aanraking heeft met object O_wall
				while (!place_meeting(x,y+sign(vsp),O_wall)) 
				{
					//word y vast gezet tot speler weer in aanraking komt
					y = y + sign(vsp);
				}
				vsp = 0;
			}

			y = y + vsp;


			//Animation
			//als de speler in de lucht is
			if (!place_meeting(x,y+1,O_wall))
			{
				//dan springt de speler
				sprite_index = 	S_jump_player;
				image_speed = 0;
				if (sign(vsp) > 0) image_index = 1; else image_index = 0;
			}
			//als hij op de grond is
			else
			{
				//als speler op de grond komt maakt hij een val geluid
				if (sprite_index = S_jump_player) audio_play_sound(SN_drop, 4, false);
				image_speed = 1;
				if (hsp == 0)
				{
					//de speler veranderd dan ook weer naar de idle sprite
					sprite_index = S_idle__player;
				}
			}

			//zorgt er voor dat de speler de goede kant op kijkt
			if (hsp != 0) image_xscale =sign(hsp);

			//als de speler.y groter is dan 600 dus onder het scherm is hij dood en begint het spel overnieuw
			if (y > 600) Slidetransition(TRANS_MODE.RESTART)
		}
	}
	
	//als de speler dood is
	case("DEATH_PL"):
	{
		//als playerhealth kleiner of gelijk aan 0 is dan is de speler dood  en begint het spel overnieuw
		if (global.playerHealth <= 0)
		{
			//Slidetransition de zwarte balken komen en je bent weer bij het start scherm
			Slidetransition(TRANS_MODE.RESTART)
			//Health reset
			Health_coins();
			//remove GUI Hearts and coins
			instance_destroy(O_Health);
			instance_destroy(O_coin);
			
		}
	}
}