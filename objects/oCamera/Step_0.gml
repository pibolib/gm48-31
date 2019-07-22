if(room != rGame)
{
	music(winning);
}
else
{
	music(pizzaSpace);
}
xView = lerp(xView,cSizeX*scale,0.1);
yView = lerp(yView,cSizeY*scale,0.1);
angle = lerp(angle,0,0.1);
camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera,pm);
vm = matrix_build_lookat(x+sxm,y+sym,-10,x+sxm,y+sym,0,angle,1,0);
pm = matrix_build_projection_ortho(xView,yView,cMaxDepthNeg,cMaxDepthPos);
view_camera[0] = camera;


if(scaleTime = 0)
{
	if(instance_exists(oPlayer))
	{
		if(mouse_check_button(mb_left))
		{
			scale = lerp(scale,clamp(instance_number(oPlanet)/2,4,99999),0.05);
		}
		else
		{
			scale = lerp(scale,clamp(instance_number(oPlanet)/4,2,99999),0.05);
			x = lerp(x,oPlayer.x,0.1);
			y = lerp(y,oPlayer.y,0.1);
		}
	}
	else
	{
		scale = lerp(scale,1,0.1);
		x = lerp(x,room_width/2,0.1);
		y = lerp(y,room_height/2,0.1);
	}
}
if(scaleTime > 0)
{
	scaleTime--;	
}

if(room != rGame and scaleTime = 0)
{
	scale = 0.5;
	x = room_width/2;
	y = room_height/2;
}

	shake = clamp(shake,0,5);
	shake = lerp(shake,0,0.2);
	angle = random_range(-shake,shake)/20;
	ssm = random_range(-shake,shake)/20;
	sxm = random_range(-shake,shake);
	sym = random_range(-shake,shake);
	
if(room != transitionRoom)
{
	transitionAmount = lerp(transitionAmount,1,0.1);
}
else
{
	transitionAmount = lerp(transitionAmount,0,0.1);	
}
if(transitionAmount > 0.99)
{
	room_goto(transitionRoom);	
}