Class = require 'hump.class'
Base = require 'render.base'
Utils = require 'render.utils'

local Rectangle = Class{__includes = Base}

function Rectangle:init(width, height, duration)
  Base.init(self, duration)
  self.width = width
  self.height = height

  self.perimeter = 2 * width + 2 * height
  self.progress = {0, 0}

  self.draw = function (self, x, y)
    love.graphics.line(Utils.map(function (v, i)
          if i%2 == 0 then return v + x
            else return v + y
          end
        end, self.progress))
  end
end

function Rectangle:updateProgress()
  local actual = self.perimeter * self.time / self.duration
  if actual < self.width then
    if #self.progress == 2 then
      table.insert(self.progress, actual)
      table.insert(self.progress, 0)
    else
      self.progress[3] = actual
    end
    return self.progress
  elseif  actual < self.width + self.height then
    if #self.progress == 4 then
      self.progress[3] = self.width
      table.insert(self.progress, self.width)
      table.insert(self.progress, actual - self.width)
    else
      self.progress[6] = actual - self.width
    end

    return self.progress
  elseif actual < 2 * self.width + self.height then
    if #self.progress == 6 then
      self.progress[6] = self.height
      table.insert(self.progress, 2*self.width - actual + self.height)
      table.insert(self.progress, self.height)
    else
      self.progress[7] = 2*self.width - actual + self.height
    end

    return self.progress
  elseif actual < self.perimeter then
    if #self.progress == 8 then
      self.progress[7] = 0
      table.insert(self.progress, 0)
      table.insert(self.progress, self.perimeter - actual)
    else
      self.progress[10] = self.perimeter - actual
    end

    return self.progress
  else
    self.progress[10] = 0
  end

  return self.progress
end

function Rectangle:goal()
  self.draw = function (self, x, y)
    love.graphics.rectangle('line', x, y, self.width, self.height)
  end
end

return Rectangle
