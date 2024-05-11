/// Setup player HUD UI
// First get the tower options and put in proper order
towerBuyActions = struct_get_names(towerActionStruct)

var _towerOptions = array_create(array_length(towerBuyActions))

show_debug_message($"TowerActions: {towerBuyActions}")

for (var i = 0; i < array_length(towerBuyActions); ++i) {
	var _towerIndexAndObj = towerActionStruct[$ towerBuyActions[i]]
	
	show_debug_message($"_towerIndexAndObj: {_towerIndexAndObj[0]} and {_towerIndexAndObj[1]}")
	
    _towerOptions[_towerIndexAndObj[0] - 1] = _towerIndexAndObj[1]
}

show_debug_message("") // Just a debug message spacer

// Tower shop sprite size
var _shopHudHeight = sprite_get_height(sTowerShopHud);
var _shopHudWidth = sprite_get_width(sTowerShopHud);

// Tower shop screen position
shopHotBarPositionTopLeft = [(room_width / 2) - (_shopHudWidth / 2), room_height - _shopHudHeight];

// Tower shop tower objects
towerUX = [];
for (var i = 0; i < array_length(_towerOptions); ++i) {
	
	// Figure out the location of the towers to sell relative to the 
	//  tower shop sprite and number of towers with space between
	var _x = shopHotBarPositionTopLeft[0] - (_shopHudWidth / 2) + ((i * 64) + 21);
	var _y = shopHotBarPositionTopLeft[1] + (_shopHudHeight / 2);
	
	// Create the tower buy option and store it
	array_insert(towerUX, i, instance_create_layer(_x, _y - 45, "Instances", _towerOptions[i], {
		depth:	objectDepths.player,
		parentPlayer: other,  // oPlayer
	}));
}
