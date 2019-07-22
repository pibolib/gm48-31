if(instance_exists(oPlayer) and distance_to_object(oPlayer) < 256)
{
	oGame.powerUp[powerup]++;
	instance_destroy();
	instance_create_layer(x,y,"fg2",oPoofSpecial);
	sound(jingle);
	switch(powerup)
	{
		case 0:
			text(x,y+200,"BONUS LAUNCH!",c_white,fGame);
			add_score(500);
		break;
		case 1:
			add_score(500);
			text(x,y+200,"DIRECTION CHANGE!",c_white,fGame);
			oPlayer.hsp = dcos(angle) * 30;
			oPlayer.vsp = -dsin(angle) * 30;
			oPlayer.spinTime = 60;
		break;
		case 2:
			oPlayer.fuel = clamp(oPlayer.fuel+oPlayer.mfuel/2,oPlayer.fuel,oPlayer.mfuel);
			text(x,y+200,"REFUEL!",c_white,fGame);
			add_score(500);
		break;
		case 3:
			add_score(250);
			text(x,y+200,"BONUS BAGEL!",c_white,fGame);
		break;
		case 4:
			add_score(500);
			text(x,y+200,"PERSONAL SLICE!",c_white,fGame);
		break;
		case 5:
			add_score(750);
			text(x,y+200,"ICE CREAM?",c_white,fGame);
		break;
		
	}
}
if(instance_number(oPowerup) > 1)
{
	nearest = instance_nth_nearest(x,y,oPowerup,2);
	pdir = point_direction(x,y,nearest.x,nearest.y);
	if(distance_to_object(nearest) < 1000)
	{	
		x += -dcos(pdir) * 8;
		y += dsin(pdir) * 8;
	}
}
powerup = image_index;
if(powerup = 1)
{
	image_angle = angle - 90;	
}