function Job() constructor{
	priority = 0;	
	
	static create_job_for_resource = function(_deliver_to, _item_struct, _item_name){
		var _quantity_wanted = _item_struct.wanted;
		var _expected = _item_struct.expected;
		var _weight_per_unit = get_weight(_item_name);
		var _max_items_based_on_weight = floor(_deliver_to.weight.remaining / _weight_per_unit);
		var _quantity_diff = min(_max_items_based_on_weight, (_quantity_wanted -_expected));
			
		if (_quantity_diff == 0){
			return;	
		}
		var _haul_quantity_wanted = min(5, _quantity_diff);
			
		var _storage = get_closest_storage(_item_name, _deliver_to);
			
		if (_storage == noone){
			return;	
		}
			
		var _store_item_struct = struct_get(_storage.inventory, _item_name)
			
		var _item_quantity = min(_store_item_struct.quantity, _haul_quantity_wanted);
		var _haul_item_struct = new Item(_item_name, _item_quantity);
			
		_item_struct.expected += _item_quantity;
		_deliver_to.weight.current += (_item_quantity * _weight_per_unit);
		_deliver_to.weight.update_remaining();
	
		show_debug_message("create_job_for_resource _storage: " + string(_storage) + " | " + object_get_name(_storage.object_index));
	
		var _job = new HaulItem(,_storage, _haul_item_struct, _deliver_to);
				
		//array_push(global.jobs_no_worker.HAUL_ITEM, _job);	
		add_job(global.jobs_no_worker.HAUL_ITEM, _job, priority);
		return _job;
	}
}

function HarvestResource(_worker = noone, _target, _priority = 0) : Job() constructor{
	worker = _worker;
	target = _target;
	type = "HARVEST";
	state = "INACTIVE";
	timer = 0;
	target.job = self;
	x = target.x;
	y = target.y;
	priority = _priority;
	
	static arrived = function(){
		worker.state = "use";
		worker.hand_item.name = target.tool_name;
	}
	
	static cancel_job = function(){
		worker.job_was_cancelled();
		worker.hand_item.name = undefined;
		worker = noone;
		//array_push(global.jobs_no_worker.HARVEST, self);
		add_job(global.jobs_no_worker.HARVEST, self, priority);
		state = "INACTIVE";
	}
	
	static initialise = function(){
		move_to_pos(target.cell_x, target.cell_y, worker);	
	}
	
	static step = function(){
		switch state{
			case "INACTIVE":
				if (point_distance(worker.cell_x, worker.cell_y, target.cell_x, target.cell_y) == 0){
					state = "HARVEST";	
				}
				break;
			case "HARVEST":{
				timer ++;
				if (timer < room_speed)
					exit;
	
				target.hp --;
				timer = 0;
				
				target.i_was_damaged();
			}
		}
	}
}

function HaulItem(_worker, _item_container, _item_struct, _deliver_to, _priority = 0) : Job() constructor{
	show_debug_message("HaulItem");
	worker = _worker;
	item_container = _item_container;
	item_struct = _item_struct;
	item_name = item_struct.name;
	deliver_to = _deliver_to;
	x = _item_container.x;
	y = _item_container.y;
	priority = _priority;
	
	state = "INACTIVE";
	type = "HAUL_ITEM";
	
	static arrived = function(){
		worker.state = "use";
	}
	
	static cancel_job = function(){
		switch state{
			case "INACTIVE" :
				//array_push(global.jobs_no_worker.HAUL_ITEM, self);
				add_job(global.jobs_no_worker.HAUL_ITEM, self, priority);
				break;
			case "GO_TO_STORE" :
				switch item_name{
					case "LOGS":
						var _resource = instance_create_layer(worker.target.x, worker.target.y, "Resource", objLog);
						break;
					case "STONE":
						_resource = instance_create_layer(worker.target.x, worker.target.y, "Resource", objStone);
						break;
					case "SEED":
						_resource = instance_create_layer(worker.target.x, worker.target.y, "Resource", objSeed);
						break;
				}
				
				//Make sure the resource has the same item_struct
				struct_set(_resource.inventory, item_name, item_struct);
				remove_item(worker, item_struct);
				deliver_to.job_was_cancelled(item_struct);
				
				break;
			default :
				break;
		}
		worker.job_was_cancelled();
		worker = noone;
	}
	
	static initialise = function(){
		show_debug_message("item_container: " + string(item_container) );
		show_debug_message(string(item_container) + " exists: " + string(instance_exists(item_container)))
		move_to_pos(item_container.cell_x, item_container.cell_y, worker);
	}
	
	static step = function(){
		switch state{
			case "INACTIVE":
				if (point_distance(worker.cell_x, worker.cell_y, item_container.cell_x, item_container.cell_y) == 0){
					exchange_item(item_struct, item_container, worker);
					move_to_pos(deliver_to.cell_x, deliver_to.cell_y, worker);
					state = "GO_TO_STORE";	
				}
				break;
			case "GO_TO_STORE":
				if (point_distance(worker.cell_x, worker.cell_y, deliver_to.cell_x, deliver_to.cell_y) == 0){
					exchange_item(item_struct, worker, deliver_to);
					job_finished(worker);
					state = "JOB_FINISHED";
				}
				break;
				
		}
	}
}

