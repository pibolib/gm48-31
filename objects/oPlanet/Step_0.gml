if(!init)
{
	init = true;
	time = orbitAmount * random(oGame.level);
	angle = random_range(-180,180);
	image_blend = make_color_rgb(irandom_range(200,255),irandom_range(200,255),irandom_range(200,255));
	rate = 256;
	arate = random(0.5) * choose(-1,1);
	rangeOfInfluence = 1100 * scale;
	goal = false;
	sinceSpawn = 0;
}
else
{
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
	if(sinceSpawn < 30)
	{
		if(irandom(1000) > 990 and self != instance_furthest(room_width/2,room_height/2,oPlanet))
		{
			for(i=0;i<irandom_range(1,2);i++){
				with(instance_create_layer(x+random_range(-200,200),y+random_range(-200,200),"fg2",oPowerup))
				{
					image_index = choose(3,3,3,4,4,5);
					powerup = image_index;
				}
			}
		}
		if(irandom(1000) > 960 and self != instance_furthest(room_width/2,room_height/2,oPlanet))
		{
			with(instance_create_layer(x+random_range(-400,400),y+random_range(-400,400),"fg2",oPowerup))
			{
				image_index = choose(0,0,0,1,1,2);	
			}	
		}
	}
	sinceSpawn++;
}