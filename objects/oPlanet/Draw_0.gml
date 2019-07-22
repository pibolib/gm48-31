draw_set_alpha(0.3);
draw_set_color(c_red);
draw_circle(x,y,rangeOfInfluence,true);
draw_set_alpha(1);
draw_set_color(c_white);
indicatorNumber = floor(orbitAmount/6);
for(i=0;i<indicatorNumber;i++)
{
	draw_sprite(sIndicator,0,room_width/2+dcos(360*i/indicatorNumber)*orbitAmount,room_height/2+dsin(360*i/indicatorNumber)*orbitAmount)	
}
draw_self();

if(goal)
{	
	draw_sprite_ext(sGoalIndicator,0,x,y,scale,scale,0,c_white,0.5);
	draw_sprite_ext(sGoalIndicator2,0,x,y-250,oCamera.scale,oCamera.scale,0,c_white,1);
}