// This is the action triggered from the key that was pressed
var _keyAction = get_key_action()

show_debug_message($"key clicked: {keyboard_key} \naction: {_keyAction}\n")

if (_keyAction == "pause") {
	if (isUnpaused) {
		var _surfaceAndMenuitems = pause_game(parentGame.music, "Paused", pauseSurface, true, true)
		pauseSurface = _surfaceAndMenuitems[0]
		pausedMenuObjs = _surfaceAndMenuitems[1]
		
	} else {
		unpause_game(parentGame.music, pauseSurface, pausedMenuObjs);
	}
	
	// Flip the isUnpaused boolean
	isUnpaused = not isUnpaused;
}