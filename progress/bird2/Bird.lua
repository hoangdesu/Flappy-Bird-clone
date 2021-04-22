local class = require('libs/middleclass')

Bird = class('Bird')

function Bird:initialize()
    self.image = love.graphics.newImage('images/bird.png')
    self.width = self.image:getWidth()    
    self.height = self.image:getHeight()
    self.x = VIRTUAL_WIDTH / 2 - self.width / 2
    self.y = VIRTUAL_HEIGHT / 2 - self.height
end

function Bird:render()
    love.graphics.draw(self.image, self.x, self.y)
end