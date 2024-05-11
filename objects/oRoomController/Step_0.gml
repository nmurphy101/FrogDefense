if (isUnpaused) {
	// When unpaused progress the room timer
	deltaRoomTimer += (delta * timeScale) - pauseTime;
	
	// Remove any accumulated pause time after used above
	if (pauseTime > 0) pauseTime = 0;

} else {
	// When paused progress the pause timer
	pauseTime += (delta_time / conversions.msToS * timeScale);
}


if (
	not (gameState == gameResolveState.won) 
	and currentLevel.level >= array_length(levels) - 1
	and instance_exists(levels[currentLevel.level].currentSpawner)
	and levels[currentLevel.level].currentSpawner.wave > 0
	and levels[currentLevel.level].countAlive <= countLives.none
) {
	// Game over - Win State
	gameState = gameResolveState.won;
	pause_game(parentGame.music, "You Won!");

} else if (not gameState == gameResolveState.lost and players[0].numLives <= countLives.none) {
	// Game over - Loss State
	gameState = gameResolveState.lost
	pause_game(parentGame.music, "You Lost!");
}
