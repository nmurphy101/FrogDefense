/// @description Insert description here
var _hasActiveLevelSpawner = currentSpawner != -4;
var _isGameActive = parentRoom.gameState == gameResolveState.active;
var _hasMoreLevels = parentRoom.level < array_length(parentRoom.levels) - 1;

// Handle a active level of multiple waves of enemies 
//  (1 spawner = multiple waves of potentially multiple groups in a wave)
if (_isGameActive and _hasActiveLevelSpawner) {
	// No more enemies across all the waves, so start up a new level
	if (countAlive <= 0 and _hasMoreLevels) {
		show_debug_message("level is finished")
		parentRoom.level++;
		parentRoom.levels[parentRoom.level].isStarted = true;
		instance_destroy();
	}

// Handle creating a new spawner of enemies
} else if (_isGameActive and not _hasActiveLevelSpawner and isStarted) {
	show_debug_message("Creating new enemy spawner")
	for (var _waveIndex = 0; _waveIndex < array_length(enemyCounts); ++_waveIndex) {
		show_debug_message($"{_waveIndex}/{array_length(enemyCounts)}\n{enemyCounts}\n{enemyTypes}")
		for (var _groupIndex = 0; _groupIndex < array_length(enemyCounts[_waveIndex]); ++_groupIndex) {
			// Gather the enemy wave counts
			countAlive += enemyCounts[_waveIndex][_groupIndex];
			totalEnemies += enemyCounts[_waveIndex][_groupIndex];
		
			// Start the new spawner
			currentSpawner = instance_create_layer(0, 0, "Instances", oSpawner, {
				depth:	objectDepths.controller,
				parentLevel: other,
				enemyType: enemyTypes[_waveIndex][_groupIndex],
				enemyCount: enemyCounts[_waveIndex][_groupIndex],
				path: pDefault,
			});
		}
	}
	wave++
}