///@description client_handle_message
///@arg buffer
var  buffer = argument0;
//buffer_seek(buffer, buffer_seek_start, 0);
var message_id = buffer_read(buffer, buffer_u8);

switch (message_id) {
	case MESSAGE_GETID:
		my_client_id = buffer_read(buffer, buffer_u16);
	break;
	
	case MESSAGE_JOIN:
		//show_message(string(buffer_get_size(buffer)));
		var
		clientSocket = buffer_read(buffer, buffer_u16),
		xx = buffer_read(buffer, buffer_u16),
		yy = buffer_read(buffer, buffer_u16),
		username = buffer_read(buffer, buffer_string),
		team = buffer_read(buffer, buffer_u8),
		heroType = buffer_read(buffer, buffer_u8),
		
		player = client_get_player(clientSocket);
		player.name = username;
		player.x = xx;
		player.y = yy;
		player.team = team;
		player.heroType = heroType;
		player.spawnx = xx;
		player.spawny = yy;
	break;
	
	case MESSAGE_MOVE:
		var 
		clientSocket = buffer_read(buffer, buffer_u16),
		xx = buffer_read(buffer, buffer_u16),
		yy = buffer_read(buffer, buffer_u16),
		movingPlayer = client_get_player(clientSocket);
		movingPlayer.x = xx;
		movingPlayer.y = yy;
	break;
	
	case MESSAGE_LEAVE:
		var 
		clientSocket = buffer_read(buffer, buffer_u16),
		playerLeft = client_get_player(clientSocket);
		
		instance_destroy(playerLeft);
		ds_map_delete(playermap, string(clientSocket));
	break;
	
	case MESSAGE_HIT:
		var 
		clientSocket = buffer_read(buffer, buffer_u16),
		playerHurt = client_get_player(clientSocket);
		playerHurt.hp--;
	break;
	
	case MESSAGE_SHOOT:
		var 
		clientSocket = buffer_read(buffer, buffer_u16),
		shootDir = buffer_read(buffer, buffer_u16),
		playerShoot = client_get_player(clientSocket),
		
		bullet = instance_create_layer(playerShoot.x, playerShoot.y, "Instances", o_bullet);
		///bullet.parent = playerShoot;
		with (bullet) {
			self.dir = shootDir;
			self.parent = playerShoot;
			image_index = self.parent.team;
			depth = self.parent.depth + 1;
		}
	break;
	
	case MESSAGE_SPAWN:
		var
		xx = buffer_read(buffer, buffer_u16),
		yy = buffer_read(buffer, buffer_u16);
		
		var soul = instance_create_layer(xx, yy, "Instances", o_soul);
	break;
	
	case MESSAGE_PICK:
		var 
		clientSocket = buffer_read(buffer, buffer_u16),
		xx = buffer_read(buffer, buffer_u16),
		yy = buffer_read(buffer, buffer_u16),
		player = client_get_player(clientSocket),
		soul = instance_position(xx, yy, o_soul);
		player.soul++;
		with (soul) instance_destroy();
	break;
	
	case MESSAGE_DIE:
		var
		clientSocket = buffer_read(buffer, buffer_u16),
		player = client_get_player(clientSocket),
		sx, 
		sy;
		
		if (player.soul > 0) { //loot
			for (i = 0; i < player.soul; i++) {
				sx = player.x + choose(-1, 1)*25;
				sy = player.y + choose(-1, 1)*25;
				instance_create_layer(sx, sy, "Instances", o_soul);
			}
			player.soul = 0;
		}
		with (player) { // move home
			x = spawnx;
			y = spawny;
			hp = MAXHP;
		}
		// reborn
		/*
		// solution 1:
		instance_deactivate_object(player);
		var re = instance_create_layer(0,0,"Instances", o_reborn);
		re.alarm[0] = 6 * room_speed;
		re.dead = player;
		*/
		
		var re = instance_create_layer(0,0,"Instances", o_reborn);
		re.alarm[0] = 6 * room_speed;
		re.dead = player;
		with (player) {
			visible = false;
			self.dead = true;
		}
	break;
	
	
	case MESSAGE_SCORE:
		var
		clientSocket = buffer_read(buffer, buffer_u16),
		team = buffer_read(buffer, buffer_u16),
		point = buffer_read(buffer, buffer_u16),
		player = client_get_player(clientSocket);
		player.soul = 0;
		
		
		with (o_base) {
			if (team == self.team) {
				self.soul = point;
			}
		}
	break;
	
	/*
	case MESSAGE_BASEHP:
		var 
		team = buffer_read(buffer, buffer_u16), 
		hp = buffer_read(buffer, buffer_u16);
		
		with (o_base) {
			if (self.team == team) {
				self.hp = hp;
			}
		}
	break;
	*/
	case MESSAGE_LOOT:
		var team = buffer_read(buffer, buffer_u16),
			xx = buffer_read(buffer, buffer_u16),
			yy = buffer_read(buffer, buffer_u16);
		with (o_base) {
			if (team == self.team) {
				self.soul--;
				instance_create_layer(xx, yy, "Instances", o_soul);
			}
		}
	break;
	
	case MESSAGE_STARTGAME:
		with (o_mask) instance_destroy();
		instance_create_layer(0,0, "Instances", o_timer);
	break;
}