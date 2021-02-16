--[[
    Example of a Scene: 
    A scene is a collection of gameobjects, UI and logic.
    For example a menu or game level.
    Use the code below as a example on how to create a scene
]]

local BaseScene = {}

function BaseScene:new()

    local base = {}

    -- This tables need to contain every element on the scene
    -- Every table represents a layer on the gameloop.
    base.gfx = {}
    base.UI = {}
    base.entities = {}

    -- This variable holds the unique id which will identify every element in the scene
    base.id = 'base'

    -- A scene doesn't need a load function
    -- Use the function below to configure and insert gameobjects into the scene before inserting it into the loop.
    function base:init()

    end

    return base

end

return BaseScene