local vec2 = require("lib/vec2")

local cube = {}

function cube.new()
    local c = {
        pos = vec2.new();
        image = love.graphics.newImage("images/cube.png");
    }

    function c.update(delta)

    end

    function c.draw()
        local width = c.image:getWidth()
        local height = c.image:getHeight()
        love.graphics.draw(
            c.image, c.pos.x, c.pos.y, 0,
            1, 1, width/2, height/2
        )
    end
    
    return c
end

return cube