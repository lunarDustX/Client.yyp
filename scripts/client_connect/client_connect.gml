///@description client_connect
///@arg username
var
username = argument0,
type = network_socket_tcp,
//ip = "222.31.72.69",
ip = "127.0.0.1",
port = 9000;

socket = network_create_socket(type);
my_client_id = -1;
connection = network_connect(socket, ip, port);
if (connection < 0) {
	show_error("Could not connect to server", true);
}

playermap = ds_map_create();
send_buffer = buffer_create(256, buffer_fixed, 1);

with (o_base) {
	if (team == global.team) {
		var spawn_x = x;
		var spawn_y = y;
		var player = instance_create_layer(x, y, "Instances", o_player);
		player.team = team;
		player.spawnx = x;
		player.spawny = y;
	}
}

#region// send join message
buffer_seek(send_buffer, buffer_seek_start, 0);
buffer_write(send_buffer, buffer_u8, MESSAGE_JOIN);
buffer_write(send_buffer, buffer_u16, spawn_x);
buffer_write(send_buffer, buffer_u16, spawn_y);
buffer_write(send_buffer, buffer_string, username);
buffer_write(send_buffer, buffer_u8, global.team);//team);
network_send_packet(socket, send_buffer, buffer_tell(send_buffer));
#endregion


