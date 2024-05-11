show_debug_message("Path Building Started")

// The surface that showcases the loading screen
loadingSurface = surface_create(room_width, room_height)

// Sets the initial node in the path to be previous for when loop starts
var _prevNode = {
	"X": path_get_point_x(path, 0),
	"Y": path_get_point_y(path, 0),
}

// All of the nodes in the path
for (var i = 1; i < path_get_number(path); i++) {
	var _currentNode = {
		"X": path_get_point_x(path, i),
		"Y": path_get_point_y(path, i),
	}
	
	// If the next node is to the left or right
	if (_prevNode.X != _currentNode.X) {
		// Place a restricted obj halfway between the two nodes
		var _x = (_prevNode.X + _currentNode.X) / 2;
		var _xScale = round((abs(_prevNode.X - _currentNode.X) / self.sprite_width)) + 2;
		var _restrictedPath = instance_create_depth(_x, _currentNode.Y, objectDepths.restricted, oRestrictedZone)
		
		// Stretch the restricted obj to reach the two nodes
		_restrictedPath.image_xscale = _xScale / 2;
		
		// Record the restricted obj and set the current node position to be previous for next iteration
		array_push(parentRoom.restrictedZoneArray, _restrictedPath);
		_prevNode.X = _currentNode.X;
	
	// If the next node is to the up or down
	} else if (_prevNode.Y != _currentNode.Y) {
		// Place a restricted obj halfway between the two nodes
		var _y = (_prevNode.Y + _currentNode.Y) / 2;
		var _yScale = round((abs(_prevNode.Y - _currentNode.Y) / self.sprite_height)) + 2;
		var _restrictedPath = instance_create_depth(_currentNode.X, _y, objectDepths.restricted, oRestrictedZone)
		
		// Stretch the restricted obj to reach the two nodes
		_restrictedPath.image_yscale = _yScale / 2;
		
		// Record the restricted obj and set the current node position to be previous for next iteration
		array_push(parentRoom.restrictedZoneArray, _restrictedPath);
		_prevNode.Y = _currentNode.Y;
	}
}

// Clear the pause effects, clear the loading surface and unpause the game
unpause_game(parentRoom.parentGame.music, loadingSurface, loadingMenuObjs);

show_debug_message("Path Building Finished")

// Tell the room that the path is built
parentRoom.hasBuiltPath = true;

// Trigger the level start
parentRoom.levels[parentRoom.currentLevel.level].isStarted = true;