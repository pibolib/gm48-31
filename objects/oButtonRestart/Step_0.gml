var mousex = device_mouse_x_to_gui(0); // GUI position of mouse's x coordinate
var mousey = device_mouse_y_to_gui(0); // GUI position of mouse's y coordinate
// top left corner
var xx = 1600-54; // x position of the GUI element (insted of 0)
var yy = 900-60; // y position of the GUI element (insted of 0)
var ww = sprite_width; // width of the GUI element (insted of 50)
var hh = sprite_height; // height of the GUI element (insted of 50)
if (point_in_rectangle(mousex, mousey, xx, yy, xx + ww, yy + hh)) 
{
    // Check for mouse input
	if(mouse_check_button_pressed(mb_left))
	{
		image_index = 2;
		sound(btndown);
	}
    else if(mouse_check_button_released(mb_left) and oGame.lcTime = 0)
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
		image_index = 0;
		sound(btnup);	
	}
	else
	{
		audio_stop_sound(ready);
		audio_stop_sound(launch);
		image_index = 1;	
	}
}
else
{
	image_index = 0;	
}