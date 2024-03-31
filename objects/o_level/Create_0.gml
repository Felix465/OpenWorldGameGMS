// makes sure u get diffrent outcome each time
randomise()


shadow_surface_ = noone
// Get the tile layer map id
var _wall_map_id = layer_tilemap_get_id("WallTiles")


// set up grid

width_  =  room_width div CELL_WIDTH
height_ = room_height div CELL_HEIGHT
grid_ = ds_grid_create(width_, height_)
ds_grid_set_region(grid_, 0, 0, width_, height_, VOID)


// Create the controller // store controllers position // the smaller the _steps is the less floor 
var _controller_x = width_ div 2 
var _controller_y = height_ div 2 
var _controller_direction = irandom(3)
var _steps = 400 

timer = room_speed * 5

var _player_start_x = _controller_x * CELL_WIDTH + CELL_WIDTH/2
var _player_start_y = _controller_y * CELL_HEIGHT+ CELL_HEIGHT/2
instance_create_layer (_player_start_x,_player_start_y, "Instances", o_player)

var _direction_change_odds = 1

//it will repeate this 400 times
var i_ = 0 
repeat (_steps)  {
	grid_[# _controller_x, _controller_y] = FLOOR
	
	i_ = i_ +1 
	
	if (i_ == _steps) {
		instance_create_layer(_controller_x * CELL_WIDTH + CELL_WIDTH/2, _controller_y * CELL_HEIGHT+ CELL_HEIGHT/2, "Instances", o_exit )
	}else {
		var coin = random_range(0,25)
		if (coin > 24){
			instance_create_layer(_controller_x * CELL_WIDTH + CELL_WIDTH/2, _controller_y * CELL_HEIGHT+ CELL_HEIGHT/2, "Instances", o_coin )
		}else {
		var shop = random_range(0,500)
		if (shop > 498){
			instance_create_layer(_controller_x * CELL_WIDTH + CELL_WIDTH/2, _controller_y * CELL_HEIGHT+ CELL_HEIGHT/2, "Instances", o_shop )
		}else {
		var chest = random_range(0,500)
		if (chest > 498){
			instance_create_layer(_controller_x * CELL_WIDTH + CELL_WIDTH/2, _controller_y * CELL_HEIGHT+ CELL_HEIGHT/2, "Instances", o_chest )
		}

	}
	}
	}
	
	// Randomise the direction
	if (irandom(_direction_change_odds) == _direction_change_odds) {
		_controller_direction = irandom(3)
	}
	// move the controller
	var _x_direction = lengthdir_x(1, _controller_direction * 90 )
	var _y_direction = lengthdir_y(1, _controller_direction * 90 )
	_controller_x += _x_direction
	_controller_y += _y_direction
	
	// makes sure we dont go outside the grid
	
	if(_controller_x < 2 || _controller_x >= width_ - 2) {
		_controller_x += - _x_direction * 2 
	}
		if(_controller_y < 2 || _controller_y >= height_ - 2) {
		_controller_y += - _y_direction * 2 
	}
	
}
for (var _y = 1; _y < height_-1; _y++) {
	for (var _x = 1; _x< width_-1; _x++) {
		if (grid_[# _x, _y] != FLOOR)  {
			var _north_tile = grid_[# _x, _y-1] == VOID
			var _west_tile = grid_[# _x-1, _y] == VOID
			var _east_tile = grid_[# _x+1, _y] == VOID
			var _south_tile = grid_[# _x, _y+1] == VOID
			
			
			var _tile_index = NORTH*_north_tile + WEST*_west_tile + EAST*_east_tile + SOUTH*_south_tile + 1
			if (_tile_index == 1) {
				grid_[# _x,_y] = FLOOR
			}
		}
	}
	
	
}

for (var _y = 1; _y < height_-1; _y++) {
	for (var _x = 1; _x< width_-1; _x++) {
		if (grid_[# _x, _y] != FLOOR)  {
			var _north_tile = grid_[# _x, _y-1] == VOID
			var _west_tile = grid_[# _x-1, _y] == VOID
			var _east_tile = grid_[# _x+1, _y] == VOID
			var _south_tile = grid_[# _x, _y+1] == VOID
			
			
			var _tile_index = NORTH*_north_tile + WEST*_west_tile + EAST*_east_tile + SOUTH*_south_tile + 1
			tilemap_set(_wall_map_id, _tile_index, _x, _y)
		}
	}
	
	
}