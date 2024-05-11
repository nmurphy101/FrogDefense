// Set the logical FPS (not display fps) for the game
game_set_speed(maxFPS, gamespeed_fps)

// There's only one game music to play at a time
music = audio_play_sound(GameMusicMenu, soundPriority.music, true)

// Allow for changing the game speed
global._timeScale = 1
#macro timeScale global._timeScale

// Allow for changing the ui size
global._uiScale = 1
#macro uiScale global._uiScale

// The time delta used to adjust for game lag, so game continues to function at a similar level despite slowdowns
global._deltaTime = (delta_time / conversions.msToS) * targetFPS
#macro delta global._deltaTime

// Load up the keybindings
global._keybindings = json_parse(json_file_to_string("keybindings.json"))
#macro keybindings global._keybindings

// Maping of enemy name's to the object it represents
// for use in translating the enemy name strings in the levels.json file
global._enemyTypeStruct = {
	"fly": oFly,
	"mosquito": oMosquito,
	"beetle": oBeetle,
	"millbug": oMillbug
}
#macro enemyTypeStruct global._enemyTypeStruct

// Maping of tower name's to the object it represents
// for use in translating the enemy name strings in the levels.json file 
// must remain equal in length to the towerOptions variable in the oPlayer object
global._towerActionStruct = {
	"buyTowerOne": [1, oTowerBasic],
	"buyTowerTwo": [2, oTowerBasic],
	"buyTowerThree": [3, oTowerBasic],
	"buyTowerFour": [4, oTowerBasic],
	"buyTowerFive": [5, oTowerBasic],
}
#macro towerActionStruct global._towerActionStruct