/// @description 
if (dead != o_player) exit;
time -= delta_time/1000000;
showTime = ceil(time);

draw_text(300, 135, string("REBORN TIME: ") + string(showTime));
/*
if (showTime <= 0) {
	instance_destroy();
}