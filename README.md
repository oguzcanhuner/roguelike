# Ruby Roguelike (name tbc)

![alt text](https://raw.githubusercontent.com/oguzcanhuner/roguelike/master/game.png "Rogue")

From wikipedia:
> Roguelike is a subgenre of role-playing video games, characterized by procedural level generation, turn-based gameplay, tile-based graphics, permanent death, and typically based on a high fantasy narrative setting


## Setting up
- Clone the repo
- `bundle install`

## Playing
In the root directory:
- `ruby bin/play`

## What's supported?
Currently you can only move the player around a single randomly generated map. The map includes some NPCs who move around randomly.

Movement:
 - Left: h
 - Up: j
 - Down: k
 - Right: l
 

## Testing

Tests are written using rspec and all tests are within the spec folder. To run:
- `rspec`
