local vec2 = require("lib/vec2")

local cubeTrail = {}

function cubeTrail.new()
    local t = {
        pos = vec2.new();
        alpha = 1;
        size = 1;
    }

    function t.update(delta, i)
        t.pos.x = t.pos.x - (200 * delta)
        t.alpha = t.alpha - (2.45 * delta)
        t.size = t.size - (1.85 * delta)
        -- Despawn
        if t.alpha < 0 then
            table.remove(Cube.trails, i)
        end
    end

    function t.draw()
        love.graphics.setColor(1, 1, 1, t.alpha)
        local width = TrailImage:getWidth()
        local height = TrailImage:getHeight()
        love.graphics.draw(
            TrailImage, t.pos.x, t.pos.y, 0,
            t.size, t.size, width/2, height/2
        )
        love.graphics.setColor(1, 1, 1, 1)
    end

    return t
end

return cubeTrail