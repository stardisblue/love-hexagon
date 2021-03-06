local Utils = require 'render.utils'
-- local Draw = require 'render.base'
local Line = require 'render.line'
local Rectangle = require 'render.rectangle'


local secondLine  = Line(100, 3)
local minutesLine = Line(80, nil)
local hourLine = Line(50, 5)
local rect = Rectangle(300, 200, 2)

local rotation = 0

function love.load()

end

function love.keyreleased(key)
  if key == 'escape' then
    love.event.quit(0)
  end
end

function love.update(dt)
  secondLine:update(dt)
  minutesLine:update(dt)
  hourLine:update(dt)
  rect:update(dt)

  rotation = (rotation +  dt) %  86400 -- secondes
end

function love.draw()
  love.graphics.print('fps:' .. love.timer.getFPS(), 10, 10)

  Utils.scope(nil, function ()
    Utils.rotate(100, 100, math.rad(-90))

    Utils.scope("all", function()
      Utils.rotate(100, 100, math.rad(rotation * 6))
      love.graphics.setLineWidth(1)
      secondLine:draw(100, 100)
    end)

    Utils.scope("all", function()
      Utils.rotate(100, 100, math.rad(rotation / 10))
      love.graphics.setLineWidth(3)
      secondLine:draw(100, 100)
    end)

    Utils.scope("all", function()
      Utils.rotate(100, 100, math.rad(rotation / 240))
      love.graphics.setLineWidth(5)
      secondLine:draw(100, 100)
    end)
  end)

  rect:draw(20, 300)

  rect:draw(300, 200)

  love.graphics.ellipse('line', 100, 100, 100, 100 )
end
