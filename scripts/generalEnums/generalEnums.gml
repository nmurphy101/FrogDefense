enum conversions {
	msToS = 1_000_000,
	msToMin = 60_000_000,
	msToHr = 3_600_000_000,
	timerMod = 100000,
};

enum baseRates {
	spawnRate = 60,
	attackRate = 10,
	attackRange = 175,
	movementSpeed = 20,
	bulletSpeed = 50,
}

enum countLives {
	none = 0,
	half = 5,
	full = 10,
	double = 20,
};


enum objectDepths {
	gui = 5,
	player = 6,
	enemies = 7,
	towers = 8,
	bullets = 9,
	controller = 11,
	restricted = 20,
}

enum soundPriority {
	music = 100,
	turretFire = 90,
	effect = 80,
}

enum gameResolveState {
	lost,
	won,
	active,
}

enum soundLoop {
	noLoop,
	yesLoop,
}

enum keyboardActions {
	buy,
	time,
	pause,
}






