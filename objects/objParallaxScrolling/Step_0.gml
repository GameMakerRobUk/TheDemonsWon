if (!enabled) exit;

#region Update Parrallax

var _cam_x = camera_get_view_x(view_camera[0]);

for (var i = 0; i < array_length(bg_data); i ++){
	var _bg_data = bg_data[i];
	var _bg_id = bg_data[i].lay_id;
	var _new_bg_x = lerp(0, _cam_x , _bg_data.perc);//lerp(0, parallax_timer , _bg_data.perc);
	layer_x(_bg_id, _new_bg_x );
}

#endregion

//parallax_timer += 0.1;