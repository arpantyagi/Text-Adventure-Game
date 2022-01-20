:- dynamic here/1.
:- dynamic have/1.
:- dynamic door/2.
:- dynamic ldoor/2.
:- dynamic location/2.
:- dynamic alive/1.
:- dynamic health/1.
:- dynamic status/1.
:- dynamic player/1.
:- dynamic enemy/3.
:- ansi_format([bold,fg(green)],"Enter 'go.' to begin the 'Dungeon Escape'.", []).



/*------------------Game Shortcuts ------------------*/

'Prison Cell' :- goto('Prison Cell').
'Main Prison Corridor' :- goto('Main Prison Corridor').
'Unlocked Prison Cell' :- goto('Unlocked Prison Cell').
'Upper Dungeons' :- goto('Upper Dungeons').
'Locked Prison Cell' :- goto('Locked Prison Cell').
'Long Hall' :- goto('Long Hall').
'Execution Chamber' :- goto('Execution Chamber').
'Key Room' :- goto('Key Room').
'Passageway' :- goto('Passageway').
'Armoury' :- goto('Armoury').
'Kitchen' :- goto('Kitchen').
'Aragog"s Lair' :- goto('Aragog"s Lair').
'Knight"s Room' :- goto('Knight"s Room').
'Tall Stairway' :- goto('Tall Stairway').
'Tunnel' :- goto('Tunnel').
'Outside' :- goto('Outside').

/*------------------Game Start------------------*/
here('Prison Cell').
player('alive').
go :- welcome(), nl, look.	
	


welcome() :- 
			ansi_format([fg(red)],"Dungeon Prison Escape", []), nl,nl,
			ansi_format([fg(cyan)],  "This game was developed as a project for the BIE-PPA course at Czech Technical University FIT. Please have a look at the Readme.md for more info.", []),nl,nl,
			ansi_format([fg(blue)],  "Your primary objective is to escape the Dungeon, You will need to avoid enemies and entering the same room as an enemy without the proper weapon will lead to DEATH, Make sure to scout the area and look for weapons before you go behind any suspicious doors.", []),nl,
			ansi_format([fg(blue)],  "Whenever you enter any room, You will receive information about the next rooms you can go to as well as the items in the room you can pick up, write your choice inside single apostrophe ('). For example if you want to go to Upper Dungeons you need to write 'Upper Dungeons' to the listner with the single apostrophe (').", []),nl,
			write("go.            -->     Begin the Escape"), 					nl,
			write("inventory.     -->     Check your Inventory"), 				nl,
			write("look.          -->     look around your environment"), 	nl,
			write("take('object').  -->     Stores object in your inventory"), 	nl,
			write("drop('object').  -->     Drops object from your inventory"), 	nl,
			write("use.           -->     use the teleport."), 					nl,
			write("halt.          -->     Exit the game"), 					nl,
			nl, nl, !.

/*------------------Available Rooms------------------*/
room('Prison Cell').
room('Main Prison Corridor').
room('Unlocked Prison Cell').
room('Locked Prison Cell').
room('Upper Dungeons').
room('Long Hall').
room('Execution Chamber').
room('Key Room').
room('Passageway').
room('Armoury').
room('Kitchen').
room('Aragog"s Lair').
room('Knight"s Room').
room('Tall Stairway').
room('Tunnel').
room('Outside').


/*------------------Room Descriptions ------------------*/

