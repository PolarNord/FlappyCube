local cube = require("scripts/cube")
local pipe = require("scripts/pipe")

local pSpawnCooldown

function TerminateGame()
    Cube = nil
    Pipes = {}
    PipeImage = nil
    TrailImage = nil
    Score = 0
    pSpawnCooldown = 100
end

function love.load()
    TerminateGame()
    love.graphics.setBackgroundColor(0.09, 0.5, 0.63)
    -- Load images
    PipeImage = love.graphics.newImage("images/pipe.png")
    TrailImage = love.graphics.newImage("images/trail.png")
    -- Setup objects
    Cube = cube.new()
    Cube.pos.x = 240 ; Cube.pos.y = 270
end

-- Pipe related functions
local function updatePipes(delta)
    for i, v in ipairs(Pipes) do
        v.update(delta, i)
    end
end

local function drawPipes()
    for i, v in ipairs(Pipes) do
        v.draw()
    end
end

local function spawnPipe(x, y)
    local newPipe = pipe.new()
    newPipe.pos.x = x ; newPipe.pos.y = y
    Pipes[#Pipes+1] = newPipe
end

function love.update(delta)
    print(#Cube.trails)
    Cube.update(delta)
    updatePipes(delta)
    -- Spawn pipe
    pSpawnCooldown = pSpawnCooldown + delta
    if pSpawnCooldown < 1.45 then return end
    spawnPipe(960, math.random(140, 400))
    pSpawnCooldown = 0
end

function love.draw()
    Cube.draw()
    drawPipes()
end
