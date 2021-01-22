local IDLE = 0
local FELLING = 1
local RETURNING = 2

local function Check(dir)
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

local function Idle()
    if Check() then
        print('Starting work! o7')
        state = FELLING
    end
end

local function Fell()
    turtle.dig()
    turtle.forward()

    while Check("up") do
        turtle.digUp()
        turtle.up()
    end

    state = RETURNING
end

print("Well I'm a lumberjack and I'm OK! ^.^")
local state = IDLE

--main loop
while true do
    if      state == IDLE then Idle()
    elseif  state == FELLING then Fell()
        print("oops!")
        break
    end
end



