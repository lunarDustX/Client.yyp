/// @description 
if (!connected) {
	connected = true;
	var username = async_load[? "result"];
	client_connect(username);
	instance_create_layer(room_width/2, room_height/2, "team_choose", o_readyButton);
}