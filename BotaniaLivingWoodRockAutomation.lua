--[[
======== Botania Livingwood/Livingrock Automation ========
Description:
Automates placing and collection of livingwood and livingrock.

Area requirements:
3x4x2
/ - Empty
I - Input Chest
O - Output Chest
M - Material
D - Daisy

I / O
M M M
M D M
M M M

Usage:
Ensure the Turtle is properly initialized (name, fuel, etc)
Clear out the appropriate space
Place Turtle above Pure Daisy facing towards the chests (North)
Run the program
--]]

function placeHarvest()
	turtle.forward()
	turtle.placeDown()
	turtle.forward()
	turtle.placeDown()
	turtle.forward()
	turtle.placeDown()

	turtle.turnLeft()
	turtle.forward()
	turtle.placeDown()
	turtle.forward()
	turtle.placeDown()


	turtle.turnLeft()
	turtle.forward()
	turtle.placeDown()
	turtle.forward()
	turtle.placeDown()

	turtle.turnLeft()
	turtle.forward()
	turtle.placeDown()

	sleep(75)

	turtle.forward()
	turtle.turnLeft()
	turtle.digDown()
	turtle.forward()
	turtle.digDown()
	turtle.forward()
	turtle.digDown()

	turtle.turnLeft()
	turtle.forward()
	turtle.digDown()
	turtle.forward()
	turtle.digDown()

	turtle.turnLeft()
	turtle.forward()
	turtle.digDown()
	turtle.forward()
	turtle.digDown()

	turtle.turnLeft()
	turtle.forward()
	turtle.digDown()

	-- go to output chest
	turtle.turnRight()
	turtle.forward()
	turtle.turnRight()
	turtle.forward()
	turtle.turnRight()
end


-- Go to Input Chest
turtle.forward()
turtle.forward()
turtle.turnLeft()
turtle.forward()
turtle.turnLeft()

if turtle.suckDown(8) == false then
	exit()
end

placeHarvest()

-- deposit items
if turtle.dropDown(8) == false then
	exit()
end

-- return to starting position
turtle.forward()
turtle.forward()
turtle.turnRight()
turtle.forward()
turtle.turnRight()
