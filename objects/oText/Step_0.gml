x += hsp;
y += vsp;
hsp = lerp(hsp,0,0.1);
vsp = lerp(vsp,0,0.1);
xscale = lerp(xscale,1,0.1);
yscale = lerp(yscale,1,0.2);
angle = lerp(angle,gtangle,0.1);
if(angle = gtangle)
{
	image_alpha = lerp(image_alpha,0,0.1);	
}
if(image_alpha <= 0.01)
{
	instance_destroy();	
}