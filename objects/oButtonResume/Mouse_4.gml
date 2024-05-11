// Does as it says, unpause the game to resume
unpause_game(parentRoom.parentGame.music, parentRoom.pauseSurface, parentRoom.pausedMenuObjs);

// Flip the isUnpaused boolean
parentRoom.isUnpaused = not parentRoom.isUnpaused;