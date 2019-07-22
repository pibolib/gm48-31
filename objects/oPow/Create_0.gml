image_xscale = 0;
image_yscale = 0;
image_alpha = 1;
nearestBounceObject = instance_nearest(x,y,oBounceObstacle);
image_angle = point_direction(nearestBounceObject.x,nearestBounceObject.y,oPlayer.x,oPlayer.y);
image_index = choose(0,1,2);