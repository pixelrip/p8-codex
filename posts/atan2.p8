pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- aiming with atan2

function _init()	
	init_guy()
	init_enemy()
	init_bullets()
end

function _update()
	update_guy()
	update_bullets()
	update_enemy()
end

function _draw()
	cls(1)
	draw_guy()
	draw_bullets()
	draw_enemy()
	
	print("press ❎ to fire", 4,4,7)
end



-->8
-- guy

function init_guy()
	guy={
		spr=1,
		x=16,
		y=16
	}
end

function update_guy()
	
	if (btn(0,0)) guy.x-=1
	if (btn(1,0)) guy.x+=1
	if (btn(2,0)) guy.y-=1
	if (btn(3,0)) guy.y+=1

	if (btnp(❎)) fire_bullet(guy,enemy)

end

function draw_guy()
	draw_sprite(guy)
end
-->8
-- enemy

function init_enemy()
	enemy={
		spr=2,
		x=60,
		y=60
	}
end

function update_enemy()
	if (btn(0,1)) enemy.x-=1
	if (btn(1,1)) enemy.x+=1
	if (btn(2,1)) enemy.y-=1
	if (btn(3,1)) enemy.y+=1
end

function draw_enemy()
	draw_sprite(enemy)
end
-->8
-- bullets

function init_bullets()
	bullets={}
end

function update_bullets()
	for bt in all(bullets) do
		bt.x += sin(bt.ang) * bt.speed 
		bt.y += cos(bt.ang) * bt.speed
	end
end

function draw_bullets()
	for bt in all(bullets) do
		draw_sprite(bt)
	end
end

function fire_bullet(src,tgt)
	local bt={}
	bt.spr=3
	bt.x=src.x
	bt.y=src.y
	
	bt.ang=get_angle(src,tgt)
	bt.speed=2
		
	add(bullets,bt)	
end

-->8
-- helpers

function get_angle(src,tgt)
	local y2=tgt.y  --target.y
	local x2=tgt.x  --target.x

	local y1=src.y  --source.y
	local x1=src.x  --source.x

	return atan2(y2-y1,x2-x1)
end

function draw_sprite(obj)
	local s=obj.spr
	local x=obj.x
	local y=obj.y
	
	spr(s,x,y)
end
__gfx__
00000000090000900080080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000009009000888888000099000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000999999080888808009aa900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000090990908888888809a77a90000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000099999908888888809a77a90000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000090090008888880009aa900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000009009000088880000099000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000090000900800008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