function Farm(_deliver_to, _required_resources, _priority = 0) : Job() constructor{
	deliver_to = _deliver_to;
	required_resources = _required_resources; 
	state = FARM_PLOT_STATE.plant;
	job = undefined;
	plant = noone;
	priority = _priority;
	
	enum FARM_PLOT_STATE {
		plant,
		grow, //wait for plant to be fully grown
		harvest,
	}
	
	static cancel_job = function(){
		switch state{
			case FARM_PLOT_STATE.plant : {
				//Taken care of by HaulItem cancellation
			}; break
			case FARM_PLOT_STATE.grow : {
				//No workers will be assigned at this point
			}; break;
			case FARM_PLOT_STATE.harvest : {
				//Taken care of by HarvestResource cancellation
			}; break;
		}
	}
	
	static update = function(){
		switch state{
			case FARM_PLOT_STATE.plant : {
				show_debug_message("FARM_PLOT_STATE.plant")
				//Create HAUL_ITEM job - take a seed to the farm plot
				if (job == undefined){
					show_debug_message("Farm job is undefined for planting")
					var _item_name = struct_get_names(required_resources)[0];
					var _item_struct = struct_get(required_resources, _item_name); 
					job = create_job_for_resource(deliver_to, _item_struct, _item_name, priority);
				}else{
					var _quantity = struct_get(deliver_to.inventory.SEED, "quantity");
				}
			}; break;
			case FARM_PLOT_STATE.grow : {
				show_debug_message("FARM_PLOT_STATE.grow")
				//Just check if the plant is ready to harvest
				if (plant.growth_stage == plant.max_growth_stage){
					state = FARM_PLOT_STATE.harvest;
				}
			}; break;
			case FARM_PLOT_STATE.harvest : {
				show_debug_message("FARM_PLOT_STATE.harvest")
				if (!instance_exists(plant)){
					job = undefined;
					plant = noone;
					state = FARM_PLOT_STATE.plant;
					required_resources = deliver_to.inventory;
				}
			}
		}
	}

}

function DeliverResources(_deliver_to, _required_resources, _priority = 0) : Job() constructor{
	deliver_to = _deliver_to;
	required_resources = _required_resources;
	inventory = deliver_to.inventory;
	priority = _priority;
	
	static update = function(){
		var _item_names = struct_get_names(required_resources);
		for (var i = 0; i < array_length(_item_names); i ++){
			var _item_name = _item_names[i];
			var _item_struct = struct_get(required_resources, _item_name);
			create_job_for_resource(deliver_to, _item_struct, _item_name, priority);
		}
	}
}

function Build(_worker, _building, _priority = 1) : Job() constructor{
	worker = _worker;
	building = _building;
	type = "BUILD";
	state = "INACTIVE";
	timer = 0;
	priority = _priority;

	x = building.x;
	y = building.y;
	
	static cancel_job = function(){
		worker.job_was_cancelled();
		worker = noone;
		state = "INACTIVE";
		//array_push(global.jobs_no_worker.BUILD, self);
		add_job(global.jobs_no_worker.BUILD, self, priority);
	}
	
	static initialise = function(){
		move_to_pos(building.cell_x, building.cell_y, worker);	
	}
	
	static arrived = function(){
		worker.state = "use";	
	}
	
	static step = function(){
		switch state{
			case "INACTIVE":
				if (point_distance(worker.cell_x, worker.cell_y, building.cell_x, building.cell_y) == 0){
					state = "BUILD";	
				}
				break;
			case "BUILD":{
				
				if (building.hp >= building.hp_max){
					state = "JOB_FINISHED";
					building.building_finished();
					job_finished(worker);
					exit;
				}
				
				timer ++;
				if (timer < room_speed)
					exit;
	
				building.hp ++;
				timer = 0;
				
				if (building.hp < building.hp_max)
					exit;
				
				state = "JOB_FINISHED";
				building.building_finished();
				job_finished(worker);
			}
		}
	}
}

function BuildManager(_building, _priority = 1) : Job () constructor{
	jobs = [];
	max_jobs = 2;
	building = _building;
	type = "BUILD_MANAGER";
	priority = _priority;
	
	static update = function(){
		//If < 2 workers, give them a build task
		
		if (array_length(jobs) < max_jobs){
			var _job = new Build(,building, priority);
			add_job(global.jobs_no_worker.BUILD, _job, priority);
			array_push(jobs, _job);
		}
	}
}

function add_job(_array, _job, _priority = 0){
	array_push(_array, _job);	
	array_sort(_array, sort_by_priority);
}