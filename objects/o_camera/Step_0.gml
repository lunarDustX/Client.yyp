/// @description 
if (instance_exists(o_readyButton)) exit;
if (!instance_exists(o_player)) exit;
if (instance_exists(o_reborn) && o_reborn.dead == o_player) exit;

x = o_player.x;
y = o_player.y;