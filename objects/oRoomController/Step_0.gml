// When unpaused progress the room timer
if (isUnpaused) {
	deltaRoomTimer += (delta * timeScale) - pauseTime;
	
	// Remove any aaccumulated pause time after used above
	if (pauseTime > 0) pauseTime = 0;

// When paused progress the pause timer
} else {
	pauseTime += (delta_time / conversions.msToS * timeScale);
}

// Game over - Win State
if (
	not (gameState == gameResolveState.won) 
	and level >= array_length(levels) - 1 
	and levels[level].wave > 0
	and levels[level].countAlive <= countLives.none
) {
	gameState = gameResolveState.won;
	pause_game(parentGame.music, "You Won!");

// Game over - Loss State
} else if (not gameState == gameResolveState.lost and players[0].numLives <= countLives.none) {
	gameState = gameResolveState.lost
	pause_game(parentGame.music, "You Lost!");
}
