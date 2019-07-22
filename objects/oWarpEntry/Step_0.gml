if(place_meeting(x,y,oPlayer) and !stop)
{
	oPlayer.x = oWarpExit.x;
	oPlayer.y = oWarpExit.y;
	stop = true;
	oWarpExit.stop = true;
	text(x,y,"WARP!",c_aqua,fGame);
}
if(stop)
{
	image_xscale = lerp(image_xscale,0,0.1);
}
if(image_xscale < 0.01)
{
	instance_destroy();	
}