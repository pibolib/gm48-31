if(room = rGame)
{
	level++;
	instance_create_layer(9999,9999,"fg2",oPlayer);
	for(i=0;i<irandom_range(level+3,level*2);i++)
	{
		with(instance_create_layer(x,y,"fg",oPlanet))
		{
			orbitAmount = (other.i+2) * 600 + random_range(-50,50);	
		}
	}
	for(i=0;i<irandom_range(3*level,5*level);i++)
	{
		instance_create_layer(x,y,"fg",oBounceObstacle);
	}
	instance_create_layer(x,y,"fg",oSun)
	startTime = 0;
	for(i=0;i<array_length_1d(powerUp);i++)
	{
		powerUp[i] = 0;	
	}

}