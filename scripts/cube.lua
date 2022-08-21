local vec2 = require("lib/vec2")
local trail = require("scripts/cubeTrail")

local cube = {}

function cube.new()
    local c = {
        pos = vec2.new();
        rot = 0;
        image = love.graphics.newImage("images/cube.png");
        yvel = 0;
        trails = {};
        trailCooldown = 0;
    }

    function c.updateTrails(delta)
	-- Update trails
        for i, v in ipairs(c.trails) do
            v.update(delta, i)
        end
        -- Spawn trails
        c.trailCooldown = c.trailCooldown + delta
        if c.trailCooldown < 0.025 then return end
        local newTrail = trail.new()
        newTrail.pos = vec2.new(c.pos.x, c.pos.y)
        c.trails[#c.trails+1] = newTrail
	c.trailCooldown = 0
    end

    function c.drawTrails()
        for i, v in ipairs(c.trails) do
            v.draw()
        end
    end

    -- Clicking mechanic
    function love.mousepressed(x, y, button, istouch)
        if button ~= 1 then return end
        Cube.yvel = -5.5
    end

    function c.update(delta)
        -- Falling
        c.yvel = c.yvel + (15 * delta)
        c.pos.y = c.pos.y + c.yvel
        c.updateTrails(delta)
    end

    function c.draw()
        c.drawTrails()
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
