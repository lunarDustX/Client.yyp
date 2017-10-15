///@description client_send_score
///@arg team
///@arg points
var 
team = argument0,
points = argument1;

with (o_client) {
	buffer_seek(send_buffer, buffer_seek_start, 0);
	buffer_write(send_buffer, buffer_u8, MESSAGE_SCORE);
	buffer_write(send_buffer, buffer_u16, team);
	buffer_write(send_buffer, buffer_u16, points);
	network_send_packet(socket, send_buffer, buffer_tell(send_buffer));
}