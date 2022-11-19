switch(state)
{
	case("WALK"):
	{
	vsp = vsp + grv;


	//dit zorgt er voor dat de enemy op en neer loopt
	x = x + hsp;
	//als hij de muur aanraakt
	if (place_meeting(x + hsp,y,O_wall )) 
	{
		// verander horizontal speed *-1 dus gaat het hij ander kant op
		hsp = hsp * dir;	
	}
	// als enemy andere kant op gaat zorgt dit ervoor dat de sprite spiegelt
	if (hsp != 0) image_xscale =sign(hsp); 

	//zorgt voor de zwaartekracht
	if (place_meeting(x,y+vsp,O_wall ))
	{
		//tijdens dat de grond niet geraakt wordt
		while (!place_meeting(x,y+sign(vsp),O_wall)) 
		{
			//blijft de y het zelfde
			y = y + sign(vsp); 
		}
			vsp = 0;
	}
	if (grounded) && (afraidofheights) && (!place_meeting(x+hsp,y+1,O_wall))
	{
		hsp = hsp * dir;
	}

	
	
	//anders is de y +de vertical speed dit is de gravity vsp = vsp + grv;
	y = y + vsp;	
	}
	
	
	
	case("DEATH"):
	{
		break;
	}

}


