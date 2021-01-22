local BLOCK = "oak_log"

local IDLE = 0
local FELLING = 1
local RETURNING = 2

local function Check()
    local success, block = turtle.inspect()

    if success then
        return block.tags["minecraft:logs"]
    else 
        return false
    end
end

local function Idle()
    

end

print("Well I'm a lumberjack and I'm OK! ^.^")
local state = IDLE

if Check() then 
    print('It a log!')
else
    print('not log!')
end

--main loop
--while true do
    
  --  if      state == IDLE then Idle()

--end





