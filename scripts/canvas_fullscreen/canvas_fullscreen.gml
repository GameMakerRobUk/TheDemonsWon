function canvas_fullscreen(_base){
	view_wport[0] = browser_width;
	view_hport[0] = browser_height;
	window_set_size(browser_width, browser_height);
	window_center();
	
	var _aspect = (browser_width / browser_height);
	var _vw = _base * _aspect;
	var _vh = _base;
	
	if (_aspect >= 1){
	    _vw = _base;
	    _vh = _base / _aspect;
	}

	//var _aspect = (browser_width / browser_height);
	//if (_aspect < 1){
	//    var _vw = _base * _aspect;
	//    var _vh = _base;
	//}else{
	//    _vw = _base;
	//    _vh = _base / _aspect;
	//}

	camera_set_view_size(view_camera[0], _vw, _vh);
	surface_resize(application_surface, view_wport[0], view_hport[0]);
}