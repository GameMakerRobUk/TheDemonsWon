parallax_timer = 0;
enabled = true;

var _fastest_speed = 2;

bg_data = [
	{lay_id : layer_get_id("Background_0"), perc : _fastest_speed},
	{lay_id : layer_get_id("Background_1"), perc : _fastest_speed / 25},
	{lay_id : layer_get_id("Background_2"), perc : _fastest_speed / 50},
	{lay_id : layer_get_id("Background_3"), perc : _fastest_speed / 100},
	];
	
bg_data_default = []
array_copy(bg_data_default, 0, bg_data, 0, array_length(bg_data));