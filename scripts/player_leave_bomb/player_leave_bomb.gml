///@description player_leave_bomb
///@arg x
///@arg y

var xx = argument0,
	yy = argument1;
	
var bomb = instance_create_layer(xx, yy, "Instances", o_bomb);
bomb.image_index = team;

player_send_bomb(xx, yy);