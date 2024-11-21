pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
--[[-----------------------][--

object movement w/ sin()+cos()

http://pixel.rip/codex

--][-----------------------]]--

function _init()
	angle = 0
	speed = 2.5
	
	init_guy() 
end

function _update()
	update_guy()

	update_angle()
	update_speed()

	if btnp(❎) then
		start_guy()
	end
end

function _draw()
	cls(1)
	draw_grid()
	draw_guy()
	print("⬆️⬇️ ang: "..angle,1,10,7)
	print("⬅️➡️ spd: "..speed)
	print("  ❎ move")
end


------------------------------
-- use sin() to move x
-- use cos() to move y
------------------------------

function move(obj)
	if (not obj.moving) return
	
	local ang=obj.ang
	local sx, sy = obj.sx, obj.sy

	obj.x+=sin(ang)*sx
	obj.y+=cos(ang)*sy
end


------------------------------
-- ⬅️➡️ adjust angle by 1/32
------------------------------

function update_angle()
	if (guy.moving) return	

	if (btnp(2,0)) angle+=0.03125
	if (btnp(3,0)) angle-=0.03125
	angle = mid(0, angle, 1)	
end


------------------------------
-- ⬆️⬇️ adjust speed by 1/4
------------------------------

function update_speed()
	if (guy.moving) return
 
	if (btnp(0,0)) speed-=0.25
	if (btnp(1,0)) speed+=0.25
	speed = mid(0.25,speed,5)
end

-->8
-- guy

function init_guy()
	guy={
		spr=1,					--sprite
		x=60,						--x position on screen
		y=60,						--y position on screen
		sx=speed,  --x speed
		sy=speed,  --y speed
		ang=angle,
		moving=false
	}
end

function update_guy()
	-- sync guys properties 
	-- to global angle and speed
	guy.ang=angle
	guy.sx=speed
	guy.sy=speed

	-- reset if guy leaves screen	
	if guy.x<-8 or guy.x>128 or guy.y<-8 or guy.y>128 then
		reset_guy()
	end
	
	move(guy)
end

function draw_guy()
	local s=guy.spr
	local x=guy.x
	local y=guy.y
	
	spr(s,x,y)
end

function reset_guy()
		guy.x=60
		guy.y=60
		guy.moving = false
end

function start_guy()
	guy.moving = true
end
-->8
-- background grid

function draw_grid()
	line(63,7,63,120,13)
	line(17,63,110,63,13)
	circ(63,63,32,13)
	print("0 / 1",54,122,13)
	print("0.25",1,61,13)
	print("0.5",58,1,13)
	print("0.75",112,61,13)
	
	line(63,63,sin(angle)*34+63,cos(angle)*34+63,8)
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
