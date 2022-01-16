/*Available Rooms*/

room('Prison Cell').
room('Main Prison Corridor').
room('Unlocked Prison Cell').
room('Upper Dungeons').


/*Locations*/

location('Shelf', 'Unlocked Prison Cell').
location('Dining Table', 'Upper Dungeons').
location('Rotten Meat', 'Dining Table').
location('Apple', 'Shelf').



/*Connecting Doorways*/

door('Prison Cell', 'Main Prison Corridor').
door('Main Prison Corridor', 'Unlocked Prison Cell').
door('Main Prison Corridor', 'Upper Dungeons').


/*Ingestibles and Poison */

edible('Apple').
inedible('Rotten Meat').



/*Start Location*/

here('Prison Cell').

