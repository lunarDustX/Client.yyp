/// @description 
//draw_self();
event_inherited();
draw_healthbar(x-16, bbox_top-5, x+16, bbox_top-3, hp*(100/MAXHP), c_white, c_red, c_green, 0, false, false);
//draw_text(x-16, y-35, name);
//draw_text(x, y, string(soul));
if (soul > 0) {
	for (var i = 0; i < soul; i++) {
		draw_sprite(s_soul, 1, (bbox_left+8)+(i*16), y);
	}
}