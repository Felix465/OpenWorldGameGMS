var _controller_x = width_ div 2 
var _controller_y = height_ div 2 
timer -= 1
if (timer == 0) {
	var _bad_guy_start_x = _controller_x * CELL_WIDTH + CELL_WIDTH/2
	var _bad_guy_start_y = _controller_y * CELL_HEIGHT+ CELL_HEIGHT/2
	instance_create_layer (_bad_guy_start_x, _bad_guy_start_y, "Instances", o_bad_guy)

}