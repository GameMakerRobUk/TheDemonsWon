function HarvestResource(_worker = noone, _target) constructor{
	worker = _worker;
	target = _target;
	type = "HARVEST";
	state = "INACTIVE";
	timer = 0;
	target.job = self;
	x = target.x;
	y = target.y;
	
	static arrived = function(){
		worker.state = "use";
		worker.hand_item.name = target.tool_name;
	}
	
	static cancel_job = function(){
		worker.job_was_cancelled();
		worker.hand_item.name = undefined;
		worker = noone;
		array_push(global.jobs_no_worker.HARVEST, self);
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
				show_debug_message("harvesting resource");
				timer = 0;
				
				target.i_was_damaged();
			}
		}
	}
}

function HaulItem(_worker, _item_container, _item_struct, _storage) constructor{
	show_debug_message("HaulItem");
	show_debug_message("HaulItem _item_container: " + string(_item_container))
	show_debug_message("HaulItem object: " + object_get_name(_item_container.object_index))
	show_debug_message("HaulItem _item_struct: " + string(_item_struct))
	
	show_debug_message("HaulItem _storage: " + string(_storage))
	worker = _worker;
	item_container = _item_container;
	item_struct = _item_struct;
	item_name = item_struct.name;//struct_get_names(item_struct)[0];
	storage = _storage;
	x = _item_container.x;
	y = _item_container.y;
	
	state = "INACTIVE";
	type = "HAUL_ITEM";
	
	static arrived = function(){
		show_debug_message("HAUL_ITEM arrived");
		worker.state = "use";
	}
	
	static cancel_job = function(){
		show_debug_message("cancel_job for HaulItem")
		switch state{
			case "INACTIVE" :
				show_debug_message("cancelled on INACTIVE state")
				array_push(global.jobs_no_worker.HAUL_ITEM, self);
				break;
			case "GO_TO_STORE" :
				show_debug_message("cancelled on GO_TO_STORE state")
				switch item_name{
					case "LOGS":
					if (worker.target == noone){
						show_debug_message("GO_TO_STORE cancelled. Worker target is noone");
					}
					if (!instance_exists(worker.target)){
						show_debug_message("GO_TO_STORE cancelled. Worker target does not exist");	
					}
					var _resource = instance_create_layer(worker.target.x, worker.target.y, "Resource", objLog);
					break;
				}
				
				//Make sure the resource has the same item_struct
				struct_set(_resource.inventory, item_name, item_struct);
				remove_item(worker, item_struct);
				storage.job_was_cancelled(item_struct);
				
				show_debug_message("_resource.inventory: " + string(_resource.inventory))
				show_debug_message("HAUL_ITEM job cancelled whilst hauling. Creating new resource: " + string(_resource.inventory));
				break;
			default :
				show_debug_message("cancelled on default")
				show_debug_message("HAUL ITEM cancelled, state: " + state + ". Doing nothing.");
				break;
		}
		//Is a store expecting this job?
		//storage.job_was_cancelled(item_struct);
		worker.job_was_cancelled();
		worker = noone;
	}
	
	static initialise = function(){
		show_debug_message("HaulItem initialise")
		move_to_pos(item_container.cell_x, item_container.cell_y, worker);
	}
	
	static step = function(){
		switch state{
			case "INACTIVE":
				if (point_distance(worker.cell_x, worker.cell_y, item_container.cell_x, item_container.cell_y) == 0){
					pickup(item_struct, item_container, worker);
					show_debug_message("HaulItem storage object: " + object_get_name(storage.object_index));
					move_to_pos(storage.cell_x, storage.cell_y, worker);
					state = "GO_TO_STORE";	
				}
				break;
			case "GO_TO_STORE":
				if (point_distance(worker.cell_x, worker.cell_y, storage.cell_x, storage.cell_y) == 0){
					pickup(item_struct, worker, storage)
					job_finished(worker);
					state = "JOB_FINISHED";
				}
				break;
				
		}
	}
}

function Farm(_deliver_to, _required_resources) constructor{
	deliver_to = _deliver_to;
	required_resources = _required_resources;
	state = FARM_PLOT_STATE.plant;
	
	enum FARM_PLOT_STATE {
		plant,
		grow, //wait for plant to be fully grown
		harvest,
	}
	
	static update = function(){
		switch state{
			case FARM_PLOT_STATE.plant : {
				//Create HAUL_ITEM job - take a seed to the farm plot
			}; break;
			case FARM_PLOT_STATE.grow : {
				//Just check if the plant is ready to harvest
			}; break;
			case FARM_PLOT_STATE.harvest : {
				//Create harvest job
			}
		}
	}

}

