local cube = require("scripts/cube")
local pipe = require("scripts/pipe")
local interface = require("scripts/interface")

local pSpawnCooldown
GameState = "game"

function TerminateGame()
    Cube = cube.new()
    Pipes = {}
    PipeImage = nil
    TrailImage = nil
    ButtonImage = nil
    Score = 0
    pSpawnCooldown = 100
end

function StartGame()
    love.graphics.setBackgroundColor(0.09, 0.5, 0.63)
    interface.load()
    -- Load images
    PipeImage = love.graphics.newImage("images/pipe.png")
    TrailImage = love.graphics.newImage("images/trail.png")
    ButtonImage = love.graphics.newImage("images/button_bg.png")
    -- Setup objects
    Cube = cube.new()
    Cube.pos.x = 240 ; Cube.pos.y = 270
    GameState = "game"
end

function love.load()
    TerminateGame()
    StartGame()
    GameState = "menu"
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
    if GameState == "game" then
        Cube.update(delta)
        updatePipes(delta)
        -- Spawn pipe
        pSpawnCooldown = pSpawnCooldown + delta
        if pSpawnCooldown < 1.45 then return end
        spawnPipe(960, math.random(140, 400))
        pSpawnCooldown = 0
    elseif GameState == "menu" then
        
    end
    interface.update(delta)
end

function love.draw()
    if GameState == "game" then
        Cube.draw()
        drawPipes()
    end
    interface.draw()
end
