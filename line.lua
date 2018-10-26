local Line = require 'draw'
Line.__index = Line

--- Creates an animated line
-- @param lenght the final length of the line
-- @param duration the duration of the animation
-- @param style 'smooth' or rough
-- @param width the width of the line
-- @param direction the direction (in radians) of the line
function Line:newLine(length, duration, style, width, direction, scoped)
  local newln = Line:newDraw(duration, direction, scoped)
  setmetatable(newln, Line)

  newln.style = style

  newln.length = length
  newln.width = width

  return newln
end

function Line:updateProgress()
  return self.length * self.time / self.duration
end

function Line:goal()
  return self.length
end

function Line:draw (x, y, style, width, angle)
  if self.scoped then
    love.graphics.push('all')
  end

  if angle or self.angle then
    Line.rotate(x, y, angle or self.angle)
  end

  if width or self.width then
    love.graphics.setLineWidth(width or self.width)
  end

  if style or self.style then
    love.graphics.setLineStyle(style or self.style)
  end

  love.graphics.line(x, y, x + self.progress, y)

  if self.scoped then
    love.graphics.pop()
  end
end

return Line
