function unpause_game(_music, _pauseSurface, _pauseMenuObjs = []) {
	// Reactivate the game music that was playing
	audio_resume_sound(_music);
	
	// Reactivate all the other objects in the game
	instance_activate_all()
		
	// Clear the pause effects and unpause the game
	with (_pauseSurface) {
		draw_clear_alpha(1,0);
	}
		
	// Remove the pause menu button objects
	for (var i = 0; i < array_length(_pauseMenuObjs); ++i) {
		with (_pauseMenuObjs[i]) {
			instance_destroy();
		}
	}
};
