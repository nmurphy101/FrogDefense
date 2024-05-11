// Keybinding tower buy actions
buyActions = ["buyTowerOne", "buyTowerTwo","buyTowerThree","buyTowerFour","buyTowerFive"]

// Tower shop sprite size
var _shopHudHeight = sprite_get_height(sTowerShopHud);
var _shopHudWidth = sprite_get_width(sTowerShopHud);

// Tower shop screen position
shopHotBarPositionTopLeft = [(room_width / 2) - (_shopHudWidth / 2), room_height - _shopHudHeight];

/// Setup player HUD UI
// Tower selection shop (add to this list as more towers are created)
towerOptions = [oTowersBasic];
towerUX = [];
for (var i = 0; i < array_length(towerOptions); ++i) {
	// Figure out the location of the towers to sell relative to the 
	//  tower shop sprite and number of towers with space between
	var _x = shopHotBarPositionTopLeft[0] - (_shopHudWidth / 2) + ((i * 64) + 21);
	var _y = shopHotBarPositionTopLeft[1] + (_shopHudHeight / 2);
	
	// Create the tower buy option and store it
	array_insert(towerUX, i, instance_create_layer(_x, _y - 45, "Instances", towerOptions[i], {
		depth:	objectDepths.player,
		parentPlayer: other,  // oPlayer
		towerId: i, // Maps to the number hotbar for quick buying
	}));
}
