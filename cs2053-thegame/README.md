# CS2053-TheGame
This game was created by Ian Millican, Jonathan Eddie and Logan Lavigne. It involves 6 levels (1 to 5 and a final boss) and has cut scenes between each.
## Cut Scenes
All cut scenes are static with dialogue boxes that are the characters interacting with eachother. We used buttons labeled "Next" or "Continue" to go through the dialogue. When the dialogue is done, clicking the button will take you to the next level. Cut scenes to the next level were created by the person who made the current level.
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
This level is a 3D Mario level. You can control your character using the "wasd" keys, and control the direction your character faces using the mouse. You have to jump from pipe to pipe in order, or the level resets. You can't skip a pipe, you must hit all of them. When at the bottom, the center black door way has a hole you can't see but you have to walk over it and fall in (reference to hidden levels in original mario games). If you walk off the edge at the bottom that is also a lose condition and the level will reset. Note when falling on a pipe a collision has to occur, sometimes simply falling on it won't trigger it, try to walk on the pipe a little before going to the next.
This level was created by Jonathan Eddie
## Level 4 - Jet
This level is similar to labs 4 and 5. We have obstacles we need to fly through in order to pass but some are now moving. In addition to that it is required that you shoot a barrier in each obstacle before pasing through it, this is done with the space bar. Controlling the plane, that is ascending and descending and rolling left to right, is done with the arrow keys. The goal is to simply make it to the end of the tunnel.
This level was created by Logan Lavigne
## Level 5 - Ball
This level the ball has a constant forward velocity. left to right is controlled with the arrow keys. You need to avoid hitting the barriers and make it to the end of the tunnel to pass. there are ramps and moving barriers here. You'll lose if your grade drops below 0.
This level was created by Logan Lavigne
## Level 6 - Final Boss
The final boss fight is a turn based 2d perspective fight based off of the old pokemon games (pokemon blue, red and yellow).  Each turn you would select your attack by choosing one of the corresponding buttons below, which would be followed by the profs turn. Winning condition is having the bosses health reduce to 0 and the losing condition is the players health reducing to 0.
This level was created by Logan Lavigne
## Git Work
We used Git and GitHub to manage the different components of the game. Once everyone finished their components Ian went through and merged everything. This involved handling merge conflicts and ensuring smooth transitions between levels and things such as project settings didn't get messed up during the merge.
## Note
The git merging was done on a Mac, we are not sure if it is possible for errors to occur from this but there was the occasional screen sizing issues for Jonathan as well as level 1 mobs not spawning but that also resolved itself. Jonathan is on a rather old windows laptop while Ian and Logan are on newer Macs so we don't know if it was the fact that Jonathan is on a windows laptop or that it's old but wanted to leave the note here as we know you use a windows laptop.
