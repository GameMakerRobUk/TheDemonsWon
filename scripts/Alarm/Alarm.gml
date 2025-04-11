function Alarm(_alarm_time, _alarm_func, _owner, _loop = false) constructor{
	timer = 0;
	alarm_time = _alarm_time;
	alarm_func = _alarm_func;
	owner = _owner;
	loop = _loop;
	
	static step = function(){
		timer += global.delta.multiplier;
		
		if (timer >= alarm_time){
			alarm_func();	
			
			if (!loop){
				show_debug_message("alarm is not looping, deleting")
				var _pos = array_get_index(owner.alarms, self);
				array_delete(owner.alarms, _pos, 1);
			}
		}
	}	
}