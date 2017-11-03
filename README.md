# bloqus_brick
Minetest mod for adding fancy bricks blocks

### generate_test.sh instruction
* copy your texture in the textures directory
* go to the mod directory
* launch ./generate_test.sh
* a file called test.lua is generated: it define a function returning an array of nodes, using the filename of every texture as a base, doing some basic operations:
  * ".png" will be removed
  * "-" will become space in description and _ in node name
  * "test_" will be added to the node name
  so "something-very-good.png" will become a node "something very good" identified by "test_something_very_good"


