local vec2 = require("lib/vec2")
local collision = require("lib/collision")

local button = {}

function button.new()
    local b = {
        pos = vec2.new();
        text = "Sample";
    }

    function b.update(delta)
        local width = ButtonImage:getWidth()*2
        local height = ButtonImage:getHeight()*2
        -- Check for mouse touch
        local mx, my = love.mouse.getPosition()
        if collision(b.pos.x-width/2, b.pos.y-height/2, width, height, mx, my, 1, 1) then
            b.pos.x =b.pos.x + 100 * delta
        end
    end

    function b.draw()
        -- Draw base
        local width = ButtonImage:getWidth()
        local height = ButtonImage:getHeight()
        love.graphics.draw(
            ButtonImage, b.pos.x, b.pos.y, 0,
            2, 2, width/2, height/2
        )
        -- Draw text
        love.graphics.setColor(0, 0, 0, 1)
        love.graphics.setNewFont("fonts/ARCADECLASSIC.TTF", 30)
        love.graphics.printf(b.text, b.pos.x-width/2, b.pos.y-height/2, 1000, "left")
        love.graphics.setColor(1, 1, 1, 1)
    end

    return b
end

return button
