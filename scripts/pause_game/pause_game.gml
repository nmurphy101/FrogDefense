function pause_game(
	_music,
	_pauseText = "",
	_pausedSurface = surface_create(room_width, room_height),
	_showButtons = true,
	_notMe = true
) {
	
	audio_pause_sound(_music);
	instance_deactivate_all(_notMe);
	pauseTime = deltaRoomTimer;
	
	surface_set_target(_pausedSurface);
	draw_surface(application_surface, 0, 0);
	surface_reset_target();
	
	draw_surface_tint(_pausedSurface, c_black)
	
	var _pausedMenuObjs = [];
	if (_showButtons) {
		_pausedMenuObjs = [
			instance_create_depth(room_width / 2, room_height / 6, objectDepths.gui, oTextTitle),
			instance_create_layer(room_width / 2, room_height / 3, "Instances", oButtonResume, {
				depth:	objectDepths.gui,
				parentRoom: other,
				x: room_width / 2,
				y: room_height / 3,
			}),
			instance_create_depth(room_width / 2, room_height / 2, objectDepths.gui, oButtonMainMenu),
			instance_create_depth(room_width / 2, room_height / 1.5, objectDepths.gui, oButtonQuit),
		]
		_pausedMenuObjs[0].text = _pauseText;
		_pausedMenuObjs[1].parentRoom = self;
		
	} else {
		_pausedMenuObjs = [
			instance_create_depth(room_width / 2, room_height / 6, objectDepths.gui, oTextTitle),
		]
		_pausedMenuObjs[0].text = _pauseText;
	}
	return [_pausedSurface, _pausedMenuObjs];
};