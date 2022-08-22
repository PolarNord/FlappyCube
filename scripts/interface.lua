local interface = {}

function interface.update()
end

function interface.draw()
    if GameState == "game" then
        -- Draw score text
        love.graphics.setNewFont("fonts/ARCADECLASSIC.TTF", 48)
        love.graphics.print(tostring(Score), 45, 45)
    elseif GameState == "menu" then
        love.graphics.setNewFont("fonts/ARCADECLASSIC.TTF", 64)
        love.graphics.printf("Flappy Cube", -25, 120, 1000, "center")
    end
end

return interface
