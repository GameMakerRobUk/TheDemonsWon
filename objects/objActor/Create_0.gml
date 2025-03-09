event_inherited();

job = undefined;

path = [];
state = ACTOR_STATE.idle;

all_nodes = [];
with objNode{
	array_push(other.all_nodes, id);	
}

target = {x : x, y : y};

update_cell_coords();

allowed_jobs = ["HARVEST"];

function default_arrived(){
	show_debug_message("default arrived");
	state = ACTOR_STATE.working;
}
arrived = default_arrived;

