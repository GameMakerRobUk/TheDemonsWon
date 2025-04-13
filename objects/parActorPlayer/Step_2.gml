event_inherited();

if (hand_item.name != undefined && hand_item.sprite != struct_get(state_sprites.hand_items, hand_item.name)){
	hand_item.sprite = struct_get(state_sprites.hand_items, hand_item.name);
}