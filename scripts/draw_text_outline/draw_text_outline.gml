///@function draw_text_outline
///@arg x
///@arg y
///@arg str
///@arg color
draw_set_color(c_black);
for(i=-3;i<=3;i++)
{
	for(j=-3;j<=3;j++)
	{
		draw_text(argument0+i,argument1+j,argument2);
	}	
}
draw_set_color(argument3);
draw_text(argument0,argument1,argument2);
draw_set_color(c_white);