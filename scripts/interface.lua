local interface = {}

function interface.update()
end

function interface.draw()
    -- Draw score text
    love.graphics.setNewFont("fonts/ARCADECLASSIC.TTF", 48)
    love.graphics.print(tostring(Score), 45, 45)
end

return interface
