// Shouldn't be able to resume a game where one isn't active
if (parentRoom.gameState != gameResolveState.active) {
	instance_destroy();	
}
