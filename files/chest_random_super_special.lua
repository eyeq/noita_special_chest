dofile_once("mods/special_chest/files/perk_special.lua")

function drop_random_reward( x, y, entity_id )
	-- local set_rnd = set_rnd_ or true
	local set_rnd = true
	if( set_rnd ) then
		SetRandomSeed( GameGetFrameNum(), x + y + entity_id )
	end

	local dx = -20 * 4
	for _ = 1, 8 do
		local random_perk = get_random_from(perk_list)
		perk_spawn_special( x + Random(-10,10) + dx, y - 4 + Random(-10,10), random_perk.id)

		dx = dx + 20
	end
end

function drop_money( entity_item )
	
	-- 
end

function on_open( entity_item )
	local x, y = EntityGetTransform( entity_item )
	local rand_x = x
	local rand_y = y

	-- PositionSeedComponent
	local position_comp = EntityGetFirstComponent( entity_item, "PositionSeedComponent" )
	if( position_comp ) then
		rand_x = tonumber(ComponentGetValue( position_comp, "pos_x") )
		rand_y = tonumber(ComponentGetValue( position_comp, "pos_y") )
	end

	SetRandomSeed( rand_x, rand_yy )

	EntityLoad("data/entities/particles/image_emitters/chest_effect.xml", x, y)

	-- money
	-- card
	-- potion
	-- wand
	-- bunch of spiders
	-- bomb
	drop_random_reward( x, y, entity_item )
end

function item_pickup( entity_item, entity_who_picked, name )
	GamePrintImportant( "$log_chest", "" )
	-- GameTriggerMusicCue( "item" )

	--if (remove_entity == false) then
	--	EntityLoad( "data/entities/misc/chest_random_dummy.xml", x, y )
	--end

	on_open( entity_item )
	
	EntityKill( entity_item )
end

function physics_body_modified( is_destroyed )
	-- GamePrint( "A chest was broken open" )
	-- GameTriggerMusicCue( "item" )
	local entity_item = GetUpdatedEntityID()
	
	on_open( entity_item )

	edit_component( entity_item, "ItemComponent", function(comp,vars)
		EntitySetComponentIsEnabled( entity_item, comp, false )
	end)
	
	EntityKill( entity_item )
end