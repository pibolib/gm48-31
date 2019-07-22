if(goal and instance_exists(oPlayer) and distance_to_object(oPlayer) > 128*scale and oCamera.scaleTime = 0)
{
	pdir = point_direction(oPlayer.x,oPlayer.y,x,y);
	draw_sprite_ext(sGoal,0,800+lengthdir_x(150,pdir),450+lengthdir_y(150,pdir),1,1,pdir,c_white,0.5);
}