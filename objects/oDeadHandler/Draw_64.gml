draw_set_font(fGameBig);
draw_set_halign(fa_center);
draw_text_outline(800,25,"Game Over...",c_yellow);
draw_set_font(fGame);
draw_text_outline(800,160,"Final Score: "+string(oGame.scr),c_yellow);
draw_set_halign(fa_left);