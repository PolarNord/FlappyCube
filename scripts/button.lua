local vec2 = require("lib/vec2")
local collision = require("lib/collision")

local button = {}

function button.new()
    local b = {
        pos = vec2.new();
        text = "Sample";
        scale = 1;
	touch = false;
    }

    function b.update(delta)
	-- Click check
	if b.touch and not love.mouse.isDown(1) then
	    -- Click event
	    if b.event then b.event() end
	    b.touch = false
        end
	-- Animations
        local width = ButtonImage:getWidth()*2*b.scale
        local height = ButtonImage:getHeight()*2*b.scale
        -- Check for mouse touch
        local mx, my = love.mouse.getPosition()
        if collision(b.pos.x-width/2, b.pos.y-height/2, width, height, mx, my, 1, 1) then
            b.scale = b.scale + (1.15 - b.scale) / (250 * delta)
	    if love.mouse.isDown(1) then b.touch = true end
        else
	    b.scale = b.scale + (1 - b.scale) / (250 * delta)
	    b.touch = false
    	end
    end

    function b.draw()
        -- Draw base
        local width = ButtonImage:getWidth()
        local height = ButtonImage:getHeight()
        love.graphics.draw(
            ButtonImage, b.pos.x, b.pos.y, 0,
            2*b.scale, 2*b.scale, width/2, height/2
        )
        -- Draw text
        love.graphics.setColor(0, 0, 0, 1)
        love.graphics.setNewFont("fonts/ARCADECLASSIC.TTF", 30*b.scale)
        love.graphics.printf(b.text, b.pos.x-width/2, b.pos.y-height/2, 1000, "left")
        love.graphics.setColor(1, 1, 1, 1)
    end

    return b
end

return button
