-- see LICENSE.txt

modname = minetest.get_current_modname()
modpath = minetest.get_modpath(modname)

-- this read a config file
-- dofile(modpath .. "/_config.txt")

-- include basic nodes files
dofile(modpath.."/functions.lua")
-- load *test* nodes
-- dofile(modpath.."/test.lua")
-- load real nodes
dofile(modpath.."/bricks.lua")


-- register simple nodes
add_simple_nodes(get_simple_nodes())


