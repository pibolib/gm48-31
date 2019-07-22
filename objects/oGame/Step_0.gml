if(levelComplete and lcTime > 120)
{
	oCamera.transitionRoom = rWin;
	levelComplete = false;
	lcTime = 0;
	deadTime = 0;
}
if(levelComplete)
{
	lcTime++;	
}
if(pauseTime > 0)
{
	pauseTime--;	
}
startTime++;
if(startTime = 6)
{
	if(level > 5)
	{
		furthest = instance_furthest(room_width/2,room_height/2,oPlanet);
		nearest = instance_nth_nearest(room_width/2,room_height/2,oPlanet,3);
		instance_create_layer(furthest.x,furthest.y,"fg",oWarpEntry);
		instance_create_layer(nearest.x,nearest.y,"fg",oWarpExit);
	}
	oPlayer.x = instance_furthest(room_width/2,room_height/2,oPlanet).x;
	oPlayer.y = instance_furthest(room_width/2,room_height/2,oPlanet).y - 100;	
}
if(startTime > 5)
{
	
	with(instance_nth_nearest(room_width/2,room_height/2,oPlanet,2))
	{
		goal = true;
	}	
}
dscr = lerp(dscr,scr,0.2);
if(scrlv > nextlv)
{
	nextlv = floor(nextlv*1.25);
	scrlv = 0;
	lvs++;
	text(oCamera.x,oCamera.y+300,"1up",c_yellow,fGame);
}
if(dead)
{
	deadTime++;
}
if(deadTime > 120)
{
	oPlanet.sinceSpawn = 0;
	oPlayer.fuel = oPlayer.mfuel;
	oPlayer.image_alpha = 1;
	deadTime = 0;
	lvs--;
	oPlayer.x = instance_furthest(room_width/2,room_height/2,oPlanet).x;
	oPlayer.y = instance_furthest(room_width/2,room_height/2,oPlanet).y - 100;
	dead = false;
}
if(lvs < 0)
{
	oCamera.transitionRoom = rDead;	
}
if(level > 10)
{
	oCamera.transitionRoom = rCredits;	
}
if(instance_exists(oPlayer))
{
	fuelPercent = oPlayer.fuel/oPlayer.mfuel;
	levelBonus = ceil(fuelPercent * level * 1000);
}