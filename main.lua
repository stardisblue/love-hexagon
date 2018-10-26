local Draw = require 'draw'
local Line = require 'line'
local Rectangle = require 'rectangle'

local secondLine  = Line:newLine(100, 3, 'smooth', 1, nil, true)
local minutesLine = Line:newLine(80, nil, 'rough', 3, nil, true)
local hourLine = Line:newLine(50, nil, 'rough', 5, nil, true)
local rect = Rectangle:newRectangle(10, 20, 0 ,20 )

local rotation = 0

function love.load()

end

function love.keyreleased(key, scancode)
  if key == 'escape' then
    love.event.quit(0)
  end
end

function love.update(dt)
  secondLine:update(dt)
  minutesLine:update(dt)
  hourLine:update(dt)

  print(rect.perimeter)

  rect:update(dt)
  rotation = (rotation +  dt) %  86400-- secondes
end

-- une seconde parcours 6deg en une seconde
-- une minute parcours 6deg en 60 secondes
-- une heure parcours 15deg en 3600 secondes

function love.draw()
  love.graphics.print('fps:' .. love.timer.getFPS(), 10, 10)

  Draw.rotate(100,100, math.rad(-90))
  secondLine:draw(100, 100, nil, nil, math.rad(rotation * 6))
  minutesLine:draw(100, 100, nil, nil, math.rad(rotation / 10))
  hourLine:draw(100, 100, nil, nil, math.rad(rotation / 240))

  rect:draw(300, 300)
  love.graphics.ellipse('line', 100, 100, 100, 100 )
end

