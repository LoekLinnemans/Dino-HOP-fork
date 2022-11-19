//speler variabelen worden gebruikt
with (O_player)
{
	//als collision met o_player
	if (hascontrol)
	{
		//control gaat uit
		hascontrol = false;
		//slide transition next room
		Slidetransition(TRANS_MODE.GOTO,other.target);
		//target staat in creation code in room gedefineerd
	}
	
}