GameLoop = require('utils.GameLoop')
-- Imports
local GameLoop = require "utils.GameLoop"

-- Globals
MainLoop = GameLoop:new()

-- Locals


function love.load()
    MainLoop:init()
    MainLoop:load()
end

function love.update(dt)
    MainLoop:update(dt)
end

function love.draw()
    MainLoop:draw()
end

function love.keypressed(key)
    MainLoop:keypressed(key)
end

function love.textinput(text)
    MainLoop:textinput(text)
end