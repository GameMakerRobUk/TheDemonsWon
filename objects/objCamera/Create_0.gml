#macro CAM_W camera_get_view_width(view_camera[0])
#macro CAM_H camera_get_view_height(view_camera[0])
#macro CAM_SPEED 8
cx = 0;
cy = 0;

initialised = false;
follow = noone;
follow_index = 0;
actors = [];
with parActor array_push(other.actors, id);