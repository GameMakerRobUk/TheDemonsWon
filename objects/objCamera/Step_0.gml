var _cam_xspd = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * 4;
var _cam_yspd = (keyboard_check(ord("S")) - keyboard_check(ord("W"))) * 4;

cx += _cam_xspd;
cy += _cam_yspd;

cx = clamp(cx, 0, room_width - CAM_W);
cy = clamp(cy, 0, room_height - CAM_H);

camera_set_view_pos(view_camera[0], cx, cy);