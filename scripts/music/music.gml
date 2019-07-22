if(!audio_is_playing(argument0))
{
	audio_sound_gain(argument0,0.7,0);
	audio_play_sound(argument0,1,0);
	if(argument0 = winning)
	{
		audio_stop_sound(pizzaSpace);	
	}
	if(argument0 = pizzaSpace)
	{
		audio_stop_sound(winning);	
	}
}