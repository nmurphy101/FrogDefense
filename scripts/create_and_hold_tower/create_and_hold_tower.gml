function create_and_hold_tower(player, towerAsset) {
	_selectedTower = instance_create_layer(mouse_x, mouse_y, "Instances", towerAsset, {
		depth: objectDepths.towers,
		parentPlayer: other,  // oPlayer
		isHeld: true,
	});
	player.coins -= _selectedTower.cost;
	player.isHoldingObj = true;
	return _selectedTower;
}
