///@description client_send_pick
///@arg x
///@arg y
var xx = argument0,
	yy = argument1;

with (o_client) {
	buffer_seek(send_buffer, buffer_seek_start, 0);
	buffer_write(send_buffer, buffer_u8, MESSAGE_PICK);
	buffer_write(send_buffer, buffer_u16, xx); 
	buffer_write(send_buffer, buffer_u16, yy);
	network_send_packet(socket, send_buffer, buffer_tell(send_buffer));
}