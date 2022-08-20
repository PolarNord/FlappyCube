local cube = require("scripts/cube")
local pipe = require("scripts/pipe")

function TerminateGame()
    Cube = nil
    Pipes = {}
    PipeImage = nil
end

function love.load()
    TerminateGame()
    love.graphics.setBackgroundColor(0.09, 0.5, 0.63)
    -- Load images
    PipeImage = love.graphics.newImage("images/pipe.png")
    -- Setup objects
    Cube = cube.new()
    Cube.pos.x = 240 ; Cube.pos.y = 270
    -- Test pipe
    Pipes[#Pipes+1] = pipe.new()
    Pipes[1].pos.x = 480
    Pipes[1].pos.y = 270
end

local function updatePipes(delta)
    for i, v in ipairs(Pipes) do
        v.update(delta)
    end
end

local function drawPipes()
    for i, v in ipairs(Pipes) do
        v.draw()
    end
end

function love.update(delta)
    Cube.update(delta)
    updatePipes(delta)
end

function love.draw()
    Cube.draw()
    drawPipes()
end
