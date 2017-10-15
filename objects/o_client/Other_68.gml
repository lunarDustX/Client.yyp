/// @description 
switch (async_load[? "type"]) {
	case network_type_data:
		var buffer = async_load[? "buffer"];
		client_handle_message(buffer);
	break;
}
