// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function add_message(_string){
	show_debug_message(_string);
	with (objMessages){
		array_push(messages, {text : _string, timer : 60});
	}
}