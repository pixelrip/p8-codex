pico-8 cartridge // http://www.pico-8.com
version 42
__lua__

function _init()

	-- our two objects
	blue={
		c=12,
		x=48,
		y=32,
		w=32,
		h=32
	}
	
	red={
		c=8,
		x=3,
		y=3,
		w=24,
		h=24
	}
	
	-- timer
	t=0
	
	-- check process
	start_check(0)

end

function _update()

	if check.go == false then
		-- button controls for red
		if (btnp(⬆️)) red.y-=2
		if (btnp(⬇️)) red.y+=2
		if (btnp(⬅️)) red.x-=2
		if (btnp(➡️)) red.x+=2
	
	
		-- begin check
		if (btnp(❎)) start_check(1)
	end
	
	-- check
	update_check()
	
	-- increment timer
	t+=1
	
end


function _draw()
	cls(1)
	draw_square(blue)
	draw_square(red)
	draw_check()
	
end


-->8
-- collision check

function start_check(go)
	go=go or 1
	local b = go == 1
	
	check={
		t=t+120,
		go=b,
		step=1,
		results={},
		txt={},
		collision=nil,
	}
end

function update_check()
	if (not check.go) return

	local b_top=blue.y
	local b_bot=blue.y+blue.h
	local b_lef=blue.x
	local b_rig=blue.x+blue.w
	
	local r_top=red.y
	local r_bot=red.y+red.h
	local r_lef=red.x
	local r_rig=red.x+red.w	
	
	function next_step()
		if (t<check.t) return

		check.t=t+120
		check.step+=1
		
		if check.step>4 then
			check.go = false
		end
	end
		
	if check.step==1 then
		check.txt[1]="is red above blue?"
		check.results[1]=get_result(b_top,r_bot)
	
	elseif check.step==2 then 
		check.txt[2]="is red right of blue?"
		check.results[2]=get_result(r_lef,b_rig)
	
	elseif check.step==3 then 
		check.txt[3]="is red below blue?"	
		check.results[3]=get_result(r_top, b_bot)

	elseif check.step==4 then 
		check.txt[4]="is red left of blue?"
		check.results[4]=get_result(b_lef, r_rig)

	end

	next_step()
	
end

function draw_check()
	rectfill(0,90,128,128,5)
	line(0,90,128,90,0)
	
	if not check.go then
		print("press ❎ to check",2,93,7) 
		return
	end
	
	if check.step==1 then
		draw_line("top",	blue)
		draw_line("bot", red)	
	elseif check.step==2 then
		draw_line("rig",	blue)
		draw_line("lef", red)
	elseif check.step==3 then
		draw_line("bot",	blue)
		draw_line("top", red) 
	elseif check.step==4 then
		draw_line("lef",	blue)
		draw_line("rig", red) 
	end


	-- print results
	print(check.txt[1] or "",2,93,7)
	print(check.txt[2] or "",2,100,7)
	print(check.txt[3] or "",2,107,7)
	print(check.txt[4] or "",2,114,7)
	
	print(check.results[1] or "",102,93,7)
	print(check.results[2] or "",102,100,7)
	print(check.results[3] or "",102,107,7)
	print(check.results[4] or "",102,114,7)
	
	if collision==false then
		print("a collision is impossible!",2,121,8)
	end

end

function get_result(a,b)

	if a > b then
		collision=false
		return "yes!"
	else
		return "nope"
	end
end
-->8
-- helpers

function draw_square(obj)
	local x0=obj.x
	local y0=obj.y
	local x1=x0+obj.w
	local y1=y0+obj.h
	local c=obj.c
	
	rectfill(x0,y0,x1,y1,c)
end

function draw_line(pos,obj)
	local x0,y0,x1,x2,c = 0,0,0,0,0

	if pos=="top" then
		x0=obj.x
		x1=obj.x+obj.w
		y0=obj.y
		y1=obj.y
	elseif pos=="lef" then
		x0=obj.x
		x1=obj.x
		y0=obj.y
		y1=obj.y+obj.h
	elseif pos=="bot" then
		x0=obj.x
		x1=obj.x+obj.w
		y0=obj.y+obj.h
		y1=obj.y+obj.h
	elseif pos=="rig" then
		x0=obj.x+obj.w
		x1=obj.x+obj.w
		y0=obj.y
		y1=obj.y+obj.h	
	end

	if t%8 > 3 then
		line(x0,y0,x1,y1,10)
	end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
