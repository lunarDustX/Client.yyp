/// @description 
alpha -= 0.02;
if (alpha <= 0) instance_destroy();
draw_set_alpha(alpha);
draw_text(300, 100, "new crystals generated");
draw_set_alpha(1);
