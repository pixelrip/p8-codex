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
		pos={x=16,y=16},
		vel={x=0,y=0}
	}
end

function update_guy()
	guy.vel.x=0
	guy.vel.y=0
	
	if (btn(⬅️)) guy.vel.x=-1
	if (btn(➡️)) guy.vel.x=1
	if (btn(⬆️)) guy.vel.y=-1
	if (btn(⬇️)) guy.vel.y=1

	if (btnp(❎)) fire_bullet(guy,enemy)

	move(guy)
end

function draw_guy()
	draw_sprite(guy)
end
-->8
-- enemy

function init_enemy()
	enemy={
		spr=2,
		pos={x=60,y=60},
		vel={x=0,y=0}
	}
end

function update_enemy()
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
		move(bt)
	end
end

function draw_bullets()
	for bt in all(bullets) do
		draw_sprite(bt)
	end
end

function fire_bullet(src,tgt)
	local ang=get_angle(src,tgt)
	local vx=sin(ang)*2
	local vy=cos(ang)*2
	
	local bt={}
	bt.spr=3
	bt.pos={
		x=src.pos.x,
		y=src.pos.y
	}
	bt.vel={
		x=vx,
		y=vy
	}
	
	add(bullets,bt)	
end

-->8
-- helpers

function get_angle(src,tgt)
	local y2=tgt.pos.y  --target.y
	local x2=tgt.pos.x  --target.x

	local y1=src.pos.y  --source.y
	local x1=src.pos.x  --source.x

	return atan2(y2-y1,x2-x1)
end

function move(obj)
	obj.pos.x+=obj.vel.x
	obj.pos.y+=obj.vel.y
end

function draw_sprite(obj)
	local s=obj.spr
	local x=obj.pos.x
	local y=obj.pos.y
	
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
