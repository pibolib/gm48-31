if(instance_exists(oPlanet) and !pause)
{
	nearest = instance_nearest(x,y,oPlanet);
	if(place_meeting(x+sign(hsp),y+sign(vsp),oPlanet))
	{
		if(!landed)
		{
			
			image_index = 0;
			pdir = point_direction(x,y,nearest.x,nearest.y) + 180;
			landed = true;
			x = nearest.x + lengthdir_x(127*nearest.scale,pdir);
			y = nearest.y + lengthdir_y(127*nearest.scale,pdir);
			image_angle = pdir - 90;
			hsp = 0;
			vsp = 0;
			camera_shake(1);
			if(nearest.goal)
			{
				sound(win);
				oGame.levelComplete = true;
				text(x,y-200,"Pizza Delivered!",c_lime,fGame);	
				hsp = 0;
				vsp = 0;
			}
			else if(oCamera.scaleTime = 0)
			{
				sound(land);
			}
		}
		pause = 8;
	}
	else if(distance_to_object(nearest) < nearest.rangeOfInfluence/2 + 160)
	{
		landed = false;
		dir = point_direction(x,y,nearest.x,nearest.y);
		image_angle = lerp(image_angle,dir + 90,0.05);
		hsp += dcos(dir) / 2;
		vsp += -dsin(dir) / 2;
	}
}
if(instance_exists(oBounceObstacle) and distance_to_object(instance_nearest(x,y,oBounceObstacle)) < 64)
{
	if(instance_nearest(x,y,oBounceObstacle).inv = 0)
	{
		with(instance_nearest(x,y,oBounceObstacle))
		{
			inv = 120;	
		}
		pdir = point_direction(x,y,x+hsp,y+vsp);
		x = xprevious;
		y = yprevious;
		oPlayer.hsp = dcos(-pdir) * abs(hsp) * 1.5;
		oPlayer.vsp = -dsin(-pdir) * abs(vsp) * 1.5;
		text(x,y,"BOUNCE!",c_gray,fGame);
		spinTime = 60;
		image_index = 0;
		instance_create_layer(x,y,"fg2",oPow);
		camera_shake(0.5);
		sound(bounce);
	}
}
if(oGame.powerUp[0] > 0)
{
	hsp = 0;
	vsp = 0;
	pause = 3;	
}
if(oCamera.scaleTime = 0 and image_alpha = 1)
{
	if(mouse_check_button(mb_left) and (landed or oGame.powerUp[0] > 0))
	{
		draw = clamp(point_distance(start_mx,start_my,mouse_x,mouse_y) / 50,0,80)/8;
		ddir = -point_direction(start_mx,start_my,mouse_x,mouse_y);
		if(mouse_x < x)
		{
			if(image_angle < 180)
			{
				image_xscale = 1;
			} 
			else
			{
				image_xscale = -1;
			}
		} 
		else
		{ 
			if(image_angle > 180)
			{
				image_xscale = -1;
			}
			else
			{
				image_xscale = 1;
			}
		}
	}
	if(mouse_check_button_pressed(mb_left) and (landed or oGame.powerUp[0] > 0) and oCamera.scaleTime = 0 and fuel > 0)
	{
		sound(ready);
		image_index = 0;
		start_mx = mouse_x;
		start_my = mouse_y;	

	}	
	else if(mouse_check_button_released(mb_left) and (landed or oGame.powerUp[0] > 0) and oCamera.scaleTime = 0 and fuel > 0)
	{
		sound(launch);
		oGame.powerUp[0] = 0;	
		image_index = 0;
		spd = clamp(point_distance(start_mx,start_my,mouse_x,mouse_y) / 50,0,80);
		dir = -point_direction(start_mx,start_my,mouse_x,mouse_y);
	
		if(fuel > 0)
		{
			hsp = -dcos(dir) * spd;
			vsp = -dsin(dir) * spd;
		}
		fuel -= spd*2;
		image_angle = -dir + 90;
	}
}
else
{
	start_mx = mouse_x;
	start_my = mouse_y;		
}
hsp *= 0.99;
vsp *= 0.99;
x += hsp;
y += vsp;
if(landed)
{
	timeSinceLand++;	
}
else
{
	timeSinceLand = 0;	
}
if(landed)
{
	if(oGame.levelComplete)
	{
		sprite_index = sPlayerWin;
	}
	else if(timeSinceLand > 30)
	{
		if(mouse_check_button(mb_left) and oCamera.scaleTime = 0)
		{
			sprite_index = sPlayerReady;
			image_index = clamp(image_index,0,11);
		}
		else
		{
			sprite_index = sPlayerIdle;
		}
	}
	else
	{
		sprite_index = sPlayerLand;
	}
}
else
{
	if(timeSinceLastLand < 30)
	{
		sprite_index = sPlayerRelease;		
	}
	else if(spinTime = 0)
	{
		sprite_index = sPlayerFloat;
	}
	else
	{
		sprite_index = sPlayerSpin;	
	}
}
if(spinTime > 0)
{
	spinTime--;	
}
if(!landed)
{
	timeSinceLastLand++;	
}
else
{
	timeSinceLastLand = 0;	
}
time++;
if(abs(hsp) < 1 and abs(vsp) < 1 and timeSinceLastLand > 180 and oGame.powerUp[0] = 0)
{
	if(instance_exists(oPlanet) and distance_to_object(instance_nearest(x,y,oPlanet)) < instance_nearest(x,y,oPlanet).rangeOfInfluence)
	{
			
	}
	else
	{
		if(!oGame.dead)
		{
			sound(poof);
			text(x,y,"poof",c_gray,fGame);
			for(i=0;i<3;i++)
			{
				instance_create_layer(x,y,"fg2",oPoof);	
			}
			image_alpha = 0;
			oGame.dead = true;
		}
	}
}
if(fuel <= 0 and timeSinceLastLand > 120)
{
	if(!oGame.dead)
	{
		sound(poof);
		text(x,y,"poof",c_gray,fGame);
		for(i=0;i<3;i++)
		{
			instance_create_layer(x,y,"fg2",oPoof);	
		}
		image_alpha = 0;
		oGame.dead = true;
	}	
}