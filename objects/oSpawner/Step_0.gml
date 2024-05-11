// Update the spawnTimer to the passing of time
if spawnTimer > 0 {
	spawnTimer -= delta * timeScale;
}

// Timer is up, now we can spawn the next enemy
if (spawnTimer <= 0) {
	// Spawner should destroy itself once it's spawned all it's allowed to
	if (currentSizeSpawned >= enemyCount) {
		show_debug_message("Spawner is finished")
		instance_destroy()
	}
	
	// Spawn the enemy
	if (currentSizeSpawned < enemyCount) {
		currentSpawner = instance_create_layer(x, y, "Instances", enemyType, {
			depth:	objectDepths.enemies,
			parentSpawner: other,
			path: path,
		});
		currentSizeSpawned++;
	}
	// Reset the spawn timer countdown
	spawnTimer = spawnRate * timeScale;
	show_debug_message($"Spawning: {enemyCount} of {enemyType}")
}
