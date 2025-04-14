if (!initialised){
	if (array_length(actors) == 0){
		exit;	
	}
	follow = actors[follow_index]; follow_index ++;
	
	if (follow_index >= array_length(actors)){
		follow_index = 0;
	}
	
	initialised = true;
}