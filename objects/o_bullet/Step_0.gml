/// @description 
dis += spd;
if (dis > SHOOT_RANGE) instance_destroy();
x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);
//show_message(string(lengthdir_x(spd, dir)));

