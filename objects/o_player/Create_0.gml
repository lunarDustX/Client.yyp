/// @description vars
event_inherited();

spd = PLAYER_SPD;
can_shoot = true;
bomb_ready = true;
//ammo = AMMOPERSHOOT;

switch (global.hero) {
	case heroes.rectangle:
		hero_rectangle_setting();
	break;
	
	case heroes.square:
		hero_square_setting();
	break;
}

