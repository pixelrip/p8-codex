pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- simple collision detection

function _init()
	player={
		spr=1,
		x=60,
		y=100, 
		hb={
			x1=0,
			y1=0,
			x2=7,
			y2=7}
	}

	enemy={
		spr=2,
		x=60,
		y=100,
		hb={
			x1=0,
			y1=0,
			x2=7,
			y2=7}
	}
	
	collisions=0
	is_showing_hitbox=false
end

function _update()
	
	-- move enemy
	enemy.y+=2
	
	if enemy.y>128 then 
		enemy.y=-8
		enemy.x=rnd(116)
	end
	
	-- check for collisions
	if collided(enemy,player) then
	 collisions+=1
	end


	-- player controls	
	if(btn(⬅️)) player.x-=2
	if(btn(➡️)) player.x+=2
	if(btn(⬆️)) player.y-=2
	if(btn(⬇️)) player.y+=2
	
	if btn(❎) then
		is_showing_hitbox = true
	else
		is_showing_hitbox = false
	end
end

function _draw()
	cls(1)
	spr(player.spr,player.x,player.y)
	spr(enemy.spr,enemy.x,enemy.y)
	print("hold ❎ to show hitboxes", 2, 2, 7)
	print("collisions: "..collisions,64,120,7)

	if is_showing_hitbox then
		draw_hitboxes(enemy)
		draw_hitboxes(player)
	end
end


function collided(a,b)
	-- find top,bot,lef,rig
	local a_top=a.y+a.hb.y1
	local a_bot=a.y+a.hb.y2
	local a_lef=a.x+a.hb.x1
	local a_rig=a.x+a.hb.x2
	
	local b_top=b.y+b.hb.y1
	local b_bot=b.y+b.hb.y2
	local b_lef=b.x+b.hb.x1
	local b_rig=b.x+b.hb.x2

	-- rule out collsions
 if(a_top>b_bot) return false
 if(b_top>a_bot) return false
	if(a_lef>b_rig) return false	
	if(b_lef>a_rig) return false
	
	return true
end

function draw_hitboxes(obj)
	local y1=obj.y+obj.hb.y1
	local y2=obj.y+obj.hb.y2
	local x1=obj.x+obj.hb.x1
	local x2=obj.x+obj.hb.x2
	
	rect(x1,y1,x2,y2,10)
