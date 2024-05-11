// Only should start spawning once triggered to start
if (not isStarted) exit

// Update the spawnTimer to the passing of time
if spawnTimer > 0 {
	spawnTimer -= delta * timeScale;
}

// Timer is up, now we can spawn the next enemy
if (spawnTimer <= 0) {
	// Spawner should destroy itself once it's spawned all it's allowed to
	if (currentSizeSpawned >= enemyCount) {
		show_debug_message("Spawner is finished")
		// Set up the next wave in the level and start it if waves are sequential
		if (not isInAllWave) {
			parentLevel.currentSpawner = parentLevel.waveList[wave + 1]
			parentLevel.currentSpawner.isStarted = true
		}
		instance_destroy()
	}
	
	// Spawn the enemy unit in the current wave
	if (currentSizeSpawned < enemyCount) {
		instance_create_layer(x, y, "Instances", enemyType, {
			depth:	objectDepths.enemies,
			parentSpawner: other,
			path: path,
		});
		currentSizeSpawned++;
		show_debug_message($"level {parentLevel.level}, wave {wave}, Spawning: {currentSizeSpawned}/{enemyCount} of {enemyType.name}")
	}
	
	// Reset the spawn timer countdown
	spawnTimer = spawnRate * timeScale;
}
