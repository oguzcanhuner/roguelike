# Ruby Roguelike (name tbc)

![alt text](https://raw.githubusercontent.com/oguzcanhuner/roguelike/master/game.png "Rogue")

From Wikipedia:
> Roguelike is a subgenre of role-playing video games, characterized by procedural level generation, turn-based gameplay, tile-based graphics, permanent death, and typically based on a high fantasy narrative setting


## Setting up
- Clone the repo
- `bundle install`

## Playing
In the root directory:
- `rake`

## What's supported?
Currently you can move the player around a single randomly generated map. You can attack NPCS ("D") by moving into their cells, or manually initiate attacks using "a". Careful, NPCs will fight back!

The game will end when the player dies.

Movement:
 - Left: h
 - Up: j
 - Down: k
 - Right: l
 - Topleft: u
 - Topright: i
 - Bottomleft: n
 - Bottomright: m

 - Attack phase: a
 - Cancel attack: q
 - Exit game: Ctrl C
 

## Testing

Tests are written using rspec and all tests are within the spec folder. To run:
- `rspec`
