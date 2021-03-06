--------- WALL CREATOR

wallHeight = 7
outlineBlock = 1
currentSlot = 2
maxSlot = 16

areaCheck = 5

turtle.select(currentSlot)

----------------------------------------------------------------------------
function selection()
  for pos = outlineBlock + 1, maxSlot do
		turtle.select(pos)
		if turtle.getItemCount(pos) > 0 then
			currentSlot = pos
			return
		end
	end
	
end
-----------------------------------------------------------------------------
function checkAbove()
	turtle.select(outlineBlock)
-- Handle apparent 90 degree left turn
	if turtle.compareUp() then
		turtle.turnLeft()
		return
-- Left diagonal outline block
	else
		turtle.forward()
		if turtle.compareUp() then 
			return
-- Center outline block
		else
			turtle.turnRight()
			turtle.forward()
			if turtle.compareUp() then
				turtle.turnLeft()
				return
-- Right diagonal outline block, keep turtle turned right to face new direction			
			else
				turtle.forward()
				if turtle.compareUp() then
					return
				else
					print('Error?')
					kill()
				end
			end
		end	
	end		
end
------------------------------------------------------------------------------------
function kill()
	exit()
end

------------------------- Main loop -----------------------------------
turtle.turnLeft()
turtle.forward()
turtle.turnRight()

while true do
	checkAbove()
	selection()
-- Makes the wall
		for i = 1, wallHeight do
			i = i+1
			turtle.down()
			turtle.placeUp()
		end
		
		turtle.turnLeft()
		turtle.forward()
		turtle.turnRight()

		for i = 1, wallHeight do
			i = i+1
			turtle.up()
		end
end
