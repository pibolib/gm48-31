if(instance_exists(oSun))
{
	nearest = oSun;
	if(distance_to_object(nearest) < 1024)
	{
		x += -dcos(point_direction(x,y,nearest.x,nearest.y)) * 8;
		y += dsin(point_direction(x,y,nearest.x,nearest.y)) * 8;
	}
}

if(inv > 0)
{
	inv--;	
}