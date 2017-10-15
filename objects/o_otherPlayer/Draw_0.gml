/// @description display states

// health
// name 
// soul
draw_self();

//draw_healthbar(x-16, y-20, x+16, y-18, hp*(100/MAXHP), c_white, c_red, c_green, 0, false, false);
draw_text(x-16, bbox_top-22, name);
draw_healthbar(x-16, bbox_top-5, x+16, bbox_top-3, hp*(100/MAXHP), c_white, c_red, c_green, 0, false, false);

if (soul > 0) {
	for (var i = 0; i < soul; i++) {
		draw_sprite(s_soul, 1, (bbox_left+8)+(i*16), y);
	}
}