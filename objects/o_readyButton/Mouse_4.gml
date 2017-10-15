/// @description player ready
instance_destroy();
#region // send ready to server
with (o_client) {
	buffer_seek(send_buffer, buffer_seek_start, 0);
	buffer_write(send_buffer, buffer_u8, MESSAGE_READY);
	network_send_packet(socket, send_buffer, buffer_tell(send_buffer));
}
#endregion