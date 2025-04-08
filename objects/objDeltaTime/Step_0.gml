if (keyboard_check_pressed(vk_right)){
	global.delta.target_frame_speed += 10;	
}
if (keyboard_check_pressed(vk_left)){
	global.delta.target_frame_speed -= 10;	
}

global.delta.actual = delta_time/1000000;
global.delta.target = 1/global.delta.target_frame_speed;
global.delta.multiplier = global.delta.actual/global.delta.target;