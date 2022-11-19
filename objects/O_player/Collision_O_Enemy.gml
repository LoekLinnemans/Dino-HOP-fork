//aanraking met O_enmey van boven
if place_meeting(x+vsp, y, O_Enemy)
{
	//checkt of player boven O_enmey is 
	var enemy = instance_place(x, y , O_Enemy);
	//als player niet in state DAEATH zit
	if (y < enemy.y -8) && (enemy.state != "DEATH")
	{
		//springt de player een keer
		vsp = jump;
		
		with(enemy)
		{
			//enemy komt in state DEATH
			state = "DEATH";
			//timer
			alarm[0] = room_speed/2;
		}
	}
	//als player niet van boven komt en enemy is niet in state DEATH
	else if (enemy.state != "DEATH")
	{
		//als player aanraking met oenemy.x +1
		if (place_meeting(x+1,y,enemy))
		{
			//-1 hartje van healthbar
			global.playerHealth -= 1;
			//enemy gaat andere kan op
			other.hsp *= -1;
			
			//als oplayer.x groter is dan enemy.x en hijloopt tegen enemy aan
			if (O_player.x > other.x-1 )
			{
				//gaat de player om hoog met 15
				y = y - 15;
				//en naar rechts
				x = x +20;
			}
			//als player.x kleiner is dan enemy.x
			else			
			{
				//gaat de player ook omhoog met 15
				y = y -15;
				//maar dan gaat die naar links
				x = x -20;
			}			
		}	
	}
}
	
			