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

//gamepad
xaxis = 0;
yaxis = 0;
dir = 0;
magnitude = 0;

xaxis_shoot = 0;
yaxis_shoot = 0;
dir_shoot = 0;
magnitude_shoot = 0;

