push = require 'libs/push'

-- Constants
WINDOW_WIDTH = 540
WINDOW_HEIGHT = 960
VIRTUAL_WIDTH = 288
VIRTUAL_HEIGHT = 512

-- Sprites
local background_day = love.graphics.newImage('images/background-day.png')
local base = love.graphics.newImage('images/base.png')

function love.load()
    love.window.setTitle('Flappy Bird')
    love.graphics.setDefaultFilter('nearest', 'nearest')

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        resizable = true
    })

end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.draw()
    push:start()
        love.graphics.draw(background_day, 0, 0)
        love.graphics.draw(base, 0, VIRTUAL_HEIGHT - 110)
    push:finish()
end