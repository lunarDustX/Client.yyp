/// @description 
#region // sort by soul number
for (var i = 0; i < 3; i++) {
	for (var j = i+1; j < 3; j++) {
		if (rank[i].soul < rank[j].soul) {
			var t = rank[i];
			rank[i] = rank[j];
			rank[j] = t;
		}
	}
}
#endregion
#region // draw rank
draw_set_alpha(0.3);
draw_set_color(c_black);
draw_rectangle(0,0, 30, 70, false);
draw_set_alpha(1);

for (var i = 0; i < 3; i++) {
	switch rank[i].team {
		case T_RED: draw_set_color(c_red);break;
		case T_YELLOW: draw_set_color(c_yellow);break;
		case T_BLUE: draw_set_color(c_blue);break;
	}
	draw_text(10, i*18+10, string(rank[i].soul));
	draw_set_color(c_white);
}
#endregion