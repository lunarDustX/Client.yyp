/// @description 
if (other.soul >= other.capacity) exit;
other.soul++;
client_send_pick(x, y);
instance_destroy();

