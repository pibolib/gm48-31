draw_set_font(font);
draw_set_color(color);
draw_set_halign(fa_center);
draw_set_alpha(image_alpha);
draw_text_transformed(x,y,str,xscale*5,yscale*5,angle);
draw_set_halign(fa_left);
draw_set_alpha(1);
draw_set_color(c_white);