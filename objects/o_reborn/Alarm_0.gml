/// @description

/* before
instance_activate_object(dead);
dead = noone;
instance_destroy();
*/

with (dead) {
	visible = true;
	self.dead = false;
}
instance_destroy();