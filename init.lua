--doorbell mod
minetest.register_node("doorbell:doorbell",{
	tiles = {"deurbel.png"},
	description = "doorbell",
	on_punch = function(pos)
		minetest.sound_play("deurbel1")
		minetest.set_node(pos, {name = "doorbell:doorbell"})
	end,
})

minetest.register_craft({
	output = '"doorbell:doorbell" 1',
	recipe = {
		{'default:book', 'default:book', 'default:book'},
	}
})

minetest.register_tool("doorbell:delete", {
	inventory_image = "kapot.png",
	description = "delete",
	on_use = function (itemstack, user, pointed_thing)
        local position = minetest.get_pointed_thing_position(pointed_thing)
        if pointed_thing.type == "node" then
            if position then
                minetest.dig_node(position)
            end
        end
        return nil
    end,
})

minetest.register_craft({
	output = '"doorbell:delete" 1',
	recipe = {
		{'doorbell:doorbell'},
	}
})