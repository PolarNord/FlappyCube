local vec2 = require("lib/vec2")

local pipe = {}

function pipe.new()
    local p = {
        pos = vec2.new();
	lifetime = 0;
    }

    function p.update(delta, i)
        p.pos.x = p.pos.x - (200 * delta)
	-- Despawn
	p.lifetime = p.lifetime + delta
	if p.lifetime > 6 then
            table.remove(Pipes, i)
	end
    end

    function p.draw()
        local width = PipeImage:getWidth()
        local height = PipeImage:getHeight()
        love.graphics.draw(
            PipeImage, p.pos.x, p.pos.y, 0,
            1, 1, width/2, height/2
        )
    end

    return p
end

return pipe
