///@description player_send_shoot
///@arg shoorDir
var 
dir = argument0;

with (o_client) {
	buffer_seek(send_buffer, buffer_seek_start, 0);
	buffer_write(send_buffer, buffer_u8, MESSAGE_SHOOT);
	buffer_write(send_buffer, buffer_u16, dir);
	network_send_packet(socket, send_buffer, buffer_tell(send_buffer));
}