/// @description continue shoot
var shootDir = point_direction(x, y, mouse_x, mouse_y),
bullet = instance_create_layer(x, y, "Instances", o_bullet);
bullet.parent = self;
bullet.dir = shootDir;
bullet.image_index = team;
player_send_shoot(shootDir);	
ammo--;
if (ammo > 0) {
	alarm[2] = room_speed div 10;
}