end
__gfx__
000000000c0000c00080080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000c00c000888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000cccccc08088880800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000c0cc0c08888888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000cccccc08888888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070000c00c000888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000c00c000088880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000c0000c00800008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888eeeeee888888888888888888888888888888888888888888888888888888888888888888888888ff8ff8888228822888222822888888822888888228888
8888ee888ee88888888888888888888888888888888888888888888888888888888888888888888888ff888ff888222222888222822888882282888888222888
888eee8e8ee88888e88888888888888888888888888888888888888888888888888888888888888888ff888ff888282282888222888888228882888888288888
888eee8e8ee8888eee8888888888888888888888888888888888888888888888888888888888888888ff888ff888222222888888222888228882888822288888
888eee8e8ee88888e88888888888888888888888888888888888888888888888888888888888888888ff888ff888822228888228222888882282888222288888
888eee888ee888888888888888888888888888888888888888888888888888888888888888888888888ff8ff8888828828888228222888888822888222888888
888eeeeeeee888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11ee1ee1111111111661166616661616117111711111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1e1e1e1e111111111616161616161616171111171111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1e1e1e1e111111111616166116661616171111171111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1e1e1e1e111111111616161616161666171111171111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1ee11e1e111116661666161616161666117111711111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11711111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11171111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11171111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11171111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11711111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
16111666161616661666111111661666166611111666161116661616166616661111161611111666161116661616166616661111161611711111111111111111
16111616161616111616111116111616161611111616161116161616161116161111161611111616161116161616161116161111161611171111111111111111
16111666166616611661111116661666166111111666161116661666166116611111116111111666161116661666166116611111166611171111111111111111
16111616111616111616111111161611161611711611161116161116161116161111161611711611161116161116161116161111111611171111111111111111
16661616166616661616117116611611161617111611166616161666166616161171161617111611166616161666166616161171166611711111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
16611666166616161111116616661666111116661661166616661616111116161111166616611666166616161111161611711111111111111111111111111111
16161611166616161111161116161616111116111616161116661616111116161111161116161611166616161111161611171111111111111111111111111111
16161661161616661111166616661661111116611616166116161666111111611111166116161661161616661111166611171111111111111111111111111111
16161611161611161111111616111616117116111616161116161116111116161171161116161611161611161111111611171111111111111111111111111111
16161666161616661171166116111616171116661616166616161666117116161711166616161666161616661171166611711111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11711c1c1c1c11cc1c111cc1111111ccccc111111ccc11cc111111cc1c1c11cc1c1c11111c1c1ccc1ccc1ccc11cc1c1c1ccc11cc1c1c111111111ccc11111111
17111c1c1c1c1c1c1c111c1c11111cc1c1cc111111c11c1c11111c111c1c1c1c1c1c11111c1c11c111c11c1c1c1c1c1c1c111c111c1c11111111111c11111111
171111111ccc1c1c1c111c1c11111ccc1ccc111111c11c1c11111ccc1ccc1c1c1c1c11111ccc11c111c11cc11c1c11c11cc11ccc1111111111111ccc11111111
171111111c1c1c1c1c111c1c11111cc1c1cc111111c11c1c1111111c1c1c1c1c1ccc11111c1c11c111c11c1c1c1c1c1c1c11111c1111117111111c1111711111
117111111c1c1cc11ccc1ccc111111ccccc1111111c11cc111111cc11c1c1cc11ccc11111c1c1ccc11c11ccc1cc11c1c1ccc1cc11111171111111ccc17111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111118888811111111111
11711c1c11cc11cc1c111c111ccc11cc1ccc11cc1cc111cc111111111c1c11111111116611661611161116661166166611661661116611118ccc81111cc11ccc
17111c1c1c111c1c1c111c1111c11c1111c11c1c1c1c1c1111c111111c1c11111111161116161611161111611611116116161616161111118c8c811111c1111c
171111111c111c1c1c111c1111c11ccc11c11c1c1c1c1ccc11111111111111111111161116161611161111611666116116161616166611118c8c811111c11ccc
171111111c111c1c1c111c1111c1111c11c11c1c1c1c111c11c1111111111111111116111616161116111161111611611616161611161171818c817111c11c11
1171111111cc1cc11ccc1ccc1ccc1cc11ccc1cc11c1c1cc11111111111111171117111661661166616661666166116661661161616611711171c87111ccc1ccc
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111771111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111777111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111777711111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111771111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111117111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111166161611661616166616611166111116161666166616661166161611111eee1e1e1eee1ee1111111111111111111111111111111111111111111111111
111116111616161616161161161616111111161611611161161616161616111111e11e1e1e111e1e111111111111111111111111111111111111111111111111
111116661666161616161161161616111111166611611161166116161161111111e11eee1ee11e1e111111111111111111111111111111111111111111111111
111111161616161616661161161616161111161611611161161616161616111111e11e1e1e111e1e111111111111111111111111111111111111111111111111
166616611616166116661666161616661666161616661161166616611616111111e11e1e1eee1e1e111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111616166616661666116616161666116611711666166116661666161611711111111111111111111111111111111111111111111111111111111111111111
11111616116111611616161616161611161117111611161616111666161611171111111111111111111111111111111111111111111111111111111111111111
11111666116111611661161611611661166617111661161616611616166611171111111111111111111111111111111111111111111111111111111111111111
11111616116111611616161616161611111617111611161616111616111611171111111111111111111111111111111111111111111111111111111111111111
16661616166611611666166116161666166111711666161616661616166611711111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111616166616661666116616161666116611711666161116661616166616661171111111111111111111111111111111111111111111111111111111111111
11111616116111611616161616161611161117111616161116161616161116161117111111111111111111111111111111111111111111111111111111111111
11111666116111611661161611611661166617111666161116661666166116611117111111111111111111111111111111111111111111111111111111111111
11111616116111611616161616161611111617111611161116161116161116161117111111111111111111111111111111111111111111111111111111111111
16661616166611611666166116161666166111711611166616161666166616161171111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11ee1ee1111111661166161116111666166116661661117116661111166611711111111111111111111111111111111111111111111111111111111111111111
1e1e1e1e111116111616161116111161161616111616171116161111161611171111111111111111111111111111111111111111111111111111111111111111
1e1e1e1e111116111616161116111161161616611616171116661111166111171111111111111111111111111111111111111111111111111111111111111111
1e1e1e1e111116111616161116111161161616111616171116161171161611171111111111111111111111111111111111111111111111111111111111111111
1ee11e1e111111661661166616661666166616661666117116161711166611711111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1dd11dd111111ddd11dd1ddd11111ddd11dd1ddd11111d111ddd1ddd11111ddd1ddd11dd11111111111111111111111111111111111111111111111111111111
1d1d1d1d111111d11d1d1d1d11111d1d1d1d11d111111d111d111d1111111d1d11d11d1111111111111111111111111111111111111111111111111111111111
1d1d1d1d111111d11d1d1ddd11111dd11d1d11d111111d111dd11dd111111dd111d11d1111111111111111111111111111111111111111111111111111111111
1d1d1d1d111111d11d1d1d1111d11d1d1d1d11d111d11d111d111d1111d11d1d11d11d1d11111111111111111111111111111111111111111111111111111111
1d1d1ddd111111d11dd11d111d111ddd1dd111d11d111ddd1ddd1d111d111d1d1ddd1ddd11111111111111111111111111111111111111111111111111111111
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
82888222822882228888828882828882822882228228888888888888888888888888888888888888888888888222822282228882822282288222822288866688
82888828828282888888828882828828882882828828888888888888888888888888888888888888888888888882888282828828828288288282888288888888
82888828828282288888822282228828882882828828888888888888888888888888888888888888888888888822882282828828822288288222822288822288
82888828828282888888828288828828882882828828888888888888888888888888888888888888888888888882888282828828828288288882828888888888
82228222828282228888822288828288822282228222888888888888888888888888888888888888888888888222822282228288822282228882822288822288
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
