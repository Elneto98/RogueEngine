local GameLoop = {}

function GameLoop:new()

    local gameloop = {}
    gameloop.layers = {}

    function gameloop:init()
        -- Init loop with empty layers
        gameloop.layers['entities'] = {}
        gameloop.layers['ui'] = {}
        gameloop.layers['gfx'] = {}
    end

    function gameloop:load()
        -- Load in order of drawing
        -- Load graphics
        for index, value in ipairs(gameloop.layers['gfx']) do
            if value.load ~= nil then
                value:load()
            end
        end

        -- Load entities
        for index, value in ipairs(gameloop.layers['entities']) do
            if value.load ~= nil then
                value:load()
            end            
        end

        -- Load ui
        for index, value in ipairs(gameloop.layers['ui']) do
            if value.load ~= nil then
                value:load()
            end            
        end
    end

    function gameloop:update(dt)
        -- update in order of drawing
        -- update graphics
        for index, value in ipairs(gameloop.layers['gfx']) do
            if value.update ~= nil then
                value:update(dt)
            end
        end

        -- update entities
        for index, value in ipairs(gameloop.layers['entities']) do
            if value.update ~= nil then
                value:update(dt)
            end            
        end

        -- update ui
        for index, value in ipairs(gameloop.layers['ui']) do
            if value.update ~= nil then
                value:update(dt)
            end            
        end
    end

    function gameloop:draw()
        -- draw in order of drawing
        -- draw graphics
        for index, value in ipairs(gameloop.layers['gfx']) do
            if value.draw ~= nil then
                value:draw()
            end
        end

        -- draw entities
        for index, value in ipairs(gameloop.layers['entities']) do
            if value.draw ~= nil then
                value:draw()
            end            
        end

        -- draw ui
        for index, value in ipairs(gameloop.layers['ui']) do
            if value.draw ~= nil then
                value:draw()
            end            
        end
    end

    function gameloop:keypressed(key)
        -- keypressed in order of drawing
        -- keypressed graphics
        for index, value in ipairs(gameloop.layers['gfx']) do
            if value.keypressed ~= nil then
                value:keypressed(key)
            end
        end

        -- keypressed entities
        for index, value in ipairs(gameloop.layers['entities']) do
            if value.keypressed ~= nil then
                value:keypressed(key)
            end            
        end

        -- keypressed ui
        for index, value in ipairs(gameloop.layers['ui']) do
            if value.keypressed ~= nil then
                value:keypressed(key)
            end            
        end
    end

    function gameloop:textinput(text)
        -- textinput in order of drawing
        -- textinput graphics
        for index, value in ipairs(gameloop.layers['gfx']) do
            if value.textinput ~= nil then
                value:textinput(text)
            end
        end

        -- textinput entities
        for index, value in ipairs(gameloop.layers['entities']) do
            if value.textinput ~= nil then
                value:textinput(text)
            end            
        end

        -- textinput ui
        for index, value in ipairs(gameloop.layers['ui']) do
            if value.textinput ~= nil then
                value:textinput(text)
            end            
        end
    end

    function gameloop:insert_scene(scene)
        -- Insert graphics
        for index, gfx in ipairs(scene.gfx) do
            table.insert(self.layers['gfx'], 1, gfx)
        end

        -- Insert entities
        for index, entity in ipairs(scene.entities) do
            table.insert(self.layers['entities'], 1, entity)
        end

        -- Insert UI
        for index, UI in ipairs(scene.UI) do
            table.insert(self.layers['ui'], 1, UI)
        end
    end

    function gameloop:remove_scene(id)
        -- Remove graphics
        for index, gfx in ipairs(scene.gfx) do
            if gfx.id == id then
                table.remove(self.layers['gfx'])
            end
        end
        
        -- Remove entities
        for index, entity in ipairs(scene.entities) do
            if gfx.id == id then
                table.remove(self.layers['entities'])
            end
        end
        
        -- Remove UI
        for index, UI in ipairs(scene.UI) do
            if gfx.id == id then
                table.remove(self.layers['ui'])
            end
        end
    end

    function gameloop:insert(id, layer, object)
        object.id = id or "default"
        layer = layer or 'entities'
        table.insert(self.layers[layer], 1, object)
    end

    function gameloop:remove(id, layer)
        for index, object in ipairs(self.layers[layer]) do
            if object.id == id then
                table.remove(self.layers[layer], index)
            end
        end
    end

    return gameloop

end

return GameLoop