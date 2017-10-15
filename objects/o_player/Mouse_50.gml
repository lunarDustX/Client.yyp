/// @description shoot
if (!instance_exists(o_timer)) exit; // game has not begun
if (dead) exit;

if (can_shoot) {
	can_shoot = false;
	alarm[0] = SHOOT_COOLING;
	alarm[2] = room_speed div 10;
	ammo--;
	var shootDir = point_direction(x, y, mouse_x, mouse_y),
		bullet = instance_create_layer(x, y, "Instances", o_bullet);
		bullet.parent = self;
		bullet.dir = shootDir;
		bullet.image_index = team;
	player_send_shoot(shootDir);	
} 
