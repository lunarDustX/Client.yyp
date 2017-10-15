/// @description 
rank = array_create(3, noone);
var i = 0;
with (o_base) {
	other.rank[i] = self;
	i++;
}
//show_message(string(i));