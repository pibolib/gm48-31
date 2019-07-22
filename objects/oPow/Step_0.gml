image_xscale = lerp(image_xscale,1,0.1);
image_yscale = lerp(image_yscale,1,0.2);

if(image_xscale > 0.99)
{
	image_alpha = lerp(image_alpha,0,0.1);
}
