function Weight(_max, _current) constructor{
	maximum = _max;
	current = _current;
	update_remaining();
	
	static update_remaining = function(){
		remaining = maximum - current;
	}
}