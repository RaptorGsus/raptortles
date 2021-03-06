local IDLE = 0
local FELLING = 1
local RETURNING = 2

local state = IDLE

local function check(dir)
    local success, block
    
    if dir == "up" then
        success, block = turtle.inspectUp()
    elseif dir == "down" then
        success, block = turtle.inspectDown()
    else
        success, block = turtle.inspect()
    end

    if success then
        return block.tags["minecraft:logs"]
    else
        return false
    end
end

local function placeSapling()
    turtle.select(1)
    turtle.place();
    turtle.select(2)
    turtle.place()
end

local function printProgress(text)
    write(text)
    textutils.slowWrite(". . . ")
end

local function clearProgress()
    term.clearLine()
    local cursorX, cursorY = term.getCursorPos()
    term.setCursorPos(1, cursorY)
end

local function idle()
    printProgress("Idling")
    turtle.turnRight()

    if check() then
        print('\nStarting work! o7')
        state = FELLING
    end

    clearProgress()
end

local function fell()
    turtle.dig()
    turtle.forward()

    while check("up") do
        turtle.digUp()
        turtle.up()
    end

    state = RETURNING
end

local function returnHome()
    print('Pfew, finally done!')
    repeat turtle.down()
    until  turtle.detectDown()
    turtle.back()
    print('Home sweet home ^.^')
    placeSapling()

    state = IDLE
end
print("Well I'm a lumberjack and I'm OK! ^.^")

--main loop
while true do
    if      state == IDLE then idle()
    elseif  state == FELLING then fell()
    elseif  state == RETURNING then returnHome()
    else  
        print("oops! @.@")
        break
    end
end



