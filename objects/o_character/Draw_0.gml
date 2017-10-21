/// @description flash

draw_self();
if (flash > 0) {
	flash -= 0.1;
	gpu_set_blendmode(bm_add);	
	shader_set(shader_flash);
	shd_alpha = shader_get_uniform(shader_flash, "_alpha");
	shader_set_uniform_f(shd_alpha, flash);
	draw_self();
	shader_reset();
	gpu_set_blendmode(bm_normal);	
}
