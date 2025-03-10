event_inherited();

hp = 50;

i_was_damaged = function(){
	if ((hp mod 5) == 0){
		var _stone = instance_create_layer(x, y, "Resource", objStone);
		with _stone{
			add_item(id, new Item("STONE", 5));	
		}
	}
	
	if (hp > 0){
		exit;	
	}
	
	die();
}

die = function(){
	instance_destroy();
	
	with job{
		state = "JOB_FINISHED";
		job_finished(worker);	
	}
}

required_item = "pickaxe";