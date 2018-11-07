-- see LICENSE.txt
--
-- generic functions

-- generate nodes within using an array
-- array format: 
--   1: node description, 
--   2: node name, 
--   3: node side texture, 
--   4: node up and down texture or "" (in this case side texture is used)
--   5: if 1, register node with stairsplus

function add_simple_nodes(simple_nodes)
    for _, row in ipairs(simple_nodes) do
        local desc = row[1]
        local name = row[2]
        local texture_side = row[3]
        local texture_updown = row[4]
        if texture_updown == "" then
            texture_updown = texture_side
        end
        local register_stairsplus = row[5]
        -- node structure
        local node = {
            description = desc,
            tiles = {
                texture_updown..".png",
                texture_updown..".png",
                texture_side..".png",
                texture_side..".png",
                texture_side..".png",
                texture_side..".png",
            },
            groups = {cracky=1},
            paramtype = "light",
            paramtype2 = "facedir"
        }
        -- node name
        local nodename = modname..":"..name
        -- register in minetest
        minetest.register_node(nodename, node)
        --[[
        minetest.register_node(modname..":"..name, {
            description = desc,
            tiles = {
                texture_updown..".png",
                texture_updown..".png",
                texture_side..".png",
                texture_side..".png",
                texture_side..".png",
                texture_side..".png",
            },
            groups = {cracky=1},
            paramtype = "light",
        })
        --]]
        -- if moreblocks module is enabled register 
        if minetest.get_modpath("moreblocks") and register_stairsplus == 1 then  
            node.sunlight_propagates = true
            stairsplus:register_all(modname, name, nodename, node)
        end
    end
end
