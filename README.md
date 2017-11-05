# bloqus_brick
Minetest mod for adding fancy bricks blocks

### install
Simply copy inside mods directory and enable it

### files
* init.lua: ba
* functions.lua: collection of useful functions
* bricks.lua: nodes definitions
* test.lua: nodes definitions used during develpment for testing, normally unused
* generate_test.sh: bash script for generating "test.lua"

### generate_test.sh instruction
If you wish to use generate_test.sh for testing other textures or in other mods, here are how to use it:
* copy your texture in the textures directory
* go to the mod directory
* launch ./generate_test.sh
* a file called test.lua is generated: it define a function returning an array of nodes, using the filename of every texture as a base, doing some basic operations:
  * ".png" will be removed
  * if the filename ends with "-sp", "-sp" is removed in node name and description, and the node is registered with stairsplus
  * "-" will become space in description and _ in node name
  * "test_" will be added to the node name
so "something-very-good.png" will become a node "something very good" identified by "bloqus_bricks:test_something_very_good", and "something-sloppy-sp.png" will become a node "something sloppy" identified by "bloqus_bricks:test_something_sloppy" and is registered with stairsplus so you can use it in saw and have slopes, etc
non-png files will be ignored

in init.lua find this lines and comment the dofile (this will prevent loading real blocks)
```
-- load real nodes
dofile(modpath.."/bricks.lua")
```
and then uncomment this dofile (this will load test nodes)
```
-- load *test* nodes
-- dofile(modpath.."/test.lua")
```
