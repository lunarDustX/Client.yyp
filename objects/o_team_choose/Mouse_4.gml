/// @description 
global.team = image_index;
with (o_team_choose) instance_destroy();
room_goto(r_classic);

/* before
var client = instance_create_layer(0, 0, "Instances", o_client);
client.team = image_index;

with (o_team_choose) {
	instance_destroy();
}

