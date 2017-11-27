/// @description continue shoot

// gamepad shoot
if (gamepad_is_connected(0)) {
	xaxis_shoot = gamepad_axis_value(0, gp_axisrh);
	yaxis_shoot = gamepad_axis_value(0, gp_axisrv);
	dir_shoot = point_direction(0, 0, xaxis_shoot, yaxis_shoot);
	var shootDir = dir_shoot,
	bullet = instance_create_layer(x, y, "Instances", o_bullet);
	bullet.parent = self;
	bullet.dir = shootDir;
	bullet.image_index = team;
	player_send_shoot(shootDir);	
	ammo--;
	if (ammo > 0) {
		alarm[2] = room_speed div 10;
	}
}

// mouse shoot
if (!gamepad_is_connected(0)) {
	var shootDir = point_direction(x, y, mouse_x, mouse_y),
	bullet = instance_create_layer(x, y, "Instances", o_bullet);
	bullet.parent = self;
	bullet.dir = shootDir;
	bullet.image_index = team;
	player_send_shoot(shootDir);	
	ammo--;
	if (ammo > 0) {
		alarm[2] = room_speed div 10;
	}
}
