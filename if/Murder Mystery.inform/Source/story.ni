"Darkshire Manor" by Cody Chen


the maximum score is 15.

[don't list (empty) after containers]
after printing the name of a container:
	omit contents in listing.

[things to do: aka major goals and checkpoints for a perfect game.
switch box: 2 pts
Body: 2 pts
Estate: 2pts
Letter: 2pts
Inheritance: 2pts
key: 2pts
friends: 2pts
final: 1pt]

Guilty is a number variable. Guilty is 0. [used for reporting final person accused.]

[clue flags. 0 if clue not found, > 0 if found]
Evidence_wound is a number variable. Evidence_wound is 0. [examine wound in study]
Evidence_inheritance is a number variable. Evidence_inheritance is 0. [in guest room, frame wentworth]
Evidence_estate is a number variable. Evidence_estate is 0.  [in safe in bedroom. frame wentworth]
Evidence_letter is a number variable. Evidence_letter is 0.[Albrecht perhaps. Crow perhaps.]
Evidence_wentworth_suspicious is a number variable. Evidence_wentworth_suspicious is 0.[Wentworth wants to go to the game room, cannot be 1 if framed is 1]
Evidence_wentworth_framed is a number variable. Evidence_wentworth_framed is 0. [In safe in study. Open with key hidden in the bedroom.]

[Define verb accuse. Used to generate ending. Depening on what clues have been found, different explainations can occur before ending the game]
accusing is an action applying to one visible thing. 
understand "accuse" as accusing.
understand "accuse [person]" as accusing.
carry out accusing:
	If Act III is happening:
		let guilty be 1;
Report accusing:
	If Act I is happening:
		say "Accuse them of what? Taking the last h'orderve?";
	otherwise if act II is happening:
		Say "Accuse someone of turning the lights out? Seems pointless for what was probably an honest electrical surge";
	otherwise:
		If the noun is Sarah:
			say "Sarah looks at you incredulously: 'Are you kidding? I was with you the whole time it was dark! How does that even make sense?'";
		otherwise:
			Say "As you prepare to give your verdict, the police burst through the door.";
			if the noun is Wentworth:
				say "'I know it was you Wentworth! When all the other guests were relaxing you snuck into the Game room, stole Mr. Vectim's prized hunting knife and used the back stair to sneak up into his study! Then, you pretended to show him some financial document and when he sat and turned his back, you stabbed him![no line break][if evidence_wentworth_suspicious is 1] And when I told you all to wait in the parlor, you kept wanting to go to the game room, probably to finish off the poor butler![end if][no line break][if evidence_inheritance is not 0] Additionally you had motive, you're now in charge of the whole company.[end if][no line break][if evidence_estate is not 0] Even more, you inherit Darkshire manor![end if] That's all the motive I need to know it was you.'";
			otherwise if the noun is Butler:
				Say "'It was the butler![If game room is unvisited] We haven't seen him since the murder, it must have been him![otherwise] I don't know why, but I just have a feeling![no line break][end if]'";
			otherwise if the noun is Dr Albrecht:
				Say "'It was Albrecht! Instead of going outside when the lights went out she used the opportunity to sneak upstairs and kill Mr. Vectim! [if evidence_letter is not 0]She had an affair with Mr. Vectim and wanted to cover her tracks, so under the guise of seducing him, she stabbed him in the back![no line break][end if]'";
			otherwise if the noun is David Crow.:
				Say "'Crow did it![no line break][if Evidence_wentworth_framed is not 0] We have proof even, look at this letter in Mr. Vectim's safe! According to this, there should be a whole pile of evidence in the office.[end if][if Evidence_letter is not 0] We also have this letter from Dr. Albrecht warning Vectim of Crow's intentions[end if][if fireplace is unlit] Also, we found this hidden key in the dining room fireplace, where you were waiting when the house was dark! and that's where we found the key to the game room, where you left the butler after knocking him out.[end if]He must have been trying to frame Mr Wentworth for the murder!'";
				increase score by 1;
			Say "[line break][line break]'You know what to do boys, take [the noun] away for good!' says sarah.";
			now guilty is 1;

["talk" action dialogue. Talking to people can give clues.]
Talking is an action applying to one visible thing. 
understand "talk" as talking.
Understand "Talk to [someone]" as talking.
carry out Talking:
	[act I Dialogue"]
	if the noun is butler and act I is happening: 
		Say "The butler turns to you and says 'I understand you are close a friend of Ms. Kenter. This is a big night for her, I understand you're a private eye, but please refrain from snooping too much, it would make a bad showing for her.'";
	Otherwise if the noun is Sarah and Act I is happening:
		say "say 'Sarah turns to you and says 'Lets drop by the dining room for a moment, we can talk in private.'";
	otherwise if the noun is wentworth and Act I is happening:
		Say "Mr. Wentworth seems like a good natured fellow, if not a bit quiet. He sips his drink, turns to you and says 'Why hello there! Are you enjoying Darkshire manor? It's a wonderful place, Mr. Vectim is so kind to have us all out here, though some days it feels like I'm off on a hunting trip with him every weekend here. You really should see the Game Room before you go, you can see the mountain lion Vectim and I bagged in the fall of '92.'";
	otherwise if the noun is Albrecht and Act I is happening:
		Say "You try to approach Dr. Albrecht and Mr. Crow, but they don't notice you in their heated discussion. They seem to be talking about some kind of experimental radio tower that Albrecht is working on. You can't get a word in. 'I told you' says Sarah. ";
	otherwise if the noun is Crow and Act I is happening:
		Say "You try to approach Dr. Albrecht and Mr. Crow, but they don't notice you in their heated discussion. They seem to be talking about some kind of experimental radio tower that Albrecht is working on. You can't get a word in. 'I told you' says Sarah. ";
	otherwise if act II is happening: [act II dialogue]
		if fuse box is switched off:
			if the noun is Sarah and location is lobby:
				Say "'It sure is spooky in here when it's so dark, isn't it?' says Sarah'";
			if the noun is Sarah and location is storage closet:
				Say "'Open up my coat pocket, I should have a penny in there.' says Sarah'";
			if the noun is Sarah and location is Basement:
				say "'Of course we're in the Basement. If we get jumped, you know martial arts, right?' Sarah askes hopefully.";
			otherwise if the noun is Sarah:
				say "'It sure is dark in here with the lights off' she says.";
			otherwise if the noun is crow:
				say "'Goodness me' he says. 'Why do I ever bother coming out here?'";
		otherwise:
			if the noun is Sarah and location is not Basement:
				say "'That sounded like Mr Wentworth!, we need to go check it out!'";
	Otherwise if Act III is happening:
		if the noun is Wentworth:
			say "'I swear I didn't do it! Mr. Vectim and I were very good friends, I would never kill him! But just for a second, is it alright if I stop by the game room? I need to check something.'[line break]Trying to sneak off? Suspicious. Stay where you are' you say.";
			if evidence_wentworth_suspicious is 0:
				increment evidence_wentworth_suspicious;
		if the noun is Albrecht:
			say "'I was outside the whole time the lights were out, It couldn't have been me.'";
		if the noun is Crow:
			say "'All of my assets are with Vectim, why would I ever want him dead?'";
		if the noun is the butler:
			say "'If I may be of some help, Mr. Vectim and Wentworth talked about that lion a good bit.  It may be in your best interest to check it out.'";
			now the mountain lion taxidermy is not scenery;
		if the noun is sarah:
			if evidence_wound is 0:
				say "'We should check out the body.' says Sarah";
			otherwise if evidence_estate is 0:
				say "'We should check out the bedroom' says Sarah";
			otherwise if evidence_inheritance is 0:
				say "'We should check out the guest room says Sarah";
			Otherwise if game room is unvisited:
				say "'I wonder where that door in the lobby goes?' says Sarah";
			say "'This is horrible.'";


[--------------------------------------------------------------------------------------------------------------------------------]

[Lobby is hub of movement. Room 0]
Lobby is a room. "[if unvisited] A butler takes your coat and puts it in the hall closet. 'Good evening' He says. 'If you would kindly proceed to the parlor, we are waiting on just another guest. Your host will be by shortly.' The lobby seems to share the dark wood style of the door, decorative panels coat the outside of the room. A heavy tile floor connects the walls, and above it dangles a giant chandelier.[end if]The lobby is a large atruim, it's airspace extends upwards to the second floor.[if visited] A large chandelier hangs above.[end if] To the west is the parlor, to the northwest is the dining room. Straight ahead to the north is a grand staircase. The doors to the northeast and east and southeast are shut. "
 
	In Lobby is a man called the butler. The indefinite article of the Butler is "the head".

	West of the Lobby is a room called Parlor. 
	Northwest of the Lobby is a room called Dining room.
	North of the Lobby is a open door called Grand Staircase. Through it is Upstairs. The Grand staircase is not openable.
	The bear door is a door that is closed and locked. The bear door is northeast of the lobby and west of the Game Room. The matching key of the bear door is the bear key.
	East of the  Lobby is the Storage Closet. 
	Southeast of the Lobby is a closed door called Cellar. The cellar is south of the Basement.
	
	[depending on scene, restrict player movement]
Before going from lobby to somewhere (called the destination):
	if butler is in lobby and destination is not parlor and act I is happening:
		Say "The butler stops you and says 'That way is to [the destination]. Please head to the parlor. ";
		stop the action; 
Before going from lobby to somewhere (called the destination):
	if destination is Upstairs and act II is happening and fuse box is switched off:
		Say "'I think we should check the Basement' says Sarah. ";
		stop the action; 
	
[Parlor is room 1. Hub of social interaction. Contains bedroom safe code, but only after liquor cabinet is opened in act III.]
The Parlor is a room.  "[If unvisited]You enter the parlor. 'You made it!' a voice cries out as you step into the room. Your old friend Sarah comes rushing over and gives you a hug. She is dressed to the nines in high heels and a shimmering crimson dress.  'You made it!' she exclaims again, 'I was getting worried you might have slid off the road with that storm brewing out there!' 

'Ha, no, the driving wasn't bad' you reassure her. 'Though I didn't expect to be an 40 miles into the wilderness on a Friday.  I'm surprised we even get cell reception out here' 'Well as the newly promoted head of marketing for Universal Cell towers incorperated, you have me to thank for that.' she said smugly.  'A promotion!' you exclaim, 'You never said you were getting promoted! and head of marketing, wow. Well you've certainly showed me.' 'Well yeah' she said, why else do you think I was able to invite you here tonight? I mean, it was supposed to be john here tonight, but forget him. Well, let me show you around. Over there's  the Mr Wentworth. He's the second in comand, behind Mr. Vectim.  I think he has something to do with my promotion. By the window are Dr Albrecht and Mr Crow. Alrbecht is head of R&D, she can be a bit scary at times. Crow is this big time investor, I don't know too much about him except that he's really old money. They're going at it right now about the ethical implications of what Albrecht is doing as head of R&D, I wouldn't between them if I were you. [line break][line break][end if]Parlor has a dark wooden floor, with exquisite furnishings. A bay window overlooks the driveway and another overlooks the valley to the west. To the north is the dining room, to the east is the lobby."

	North of the parlor is the dining room.
	In the parlor is the whisky.  Whisky is a thing. The description is "An old Single malt scotch."
	In Parlor is a gin. Gin is a thing. The description is "Hendricks, and a fine one."
	The indefinite article of whisky is "a bottle of". Understand "drink" as  whisky.
	The indefinite article of gin  is "a bottle of".  Understand "drink" as  gin. 
	drinks is a number variable. drinks is 0.
	instead of taking gin:
		If drinks < 3 begin; say "you pour yourself some gin."; increment drinks;
		otherwise; say "You think you've had enough for now." ;end if.
	instead of drinking gin:
		If drinks < 3 begin; say "you pour yourself some gin."; increment drinks;
		otherwise; say "You think you've had enough for now." ;end if.
	instead of taking whisky:
		If drinks < 3 begin; say "you pour yourself some whisky."; increment drinks;
		otherwise; say "You think you've had enough for now." ;end if.
	instead of drinking whisky:
		If drinks < 3 begin; say "you pour yourself some whisky."; increment drinks;
		otherwise; say "You think you've had enough for now." ;end if.
	
	In the parlor is a liquor cabinet. The liquor cabinet is closed and locked. The liquor cabinet is fixed in place. The liquor cabinet contains the code.  The description is "A cabinet containing some of the most high end alcohols you've ever seen. there also seems to be a scrap of paper in the back."
	Understand "paper" as code.
	Understand "scrap of paper" as code.
	The code is a thing.  The description is "The numbers '06 29 01' are hastily written on the paper".
	In the parlor is a couch. The couch is a thing. The couch is scenery."Red leather back, ornate woodwork. Fancy, but normal."
	Understand "look out window" as "[x window]".
	the window is a thing. the window is scenery. "Outside the storm continues brewing. Despite being high on a mountain, there's no sign of civilization."

	In the Parlor is a woman called Sarah Kenter .
	In the Parlor is a man called Alan Wentworth.
	In the Parlor is a woman called Dr Albrecht.
	In the Parlor is a man called David Crow. 
every turn:
	if act III is happening and player is in parlor and score is 14 and guilty is 0:
		say "'I think we have all the clues we need. Who who do you think did it?' asks sarah. (use accuse when ready)";
		move butler to parlor;
	otherwise if act III is happening and player is in parlor:
		say "'I think we can still find more clues, but if you're sure you know who did it, let us know' says sarah. (use accuse when ready)";
		
		
	
[Room 2 Dining room. Contains key hidden in fireplace.]
The dining room is a room. The description is "[if unvisited]You and Sarah talk for a long time, catching up on each others[apostrophe] lives.  After a while, you both get hungry and decide to seek out the other guests and your host.[end if]The dining looks to be modeled after some kind of medival hunting lodge. Insead of a fancy candlelit table is what appears to be a banquet hall. [if act III is happening and fireplace is lit][line break]You notice the fire is significantly smaller as if someone had recently extinguished and relit it.[end if][line break]To the south is the parlor. To the southeast is the lobby."
	
	The table is here. It is scenery. The description is "The dining room table seems to be cut from a single tree. It is dark and thick, not something you'd expect in the home of a millionare. Perhaps it would be found the the home of an eccentric."
	Understand "chairs" as chair.
	The chair is here. It is scenery. The description is "The chairs match the table, You're not sure you could lift one.".
	The fireplace is here. The fireplace can be lit or unlit. the fireplace is lit. The description is "The fire provides a nice warmth all thoughout the room.[if act III is happening] It looks as though it has recently been doused and re-lit."
	
Extinguishing is an action applying to one visible thing. 
understand "fire" as the fireplace.
understand "extinguish" as extinguishing.
understand "douse" as extinguishing.
understand "put out" as extinguishing.
understand "extinguish [thing]" as extinguishing.
understand "douse [thing]" as extinguishing.
understand "put out [thing]" as extinguishing.
carry out extinguishing:
	if the noun is the fireplace:
		If Act III is happening:
			now fireplace is unlit;
			now the loose brick is in the dining room.
Report extinguishing:
	if the noun is the fireplace:
		If Act III is happening:
			say "You put out the fire. You see a loose brick in the back of the fireplace.";
		otherwise if act II is happening:
			say "why make it darker?";
		otherwise:
			say "Putting out someone else's fire seems rude.";
	otherwise:
		say "That cannot be extinguished.";

The loose brick is a container. The description is "a loose brick at the back of the fireplace. It seems a hidden compartment is behind it." 
The loose brick contains the bear key. 
	understand "move loose brick" as "[open loose brick]".


[Room 3]
[The Game room contains the letter from albrecht. It is locked until the player solves the fireplace puzzle in act III. The butler is here.]
The Game Room is a room. "[if unvisited]You enter the game room. 'Oh my god' says Sarah. The butler is lying unconscious on the floor. You shake him awake:[line break][line break]'Are you alright?' you ask. [line break][line break]'The last thing I remember is the lights went out, I was upstairs abot to check on Mr. Vectim. I was attacked from behind, though I don't know by who. Is everything alright?' he asked. [line break][line break]'um.........Vectim's dead' says Sarah. [line break][line break]'A notable look of shock appears on the butler's face. 'What? No, that's impossible! He was in his study just a moment ago!'[line break][line break]'The police are on their way, they'll be here soon' you say. 'Everyone else is waiting in the parlor.'[line break][line break]'I do not trust those three' says the butler. I'll be in here if you need me, trying to get my nerves together.'[line break][line break]'Thats's fine.' says Sarah. [line break][line break][end if]There is a frightening amount of dead and stuffed animals in this room, you presume it's not the kind of game room one would find at a hotel. A Bear stands in one corner, a mountain lion poses across from it. There are a pair of fine leather armchairs across from a wall of books. The lobby is to the west."
	The Billiards table is here. It is a supporter. It is scenery. "There seems to be more than one kind of game in the game room." 
	Understand "Bear" as the bear taxidermy.
	The Bear taxidermy is here. it is scenery. "A frightening taxidermy bear."
	Understand "Lion" as the Mountain Lion taxidermy.
	Understand "Mountain lion" as the Mountain Lion taxidermy.
	The Mountain Lion taxidermy is here. It is scenery. "This must be the taxidermy Wentworth was talking about. It's bigger than you thought."
	The bookshelf is here. the bookshelf is scenery. "Full of literature."
	A Letter is on the billiards table. The description is "This seems to be a correspondance from Dr. Albrecht. In it she warns that the new experimental cell tower has many adverse effects on the environmet and that David Crow is threatening to pull his investment unless Vectim starts manufacturing them. She advises Vectim not to give in to Crow, she also references a more [italic type] personal[roman type] relationship that she may have had with Vectim. It seems to have ended poorly."
	
	
after examining the mountain lion taxidermy:
	say "Inside the mouth of the lion you find a small slilver key.";
	if evidence_wentworth_suspicious is not 0:
		say "This must have been what wentworth was after";
	now the silver key is in the game room. The silver key is a thing. The description is "A small silver key.";
		
after taking the silver key:
	increase the score by two;
	
after examining the letter:
	increase the score by two;
	now evidence_letter is 1;
	if Evidence_estate is not 0:
		say "'It looks like everyone has motive' says sarah";
	otherwise if evidence_inheritance is not 0:
		say "'It looks like everyone has motive' says sarah";
	otherwise:
		say "It looks like both Crow and Albrecht have motive' says Sarah";

[Room 4. A coat room. Contains the penny.]
The Storage Closet is a room. "A coat room. The Lobby is to the west."
	Sarah's coat is in the storage closet. Sarah's coat is closed and openable. 
	The description is "The pocket is closed."
	The penny is in Sarah's coat. 
	Understand "pocket" as coat.

[Room 5 Contains the body. Contains the safe with the evidence. The safe key is in the  Game room]
The Study is a room. "[if unvisited]You and Sarah enter the study. Instantly the smell of blood hits you. Mr Wentworth, Mr Crow and Dr Albrecht are all
 standing around desk.'[line break][line break]What has happened here?' Albrecht asked angrily.[line break][line break]'I don't know!' stammered Wentworth. [line break][line break]'Didn't you go to check on him?' accused Crow.[line break][line break]'No, I stopped by the guest room to look for a light -I was planning on staying the night and going hunting in the morning! I was there the whole time! I just came in here when the lights turned back on!'[line break][line break]'I've called the police.' said Crow, 'but it will be 30 minutes until they get here. In the meantime-'[line break]Crow breaks off as you push in front of him. Mr. Vectim, your host, is dead in his chair.[line break][line break]'I'll take charge here' you say. I'm a private eye. In the meantime, the rest of you should wait in the parlor, try not to touch any evidence. And if any of you see the butler, have him wait there too. Sarah, you should stay with me.'[line break][line break]'This wound is incredibly fresh' you say. He must have been killed when the lights were out.'[line break][line break]'I could use a drink...' mumbles Wentworth.[end if]The study is a smallish room, darkly lit with an ornate red carpet on the floor. Bookshelves cover the far wall. A large desk covered in papers, behind which Mr. Vectim lies. There is a painting of Darkshire manor on the right wall.";
 	The body is in the study. The body is fixed in place. The body is a thing. The description is "Mr. Vectim's body lies slumped over his desk. There is a hunting knife lodged deep in his back.  It is lodged very deep into his back, someone with a lot of upper body strenght must have done this, probably not albrecht."
	The knife is here. The knife is scenery. "The knife was probably owned by Vectim himself. It looks like the kind used for skinning."
	The painting is here. The painting is a openable container. The painting is scenery. The safe is in the painting. The painting is fixed in place. The painting is closed. The description is "The painting seems to have hinges on the back."
	The safe is a container.  The safe is closed and locked. The matching key of the safe is the silver key. The safe is fixed in place. "A safe hidden behind a painting."
	The safe contains the letter of friendship.
	After opening the painting:
		Say "You open the painting, revealing a safe.";
		now the safe is in the study;
		
Before opening the safe:
	if the player holds the silver key:
		try unlocking the safe with the silver key;
			
	The letter of friendship is a thing. The description is "A letter from Mr Vectim to Mr Wentworth. Vectim states that he's worried about Crow trying to take over the company though potentially malicious means. He states that Wentworth the the only one he can trust, and that there is a box of evidence against Crow in a hidden safe at the office. "
	
	after examining letter of friendship:
		let evidence_wentworth_suspicious be -1;
		increase score by 2 ;
		Say "'oh, wow! we have to tell everyone!' says Sarah. 'Lets hurry to the parlor!'";
		
	
	
	Before examining the body:
		increase the score by 2;
		increment evidence_wound;

[Room 6 Hub of Upstairs movement]
Upstairs is a room.  "You can see three rooms. To the East is the Study. To the west is the guest Suite. To the south is Mr. Vectim's bedroom. To the North are the stairs back down."
	North of Upstairs is an open door called Top of Stairs. Through it is Lobby.  
	East of Upstairs is the study . 
	South of Upstairs is the Bedroom. 
	West of Upstairs is the Guest suite. 
	
[Room 7 Contains the safe and the estate clue]
The Bedroom is a room. "A large king size bed is in the center of the room. The room is rather bare otherwise. A large painting hangs on the east wall. The bedroom closet is to the west. The exit is to the north."
	The bedroom closet is here. the bedroom closet is a closed container. The bedroom closet is openable. The bedroom closet is fixed in place. 
	The description is "[if bedroom closet is closed]Mr. Vectim's closet. Full of clothes and maybe clues.[otherwise]Through the suits and hunting jackets you see a safe with a large knob on the front.[end if]".
	The bedroom safe is in the bedroom closet. "The safe is built into the wall. It has a numbered knob on the front."
	
	The bedroom safe is a closed and locked container. The matching key of the bedroom safe is the code. The bedroom safe is fixed in place. 
	The estate will is a thing. the estate will is in the bedroom safe. The description is "A will of what happens to darkshire manor if Mr. Vectim dies. It looks like everything goes to Mr. Wentworth. Suspicous. ".
	the large painting is in the bedroom. The large painting is scenery. the description is "A large painting of a man in a suit, you don't recognise him."

	
Before examining the estate will:
	increase the score by 2;
	increment evidence_estate;
	if evidence_inheritance is not 0:
		say "'It sure looks like wentworth has a lot to gain from Vectim's death' says Sarah."
	
Before opening the bedroom safe:
	if the player carries the code:
		try unlocking bedroom safe with the code;
	
Before unlocking the bedroom safe with the code:
	say "You enter the combination into the safe.";
After unlocking the bedroom safe with the code:
	remove the code from play;
	
[Room 8 Guest suite. contains a clue.]
The Guest suite is a room. "A spare queen bed. Smaller than the master bedroom and much brigher decorations. A single suitcase is open on the floor. "

The dresser is in the guest suite. It is scenery. "An old wooden dresser."
The Inheritance note is on the dresser. "A note stating that Mr. Vectim gives full control of the company to Mr. Wentworth in case anything happens. Could this be what Wentworth was checking on when the lights when out?"
The suitcase is a thing. The suitcase is scenery. "A suitcase belonging to to Mr Wentworth. Just clothes and toiletries, nothing out of the ordinary."


After examining inheritance note:
	if evidence_estate is zero:
		say "'wow, full control of the company' says sarah.";
	otherwise:
		say "'Wow, Wentworth has a lot of motive, doesn't he?' says Sarah";
	increase score by 2;
	
	
	
	

[Room 9-- Basement. Contains switch for turning lights back on.]
Basement is a room. "The Basement is old and musty. Large wooden braces tile the ceiling. It is relatively clutter-free, though there seems to be some hunting equipment and  taxidermy supplies. The exit is to the south."
	The fuse box is here. The fuse box is a switched off device.  
	The description is "The fusebox for the mansion. It looks very old.[if fuse box is switched off] The whole fusebox smells like smoke, you can see the popped fuse. Sarah says 'If we can't find a fuse, I think I have a penny in my coat pocket that we can use for the meantime.' [else]There is a penny jammed in the fusebox[end if]."
	
instead of switching on fuse box:
	if the fuse box is switched on:
		say "It's already on, no need to do that!";
	otherwise if player carries penny:
		say "You turn off the house breaker insert the penny to complete the circuit. Flipping the breaker back on, you hear the lights Upstairs come back on. Don't try this at home.";
		remove penny from play;
		now the fuse box is switched on;
		increase score by 2;
	otherwise:
		say "you don't have any fuses.";
		stop the action;
		
Instead of switching off the fuse box:
	if fuse box is switched off:	
		Say "It's already off";
	otherwise:
		Say "No need to do that";
		
	before inserting penny into fuse box:
		say "You turn off the house breaker insert the penny to complete the circuit. Flipping the breaker back on, you hear the lights Upstairs come back on. Don't try this at home.";
		now fuse box is switched on;
		remove penny from play;
		increase score by 2;
		stop the action;

		
Before going from Basement to Lobby:
	if the fuse box is switched on:
		say "You hear a scream coming from Upstairs. 'What was that?' Sarah asks nervously.";
		move crow to study;
		move wentworth to study;
		move albrecht to study;
		
		
[Room 10 temporary holding spot for out of play characters. Could perhaps use out of play instead.]
Driveway is a room. 
	
[describe scenes---------------------------------------------------------------------------------------------------------------------------------]
[Act I: enter the manor, talk to guests. ]
Act I is a scene. Act I begins when the player is in the lobby. Act I ends when the player is in parlor more than 1 times and  dining room is visited

When Act I begins, say "'The address is One Overlook Court, you'll see it on the left, a little ways after the 50 mile marker on the main road.' You stiffen down on the gas pedal, still another few miles. The message continued: 'and look, I hope you know how much it means to me that you would come all this way out here tonight.  Things have been really tough for me lately -everything falling apart with John and now my dad's back in the hospital and- well you know. And I mean I know it's just some stupid dinner party for work and it'll probably be really boring- Look. I just want to say thanks; You're a really good friend, and you've kept me going these past few weeks. Uh, so yeah....I'll see you later tonight I guess. ' She fumbled with the phone  for a few seconds before finally hanging up. 

Ten minutes later you see the 50 mile marker fly by and ease off the gas.  To the left of the road drops away into a deep valley, to the right a woody incline. This was woodsman and redneck country, why a CEO of a fortune 500 company would live here was beyond you. The rain lightens for just a moment and you can make out an old rusted street sign ahead: 'Overlook ct'.  You slow down and turn right, your tires push off of the wet road and onto the dirt driveway. The path climbs gradually up into the forest, you can see a few tire tracks carved into the muddy road.  Big drops of rain drip off of the canopy of trees above. A few brightly colored leaves dance through the headlights. After about ten minutes of a slow climb, you round the corner to a brilliantly lit stone manor. To the left is a small parking lot, with five cars lined up diagonally. You pull into the free spot at the end, pull your coat over your head as an umbrella and make a quick dash for the door. There is no doorbell but a large polished brass knocker over old mahogany woodwork. You pause for just a second to catch your breath and lift the heavy knocker. After just a few moments, the door is opened and you enter.[bracket] if stuck, try talking to people[close bracket]".
Every turn:
	if the location of Sarah is not the location of the player and player is not in lobby and scene is act I:
		let the way be the best route from the location of Sarah to the location of the player, using doors;
		silently try Sarah going the way;


When Act I Ends:
	move butler to study;
	Say "A bolt of thunder cracks down right outside. With a crack and a fizz the lights quickly dim into darkness.  The room explodes in gasps, and then silence. Aside from the storm, all is quiet. [line break][line break]Dr Albrecht's voice cuts in with in her thick german accent: 'Oh no, oh no no no, I [bold type] hate [roman type] the dark.  I'll be in my car until the lights turn back on.' she said, fumbling her way out the door. 'Butler?' you hear her call though the door. 'Oh where has that man gone?' she mumbles as the front door creeks open and shut. [line break]";
	move dr Albrecht to driveway;
	Say "Sarah pipes up and says, 'don't worry, we'll get the lights back on.' Mr. Wentworth gets up and says 'That sounds lovely, I'll go check on Mr Vectim.' he leaves. David crow says 'I think I'll wait in the dining room, there's light from the fire in there.'";
	move crow to dining room;
	move wentworth to study. 
[test act1 with w/n/s/e]
	
	
	
[Act II: lights out. Player must fix the switchbox.]
Act II is a scene. Act II begins when Act I ends. Act II ends when the player is in the study and the fuse box is switched on. 

When act II begins:
	say "something"

before going from somewhere to somewhere (called destination) :
	if the location of Sarah is not destination:
		let the way be the best route from the location of Sarah to destination, using doors;
		silently try Sarah going the way;
		


[test act2 with "e/open coat/take penny/w/se/switch on fuse box/s/n/e".]

[Act III: Search for clues. Player must search mansion for clues as to who killed Vectim. ]
Act III is a scene. Act III begins when Act II ends. Act III ends when guilty is 1.

When Act III begins:
	move crow to parlor;
	move albrecht to parlor;
	move butler to game room;
	move wentworth to parlor;
	now liquor cabinet is open;
	now liquor cabinet is unlocked;

When act III ends:
	end the story;



[test bear with "w/n/w/take paper/n/douse fire/take key/se/unlock bear door with bear key/ne/talk to butler/read letter/x lion/take key/w/n/w/read note/e/s/open closet/open safe/read will/n/e";
test b2 with "x body/open painting/open safe/read letter of friendship/w/n/w".]


