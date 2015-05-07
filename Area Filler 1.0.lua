-- For use with the Promethea Atlantis skybase. 
-- Description: Fills in areas with borders using
	--a switchback, row-by-row filling method
-- INSTRUCTIONS
	-- Right click place turtle down on the RIGHT side of the
	-- block you want to start laying.

-- Global variables and Initialization
currentSlot = 1
maxSlot = 16
-- direction 1 is moving right, 2 is moving left
direction = 1
turtle.select(currentSlot)

function selection()
	for pos = 1, maxSlot do
		turtle.select(pos)
		if turtle.getItemCount(pos) > 0 then
			currentSlot = pos
			return
		end
	end
	kill()
end

function kill()
	turtle.up()
	if direction == 1 then
		turtle.turnLeft()
	else 
		turtle.turnRight()
	end
	turtle.forward()
	exit()
end

-- Main exective loop
while true do
		
	-- Check if the turtle can move backwards and place bricks
	while turtle.back() do
-- Check if the turtle has bricks to place
		selection()
		turtle.place()
	end

	-- Turtle is now backed into a wall, move up a row if possible
	if direction == 1 then
		turtle.turnLeft()
		turtle.back()
		turtle.place()
		turtle.turnLeft()
		direction = 2
	elseif direction == 2 then
		turtle.turnRight()
		turtle.back()
		turtle.place()
		turtle.turnRight()
		direction = 1
	end
	-- Edge case, turtle is stuck in a corner
end