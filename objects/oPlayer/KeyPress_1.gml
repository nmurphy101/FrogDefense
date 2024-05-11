// Only should check these if the game has started
var _isGameActive = parentRoom.gameState == gameResolveState.active

if (_isGameActive) {
	var _keyAction = keybindings[$ $"{keyboard_lastchar}"]
	show_debug_message($"key clicked: {keyboard_lastchar}\naction: {_keyAction}\n")
	
	// Tower hotkey buying:
	if (array_contains(buyActions, _keyAction)) {
		for (var _towerIdx = 0; _towerIdx <= array_length(towerOptions) - 1; ++_towerIdx) {		
			// Check for one of the number hotbar tower buy key presses (and if you can afford it)
		    if (coins >= towerOptions[_towerIdx].cost) {
				var _newTower = create_and_hold_tower(self, towerOptions[_towerIdx])
			
				// Clicking a tower buy hotbar key when holding any other tower
				if (towerTypeHeld != noone and coins >= _newTower.cost) {
					coins += towerTypeHeld.cost
					instance_destroy(towerTypeHeld)
					towerTypeHeld = _newTower
					towerHeldId = _towerIdx
			
				// Clicking a tower buy hotbar key when not holding any other tower
				} else if (towerTypeHeld == noone and coins >= _newTower.cost) {
					towerTypeHeld = _newTower
					towerHeldId = _towerIdx
				}
			}
		}
	
	// timeScale modifications 
	} else if (array_contains(["timeSpeedUp", "timeSpeedDown"], _keyAction)) {
		if (_keyAction == "timeSpeedUp") timeScale += .5
		if (_keyAction == "timeSpeedDown") timeScale -= .5
	
	// pause/unpause the game
	} else if (_keyAction == "pause") {
		if (parentRoom.isUnpaused) {
			show_debug_message($"Will pause the game here")	
		} else {
			show_debug_message($"Will unpause the game here")
		}
	}
}

