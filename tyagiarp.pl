:- dynamic here/1.

/*Available Rooms*/

room('Prison Cell').
room('Main Prison Corridor').
room('Unlocked Prison Cell').
room('Locked Prison').
room('Upper Dungeons').
room('Long Hall').
room('Execution Chamber').
room('Passageway').
room('Armoury').
room('Kitchen').
room('Aragog"s Lair').
room('Knight"s Room').
room('Tall Stairway').
room('Tunnel').
room('Outside').





/*Locations*/

location('Shelf', 'Unlocked Prison Cell').
location('Dining Table', 'Upper Dungeons').
location('Rotten Meat', 'Dining Table').
location('Apple', 'Shelf').




/*Connecting Doorways*/

door('Prison Cell', 'Main Prison Corridor').
door('Main Prison Corridor', 'Unlocked Prison Cell').
door('Main Prison Corridor', 'Locked Prison Cell').
door('Main Prison Corridor', 'Upper Dungeons').
door('Upper Dungeons', 'Passageway').
door('Upper Dungeons', 'Long Hall').
door('Upper Dungeons', 'Knight"s Room').
door('Long Hall', 'Execution Chamber').
door('Passageway', 'Kitchen').
door('Passageway', 'Armoury').
door('Passageway', 'Aragog"s Lair').
door('Passageway', 'Aragog"s Lair').
door('Knight"s Room', 'Tall Stairway').



/*Rule to make sure doors are connected both ways*/

connect(X, Y) :- door(X, Y).
connect(X, Y) :- door(Y, X).


/*Ingestibles and Poison */

edible('Apple').
inedible('Rotten Meat').



/*Start Location*/

here('Main Prison Corridor').

list_things(Place) :-
	location(X, Place),
	tab(2),
	write(X),
	nl,
	location(Y, X), 
	tab(4), 
	write(Y), 
	nl, 
	fail.
list_things(_).

list_connections(Place) :- 
	connect(Place, X),
	tab(2), 
	write(X), 
	nl,
	fail.
	list_connections(_).

look :- 
	here(Place), 
	write('You are in the '), write(Place), nl, 
	write('You can see:'), nl, 
	list_things(Place), 
	write('You can go to:'), nl,
	list_connections(Place).


goto(Place) :-
	can_go(Place), 
	move(Place), 
	look.


can_go(Place) :-
	here(X), 
	connect(X, Place).
can_go(Place) :- 
	write('You can"t get there from your present location'), nl,
	fail.


move(Place) :- 
	retract(here(X)), 
	asserta(here(Place)).


take(X) :-
	can_take(X),
	take_object(X).

can_take(Thing) :- 
	here(Place), 
	location(Thing, Place).
can_take(Thing) :- 
	write('There is no '), write(Thing), write(' at this location.'),
	nl, fail.



take_object(Thing) :- 
	retract(location(Thing,_)),
	asserta(inventory(Thing)),
	write('Thing'), write(' added to Inventory.'),
	nl.

