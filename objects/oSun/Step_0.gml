if(!pause)
{
	x = room_width/2 + cos(time/rate) * orbitAmount;
	y = room_height/2 + sin(time/rate) * orbitAmount;
	time++;
	image_xscale = scale;
	image_yscale = scale;
	angle += arate;
	image_angle = angle;
}
if(place_meeting(x,y,oPlayer))
{
	if(!oGame.dead)
	{
		with(oPlayer)
		{
			sound(poof);
			text(x,y,"poof",c_gray,fGame);
			for(i=0;i<3;i++)
			{
				instance_create_layer(x,y,"fg2",oPoof);	
			}
		}
		oGame.deadTime = 60;
		oPlayer.image_alpha = 0;
		oGame.dead = true;
	}
}