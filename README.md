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


## Contributing

Please first read the Code of Conduct which can be found here https://github.com/oguzcanhuner/roguelike/wiki/Code-of-Conduct and ensure that all of your interactions with the project are in line with the contents.

You can find a list of todos in the issues section or suggest a feature by opening your own issue with a description of the feature that you'd like implemented.

Once you've picked an issue, indicate that you're going to work on it (by commenting on the issue). Then go through the following to set up your environment and start coding.
- Fork the project on Github
- Install development dependencies (bundle install and appraisal install)
- Create a topic branch for your changes
- Write some tests for your changes (where appropriate)
- Ensure that all tests pass (rspec)
- Create a pull request on Github 

If you need any help with any part of this, please don't hestiate to create an issue or tweet/dm the maintainer at @oguzcanhuner. Enjoy :)


