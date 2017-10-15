/// @description 
//team
image_index = team;

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