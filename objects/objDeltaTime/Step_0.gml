if (keyboard_check_pressed(vk_right)){
	with global.delta{
		frame_speeds_index = clamp(frame_speeds_index + 1, 0, 4);	
		target_frame_speed = frame_speeds[frame_speeds_index];
	}
}
if (keyboard_check_pressed(vk_left)){
	with global.delta{
		frame_speeds_index = clamp(frame_speeds_index - 1, 0, 4);		
		target_frame_speed = frame_speeds[frame_speeds_index];
	}
}

global.delta.actual = delta_time/1000000;
global.delta.target = 1/global.delta.target_frame_speed;
global.delta.multiplier = global.delta.actual/global.delta.target;