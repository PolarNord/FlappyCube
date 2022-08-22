local vec2 = require("lib/vec2")
local button = require("scripts/button")

local interface = {}

function interface.load()
    -- Start Button
    interface.startButton = button.new()
    interface.startButton.pos = vec2.new(480, 270)
    interface.startButton.text = "Start"

    function interface.startButton.event()
	GameState = "game"
	StartGame()
    end
    -- Quit Button
    interface.quitButton = button.new()
    interface.quitButton.pos = vec2.new(480, 365)
    interface.quitButton.text = "Quit"

    function interface.quitButton.event()
	love.event.quit()
    end
end

function interface.update(delta)
    if GameState == "menu" then
        interface.startButton.update(delta)
        interface.quitButton.update(delta)
    end
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
	interface.quitButton.draw()
    end
end

return interface
