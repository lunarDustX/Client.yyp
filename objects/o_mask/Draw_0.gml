/// @description 
draw_set_color(c_black);
draw_rectangle(0,0,room_width, room_height, 0);
draw_set_color(c_white);

if (waiting) draw_text(o_camera.x, o_camera.y, "waiting other players..");