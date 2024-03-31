



if (o_player.x - o_bad_guy.x > 1) {
	image_xscale = 1
} else if (o_player.x - o_bad_guy.x < -1){
	
	image_xscale = -1
}



if (grid_place_meeting(self, o_level.grid_)) {
	x = bbox_right&~(CELL_WIDTH-1)
	x -= bbox_right-x
	x_speed_ = 0

}

if (grid_place_meeting(self, o_level.grid_)) {
		x = bbox_left&~(CELL_WIDTH-1)
		x+= CELL_WIDTH+x-bbox_left
		x_speed_ = 0
		
}


if (grid_place_meeting(self, o_level.grid_)){
		y = bbox_bottom&~(CELL_HEIGHT-1)
		y -= bbox_bottom-y
		y_speed_ = 0
		
}

if (grid_place_meeting(self, o_level.grid_)) {
		y = bbox_top&~(CELL_HEIGHT-1)
		y += CELL_HEIGHT+y-bbox_top
		y_speed_ = 0
}

mp_potential_step(o_player.x,o_player.y,1.5,false)
