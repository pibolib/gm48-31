num = irandom_range(200,600);
if(room = rGame)
{
	if(instance_exists(oGame))
	{
		repeat(num) 
		{
			instance_create_layer(random_range(-1200*(oGame.level+1), 1200*(oGame.level+1))+(room_width/2),random_range(-1200*(oGame.level+1)+(room_height/2), 1200*(oGame.level+1)+(room_height/2)),"bg",oStar);
		}
	}
	else
	{
		repeat(num) 
		{
			instance_create_layer(random_range(-300,300)+(room_width/2),random_range(-300*(6)+(room_height/2),300*(6)+(room_height/2)),"bg",oStar);
		}	
	}
}
else 
{
	repeat(num)
	{
		instance_create_layer(random(room_width),random(room_height),"bg",oStar);
	}
}