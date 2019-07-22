if(place_meeting(x,y,oPlayer) and !stop)
{
	oPlayer.x = oWarpEntry.x;
	oPlayer.y = oWarpEntry.y;
	stop = true;
	oWarpEntry.stop = true;
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