///@description player_move()

var base = noone;
var move = false;
if (keyboard_check(ord("D")) && place_free(x + spd + MOVE_GAP, y)) {
	base = instance_place(x + spd + MOVE_GAP, y, o_base);
	if (base != noone && team != base.team) {
		// cannont move into other base
	} else {
		x += spd;
		move = true;
	}
} else if (keyboard_check(ord("D"))){
	while place_free(x+1, y) {
		x += 1;	
		move = true;
	}
}

if (keyboard_check(ord("A")) && place_free(x - spd - MOVE_GAP, y)) {
	base = instance_place(x - spd - MOVE_GAP, y, o_base);
	if (base != noone && team != base.team) {
	} else {
		x -= spd;
		move = true;
	}
} else if (keyboard_check(ord("A"))){
	while place_free(x-1, y) {
		x -= 1;	
		move = true;
	}
}

if (keyboard_check(ord("S")) && place_free(x, y + spd + MOVE_GAP)) {
	base = instance_place(x, y + spd + MOVE_GAP, o_base);
	if (base != noone && team != base.team) {
	} else {
		y += spd;
		move = true;
	}
} else if (keyboard_check(ord("S"))){
	while place_free(x, y+1) {
		y+=1;
		move = true;
	}
}

if (keyboard_check(ord("W")) && place_free(x, y - spd - MOVE_GAP)) {
	base = instance_place(x, y - spd - MOVE_GAP, o_base);
	if (base != noone && team != base.team) {
	} else {
		y -= spd;
		move = true;
	}
} else if (keyboard_check(ord("W"))){
	while place_free(x, y-1) {
		y-=1;
		move = true;
	}
}

return move;