//
#macro GAMEPAD_MAGNITUDE 0.3

// team
#macro T_RED 0
#macro T_YELLOW 1
#macro T_BLUE 2

// event
#macro MESSAGE_GETID 0
#macro MESSAGE_MOVE 1
#macro MESSAGE_LEAVE 2
#macro MESSAGE_JOIN 3
#macro MESSAGE_SHOOT 4
#macro MESSAGE_HIT 5
#macro MESSAGE_READY 6
#macro MESSAGE_SPAWN 7
#macro MESSAGE_PICK 8
#macro MESSAGE_DIE 9
#macro MESSAGE_LOOT 10
#macro MESSAGE_SCORE 11
#macro MESSAGE_BASEHP 12
#macro MESSAGE_STARTGAME 13
#macro MESSAGE_ENDGAME 14
#macro MESSAGE_BOMB 15
#macro MESSAGE_KILL 16
#macro MESSAGE_DECREASE 17



// shoot settings
#macro BULLET_RANGE 256
#macro AMMOPERSHOOT 4
#macro SHOOT_COOLING room_speed
#macro BULLET_SPEED 22

#macro BOMB_RADIUS 64

// player attribute
#macro MAXHP 6
#macro PLAYER_SPD 5
#macro CARRY_SPD 4
#macro REBORN_TIME 6

//
#macro BASE_LOOT_RANGE 100


// collision 
#macro MOVE_GAP 0

enum heroes {
	square = 0,
	rectangle = 1,
}