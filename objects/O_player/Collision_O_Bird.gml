//Collision
if place_meeting(x+vsp, y, O_Bird)
{
	var enemy = instance_place(x, y , O_Bird);
	
	//Van boven
	if (y < enemy.y -8) && (enemy.state != "DEATH")
	{
		//speler springt
		vsp = jump;
		
		with(enemy)
		{
			//enemy state death
			state = "DEATH";
			alarm[0] = room_speed/2;
		}
	}
	
	//als de enemy state Death is
	else if (enemy.state != "DEATH")
	{
		//als speler aanraaking met O_Bird
		if (place_meeting(x+1,y,enemy))
		{
			//dan gaat er 1 hartje van de healthbar weg
			global.playerHealth -= 1;
			//enemy loopt andere kant op
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




