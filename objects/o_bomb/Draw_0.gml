/// @description 
draw_self();
timer -= 1;
var num = ceil(timer/30*10);
draw_text(x, y, string(num div 10) + "." + string(num mod 10));
draw_circle(x, y, BOMB_RADIUS, true);