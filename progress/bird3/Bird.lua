local class = require('libs/middleclass')

Bird = class('Bird')

local GRAVITY = 20

function Bird:initialize()
    self.image = love.graphics.newImage('images/bird.png')
    self.width = self.image:getWidth()    
    self.height = self.image:getHeight()
    self.x = VIRTUAL_WIDTH / 2 - self.width / 2
    self.y = VIRTUAL_HEIGHT / 2 - self.height
    self.dy = 0
end

function Bird:update(dt)
    self.dy = self.dy + GRAVITY * dt
    self.y = self.y + self.dy
end

function Bird:render()
    love.graphics.draw(self.image, self.x, self.y)
end

