# Text Adventure in Prolog

This is one of the Project I did for the Course BIE-PPA (Programming Paradigm). 

[Here is the Link to the Task on Course Page ](https://courses.fit.cvut.cz/BIE-PPA/projects/adventure.html)

### Here is highlight of what is required from the solution 

- [x] Text Based adventure games similar to the ones popular in 80s
- [x] Describe a way in which a dungeon can be encoded.
- [x] 20 room with Textual description
- [x] path between the rooms
- [x] must inform the user when objective is reached
- [x] define functions for movement ( The course page asked us to define functions for north, south, east, west movement. I tried to be more creative and at every step I inform the player what rooms he can go to and then he just needs to type the name of the room he wants to go in. My reasoning being that this is more natural way of navigation a dungeons filled with many rooms.)
- [x] add a player inventory, where the player can store items he picks up during the game
- [x] Locked Door that can be open if the user posses the specific key in their inventory
- [x] The door remains open once unlocked by the key
- [x] once player unlocks the door the player looses the key

### Extra Points 

- [x] Two Types of Weapon
- [x] Two Types of Enemies
- [x] Each Enemy immune to one of the weapons ( There are two types of enemies Guard and Knight, Knight is immune to knife but can be killed by sword, and vice versa for guard.)
- [ ] Player Lives
- [x] Killing Enemy if proper weapons possesed in inventory.
- [ ] Extra lives to be collected from some room.( There are food items distributed all over the rooms, but Unfortunately I coudn't implement multiple lives part.)
- [x] Ability to Teleport if player holds the device in inventory
- [x] define function Use for it.
 
As this project was marked with !! sign and I have tried my level best to implement all the additional features just partially missing two of them. I am expecting 28-30 points. 
If there is some scope of improvement(obviously there is) which can help me get more points, please let me know I am willing to spend a few more hours, polishing the project to get more points.


## Game Information

- Please have look at the above section to see all the required and additional features fullfilled by the game.
- At the bottom there will be screenshots of example run of the game from start to finish.

### Dungeon Prison Escape.

- This game is inspired by 80s style text adventure game Zork. The player has just discovered that his prison cell's lock has been opened and ther is no guard around.The Player's goal is to escape the Dungeon.
- He must collect neccesary keys that will give him access to rooms that contain weapons which are required to defeat the Knight"s who is guarding the exit of the dungeon. There are sufficient hint provided during the game,

### Extra Notes

- I have tried to cover all edge cases, entering room without keys, travelling to rooom not directly connected to present room, travelling to the same room, going to enemy without any weapons.
- But if still there are some edge cases that remain and I can get significant points if I do them please let me know, I would be happy to work on them.

## Example usage

The First two steps are obvious launching the prolog listner and then consulting my file, using the following command.
`swipl`

`consult(tyagiarp)`

In the devlop branch you will find folder game_run which contains screenshots of the game run from start to finish.
-
