function create_sprite(_spritesheet, _hframes, _vframes, _frame_w, _frame_h, _start_y_frame = 0, _wanted_frames = -1, _x_origin = 0, _y_origin = 0, _start_x_frame = 0){
	var _w = _hframes * _frame_w;
	var _h = _vframes * _frame_h;
	if (_wanted_frames == -1){
		var _total_frames = _hframes * _vframes;
	}else{
		_total_frames = _wanted_frames;	
	}
	
	var _surf = surface_create(_w, _h);
	
	surface_set_target(_surf);
	draw_clear_alpha(c_black, 0);
	draw_sprite(_spritesheet, 0, 0, 0);
	
	var _spr = sprite_create_from_surface(_surf, _start_x_frame * _frame_w, _start_y_frame * _frame_h, _frame_w, _frame_h, false, false, _x_origin, _y_origin);
	
	var _x = _frame_w * (_start_x_frame + 1); 
	var _y = (_start_y_frame * _frame_h);
	for (var i = 1; i < _total_frames; i ++){
		if (_x >= _w){
			_x = 0;
			_y += _frame_h;
		}
		
		sprite_add_from_surface(_spr, _surf, _x, _y, _frame_w, _frame_h, false, false);
		_x += _frame_w;
	}
	
	surface_reset_target();
	
	surface_free(_surf);
	
	return _spr;
}