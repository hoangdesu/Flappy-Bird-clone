class = require('libs/middleclass')
Pipe = class('Pipe')

local PIPE_IMAGE = love.graphics.newImage('images/pipe.png')
local PIPE_SCROLL = -120

function Pipe:initialize()
    self.x = VIRTUAL_WIDTH
    self.y = math.random(VIRTUAL_HEIGHT / 4, VIRTUAL_HEIGHT - 120)
    self.width = PIPE_IMAGE:getWidth()
end

function Pipe:update(dt)
    self.x = self.x + PIPE_SCROLL * dt
end

function Pipe:render()
    love.graphics.draw(PIPE_IMAGE, self.x, self.y)
end