function DeliverResources(_deliver_to, _required_resources) constructor{
	show_debug_message("DeliverResources")
	deliver_to = _deliver_to;
	required_resources = _required_resources;
	inventory = deliver_to.inventory;
	
	show_debug_message("required_resources: " + string(required_resources))
	
	static update = function(){
		show_debug_message("DeliverResources update")
		var _item_names = struct_get_names(required_resources);
		for (var i = 0; i < array_length(_item_names); i ++){
			var _item_name = _item_names[i];
			var _item_struct = struct_get(required_resources, _item_name);
			var _quantity_wanted = _item_struct.wanted;
			var _expected = _item_struct.expected;
			var _weight_per_unit = get_weight(_item_name);
			var _max_items_based_on_weight = floor(deliver_to.weight.remaining / _weight_per_unit);
			var _quantity_diff = min(_max_items_based_on_weight, (_quantity_wanted -_expected));
			
			show_debug_message("wanted item : " + _item_name);
			show_debug_message("wanted _item_struct : " + string(_item_struct));
			show_debug_message("wanted _quantity : " + string(_quantity_wanted));
			show_debug_message("wanted _expected : " + string(_expected));
			show_debug_message("wanted _diff : " + string(_quantity_diff));
			show_debug_message("_weight_per_unit : " + string(_weight_per_unit));
			show_debug_message("weight: " + string(deliver_to.weight));
			
			if (_quantity_diff == 0){
				continue;	
			}
			var _haul_quantity_wanted = min(5, _quantity_diff);
			var _available_stores = [];
			
			//Find a store with the wanted resource
			with parStorage{
				
				if (id == other.deliver_to){
					continue;	
				}
				var _store_item_struct = struct_get(inventory, _item_name)
				if (_store_item_struct != undefined && _store_item_struct.quantity > 0){
					get_distance(other.deliver_to);
					array_push(_available_stores, id);	
				}
			}
			
			with parItem{
				if (claimed){
					continue;
				}
				
				var _store_item_struct = struct_get(inventory, _item_name)
				if (_store_item_struct != undefined && _store_item_struct.quantity > 0){
					get_distance(other.deliver_to);
					array_push(_available_stores, id);	
				}	
			}
			
			if (array_length(_available_stores) == 0){
				show_debug_message("DeliverResources no available stores")
				exit;	
			}
			//Get closest store to place that wants the item
			array_sort(_available_stores, sort_by_distance);
			
			var _storage = array_shift(_available_stores);
			show_debug_message("_storage: " + string(_storage));
			
			if (object_get_parent(_storage.object_index) == parItem){
				show_debug_message("parent is parItem");
				_storage.claimed = true;
			}
			
			_store_item_struct = struct_get(_storage.inventory, _item_name)
			
			var _item_quantity = min(_store_item_struct.quantity, _haul_quantity_wanted);
			var _haul_item_struct = new Item(_item_name, _item_quantity);
			
			_item_struct.expected += _item_quantity;
			deliver_to.weight.current += (_item_quantity * _weight_per_unit);
			deliver_to.weight.update_remaining();
			show_debug_message("Updating deliver_to.weight | Adding " + string(_item_quantity) + " " + _item_name + " with a unit weight of " + string(_weight_per_unit) + ", for a total of " + string(_item_quantity * _weight_per_unit) + " weight.")
			
			show_debug_message("Job created to haul to building | _item_struct: " + string(_item_struct) + " | haul_item_struct: " + string(_haul_item_struct))
				
			array_push(global.jobs_no_worker.HAUL_ITEM, new HaulItem(,_storage, _haul_item_struct, deliver_to));	
		}
	}
}

function Build(_worker, _building) constructor{
	worker = _worker;
	building = _building;
	type = "BUILD";
	state = "INACTIVE";
	timer = 0;

	x = building.x;
	y = building.y;
	
	static cancel_job = function(){
		show_debug_message("cancel_job for Build");
		worker.job_was_cancelled();
		worker = noone;
		state = "INACTIVE";
		array_push(global.jobs_no_worker.BUILD, self);
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
					show_debug_message("Building complete")
					state = "JOB_FINISHED";
					building.building_finished();
					job_finished(worker);
					exit;
				}
				
				timer ++;
				if (timer < room_speed)
					exit;
	
				building.hp ++;
				show_debug_message("building");
				timer = 0;
				
				if (building.hp < building.hp_max)
					exit;
				
				show_debug_message("Building complete")
				state = "JOB_FINISHED";
				building.building_finished();
				job_finished(worker);
			}
		}
	}
}

function BuildManager(_building) constructor{
	jobs = [];
	max_jobs = 2;
	building = _building;
	type = "BUILD_MANAGER";
	
	static update = function(){
		//If < 2 workers, give them a build task
		
		if (array_length(jobs) < max_jobs){
			var _job = new Build(,building);
			array_push(global.jobs_no_worker.BUILD, _job);
			array_push(jobs, _job);
		}
	}
}