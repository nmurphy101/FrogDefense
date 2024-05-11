// Only should start level once triggered to start
if (not isStarted) exit

var _hasActiveLevelSpawner = currentSpawner != noone;
var _isGameActive = parentRoom.gameState == gameResolveState.active;
var _hasMoreLevels = level < array_length(parentRoom.levels) - 1;

// Active level checker, awaits for when level is done
if (_isGameActive and _hasActiveLevelSpawner) {
	// No more enemies across all the waves, so start up a new level
	if (countAlive <= 0 and _hasMoreLevels) {
		show_debug_message("level is finished")
		// Set up the next level in the room and start it then destroy this level
		parentRoom.currentLevel = parentRoom.levels[level + 1]
		parentRoom.currentLevel.isStarted = true;
		instance_destroy();
	}

// Will only be run once after this level has been started
} else if (not _hasActiveLevelSpawner) {
	
	show_debug_message($"Level: {level}\n{enemyCounts}\n{enemyTypes}\nCreating new enemy spawner")
	
	for (var _waveIndex = 0; _waveIndex < array_length(enemyCounts); ++_waveIndex) {
		for (var _enemyIndex = 0; _enemyIndex < array_length(enemyCounts[_waveIndex]); ++_enemyIndex) {
			
			show_debug_message($"Wave {_waveIndex}/{array_length(enemyCounts) - 1 }: enemies: {enemyCounts[_waveIndex][_enemyIndex]} of {enemyTypes[_waveIndex][_enemyIndex]}")
			
			// Gather the enemy wave counts
			countAlive += enemyCounts[_waveIndex][_enemyIndex];
			totalEnemies += enemyCounts[_waveIndex][_enemyIndex];
		
			// Create a spanwer for a wave and store it away
			//  (1 spawner = 1 wave of potentially multiple groups of enemy units)
			var _newSpawner = instance_create_layer(0, 0, "Instances", oSpawner, {
				depth:	objectDepths.controller,
				parentLevel: other,
				enemyType: enemyTypes[_waveIndex][_enemyIndex],
				enemyCount: enemyCounts[_waveIndex][_enemyIndex],
				path: pDefault,
				wave: _waveIndex,
				isInAllWave: triggerAllWaves
			});
			array_insert(waveList, array_length(waveList), _newSpawner)
		}
	}

	if (not triggerAllWaves) {
		// Set the first wave of the level to current
		currentSpawner = waveList[0]
		
		// Kick off the first wave of the level
		currentSpawner.isStarted = true	
		
	} else {
		// Set the last wave of the level to current
		currentSpawner = waveList[array_length(waveList) - 1]
		
		// Kick off all the waves at the same time
		for (var i = 0; i < array_length(waveList); ++i) {
			waveList[i].isStarted = true
		}
	}
}