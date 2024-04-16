Listing some good standards to follow for us as a team:

**Naming conventions:**
- Variables: `var snake_case = ...`
- Functions: `function snake_case() {...}`
- Globals: `SNAKE_CASE = ...`
- Folders: `Snake_Case`
- Files/Assets: `oCamelCase`
  - first letter is file type

- Use meaningful names
  - Bad: z, en, tgt, temp
  - Good: zombie, enemy, target, _
    - yes underscore is a viable variable name

- Boolean variables should indicate as such
  - Bad: alive, holding, shooting
  - Good: is_alive, has_item, is_shooting


**Function definitions:**
- Document strings give parameter type hints so others know what the function does and what it needs as arguments
- Set default values for your parameters so a function can always give a consistent return or handle 


**White Space**
- 1 space around operators
- 1 space between function parameters/arguments and elements in enumerables like arrays
- 2 newlines between different types of definitions (functions and variables for example)
- 1 newline between same kinds of definitions (different groups of variables, or each function for example)
- 0 newlines between relevant definitions (variables in a group for example)

```
// State machine
enum enTowerState {
    idle, 
    attack,
    charge,
    disable,
}


// Tower flags
is_selected = false;
is_alive = false;
is_shooting = false;
target = undefined;

// Tower Stats
cost = 50;
range = 100;
fire_rate = room_speed / 3;


/// @func test_msg(test1, test2)
/// @param test1 Real
/// @param test2 String
/// @return String 
function test_msg(test1=NaN, test2="") {
    if (test1 + test2) {
        return undefined
    }
    show_message("testing function");
    return "some string";
}

/// @func test_msg(test1, test2)
/// @param test1 Real
/// @param test2 String
/// @return String 
function test_msg2(test1=NaN, test2="") {
    if (not test1 and not test2) {
        return undefined
    }
    show_message("testing function 2");
    return "some string";
}
```


**Code logic**
- Avoid nesting if statements:
- Bad:
```
if (thing_a) {
		if (thing_b) {
			if (thing_c) {
				show_message();
			}
		}
	}
```
- Good:
```

	if (thing_a and thing_b and thing_c) { 
		show_message();
	}
```

- Avoid while or do until loops
  - especially ones with no condition in the while
  - bad: `while true {...}`
  - ok: `while not break_condition {...}`
  - good: for

- Avoid simplified operators over more readable ones
  - bad: `!`, `&&`
  - good: `not`, `and` 

- Use switch statements over extended if - else if chains
  - bad:
```
	var player_lives = 3;
	if (player_lives == 3) {
		// Desplay 3 lives
	} else if (player_lives  == 2) {
		// Desplay 2 lives
	} else if (player_lives  == 1) {
		// Desplay 1 life
	} else if (player_lives  == 0) {
		// Die
	}
```
  - Good:
```
var player_lives = 3;
switch (player_lives) {
    case 3:
        // Desplay 3 lives
        break;
    case 2:
        // Desplay 2 lives
        break;
	case 1:
        // Desplay 1 life
        break;
    default:
        // Die
        break;
}
```

- Avoid long logic statements by using local variables:
  - Bad
```
if (instance_nearest(self.x, self.y, oEnemy) and point_distance(self.x, self.y, enemy.x, enemy.y) <= self.range)) { ... }
```
  - Good: 
```
var enemy = instance_nearest(self.x, self.y, oEnemy);
var enemy_in_range = point_distance(self.x, self.y, enemy.x, enemy.y) <= self.range;
if (enemy and enemy_in_range) { ... }
```
