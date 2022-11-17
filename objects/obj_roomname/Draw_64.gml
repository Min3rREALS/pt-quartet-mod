//Draw Text

draw_set_font(global.smallfont)
draw_set_halign(fa_center);
draw_set_color(c_white)

draw_sprite(spr_roomnamebg,0,xi,yi)
//Text Event
draw_text(xi, yi, string_hash_to_newline(message))

//Reset
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);