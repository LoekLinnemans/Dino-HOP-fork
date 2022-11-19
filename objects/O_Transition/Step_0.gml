//verandering van room
if (mode != TRANS_MODE.OFF)
{
	//als je in de intro bent
	if (mode == TRANS_MODE.INTRO)
	{
		//dan wordt het beelt even zwart en dit is de reken som met max en min tijd
		percent = max(0,percent - max ((percent/15),0.005));
	}
	//anders
	else
	{
		//is de max en min tijd 
		percent = min(1.2, percent + max(((1.2-percent)/15),0.005));
	}
	
	if (percent == 1.2) || (percent == 0)
	{
		//statussen
		switch(mode)
		{
			//case intro
			case TRANS_MODE.INTRO:
			{
				mode = TRANS_MODE.OFF
				break;
			}
			//next room
			case TRANS_MODE.NEXT:
			{
				mode = TRANS_MODE.INTRO
				room_goto_next();
				break;
			}
			//goto room target
			case TRANS_MODE.GOTO:
			{
				mode = TRANS_MODE.INTRO
				room_goto(target);
				break;
			}
			//case restart game
			case TRANS_MODE.RESTART:
			{
				game_restart();
				break;
			}
		}
	}
}