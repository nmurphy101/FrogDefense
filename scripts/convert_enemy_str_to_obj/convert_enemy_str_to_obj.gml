function convert_enemy_str_to_obj(key, value) {
	var _enemyTypeStruct = enemyTypeStruct
	if (is_string(value)) {
		return _enemyTypeStruct[$ value]
	} 
	return value
}
