draw_set_font(fGame);
if(room = rGame)
{
	draw_set_halign(fa_right);
	draw_text_outline(1575,25,"SCORE: "+string(round(dscr)),c_white);
	draw_set_halign(fa_left);
	draw_sprite(sLivesIcon,0,40,25);
	for(i=0;i<lvs;i++)
	{
		draw_sprite(sLife,0,100+40*i,45);
		draw_set_alpha(0.5);
		draw_sprite_part(sLife,0,0,0,36*(scrlv/nextlv),150,100+40*(i+1),45);
		draw_set_alpha(1);
	}
	//draw_text(0,25,"LIVES: "+string(lvs)+" ("+string(floor(100*(scrlv/nextlv)))+"%)");
	if(instance_exists(oPlayer))
	{
		draw_sprite(sFuel,0,90,70);
		draw_sprite_part(sFuel,1,43,0,287*(oPlayer.fuel/oPlayer.mfuel),100,90+43,70);
		if(oPlayer.fuel <= 0)
		{
			draw_set_halign(fa_center);
			draw_set_font(fGameBig);
			draw_text_outline(800,200,"OUT OF FUEL!",c_red);
			draw_set_font(fGame);
			draw_set_halign(fa_left);
		}
	}
	draw_set_halign(fa_center);
	draw_text_outline(800,25,"LEVEL: "+string(level)+"/10",c_white);
	draw_set_font(fGameBig);
	if(oCamera.scaleTime > 60)
	{
		draw_text_outline(800,450,"Get ready...",c_yellow);
	}
	else if(oCamera.scaleTime > 0)
	{
		draw_text_outline(800,450,"GO!!!",c_white);
	}
	draw_set_font(fGame);
	draw_set_halign(fa_left);
}
else if(room = rWin)
{
	draw_set_halign(fa_center);
	draw_set_font(fGameBig);
	draw_text_outline(800,50,"LEVEL COMPLETE!",c_lime);
	draw_set_font(fGame);
	draw_text_outline(800,150,"SCORE: "+string(round(dscr)),c_white);
	draw_text_outline(800,190,"FUEL BONUS: "+string(ceil(levelBonus)),c_white);
	draw_set_halign(fa_left);
}