description('Prison Cell', 'Its Dark, Damp and Cold in the Cell, There seems nothing of Interest in here! You must quickly escape the Dungeon Prison, the lock to the prison was rusty and has been broken, its a good time to escape to the "Main Prison Corridor".').
description('Main Prison Corridor', 'You have stepped out of your "Prison Cell" into a long corridor, which has prison cells on both sides. Most of them are empty and contain skeleton of people who have died after spending their lives in this dungeon. You must not suffer the same fate. Its a very hard to see in the dark Corridor, the only source of light is the wooden torch on the wall, However you can see an "Unlocked Prison Cell" on the right and there is "Locked Prison Cell" to the left you can see a note of some sort there on the floor, it might be helpful to find the key and read the note.There is also a narrow stairway going to the "Upper Dungeons".').
description('Unlocked Prison Cell','Looks Like someone was recently here, There are some "Apple" here that you might be able to eat. There is a message on the wall inscribed with fingernails it reads "Get the Knife". Hmm.... Intersting where would you be able to find a Kniife here. ').
description('Locked Prison Cell','The Prison is not much differnt from yours but you can see a MAP here! The map details the way to exit the Prison. Here is what it says "Fight The Knight in Knight"s Room, Take the Stairs towards the Tunnel and soon you will see Sunshine.').
description('Key Room', 'The room is filled with portraits, and Keys, However one key stands out from the rest, the shining silver key, it is lablled to the "Armoury", I am sure you can find some weapons there, There are no doors leading elsewhere This is a dead end, You can only go back from here.').
description('Upper Dungeons','You enter a big Hall, It is dimly lit, The only source of light is the Fireplace adjacent to the stairway, there is a big Dining Table in the Center, There is some Rotting Meat on the Table. There is a Heavy Iron door on the front which leads to the "Knight"s Room", you can hear some footsteps and metal armour clanking. On the right there is a door that leads to the "Long Hall". On the left there is a wooden door which leads to the "Passageway".').
description('Long Hall','It is very Dark, you can only see your surroundings thanks to the wooden torch, The walls are covered with portraits of the Devil and deomons of different kind, the floor is covered in dried blood, On the other end of there is a door that leads to the "Execution Chamber", you can hear someone inside the room, you better have a weapon before venturing there.').
description('Execution Chamber','You are shocked, you see several decapitated  human body parts, for the first time you witness the guillotine. This seems a bad room to be in.').
description('Passageway','You enter the slim corridor which has doors in all direction, but you can see something shining very brightly in here, It is the teleport!!, you can pick it up and get back to this location using it. You can also notice a door to the "Kitchen" on the right, a heavy metal door to the "Armoury" on the left and a very weird looking black door that is lablled "Aragog"s Lair".').
description('Armoury','This room is well lit and here are weapons and Armours of all kind you should definetly take some weapons and fight the guard in Knight"s Room. There is also a key to the Locked Prison here, Do you think it is worth it to travel back to the Locked Prison ?').
description('Kitchen','Standard Dark Kitchen, There is no one here, However a Knife might be handy weapon to take.').
description('Aragog"s Lair','You should get out of this room!, there is nothing of Interest and there are spiders all over the room, RUN!').
description('Knight"s Room','This Room is Huge and there are heavy chandeliers, the room is lit with candles all over the place, there is a reading table here, seems like someone was recently here, There is a Knight standing in the corner.').
description('Tall Stairway','You have come across a very steep and long stairway for as far as you see you can just see stairs and both side are walls which are splattered with dried blood, You should keep going straight ahead. There seems to be Tunnel that might lead to the outside.').
description('Tunnel','You have stepped inside the tunnel and you can already see some sunlight, its the first time in months you are seeing sunlight, just a few more steps to the outside.').
description('Outside','Congratulations, Success! you have completed the Game Dugneon Prison Escape.').



/*------------------Locations------------------*/

location('Wooden Torch', 'Main Prison Corridor').
location('Cooked Potatoes', 'Unlocked Prison Cell').
location('Apple', 'Unlocked Prison Cell').
location('Dining Table', 'Upper Dungeons').
location('Rotten Meat', 'Upper Dungeons').
location('Cold Soup', 'Upper Dungeons').
location('Steel Sword', 'Armoury').
location('Metal Armour', 'Armoury').
location('Knife', 'Kitchen').
location('Potatoes', 'Kitchen').
location('Hot Meal', 'Kitchen').
location('Armoury Key', 'Key Room').
location('Prison Key', 'Armoury').
location('teleport', 'Passageway').

/*------------------Connecting Doorways------------------*/

door('Prison Cell', 'Main Prison Corridor').
door('Main Prison Corridor', 'Unlocked Prison Cell').
door('Main Prison Corridor', 'Upper Dungeons').
door('Upper Dungeons', 'Passageway').
door('Upper Dungeons', 'Long Hall').
door('Upper Dungeons', 'Knight"s Room').
door('Long Hall', 'Execution Chamber').
door('Execution Chamber', 'Key Room').
door('Passageway', 'Kitchen').
door('Passageway', 'Aragog"s Lair').
door('Knight"s Room', 'Tall Stairway').
door('Tall Stairway', 'Tunnel').
door('Tunnel', 'Outside').

ldoor('Main Prison Corridor', 'Locked Prison Cell').
ldoor('Passageway', 'Armoury').



/*------------------Rule to make sure doors are connected both ways------------------*/

connect(X, Y) :- door(X, Y).
connect(X, Y) :- door(Y, X).

connect(X, Y) :- ldoor(X, Y).
connect(X, Y) :- ldoor(Y, X).

/*------------------Ingestibles and Poison ------------------*/

edible('Apple').
edible('Potatoes').
edible('Hot Meal').
edible('Cooked Potatoes').
edible('Cold Soup').

inedible('Rotten Meat').

/*------------------ Enemies and location ------------------*/

enemy('Knight', 'Knight"s Room' , 'Upper Dungeons').
enemy('Guard', 'Execution Chamber', 'Long Hall').

/*------------------List all the Things in the Place------------------*/


list_things(Place) :- 
	(location(X, Place),
	tab(4),
	ansi_format([bold,fg(blue)],X, []),
	nl,
	fail);
	true.

/*------------------List all the possible places that a person can go from Place------------------*/

list_connections(Place) :- 
	connect(Place, X),
	tab(4), 
	ansi_format([bold,fg(blue)],X, []), 
	nl,
	fail.
	list_connections(_).




/*------------------Tells User about the present location------------------*/
look :- 
	here(Place), 
	write('You are in the '), write(Place),
	nl,
	description(Place, Y),
	ansi_format([bold,fg(cyan)],Y, []), nl,
	nl,
	write('Items you can see:'), nl, 
	list_things(Place), 
	write('Places you can go to:'), nl,
	list_connections(Place).


