// The count of time passed while in pause paused
global._pauseTime = 0
#macro pauseTime global._pauseTime

// The delta timer adjusted counter from the start of the room
global._deltaTimerRoom = 0
#macro deltaRoomTimer global._deltaTimerRoom


// Setup players
players = [instance_create_layer(room_width / 2, room_height / 2, "Instances", oPlayer, {
	depth: objectDepths.player,
	parentRoom: other
})]


/// Setup all the levels from the levels.json file
// Example:
// var _levelEnemies = [
// 	 [[oFly], [oMosquito], [oFly, oMosquito], [oBeetle], [oFly, oMosquito, oBeetle], [oMillbug]],
//	 [[25], [20], [18, 10], [16], [8, 10, 10], [10]],
// ];
var _levelEnemies = json_parse(
	json_file_to_string("levels.json"), 
	function(key, value) { return convert_enemy_str_to_obj(key, value) }
)
show_debug_message($"enemytype struct: {enemyTypeStruct}")
show_debug_message($"levels: {_levelEnemies}\n\n")
 
levels = []
for (var _levelIndex = 0; _levelIndex < array_length(_levelEnemies); ++_levelIndex) {
	// We want to set the last level as the boss level
	// Should change to whatever scheme we want for how often boss levels happen
	var _isBossLevel = false;
	if (_levelIndex == array_length(_levelEnemies[0]) - 1) _isBossLevel = true
	
	show_debug_message($"")
	
	// Create the levelController and store it away
	var _newLevel = instance_create_layer(0, 0, "Instances", oLevelController, {
		depth:	objectDepths.controller,
		parentRoom: other,  // oRoomController 
		enemyTypes: _levelEnemies[_levelIndex][0],
		enemyCounts: _levelEnemies[_levelIndex][1],
		isBossLevel: _isBossLevel,
	})
	array_insert(levels, _levelIndex, _newLevel)
}


// Build Path restriction objects over the level path
pathBuilder = instance_create_layer(0, 0, "Instances", oPathBuilder, {
	depth: objectDepths.controller,
	parentRoom: other,  // oRoomController 
})
