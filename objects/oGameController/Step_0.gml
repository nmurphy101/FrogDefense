// timeScale should only be 50% - 400% time speed
timeScale = clamp(timeScale, -.5, 4)
delta = (delta_time / conversions.msToS) * targetFPS

// Spawn a room controller once in the first level room
if (not instance_exists(currentRoomController) and room == rLevel0) {
	currentRoomController = instance_create_layer(0, 0, "Instances", oRoomController, {
		depth: 	objectDepths.controller,
		parentGame: other,
	});
	
} else if (not instance_exists(currentRoomController)) {
	// Skip the rest of the gameController step if there's not a roomController
	exit;
}

// The possible game states
var _hasLostGame = currentRoomController.gameState == gameResolveState.lost
var _hasWonGame = currentRoomController.gameState == gameResolveState.won
var _isActiveGame = currentRoomController.gameState == gameResolveState.active

if (_isActiveGame) {
	var _isBossLevel = currentRoomController.levels[currentRoomController.currentLevel.level].isBossLevel
	var _isLevelStarted = currentRoomController.levels[currentRoomController.currentLevel.level].isStarted
	
	// Game music when during a active level
	if (not _isBossLevel and _isLevelStarted and not audio_is_playing(GameMusicWave)) {
		audio_stop_sound(music)
		music = audio_play_sound(GameMusicWave, soundPriority.music, soundLoop.yesLoop)
	
	// Game music when during a active boss level
	} else if (_isBossLevel and _isLevelStarted and not audio_is_playing(GameMusicBoss)) {
		audio_stop_sound(music)
		music = audio_play_sound(GameMusicBoss, soundPriority.music, soundLoop.yesLoop)
	
	// Game music when between levels
	} else if (not _isBossLevel and not _isLevelStarted and not audio_is_playing(GameMusicIdle)) {
		audio_stop_sound(music)
		music = audio_play_sound(GameMusicIdle, soundPriority.music, soundLoop.yesLoop)
	} 

// Game is won music and sound
} else if (_hasWonGame and not audio_is_playing(GameMusicWin)) {
	audio_play_sound(SoundSuccess, soundPriority.effect, soundLoop.noLoop)
	music = audio_play_sound(GameMusicWin, soundPriority.music, soundLoop.yesLoop)

// Game is lost music and sound
} else if (_hasLostGame and not audio_is_playing(GameMusicLoss)) {
	audio_play_sound(SoundFail, soundPriority.effect, soundLoop.noLoop)
	music = audio_play_sound(GameMusicLoss, soundPriority.music, soundLoop.yesLoop)
}