/*------------------Movement Procedures------------------*/
goto(Place) :-
	can_go(Place),
	special(Place),
	enemies(Place),  
	move(Place),
	game_status(),
	look.

can_go(Place) :-
	here(X), 
	connect(X, Place),!.
can_go(Place):-
	here(Place),
	write('You are already in that location.'), nl,
	!.
can_go(Place) :- 
	room(Place),!,
	write('You can"t get there from your present location'), nl,
	fail.
can_go(_) :-
	write('Either the Place does not exist or there is a typo.'), nl,
	fail.

move(Place) :- 
	retract(here(_)), 
	asserta(here(Place)).

game_status() :-
	here('Outside'),
  	ansi_format([bold,fg(green),bg(yellow)], 'VICTORY you have escaped the Prison!', []), nl,
  	halt.
game_status() :-
	player('dead'),
  	ansi_format([bold,fg(red),bg(yellow)], 'Defeat you Died!', []), nl,
  	false.
  	game_status() :- 
	true.

enemies(Place) :- 
	here(X),
	enemy('Knight', Place, X ),
	have('Steel Sword'), 
	retract(enemy('Knight', Place, X)),
	retract(have('Steel Sword')),
	write('As you opne the door you are greeted by a swift blade to your chest, duck and roll under the Knight Thankfully, you had the Steel Sword in your Inventory after an intense battle you were luckliy able to beat the Knight.'), nl, nl.
enemies(Place) :- 
	here(X),
	enemy('Knight', Place, X ),
	retract(player('alive')),
	asserta(player('dead')),
	write('You barge into the Knight"s Room unprepared and you pay the price, he immediately attacks you and you have no chances to fight against well trained armed Knight. You are dead.'),nl,nl, 
	write('GAME OVER'),
	halt.
enemies(Place) :- 
	here(X),
	enemy('Guard', Place, X ),
	have('Knife'), 
	retract(enemy('Guard', Place, X)),
	write('You have been spotted by a guard, the guard looks angry but he seems to be unarmed.After an intense battle you were able to stab him multiple times and you were able to kill him with the Kitchen Knife, you picked up earlier.'), nl, nl.
enemies(Place) :- 
	here(X),
	enemy('Guard', Place, X ),
	retract(player('alive')),
	asserta(player('dead')),
	write('You go to the execution room and are face to face with a guard after an intense battle he pins you to the ground and beats you to death. You should have got a Weapon to a fight !'),nl,nl,
	write('GAME OVER'),
	halt.
enemies(_).

special(Place) :-
	ldoor('Main Prison Corridor' , Place),
	have('Prison Key'),
	retract(ldoor('Main Prison Corridor' , Place)),
	asserta(door('Main Prison Corridor' , Place)),
	retract(have('Prison Key')),
	write('You have the Prison Keys in inventory, Prison Door Unlocked!'),nl,nl,!.
special(Place) :-
	ldoor('Passageway' , Place),
	have('Armoury Key'),
	retract(ldoor('Passageway' , Place)),
	asserta(door('Passageway' , Place)),
	retract(have('Armoury Key')),
	write('You have the Armoury Keys in inventory, Armoury Door Unlocked!'),nl,nl,!.
special(Place) :-
	ldoor(_, Place),
	write('The Door is Locked!'),nl,
	!, fail.
special(_).


use :- 
	have('teleport'),
	retract(here(_)),
	retract(have('teleport')),
	asserta(location('teleport', 'Passageway')),
	asserta(here('Passageway')),
	write('You have been magically teleported back to the Passageway.'),
	look.
use :- 
	write('You do not have the teleport in inventory.').

/*------------------Enemies------------------*/

/*------------------Taking Objects------------------*/

take(X) :-
	can_take(X),!,
	take_object(X),!,
	true.

can_take(Thing) :- 
	here(Place), 
	location(Thing, Place),!.
can_take(Thing) :- 
	write('There is no '), write(Thing), write(' at this location.'),
	nl.

take_object(Thing) :- 
	here(X),
	retract(location(Thing,X)),
	asserta(have(Thing)),
	write(Thing), write(' added to Inventory.'),!,
	nl.

/*------------------Dropping Objects------------------*/

drop(X) :-
	in_inventory(X),
	drop_object(X),
	true.


in_inventory(X) :-
	have(X),!.
in_inventory(X) :-
	write('You don not have '), write(X), write(' in inventory.'),
	nl, fail.

drop_object(X) :-
	here(Place),
	retract(have(X)),
	asserta(location(X, Place)),
	write(X), write(' removed from Inventory.'),
	nl.

/*------------------Prints all Items in your inventory------------------*/
inventory :- 
	write("Your inventory conatians the following items :-"),
	nl,
	(have(X),
	tab(4),
	ansi_format([fg(blue)],X, []),
	nl, 
	fail).

/*------------------Game States------------------*/








/*------------------Enemies------------------*/


/*------------------Miscellaneous------------------*/
