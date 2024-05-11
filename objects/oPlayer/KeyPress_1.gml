// Only should check these if the game has started
var _isGameActive = parentRoom.gameState == gameResolveState.active

if (_isGameActive) {
	// This is the action triggered from the key that was pressed
	var _keyAction = get_key_action()
	
	show_debug_message($"key clicked: {keyboard_key} \naction: {_keyAction}\n")
	
	/// Tower hotkey buying:
	// check first that a tower buy action has been triggered
	var _towerBuyIdxAndAction = towerActionStruct[$ _keyAction]
	
	if (_towerBuyIdxAndAction != undefined) {	
		
		// The index starts at 0 not 1, so -1 to convert it to the array index
		var _towerBuyIdx = _towerBuyIdxAndAction[0] - 1
		
		// Check if you can afford to buy a tower from a hotbar number action
		if (coins >= towerUX[_towerBuyIdx].cost) {
			
			// Create a tower from the tower object stored as the action
			var _newTower = create_and_hold_tower(self, _towerBuyIdxAndAction[1])
			
			// Clicking a tower buy hotbar key when holding any other tower
			if (towerTypeHeld != noone and coins >= _newTower.cost) {
				coins += towerTypeHeld.cost
				instance_destroy(towerTypeHeld)
				towerTypeHeld = _newTower
				towerHeldId = _towerBuyIdx
			
			// Clicking a tower buy hotbar key when not holding any other tower
			} else if (towerTypeHeld == noone and coins >= _newTower.cost) {
				towerTypeHeld = _newTower
				towerHeldId = _towerBuyIdx
			}
		}
	
	// timeScale modifications 
	} else if (array_contains(["timeSpeedUp", "timeSpeedDown"], _keyAction)) {
		
		if (_keyAction == "timeSpeedUp") timeScale += .5
		
		if (_keyAction == "timeSpeedDown") timeScale -= .5
		
	}
}

