/// @description 
global.team = image_index;
with (o_team_choose) instance_destroy();
//room_goto(r_classic);
instance_create_layer(200, 150, "Instances", o_square);
instance_create_layer(300, 150, "Instances", o_rectangle);



