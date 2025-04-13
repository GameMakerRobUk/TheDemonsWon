//Sprites
var _state_sprites = struct_get(sprites, state);

if (sprite_index != _state_sprites.body){
	sprite_index = _state_sprites.body;
	image_speed = _state_sprites.image_speed;
}

if (hand_item.name != undefined && hand_item.sprite != struct_get(_state_sprites.hand_items, hand_item.name)){
	hand_item.sprite = struct_get(_state_sprites.hand_items, hand_item.name);
}

image_speed = (global.delta.multiplier * _state_sprites.image_speed);