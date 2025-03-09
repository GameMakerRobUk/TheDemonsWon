for (var i = array_length(messages) - 1; i >= 0; i --){
	messages[i].timer --;
	if (messages[i].timer == 0){
		array_pop(messages);	
	}
}