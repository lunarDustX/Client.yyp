/// @description 
//team
if (image_index != team) image_index = team;

if (!instance_exists(o_timer)) exit; 
if (dead) exit;

if (player_move() == true) {
	with (o_client) {
		buffer_seek(send_buffer, buffer_seek_start, 0);
		buffer_write(send_buffer, buffer_u8, MESSAGE_MOVE);
		buffer_write(send_buffer, buffer_u16, o_player.x);
		buffer_write(send_buffer, buffer_u16, o_player.y);

		network_send_packet(socket, send_buffer, buffer_tell(send_buffer));
	}
}

// gamepad shoot
if (gamepad_is_connected(0)) {
	xaxis_shoot = gamepad_axis_value(0, gp_axisrh);
	yaxis_shoot = gamepad_axis_value(0, gp_axisrv);
	magnitude_shoot = point_distance(0, 0, xaxis_shoot, yaxis_shoot);
	
	// common shoot
	if (magnitude_shoot > GAMEPAD_MAGNITUDE) {
		dir_shoot = point_direction(0, 0, xaxis_shoot, yaxis_shoot);
		if (can_shoot && gamepad_button_check_pressed(0, gp_shoulderrb)) {
			can_shoot = false;
			alarm[0] = SHOOT_COOLING;
			//alarm[2] = room_speed div 10;
			//ammo--;
			var shootDir = dir_shoot,
				bullet = instance_create_layer(x, y, "Instances", o_bullet);
				bullet.parent = self;
				bullet.dir = shootDir;
				bullet.image_index = team;
			player_send_shoot(shootDir);	
		}
	}
	
	// bomb
	if (bombs > 0) {
		if (gamepad_button_check_pressed(0, gp_shoulderlb)) {
			bombs--;
			player_leave_bomb(x, y);
		}
	}
}