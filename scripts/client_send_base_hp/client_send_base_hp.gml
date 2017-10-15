///@description client_send_base_hp
///@arg team
///@arg hp
var team = argument0;
var hp = argument1;

with (o_client) {
	buffer_seek(send_buffer, buffer_seek_start, 0);
	buffer_write(send_buffer, buffer_u8, MESSAGE_BASEHP);
	buffer_write(send_buffer, buffer_u16, team);
	buffer_write(send_buffer, buffer_u16, hp);

	network_send_packet(socket, send_buffer, buffer_tell(send_buffer));
}