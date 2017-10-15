/// @description score
if (other.soul <= 0) exit;
if (team != other.team) exit;
// two steps
soul += other.soul;
//hp += other.soul * 10;
client_send_score(team, other.soul);
other.soul = 0;


