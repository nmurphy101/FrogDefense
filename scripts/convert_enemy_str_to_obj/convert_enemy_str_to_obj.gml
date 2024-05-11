function convert_enemy_str_to_obj(key, value) {
	show_debug_message($"Key: {key}, Value: {value}")
	var _enemyTypeStruct = enemyTypeStruct
	if (is_string(value)) {
		show_debug_message($"returning obj: {_enemyTypeStruct[$ value]}")
		return _enemyTypeStruct[$ value]
	} else if (is_numeric(value)) {
		show_debug_message($"returning digit: {value}")
		return value
	}
	return value
}
