//show_debug_message("objAutoSize step start")
//if (browser_width != width || browser_height != height){
//    width = min(base_width, browser_width);
//    height = min(base_height, browser_height);
//    scale_canvas(base_width, base_height, width, height, true);
//}

if (browser_width != global.browser_w || browser_height != global.browser_h){
	//with obj_main gui_font_index = 0;
    global.browser_w = browser_width;
    global.browser_h = browser_height;
    canvas_fullscreen(base_size);
}
//show_debug_message("objAutoSize step end")