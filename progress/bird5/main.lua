push = require('libs/push')
require('Bird')
require('sfx')
require('Pipe')

-- Responsive window
width, height = love.window.getDesktopDimensions()
WINDOW_WIDTH = height / 2
WINDOW_HEIGHT = width / 2
VIRTUAL_WIDTH = 276
VIRTUAL_HEIGHT = VIRTUAL_WIDTH * WINDOW_HEIGHT / WINDOW_WIDTH

-- Sprites
local background_day = love.graphics.newImage('images/background-day.png')
local background_scroll = 0
local BACKGROUND_SCROLL_SPEED = 20
local BACKGROUND_LOOPING_POINT = 276

local base = love.graphics.newImage('images/base.png')
local base_scroll = 0
local BASE_SCROLL_SPEED = 120
local BASE_LOOPING_POINT = 48

-- Variables
local bird = Bird()

local pipes = {}

local pipe_spawn_timer = 0

function love.load()
    love.window.setTitle('Flappy Bird')
    -- love.graphics.setDefaultFilter('nearest', 'nearest')
    math.randomseed(os.time())

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = false,
        resizable = true
    })


    love.keyboard.keysPressed = {}
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
    if key == 'escape' then
        love.event.quit()
    end
end

-- Custom function to return a key pressed
function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.update(dt)
    -- Parralax scrolling
    background_scroll = (background_scroll + BACKGROUND_SCROLL_SPEED * dt) % BACKGROUND_LOOPING_POINT
    base_scroll = (base_scroll + BASE_SCROLL_SPEED * dt) % BASE_LOOPING_POINT
    
     -- Creating a new pipe object after x seconds
    pipe_spawn_timer = pipe_spawn_timer + dt

    if pipe_spawn_timer > 1.5 then
        table.insert(pipes, Pipe())
        pipe_spawn_timer = 0
    end

    -- Updating objects
    bird:update(dt)

    for k, pipe in pairs(pipes) do
        pipe:update(dt)
        if pipe.x < -pipe.width then
            table.remove(pipes, k)
        end
    end

    -- Flushing input table
    love.keyboard.keysPressed = {}
end

function love.draw()
    push:start()
    love.graphics.draw(background_day, -background_scroll, - 20)
    
    for i, pipe in pairs(pipes) do
        pipes[i]:render()
    end

    love.graphics.draw(base, -base_scroll, VIRTUAL_HEIGHT - 80)
    bird:render()
    push:finish()
end