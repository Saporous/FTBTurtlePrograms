-- For use with filling any sized or shaped 2d polygon

-- USAGE Place the turtle on the farthest left, bottom corner of the polygon
 	-- facing left and fill any or all slots with blocks

currentSlot = 1
maxSlot = 16
-- direction 1 is moving right, 2 is moving left
direction = 1
turtle.select(currentSlot)

function selection()
	for pos = 1, maxSlot do
		turtle.select(pos)
		if turtle.getItemCount(pos)  0 then
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

------------- Check if there is a wall to the left of the turtle (it's facing backwards)
---------------- If there is, continue on, else turn right and continue
function checkWall()
	turtle.turnLeft()
	check = turtle.detect()

	if check == false then
		turtle.turnLeft()
		turtle.turnLeft()
		return check
	else
		turtle.turnRight()
		return check
	end
end

-- Main executive loop
while true do
               
        -- Check if the turtle can move backwards and place bricks
        while turtle.back() do
-- Check if the turtle has bricks to place
		selection()
		checkWall()
                turtle.place()
        end
	turtle.turnLeft()
end