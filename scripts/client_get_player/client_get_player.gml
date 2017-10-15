 ///@description client_get_player
///@clientSocket
var 
clientSocket = argument0;
if (my_client_id == clientSocket) {
	if (!instance_exists(o_player)) {
		instance_create_layer(0, 0, "Instances", o_player);
	}
	return o_player;
} else if (ds_map_exists(playermap, string(clientSocket))) {
	return playermap[? string(clientSocket)];
} else {
	var otherPlayer = instance_create_layer(0, 0, "Instances", o_otherPlayer);
	playermap[? string(clientSocket)] = otherPlayer;
	return otherPlayer;
}    