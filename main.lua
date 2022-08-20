local cube = require("scripts/cube")

function love.load()
    love.graphics.setBackgroundColor(0.09, 0.5, 0.63)
    -- Setup objects
    Cube = cube.new()
    Cube.pos.x = 240 ; Cube.pos.y = 270
end

function love.update(delta)
    Cube.update(delta)
end

function love.draw()
    Cube.draw()
end
