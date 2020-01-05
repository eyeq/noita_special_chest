
function init( x, y, w, h )
	temple_random( x, y )

	SetRandomSeed( x, y )
	local randomtop = Random(1, 50)
	
	LoadPixelScene( "data/biome_impl/temple_wall_top.png", "", x, y-30, "data/biome_impl/temple_wall_top_background.png", true )
	
	if (randomtop == 5) then
		LoadPixelScene( "data/biome_impl/temple_altar_top_water.png", "", x, y-40, "", true )
	elseif (randomtop == 8) then
		LoadPixelScene( "data/biome_impl/temple_altar_top_blood.png", "", x, y-40, "", true )
	elseif (randomtop == 11) then
		LoadPixelScene( "data/biome_impl/temple_altar_top_oil.png", "", x, y-40, "", true )
	elseif (randomtop == 13) then
		LoadPixelScene( "data/biome_impl/temple_altar_top_radioactive.png", "", x, y-40, "", true )
	elseif (randomtop == 15) then
		LoadPixelScene( "data/biome_impl/temple_altar_top_lava.png", "", x, y-40, "", true )
	else
		LoadPixelScene( "data/biome_impl/temple_altar_top.png", "", x, y-40, "", true )
	end
	
	LoadPixelScene( "data/biome_impl/temple_altar.png", "data/biome_impl/temple_altar_visual.png", x, y-40+300, "data/biome_impl/temple_altar_background.png", true )



	-- modified start --
	if (Random(1, 3000) == 1) then
		EntityLoad("mods/special_chest/items/chest_random_super_special.xml", x, y - 200)
	else
		EntityLoad("mods/special_chest/items/chest_random_special.xml", x, y - 200)
	end
	-- modified end --
end
