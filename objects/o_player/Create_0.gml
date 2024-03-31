x_speed_ = 0
y_speed_ = 0 
max_speed_ = 2
acceleration_ = 0.5
cash = 0
instance_create_layer(x, y, "Instances", o_camera)

if ! persistent {
	persistent = true
	if (instance_number(o_player) > 1){
		instance_destroy()
	}
}

