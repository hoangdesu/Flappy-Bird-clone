push = require('libs/push')
require('Bird')

-- Global constants
WINDOW_WIDTH = 540
WINDOW_HEIGHT = 960
VIRTUAL_WIDTH = 276
VIRTUAL_HEIGHT = 491

-- Sprites
local background_day = love.graphics.newImage('images/background-day.png')
local background_scroll = 0
local BACKGROUND_SCROLL_SPEED = 20
local BACKGROUND_LOOPING_POINT = 276

local base = love.graphics.newImage('images/base.png')
local base_scroll = 0
local BASE_SCROLL_SPEED = 100
local BASE_LOOPING_POINT = 48

function love.load()
    love.window.setTitle('Flappy Bird')
    -- love.graphics.setDefaultFilter('nearest', 'nearest')

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = false,
        resizable = true
    })

    bird = Bird()
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.update(dt)
    background_scroll = (background_scroll + BACKGROUND_SCROLL_SPEED * dt) % BACKGROUND_LOOPING_POINT
    base_scroll = (base_scroll + BASE_SCROLL_SPEED * dt) % BASE_LOOPING_POINT
    -- print(background_scroll)
    -- print(background_scroll)
end

function love.draw()
    push:start()
    love.graphics.draw(background_day, -background_scroll, - 20)
    love.graphics.draw(base, -base_scroll, VIRTUAL_HEIGHT - 80)
    bird:render()
    push:finish()
end