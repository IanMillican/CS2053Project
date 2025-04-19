# CS2053-TheGame
This game was created by Ian Millican, Jonathan Eddie and Logan Lavigne. It involves 6 levels (1 to 5 and a final boss) and has cut scenes between each.
## Cut Scenes
All cut scenes are static with dialogue boxes that are the characters interacting with eachother. We used buttons labeled "Next" or "Continue" to go through the dialogue. When the dialogue is done, clicking the button will take you to the next level.
## Main Menu
The main menu is very basic but it is where we start. It has the Godot logo and the creators names. The start game button when clicked will take you to level 1. 
This menu was created by Ian Millican.
## Level 1 - Dodge the Creeps
This level is meant to be similar to Lab 1. Instead of being 3D it is 2D and instead of squashing the creeps, we fire red projectiles at the instructor. Moving on screen is done with the arrow keys and firing the projectile is done with the space bar. the projectiles and the instructors, if they go off screen, disapprear. For the player we incorporated screen wrapping so you can go off screen and simply appear on the other side. 
This level was created by Ian Millican
## Level 2 - Pac-Man
This level is similar to Lab 2. We are still 2D but the game is made in a more similar manor to the traditional PacMan game. We have 4 ghosts (Pinky, Inky, Blinky, and Clyde) and they each have they're own objectives in the game. These objectives are simply different points they are trying to reach. We included a navigation region in this level to model paths they are allowed to take and each ghost (the instructor) has a navigation agent as a child node. These are used to track where the target is each frame (the target is relative to the palyers postion and sometimes other ghosts positions) and find the best path to get there. The entrance and exit of the map are wrapped, but when you've met the win condition a green exit sign will appear and moving through that exit will take you to the next cut scene. 
This level was created by Ian Millcan
## Level 3 - Mario
This level is a 3D Mario level. You can only walk forwards no side to side or back and this is done with the 'w' key. You have to jump from 1 pipe to the next and make it all the way to the bottom. You can't skip a pipe, you must hit all of them. When at the bottom, the center black door way has a hole you can't see but you have to walk over it and fall in. If you walk off the edge at the bottom that is also a lose and the level will reset.
This level was created by Jonathan Eddie
## Level 4 - Jet
Add Level Info after merging Branches
This level was created by Logan Lavigne
## Level 5 - Ball
Add Level Info after merging Branches
This level was created by Logan Lavigne
## Level 6 - Final Boss
Add Level Info after merging Branches
This level was created by 
