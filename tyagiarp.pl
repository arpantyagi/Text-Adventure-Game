:- dynamic here/1.
:- dynamic have/1.
:- dynamic door/2.
:- dynamic ldoor/2.
:- dynamic location/2.
:- dynamic alive/1.
:- dynamic health/1.
:- dynamic status/1.


:- ansi_format([bold,fg(green)],"Enter 'go.' to begin the 'Dungeon Escape'.", []).

/*------------------Game Loop ------------------*/




/*------------------Game Facts------------------*/
here('Main Prison Corridor').

:-
assert(fact(player,alive)),
assert(is_in('Aragog','Aragog"s Lair')),
assert(is_in('Knight','Knight"s Room')),
assert(is_in('Executioner','Execution Chamber')).




/*------------------Game Shortcuts ------------------*/


'Prison Cell' :- goto('Prison Cell').
'Main Prison Corridor' :- goto('Main Prison Corridor').
'Unlocked Prison Cell' :- goto('Unlocked Prison Cell').
'Upper Dungeons' :- goto('Upper Dungeons').
'Locked Prison Cell' :- goto('Locked Prison Cell').
'Long Hall' :- goto('Long Hall').
'Execution Chamber' :- goto('Execution Chamber').


/*------------------Game Start------------------*/

go :- welcome(), nl, look.


welcome() :- 
			ansi_format([fg(red)],"Dungeon Prison Escape", []), nl,nl,
			ansi_format([fg(cyan)],  "This game was developed as a project for the BIE-PPA course at Czech Technical University FIT. Please have a look at the Readme.md for more info.", []),nl,nl,
			ansi_format([fg(blue)],  "Your primary objective is escape the Dungeon, You will need to collect specific weapons to defeat specific enemies, you will need to eat edible food to restore Health if you are attacked, but be careful to avoid poisonous food. All the Best.", []),nl,

			write("go.            -->     Begin the Escape"), 					nl,
			write("inventory.     -->     Check your Inventory"), 				nl,
			write("look.          -->     look around your environment"), 	nl,
			write("take(object).  -->     Stores object in your inventory"), 	nl,
			write("drop(object).  -->     Drops object from your inventory"), 	nl,
			write("restart.       -->     Restarts the game"), 					nl,
			nl, nl.

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

description('Prison Cell', 'Its Dark, Damp and Cold in the Cell, There seems nothing of Interest here! You must Escape the Dungeon Prison').

description('Main Prison Corridor', 'You have stepped out of your "Prison Cell" and into a long corridor, which has prison cells on both sides. Most of them are empty and contain skeleton of people who have died after spending their lives in this dungeon. You must not suffer the same fate. Its a very hard to see in the dark Corridor, the only source of light is the wooden torch on the wall, However you can see an "Unlocked Prison Cell" on the right. There is also a narrow stairway going to the "Upper Dungeons".').
description('Unlocked Prison Cell','Looks Like someone was recently here, There are some "Apple" here that you might be able to eat. Be careful what you eat though! Eating the wrong things can decrease your Health!').

description('Locked Prison Cell','').
description('Key Room', '').
description('Upper Dungeons','You enter a big Hall, It is dimly lit, The only source of light is the Fireplace adjacent to the stairway, there is a big Dining Table in the Center, There is some Rotting Meat on the Table. There is a Heavy Iron door on the front which leads to the "Guard Room", you can hear some footsteps and metal armour clanking. On the right there is a door that leads to the "Long Hall", you can hear someone talking there. On the left there is a wooden door which leads to the "Passageway".", ').
description('Long Hall','It is very Dark, you can only see your surroundings thanks to the wooden torch, The walls are covered with portraits of the Devil and deomons of different kind, the floor is covered in dried blood, On the other end of there is a door that leads to the "Execution Room".').
description('Execution Chamber','').
description('Passageway','').
description('Armoury','').
description('Kitchen','').
description('Aragog"s Lair','').
description('Knight"s Room','').
description('Tall Stairway','').
description('Tunnel','').
description('Outside','Success').



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

/*------------------Connecting Doorways------------------*/

door('Prison Cell', 'Main Prison Corridor').
door('Main Prison Corridor', 'Unlocked Prison Cell').
door('Main Prison Corridor', 'Upper Dungeons').
door('Upper Dungeons', 'Passageway').
door('Upper Dungeons', 'Long Hall').
door('Upper Dungeons', 'Knight"s Room').
door('Long Hall', 'Execution Chamber').
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
  	ansi_format([bold,fg(white),bg(yellow)], 'VICTORY you have escaped the Prison!', []), nl.
game_status() :- 
	true.

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
	retract(retract('Armoury Key')),
	write('You have the Armoury Keys in inventory, Armoury Door Unlocked!'),nl,nl,!.
special(Place) :-
	ldoor(_, Place),
	write('The Door is Locked!'),nl,
	!, fail.
special(_).



/*------------------Taking Objects------------------*/

take(X) :-
	can_take(X),
	take_object(X),
	true.

can_take(Thing) :- 
	here(Place), 
	location(Thing, Place),!.
can_take(Thing) :- 
	write('There is no '), write(Thing), write(' at this location.'),
	nl, fail.

take_object(Thing) :- 
	here(X),
	retract(location(Thing,X)),
	asserta(have(Thing)),
	write(Thing), write(' added to Inventory.'),
	nl.

/*------------------Dropping Objects------------------*/

drop(X) :-
	in_inventory(X),
	drop_object(X),
	true.


in_inventory(X) :-
	have(X),!.
in_inventory(X) :-
	write('You don not have '), write(X), write('in inventory.'),
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
have('Prison Key').