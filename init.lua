-- see LICENSE.txt

modname = minetest.get_current_modname();
modpath = minetest.get_modpath(modname)

-- include basic nodes files
dofile(modpath.."/bricks.lua")
