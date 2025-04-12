var _cam_xspd = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * CAM_SPEED;
var _cam_yspd = (keyboard_check(ord("S")) - keyboard_check(ord("W"))) * CAM_SPEED;

if (follow != noone){
	cx = follow.x - (CAM_W / 2);
	cy = follow.y - (CAM_H / 2);
	
	if (_cam_xspd != 0 || _cam_yspd != 0){
		follow = noone;	
	}
	
}else{
	cx += _cam_xspd;
	cy += _cam_yspd;
}

if (keyboard_check_pressed(vk_backspace)){
	follow = actors[follow_index]; follow_index ++;
		
	show_debug_message("follow_index: " + string(follow_index) + " | actors: " + string(actors))
	
	if (follow_index >= array_length(actors)){
		follow_index = 0;
	}
}

cx = clamp(cx, 0, room_width - CAM_W);
cy = clamp(cy, 0, room_height - CAM_H);

camera_set_view_pos(view_camera[0], cx, cy);