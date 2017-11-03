-- see LICENSE.txt
--
-- add nodes for basic materials

-- define simple nodes (no complex textures, light and facedir params)
local simple_nodes = {}

-- format: node description, node name, node side texture, node up and down texture
simple_nodes = {
    {"blue bricks"      , "blue_bricks"   , "bricks_blue"   , ""},
    {"chipped bricks"   , "chipped_bricks", "bricks_chipped", ""},
    {"dark green bricks", "dark_green_bricks", "bricks_dark_green", ""},
    {"oblique bricks"   , "oblique_bricks", "bricks_oblique", ""},
    {"square bricks"    , "square_bricks" , "bricks_square", ""},
    {"vertical stone bricks" , "vertical_stone_bricks", "bricks_vertical_stone", ""},
    {"natural bricks"   , "natural_bricks", "bricks_natural", ""},
    {"old bricks"       , "old_bricks"    , "bricks_old", ""},
    {"blue square bricks","blue_square_bricks", "bricks_square_blue", ""},

    {"tiled blocks"  , "tiled_blocks"  , "tiled_blocks"  , ""},
    {"rusty concrete", "rusty_concrete", "rusty_concrete_wall"  , "concrete"},
    {"klinker"       , "klinker"       , "klinker", ""},
    {"path"          , "path"          , "path", ""},
    {"little columns", "little_columns", "little_columns", ""}, -- need a top texture

    {"blue cobble" , "blue_cobble", "cobble_blue", ""},
    {"color cobble", "color_cobble", "cobble_color", ""},
    {"stones cobble","stones_cobble","cobble_stones", ""},

    {"copper plates" , "copper_plates", "plates_copper", ""},
    {"hexagon plates", "hexagon_plates", "plates_hexagon", ""},
    {"romboid plates", "romboid_plates", "plates_romboids", ""},
    {"circular plates", "circular_plates", "plates_circular", ""},
    {"irregular plates", "irregular_plates", "plates_irregular", ""},

    {"rocks 1", "rocks_1", "rocks1", ""},
    {"rocks 2", "rocks_2", "rocks2", ""},
    {"rocks 3", "rocks_3", "rocks3", ""},
    {"rocks 4", "rocks_4", "rocks4", ""},
    {"rocks 5", "rocks_5", "rocks5", ""},

    {"decorative circles"   , "decorative_circles", "decorative_circles", ""},
    {"decorative rectangles", "decorative_rectangles", "decorative_rectangles", ""},

    {"brown marble"          , "brown_marble", "marble_brown", ""},
    {"white and brown marble", "wb_marble", "marble_white_brown", ""},

    {"bolted metal"      , "bolted_metal", "metal_bolted", ""},
    {"metal rusted plate", "metal_rusted_plate", "metal_rusted_plate", ""},
    {"rusty metal"       , "rusty_metal", "metal_rusty", ""},
    {"metal plates dark" , "metal_plates_dark", "metal_plates_dark", ""},
    {"ventilation grid"  , "ventilation_grid", "ventilation_grid", ""},

    {"blue and white mosaic"   , "mosaic_blue_white", "mosaic_blue_white", ""},
    {"diamonds mosaic"         , "diamonds_mosaic", "mosaic_diamonds", ""},
    {"green squares mosaic"    , "green_squares_mosaic", "mosaic_squares_green", ""},
    {"sun mosaic"              , "sun_mosaic", "mosaic_sun", ""},
    {"black and white mosaic"  , "bw_mosaic", "mosaic_bw", ""},

    {"mossy damaged concrete", "mossy_damaged_concrete", "mossy_damaged_concrete", ""},
    {"mossy tiles"           , "mossy_tiles", "mossy_tiles", ""},
    {"mossy bricks"          , "mossy_bricks", "mossy_bricks", ""},

    {"basalt stones"      , "basalt_stones", "stone_basalt", ""},
    {"damaged brown stone", "damaged_brown_stone", "stone_brown_damaged", ""},
    {"brown stones"       , "brown_stones", "stone_brown", ""},
    {"colored stones"     , "colored_stones", "stone_colored", ""},
    {"composite stones"   , "composite_stones", "stone_composite", ""},
    {"grassy stones 1"    , "grassy_stones_1", "stone_grassy_1", ""},
    {"grassy stones 2"    , "grassy_stones_2", "stone_grassy_2", ""},
    {"circular stones"    , "circular_stones", "stone_circular", ""},
    {"tundra stone"       , "tundra_stone", "stone_tundra", ""},

    {"wall with plants", "wall_plants", "wall_plants", ""},
}

-- generate nodes

function add_simple_nodes(simple_nodes) {
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
