function get_key_action(){
	// This is the key that was pressed
	var _detectedKey = key_code_to_key_value(keyboard_key)
	
	// Get the action assigned from the keybindings for that key, case insensitive
	return keybindings[$ string_lower(_detectedKey)] ?? keybindings[$ string_upper(_detectedKey)]
}