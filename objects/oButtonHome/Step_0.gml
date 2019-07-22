var mousex = device_mouse_x_to_gui(0); // GUI position of mouse's x coordinate
var mousey = device_mouse_y_to_gui(0); // GUI position of mouse's y coordinate
// top left corner
var xx = 1600-100; // x position of the GUI element (insted of 0)
var yy = 900-50; // y position of the GUI element (insted of 0)
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
    else if(mouse_check_button_released(mb_left))
	{
		oCamera.transitionRoom = rTitleScreen;
		oGame.level = 0;
		image_index = 0;
		if(room = rDead or room = rCredits)
		{
			game_restart();	
		}
	}
	else
	{
		image_index = 1;	
	}
}
else
{
	image_index = 0;	
}