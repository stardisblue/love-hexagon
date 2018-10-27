Class = require 'hump.class'
Base = require 'render.base'

local Line = Class{__includes = Base}
--- Creates an animated line
-- @param lenght the final length of the line
-- @param duration the duration of the animation
-- @param style 'smooth' or rough
-- @param width the width of the line
-- @param direction the direction (in radians) of the line
function Line:init(length, duration)
  Base.init(self, duration, angle, scoped)
  self.length = length
end

function Line:updateProgress()
  return self.length * self.time / self.duration
end

function Line:goal()
  return self.length
end

function Line:draw(x, y)
  love.graphics.line(x, y, x + self.progress, y)
end

return Line
