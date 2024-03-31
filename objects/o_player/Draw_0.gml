draw_sprite_ext(s_player_shadow, 0, x, y+1, 1, - 0.75, 0, c_white, 0.5)
draw_self()


draw_set_font(font)

draw_text(x,y, "COINS :"	+ string(cash))

