local class = require('libs/middleclass')

Bird = class('Bird')

require('sfx')

local GRAVITY = 20
local JUMP_DISTACE = -5

function Bird:initialize()
    self.image = love.graphics.newImage('images/bird.png')
    self.width = self.image:getWidth()    
    self.height = self.image:getHeight()
    self.x = VIRTUAL_WIDTH / 2 - self.width / 2
    self.y = VIRTUAL_HEIGHT / 2 - self.height
    self.dy = 0
end

function Bird:update(dt)
    if love.keyboard.wasPressed('space') then
        self.dy = JUMP_DISTACE
        
        if sfx['flap']:isPlaying() then
            sfx['flap']:stop()
            sfx['flap']:play()
        else
            sfx['flap']:play()
        end
    end
    self.dy = self.dy + GRAVITY * dt
    self.y = self.y + self.dy
end

function Bird:render()
    love.graphics.draw(self.image, self.x, self.y)
end

