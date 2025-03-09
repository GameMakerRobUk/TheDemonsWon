function Weight(_max, _current) constructor{
	maximum = _max;
	current = _current;
	update_remaining();
	
	static update_remaining = function(){
		show_debug_message("Weight update_remaining")
		remaining = maximum - current;
	}
}