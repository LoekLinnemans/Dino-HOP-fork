switch(state)
{
	case("WALK"):
	{



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

		
	
	//anders is de y +de vertical speed dit is de gravity vsp = vsp + grv;
	y = y + vsp;	
	}
	
	
	
	case("DEATH"):
	{
		break;
	}

}


