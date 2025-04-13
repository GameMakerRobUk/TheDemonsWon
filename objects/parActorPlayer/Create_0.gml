event_inherited();

race = irandom(4);
sex = choose("male", "female");
hand_item = {name : undefined, sprite : -1};

sprites = new ActorSprites(sex, race);