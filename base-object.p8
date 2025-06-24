pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- ----------------------------
-- base object example
-- ----------------------------
--[[



]]--

function log(txt)
	printh(txt, "log", false)
end

-->8
-- body
-- ----------------------------

body={
	x=0,
	y=0,
	vx=0,
	vy=0,
	sx=1,
	sy=1,
	spr=0,
	
	update=function(self)
		self.x+=self.vx*self.sx
		self.y+=self.vy*self.sy
	end,
	
	draw=function(self)
		spr(self.spr,self.x,self.y)
	end
}


function body:new(o)
 o = o or {}
 setmetatable(o, self)
 self.__index = self
 return o
end
-->8
-- player
-- ----------------------------

player=body:new()

function player:new(o)
	o = body.new(self,o)
	o.hp = 100
	o.mode = "normal"
	return o
end

function player:move()
	self.vx, self.vy = 0, 0
	
	if btn(0) then self.vx = -1 end -- left
	if btn(1) then self.vx = 1 end  -- right
	if btn(2) then self.vy = -1 end -- up
	if btn(3) then self.vy = 1 end  -- down
	
	-- normalize diagonal movement
	if self.vx ~= 0 and self.vy ~= 0 then
	 self.vx *= 0.7071 -- 1/sqrt(2)
	 self.vy *= 0.7071
	end
end
-->8
-- enemy
-- ----------------------------

enemy=body:new()

function enemy:new(o)
	o = body.new(self,o)
	o.type="gorblin"
	o.hp = 50
	return o
end
-->8
-- main callbacks
-- ----------------------------

function _init()
	log("======= begin =======")
	
	p1 = player:new({
		x=10,
		y=20,
		spr=1
	})
	
	log("\np1:")
	log("   x: "..tostr(p1.x))
	log("   y: "..tostr(p1.y))
	log("   vx: "..tostr(p1.vx))
	log("   vy: "..tostr(p1.vy))
	log("   sx: "..tostr(p1.sx))
	log("   sy: "..tostr(p1.sy))
	log("   spr: "..tostr(p1.spr))
	log("   hp: "..tostr(p1.hp))
	log("   mode: "..tostr(p1.mode))
	
	en = enemy:new({
		x=50,
		y=50,
		spr=2
	})
	
	log("en:")
	log("   x: "..tostr(en.x))
	log("   y: "..tostr(en.y))
	log("   vx: "..tostr(en.vx))
	log("   vy: "..tostr(en.vy))
	log("   sx: "..tostr(en.sx))
	log("   sy: "..tostr(en.sy))
	log("   spr: "..tostr(en.spr))
	log("   hp: "..tostr(en.hp))
	log("   type: "..tostr(en.type))
end

function _update()
 -- todo
	p1:update()
	p1:move()
	en:update()
end

function _draw()
	cls(1)
	p1:draw()
	en:draw()
end
__gfx__
000000000c0000c00088880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000c00c000888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700cccccccc8818818800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000caccccac8818818800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000cccccccc8818818800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000cccccc08888888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000c00c000888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000c0000c00080080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
