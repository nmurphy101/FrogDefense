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


/// Setup all the levels from the levels.json file (in FrogDefense/datafiles)
// Example result:
// var _levelEnemies = [
// 	 [[oFly], [oMosquito], [oFly, oMosquito], [oBeetle], [oFly, oMosquito, oBeetle], [oMillbug]],
//	 [[25], [20], [18, 10], [16], [8, 10, 10], [10]],
// ];
var _levelEnemies = json_parse(
	json_file_to_string("levels.json"), 
	function(key, value) { return convert_enemy_str_to_obj(key, value) }
)
show_debug_message($"levels: {_levelEnemies}\n\n")
 
levels = []
for (var _levelIndex = 0; _levelIndex < array_length(_levelEnemies); ++_levelIndex) {
	// Setting the last level as the boss level (this currently only controls the music that's played)
	// Should change to whatever scheme we want for how often boss levels happen
	var _isBossLevel = false;
	if (_levelIndex == array_length(_levelEnemies[0]) - 1) _isBossLevel = true
	
	var _enemyTypes = _levelEnemies[_levelIndex][0]
	var _enemyCounts = _levelEnemies[_levelIndex][1]
	
	// Create the levelController and store it away
	var _newLevel = instance_create_layer(0, 0, "Instances", oLevelController, {
		depth:	objectDepths.controller,
		parentRoom: other,  // oRoomController 
		enemyTypes: _levelEnemies[_levelIndex][0],
		enemyCounts: _levelEnemies[_levelIndex][1],
		isBossLevel: _isBossLevel,
		level: _levelIndex,
	})
	array_insert(levels, array_length(levels) - 1, _newLevel)
}
// Setup the first level as the current level
currentLevel = levels[0]


// Build Path restriction objects over the level path, then start the first level
pathBuilder = instance_create_layer(0, 0, "Instances", oPathBuilder, {
	depth: objectDepths.controller,
	parentRoom: other,  // oRoomController 
})
