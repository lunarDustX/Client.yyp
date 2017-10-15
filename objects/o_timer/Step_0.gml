/// @description time goes
time -= delta_time/1000000;
showTime = ceil(time);
if (showTime <= 0) {
	//show_message("GAME END.");
	instance_destroy();
	var over = instance_create_layer(0, 0, "Instances", o_over);
	with (o_base) {
		if (team == T_RED) over.red = soul;
		if (team == T_BLUE) over.blue = soul;
		if (team == T_YELLOW) over.yellow =soul;
	}
	room_goto(r_over);
}
