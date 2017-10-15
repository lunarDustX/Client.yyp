/// @description display states

// health
// name 
// soul
draw_self();
draw_healthbar(x-16, y-20, x+16, y-18, hp*(100/MAXHP), c_white, c_red, c_green, 0, false, false);
draw_text(x-16, y-35, name);

if (soul > 0) {
	for (var i = 0; i < soul; i++) {
		draw_sprite(s_soul, 1, x-8+i*16, y);
	}
}