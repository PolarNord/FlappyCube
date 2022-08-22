local vec2 = require("lib/vec2")
local button = require("scripts/button")

local interface = {}

function interface.load()
    interface.startButton = button.new()
    interface.startButton.pos = vec2.new(480, 270)
    interface.startButton.text = "Start"
end

function interface.update(delta)
    interface.startButton.update(delta)
end

function interface.draw()
    if GameState == "game" then
        -- Draw score text
        love.graphics.setNewFont("fonts/ARCADECLASSIC.TTF", 48)
        love.graphics.print(tostring(Score), 45, 45)
    elseif GameState == "menu" then
        -- Draw title
        love.graphics.setNewFont("fonts/ARCADECLASSIC.TTF", 64)
        love.graphics.printf("Flappy Cube", -25, 120, 1000, "center")
        -- Draw start button
        interface.startButton.draw()
    end
end

return interface
