draw_self();
if(mouse_check_button(mb_left) and (landed or oGame.powerUp[0] > 0) and oCamera.scaleTime = 0)
{
	draw_sprite_ext(sDraw,0,x,y,1,draw,-ddir+90,c_white,0.5);
	//draw_line(start_mx,start_my,mouse_x,mouse_y);
}

if(oCamera.scaleTime > 0)
{
	draw_sprite_ext(sGoalIndicator,0,x,(bbox_bottom+bbox_top)/2,2,2,0,c_lime,1);	
}