orbitAmount = random_range(400,1600);

time = orbitAmount;
angle = random_range(-180,180);
image_blend = make_color_rgb(irandom_range(200,255),irandom_range(200,255),irandom_range(200,255));
scale = random_range(0.75,1.5);
rate = orbitAmount;
arate = random(0.5) * choose(-1,1);
rangeOfInfluence = 600 * scale;
goal = false;
sinceSpawn = 0;
image_index = irandom_range(0,11);
init = false;