-- see LICENSE.txt
--
-- generic functions

-- generate nodes within using an array
-- array format: node description, node name, node side texture, node up and down texture

function add_simple_nodes(simple_nodes)
    for _, row in ipairs(simple_nodes) do
        local desc = row[1]
        local name = row[2]
        local texture_side = row[3]
        local texture_updown = row[4]
        if texture_updown == "" then
            texture_updown = texture_side
        end
        -- node
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
            paramtype2 = "facedir",
        })
    end
end
